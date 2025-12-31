'use client'

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { reviewFormSchema, type ReviewFormData } from "@/lib/validations/review";
import { Button } from "@/components/ui/button";
import { Textarea } from "@/components/ui/textarea";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Star, Loader2 } from "lucide-react";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { cn } from "@/lib/utils";

interface ReviewFormProps {
  restaurantId: string;
  initialData?: {
    id: string;
    rating: number;
    comment: string;
    photos: string[];
  };
  onSuccess?: () => void;
  onCancel?: () => void;
}

export function ReviewForm({ restaurantId, initialData, onSuccess, onCancel }: ReviewFormProps) {
  const router = useRouter();
  const [isSubmitting, setIsSubmitting] = useState(false);
  const isEditing = !!initialData;

  const form = useForm<ReviewFormData>({
    resolver: zodResolver(reviewFormSchema),
    defaultValues: {
      rating: initialData?.rating.toString() || "",
      comment: initialData?.comment || "",
      photos: initialData?.photos || [],
    },
  });

  const onSubmit = async (data: ReviewFormData) => {
    setIsSubmitting(true);

    try {
      const url = isEditing ? `/api/reviews/${initialData.id}` : "/api/reviews";
      const method = isEditing ? "PATCH" : "POST";

      const payload = {
        rating: parseInt(data.rating),
        comment: data.comment,
        photos: data.photos,
        ...(isEditing ? {} : { restaurantId }),
      };

      const response = await fetch(url, {
        method,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || "Failed to save review");
      }

      router.refresh();
      if (onSuccess) {
        onSuccess();
      }
    } catch (error) {
      console.error("Error saving review:", error);
      alert(error instanceof Error ? error.message : "Error al guardar la reseña");
    } finally {
      setIsSubmitting(false);
    }
  };

  const selectedRating = form.watch("rating");

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
        <FormField
          control={form.control}
          name="rating"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Calificación *</FormLabel>
              <FormControl>
                <div className="flex gap-2">
                  {[1, 2, 3, 4, 5].map((rating) => (
                    <button
                      key={rating}
                      type="button"
                      onClick={() => field.onChange(rating.toString())}
                      className={cn(
                        "transition-all hover:scale-110",
                        parseInt(selectedRating) >= rating
                          ? "text-yellow-400"
                          : "text-gray-300"
                      )}
                    >
                      <Star
                        className="h-10 w-10"
                        fill={parseInt(selectedRating) >= rating ? "currentColor" : "none"}
                      />
                    </button>
                  ))}
                </div>
              </FormControl>
              <FormDescription>
                Haz clic en las estrellas para calificar tu experiencia
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />

        <FormField
          control={form.control}
          name="comment"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Tu Opinión *</FormLabel>
              <FormControl>
                <Textarea
                  placeholder="Cuéntanos sobre tu experiencia en este restaurante..."
                  className="min-h-[150px] resize-none"
                  {...field}
                />
              </FormControl>
              <FormDescription>
                Mínimo 10 caracteres, máximo 1000
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />

        <div className="flex gap-4">
          {onCancel && (
            <Button
              type="button"
              variant="outline"
              onClick={onCancel}
              disabled={isSubmitting}
            >
              Cancelar
            </Button>
          )}
          <Button type="submit" disabled={isSubmitting} className="flex-1">
            {isSubmitting && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            {isEditing ? "Actualizar Reseña" : "Publicar Reseña"}
          </Button>
        </div>
      </form>
    </Form>
  );
}
