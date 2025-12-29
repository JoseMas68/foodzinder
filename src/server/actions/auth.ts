"use server";

import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import type { User } from "@/types";

/**
 * Sincronizar usuario de Clerk a la base de datos
 * Se ejecuta después del webhook de Clerk
 */
export async function syncUserFromClerk(
  clerkUserId: string,
  email: string,
  firstName: string,
  lastName: string
): Promise<User | null> {
  try {
    const user = await prisma.user.upsert({
      where: { id: clerkUserId },
      update: {
        email,
        firstName,
        lastName,
      },
      create: {
        id: clerkUserId,
        email,
        firstName,
        lastName,
        role: "USER",
      },
    });

    return {
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      role: user.role,
      taxId: user.taxId || undefined,
      billingName: user.billingName || undefined,
      billingAddress: user.billingAddress || undefined,
      createdAt: user.createdAt,
    };
  } catch (error) {
    console.error("Error syncing user from Clerk:", error);
    return null;
  }
}

/**
 * Obtener usuario actual autenticado
 */
export async function getCurrentUser(): Promise<User | null> {
  try {
    const { userId } = await auth();

    if (!userId) {
      return null;
    }

    const user = await prisma.user.findUnique({
      where: { id: userId },
    });

    if (!user) {
      return null;
    }

    return {
      id: user.id,
      email: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      role: user.role,
      taxId: user.taxId || undefined,
      billingName: user.billingName || undefined,
      billingAddress: user.billingAddress || undefined,
      createdAt: user.createdAt,
    };
  } catch (error) {
    console.error("Error getting current user:", error);
    return null;
  }
}

/**
 * Verificar si el usuario tiene un rol específico
 */
export async function hasRole(requiredRole: string): Promise<boolean> {
  const user = await getCurrentUser();
  return user?.role === requiredRole;
}

/**
 * Verificar si el usuario es propietario
 */
export async function isOwner(): Promise<boolean> {
  return hasRole("OWNER");
}

/**
 * Verificar si el usuario es admin
 */
export async function isAdmin(): Promise<boolean> {
  return hasRole("ADMIN");
}
