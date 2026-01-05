import { auth } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

// POST /api/favorites - Add a restaurant to favorites
export async function POST(request: NextRequest) {
  try {
    const { userId } = await auth();

    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const user = await prisma.user.findUnique({
      where: { clerkId: userId },
    });

    if (!user) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    const body = await request.json();
    const { restaurantId } = body;

    if (!restaurantId) {
      return NextResponse.json(
        { error: "restaurantId is required" },
        { status: 400 }
      );
    }

    // Check if restaurant exists
    const restaurant = await prisma.restaurant.findUnique({
      where: { id: restaurantId },
    });

    if (!restaurant) {
      return NextResponse.json(
        { error: "Restaurant not found" },
        { status: 404 }
      );
    }

    // Check if already favorited
    const existing = await prisma.favorite.findUnique({
      where: {
        userId_restaurantId: {
          userId: user.id,
          restaurantId,
        },
      },
    });

    if (existing) {
      return NextResponse.json(
        { error: "Restaurant already in favorites" },
        { status: 400 }
      );
    }

    // Add to favorites
    const favorite = await prisma.favorite.create({
      data: {
        userId: user.id,
        restaurantId,
      },
      include: {
        restaurant: {
          select: {
            name: true,
            slug: true,
          },
        },
      },
    });

    return NextResponse.json(favorite, { status: 201 });
  } catch (error) {
    console.error("Error adding favorite:", error);
    return NextResponse.json(
      { error: "Failed to add favorite" },
      { status: 500 }
    );
  }
}

// DELETE /api/favorites?restaurantId=xxx - Remove from favorites
export async function DELETE(request: NextRequest) {
  try {
    const { userId } = await auth();

    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const user = await prisma.user.findUnique({
      where: { clerkId: userId },
    });

    if (!user) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    const { searchParams } = new URL(request.url);
    const restaurantId = searchParams.get("restaurantId");

    if (!restaurantId) {
      return NextResponse.json(
        { error: "restaurantId is required" },
        { status: 400 }
      );
    }

    // Delete favorite
    await prisma.favorite.delete({
      where: {
        userId_restaurantId: {
          userId: user.id,
          restaurantId,
        },
      },
    });

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error("Error removing favorite:", error);
    return NextResponse.json(
      { error: "Failed to remove favorite" },
      { status: 500 }
    );
  }
}

// GET /api/favorites - Get user's favorites
export async function GET(request: NextRequest) {
  try {
    const { userId } = await auth();

    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const user = await prisma.user.findUnique({
      where: { clerkId: userId },
    });

    if (!user) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    const favorites = await prisma.favorite.findMany({
      where: { userId: user.id },
      select: {
        id: true,
        restaurantId: true,
        createdAt: true,
        restaurant: {
          select: {
            id: true,
            name: true,
            slug: true,
            logoUrl: true,
            coverUrl: true,
            priceRange: true,
            address: true,
            taxonomies: {
              select: {
                taxonomy: {
                  select: {
                    id: true,
                    name: true,
                    type: true,
                  },
                },
              },
              take: 4,
            },
            _count: {
              select: {
                reviews: true,
              },
            },
          },
        },
      },
      orderBy: {
        createdAt: "desc",
      },
    });

    const restaurantIds = favorites.map((favorite) => favorite.restaurantId);

    const reviewStats = restaurantIds.length
      ? await prisma.review.groupBy({
          by: ["restaurantId"],
          where: {
            restaurantId: { in: restaurantIds },
          },
          _avg: {
            rating: true,
          },
          _count: {
            rating: true,
          },
        })
      : [];

    const statsMap = new Map(
      reviewStats.map((stat) => [
        stat.restaurantId,
        {
          averageRating: stat._avg.rating ? Number(stat._avg.rating.toFixed(1)) : 0,
          reviewCount: stat._count.rating,
        },
      ])
    );

    const payload = favorites.map((favorite) => {
      const { _count, taxonomies, ...restaurant } = favorite.restaurant;
      return {
        id: favorite.id,
        restaurantId: favorite.restaurantId,
        createdAt: favorite.createdAt,
        restaurant: {
          ...restaurant,
          taxonomies: taxonomies.map((entry) => entry.taxonomy),
          stats: {
            averageRating: statsMap.get(favorite.restaurantId)?.averageRating ?? 0,
            reviewCount:
              statsMap.get(favorite.restaurantId)?.reviewCount ?? _count.reviews,
          },
        },
      };
    });

    return NextResponse.json(payload);
  } catch (error) {
    console.error("Error fetching favorites:", error);
    return NextResponse.json(
      { error: "Failed to fetch favorites" },
      { status: 500 }
    );
  }
}
