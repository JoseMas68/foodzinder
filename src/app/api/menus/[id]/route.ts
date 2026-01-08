import { auth } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { menuSchema } from "@/lib/validations/menu";

// GET /api/menus/[id] - Get a specific menu
export async function GET(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params;
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

    const menuRaw = await prisma.menu.findFirst({
      where: {
        id,
        ownerId: user.id,
      },
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
    });

    if (!menuRaw) {
      return NextResponse.json({ error: "Menu not found" }, { status: 404 });
    }

    // Serialize Decimal to number for JSON response
    const menu = {
      ...menuRaw,
      price: menuRaw.price ? Number(menuRaw.price) : null,
      dishes: menuRaw.dishes.map(dish => ({
        ...dish,
        price: Number(dish.price),
      })),
    };

    return NextResponse.json(menu);
  } catch (error) {
    console.error("Error fetching menu:", error);
    return NextResponse.json(
      { error: "Failed to fetch menu" },
      { status: 500 }
    );
  }
}

// PATCH /api/menus/[id] - Update a menu
export async function PATCH(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params;
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

    // Verify ownership
    const existingMenu = await prisma.menu.findFirst({
      where: {
        id,
        ownerId: user.id,
      },
    });

    if (!existingMenu) {
      return NextResponse.json(
        { error: "Menu not found or unauthorized" },
        { status: 404 }
      );
    }

    const body = await request.json();
    const validatedData = menuSchema.parse(body);

    const updatedMenuRaw = await prisma.menu.update({
      where: { id },
      data: {
        title: validatedData.title,
        description: validatedData.description,
        price: validatedData.price ? parseFloat(validatedData.price) : null,
        isActive: validatedData.isActive,
      },
      include: {
        dishes: {
          orderBy: { order: "asc" },
        },
      },
    });

    // Serialize Decimal to number for JSON response
    const updatedMenu = {
      ...updatedMenuRaw,
      price: updatedMenuRaw.price ? Number(updatedMenuRaw.price) : null,
      dishes: updatedMenuRaw.dishes.map(dish => ({
        ...dish,
        price: Number(dish.price),
      })),
    };

    return NextResponse.json(updatedMenu);
  } catch (error) {
    console.error("Error updating menu:", error);

    if (error instanceof Error && error.name === "ZodError") {
      return NextResponse.json(
        { error: "Validation error", details: error },
        { status: 400 }
      );
    }

    return NextResponse.json(
      { error: "Failed to update menu" },
      { status: 500 }
    );
  }
}

// DELETE /api/menus/[id] - Delete a menu
export async function DELETE(
  _request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await params;
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

    // Verify ownership
    const existingMenu = await prisma.menu.findFirst({
      where: {
        id,
        ownerId: user.id,
      },
    });

    if (!existingMenu) {
      return NextResponse.json(
        { error: "Menu not found or unauthorized" },
        { status: 404 }
      );
    }

    await prisma.menu.delete({
      where: { id },
    });

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error("Error deleting menu:", error);
    return NextResponse.json(
      { error: "Failed to delete menu" },
      { status: 500 }
    );
  }
}
