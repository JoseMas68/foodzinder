'use client'

import { Star, Edit, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { cn } from "@/lib/utils";
import { formatDistanceToNow } from "date-fns";
import { es } from "date-fns/locale";
import { useState } from "react";
import { useRouter } from "next/navigation";

interface Review {
  id: string;
  rating: number;
  comment: string;
  photos: string[];
  createdAt: Date | string;
  user: {
    firstName: string;
    lastName: string;
  };
  isOwnReview?: boolean;
}

interface ReviewListProps {
  reviews: Review[];
  onEdit?: (review: Review) => void;
}

export function ReviewList({ reviews, onEdit }: ReviewListProps) {
  const router = useRouter();
  const [deletingId, setDeletingId] = useState<string | null>(null);

  const handleDelete = async (reviewId: string) => {
    if (!confirm("¿Estás seguro de que quieres eliminar esta reseña?")) {
      return;
    }

    setDeletingId(reviewId);

    try {
      const response = await fetch(`/api/reviews/${reviewId}`, {
        method: "DELETE",
      });

      if (!response.ok) {
        throw new Error("Failed to delete review");
      }

      router.refresh();
    } catch (error) {
      console.error("Error deleting review:", error);
      alert("Error al eliminar la reseña");
    } finally {
      setDeletingId(null);
    }
  };

  if (reviews.length === 0) {
    return (
      <div className="text-center py-12 text-gray-500">
        <Star className="h-12 w-12 mx-auto mb-3 text-gray-300" />
        <p className="font-medium">No hay reseñas todavía</p>
        <p className="text-sm mt-1">Sé el primero en compartir tu experiencia</p>
      </div>
    );
  }

  return (
    <div className="space-y-4">
      {reviews.map((review) => {
        const createdDate = typeof review.createdAt === 'string'
          ? new Date(review.createdAt)
          : review.createdAt;

        return (
          <Card key={review.id}>
            <CardContent className="p-6">
              <div className="flex items-start justify-between">
                <div className="flex-1">
                  {/* User Info & Rating */}
                  <div className="flex items-center gap-3 mb-3">
                    <div className="flex items-center justify-center w-10 h-10 rounded-full bg-primary text-white font-semibold">
                      {review.user.firstName[0]}{review.user.lastName[0]}
                    </div>
                    <div className="flex-1">
                      <p className="font-semibold text-gray-900">
                        {review.user.firstName} {review.user.lastName}
                      </p>
                      <div className="flex items-center gap-2">
                        <div className="flex">
                          {[1, 2, 3, 4, 5].map((star) => (
                            <Star
                              key={star}
                              className={cn(
                                "h-4 w-4",
                                star <= review.rating
                                  ? "text-yellow-400 fill-yellow-400"
                                  : "text-gray-300"
                              )}
                            />
                          ))}
                        </div>
                        <span className="text-sm text-gray-500">
                          {formatDistanceToNow(createdDate, {
                            addSuffix: true,
                            locale: es,
                          })}
                        </span>
                      </div>
                    </div>
                  </div>

                  {/* Comment */}
                  <p className="text-gray-700 leading-relaxed whitespace-pre-wrap">
                    {review.comment}
                  </p>

                  {/* Photos */}
                  {review.photos && review.photos.length > 0 && (
                    <div className="grid grid-cols-2 sm:grid-cols-3 gap-2 mt-4">
                      {review.photos.map((photo, idx) => (
                        <img
                          key={idx}
                          src={photo}
                          alt={`Foto ${idx + 1}`}
                          className="rounded-lg object-cover aspect-video w-full"
                        />
                      ))}
                    </div>
                  )}
                </div>

                {/* Action Buttons */}
                {review.isOwnReview && (
                  <div className="flex gap-2 ml-4">
                    {onEdit && (
                      <Button
                        variant="ghost"
                        size="icon"
                        onClick={() => onEdit(review)}
                      >
                        <Edit className="h-4 w-4" />
                      </Button>
                    )}
                    <Button
                      variant="ghost"
                      size="icon"
                      onClick={() => handleDelete(review.id)}
                      disabled={deletingId === review.id}
                    >
                      <Trash2 className="h-4 w-4" />
                    </Button>
                  </div>
                )}
              </div>
            </CardContent>
          </Card>
        );
      })}
    </div>
  );
}
