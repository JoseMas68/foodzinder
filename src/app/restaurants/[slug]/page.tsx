import { notFound } from 'next/navigation'
import { prisma } from '@/lib/prisma'
import { PublicHeader } from '@/components/layout/public-header'
import { HomeFooter } from '@/components/home'
import { RestaurantReviews } from '@/components/reviews/restaurant-reviews'
import { FavoriteButton } from '@/components/favorites/favorite-button'
import { BookingForm } from '@/components/features/booking-form'
import { auth } from '@clerk/nextjs/server'
import Image from 'next/image'
import {
  MapPin,
  Phone,
  Globe,
  Clock,
  Euro,
  Star,
  Heart,
  Share2,
  ChevronLeft,
  UtensilsCrossed
} from 'lucide-react'
import { Button } from '@/components/ui/button'
import { Badge } from '@/components/ui/badge'
import { Card, CardContent } from '@/components/ui/card'
import Link from 'next/link'

interface RestaurantPageProps {
  params: Promise<{
    slug: string
  }>
}

const DAYS = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']

const priceRangeConfig = {
  CHEAP: { label: '€', description: 'Económico' },
  MODERATE: { label: '€€', description: 'Moderado' },
  EXPENSIVE: { label: '€€€', description: 'Caro' },
  LUXURY: { label: '€€€€', description: 'Lujo' },
}

