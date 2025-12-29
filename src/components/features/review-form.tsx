"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { RatingWidget } from "./rating-widget";
import { createReview } from "@/server/actions/reviews";
import { Star } from "lucide-react";

interface ReviewFormProps {
  restaurantId: string;
  restaurantName: string;
  hasExistingReview?: boolean;
}

export function ReviewForm({
  restaurantId,
  restaurantName,
  hasExistingReview = false,
}: ReviewFormProps) {
  const [open, setOpen] = useState(false);
  const [rating, setRating] = useState(0);
  const [comment, setComment] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);

    // Validación client-side
    if (rating === 0) {
      setError("Debes seleccionar una calificación");
      return;
    }

    if (comment.trim().length < 10) {
      setError("El comentario debe tener al menos 10 caracteres");
      return;
    }

    setLoading(true);

    const result = await createReview(restaurantId, {
      rating,
      comment: comment.trim(),
    });

    setLoading(false);

    if (!result.success) {
      setError(result.error || "Error al crear la reseña");
      return;
    }

    // Éxito: cerrar modal y resetear form
    setOpen(false);
    setRating(0);
    setComment("");
    router.refresh(); // Recargar datos del server component
  };

  if (hasExistingReview) {
    return (
      <Button disabled variant="outline">
        Ya has dejado una reseña
      </Button>
    );
  }

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button className="gap-2">
          <Star className="h-4 w-4" />
          Escribir reseña
        </Button>
      </DialogTrigger>
      <DialogContent className="sm:max-w-[500px]">
        <DialogHeader>
          <DialogTitle>Escribe una reseña</DialogTitle>
          <DialogDescription>
            Comparte tu experiencia en {restaurantName}
          </DialogDescription>
        </DialogHeader>

        <form onSubmit={handleSubmit} className="space-y-6 mt-4">
          {/* Rating */}
          <div className="space-y-2">
            <Label>Calificación *</Label>
            <div className="flex items-center gap-2">
              <RatingWidget
                rating={rating}
                interactive
                onChange={(newRating) => setRating(newRating)}
                size="lg"
              />
              {rating > 0 && (
                <span className="text-sm text-muted-foreground">
                  {rating} {rating === 1 ? "estrella" : "estrellas"}
                </span>
              )}
            </div>
          </div>

          {/* Comment */}
          <div className="space-y-2">
            <Label htmlFor="comment">Comentario *</Label>
            <Textarea
              id="comment"
              placeholder="Cuéntanos sobre tu experiencia..."
              value={comment}
              onChange={(e) => setComment(e.target.value)}
              rows={5}
              required
              minLength={10}
            />
            <p className="text-xs text-muted-foreground">
              Mínimo 10 caracteres ({comment.length}/10)
            </p>
          </div>

          {/* Error message */}
          {error && (
            <div className="bg-destructive/10 text-destructive text-sm p-3 rounded-md">
              {error}
            </div>
          )}

          {/* Actions */}
          <div className="flex gap-3 justify-end">
            <Button
              type="button"
              variant="outline"
              onClick={() => setOpen(false)}
              disabled={loading}
            >
              Cancelar
            </Button>
            <Button type="submit" disabled={loading}>
              {loading ? "Enviando..." : "Publicar reseña"}
            </Button>
          </div>
        </form>
      </DialogContent>
    </Dialog>
  );
}
