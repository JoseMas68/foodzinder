import { redirect } from 'next/navigation'
import Link from 'next/link'
import { getCurrentUser } from '@/lib/auth/roles'
import { getRestaurantsByOwnerId } from '@/server/queries/owner'
import { Button } from '@/components/ui/button'
import { CirclePlus } from 'lucide-react'
import { RestaurantList } from '@/components/dashboard/restaurants/restaurant-list'

export default async function RestaurantsPage() {
  const user = await getCurrentUser()

  if (!user) {
    redirect('/sign-in')
  }

  if (user.role !== 'OWNER' && user.role !== 'ADMIN') {
    redirect('/')
  }

  const restaurantsRaw = await getRestaurantsByOwnerId(user.id)

  const restaurants = restaurantsRaw.map((r: any) => ({
    ...r,
    createdAt: r.createdAt.toISOString(),
    updatedAt: r.updatedAt.toISOString(),
    taxonomies: r.taxonomies.map((t: any) => ({
      ...t,
      assignedAt: t.assignedAt?.toISOString() || new Date().toISOString(),
    }))
  })) as any

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
            <CirclePlus className="mr-2 h-4 w-4" />
            Nuevo Restaurante
          </Link>
        </Button>
      </div>

      <RestaurantList restaurants={restaurants} />
    </div>
  )
}
