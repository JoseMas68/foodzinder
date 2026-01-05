"use client"

import { useState } from 'react'
import Link from 'next/link'
import { Badge } from '@/components/ui/badge'
import { Button } from '@/components/ui/button'
import { Card, CardContent } from '@/components/ui/card'
import { LayoutGrid, List as ListIcon, PencilLine, ExternalLink } from 'lucide-react'

interface Restaurant {
  id: string
  name: string
  slug: string
  description: string
  status: string
  priceRange: string
  createdAt: string
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
  const [viewMode, setViewMode] = useState<'grid' | 'list'>('grid')

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

  const renderMetadata = (restaurant: Restaurant) => {
    const cuisineTypes = restaurant.taxonomies
      .filter((t) => t.taxonomy.type === 'CUISINE_TYPE')
      .map((t) => t.taxonomy.name)

    const status = statusConfig[restaurant.status as keyof typeof statusConfig]

    return (
      <div className="flex flex-wrap items-center gap-2 text-xs text-muted-foreground">
        <Badge variant={status.variant} className="text-[10px]">
          {status.label}
        </Badge>
        {cuisineTypes[0] && <span>{cuisineTypes[0]}</span>}
        <span>• {restaurant.priceRange}</span>
        <span>
          • {restaurant._count.menus} menús · {restaurant._count.reviews} reseñas
        </span>
      </div>
    )
  }

  const ActionLinks = ({ restaurant }: { restaurant: Restaurant }) => (
    <div className="flex items-center gap-2 text-xs font-medium">
      <Link
        href={`/restaurants/${restaurant.slug}`}
        className="inline-flex items-center gap-1 text-primary hover:underline"
      >
        Público
        <ExternalLink className="h-3 w-3" />
      </Link>
      <span className="text-muted-foreground">|</span>
      <Link
        href={`/dashboard/restaurants/${restaurant.id}`}
        className="inline-flex items-center gap-1 text-primary hover:underline"
      >
        <PencilLine className="h-3 w-3" />
        Editar
      </Link>
    </div>
  )

  return (
    <div className="space-y-4">
      <div className="flex flex-wrap items-center justify-between gap-3">
        <p className="text-sm text-muted-foreground">
          {restaurants.length} {restaurants.length === 1 ? 'restaurante' : 'restaurantes'}
        </p>
        <div className="inline-flex rounded-full border bg-white p-1 shadow-sm">
          <Button
            variant={viewMode === 'grid' ? 'default' : 'ghost'}
            size="sm"
            className="gap-1 rounded-full"
            onClick={() => setViewMode('grid')}
          >
            <LayoutGrid className="h-4 w-4" />
            Cuadrícula
          </Button>
          <Button
            variant={viewMode === 'list' ? 'default' : 'ghost'}
            size="sm"
            className="gap-1 rounded-full"
            onClick={() => setViewMode('list')}
          >
            <ListIcon className="h-4 w-4" />
            Lista
          </Button>
        </div>
      </div>

      {viewMode === 'grid' ? (
        <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-3">
          {restaurants.map((restaurant) => (
            <Card key={restaurant.id} className="h-full border border-gray-100 shadow-sm">
              <CardContent className="p-4 space-y-3">
                <h3 className="font-semibold text-lg line-clamp-1">
                  {restaurant.name}
                </h3>
                {renderMetadata(restaurant)}
                <ActionLinks restaurant={restaurant} />
              </CardContent>
            </Card>
          ))}
        </div>
      ) : (
        <div className="space-y-3">
          {restaurants.map((restaurant) => (
            <Card key={restaurant.id} className="border border-gray-100 shadow-sm">
              <CardContent className="p-4">
                <div className="flex flex-col gap-2">
                  <div className="flex flex-wrap items-center justify-between gap-2">
                    <h3 className="font-semibold text-lg">
                      {restaurant.name}
                    </h3>
                    <ActionLinks restaurant={restaurant} />
                  </div>
                  {renderMetadata(restaurant)}
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      )}
    </div>
  )
}
