import { auth } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

// POST /api/restaurants/[id]/menus - Assign a menu to a restaurant
export async function POST(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id: restaurantId } = await params;
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
    const { menuId } = body;

    // Verify restaurant ownership
    const restaurant = await prisma.restaurant.findFirst({
      where: {
        id: restaurantId,
        ownerId: user.id,
      },
    });

    if (!restaurant) {
      return NextResponse.json(
        { error: "Restaurant not found or unauthorized" },
        { status: 404 }
      );
    }

    // Verify menu ownership
    const menu = await prisma.menu.findFirst({
      where: {
        id: menuId,
        ownerId: user.id,
      },
    });

    if (!menu) {
      return NextResponse.json(
        { error: "Menu not found or unauthorized" },
        { status: 404 }
      );
    }

    // Check if already assigned
    const existing = await prisma.restaurantMenu.findUnique({
      where: {
        restaurantId_menuId: {
          restaurantId,
          menuId,
        },
      },
    });

    if (existing) {
      return NextResponse.json(
        { error: "Menu already assigned to this restaurant" },
        { status: 400 }
      );
    }

    // Create assignment
    const assignment = await prisma.restaurantMenu.create({
      data: {
        restaurantId,
        menuId,
      },
      include: {
        menu: {
          include: {
            dishes: {
              orderBy: { order: "asc" },
            },
          },
        },
      },
    });

    return NextResponse.json(assignment, { status: 201 });
  } catch (error) {
    console.error("Error assigning menu to restaurant:", error);
    return NextResponse.json(
      { error: "Failed to assign menu" },
      { status: 500 }
    );
  }
}

// DELETE /api/restaurants/[id]/menus?menuId=xxx - Remove menu from restaurant
export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id: restaurantId } = await params;
    const { searchParams } = new URL(request.url);
    const menuId = searchParams.get("menuId");

    if (!menuId) {
      return NextResponse.json(
        { error: "menuId is required" },
        { status: 400 }
      );
    }

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

    // Verify restaurant ownership
    const restaurant = await prisma.restaurant.findFirst({
      where: {
        id: restaurantId,
        ownerId: user.id,
      },
    });

    if (!restaurant) {
      return NextResponse.json(
        { error: "Restaurant not found or unauthorized" },
        { status: 404 }
      );
    }

    // Delete assignment
    await prisma.restaurantMenu.delete({
      where: {
        restaurantId_menuId: {
          restaurantId,
          menuId,
        },
      },
    });

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error("Error removing menu from restaurant:", error);
    return NextResponse.json(
      { error: "Failed to remove menu" },
      { status: 500 }
    );
  }
}
