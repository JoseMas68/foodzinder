import { redirect } from 'next/navigation'
import Link from 'next/link'
import { getCurrentUser } from '@/lib/auth/roles'
import { getRestaurantsByOwnerId } from '@/server/queries/owner'
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

  const restaurants = await getRestaurantsByOwnerId(user.id)

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
