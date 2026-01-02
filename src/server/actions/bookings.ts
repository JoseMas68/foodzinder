"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { bookingCreateSchema, bookingUpdateSchema } from "@/lib/validations";
import { getCurrentUser } from "@/lib/auth/roles";
import {
  sendBookingConfirmationEmail,
  sendBookingCancelledEmail,
  sendOwnerNewBookingEmail,
} from "@/lib/email/booking-emails";

/**
 * Crear una nueva reserva
 */
export async function createBooking(formData: any) {
  try {
    // Validar datos
    const validated = bookingCreateSchema.parse(formData);

    // Obtener usuario actual (opcional - puede ser guest)
    const { userId } = await auth();
    const currentUser = userId ? await getCurrentUser() : null;

    // Verificar que el restaurante existe y está APPROVED
    const restaurant = await prisma.restaurant.findUnique({
      where: { id: validated.restaurantId },
      select: {
        id: true,
        status: true,
        name: true,
        address: true,
        ownerId: true,
        owner: {
          select: {
            firstName: true,
            lastName: true,
            email: true,
          },
        },
      },
    });

    if (!restaurant) {
      throw new Error("Restaurante no encontrado");
    }

    if (restaurant.status !== "APPROVED") {
      throw new Error("Este restaurante no está disponible para reservas");
    }

    // VALIDACIÓN CRÍTICA: Verificar que hay capacidad disponible
    const availableTables = await getAvailableTablesForBooking(
      validated.restaurantId,
      new Date(validated.date),
      validated.time,
      validated.partySize
    );

    if (!availableTables.success || !availableTables.data) {
      throw new Error("Error al verificar disponibilidad");
    }

    // Filtrar solo las mesas disponibles
    const tablesAvailable = availableTables.data.filter((t: any) => t.isAvailable);

    if (tablesAvailable.length === 0) {
      throw new Error(
        "Lo sentimos, no hay mesas disponibles para esa fecha, hora y número de personas. Por favor selecciona otro horario."
      );
    }

    // Crear la reserva
    const booking = await prisma.booking.create({
      data: {
        ...validated,
        date: new Date(validated.date),
        userId: currentUser?.id || null,
        status: "PENDING",
      },
    });

    // Enviar email de confirmación al cliente (no esperar por el resultado)
    const customerEmail = currentUser?.email || validated.customerEmail;
    const customerName = currentUser
      ? `${currentUser.firstName} ${currentUser.lastName}`
      : validated.customerName;

    if (customerEmail) {
      sendBookingConfirmationEmail({
        to: customerEmail,
        customerName,
        restaurantName: restaurant.name,
        restaurantAddress: restaurant.address || "",
        date: new Date(validated.date),
        time: validated.time,
        partySize: validated.partySize,
        specialNotes: validated.specialNotes,
      }).catch((error) => {
        console.error("Error sending customer confirmation email:", error);
      });
    }

    // Enviar email al owner del restaurante
    if (restaurant.owner?.email) {
      const ownerName = `${restaurant.owner.firstName} ${restaurant.owner.lastName}`;
      sendOwnerNewBookingEmail({
        to: restaurant.owner.email,
        ownerName,
        restaurantName: restaurant.name,
        customerName,
        customerEmail: customerEmail || "",
        customerPhone: validated.customerPhone,
        date: new Date(validated.date),
        time: validated.time,
        partySize: validated.partySize,
        specialNotes: validated.specialNotes,
        bookingId: booking.id,
      }).catch((error) => {
        console.error("Error sending owner notification email:", error);
      });
    }

    revalidatePath(`/restaurants/${restaurant.id}`);
    revalidatePath("/dashboard/bookings");

    return { success: true, data: booking };
  } catch (error: any) {
    console.error("Error creating booking:", error);
    return { success: false, error: error.message || "Error al crear la reserva" };
  }
}

/**
 * Actualizar una reserva existente
 */
