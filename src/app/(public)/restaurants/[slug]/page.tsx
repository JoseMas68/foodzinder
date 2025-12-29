import { notFound } from "next/navigation";
import {
  getRestaurantWithDetails,
  getRestaurantStats,
} from "@/server/queries/restaurants";
import { RatingWidget, MenuSection } from "@/components/features";
import { Badge, Separator } from "@/components/ui";
import { formatPriceRange } from "@/lib/format";
import Image from "next/image";

interface PageProps {
  params: Promise<{ slug: string }>;
}

export default async function RestaurantDetailPage({ params }: PageProps) {
  const { slug } = await params;
  const restaurant = await getRestaurantWithDetails(slug);

  if (!restaurant) {
    notFound();
  }

  const stats = await getRestaurantStats(restaurant.id);

  return (
    <div className="container mx-auto px-4 py-8">
      {/* Hero Section */}
      <div className="relative h-64 md:h-96 w-full mb-8 bg-muted rounded-lg overflow-hidden">
        {restaurant.coverUrl ? (
          <Image
            src={restaurant.coverUrl}
            alt={restaurant.name}
            fill
            className="object-cover"
          />
        ) : (
          <div className="w-full h-full flex items-center justify-center text-muted-foreground">
            Sin imagen
          </div>
        )}
      </div>

      {/* Restaurant Info */}
      <div className="flex items-start gap-6 mb-8">
        {restaurant.logoUrl && (
          <Image
            src={restaurant.logoUrl}
            alt={`${restaurant.name} logo`}
            width={100}
            height={100}
            className="rounded-full object-cover"
          />
        )}

        <div className="flex-1">
          <h1 className="text-4xl font-bold mb-2">{restaurant.name}</h1>
          <p className="text-muted-foreground mb-4">{restaurant.description}</p>

          <div className="flex items-center gap-4 mb-4">
            <RatingWidget rating={stats.averageRating} showValue size="lg" />
            <span className="text-sm text-muted-foreground">
              ({stats.reviewCount} reseñas)
            </span>
            <span className="text-lg font-semibold">
              {formatPriceRange(restaurant.priceRange)}
            </span>
          </div>

          <div className="flex flex-wrap gap-2">
            {restaurant.taxonomies.map(({ taxonomy }) => (
              <Badge key={taxonomy.id} variant="secondary">
                {taxonomy.name}
              </Badge>
            ))}
          </div>
        </div>
      </div>

      <Separator className="my-8" />

      {/* Menus Section */}
      <section className="mb-12">
        <h2 className="text-3xl font-bold mb-6">Menús</h2>

        {restaurant.menus.length === 0 ? (
          <p className="text-muted-foreground">
            Este restaurante aún no ha publicado sus menús.
          </p>
        ) : (
          <div className="space-y-6">
            {restaurant.menus.map(({ menu }) => (
              <MenuSection
                key={menu.id}
                menu={{
                  ...menu,
                  description: menu.description || undefined,
                  price: menu.price ? Number(menu.price) : undefined,
                  dishes: menu.dishes.map((dish) => ({
                    ...dish,
                    description: dish.description || undefined,
                    price: Number(dish.price),
                    imageUrl: dish.imageUrl || undefined,
                  })),
                }}
              />
            ))}
          </div>
        )}
      </section>

      <Separator className="my-8" />

      {/* Reviews Section */}
      <section>
        <h2 className="text-3xl font-bold mb-6">Reseñas</h2>

        {restaurant.reviews.length === 0 ? (
          <p className="text-muted-foreground">
            Este restaurante aún no tiene reseñas.
          </p>
        ) : (
          <div className="space-y-6">
            {restaurant.reviews.map((review) => (
              <div key={review.id} className="border rounded-lg p-6">
                <div className="flex items-center gap-4 mb-4">
                  <div className="font-semibold">
                    {review.user.firstName || "Usuario"}
                  </div>
                  <RatingWidget rating={review.rating} size="sm" />
                  <span className="text-sm text-muted-foreground">
                    {new Date(review.createdAt).toLocaleDateString("es-ES")}
                  </span>
                </div>

                <p className="text-muted-foreground">{review.comment}</p>

                {review.photos && review.photos.length > 0 && (
                  <div className="flex gap-2 mt-4">
                    {review.photos.map((photo, idx) => (
                      <Image
                        key={idx}
                        src={photo}
                        alt={`Review photo ${idx + 1}`}
                        width={100}
                        height={100}
                        className="rounded object-cover"
                      />
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </section>
    </div>
  );
}

// Metadata
export async function generateMetadata({ params }: PageProps) {
  const { slug } = await params;
  const restaurant = await getRestaurantWithDetails(slug);

  if (!restaurant) {
    return { title: "Restaurante no encontrado" };
  }

  return {
    title: `${restaurant.name} - Foodzinder`,
    description: restaurant.description,
  };
}