export default async function RestaurantPage({ params }: RestaurantPageProps) {
  const { slug } = await params
  const { userId } = await auth()

  // Get current user if authenticated
  const currentUser = userId ? await prisma.user.findUnique({
    where: { clerkId: userId },
    select: {
      id: true,
      firstName: true,
      lastName: true,
      email: true
    }
  }) : null

  // Obtener restaurante con todas sus relaciones
  const restaurant = await prisma.restaurant.findUnique({
    where: {
      slug,
      status: 'APPROVED' // Solo mostrar restaurantes aprobados
    },
    include: {
      owner: {
        select: {
          firstName: true,
          lastName: true,
        },
      },
      openingHours: {
        orderBy: {
          dayOfWeek: 'asc',
        },
      },
      taxonomies: {
        include: {
          taxonomy: {
            select: {
              name: true,
              slug: true,
            },
          },
        },
      },
      reviews: {
        include: {
          user: {
            select: {
              firstName: true,
              lastName: true,
            },
          },
        },
        orderBy: {
          createdAt: 'desc',
        },
      },
      menus: {
        where: {
          menu: {
            isActive: true,
          },
        },
        include: {
          menu: {
            include: {
              dishes: {
                orderBy: {
                  order: 'asc',
                },
              },
            },
          },
        },
      },
      bookingServices: {
        where: {
          isActive: true,
        },
        include: {
          slots: {
            orderBy: {
              startTime: 'asc',
            },
          },
        },
      },
    },
  })

  if (!restaurant) {
    notFound()
  }

  // Calcular rating promedio
  const averageRating = restaurant.reviews.length > 0
    ? restaurant.reviews.reduce((acc, r) => acc + r.rating, 0) / restaurant.reviews.length
    : 0

  // Check if current user has already reviewed
  const hasUserReviewed = currentUser
    ? restaurant.reviews.some(r => r.userId === currentUser.id)
    : false

  // Mark own reviews
  const reviewsWithOwnership = restaurant.reviews.map(review => ({
    ...review,
    isOwnReview: currentUser ? review.userId === currentUser.id : false,
  }))

  // Check if restaurant is in user's favorites
  const isFavorite = currentUser
    ? await prisma.favorite.findUnique({
        where: {
          userId_restaurantId: {
            userId: currentUser.id,
            restaurantId: restaurant.id,
          },
        },
      }).then(f => !!f)
    : false

  const priceRange = priceRangeConfig[restaurant.priceRange]

  return (
    <div className="flex flex-col min-h-screen bg-gray-50">
      <PublicHeader />

      <main className="flex-1">
        {/* Hero Section con Cover Image */}
        <section className="relative h-[400px] bg-gray-900">
          {restaurant.coverUrl ? (
            <Image
              src={restaurant.coverUrl}
              alt={restaurant.name}
              fill
              className="object-cover opacity-90"
              priority
            />
          ) : (
            <div className="absolute inset-0 bg-gradient-to-br from-primary/20 to-primary/5" />
          )}

          {/* Overlay oscuro para legibilidad */}
          <div className="absolute inset-0 bg-gradient-to-t from-black/60 via-black/20 to-transparent" />

          {/* Botón de volver */}
          <div className="absolute top-6 left-6">
            <Button variant="secondary" size="sm" asChild>
              <Link href="/" className="flex items-center gap-2">
                <ChevronLeft className="h-4 w-4" />
                Volver
              </Link>
            </Button>
          </div>

          {/* Botones de acción */}
          <div className="absolute top-6 right-6 flex gap-2">
            <FavoriteButton
              restaurantId={restaurant.id}
              initialIsFavorite={isFavorite}
              isAuthenticated={!!userId}
            />
            <Button variant="secondary" size="icon">
              <Share2 className="h-4 w-4" />
            </Button>
          </div>

          {/* Información del restaurante superpuesta */}
          <div className="absolute bottom-0 left-0 right-0 p-8 text-white">
            <div className="container mx-auto">
              <div className="flex items-end gap-6">
                {/* Logo */}
                {restaurant.logoUrl && (
                  <div className="w-32 h-32 rounded-2xl overflow-hidden border-4 border-white shadow-2xl bg-white flex-shrink-0">
                    <Image
                      src={restaurant.logoUrl}
                      alt={`${restaurant.name} logo`}
                      width={128}
                      height={128}
                      className="object-cover"
                    />
                  </div>
                )}

                {/* Info */}
                <div className="flex-1 pb-2">
                  <h1 className="text-4xl md:text-5xl font-bold mb-2 drop-shadow-lg">
                    {restaurant.name}
                  </h1>

                  <div className="flex flex-wrap items-center gap-4 text-sm">
                    {/* Rating */}
                    {averageRating > 0 && (
                      <div className="flex items-center gap-1 bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full">
                        <Star className="h-4 w-4 fill-yellow-400 text-yellow-400" />
                        <span className="font-semibold">{averageRating.toFixed(1)}</span>
                        <span className="text-white/70">({restaurant.reviews.length})</span>
                      </div>
                    )}

                    {/* Price Range */}
                    <div className="flex items-center gap-2 bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full">
                      <Euro className="h-4 w-4" />
                      <span className="font-semibold">{priceRange.label}</span>
                      <span className="text-white/70">{priceRange.description}</span>
                    </div>

                    {/* Cuisine Types */}
                    {restaurant.taxonomies.slice(0, 3).map((t) => (
                      <Badge key={t.taxonomyId} variant="secondary" className="bg-white/20 backdrop-blur-sm border-0">
                        {t.taxonomy.name}
                      </Badge>
                    ))}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Contenido Principal */}
        <section className="container mx-auto px-4 py-12">
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            {/* Columna Principal */}
            <div className="lg:col-span-2 space-y-8">
              {/* Descripción */}
              <Card>
                <CardContent className="p-8">
                  <h2 className="text-2xl font-bold mb-4">Sobre este restaurante</h2>
                  <p className="text-gray-700 leading-relaxed whitespace-pre-line">
                    {restaurant.description}
                  </p>
                </CardContent>
              </Card>

              {/* Menús */}
              {restaurant.menus.length > 0 && (
                <Card>
                  <CardContent className="p-8">
                    <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
                      <UtensilsCrossed className="h-6 w-6 text-primary" />
                      Menús
                    </h2>
                    <div className="space-y-8">
                      {restaurant.menus.map(({ menu }) => (
                        <div key={menu.id} className="border-b last:border-0 pb-6 last:pb-0">
                          <div className="flex justify-between items-start mb-4">
                            <div>
                              <h3 className="text-xl font-semibold text-gray-900">{menu.title}</h3>
                              {menu.description && (
                                <p className="text-gray-600 mt-1">{menu.description}</p>
                              )}
                            </div>
                            {menu.price && (
                              <div className="text-right">
                                <div className="text-2xl font-bold text-primary">
                                  {new Intl.NumberFormat('es-ES', {
                                    style: 'currency',
                                    currency: 'EUR',
                                  }).format(Number(menu.price))}
                                </div>
                                <p className="text-xs text-gray-500">Menú completo</p>
                              </div>
                            )}
                          </div>

                          {/* Platos del menú */}
                          {menu.dishes.length > 0 && (
                            <div className="mt-4 space-y-3">
                              {menu.dishes.map((dish) => (
                                <div
                                  key={dish.id}
                                  className="flex justify-between items-start gap-4 p-3 rounded-lg hover:bg-gray-50 transition-colors"
                                >
                                  <div className="flex-1">
                                    <h4 className="font-medium text-gray-900">{dish.name}</h4>
                                    {dish.description && (
                                      <p className="text-sm text-gray-600 mt-1">{dish.description}</p>
                                    )}
                                    {dish.allergens.length > 0 && (
                                      <div className="flex flex-wrap gap-1 mt-2">
                                        {dish.allergens.map((allergen, idx) => (
                                          <Badge key={idx} variant="outline" className="text-xs">
                                            {allergen}
                                          </Badge>
                                        ))}
                                      </div>
                                    )}
                                  </div>
                                  {!menu.price && (
                                    <div className="text-right flex-shrink-0">
                                      <span className="font-semibold text-gray-900">
                                        {new Intl.NumberFormat('es-ES', {
                                          style: 'currency',
                                          currency: 'EUR',
                                        }).format(Number(dish.price))}
                                      </span>
                                    </div>
                                  )}
                                </div>
                              ))}
                            </div>
                          )}
                        </div>
                      ))}
                    </div>
                  </CardContent>
                </Card>
              )}

              {/* Horarios */}
              <Card>
                <CardContent className="p-8">
                  <h2 className="text-2xl font-bold mb-6 flex items-center gap-2">
                    <Clock className="h-6 w-6 text-primary" />
                    Horarios de Apertura
                  </h2>
                  <div className="space-y-3">
                    {restaurant.openingHours.length > 0 ? (
                      restaurant.openingHours.map((hours) => (
                        <div
                          key={hours.id}
                          className="flex justify-between items-center py-2 border-b last:border-0"
                        >
                          <span className="font-medium text-gray-900">
                            {DAYS[hours.dayOfWeek]}
                          </span>
                          <span className="text-gray-600">
                            {hours.isClosed ? (
                              <span className="text-red-600">Cerrado</span>
                            ) : (
                              `${hours.openTime} - ${hours.closeTime}`
                            )}
                          </span>
                        </div>
                      ))
                    ) : (
                      <p className="text-gray-500 italic">Horarios no especificados</p>
                    )}
                  </div>
                </CardContent>
              </Card>

              {/* Reviews Section */}
              <RestaurantReviews
                restaurantId={restaurant.id}
                reviews={reviewsWithOwnership}
                isAuthenticated={!!userId}
                hasUserReviewed={hasUserReviewed}
                averageRating={averageRating}
                totalReviews={restaurant.reviews.length}
              />
            </div>

            {/* Sidebar de Información */}
            <div className="space-y-6">
              {/* Card de Contacto e Información */}
              <Card className="sticky top-24">
                <CardContent className="p-6 space-y-6">
                  <div>
                    <h3 className="font-bold text-lg mb-4">Información de Contacto</h3>
                    <div className="space-y-3">
                      {/* Dirección */}
                      <div className="flex items-start gap-3">
                        <MapPin className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                        <div>
                          <p className="text-sm font-medium text-gray-900">Dirección</p>
                          <p className="text-sm text-gray-600">{restaurant.address}</p>
                        </div>
                      </div>

                      {/* Teléfono */}
                      {restaurant.phone && (
                        <div className="flex items-start gap-3">
                          <Phone className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                          <div>
                            <p className="text-sm font-medium text-gray-900">Teléfono</p>
                            <a
                              href={`tel:${restaurant.phone}`}
                              className="text-sm text-primary hover:underline"
                            >
                              {restaurant.phone}
                            </a>
                          </div>
                        </div>
                      )}

                      {/* Website */}
                      {restaurant.website && (
                        <div className="flex items-start gap-3">
                          <Globe className="h-5 w-5 text-primary mt-0.5 flex-shrink-0" />
                          <div>
                            <p className="text-sm font-medium text-gray-900">Sitio Web</p>
                            <a
                              href={restaurant.website}
                              target="_blank"
                              rel="noopener noreferrer"
                              className="text-sm text-primary hover:underline break-all"
                            >
                              {restaurant.website.replace(/^https?:\/\/(www\.)?/, '')}
                            </a>
                          </div>
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Formulario de Reserva */}
                  <div className="border-t pt-6">
                    <BookingForm
                      restaurantId={restaurant.id}
                      restaurantName={restaurant.name}
                      currentUser={currentUser ? {
                        firstName: currentUser.firstName,
                        lastName: currentUser.lastName,
                        email: currentUser.email,
                      } : null}
                      services={restaurant.bookingServices.map(service => ({
                        id: service.id,
                        name: service.name,
                        description: service.description,
                        daysOfWeek: service.daysOfWeek,
                        slots: service.slots.map(slot => ({
                          id: slot.id,
                          startTime: slot.startTime,
                          endTime: slot.endTime,
                          durationMinutes: slot.durationMinutes,
                        })),
                      }))}
                    />
                  </div>

                  {/* Mapa */}
                  {restaurant.latitude && restaurant.longitude && (
                    <div className="rounded-lg overflow-hidden border h-48 bg-gray-100 flex items-center justify-center">
                      <p className="text-gray-400 text-sm">Mapa interactivo próximamente</p>
                    </div>
                  )}
                </CardContent>
              </Card>

              {/* Tipos de Cocina */}
              {restaurant.taxonomies.length > 0 && (
                <Card>
                  <CardContent className="p-6">
                    <h3 className="font-bold text-lg mb-3">Tipo de Cocina</h3>
                    <div className="flex flex-wrap gap-2">
                      {restaurant.taxonomies.map((t) => (
                        <Badge key={t.taxonomyId} variant="secondary">
                          {t.taxonomy.name}
                        </Badge>
                      ))}
                    </div>
                  </CardContent>
                </Card>
              )}
            </div>
          </div>
        </section>
      </main>

      <HomeFooter />
    </div>
  )
}
