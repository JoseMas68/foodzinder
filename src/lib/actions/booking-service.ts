"use server";

import { revalidatePath } from "next/cache";
import { prisma } from "@/lib/prisma";
import {
  createBookingServiceSchema,
  updateBookingServiceSchema,
  updateTableAvailabilitySchema,
  bookingReminderSchema,
  type CreateBookingService,
  type UpdateBookingService,
  type UpdateTableAvailability,
  type BookingReminder,
} from "@/lib/validations/booking-service";

// ============================================================================
// CRUD de Servicios de Reserva
// ============================================================================

export async function createBookingService(data: CreateBookingService) {
  try {
    const validatedData = createBookingServiceSchema.parse(data);

    const { restaurantId, slots, ...serviceData } = validatedData;

    const service = await prisma.bookingService.create({
      data: {
        ...serviceData,
        restaurantId,
        slots: {
          create: slots.map((slot) => ({
            startTime: slot.startTime,
            endTime: slot.endTime,
            durationMinutes: slot.durationMinutes,
            maxCapacity: slot.maxCapacity,
          })),
        },
      },
      include: {
        slots: true,
      },
    });

    revalidatePath(`/dashboard/restaurants/${restaurantId}`);
    return { success: true, data: service };
  } catch (error) {
    console.error("Error creating booking service:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

export async function updateBookingService(data: UpdateBookingService & { id: string }) {
  try {
    const validatedData = updateBookingServiceSchema.parse(data);
    const { id, slots, ...serviceData } = validatedData;

    // Get the service to know the restaurantId
    const existingService = await prisma.bookingService.findUnique({
      where: { id },
      select: { restaurantId: true },
    });

    if (!existingService) {
      return { success: false, error: "Servicio no encontrado" };
    }

    // Update service and replace slots
    const service = await prisma.bookingService.update({
      where: { id },
      data: {
        ...serviceData,
        slots: slots
          ? {
              deleteMany: {}, // Delete existing slots
              create: slots.map((slot) => ({
                startTime: slot.startTime,
                endTime: slot.endTime,
                durationMinutes: slot.durationMinutes,
                maxCapacity: slot.maxCapacity,
              })),
            }
          : undefined,
      },
      include: {
        slots: true,
      },
    });

    revalidatePath(`/dashboard/restaurants/${existingService.restaurantId}`);
    return { success: true, data: service };
  } catch (error) {
    console.error("Error updating booking service:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

export async function deleteBookingService(id: string) {
  try {
    const service = await prisma.bookingService.findUnique({
      where: { id },
      select: { restaurantId: true },
    });

    if (!service) {
      return { success: false, error: "Servicio no encontrado" };
    }

    await prisma.bookingService.delete({
      where: { id },
    });

    revalidatePath(`/dashboard/restaurants/${service.restaurantId}`);
    return { success: true };
  } catch (error) {
    console.error("Error deleting booking service:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

export async function getBookingServices(restaurantId: string) {
  try {
    const services = await prisma.bookingService.findMany({
      where: { restaurantId },
      include: {
        slots: {
          orderBy: {
            startTime: "asc",
          },
        },
      },
      orderBy: {
        createdAt: "asc",
      },
    });

    return { success: true, data: services };
  } catch (error) {
    console.error("Error fetching booking services:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

// ============================================================================
// Gestión de Disponibilidad de Mesas
// ============================================================================

export async function updateTableAvailability(data: UpdateTableAvailability) {
  try {
    const validatedData = updateTableAvailabilitySchema.parse(data);
    const { restaurantId, serviceId, date, tableIds, isAvailable } = validatedData;

    // Normalize date to midnight
    const normalizedDate = new Date(date);
    normalizedDate.setHours(0, 0, 0, 0);

    // Update or create availability records for each table
    const operations = tableIds.map((tableId) =>
      prisma.tableAvailability.upsert({
        where: {
          tableId_date_serviceId: {
            tableId,
            date: normalizedDate,
            serviceId,
          },
        },
        update: {
          isAvailable,
        },
        create: {
          tableId,
          serviceId,
          date: normalizedDate,
          isAvailable,
        },
      })
    );

    await prisma.$transaction(operations);

    revalidatePath(`/dashboard/restaurants/${restaurantId}/availability`);
    return { success: true };
  } catch (error) {
    console.error("Error updating table availability:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

export async function getTableAvailability(
  restaurantId: string,
  serviceId: string,
  date: Date
) {
  try {
    // Normalize date to midnight
    const normalizedDate = new Date(date);
    normalizedDate.setHours(0, 0, 0, 0);

    // Get all tables for the restaurant
    const tables = await prisma.table.findMany({
      where: {
        restaurantId,
        isActive: true,
      },
      include: {
        tableAvailabilities: {
          where: {
            serviceId,
            date: normalizedDate,
          },
        },
      },
      orderBy: [{ area: "asc" }, { tableNumber: "asc" }],
    });

    // Map to include availability status (default true if no record)
    const tablesWithAvailability = tables.map((table) => ({
      ...table,
      isAvailableForBooking:
        table.tableAvailabilities.length > 0
          ? table.tableAvailabilities[0].isAvailable
          : true, // Default: available
    }));

    return { success: true, data: tablesWithAvailability };
  } catch (error) {
    console.error("Error fetching table availability:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

// ============================================================================
// Gestión de Recordatorios
// ============================================================================

export async function upsertBookingReminder(data: BookingReminder) {
  try {
    const validatedData = bookingReminderSchema.parse(data);
    const { restaurantId, ...reminderData } = validatedData;

    const reminder = await prisma.bookingReminder.upsert({
      where: { restaurantId },
      update: reminderData,
      create: {
        restaurantId,
        ...reminderData,
      },
    });

    revalidatePath(`/dashboard/restaurants/${restaurantId}`);
    return { success: true, data: reminder };
  } catch (error) {
    console.error("Error upserting booking reminder:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}

export async function getBookingReminder(restaurantId: string) {
  try {
    const reminder = await prisma.bookingReminder.findUnique({
      where: { restaurantId },
    });

    return { success: true, data: reminder };
  } catch (error) {
    console.error("Error fetching booking reminder:", error);
    return {
      success: false,
      error: error instanceof Error ? error.message : "Error desconocido",
    };
  }
}
