"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { bookingCreateSchema, bookingUpdateSchema } from "@/lib/validations";
import { getCurrentUser } from "@/lib/auth/roles";

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
      select: { id: true, status: true, name: true },
    });

    if (!restaurant) {
      throw new Error("Restaurante no encontrado");
    }

    if (restaurant.status !== "APPROVED") {
      throw new Error("Este restaurante no está disponible para reservas");
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
          select: { ownerId: true },
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
    });

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
        restaurant: {
          select: { ownerId: true },
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
