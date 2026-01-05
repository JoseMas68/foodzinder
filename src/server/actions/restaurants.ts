"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { restaurantCreateSchema, restaurantUpdateSchema } from "@/lib/validations";
import { generateSlug } from "@/lib/utils";
import { getCurrentUser } from "@/lib/auth/roles";
import { syncRestaurantToMeilisearch } from "@/lib/search-sync";

/**
 * Crear un nuevo restaurante
 */
export async function createRestaurant(formData: any) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Validar datos
    const validated = restaurantCreateSchema.parse(formData);

    // Generar slug base
    let slug = generateSlug(validated.name);

    // Verificar si el slug existe y generar uno único si es necesario
    const existing = await prisma.restaurant.findUnique({ where: { slug } });
    if (existing) {
      slug = `${slug}-${Math.random().toString(36).substring(2, 7)}`;
    }

    // Separar datos de relaciones
    const { cuisineTypeIds, featureIds, dietaryIds, ambianceIds, openingHours, ...restaurantData } = validated;

    // Combinar todas las taxonomías
    const allTaxonomyIds = [
      ...(cuisineTypeIds || []),
      ...(featureIds || []),
      ...(dietaryIds || []),
      ...(ambianceIds || []),
    ];

    const restaurant = await prisma.restaurant.create({
      data: {
        ...restaurantData,
        slug,
        ownerId: user.id,
        status: "PENDING", // Siempre empieza en pendiente
        // Crear horarios de apertura si se proporcionaron
        ...(openingHours && openingHours.length > 0 && {
          openingHours: {
            create: openingHours,
          },
        }),
        // Conectar taxonomías si se proporcionaron
        ...(allTaxonomyIds.length > 0 && {
          taxonomies: {
            create: allTaxonomyIds.map(taxonomyId => ({
              taxonomyId,
            })),
          },
        }),
      },
    });

    revalidatePath("/dashboard/restaurants");
    revalidatePath("/");

    return { success: true, data: restaurant };
  } catch (error: any) {
    console.error("Error creating restaurant:", error);
    return { success: false, error: error.message || "Error al crear el restaurante" };
  }
}

/**
 * Actualizar un restaurante existente
 */
export async function updateRestaurant(id: string, formData: any) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    // Verificar propiedad
    const existingRestaurant = await prisma.restaurant.findUnique({
      where: { id },
    });

    if (!existingRestaurant) {
      throw new Error("Restaurante no encontrado");
    }

    // Owners solo pueden editar sus restaurantes, Admins pueden editar cualquiera
    if (user.role !== 'ADMIN' && existingRestaurant.ownerId !== user.id) {
      throw new Error("No tienes permiso para editar este restaurante");
    }

    // Validar datos
    const validated = restaurantUpdateSchema.parse(formData);

    // Separar datos de relaciones
    const { cuisineTypeIds, featureIds, dietaryIds, ambianceIds, openingHours, ...restaurantData } = validated;

    // Actualizar restaurante y sus relaciones
    const restaurant = await prisma.restaurant.update({
      where: { id },
      data: {
        ...restaurantData,
      },
    });

    // Actualizar horarios de apertura si se proporcionaron
    if (openingHours && openingHours.length > 0) {
      // Eliminar horarios existentes
      await prisma.openingHour.deleteMany({
        where: { restaurantId: id },
      });
      // Crear nuevos horarios
      await prisma.openingHour.createMany({
        data: openingHours.map(h => ({
          ...h,
          restaurantId: id,
        })),
      });
    }

    // Actualizar taxonomías si se proporcionaron
    if (cuisineTypeIds !== undefined || featureIds !== undefined || dietaryIds !== undefined || ambianceIds !== undefined) {
      // Combinar todas las taxonomías
      const allTaxonomyIds = [
        ...(cuisineTypeIds || []),
        ...(featureIds || []),
        ...(dietaryIds || []),
        ...(ambianceIds || []),
      ];

      // Eliminar taxonomías existentes
      await prisma.restaurantTaxonomy.deleteMany({
        where: { restaurantId: id },
      });
      // Crear nuevas taxonomías
      if (allTaxonomyIds.length > 0) {
        await prisma.restaurantTaxonomy.createMany({
          data: allTaxonomyIds.map(taxonomyId => ({
            restaurantId: id,
            taxonomyId,
          })),
        });
      }
    }

    await syncRestaurantToMeilisearch(id);

    revalidatePath(`/dashboard/restaurants/${id}`);
    revalidatePath(`/restaurants/${restaurant.slug}`);
    revalidatePath("/");

    return { success: true, data: restaurant };
  } catch (error: any) {
    console.error("Error updating restaurant:", error);
    return { success: false, error: error.message || "Error al actualizar el restaurante" };
  }
}

/**
 * Archivar un restaurante (Soft Delete)
 */
export async function archiveRestaurant(id: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    const existing = await prisma.restaurant.findUnique({ where: { id } });
    if (!existing) {
      throw new Error("Restaurante no encontrado");
    }

    // Owners solo pueden archivar sus restaurantes, Admins pueden archivar cualquiera
    if (user.role !== 'ADMIN' && existing.ownerId !== user.id) {
      throw new Error("No tienes permiso");
    }

    await prisma.restaurant.update({
      where: { id },
      data: { status: "ARCHIVED" },
    });

    await syncRestaurantToMeilisearch(id);

    revalidatePath("/dashboard/restaurants");
    revalidatePath("/");

    return { success: true };
  } catch (error: any) {
    console.error("Error archiving restaurant:", error);
    return { success: false, error: error.message };
  }
}

/**
 * Eliminar permanentemente un restaurante (Solo Owner o Admin)
 */
export async function deleteRestaurant(id: string) {
  try {
    const user = await getCurrentUser();
    if (!user) throw new Error("No autorizado");

    const existing = await prisma.restaurant.findUnique({ where: { id } });
    if (!existing) throw new Error("No encontrado");

    // Solo el dueño o un admin pueden borrar permanentemente
    if (existing.ownerId !== user.id && user.role !== "ADMIN") {
      throw new Error("No tienes permiso");
    }

    await prisma.restaurant.delete({
      where: { id },
    });

    await syncRestaurantToMeilisearch(id);

    revalidatePath("/dashboard/restaurants");
    revalidatePath("/");

    return { success: true };
  } catch (error: any) {
    console.error("Error deleting restaurant:", error);
    return { success: false, error: error.message };
  }
}
