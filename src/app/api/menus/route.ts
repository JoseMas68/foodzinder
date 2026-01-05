import { auth } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { menuSchema } from "@/lib/validations/menu";

// GET /api/menus - List all menus for the authenticated user
export async function GET(_request: NextRequest) {
  try {
    const { userId } = await auth();

    if (!userId) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    // Get user from database
    const user = await prisma.user.findUnique({
      where: { clerkId: userId },
    });

    if (!user) {
      return NextResponse.json({ error: "User not found" }, { status: 404 });
    }

    const menusRaw = await prisma.menu.findMany({
      where: { ownerId: user.id },
      include: {
        dishes: {
          orderBy: { order: "asc" },
        },
        restaurants: {
          include: {
            restaurant: {
              select: {
                id: true,
                name: true,
                slug: true,
              },
            },
          },
        },
      },
      orderBy: { createdAt: "desc" },
    });

    // Serialize Decimal to number for JSON response
    const menus = menusRaw.map(menu => ({
      ...menu,
      price: menu.price ? Number(menu.price) : null,
      dishes: menu.dishes.map(dish => ({
        ...dish,
        price: Number(dish.price),
      })),
    }));

    return NextResponse.json(menus);
  } catch (error) {
    console.error("Error fetching menus:", error);
    return NextResponse.json(
      { error: "Failed to fetch menus" },
      { status: 500 }
    );
  }
}

// POST /api/menus - Create a new menu
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
    const validatedData = menuSchema.parse(body);

    const menuRaw = await prisma.menu.create({
      data: {
        title: validatedData.title,
        description: validatedData.description,
        price: validatedData.price ? parseFloat(validatedData.price) : null,
        isActive: validatedData.isActive,
        ownerId: user.id,
      },
      include: {
        dishes: true,
      },
    });

    // Serialize Decimal to number for JSON response
    const menu = {
      ...menuRaw,
      price: menuRaw.price ? Number(menuRaw.price) : null,
      dishes: menuRaw.dishes.map(dish => ({
        ...dish,
        price: Number(dish.price),
      })),
    };

    return NextResponse.json(menu, { status: 201 });
  } catch (error) {
    console.error("Error creating menu:", error);

    if (error instanceof Error && error.name === "ZodError") {
      return NextResponse.json(
        { error: "Validation error", details: error },
        { status: 400 }
      );
    }

    return NextResponse.json(
      { error: "Failed to create menu" },
      { status: 500 }
    );
  }
}
