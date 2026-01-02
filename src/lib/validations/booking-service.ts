import { z } from "zod";

// Validación para BookingSlot (turno)
export const bookingSlotSchema = z.object({
  startTime: z.string().regex(/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/, {
    message: "El horario debe tener el formato HH:mm (ej: 20:00)",
  }),
  endTime: z.string().regex(/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/, {
    message: "El horario debe tener el formato HH:mm (ej: 21:30)",
  }),
  durationMinutes: z.number().min(30).max(300).default(90),
  maxCapacity: z.number().min(1).optional(),
});

// Validación para BookingService (servicio de comida)
export const bookingServiceSchema = z.object({
  name: z.string().min(1, "El nombre del servicio es requerido"),
  description: z.string().optional(),
  daysOfWeek: z.array(z.number().min(0).max(6)).min(1, "Selecciona al menos un día"),
  isActive: z.boolean().default(true),
  slots: z.array(bookingSlotSchema).min(1, "Añade al menos un turno"),
});

// Validación para crear servicio
export const createBookingServiceSchema = bookingServiceSchema.extend({
  restaurantId: z.string().uuid(),
});

// Validación para actualizar servicio
export const updateBookingServiceSchema = bookingServiceSchema.partial().extend({
  id: z.string().uuid(),
});

// Validación para TableAvailability
export const tableAvailabilitySchema = z.object({
  tableId: z.string().uuid(),
  serviceId: z.string().uuid(),
  date: z.date(),
  isAvailable: z.boolean().default(true),
});

// Validación para actualizar disponibilidad de múltiples mesas
export const updateTableAvailabilitySchema = z.object({
  restaurantId: z.string().uuid(),
  serviceId: z.string().uuid(),
  date: z.date(),
  tableIds: z.array(z.string().uuid()),
  isAvailable: z.boolean(),
});

// Validación para recordatorios
export const bookingReminderSchema = z.object({
  restaurantId: z.string().uuid(),
  reminderTime: z.string().regex(/^([0-1]?[0-9]|2[0-3]):[0-5][0-9]$/, {
    message: "El horario debe tener el formato HH:mm (ej: 10:00)",
  }),
  isActive: z.boolean().default(true),
  frequency: z.enum(["DAILY", "WEEKDAYS", "WEEKENDS"]).default("DAILY"),
});

// Tipos TypeScript
export type BookingSlot = z.infer<typeof bookingSlotSchema>;
export type BookingService = z.infer<typeof bookingServiceSchema>;
export type CreateBookingService = z.infer<typeof createBookingServiceSchema>;
export type UpdateBookingService = z.infer<typeof updateBookingServiceSchema>;
export type TableAvailability = z.infer<typeof tableAvailabilitySchema>;
export type UpdateTableAvailability = z.infer<typeof updateTableAvailabilitySchema>;
export type BookingReminder = z.infer<typeof bookingReminderSchema>;
