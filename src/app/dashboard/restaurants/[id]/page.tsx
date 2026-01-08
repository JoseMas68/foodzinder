import { redirect, notFound } from 'next/navigation'
import { getCurrentUser, canEditRestaurant } from '@/lib/auth/roles'
import { prisma } from '@/lib/prisma'
import { Card, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import Link from 'next/link'
import { ChevronLeft, ExternalLink } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { getTaxonomies } from '@/server/queries/restaurants'
import { RestaurantEditor } from '@/components/dashboard/restaurants/restaurant-editor'

interface EditRestaurantPageProps {
  params: Promise<{
    id: string
  }>
}

const statusConfig = {
  PENDING: { label: 'Pendiente', variant: 'warning' as const },
  APPROVED: { label: 'Aprobado', variant: 'success' as const },
  REJECTED: { label: 'Rechazado', variant: 'destructive' as const },
  ARCHIVED: { label: 'Archivado', variant: 'secondary' as const },
}

export default async function EditRestaurantPage({ params }: EditRestaurantPageProps) {
  const { id } = await params
  const user = await getCurrentUser()

  if (!user) {
    redirect('/sign-in')
  }

  // Verificar permisos
  const hasPermission = await canEditRestaurant(id)
  if (!hasPermission) {
    redirect('/dashboard/restaurants')
  }

  // Obtener todas las taxonomías disponibles
  const [cuisineTypes, features, dietary, ambiances] = await Promise.all([
    getTaxonomies('CUISINE_TYPE'),
    getTaxonomies('RESTAURANT_FEATURE'),
    getTaxonomies('DIETARY'),
    getTaxonomies('AMBIANCE'),
  ])

  // Obtener restaurante con todas sus relaciones
  const restaurantRaw = await prisma.restaurant.findUnique({
    where: { id },
    include: {
      openingHours: true,
      taxonomies: {
        include: {
          taxonomy: true,
        },
      },
    },
  })

  if (!restaurantRaw) {
    notFound()
  }

  // Serializar datos para el cliente (evitar problemas con Date y Decimal)
  const restaurant = JSON.parse(JSON.stringify({
    ...restaurantRaw,
    openingHours: restaurantRaw.openingHours.map(h => ({
      ...h,
      openTime: h.openTime ? h.openTime : undefined,
      closeTime: h.closeTime ? h.closeTime : undefined,
    }))
  }))

  // Obtener menús disponibles y asignados
  const availableMenusRaw = await prisma.menu.findMany({
    where: { ownerId: user.id },
    orderBy: { title: 'asc' },
  })
  const availableMenus = JSON.parse(JSON.stringify(availableMenusRaw))

  const assignedMenusRaw = await prisma.restaurantMenu.findMany({
    where: { restaurantId: id },
    include: {
      menu: true,
    },
  })
  const assignedMenus = assignedMenusRaw.map(m => ({
    ...JSON.parse(JSON.stringify(m.menu)),
    assignedAt: m.assignedAt.toISOString(),
  }))

  const status = statusConfig[restaurant.status as keyof typeof statusConfig] || statusConfig.PENDING

  return (
    <div className="space-y-6 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      {/* Header */}
      <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
        <div className="flex items-center gap-4">
          <Button variant="outline" size="icon" asChild className="rounded-full shadow-sm">
            <Link href="/dashboard/restaurants">
              <ChevronLeft className="h-5 w-5" />
            </Link>
          </Button>
          <div>
            <div className="flex items-center gap-3">
              <h1 className="text-3xl font-bold tracking-tight">{restaurant.name}</h1>
              <Badge variant={status.variant} className="rounded-full px-3 py-0.5">
                {status.label}
              </Badge>
            </div>
            <div className="flex items-center gap-4 mt-1">
              <p className="text-muted-foreground">
                Configuración y gestión del restaurante
              </p>
              <Button variant="link" size="sm" asChild className="h-auto p-0 text-pink-500 hover:text-pink-600">
                <Link
                  href={`/restaurants/${restaurant.slug}`}
                  target="_blank"
                  className="flex items-center gap-1"
                >
                  Ver página pública
                  <ExternalLink className="h-3.5 w-3.5" />
                </Link>
              </Button>
            </div>
          </div>
        </div>
      </div>

      {/* Status Alert Cards */}
      {restaurant.status === 'PENDING' && (
        <Card className="border-warning/20 bg-warning/5 overflow-hidden border-l-4 border-l-yellow-400">
          <CardHeader className="py-4">
            <CardTitle className="text-lg flex items-center gap-2">
              <span className="h-2 w-2 rounded-full animate-pulse bg-yellow-400" />
              Pendiente de Aprobación
            </CardTitle>
            <CardDescription>
              Tu restaurante está siendo revisado por nuestro equipo. Te notificaremos cuando el proceso esté completo.
            </CardDescription>
          </CardHeader>
        </Card>
      )}

      {restaurant.status === 'REJECTED' && (
        <Card className="border-destructive/20 bg-destructive/5 overflow-hidden border-l-4 border-l-red-500">
          <CardHeader className="py-4">
            <CardTitle className="text-lg">Rechazado</CardTitle>
            <CardDescription>
              Tu restaurante no ha sido aprobado. Por favor, revisa la información y vuelve a enviarlo para revisión.
            </CardDescription>
          </CardHeader>
        </Card>
      )}

      {/* Main Modular Editor */}
      <RestaurantEditor
        restaurant={restaurant}
        taxonomies={{
          cuisineTypes,
          features,
          dietary,
          ambiances
        }}
        availableMenus={availableMenus}
        assignedMenus={assignedMenus}
      />
    </div>
  )
}
