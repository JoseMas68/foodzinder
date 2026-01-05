"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";

/**
 * Alternar favorito (añadir si no existe, quitar si existe)
 */
export async function toggleFavorite(restaurantId: string) {
    try {
        const { userId: clerkId } = await auth();
        if (!clerkId) throw new Error("No autorizado");

        const user = await prisma.user.findUnique({
            where: { clerkId },
            select: { id: true },
        });

        if (!user) throw new Error("Usuario no encontrado");

        const existing = await prisma.favorite.findUnique({
            where: {
                userId_restaurantId: {
                    userId: user.id,
                    restaurantId,
                },
            },
        });

        if (existing) {
            await prisma.favorite.delete({
                where: { id: existing.id },
            });
        } else {
            await prisma.favorite.create({
                data: {
                    userId: user.id,
                    restaurantId,
                },
            });
        }

        revalidatePath(`/restaurants`);

        return { success: true, isFavorite: !existing };
    } catch (error: any) {
        console.error("Error toggling favorite:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Verificar si un restaurante es favorito del usuario actual
 */
export async function isFavorite(restaurantId: string) {
    try {
        const { userId: clerkId } = await auth();
        if (!clerkId) return false;

        const user = await prisma.user.findUnique({
            where: { clerkId },
            select: { id: true },
        });

        if (!user) return false;

        const favorite = await prisma.favorite.findUnique({
            where: {
                userId_restaurantId: {
                    userId: user.id,
                    restaurantId,
                },
            },
        });

        return !!favorite;
    } catch (error) {
        return false;
    }
}

/**
 * Obtener todos los favoritos del usuario
 */
export async function getMyFavorites() {
    try {
        const { userId: clerkId } = await auth();
        if (!clerkId) return [];

        const user = await prisma.user.findUnique({
            where: { clerkId },
            select: { id: true },
        });

        if (!user) return [];

        const favorites = await prisma.favorite.findMany({
            where: { userId: user.id },
        });

        return favorites;
    } catch (error) {
        return [];
    }
}
