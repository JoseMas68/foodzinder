'use server'

import { auth } from "@clerk/nextjs/server";

import { prisma } from '@/lib/prisma'
import { UserRole } from '@prisma/client'

/**
 * Synchronize user from Clerk to our database
 * Creates or updates user record based on Clerk data
 */
export async function syncUserFromClerk(
  clerkId: string,
  email: string,
  firstName: string,
  lastName: string
) {
  console.log('[syncUserFromClerk] Syncing user:', { clerkId, email })

  // Use upsert to handle race conditions and avoid duplicate creation
  const user = await prisma.user.upsert({
    where: { clerkId },
    update: {
      email,
      firstName,
      lastName,
    },
    create: {
      clerkId,
      email,
      firstName,
      lastName,
      role: UserRole.USER, // Default role, can be changed later by admin
    }
  })

  console.log('[syncUserFromClerk] User synced:', user.id)
  return user
}

export async function getCurrentUser() {
  // MODO BYPASS PARA DESARROLLO LOCAL
  if (process.env.NEXT_PUBLIC_AUTH_BYPASS === 'true') {
    return await prisma.user.findFirst({
      where: { role: UserRole.ADMIN },
    })
  }

  const { userId } = await auth();
  if (!userId) return null;

  const user = await prisma.user.findUnique({
    where: { clerkId: userId },
  });

  return user;
}

export async function isAdmin() {
  const user = await getCurrentUser();
  return user?.role === UserRole.ADMIN || user?.role === UserRole.OWNER;
}