export async function updateBooking(id: string, formData: any) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Validar datos
    const validated = bookingUpdateSchema.parse(formData);

    // Verificar que la reserva existe
    const existingBooking = await prisma.booking.findUnique({
      where: { id },
      include: {
        restaurant: {
          select: {
            ownerId: true,
            name: true,
            address: true,
          },
        },
        user: {
          select: {
            firstName: true,
            lastName: true,
            email: true,
          },
        },
        table: {
          select: {
            tableNumber: true,
            area: true,
          },
        },
      },
    });

    if (!existingBooking) {
      throw new Error("Reserva no encontrada");
    }

    // Solo el usuario que hizo la reserva, el owner del restaurante, o un admin pueden actualizar
    const canUpdate =
      existingBooking.userId === user.id ||
      existingBooking.restaurant.ownerId === user.id ||
      user.role === "ADMIN";

    if (!canUpdate) {
      throw new Error("No tienes permiso para modificar esta reserva");
    }

    // Actualizar la reserva
    const booking = await prisma.booking.update({
      where: { id },
      data: {
        ...(validated.date && { date: new Date(validated.date) }),
        ...(validated.time && { time: validated.time }),
        ...(validated.partySize && { partySize: validated.partySize }),
        ...(validated.specialNotes !== undefined && { specialNotes: validated.specialNotes }),
        ...(validated.status && { status: validated.status }),
      },
      include: {
        table: {
          select: {
            tableNumber: true,
            area: true,
          },
        },
      },
    });

    // Si el estado cambia a CONFIRMED, enviar email de confirmación
    if (validated.status === "CONFIRMED" && existingBooking.status !== "CONFIRMED") {
      const customerEmail = existingBooking.user?.email || existingBooking.customerEmail;
      const customerName = existingBooking.user
        ? `${existingBooking.user.firstName} ${existingBooking.user.lastName}`
        : existingBooking.customerName;

      if (customerEmail) {
        sendBookingConfirmationEmail({
          to: customerEmail,
          customerName,
          restaurantName: existingBooking.restaurant.name,
          restaurantAddress: existingBooking.restaurant.address || "",
          date: booking.date,
          time: booking.time,
          partySize: booking.partySize,
          specialNotes: booking.specialNotes,
          tableNumber: booking.table?.tableNumber?.toString(),
          tableArea: booking.table?.area,
        }).catch((error) => {
          console.error("Error sending confirmation email on status change:", error);
        });
      }
    }

    revalidatePath("/dashboard/bookings");
    revalidatePath("/dashboard/restaurants");

    return { success: true, data: booking };
  } catch (error: any) {
    console.error("Error updating booking:", error);
    return { success: false, error: error.message || "Error al actualizar la reserva" };
  }
}

/**
 * Cancelar una reserva
 */
export async function cancelBooking(id: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar que la reserva existe
    const existingBooking = await prisma.booking.findUnique({
      where: { id },
      select: {
        id: true,
        userId: true,
        status: true,
        date: true,
        time: true,
        partySize: true,
        customerName: true,
        customerEmail: true,
        user: {
          select: {
            firstName: true,
            lastName: true,
            email: true,
          },
        },
        restaurant: {
          select: {
            ownerId: true,
            name: true,
          },
        },
      },
    });

    if (!existingBooking) {
      throw new Error("Reserva no encontrada");
    }

    // Solo el usuario que hizo la reserva, el owner del restaurante, o un admin pueden cancelar
    const canCancel =
      existingBooking.userId === user.id ||
      existingBooking.restaurant.ownerId === user.id ||
      user.role === "ADMIN";

    if (!canCancel) {
      throw new Error("No tienes permiso para cancelar esta reserva");
    }

    // Cancelar la reserva
    const booking = await prisma.booking.update({
      where: { id },
      data: { status: "CANCELLED" },
    });

    // Enviar email de cancelación al cliente
    const customerEmail = existingBooking.user?.email || existingBooking.customerEmail;
    const customerName = existingBooking.user
      ? `${existingBooking.user.firstName} ${existingBooking.user.lastName}`
      : existingBooking.customerName;

    if (customerEmail) {
      sendBookingCancelledEmail({
        to: customerEmail,
        customerName,
        restaurantName: existingBooking.restaurant.name,
        date: existingBooking.date,
        time: existingBooking.time,
        partySize: existingBooking.partySize,
      }).catch((error) => {
        console.error("Error sending cancellation email:", error);
      });
    }

    revalidatePath("/dashboard/bookings");
    revalidatePath("/dashboard/restaurants");

    return { success: true, data: booking };
  } catch (error: any) {
    console.error("Error cancelling booking:", error);
    return { success: false, error: error.message || "Error al cancelar la reserva" };
  }
}

