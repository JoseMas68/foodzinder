'use client'

import Link from 'next/link'
import Image from 'next/image'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { Edit, Eye, MoreVertical, CirclePlus, Image as ImageIcon, Utensils, Star, ChevronRight } from 'lucide-react'
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
      <Card className="border-dashed">
        <CardContent className="py-20 text-center">
          <div className="mx-auto w-12 h-12 rounded-full bg-primary/10 flex items-center justify-center mb-4">
            <CirclePlus className="h-6 w-6 text-primary" />
          </div>
          <h3 className="text-xl font-semibold mb-2">No tienes restaurantes</h3>
          <p className="text-muted-foreground mb-6 max-w-sm mx-auto">
            Comienza creando tu primer restaurante para gestionar tus menús, mesas y reservas.
          </p>
          <Button asChild>
            <Link href="/dashboard/restaurants/new">Crear mi primer restaurante</Link>
          </Button>
        </CardContent>
      </Card>
    )
  }

  return (
    <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
      {restaurants.map((restaurant) => {
        const status = statusConfig[restaurant.status as keyof typeof statusConfig] || { label: restaurant.status, variant: 'default' }
        const cuisineTypes = (restaurant.taxonomies || [])
          .filter((t) => t?.taxonomy?.type === 'CUISINE_TYPE')
          .map((t) => t?.taxonomy?.name)
          .filter(Boolean) as string[]

        return (
          <Card key={restaurant.id} className="group overflow-hidden border-none shadow-md hover:shadow-xl transition-all duration-300">
            {/* Cover Image */}
            <div className="relative h-48 bg-muted overflow-hidden">
              {restaurant.coverUrl ? (
                <Image
                  src={restaurant.coverUrl}
                  alt={restaurant.name}
                  fill
                  className="object-cover transition-transform duration-500 group-hover:scale-105"
                />
              ) : (
                <div className="w-full h-full flex items-center justify-center bg-gray-50 text-gray-300">
                  <ImageIcon className="h-12 w-12" />
                </div>
              )}
              <div className="absolute top-4 right-4 focus-within:opacity-100">
                <DropdownMenu>
                  <DropdownMenuTrigger asChild>
                    <Button variant="secondary" size="icon" className="h-8 w-8 bg-white/80 backdrop-blur-sm hover:bg-white shadow-sm">
                      <MoreVertical className="h-4 w-4" />
                    </Button>
                  </DropdownMenuTrigger>
                  <DropdownMenuContent align="end" className="w-48">
                    <DropdownMenuItem asChild>
                      <Link href={`/dashboard/restaurants/${restaurant.id}`}>
                        <Edit className="mr-2 h-4 w-4" />
                        Gestionar
                      </Link>
                    </DropdownMenuItem>
                    <DropdownMenuItem asChild>
                      <Link href={`/restaurants/${restaurant.slug}`} target="_blank">
                        <Eye className="mr-2 h-4 w-4" />
                        Ver público
                      </Link>
                    </DropdownMenuItem>
                  </DropdownMenuContent>
                </DropdownMenu>
              </div>
              <div className="absolute bottom-4 left-4">
                <Badge variant={status.variant} className="shadow-sm border-none px-3 py-1">
                  {status.label}
                </Badge>
              </div>
            </div>

            <CardContent className="p-5">
              <div className="mb-4">
                <h3 className="text-xl font-bold group-hover:text-primary transition-colors line-clamp-1 mb-1">
                  {restaurant.name}
                </h3>
                <div className="flex items-center gap-2 text-sm text-muted-foreground">
                  <span className="font-medium text-pink-500">{priceRangeLabels[restaurant.priceRange as keyof typeof priceRangeLabels] || restaurant.priceRange}</span>
                  {cuisineTypes[0] && (
                    <>
                      <span className="w-1 h-1 rounded-full bg-gray-300" />
                      <span>{cuisineTypes[0]}</span>
                    </>
                  )}
                </div>
              </div>

              <p className="text-sm text-muted-foreground line-clamp-2 mb-6 h-10">
                {restaurant.description}
              </p>

              <div className="grid grid-cols-2 gap-4 py-4 border-t border-gray-100">
                <div className="flex flex-col">
                  <span className="text-[10px] uppercase tracking-wider font-bold text-gray-400 mb-1">Menús</span>
                  <div className="flex items-center gap-1.5 font-semibold">
                    <Utensils className="h-3.5 w-3.5 text-gray-400" />
                    <span>{restaurant?._count?.menus || 0}</span>
                  </div>
                </div>
                <div className="flex flex-col">
                  <span className="text-[10px] uppercase tracking-wider font-bold text-gray-400 mb-1">Reseñas</span>
                  <div className="flex items-center gap-1.5 font-semibold">
                    <Star className="h-3.5 w-3.5 text-yellow-400" />
                    <span>{restaurant?._count?.reviews || 0}</span>
                  </div>
                </div>
              </div>

              <Button asChild className="w-full mt-2 group/btn" variant="outline">
                <Link href={`/dashboard/restaurants/${restaurant.id}`}>
                  Gestionar Restaurante
                  <ChevronRight className="ml-2 h-4 w-4 transition-transform group-hover/btn:translate-x-1" />
                </Link>
              </Button>
            </CardContent>
          </Card>
        )
      })}
    </div>
  )
}

const priceRangeLabels = {
  CHEAP: '€',
  MODERATE: '€€',
  EXPENSIVE: '€€€',
  LUXURY: '€€€€',
}
