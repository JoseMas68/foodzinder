"use server";

import { prisma } from "@/lib/prisma";
import { cache } from "react";
import type { Restaurant, PaginatedResponse } from "@/types";

/**
 * Obtener todos los restaurantes aprobados (para usuarios)
 * Cached para mejor rendimiento
 */
export const getApprovedRestaurants = cache(
  async (
    page: number = 1,
    limit: number = 12
  ): Promise<PaginatedResponse<Restaurant>> => {
    try {
      const skip = (page - 1) * limit;

      const [restaurants, total] = await Promise.all([
        prisma.restaurant.findMany({
          where: { status: "APPROVED" },
          take: limit,
          skip,
          orderBy: { createdAt: "desc" },
        }),
        prisma.restaurant.count({
          where: { status: "APPROVED" },
        }),
      ]);

      const pages = Math.ceil(total / limit);

      return {
        data: restaurants.map((r) => ({
          id: r.id,
          ownerId: r.ownerId,
          name: r.name,
          slug: r.slug,
          description: r.description,
          address: r.address,
          latitude: r.latitude || undefined,
          longitude: r.longitude || undefined,
          status: r.status as any,
          logoUrl: r.logoUrl || undefined,
          coverUrl: r.coverUrl || undefined,
          priceRange: r.priceRange as any,
          createdAt: r.createdAt,
          updatedAt: r.updatedAt,
        })),
        total,
        page,
        limit,
        pages,
      };
    } catch (error) {
      console.error("Error fetching restaurants:", error);
      return {
        data: [],
        total: 0,
        page,
        limit,
        pages: 0,
      };
    }
  }
);

/**
 * Obtener restaurante por slug
 */
export const getRestaurantBySlug = cache(
  async (slug: string): Promise<Restaurant | null> => {
    try {
      const restaurant = await prisma.restaurant.findFirst({
        where: { slug, status: "APPROVED" },
      });

      if (!restaurant) {
        return null;
      }

      return {
        id: restaurant.id,
        ownerId: restaurant.ownerId,
        name: restaurant.name,
        slug: restaurant.slug,
        description: restaurant.description,
        address: restaurant.address,
        latitude: restaurant.latitude || undefined,
        longitude: restaurant.longitude || undefined,
        status: restaurant.status as any,
        logoUrl: restaurant.logoUrl || undefined,
        coverUrl: restaurant.coverUrl || undefined,
        priceRange: restaurant.priceRange as any,
        createdAt: restaurant.createdAt,
        updatedAt: restaurant.updatedAt,
      };
    } catch (error) {
      console.error("Error fetching restaurant by slug:", error);
      return null;
    }
  }
);

/**
 * Obtener restaurantes del propietario actual
 */
export async function getMyRestaurants(
  ownerId: string
): Promise<Restaurant[]> {
  try {
    const restaurants = await prisma.restaurant.findMany({
      where: { ownerId },
      orderBy: { createdAt: "desc" },
    });

    return restaurants.map((r) => ({
      id: r.id,
      ownerId: r.ownerId,
      name: r.name,
      slug: r.slug,
      description: r.description,
      address: r.address,
      latitude: r.latitude || undefined,
      longitude: r.longitude || undefined,
      status: r.status as any,
      logoUrl: r.logoUrl || undefined,
      coverUrl: r.coverUrl || undefined,
      priceRange: r.priceRange as any,
      createdAt: r.createdAt,
      updatedAt: r.updatedAt,
    }));
  } catch (error) {
    console.error("Error fetching user restaurants:", error);
    return [];
  }
}

/**
 * Obtener estadísticas de un restaurante
 */
export async function getRestaurantStats(restaurantId: string) {
  try {
    const [reviewCount, averageRating, totalReviews] = await Promise.all([
      prisma.review.count({
        where: { restaurantId },
      }),
      prisma.review.aggregate({
        where: { restaurantId },
        _avg: { rating: true },
      }),
      prisma.review.findMany({
        where: { restaurantId },
        select: { rating: true },
      }),
    ]);

    const avgRating =
      reviewCount > 0 ? Math.round((averageRating._avg.rating || 0) * 10) / 10 : 0;

    return {
      reviewCount,
      averageRating: avgRating,
      totalReviews: totalReviews.map((r) => r.rating),
    };
  } catch (error) {
    console.error("Error fetching restaurant stats:", error);
    return {
      reviewCount: 0,
      averageRating: 0,
      totalReviews: [],
    };
  }
}
