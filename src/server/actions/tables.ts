"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { getCurrentUser } from "@/lib/auth/roles";

/**
 * Crear una nueva mesa
 */
export async function createTable(formData: {
  restaurantId: string;
  tableNumber: string;
  capacity: number;
  minCapacity?: number;
  area?: string;
  shape: "SQUARE" | "RECTANGLE" | "ROUND" | "BOOTH";
}) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar que el usuario es owner del restaurante o admin
    const restaurant = await prisma.restaurant.findUnique({
      where: { id: formData.restaurantId },
      select: { ownerId: true },
    });

    if (!restaurant) {
      throw new Error("Restaurante no encontrado");
    }

    if (restaurant.ownerId !== user.id && user.role !== "ADMIN") {
      throw new Error("No tienes permiso para agregar mesas a este restaurante");
    }

    // Verificar que no exista una mesa con el mismo número
    const existingTable = await prisma.table.findUnique({
      where: {
        restaurantId_tableNumber: {
          restaurantId: formData.restaurantId,
          tableNumber: formData.tableNumber,
        },
      },
    });

    if (existingTable) {
      throw new Error(`Ya existe una mesa con el número "${formData.tableNumber}"`);
    }

    // Crear la mesa
    const table = await prisma.table.create({
      data: {
        restaurantId: formData.restaurantId,
        tableNumber: formData.tableNumber,
        capacity: formData.capacity,
        minCapacity: formData.minCapacity || 1,
        area: formData.area,
        shape: formData.shape,
      },
    });

    revalidatePath(`/dashboard/restaurants/${formData.restaurantId}/tables`);
    revalidatePath(`/dashboard/restaurants/${formData.restaurantId}`);

    return { success: true, data: table };
  } catch (error: any) {
    console.error("Error creating table:", error);
    return { success: false, error: error.message || "Error al crear la mesa" };
  }
}

/**
 * Actualizar una mesa existente
 */
export async function updateTable(
  tableId: string,
  formData: {
    tableNumber?: string;
    capacity?: number;
    minCapacity?: number;
    area?: string;
    shape?: "SQUARE" | "RECTANGLE" | "ROUND" | "BOOTH";
    isActive?: boolean;
  }
) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar que la mesa existe y el usuario tiene permisos
    const existingTable = await prisma.table.findUnique({
      where: { id: tableId },
      include: {
        restaurant: {
          select: { ownerId: true },
        },
      },
    });

    if (!existingTable) {
      throw new Error("Mesa no encontrada");
    }

    if (existingTable.restaurant.ownerId !== user.id && user.role !== "ADMIN") {
      throw new Error("No tienes permiso para modificar esta mesa");
    }

    // Si se está cambiando el número de mesa, verificar que no exista otra con ese número
    if (formData.tableNumber && formData.tableNumber !== existingTable.tableNumber) {
      const duplicate = await prisma.table.findUnique({
        where: {
          restaurantId_tableNumber: {
            restaurantId: existingTable.restaurantId,
            tableNumber: formData.tableNumber,
          },
        },
      });

      if (duplicate) {
        throw new Error(`Ya existe una mesa con el número "${formData.tableNumber}"`);
      }
    }

    // Actualizar la mesa
    const table = await prisma.table.update({
      where: { id: tableId },
      data: {
        ...(formData.tableNumber && { tableNumber: formData.tableNumber }),
        ...(formData.capacity && { capacity: formData.capacity }),
        ...(formData.minCapacity !== undefined && { minCapacity: formData.minCapacity }),
        ...(formData.area !== undefined && { area: formData.area }),
        ...(formData.shape && { shape: formData.shape }),
        ...(formData.isActive !== undefined && { isActive: formData.isActive }),
      },
    });

    revalidatePath(`/dashboard/restaurants/${existingTable.restaurantId}/tables`);
    revalidatePath(`/dashboard/restaurants/${existingTable.restaurantId}`);

    return { success: true, data: table };
  } catch (error: any) {
    console.error("Error updating table:", error);
    return { success: false, error: error.message || "Error al actualizar la mesa" };
  }
}

/**
 * Eliminar una mesa
 */
export async function deleteTable(tableId: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar que la mesa existe y el usuario tiene permisos
    const existingTable = await prisma.table.findUnique({
      where: { id: tableId },
      include: {
        restaurant: {
          select: { ownerId: true },
        },
        bookings: {
          where: {
            status: {
              in: ["PENDING", "CONFIRMED"],
            },
          },
          select: { id: true },
        },
      },
    });

    if (!existingTable) {
      throw new Error("Mesa no encontrada");
    }

    if (existingTable.restaurant.ownerId !== user.id && user.role !== "ADMIN") {
      throw new Error("No tienes permiso para eliminar esta mesa");
    }

    // Verificar que no tenga reservas activas
    if (existingTable.bookings.length > 0) {
      throw new Error(
        "No puedes eliminar una mesa con reservas activas. Cancela o completa las reservas primero."
      );
    }

    // Eliminar la mesa
    await prisma.table.delete({
      where: { id: tableId },
    });

    revalidatePath(`/dashboard/restaurants/${existingTable.restaurantId}/tables`);
    revalidatePath(`/dashboard/restaurants/${existingTable.restaurantId}`);

    return { success: true };
  } catch (error: any) {
    console.error("Error deleting table:", error);
    return { success: false, error: error.message || "Error al eliminar la mesa" };
  }
}

/**
 * Obtener todas las mesas de un restaurante
 */
export async function getRestaurantTables(restaurantId: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar que el usuario es owner del restaurante o admin
    const restaurant = await prisma.restaurant.findUnique({
      where: { id: restaurantId },
      select: { ownerId: true },
    });

    if (!restaurant) {
      throw new Error("Restaurante no encontrado");
    }

    if (restaurant.ownerId !== user.id && user.role !== "ADMIN") {
      throw new Error("No tienes permiso para ver las mesas de este restaurante");
    }

    const tables = await prisma.table.findMany({
      where: { restaurantId },
      orderBy: [{ area: "asc" }, { tableNumber: "asc" }],
      include: {
        _count: {
          select: {
            bookings: {
              where: {
                status: {
                  in: ["PENDING", "CONFIRMED"],
                },
              },
            },
          },
        },
      },
    });

    return { success: true, data: tables };
  } catch (error: any) {
    console.error("Error fetching tables:", error);
    return { success: false, error: error.message || "Error al obtener las mesas" };
  }
}

/**
 * Activar/Desactivar una mesa
 */
export async function toggleTableStatus(tableId: string, isActive: boolean) {
  return updateTable(tableId, { isActive });
}
