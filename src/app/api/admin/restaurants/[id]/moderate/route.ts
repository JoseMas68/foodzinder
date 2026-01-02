import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentUser } from "@/lib/auth/roles";
import { RestaurantStatus } from "@prisma/client";

// PUT - Moderar restaurante (aprobar/rechazar)
export async function PUT(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const user = await getCurrentUser();

    if (!user || user.role !== "ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
    }

    const { id } = await params;
    const body = await request.json();
    const { status } = body;

    // Validar que el status sea válido
    if (!["APPROVED", "REJECTED", "ARCHIVED"].includes(status)) {
      return NextResponse.json(
        { error: "Invalid status. Must be APPROVED, REJECTED, or ARCHIVED" },
        { status: 400 }
      );
    }

    const restaurant = await prisma.restaurant.update({
      where: { id },
      data: { status: status as RestaurantStatus },
      include: {
        owner: {
          select: {
            id: true,
            email: true,
            firstName: true,
            lastName: true,
          },
        },
      },
    });

    return NextResponse.json(restaurant);
  } catch (error) {
    console.error("Error moderating restaurant:", error);
    return NextResponse.json(
      { error: "Failed to moderate restaurant" },
      { status: 500 }
    );
  }
}
