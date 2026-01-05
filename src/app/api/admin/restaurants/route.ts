import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentUser } from "@/lib/auth/roles";

// GET - Listar todos los restaurantes (para admin)
export async function GET(request: NextRequest) {
  try {
    const user = await getCurrentUser();

    if (!user || user.role !== "ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
    }

    const { searchParams } = new URL(request.url);
    const status = searchParams.get("status");
    const page = Math.max(1, Number(searchParams.get("page") ?? "1"));
    const limitParam = Number(searchParams.get("limit") ?? "25");
    const limit = Math.min(Math.max(limitParam, 1), 100);
    const skip = (page - 1) * limit;

    const where = status ? { status: status as any } : undefined;

    const [restaurants, total] = await Promise.all([
      prisma.restaurant.findMany({
        where,
        select: {
          id: true,
          name: true,
          slug: true,
          status: true,
          priceRange: true,
          createdAt: true,
          owner: {
            select: {
              id: true,
              email: true,
              firstName: true,
              lastName: true,
            },
          },
          _count: {
            select: {
              reviews: true,
              menus: true,
            },
          },
        },
        orderBy: { createdAt: "desc" },
        skip,
        take: limit,
      }),
      prisma.restaurant.count({ where }),
    ]);

    const pages = Math.ceil(total / limit) || 1;

    return NextResponse.json({
      data: restaurants,
      page,
      limit,
      total,
      pages,
    });
  } catch (error) {
    console.error("Error fetching restaurants:", error);
    return NextResponse.json(
      { error: "Failed to fetch restaurants" },
      { status: 500 }
    );
  }
}
