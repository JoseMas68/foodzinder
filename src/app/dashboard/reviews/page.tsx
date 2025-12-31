import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { ReviewList } from "@/components/reviews/review-list";
import { Star } from "lucide-react";

export default async function MyReviewsPage() {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  const reviews = await prisma.review.findMany({
    where: { userId: user.id },
    include: {
      user: {
        select: {
          firstName: true,
          lastName: true,
        },
      },
      restaurant: {
        select: {
          name: true,
          slug: true,
          logoUrl: true,
        },
      },
    },
    orderBy: {
      createdAt: "desc",
    },
  });

  // Mark all as own reviews
  const reviewsWithOwnership = reviews.map(review => ({
    ...review,
    isOwnReview: true,
  }));

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-heading font-bold">Mis Reseñas</h1>
        <p className="text-gray-500 mt-1">
          Gestiona las reseñas que has dejado en los restaurantes
        </p>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Star className="h-5 w-5 text-yellow-400" />
            Tus Reseñas ({reviews.length})
          </CardTitle>
          <CardDescription>
            Puedes editar o eliminar tus reseñas en cualquier momento
          </CardDescription>
        </CardHeader>
        <CardContent>
          {reviews.length === 0 ? (
            <div className="text-center py-12 text-gray-500">
              <Star className="h-12 w-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">No has dejado ninguna reseña</p>
              <p className="text-sm mt-1">
                Visita un restaurante y comparte tu experiencia
              </p>
            </div>
          ) : (
            <div className="space-y-6">
              {reviewsWithOwnership.map((review) => (
                <div key={review.id} className="border-b last:border-0 pb-6 last:pb-0">
                  <div className="mb-4">
                    <a
                      href={`/restaurants/${review.restaurant.slug}`}
                      className="text-lg font-semibold hover:text-primary transition-colors inline-flex items-center gap-3"
                    >
                      {review.restaurant.logoUrl && (
                        <img
                          src={review.restaurant.logoUrl}
                          alt={review.restaurant.name}
                          className="w-10 h-10 rounded-full object-cover"
                        />
                      )}
                      {review.restaurant.name}
                    </a>
                  </div>
                  <ReviewList reviews={[review]} />
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
