'use server'

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
