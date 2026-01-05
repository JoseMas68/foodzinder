import { prisma } from "@/lib/prisma";
import { getManyRestaurantStats } from "@/server/queries/restaurants";
import { RestaurantCarousel } from "./restaurant-carousel";
import type { Prisma } from "@prisma/client";

interface CarouselSectionProps {
  title: string | null;
  subtitle: string | null;
  filter: string;
  limit: number;
  isAuthenticated: boolean;
  favoriteIds: Set<string>;
}

export async function CarouselSection({
  title,
  subtitle,
  filter,
  limit,
  isAuthenticated,
  favoriteIds,
}: CarouselSectionProps) {
  // Build query based on filter
  let where: Prisma.RestaurantWhereInput = { status: "APPROVED" };
  let orderBy: Prisma.RestaurantOrderByWithRelationInput[] = [];

  // Apply filters
  switch (filter) {
    case "rating":
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "newest":
      orderBy = [{ createdAt: "desc" }];
      break;

    case "popular":
      orderBy = [{ favorites: { _count: "desc" } }];
      break;

    case "random":
      // For random, we'll just order by ID and take a different offset each time
      orderBy = [{ id: "asc" }];
      break;

    // Feature filters
    case "garden":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "RESTAURANT_FEATURE",
            slug: { in: ["jardin", "garden", "outdoor-garden"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "terrace":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "RESTAURANT_FEATURE",
            slug: { in: ["terraza", "terrace", "outdoor-terrace"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "events":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "RESTAURANT_FEATURE",
            slug: { in: ["eventos", "events", "private-events"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "parking":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "RESTAURANT_FEATURE",
            slug: { in: ["parking", "aparcamiento"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "outdoor":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "RESTAURANT_FEATURE",
            slug: { in: ["outdoor", "exterior", "outdoor-seating"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    // Ambiance filters
    case "romantic":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "AMBIANCE",
            slug: { in: ["romantico", "romantic", "intimate"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "family":
      where.taxonomies = {
        some: {
          taxonomy: {
            type: "AMBIANCE",
            slug: { in: ["familiar", "family", "family-friendly"] },
          },
        },
      };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    // Price range filters
    case "luxury":
      where.priceRange = "LUXURY";
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "cheap":
      where.priceRange = "CHEAP";
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    // City filters
    case "madrid":
      where.address = { contains: "Madrid", mode: "insensitive" };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "barcelona":
      where.address = { contains: "Barcelona", mode: "insensitive" };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "valencia":
      where.address = { contains: "Valencia", mode: "insensitive" };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    case "sevilla":
      where.address = { contains: "Sevilla", mode: "insensitive" };
      orderBy = [{ reviews: { _count: "desc" } }];
      break;

    default:
      orderBy = [{ reviews: { _count: "desc" } }];
  }

  // Fetch restaurants
  const restaurants = await prisma.restaurant.findMany({
    where,
    orderBy,
    take: limit,
    select: {
      id: true,
      name: true,
      slug: true,
      description: true,
      address: true,
      logoUrl: true,
      coverUrl: true,
      priceRange: true,
      latitude: true,
      longitude: true,
    },
  });

  console.log(`[CarouselSection] Filter: ${filter}, Found ${restaurants.length} restaurants`);

  // If no restaurants found, return null (don't show empty carousel)
  if (restaurants.length === 0) {
    console.log(`[CarouselSection] No restaurants found for filter: ${filter}`);
    return null;
  }

  // Fetch stats for all restaurants
  const statsMap = await getManyRestaurantStats(restaurants.map((r) => r.id));

  // Map restaurants with stats and favorites
  const restaurantsWithStats = restaurants.map(({ logoUrl, coverUrl, ...rest }) => ({
    ...rest,
    logoUrl: logoUrl ?? undefined,
    coverUrl: coverUrl ?? undefined,
    stats: statsMap[rest.id],
    isFavorite: favoriteIds.has(rest.id),
  }));

  return (
    <section className="container mx-auto px-4 py-8">
      <RestaurantCarousel
        title={title || "Restaurantes"}
        subtitle={subtitle}
        restaurants={restaurantsWithStats}
        isAuthenticated={isAuthenticated}
      />
    </section>
  );
}
