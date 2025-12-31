import { auth } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { dishSchema } from "@/lib/validations/menu";

// PATCH /api/dishes/[id] - Update a dish
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

    // Verify ownership through menu
    const existingDish = await prisma.dish.findFirst({
      where: { id },
      include: {
        menu: true,
      },
    });

    if (!existingDish || existingDish.menu.ownerId !== user.id) {
      return NextResponse.json(
        { error: "Dish not found or unauthorized" },
        { status: 404 }
      );
    }

    const body = await request.json();
    const validatedData = dishSchema.parse(body);

    const updatedDishRaw = await prisma.dish.update({
      where: { id },
      data: {
        name: validatedData.name,
        description: validatedData.description,
        price: parseFloat(validatedData.price),
        imageUrl: validatedData.imageUrl || null,
        allergens: validatedData.allergens,
        order: validatedData.order,
      },
    });

    // Serialize Decimal to number for JSON response
    const updatedDish = {
      ...updatedDishRaw,
      price: Number(updatedDishRaw.price),
    };

    return NextResponse.json(updatedDish);
  } catch (error) {
    console.error("Error updating dish:", error);

    if (error instanceof Error && error.name === "ZodError") {
      return NextResponse.json(
        { error: "Validation error", details: error },
        { status: 400 }
      );
    }

    return NextResponse.json(
      { error: "Failed to update dish" },
      { status: 500 }
    );
  }
}

// DELETE /api/dishes/[id] - Delete a dish
export async function DELETE(
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

    // Verify ownership through menu
    const existingDish = await prisma.dish.findFirst({
      where: { id },
      include: {
        menu: true,
      },
    });

    if (!existingDish || existingDish.menu.ownerId !== user.id) {
      return NextResponse.json(
        { error: "Dish not found or unauthorized" },
        { status: 404 }
      );
    }

    await prisma.dish.delete({
      where: { id },
    });

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error("Error deleting dish:", error);
    return NextResponse.json(
      { error: "Failed to delete dish" },
      { status: 500 }
    );
  }
}
