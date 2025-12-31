import { z } from "zod";

export const reviewSchema = z.object({
  rating: z
    .number()
    .min(1, "La calificación debe ser al menos 1")
    .max(5, "La calificación no puede ser mayor a 5"),
  comment: z
    .string()
    .min(10, "El comentario debe tener al menos 10 caracteres")
    .max(1000, "El comentario no puede exceder 1000 caracteres"),
  photos: z.array(z.string().url()).max(5, "Máximo 5 fotos").optional(),
});

export const reviewFormSchema = z.object({
  rating: z.string().refine((val) => {
    const num = parseInt(val);
    return num >= 1 && num <= 5;
  }, "Selecciona una calificación del 1 al 5"),
  comment: z
    .string()
    .min(10, "El comentario debe tener al menos 10 caracteres")
    .max(1000, "El comentario no puede exceder 1000 caracteres"),
  photos: z.array(z.string().url()).max(5, "Máximo 5 fotos").optional().default([]),
});

export type ReviewFormData = z.infer<typeof reviewFormSchema>;
export type ReviewData = z.infer<typeof reviewSchema>;
