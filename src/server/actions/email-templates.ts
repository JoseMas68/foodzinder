"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { getCurrentUser } from "@/lib/auth/roles";
import { EmailTemplateType } from "@prisma/client";

/**
 * Obtener restaurantes del owner actual
 */
export async function getOwnerRestaurants() {
  try {
    const user = await getCurrentUser();
    if (!user || (user.role !== "ADMIN" && user.role !== "OWNER")) {
      throw new Error("No autorizado");
    }

    const where: any = {};
    if (user.role === "OWNER") {
      where.ownerId = user.id;
    }
    // Si es ADMIN, devuelve todos los restaurantes

    const restaurants = await prisma.restaurant.findMany({
      where,
      select: {
        id: true,
        name: true,
        status: true,
      },
      orderBy: { name: "asc" },
    });

    return { success: true, data: restaurants };
  } catch (error: any) {
    console.error("Error getting owner restaurants:", error);
    return { success: false, error: error.message };
  }
}

export async function getEmailTemplates(restaurantId?: string) {
  try {
    const user = await getCurrentUser();
    if (!user || (user.role !== "ADMIN" && user.role !== "OWNER")) {
      throw new Error("No autorizado");
    }

    // Si es OWNER, obtener plantillas de sus restaurantes
    // Si es ADMIN y no especifica restaurantId, obtener plantillas globales
    const where: any = {};

    if (user.role === "OWNER") {
      // Verificar que el owner tenga acceso al restaurante
      if (restaurantId) {
        const restaurant = await prisma.restaurant.findFirst({
          where: {
            id: restaurantId,
            ownerId: user.id,
          },
        });

        if (!restaurant) {
          throw new Error("No tienes acceso a este restaurante");
        }

        where.restaurantId = restaurantId;
      } else {
        // Si no especifica restaurante, retornar vacío o error
        throw new Error("Debes especificar un restaurante");
      }
    } else if (user.role === "ADMIN") {
      // Admin puede ver plantillas globales o de cualquier restaurante
      if (restaurantId) {
        where.restaurantId = restaurantId;
      } else {
        where.restaurantId = null; // Plantillas globales
      }
    }

    const templates = await prisma.emailTemplate.findMany({
      where,
      include: {
        restaurant: {
          select: {
            id: true,
            name: true,
          },
        },
      },
      orderBy: { type: "asc" },
    });

    return { success: true, data: templates };
  } catch (error: any) {
    console.error("Error getting email templates:", error);
    return { success: false, error: error.message };
  }
}

export async function getEmailTemplateByType(
  type: EmailTemplateType,
  restaurantId?: string | null
) {
  try {
    const template = await prisma.emailTemplate.findUnique({
      where: {
        type_restaurantId: {
          type,
          restaurantId: restaurantId || null,
        },
      },
    });

    if (!template) {
      return { success: false, error: "Template not found" };
    }

    return { success: true, data: template };
  } catch (error: any) {
    console.error("Error getting email template:", error);
    return { success: false, error: error.message };
  }
}

export async function updateEmailTemplate(
  id: string,
  data: {
    name?: string;
    description?: string | null;
    subject?: string;
    htmlContent?: string;
    variables?: any;
    isActive?: boolean;
  }
) {
  try {
    const user = await getCurrentUser();
    if (!user || (user.role !== "ADMIN" && user.role !== "OWNER")) {
      throw new Error("No autorizado");
    }

    const template = await prisma.emailTemplate.update({
      where: { id },
      data,
    });

    revalidatePath("/dashboard/email-templates");
    revalidatePath("/dashboard/admin/email-templates");

    return { success: true, data: template };
  } catch (error: any) {
    console.error("Error updating email template:", error);
    return { success: false, error: error.message };
  }
}

export async function toggleTemplateStatus(id: string) {
  try {
    const user = await getCurrentUser();
    if (!user || (user.role !== "ADMIN" && user.role !== "OWNER")) {
      throw new Error("No autorizado");
    }

    const template = await prisma.emailTemplate.findUnique({
      where: { id },
    });

    if (!template) {
      throw new Error("Template not found");
    }

    const updated = await prisma.emailTemplate.update({
      where: { id },
      data: { isActive: !template.isActive },
    });

    revalidatePath("/dashboard/email-templates");
    revalidatePath("/dashboard/admin/email-templates");

    return { success: true, data: updated };
  } catch (error: any) {
    console.error("Error toggling template status:", error);
    return { success: false, error: error.message };
  }
}
