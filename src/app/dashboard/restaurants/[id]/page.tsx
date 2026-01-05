import { redirect, notFound } from 'next/navigation'
import { getCurrentUser, canEditRestaurant } from '@/lib/auth/roles'
import { updateRestaurant } from '@/server/actions/restaurants'
import { prisma } from '@/lib/prisma'
import { RestaurantForm } from '@/components/dashboard/restaurants/restaurant-form'
import { RestaurantMenus } from '@/components/dashboard/restaurants/restaurant-menus'
import { RestaurantManagementTabs } from '@/components/dashboard/restaurants/restaurant-management-tabs'
import { Card, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Separator } from '@/components/ui/separator'
import Link from 'next/link'
import { ChevronLeft, ExternalLink } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { getTaxonomies } from '@/server/queries/restaurants'

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
  const restaurant = await prisma.restaurant.findUnique({
    where: { id },
    select: {
      id: true,
      name: true,
      slug: true,
      description: true,
      address: true,
      latitude: true,
      longitude: true,
      priceRange: true,
      phone: true,
      website: true,
      status: true,
      logoUrl: true,
      coverUrl: true,
      openingHours: {
        select: {
          dayOfWeek: true,
          openTime: true,
          closeTime: true,
          isClosed: true,
        },
        orderBy: {
          dayOfWeek: 'asc',
        },
      },
      taxonomies: {
        select: {
          taxonomyId: true,
          taxonomy: {
            select: {
              type: true,
            },
          },
        },
      },
    },
  })

  if (!restaurant) {
    notFound()
  }

  async function handleUpdateRestaurant(data: any) {
    'use server'

    const result = await updateRestaurant(id, data)

    if (result.success) {
      redirect('/dashboard/restaurants')
    }

    return result
  }

  const status = statusConfig[restaurant.status as keyof typeof statusConfig]

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="space-y-4">
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" asChild>
            <Link href="/dashboard/restaurants">
              <ChevronLeft className="h-5 w-5" />
            </Link>
          </Button>
          <div className="flex-1">
            <div className="flex flex-wrap items-center gap-3">
              <h1 className="text-3xl font-bold">{restaurant.name}</h1>
              <Badge variant={status.variant}>{status.label}</Badge>
            </div>
            <div className="mt-1 flex flex-wrap items-center gap-4">
              <p className="text-muted-foreground">
                Edita la información de tu restaurante
              </p>
              <Button variant="link" size="sm" asChild className="h-auto p-0">
                <Link
                  href={`/restaurants/${restaurant.slug}`}
                  target="_blank"
                  className="flex items-center gap-1"
                >
                  Ver página pública
                  <ExternalLink className="h-3 w-3" />
                </Link>
              </Button>
            </div>
          </div>
        </div>
        <RestaurantManagementTabs restaurantId={id} />
      </div>

      {/* Status Info */}
      {restaurant.status === 'PENDING' && (
        <Card className="border-warning/20 bg-warning/5">
          <CardHeader>
            <CardTitle className="text-lg">Pendiente de Aprobación</CardTitle>
            <CardDescription>
              Tu restaurante está siendo revisado por nuestro equipo. Te notificaremos cuando
              el proceso esté completo.
            </CardDescription>
          </CardHeader>
        </Card>
      )}

      {restaurant.status === 'REJECTED' && (
        <Card className="border-destructive/20 bg-destructive/5">
          <CardHeader>
            <CardTitle className="text-lg">Rechazado</CardTitle>
            <CardDescription>
              Tu restaurante no ha sido aprobado. Por favor, revisa la información y vuelve
              a enviarlo para revisión.
            </CardDescription>
          </CardHeader>
        </Card>
      )}

      {/* Form */}
      <RestaurantForm
        initialData={{
          name: restaurant.name,
          description: restaurant.description,
          address: restaurant.address,
          latitude: restaurant.latitude || undefined,
          longitude: restaurant.longitude || undefined,
          priceRange: restaurant.priceRange,
          phone: restaurant.phone || undefined,
          website: restaurant.website || undefined,
          logoUrl: restaurant.logoUrl || undefined,
          coverUrl: restaurant.coverUrl || undefined,
          cuisineTypeIds: restaurant.taxonomies.filter(t => t.taxonomy.type === 'CUISINE_TYPE').map(t => t.taxonomyId),
          featureIds: restaurant.taxonomies.filter(t => t.taxonomy.type === 'RESTAURANT_FEATURE').map(t => t.taxonomyId),
          dietaryIds: restaurant.taxonomies.filter(t => t.taxonomy.type === 'DIETARY').map(t => t.taxonomyId),
          ambianceIds: restaurant.taxonomies.filter(t => t.taxonomy.type === 'AMBIANCE').map(t => t.taxonomyId),
          openingHours: restaurant.openingHours.map(h => ({
            dayOfWeek: h.dayOfWeek,
            openTime: h.openTime || undefined,
            closeTime: h.closeTime || undefined,
            isClosed: h.isClosed,
          })),
        }}
        onSubmit={handleUpdateRestaurant}
        isEditing
        cuisineTypes={cuisineTypes}
        features={features}
        dietary={dietary}
        ambiances={ambiances}
      />

      <Separator className="my-8" />

      {/* Menus Section */}
      <RestaurantMenus
        restaurantId={id}
        availableMenus={(await prisma.menu.findMany({
          where: { ownerId: user.id },
          select: {
            id: true,
            title: true,
            description: true,
            price: true,
            isActive: true,
          },
          orderBy: { title: 'asc' },
        })).map(m => ({
          ...m,
          price: m.price ? Number(m.price) : null,
        }))}
        assignedMenus={(await prisma.restaurantMenu.findMany({
          where: { restaurantId: id },
          include: {
            menu: {
              select: {
                id: true,
                title: true,
                description: true,
                price: true,
                isActive: true,
              },
            },
          },
        })).map(m => ({
          ...m.menu,
          price: m.menu.price ? Number(m.menu.price) : null,
          assignedAt: m.assignedAt,
        }))}
      />
    </div>
  )
}
