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
 * Opening Hours Validations (needed before Restaurant schema)
 */
export const openingHourSchema = z.object({
  dayOfWeek: z.number().min(0).max(6),
  openTime: z.string().regex(/^([01]\d|2[0-3]):?([0-5]\d)$/, "Formato de hora inválido (HH:mm)").optional(),
  closeTime: z.string().regex(/^([01]\d|2[0-3]):?([0-5]\d)$/, "Formato de hora inválido (HH:mm)").optional(),
  isClosed: z.boolean().default(false),
});

export type OpeningHourInput = z.infer<typeof openingHourSchema>;

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
  featureIds: z.array(z.string()).optional(),
  dietaryIds: z.array(z.string()).optional(),
  ambianceIds: z.array(z.string()).optional(),
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
 * Booking Validations
 */
export const bookingCreateSchema = z.object({
  restaurantId: z.string().uuid("ID de restaurante inválido"),
  date: z.string().refine((val) => {
    const date = new Date(val);
    return date >= new Date() && !isNaN(date.getTime());
  }, {
    message: "La fecha debe ser hoy o posterior",
  }),
  time: z.string().regex(/^([0-1][0-9]|2[0-3]):[0-5][0-9]$/, "Formato de hora inválido (HH:mm)"),
  partySize: z.number().int().min(1, "Mínimo 1 persona").max(20, "Máximo 20 personas"),
  specialNotes: z.string().max(500, "Las notas no pueden exceder 500 caracteres").optional(),
  customerName: z.string().min(2, "El nombre debe tener al menos 2 caracteres"),
  customerEmail: z.string().email("Email inválido"),
  customerPhone: z.string().min(9, "El teléfono debe tener al menos 9 dígitos"),
});

export const bookingUpdateSchema = z.object({
  date: z.string().refine((val) => {
    const date = new Date(val);
    return date >= new Date() && !isNaN(date.getTime());
  }, {
    message: "La fecha debe ser hoy o posterior",
  }).optional(),
  time: z.string().regex(/^([0-1][0-9]|2[0-3]):[0-5][0-9]$/, "Formato de hora inválido (HH:mm)").optional(),
  partySize: z.number().int().min(1, "Mínimo 1 persona").max(20, "Máximo 20 personas").optional(),
  specialNotes: z.string().max(500, "Las notas no pueden exceder 500 caracteres").optional(),
  status: z.enum(["PENDING", "CONFIRMED", "CANCELLED", "COMPLETED", "NO_SHOW"]).optional(),
});

export type BookingCreate = z.infer<typeof bookingCreateSchema>;
export type BookingUpdate = z.infer<typeof bookingUpdateSchema>;
