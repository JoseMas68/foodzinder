import { redirect } from 'next/navigation'
import Link from 'next/link'
import { getCurrentUser } from '@/lib/auth/roles'
import { prisma } from '@/lib/prisma'
import { Button } from '@/components/ui/button'
import { PlusCircle } from 'lucide-react'
import { RestaurantList } from '@/components/dashboard/restaurants/restaurant-list'

export default async function RestaurantsPage() {
  const user = await getCurrentUser()

  if (!user) {
    redirect('/sign-in')
  }

  if (user.role !== 'OWNER' && user.role !== 'ADMIN') {
    redirect('/')
  }

  const restaurantsData = await prisma.restaurant.findMany({
    where: { ownerId: user.id },
    select: {
      id: true,
      name: true,
      slug: true,
      description: true,
      status: true,
      priceRange: true,
      createdAt: true,
      _count: {
        select: {
          menus: true,
          reviews: true,
        },
      },
      taxonomies: {
        select: {
          taxonomy: {
            select: {
              name: true,
              type: true,
            },
          },
        },
        take: 3,
      },
    },
    orderBy: { createdAt: 'desc' },
  })
  const restaurants = restaurantsData.map((restaurant) => ({
    ...restaurant,
    createdAt: restaurant.createdAt.toISOString(),
  }))

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold font-heading">Mis Restaurantes</h1>
          <p className="text-muted-foreground mt-1">
            Gestiona tus restaurantes y menús
          </p>
        </div>
        <Button asChild>
          <Link href="/dashboard/restaurants/new">
            <PlusCircle className="mr-2 h-4 w-4" />
            Nuevo Restaurante
          </Link>
        </Button>
      </div>

      <RestaurantList restaurants={restaurants} />
    </div>
  )
}
