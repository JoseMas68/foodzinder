"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { reviewCreateSchema } from "@/lib/validations";
import { revalidatePath } from "next/cache";

export async function createReview(
  restaurantId: string,
  data: {
    rating: number;
    comment: string;
    photos?: string[];
  }
) {
  try {
    // 1. Verificar autenticación
    const { userId } = await auth();
    if (!userId) {
      return {
        success: false,
        error: "Debes iniciar sesión para dejar una reseña",
      };
    }

    // 2. Validar datos con Zod
    const validated = reviewCreateSchema.safeParse(data);
    if (!validated.success) {
      return {
        success: false,
        error: validated.error.errors[0].message,
      };
    }

    // 3. Verificar que el restaurante existe y está aprobado
    const restaurant = await prisma.restaurant.findFirst({
      where: { id: restaurantId, status: "APPROVED" },
    });
    if (!restaurant) {
      return { success: false, error: "Restaurante no encontrado" };
    }

    // 4. Verificar si ya existe una review de este usuario para este restaurante
    const existingReview = await prisma.review.findUnique({
      where: {
        restaurantId_userId: {
          restaurantId,
          userId,
        },
      },
    });

    if (existingReview) {
      return {
        success: false,
        error: "Ya has dejado una reseña para este restaurante",
      };
    }

    // 5. Crear la review
    const review = await prisma.review.create({
      data: {
        rating: validated.data.rating,
        comment: validated.data.comment,
        photos: validated.data.photos || [],
        restaurantId,
        userId,
      },
      include: {
        user: true,
      },
    });

    // 6. Revalidar la página del restaurante para mostrar la nueva review
    revalidatePath(`/restaurants/${restaurant.slug}`);

    return { success: true, review };
  } catch (error) {
    console.error("Error creating review:", error);
    return { success: false, error: "Error al crear la reseña" };
  }
}

export async function getUserReviewForRestaurant(restaurantId: string) {
  try {
    const { userId } = await auth();
    if (!userId) return null;

    const review = await prisma.review.findUnique({
      where: {
        restaurantId_userId: {
          restaurantId,
          userId,
        },
      },
    });

    return review;
  } catch (error) {
    console.error("Error getting user review:", error);
    return null;
  }
}
