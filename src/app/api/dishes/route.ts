import { auth } from "@clerk/nextjs/server";
import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { dishSchema } from "@/lib/validations/menu";

// POST /api/dishes - Create a new dish
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
    const validatedData = dishSchema.parse(body);

    // Verify menu ownership
    const menu = await prisma.menu.findFirst({
      where: {
        id: body.menuId,
        ownerId: user.id,
      },
    });

    if (!menu) {
      return NextResponse.json(
        { error: "Menu not found or unauthorized" },
        { status: 404 }
      );
    }

    const dishRaw = await prisma.dish.create({
      data: {
        name: validatedData.name,
        description: validatedData.description,
        price: parseFloat(validatedData.price),
        imageUrl: validatedData.imageUrl || null,
        allergens: validatedData.allergens,
        order: validatedData.order,
        menuId: body.menuId,
      },
    });

    // Serialize Decimal to number for JSON response
    const dish = {
      ...dishRaw,
      price: Number(dishRaw.price),
    };

    return NextResponse.json(dish, { status: 201 });
  } catch (error) {
    console.error("Error creating dish:", error);

    if (error instanceof Error && error.name === "ZodError") {
      return NextResponse.json(
        { error: "Validation error", details: error },
        { status: 400 }
      );
    }

    return NextResponse.json(
      { error: "Failed to create dish" },
      { status: 500 }
    );
  }
}
