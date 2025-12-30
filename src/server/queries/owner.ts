/**
 * Owner-specific queries
 * Queries for restaurant owners to manage their content
 */

import { prisma } from '@/lib/prisma'
import { unstable_cache } from 'next/cache'

/**
 * Get all restaurants owned by a specific user
 */
export async function getRestaurantsByOwnerId(ownerId: string) {
  try {
    const restaurants = await prisma.restaurant.findMany({
      where: {
        ownerId,
      },
      include: {
        taxonomies: {
          include: {
            taxonomy: true,
          },
        },
        _count: {
          select: {
            reviews: true,
            menus: true,
          },
        },
      },
      orderBy: {
        createdAt: 'desc',
      },
    })

    return restaurants
  } catch (error) {
    console.error('Error fetching restaurants by owner:', error)
    return []
  }
}

/**
 * Get restaurant statistics for an owner
 */
export async function getOwnerRestaurantStats(ownerId: string) {
  try {
    const stats = await prisma.restaurant.aggregate({
      where: {
        ownerId,
      },
      _count: true,
    })

    const statusCounts = await prisma.restaurant.groupBy({
      by: ['status'],
      where: {
        ownerId,
      },
      _count: true,
    })

    const totalReviews = await prisma.review.count({
      where: {
        restaurant: {
          ownerId,
        },
      },
    })

    return {
      totalRestaurants: stats._count,
      byStatus: statusCounts.reduce((acc, item) => {
        acc[item.status] = item._count
        return acc
      }, {} as Record<string, number>),
      totalReviews,
    }
  } catch (error) {
    console.error('Error fetching owner stats:', error)
    return {
      totalRestaurants: 0,
      byStatus: {},
      totalReviews: 0,
    }
  }
}

/**
 * Get recent reviews for all restaurants owned by a user
 */
export async function getOwnerRecentReviews(ownerId: string, limit: number = 10) {
  try {
    const reviews = await prisma.review.findMany({
      where: {
        restaurant: {
          ownerId,
        },
      },
      include: {
        user: {
          select: {
            firstName: true,
            lastName: true,
            email: true,
          },
        },
        restaurant: {
          select: {
            name: true,
            slug: true,
          },
        },
      },
      orderBy: {
        createdAt: 'desc',
      },
      take: limit,
    })

    return reviews
  } catch (error) {
    console.error('Error fetching owner reviews:', error)
    return []
  }
}

/**
 * Check if a user can edit a specific restaurant
 */
export async function canUserEditRestaurant(userId: string, restaurantId: string): Promise<boolean> {
  try {
    const user = await prisma.user.findUnique({
      where: { id: userId },
      select: { role: true },
    })

    if (!user) {
      return false
    }

    // Admins can edit any restaurant
    if (user.role === 'ADMIN') {
      return true
    }

    // Owners can only edit their own restaurants
    const restaurant = await prisma.restaurant.findUnique({
      where: { id: restaurantId },
      select: { ownerId: true },
    })

    return restaurant?.ownerId === userId
  } catch (error) {
    console.error('Error checking edit permissions:', error)
    return false
  }
}

/**
 * Get cached restaurants by owner ID
 */
export function getCachedRestaurantsByOwnerId(ownerId: string) {
  return unstable_cache(
    async () => getRestaurantsByOwnerId(ownerId),
    ['owner-restaurants', ownerId],
    {
      revalidate: 60, // Cache for 1 minute
      tags: [`owner-${ownerId}-restaurants`],
    }
  )()
}

/**
 * Get cached owner stats
 */
export function getCachedOwnerStats(ownerId: string) {
  return unstable_cache(
    async () => getOwnerRestaurantStats(ownerId),
    ['owner-stats', ownerId],
    {
      revalidate: 300, // Cache for 5 minutes
      tags: [`owner-${ownerId}-stats`],
    }
  )()
}
