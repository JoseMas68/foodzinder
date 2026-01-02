"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { bookingCreateSchema, type BookingCreate } from "@/lib/validations";
import { createBooking } from "@/server/actions/bookings";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
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
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Calendar, Clock, Users, Loader2, CheckCircle2 } from "lucide-react";
import { toast } from "sonner";

interface BookingFormProps {
  restaurantId: string;
  restaurantName: string;
  currentUser?: {
    firstName: string;
    lastName: string;
    email: string;
  } | null;
  openingHours?: Array<{
    dayOfWeek: number;
    openTime: string | null;
    closeTime: string | null;
    isClosed: boolean;
  }>;
}

export function BookingForm({ restaurantId, restaurantName, currentUser, openingHours = [] }: BookingFormProps) {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);

  const form = useForm<BookingCreate>({
    resolver: zodResolver(bookingCreateSchema),
    defaultValues: {
      restaurantId,
      date: "",
      time: "",
      partySize: 2,
      specialNotes: "",
      customerName: currentUser ? `${currentUser.firstName} ${currentUser.lastName}` : "",
      customerEmail: currentUser?.email || "",
      customerPhone: "",
    },
  });

  // Generar horarios disponibles (cada 30 minutos)
  const generateTimeSlots = () => {
    const slots: string[] = [];
    const selectedDate = form.watch("date");

    if (!selectedDate) return slots;

    const date = new Date(selectedDate);
    const dayOfWeek = date.getDay();

    // Buscar horario de apertura para ese día
    const daySchedule = openingHours.find(h => h.dayOfWeek === dayOfWeek);

    if (!daySchedule || daySchedule.isClosed || !daySchedule.openTime || !daySchedule.closeTime) {
      return slots;
    }

    // Generar slots desde openTime hasta closeTime
    const [openHour, openMin] = daySchedule.openTime.split(":").map(Number);
    const [closeHour, closeMin] = daySchedule.closeTime.split(":").map(Number);

    let currentHour = openHour;
    let currentMin = openMin;

    while (currentHour < closeHour || (currentHour === closeHour && currentMin < closeMin)) {
      const timeString = `${String(currentHour).padStart(2, "0")}:${String(currentMin).padStart(2, "0")}`;
      slots.push(timeString);

      // Incrementar 30 minutos
      currentMin += 30;
      if (currentMin >= 60) {
        currentMin = 0;
        currentHour++;
      }
    }

    return slots;
  };

  const timeSlots = generateTimeSlots();

  const onSubmit = async (data: BookingCreate) => {
    setIsSubmitting(true);
    try {
      const result = await createBooking(data);

      if (result.success) {
        setIsSuccess(true);
        toast.success("¡Reserva creada exitosamente!");
        form.reset();
      } else {
        toast.error(result.error || "Error al crear la reserva");
      }
    } catch (error) {
      toast.error("Error inesperado al crear la reserva");
    } finally {
      setIsSubmitting(false);
    }
  };

  // Obtener fecha mínima (hoy)
  const today = new Date().toISOString().split("T")[0];
  // Obtener fecha máxima (3 meses adelante)
  const maxDate = new Date();
  maxDate.setMonth(maxDate.getMonth() + 3);
  const maxDateString = maxDate.toISOString().split("T")[0];

  if (isSuccess) {
    return (
      <Card className="border-green-200 bg-green-50">
        <CardContent className="pt-6">
          <div className="text-center space-y-4">
            <CheckCircle2 className="h-16 w-16 text-green-600 mx-auto" />
            <div>
              <h3 className="text-2xl font-bold text-green-900">¡Reserva Confirmada!</h3>
              <p className="text-green-700 mt-2">
                Hemos enviado un correo de confirmación a tu email.
              </p>
              <p className="text-sm text-green-600 mt-1">
                Te esperamos en {restaurantName}
              </p>
            </div>
            <Button
              onClick={() => setIsSuccess(false)}
              variant="outline"
              className="mt-4"
            >
              Hacer otra reserva
            </Button>
          </div>
        </CardContent>
      </Card>
    );
  }

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Calendar className="h-5 w-5 text-pink-600" />
          Reservar Mesa
        </CardTitle>
        <CardDescription>
          Completa el formulario para reservar tu mesa en {restaurantName}
        </CardDescription>
      </CardHeader>
      <CardContent>
        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
            {/* Fecha y Hora */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <FormField
                control={form.control}
                name="date"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Fecha</FormLabel>
                    <FormControl>
                      <Input
                        type="date"
                        min={today}
                        max={maxDateString}
                        {...field}
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />

              <FormField
                control={form.control}
                name="time"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Hora</FormLabel>
                    <Select
                      onValueChange={field.onChange}
                      value={field.value}
                      disabled={!form.watch("date") || timeSlots.length === 0}
                    >
                      <FormControl>
                        <SelectTrigger>
                          <SelectValue placeholder="Selecciona una hora" />
                        </SelectTrigger>
                      </FormControl>
                      <SelectContent>
                        {timeSlots.length === 0 ? (
                          <SelectItem value="no-slots" disabled>
                            {form.watch("date") ? "Restaurante cerrado este día" : "Selecciona una fecha primero"}
                          </SelectItem>
                        ) : (
                          timeSlots.map((slot) => (
                            <SelectItem key={slot} value={slot}>
                              <div className="flex items-center gap-2">
                                <Clock className="h-4 w-4" />
                                {slot}
                              </div>
                            </SelectItem>
                          ))
                        )}
                      </SelectContent>
                    </Select>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            {/* Número de Personas */}
            <FormField
              control={form.control}
              name="partySize"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Número de Personas</FormLabel>
                  <Select
                    onValueChange={(value) => field.onChange(parseInt(value))}
                    value={field.value?.toString()}
                  >
                    <FormControl>
                      <SelectTrigger>
                        <SelectValue placeholder="Selecciona número de personas" />
                      </SelectTrigger>
                    </FormControl>
                    <SelectContent>
                      {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20].map((num) => (
                        <SelectItem key={num} value={num.toString()}>
                          <div className="flex items-center gap-2">
                            <Users className="h-4 w-4" />
                            {num} {num === 1 ? "persona" : "personas"}
                          </div>
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Información de Contacto */}
            <div className="space-y-4 pt-4 border-t">
              <h3 className="font-semibold text-lg">Información de Contacto</h3>

              <FormField
                control={form.control}
                name="customerName"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Nombre Completo</FormLabel>
                    <FormControl>
                      <Input placeholder="Juan Pérez" {...field} />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <FormField
                  control={form.control}
                  name="customerEmail"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel>Email</FormLabel>
                      <FormControl>
                        <Input
                          type="email"
                          placeholder="juan@ejemplo.com"
                          {...field}
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />

                <FormField
                  control={form.control}
                  name="customerPhone"
                  render={({ field }) => (
                    <FormItem>
                      <FormLabel>Teléfono</FormLabel>
                      <FormControl>
                        <Input
                          type="tel"
                          placeholder="+34 612 345 678"
                          {...field}
                        />
                      </FormControl>
                      <FormMessage />
                    </FormItem>
                  )}
                />
              </div>
            </div>

            {/* Notas Especiales */}
            <FormField
              control={form.control}
              name="specialNotes"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Notas Especiales (Opcional)</FormLabel>
                  <FormControl>
                    <Textarea
                      placeholder="Alergias, ocasión especial, preferencias de mesa..."
                      className="min-h-24 resize-none"
                      {...field}
                    />
                  </FormControl>
                  <FormDescription>
                    Indícanos cualquier solicitud especial para tu reserva
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Botón de Envío */}
            <Button
              type="submit"
              disabled={isSubmitting}
              className="w-full bg-pink-600 hover:bg-pink-700"
              size="lg"
            >
              {isSubmitting && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
              {isSubmitting ? "Creando Reserva..." : "Confirmar Reserva"}
            </Button>
          </form>
        </Form>
      </CardContent>
    </Card>
  );
}
