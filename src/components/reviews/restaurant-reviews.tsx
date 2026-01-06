'use client'

import { useState } from "react";
import { ReviewForm } from "./review-form";
import { ReviewList } from "./review-list";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Star, MessageSquare } from "lucide-react";
import { SignInButton } from "@/components/auth/clerk-buttons";

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

interface RestaurantReviewsProps {
  restaurantId: string;
  reviews: Review[];
  isAuthenticated: boolean;
  hasUserReviewed: boolean;
  averageRating: number;
  totalReviews: number;
}

export function RestaurantReviews({
  restaurantId,
  reviews,
  isAuthenticated,
  hasUserReviewed,
  averageRating,
  totalReviews,
}: RestaurantReviewsProps) {
  const [showForm, setShowForm] = useState(false);
  const [editingReview, setEditingReview] = useState<Review | null>(null);

  const handleEdit = (review: Review) => {
    setEditingReview(review);
    setShowForm(true);
  };

  const handleSuccess = () => {
    setShowForm(false);
    setEditingReview(null);
  };

  const handleCancel = () => {
    setShowForm(false);
    setEditingReview(null);
  };

  return (
    <div className="space-y-6">
      {/* Rating Summary */}
      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle className="flex items-center gap-2">
              <Star className="h-6 w-6 text-yellow-400 fill-yellow-400" />
              Reseñas
            </CardTitle>
            <div className="text-right">
              <div className="text-3xl font-bold text-gray-900">
                {totalReviews > 0 ? averageRating.toFixed(1) : "—"}
              </div>
              <div className="text-sm text-gray-500">
                {totalReviews} {totalReviews === 1 ? "reseña" : "reseñas"}
              </div>
            </div>
          </div>
        </CardHeader>
      </Card>

      {/* Write Review Section */}
      {isAuthenticated ? (
        !hasUserReviewed && !showForm ? (
          <Card>
            <CardContent className="p-6">
              <div className="flex items-center justify-between">
                <div>
                  <h3 className="font-semibold text-lg mb-1">
                    Comparte tu experiencia
                  </h3>
                  <p className="text-sm text-gray-600">
                    ¿Has visitado este restaurante? Deja tu opinión
                  </p>
                </div>
                <Button onClick={() => setShowForm(true)}>
                  <MessageSquare className="h-4 w-4 mr-2" />
                  Escribir Reseña
                </Button>
              </div>
            </CardContent>
          </Card>
        ) : showForm ? (
          <Card>
            <CardHeader>
              <CardTitle>
                {editingReview ? "Editar Reseña" : "Nueva Reseña"}
              </CardTitle>
            </CardHeader>
            <CardContent>
              <ReviewForm
                restaurantId={restaurantId}
                initialData={editingReview ? {
                  id: editingReview.id,
                  rating: editingReview.rating,
                  comment: editingReview.comment,
                  photos: editingReview.photos,
                } : undefined}
                onSuccess={handleSuccess}
                onCancel={handleCancel}
              />
            </CardContent>
          </Card>
        ) : null
      ) : (
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center justify-between">
              <div>
                <h3 className="font-semibold text-lg mb-1">
                  Comparte tu experiencia
                </h3>
                <p className="text-sm text-gray-600">
                  Inicia sesión para dejar una reseña
                </p>
              </div>
              <SignInButton>
                <Button>Iniciar Sesión</Button>
              </SignInButton>
            </div>
          </CardContent>
        </Card>
      )}

      {/* Reviews List */}
      <ReviewList
        reviews={reviews}
        onEdit={handleEdit}
      />
    </div>
  );
}
