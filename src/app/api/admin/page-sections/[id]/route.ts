import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentUser } from "@/lib/auth/roles";

// PUT - Actualizar sección
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
    const { type, title, subtitle, order, isActive, config } = body;

    const section = await prisma.pageSection.update({
      where: { id },
      data: {
        ...(type && { type }),
        ...(title !== undefined && { title }),
        ...(subtitle !== undefined && { subtitle }),
        ...(order !== undefined && { order }),
        ...(isActive !== undefined && { isActive }),
        ...(config && { config }),
      },
    });

    return NextResponse.json(section);
  } catch (error) {
    console.error("Error updating page section:", error);
    return NextResponse.json(
      { error: "Failed to update page section" },
      { status: 500 }
    );
  }
}

// DELETE - Eliminar sección
export async function DELETE(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const user = await getCurrentUser();

    if (!user || user.role !== "ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
    }

    const { id } = await params;

    await prisma.pageSection.delete({
      where: { id },
    });

    return NextResponse.json({ success: true });
  } catch (error) {
    console.error("Error deleting page section:", error);
    return NextResponse.json(
      { error: "Failed to delete page section" },
      { status: 500 }
    );
  }
}
