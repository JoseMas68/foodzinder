import { z } from "zod";

// Menu Schema
export const menuSchema = z.object({
  title: z.string().min(1, "El título es requerido").max(100, "El título debe tener máximo 100 caracteres"),
  description: z.string().max(500, "La descripción debe tener máximo 500 caracteres").optional(),
  price: z.string().optional().refine(
    (val) => !val || /^\d+(\.\d{1,2})?$/.test(val),
    "El precio debe ser un número válido"
  ),
  isActive: z.boolean().default(true),
});

export type MenuFormData = z.infer<typeof menuSchema>;

// Dish Schema
export const dishSchema = z.object({
  name: z.string().min(1, "El nombre es requerido").max(100, "El nombre debe tener máximo 100 caracteres"),
  description: z.string().max(500, "La descripción debe tener máximo 500 caracteres").optional(),
  price: z.string().min(1, "El precio es requerido").refine(
    (val) => /^\d+(\.\d{1,2})?$/.test(val),
    "El precio debe ser un número válido"
  ),
  imageUrl: z.string().url("Debe ser una URL válida").optional().or(z.literal("")),
  allergens: z.array(z.string()).default([]),
  order: z.number().int().min(0).default(0),
});

export type DishFormData = z.infer<typeof dishSchema>;

// Assign Menu to Restaurant Schema
export const assignMenuSchema = z.object({
  restaurantId: z.string().uuid(),
  menuId: z.string().uuid(),
});

export type AssignMenuData = z.infer<typeof assignMenuSchema>;