/**
 * Obtener reservas del usuario actual
 */
export async function getMyBookings() {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    const bookings = await prisma.booking.findMany({
      where: { userId: user.id },
      include: {
        restaurant: {
          select: {
            id: true,
            name: true,
            slug: true,
            address: true,
            logoUrl: true,
          },
        },
      },
      orderBy: { date: "desc" },
    });

    return { success: true, data: bookings };
  } catch (error: any) {
    console.error("Error fetching bookings:", error);
    return { success: false, error: error.message };
  }
}

/**
 * Obtener reservas de los restaurantes del owner
 */
export async function getRestaurantBookings(restaurantId?: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Si no es OWNER o ADMIN, no puede ver reservas
    if (user.role !== "OWNER" && user.role !== "ADMIN") {
      throw new Error("No tienes permiso para ver reservas");
    }

    const where: any = {};

    // Si se proporciona restaurantId, filtrar por ese restaurante
    if (restaurantId) {
      // Verificar que el usuario es owner del restaurante o admin
      const restaurant = await prisma.restaurant.findUnique({
        where: { id: restaurantId },
        select: { ownerId: true },
      });

      if (!restaurant) {
        throw new Error("Restaurante no encontrado");
      }

      if (restaurant.ownerId !== user.id && user.role !== "ADMIN") {
        throw new Error("No tienes permiso para ver las reservas de este restaurante");
      }

      where.restaurantId = restaurantId;
    } else {
      // Si no se proporciona restaurantId, mostrar reservas de todos los restaurantes del owner
      if (user.role === "OWNER") {
        const userRestaurants = await prisma.restaurant.findMany({
          where: { ownerId: user.id },
          select: { id: true },
        });

        where.restaurantId = {
          in: userRestaurants.map((r) => r.id),
        };
      }
      // Si es ADMIN, no filtrar por restaurante (ver todas)
    }

    const bookings = await prisma.booking.findMany({
      where,
      include: {
        restaurant: {
          select: {
            id: true,
            name: true,
            slug: true,
            address: true,
            logoUrl: true,
          },
        },
        user: {
          select: {
            id: true,
            firstName: true,
            lastName: true,
            email: true,
          },
        },
      },
      orderBy: { date: "desc" },
    });

    return { success: true, data: bookings };
  } catch (error: any) {
    console.error("Error fetching restaurant bookings:", error);
    return { success: false, error: error.message };
  }
}

/**
 * Verificar disponibilidad de una mesa en una fecha/hora específica
 */
