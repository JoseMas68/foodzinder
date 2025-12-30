import { z } from "zod";

/**
 * User Validations
 */
export const userUpdateSchema = z.object({
  firstName: z.string().min(1, "El nombre es requerido").optional(),
  lastName: z.string().min(1, "El apellido es requerido").optional(),
  email: z.string().email("Email inválido").optional(),
});

export type UserUpdate = z.infer<typeof userUpdateSchema>;

/**
 * Restaurant Validations
 */
export const restaurantCreateSchema = z.object({
  name: z.string().min(3, "El nombre debe tener al menos 3 caracteres"),
  description: z.string().min(10, "La descripción debe tener al menos 10 caracteres"),
  address: z.string().min(5, "La dirección es requerida"),
  latitude: z.number().optional(),
  longitude: z.number().optional(),
  priceRange: z.enum(["CHEAP", "MODERATE", "EXPENSIVE", "LUXURY"]),
  phone: z.string().optional(),
  website: z.string().url("URL inválida").optional().or(z.literal("")),
  logoUrl: z.string().url("URL inválida").optional().or(z.literal("")),
  coverUrl: z.string().url("URL inválida").optional().or(z.literal("")),
  cuisineTypeIds: z.array(z.string()).optional(),
  openingHours: z.array(openingHourSchema).optional(),
});

export const restaurantUpdateSchema = restaurantCreateSchema.partial();

export type RestaurantCreate = z.infer<typeof restaurantCreateSchema>;
export type RestaurantUpdate = z.infer<typeof restaurantUpdateSchema>;

/**
 * Menu Validations
 */
export const menuCreateSchema = z.object({
  title: z.string().min(3, "El título debe tener al menos 3 caracteres"),
  description: z.string().optional(),
  price: z.number().nonnegative().optional(),
  isActive: z.boolean().default(true),
});

export const menuUpdateSchema = menuCreateSchema.partial();

export type MenuCreate = z.infer<typeof menuCreateSchema>;
export type MenuUpdate = z.infer<typeof menuUpdateSchema>;

/**
 * Dish Validations
 */
export const dishCreateSchema = z.object({
  name: z.string().min(3, "El nombre debe tener al menos 3 caracteres"),
  description: z.string().optional(),
  price: z.number().nonnegative("El precio debe ser positivo"),
  imageUrl: z.string().url().optional(),
  allergens: z.string().array().optional(),
  order: z.number().nonnegative().optional(),
});

export const dishUpdateSchema = dishCreateSchema.partial();

export type DishCreate = z.infer<typeof dishCreateSchema>;
export type DishUpdate = z.infer<typeof dishUpdateSchema>;

/**
 * Review Validations
 */
export const reviewCreateSchema = z.object({
  rating: z.number().int().min(1).max(5),
  comment: z.string().min(10, "El comentario debe tener al menos 10 caracteres"),
  photos: z.string().url().array().optional(),
});

export type ReviewCreate = z.infer<typeof reviewCreateSchema>;

/**
 * Billing Validations
 */
export const billingDetailsSchema = z.object({
  taxId: z.string().min(9, "El NIF/CIF es requerido"),
  billingName: z.string().min(3, "La razón social es requerida"),
  billingAddress: z.string().min(5, "La dirección es requerida"),
});

export type BillingDetails = z.infer<typeof billingDetailsSchema>;

/**
 * Opening Hours Validations
 */
export const openingHourSchema = z.object({
  dayOfWeek: z.number().min(0).max(6),
  openTime: z.string().regex(/^([01]\d|2[0-3]):?([0-5]\d)$/, "Formato de hora inválido (HH:mm)").optional(),
  closeTime: z.string().regex(/^([01]\d|2[0-3]):?([0-5]\d)$/, "Formato de hora inválido (HH:mm)").optional(),
  isClosed: z.boolean().default(false),
});

export type OpeningHourInput = z.infer<typeof openingHourSchema>;
