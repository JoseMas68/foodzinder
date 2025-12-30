"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { isAdmin } from "./auth";
import { syncRestaurantToMeilisearch } from "@/lib/search-sync";

/**
 * Aprobar un restaurante
 */
export async function approveRestaurant(id: string) {
    try {
        if (!(await isAdmin())) {
            throw new Error("No autorizado");
        }

        const restaurant = await prisma.restaurant.update({
            where: { id },
            data: { status: "APPROVED" },
        });

        await syncRestaurantToMeilisearch(id);

        revalidatePath("/dashboard/admin/approvals");
        revalidatePath("/");
        revalidatePath(`/restaurants/${restaurant.slug}`);

        return { success: true };
    } catch (error: any) {
        console.error("Error approving restaurant:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Rechazar un restaurante
 */
export async function rejectRestaurant(id: string) {
    try {
        if (!(await isAdmin())) {
            throw new Error("No autorizado");
        }

        await prisma.restaurant.update({
            where: { id },
            data: { status: "REJECTED" },
        });

        await syncRestaurantToMeilisearch(id);

        revalidatePath("/dashboard/admin/approvals");
        revalidatePath("/");

        return { success: true };
    } catch (error: any) {
        console.error("Error rejecting restaurant:", error);
        return { success: false, error: error.message };
    }
}

/**
 * Cambiar el estado de un restaurante arbitrariamente
 */
export async function updateRestaurantStatus(id: string, status: any) {
    try {
        if (!(await isAdmin())) {
            throw new Error("No autorizado");
        }

        const restaurant = await prisma.restaurant.update({
            where: { id },
            data: { status },
        });

        await syncRestaurantToMeilisearch(id);

        revalidatePath("/dashboard/admin");
        revalidatePath("/");
        revalidatePath(`/restaurants/${restaurant.slug}`);

        return { success: true };
    } catch (error: any) {
        console.error("Error updating restaurant status:", error);
        return { success: false, error: error.message };
    }
}

