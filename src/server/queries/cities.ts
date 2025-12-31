"use server";

import { prisma } from "@/lib/prisma";

/**
 * Get unique cities from approved restaurants
 */
export async function getCities(): Promise<string[]> {
  try {
    const restaurants = await prisma.restaurant.findMany({
      where: {
        status: "APPROVED",
      },
      select: {
        address: true,
      },
    });

    // Extract city from address (assuming format: "Street, City")
    // Filter out restaurants without address
    const cities = restaurants
      .filter((r) => r.address)
      .map((r) => {
        const parts = r.address.split(",");
        // Get the last part which should be the city
        return parts[parts.length - 1]?.trim();
      })
      .filter((city): city is string => Boolean(city));

    // Get unique cities and sort alphabetically
    const uniqueCities = Array.from(new Set(cities)).sort();

    return uniqueCities;
  } catch (error) {
    console.error("Error fetching cities:", error);
    return [];
  }
}
