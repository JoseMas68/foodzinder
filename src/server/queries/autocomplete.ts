"use server";

import { prisma } from "@/lib/prisma";
import { cache } from "react";

interface AutocompleteResult {
  restaurants: Array<{
    id: string;
    name: string;
    slug: string;
  }>;
  dishes: Array<{
    id: string;
    name: string;
    restaurantName: string;
    restaurantSlug: string;
  }>;
  cuisines: Array<{
    id: string;
    name: string;
  }>;
}

/**
 * Get autocomplete suggestions based on query
 * Returns restaurants, dishes, and cuisine types that match
 */
export const getAutocomplete = cache(
  async (query: string): Promise<AutocompleteResult> => {
    try {
      // Return empty if query is too short
      if (!query || query.length < 2) {
        return {
          restaurants: [],
          dishes: [],
          cuisines: [],
        };
      }

      const [restaurants, dishes, cuisines] = await Promise.all([
        // Get top 5 restaurants that match
        prisma.restaurant.findMany({
          where: {
            status: "APPROVED",
            name: { contains: query, mode: "insensitive" },
          },
          select: {
            id: true,
            name: true,
            slug: true,
          },
          take: 5,
        }),

        // Get top 5 dishes that match
        prisma.dish.findMany({
          where: {
            name: { contains: query, mode: "insensitive" },
            menu: {
              restaurants: {
                some: {
                  restaurant: { status: "APPROVED" },
                },
              },
            },
          },
          select: {
            id: true,
            name: true,
            menu: {
              select: {
                restaurants: {
                  select: {
                    restaurant: {
                      select: {
                        name: true,
                        slug: true,
                      },
                    },
                  },
                },
              },
            },
          },
          take: 5,
        }),

        // Get top 5 cuisine types that match
        prisma.taxonomy.findMany({
          where: {
            type: "CUISINE_TYPE",
            name: { contains: query, mode: "insensitive" },
          },
          select: {
            id: true,
            name: true,
          },
          take: 5,
        }),
      ]);

      return {
        restaurants: restaurants.map((r) => ({
          id: r.id,
          name: r.name,
          slug: r.slug,
        })),
        dishes: dishes
          .filter((d) => d.menu.restaurants.length > 0)
          .map((d) => ({
            id: d.id,
            name: d.name,
            restaurantName: d.menu.restaurants[0].restaurant.name,
            restaurantSlug: d.menu.restaurants[0].restaurant.slug,
          })),
        cuisines: cuisines.map((c) => ({
          id: c.id,
          name: c.name,
        })),
      };
    } catch (error) {
      console.error("Error fetching autocomplete suggestions:", error);
      return {
        restaurants: [],
        dishes: [],
        cuisines: [],
      };
    }
  }
);
