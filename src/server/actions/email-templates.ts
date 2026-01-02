"use server";

import { prisma } from "@/lib/prisma";
import { revalidatePath } from "next/cache";
import { getCurrentUser } from "@/lib/auth/roles";
import { EmailTemplateType } from "@prisma/client";

export async function getEmailTemplates() {
  try {
    const user = await getCurrentUser();
    if (!user || user.role !== "ADMIN") {
      throw new Error("No autorizado");
    }

    const templates = await prisma.emailTemplate.findMany({
      orderBy: { type: "asc" },
    });

    return { success: true, data: templates };
  } catch (error: any) {
    console.error("Error getting email templates:", error);
    return { success: false, error: error.message };
  }
}

export async function getEmailTemplateByType(type: EmailTemplateType) {
  try {
    const template = await prisma.emailTemplate.findUnique({
      where: { type },
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
    if (!user || user.role !== "ADMIN") {
      throw new Error("No autorizado");
    }

    const template = await prisma.emailTemplate.update({
      where: { id },
      data,
    });

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
    if (!user || user.role !== "ADMIN") {
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

    revalidatePath("/dashboard/admin/email-templates");

    return { success: true, data: updated };
  } catch (error: any) {
    console.error("Error toggling template status:", error);
    return { success: false, error: error.message };
  }
}
