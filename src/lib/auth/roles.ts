/**
 * Role-based Access Control (RBAC) utilities
 * Provides helpers for checking user roles and permissions
 */

import { auth } from '@clerk/nextjs/server'
import { UserRole } from '@prisma/client'
import { prisma } from '@/lib/prisma'

/**
 * Get current user from database with Clerk authentication
 */
export async function getCurrentUser() {
  const { userId } = await auth()

  if (!userId) {
    return null
  }

  const user = await prisma.user.findUnique({
    where: { clerkId: userId },
  })

  return user
}

/**
 * Require that user has a specific role or roles
 * Throws error if user doesn't have required role
 */
export async function requireRole(allowedRoles: UserRole | UserRole[]) {
  const user = await getCurrentUser()

  if (!user) {
    throw new Error('No autenticado. Debes iniciar sesión.')
  }

  const roles = Array.isArray(allowedRoles) ? allowedRoles : [allowedRoles]

  if (!roles.includes(user.role)) {
    throw new Error('No tienes permisos para realizar esta acción.')
  }

  return user
}

/**
 * Check if user has a specific role
 */
export async function hasRole(role: UserRole): Promise<boolean> {
  const user = await getCurrentUser()
  return user?.role === role
}

/**
 * Check if user is admin
 */
export async function isAdmin(): Promise<boolean> {
  return hasRole(UserRole.ADMIN)
}

/**
 * Check if user is owner
 */
export async function isOwner(): Promise<boolean> {
  return hasRole(UserRole.OWNER)
}

/**
 * Check if user can edit a restaurant
 * Owners can only edit their own restaurants
 * Admins can edit any restaurant
 */
export async function canEditRestaurant(restaurantId: string): Promise<boolean> {
  const user = await getCurrentUser()

  if (!user) {
    return false
  }

  // Admins can edit any restaurant
  if (user.role === UserRole.ADMIN) {
    return true
  }

  // Owners can only edit their own restaurants
  if (user.role === UserRole.OWNER) {
    const restaurant = await prisma.restaurant.findUnique({
      where: { id: restaurantId },
      select: { ownerId: true },
    })

    return restaurant?.ownerId === user.id
  }

  return false
}

/**
 * Verify ownership of a restaurant
 * Throws error if user is not the owner
 */
export async function requireRestaurantOwnership(restaurantId: string) {
  const user = await getCurrentUser()

  if (!user) {
    throw new Error('No autenticado.')
  }

  // Admins bypass ownership check
  if (user.role === UserRole.ADMIN) {
    return user
  }

  const restaurant = await prisma.restaurant.findUnique({
    where: { id: restaurantId },
    select: { ownerId: true },
  })

  if (!restaurant) {
    throw new Error('Restaurante no encontrado.')
  }

  if (restaurant.ownerId !== user.id) {
    throw new Error('No tienes permisos para editar este restaurante.')
  }

  return user
}