export async function checkTableAvailability(
  tableId: string,
  date: Date,
  time: string,
  excludeBookingId?: string
): Promise<{ available: boolean; conflictingBooking?: any }> {
  try {
    // Duración por defecto de una reserva (90 minutos)
    const BOOKING_DURATION_MINUTES = 90;

    // Convertir la hora de reserva a minutos desde medianoche
    const [hours, minutes] = time.split(":").map(Number);
    const bookingStartMinutes = hours * 60 + minutes;
    const bookingEndMinutes = bookingStartMinutes + BOOKING_DURATION_MINUTES;

    // Buscar reservas confirmadas o pendientes en la misma mesa y fecha
    const conflictingBookings = await prisma.booking.findMany({
      where: {
        tableId,
        date: {
          equals: date,
        },
        status: {
          in: ["PENDING", "CONFIRMED"],
        },
        ...(excludeBookingId && {
          id: {
            not: excludeBookingId,
          },
        }),
      },
      select: {
        id: true,
        time: true,
        partySize: true,
        customerName: true,
      },
    });

    // Verificar si hay conflicto de horarios
    for (const booking of conflictingBookings) {
      const [existingHours, existingMinutes] = booking.time.split(":").map(Number);
      const existingStartMinutes = existingHours * 60 + existingMinutes;
      const existingEndMinutes = existingStartMinutes + BOOKING_DURATION_MINUTES;

      // Hay conflicto si los rangos se solapan
      const hasConflict =
        (bookingStartMinutes >= existingStartMinutes && bookingStartMinutes < existingEndMinutes) ||
        (bookingEndMinutes > existingStartMinutes && bookingEndMinutes <= existingEndMinutes) ||
        (bookingStartMinutes <= existingStartMinutes && bookingEndMinutes >= existingEndMinutes);

      if (hasConflict) {
        return {
          available: false,
          conflictingBooking: booking,
        };
      }
    }

    return { available: true };
  } catch (error) {
    console.error("Error checking table availability:", error);
    return { available: false };
  }
}

/**
 * Obtener mesas disponibles para una reserva específica
 * Considera: capacidad de la mesa, reservas existentes, y disponibilidad manual (TableAvailability)
 */
export async function getAvailableTablesForBooking(
  restaurantId: string,
  date: Date,
  time: string,
  partySize: number,
  excludeBookingId?: string
) {
  try {
    // Normalizar fecha para comparación
    const normalizedDate = new Date(date);
    normalizedDate.setHours(0, 0, 0, 0);

    // Obtener todas las mesas activas del restaurante que pueden acomodar el grupo
    const tables = await prisma.table.findMany({
      where: {
        restaurantId,
        isActive: true,
        minCapacity: { lte: partySize },
        capacity: { gte: partySize },
      },
      select: {
        id: true,
        tableNumber: true,
        capacity: true,
        minCapacity: true,
        area: true,
        shape: true,
      },
      orderBy: [
        { area: "asc" },
        { tableNumber: "asc" },
      ],
    });

    // Obtener configuración de disponibilidad manual para esta fecha
    const tableAvailability = await prisma.tableAvailability.findMany({
      where: {
        date: normalizedDate,
      },
      select: {
        tableId: true,
        isAvailable: true,
      },
    });

    // Crear mapa de disponibilidad manual
    const availabilityMap = new Map(
      tableAvailability.map(ta => [ta.tableId, ta.isAvailable])
    );

    // Verificar disponibilidad de cada mesa
    const availabilityChecks = await Promise.all(
      tables.map(async (table) => {
        // 1. Verificar si el owner marcó esta mesa como NO disponible manualmente
        const manualAvailability = availabilityMap.get(table.id);
        if (manualAvailability === false) {
          return {
            ...table,
            isAvailable: false,
            reason: "Mesa no disponible para este día (configurado por el restaurante)",
          };
        }

        // 2. Verificar conflictos de horario con otras reservas
        const availability = await checkTableAvailability(
          table.id,
          date,
          time,
          excludeBookingId
        );

        return {
          ...table,
          isAvailable: availability.available,
          conflictingBooking: availability.conflictingBooking,
          reason: availability.available ? undefined : "Mesa ya reservada en este horario",
        };
      })
    );

    return { success: true, data: availabilityChecks };
  } catch (error: any) {
    console.error("Error getting available tables:", error);
    return { success: false, error: error.message };
  }
}

/**
 * Asignar automáticamente la mejor mesa disponible para una reserva
 * Criterio: mesa más pequeña que pueda acomodar al grupo
 */
