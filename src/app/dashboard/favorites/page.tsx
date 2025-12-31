import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Heart, MapPin, Star } from "lucide-react";
import Link from "next/link";
import Image from "next/image";

export default async function FavoritesPage() {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  const favorites = await prisma.favorite.findMany({
    where: { userId: user.id },
    include: {
      restaurant: {
        include: {
          taxonomies: {
            include: {
              taxonomy: true,
            },
          },
          reviews: {
            select: {
              rating: true,
            },
          },
        },
      },
    },
    orderBy: {
      createdAt: "desc",
    },
  });

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-heading font-bold">Mis Favoritos</h1>
        <p className="text-gray-500 mt-1">
          Restaurantes que has guardado para visitar más tarde
        </p>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Heart className="h-5 w-5 text-red-500 fill-red-500" />
            Restaurantes Guardados ({favorites.length})
          </CardTitle>
          <CardDescription>
            Accede rápidamente a tus restaurantes favoritos
          </CardDescription>
        </CardHeader>
        <CardContent>
          {favorites.length === 0 ? (
            <div className="text-center py-12 text-gray-500">
              <Heart className="h-12 w-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">No tienes favoritos guardados</p>
              <p className="text-sm mt-1">
                Explora restaurantes y guarda tus favoritos con el botón ❤️
              </p>
              <Link
                href="/"
                className="inline-block mt-4 text-primary hover:underline"
              >
                Explorar Restaurantes →
              </Link>
            </div>
          ) : (
            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-6">
              {favorites.map(({ restaurant, createdAt }) => {
                const averageRating = restaurant.reviews.length > 0
                  ? restaurant.reviews.reduce((acc, r) => acc + r.rating, 0) / restaurant.reviews.length
                  : 0;

                return (
                  <Link
                    key={restaurant.id}
                    href={`/restaurants/${restaurant.slug}`}
                    className="group block"
                  >
                    <Card className="overflow-hidden hover:shadow-lg transition-shadow">
                      {/* Image */}
                      <div className="relative h-48 bg-gray-100">
                        {restaurant.coverUrl ? (
                          <Image
                            src={restaurant.coverUrl}
                            alt={restaurant.name}
                            fill
                            className="object-cover group-hover:scale-105 transition-transform duration-300"
                          />
                        ) : (
                          <div className="absolute inset-0 bg-gradient-to-br from-primary/20 to-primary/5" />
                        )}

                        {/* Logo overlay */}
                        {restaurant.logoUrl && (
                          <div className="absolute bottom-4 left-4">
                            <div className="w-16 h-16 rounded-full overflow-hidden border-4 border-white shadow-lg">
                              <Image
                                src={restaurant.logoUrl}
                                alt={`${restaurant.name} logo`}
                                width={64}
                                height={64}
                                className="object-cover"
                              />
                            </div>
                          </div>
                        )}
                      </div>

                      {/* Content */}
                      <CardContent className="p-4">
                        <h3 className="font-bold text-lg mb-2 group-hover:text-primary transition-colors">
                          {restaurant.name}
                        </h3>

                        <p className="text-sm text-gray-600 mb-3 line-clamp-2">
                          {restaurant.description}
                        </p>

                        {/* Location */}
                        <div className="flex items-start gap-2 text-sm text-gray-600 mb-3">
                          <MapPin className="h-4 w-4 mt-0.5 flex-shrink-0" />
                          <span className="line-clamp-1">{restaurant.address}</span>
                        </div>

                        {/* Rating */}
                        {restaurant.reviews.length > 0 && (
                          <div className="flex items-center gap-2 mb-3">
                            <div className="flex items-center gap-1">
                              <Star className="h-4 w-4 fill-yellow-400 text-yellow-400" />
                              <span className="font-semibold text-sm">
                                {averageRating.toFixed(1)}
                              </span>
                            </div>
                            <span className="text-sm text-gray-500">
                              ({restaurant.reviews.length} {restaurant.reviews.length === 1 ? 'reseña' : 'reseñas'})
                            </span>
                          </div>
                        )}

                        {/* Cuisines */}
                        {restaurant.taxonomies.length > 0 && (
                          <div className="flex flex-wrap gap-2">
                            {restaurant.taxonomies.slice(0, 3).map((t) => (
                              <Badge key={t.taxonomyId} variant="secondary" className="text-xs">
                                {t.taxonomy.name}
                              </Badge>
                            ))}
                            {restaurant.taxonomies.length > 3 && (
                              <Badge variant="secondary" className="text-xs">
                                +{restaurant.taxonomies.length - 3}
                              </Badge>
                            )}
                          </div>
                        )}
                      </CardContent>
                    </Card>
                  </Link>
                );
              })}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
