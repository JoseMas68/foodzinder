"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { isAdmin, getCurrentUser } from "./auth";
import { generateSlug } from "@/lib/utils";
import { syncRestaurantToMeilisearch } from "@/lib/search-sync";

/**
 * Crear una nueva taxonomía (Categoría, Tipo de Cocina, etc.)
 */
export async function createTaxonomy(data: { name: string; type: any }) {
    try {
        if (!(await isAdmin())) {
            throw new Error("No autorizado");
        }

        const { name, type } = data;
        const slug = generateSlug(name);

        const taxonomy = await prisma.taxonomy.create({
            data: {
                name,
                type,
                slug,
            },
        });

        revalidatePath("/dashboard/admin/taxonomies");
        revalidatePath("/");

        return { success: true, data: taxonomy };
    } catch (error: any) {
        console.error("Error creating taxonomy:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Asignar taxonomías a un restaurante
 */
export async function setRestaurantTaxonomies(restaurantId: string, taxonomyIds: string[]) {
    try {
        const { userId } = await auth();
        if (!userId) throw new Error("No autorizado");

        // Verificar propiedad o admin
        const restaurant = await prisma.restaurant.findUnique({ where: { id: restaurantId } });
        if (!restaurant) throw new Error("Restaurante no encontrado");

        const user = await getCurrentUser();
        if (restaurant.ownerId !== userId && user?.role !== "ADMIN") {
            throw new Error("No tienes permiso");
        }

        // Primero borramos las actuales
        await prisma.restaurantTaxonomy.deleteMany({
            where: { restaurantId },
        });

        // Luego insertamos las nuevas
        if (taxonomyIds.length > 0) {
            await prisma.restaurantTaxonomy.createMany({
                data: taxonomyIds.map((taxonomyId) => ({
                    restaurantId,
                    taxonomyId,
                })),
            });
        }

        await syncRestaurantToMeilisearch(restaurantId);

        revalidatePath(`/dashboard/restaurants/${restaurantId}`);
        revalidatePath(`/restaurants`); // Para que se actualicen los filtros

        return { success: true };
    } catch (error: any) {
        console.error("Error setting restaurant taxonomies:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Eliminar una taxonomía
 */
export async function deleteTaxonomy(id: string) {
    try {
        if (!(await isAdmin())) {
            throw new Error("No autorizado");
        }

        await prisma.taxonomy.delete({
            where: { id },
        });

        revalidatePath("/dashboard/admin/taxonomies");
        revalidatePath("/");

        return { success: true };
    } catch (error: any) {
        console.error("Error deleting taxonomy:", error);
        return { success: false, error: error.message };
    }
}
