"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { menuCreateSchema, menuUpdateSchema, dishCreateSchema, dishUpdateSchema } from "@/lib/validations";

/**
 * Crear un nuevo menú
 */
export async function createMenu(formData: any) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        const validated = menuCreateSchema.parse(formData);

        const menu = await prisma.menu.create({
            data: {
                ...validated,
                ownerId: userId,
            },
        });

        revalidatePath("/dashboard/menus");
        return { success: true, data: menu };
    } catch (error: any) {
        console.error("Error creating menu:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Actualizar menú
 */
export async function updateMenu(id: string, formData: any) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        const existing = await prisma.menu.findUnique({ where: { id } });
        if (!existing || existing.ownerId !== userId) throw new Error("No autorizado");

        const validated = menuUpdateSchema.parse(formData);

        const menu = await prisma.menu.update({
            where: { id },
            data: validated,
        });

        revalidatePath("/dashboard/menus");
        return { success: true, data: menu };
    } catch (error: any) {
        console.error("Error updating menu:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Asignar menú a restaurante
 */
export async function assignMenuToRestaurant(menuId: string, restaurantId: string) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        // Validar propiedad del menú
        const menu = await prisma.menu.findUnique({ where: { id: menuId } });
        if (!menu || menu.ownerId !== userId) throw new Error("No tienes permiso sobre este menú");

        // Validar propiedad del restaurante
        const restaurant = await prisma.restaurant.findUnique({ where: { id: restaurantId } });
        if (!restaurant || restaurant.ownerId !== userId) throw new Error("No tienes permiso sobre este restaurante");

        await prisma.restaurantMenu.create({
            data: {
                menuId,
                restaurantId,
            },
        });

        revalidatePath(`/dashboard/restaurants/${restaurantId}`);
        return { success: true };
    } catch (error: any) {
        console.error("Error assigning menu:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Crear un plato en un menú
 */
export async function createDish(menuId: string, formData: any) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        // Validar propiedad del menú
        const menu = await prisma.menu.findUnique({ where: { id: menuId } });
        if (!menu || menu.ownerId !== userId) throw new Error("No tienes permiso para añadir platos a este menú");

        const validated = dishCreateSchema.parse(formData);

        const dish = await prisma.dish.create({
            data: {
                ...validated,
                menuId,
            },
        });

        revalidatePath("/dashboard/menus");
        return { success: true, data: dish };
    } catch (error: any) {
        console.error("Error creating dish:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Actualizar plato
 */
export async function updateDish(id: string, formData: any) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        // Validar propiedad a través del menú
        const existingDish = await prisma.dish.findUnique({
            where: { id },
            include: { menu: true }
        });
        if (!existingDish || existingDish.menu.ownerId !== userId) {
            throw new Error("No tienes permiso para editar este plato");
        }

        const validated = dishUpdateSchema.parse(formData);

        const dish = await prisma.dish.update({
            where: { id },
            data: validated,
        });

        revalidatePath("/dashboard/menus");
        return { success: true, data: dish };
    } catch (error: any) {
        console.error("Error updating dish:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Eliminar plato
 */
export async function deleteDish(id: string) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        // Validar propiedad a través del menú
        const existingDish = await prisma.dish.findUnique({
            where: { id },
            include: { menu: true }
        });
        if (!existingDish || existingDish.menu.ownerId !== userId) {
            throw new Error("No tienes permiso");
        }

        await prisma.dish.delete({
            where: { id },
        });

        revalidatePath("/dashboard/menus");
        return { success: true };
    } catch (error: any) {
        console.error("Error deleting dish:", error);
        return { success: false, error: error.message };
    }
}
