"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";

/**
 * Alternar favorito (añadir si no existe, quitar si existe)
 */
export async function toggleFavorite(restaurantId: string) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        const existing = await prisma.favorite.findUnique({
            where: {
                userId_restaurantId: {
                    userId,
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
                    userId,
                    restaurantId,
                },
            });
        }

        revalidatePath(`/restaurants`);
        // Revalidar el slug si lo tenemos... pero revalidamos la lista por ahora

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
        const { userId } = await auth();
        if (!userId) return false;

        const favorite = await prisma.favorite.findUnique({
            where: {
                userId_restaurantId: {
                    userId,
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
        const { userId } = await auth();
        if (!userId) return [];

        const favorites = await prisma.favorite.findMany({
            where: { userId },
        });

        return favorites;
    } catch (error) {
        return [];
    }
}