export async function autoAssignTable(bookingId: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Obtener la reserva
    const booking = await prisma.booking.findUnique({
      where: { id: bookingId },
      include: {
        restaurant: {
          select: { id: true, ownerId: true },
        },
      },
    });

    if (!booking) {
      throw new Error("Reserva no encontrada");
    }

    // Solo el owner del restaurante o un admin pueden asignar automáticamente
    const canAssign =
      booking.restaurant.ownerId === user.id || user.role === "ADMIN";

    if (!canAssign) {
      throw new Error("No tienes permiso para asignar mesas");
    }

    // Ya tiene mesa asignada
    if (booking.tableId) {
      return { success: true, data: booking, message: "La reserva ya tiene mesa asignada" };
    }

    // Obtener mesas disponibles
    const availableTables = await getAvailableTablesForBooking(
      booking.restaurantId,
      booking.date,
      booking.time,
      booking.partySize,
      bookingId
    );

    if (!availableTables.success || !availableTables.data) {
      throw new Error("Error al obtener mesas disponibles");
    }

    // Filtrar solo mesas disponibles y ordenar por capacidad (menor a mayor)
    const validTables = availableTables.data
      .filter((t: any) => t.isAvailable)
      .sort((a: any, b: any) => a.capacity - b.capacity);

    if (validTables.length === 0) {
      throw new Error("No hay mesas disponibles para asignar");
    }

    // Asignar la mesa más pequeña que pueda acomodar al grupo
    const bestTable = validTables[0];

    const updatedBooking = await prisma.booking.update({
      where: { id: bookingId },
      data: { tableId: bestTable.id },
      include: {
        table: {
          select: {
            tableNumber: true,
            area: true,
          },
        },
      },
    });

    revalidatePath("/dashboard/restaurant-bookings");

    return {
      success: true,
      data: updatedBooking,
      message: `Mesa ${bestTable.tableNumber} asignada automáticamente`,
    };
  } catch (error: any) {
    console.error("Error auto-assigning table:", error);
    return { success: false, error: error.message || "Error al asignar mesa automáticamente" };
  }
}

/**
 * Asignar una mesa a una reserva
 */
export async function assignTableToBooking(bookingId: string, tableId: string | null) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar que la reserva existe
    const existingBooking = await prisma.booking.findUnique({
      where: { id: bookingId },
      include: {
        restaurant: {
          select: { ownerId: true, id: true },
        },
      },
    });

    if (!existingBooking) {
      throw new Error("Reserva no encontrada");
    }

    // Solo el owner del restaurante o un admin pueden asignar mesas
    const canAssign =
      existingBooking.restaurant.ownerId === user.id ||
      user.role === "ADMIN";

    if (!canAssign) {
      throw new Error("No tienes permiso para asignar mesas");
    }

    // Si se está asignando una mesa, verificar que existe y pertenece al restaurante
    if (tableId) {
      const table = await prisma.table.findUnique({
        where: { id: tableId },
        select: {
          id: true,
          restaurantId: true,
          isActive: true,
          minCapacity: true,
          capacity: true,
        },
      });

      if (!table) {
        throw new Error("Mesa no encontrada");
      }

      if (table.restaurantId !== existingBooking.restaurant.id) {
        throw new Error("La mesa no pertenece a este restaurante");
      }

      if (!table.isActive) {
        throw new Error("Esta mesa no está activa");
      }

      // Verificar que la mesa pueda acomodar al grupo
      if (existingBooking.partySize < table.minCapacity || existingBooking.partySize > table.capacity) {
        throw new Error(`Esta mesa solo puede acomodar de ${table.minCapacity} a ${table.capacity} personas`);
      }

      // VALIDACIÓN CRÍTICA: Verificar disponibilidad de la mesa
      const availability = await checkTableAvailability(
        tableId,
        existingBooking.date,
        existingBooking.time,
        bookingId // Excluir la reserva actual si se está reasignando
      );

      if (!availability.available) {
        throw new Error(
          `Esta mesa ya está reservada a las ${existingBooking.time}. Hay conflicto con otra reserva.`
        );
      }
    }

    // Actualizar la reserva
    const booking = await prisma.booking.update({
      where: { id: bookingId },
      data: { tableId },
    });

    revalidatePath("/dashboard/restaurant-bookings");

    return { success: true, data: booking };
  } catch (error: any) {
    console.error("Error assigning table to booking:", error);
    return { success: false, error: error.message || "Error al asignar la mesa" };
  }
}
