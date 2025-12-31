import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { getCurrentUser } from "@/lib/auth/roles";

// GET - Listar todas las secciones
export async function GET() {
  try {
    const sections = await prisma.pageSection.findMany({
      orderBy: { order: "asc" },
    });

    return NextResponse.json(sections);
  } catch (error) {
    console.error("Error fetching page sections:", error);
    return NextResponse.json(
      { error: "Failed to fetch page sections" },
      { status: 500 }
    );
  }
}

// POST - Crear nueva sección
export async function POST(request: NextRequest) {
  try {
    const user = await getCurrentUser();

    if (!user || user.role !== "ADMIN") {
      return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
    }

    const body = await request.json();
    const { type, title, subtitle, order, isActive, config } = body;

    const section = await prisma.pageSection.create({
      data: {
        type,
        title,
        subtitle,
        order: order || 0,
        isActive: isActive ?? true,
        config: config || {},
      },
    });

    return NextResponse.json(section, { status: 201 });
  } catch (error) {
    console.error("Error creating page section:", error);
    return NextResponse.json(
      { error: "Failed to create page section" },
      { status: 500 }
    );
  }
}
