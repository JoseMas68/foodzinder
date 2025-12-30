import Link from 'next/link'
import Image from 'next/image'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Edit, Eye, MoreVertical } from 'lucide-react'
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu'

interface Restaurant {
  id: string
  name: string
  slug: string
  description: string
  status: string
  coverUrl: string | null
  logoUrl: string | null
  priceRange: string
  _count: {
    reviews: number
    menus: number
  }
  taxonomies: Array<{
    taxonomy: {
      name: string
      type: string
    }
  }>
}

interface RestaurantListProps {
  restaurants: Restaurant[]
}

const statusConfig = {
  PENDING: { label: 'Pendiente', variant: 'warning' as const },
  APPROVED: { label: 'Aprobado', variant: 'success' as const },
  REJECTED: { label: 'Rechazado', variant: 'destructive' as const },
  ARCHIVED: { label: 'Archivado', variant: 'secondary' as const },
}

export function RestaurantList({ restaurants }: RestaurantListProps) {
  if (restaurants.length === 0) {
    return (
      <Card>
        <CardContent className="py-12 text-center">
          <p className="text-muted-foreground">
            Aún no tienes restaurantes creados
          </p>
          <Button asChild className="mt-4">
            <Link href="/dashboard/restaurants/new">Crear mi primer restaurante</Link>
          </Button>
        </CardContent>
      </Card>
    )
  }

  return (
    <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
      {restaurants.map((restaurant) => {
        const status = statusConfig[restaurant.status as keyof typeof statusConfig]
        const cuisineTypes = restaurant.taxonomies
          .filter((t) => t.taxonomy.type === 'CUISINE_TYPE')
          .map((t) => t.taxonomy.name)

        return (
          <Card key={restaurant.id} className="overflow-hidden">
            {/* Cover Image */}
            <div className="relative h-32 bg-muted">
              {restaurant.coverUrl && (
                <Image
                  src={restaurant.coverUrl}
                  alt={restaurant.name}
                  fill
                  className="object-cover"
                />
              )}
            </div>

            <CardContent className="p-4">
              <div className="flex items-start justify-between mb-2">
                <div className="flex-1">
                  <h3 className="font-semibold line-clamp-1">{restaurant.name}</h3>
                  <div className="flex items-center gap-2 mt-1">
                    <Badge variant={status.variant} className="text-xs">
                      {status.label}
                    </Badge>
                    {cuisineTypes[0] && (
                      <span className="text-xs text-muted-foreground">
                        {cuisineTypes[0]}
                      </span>
                    )}
                  </div>
                </div>

                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <Button variant="ghost" size="icon" className="h-8 w-8">
                      <MoreVertical className="h-4 w-4" />
                    </Button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="end">
                    <DropdownMenuItem asChild>
                      <Link href={`/restaurants/${restaurant.slug}`}>
                        <Eye className="mr-2 h-4 w-4" />
                        Ver público
                      </Link>
                    </DropdownMenuItem>
                    <DropdownMenuItem asChild>
                      <Link href={`/dashboard/restaurants/${restaurant.id}`}>
                        <Edit className="mr-2 h-4 w-4" />
                        Editar
                      </Link>
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
              </div>

              <p className="text-sm text-muted-foreground line-clamp-2 mb-3">
                {restaurant.description}
              </p>

              <div className="flex items-center justify-between text-xs text-muted-foreground">
                <span>{restaurant._count.menus} menús</span>
                <span>{restaurant._count.reviews} reseñas</span>
              </div>
            </CardContent>
          </Card>
        )
      })}
    </div>
  )
}
