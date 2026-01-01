"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { bookingCreateSchema, type BookingCreate } from "@/lib/validations";
import { createBooking } from "@/server/actions/bookings";
import { Button } from "@/components/ui/button";
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Calendar, Clock, Users, Loader2, Check } from "lucide-react";
import { toast } from "sonner";

interface BookingFormProps {
  restaurantId: string;
  restaurantName: string;
  currentUser?: {
    firstName: string;
    lastName: string;
    email: string;
  } | null;
}

export function BookingForm({ restaurantId, restaurantName, currentUser }: BookingFormProps) {
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

  const onSubmit = async (data: BookingCreate) => {
    setIsSubmitting(true);
    try {
      const result = await createBooking(data);

      if (result.success) {
        setIsSuccess(true);
        toast.success("¡Reserva creada!", {
          description: "Te hemos enviado un email de confirmación.",
        });
        form.reset();
        setTimeout(() => setIsSuccess(false), 3000);
      } else {
        toast.error("Error al crear la reserva", {
          description: result.error || "Por favor, intenta de nuevo",
        });
      }
    } catch (error) {
      toast.error("Error inesperado", {
        description: "Por favor, intenta de nuevo más tarde",
      });
    } finally {
      setIsSubmitting(false);
    }
  };

  // Generar opciones de hora (cada 30 minutos desde las 12:00 hasta las 23:30)
  const timeOptions: string[] = [];
  for (let hour = 12; hour < 24; hour++) {
    for (let min = 0; min < 60; min += 30) {
      const time = `${hour.toString().padStart(2, "0")}:${min.toString().padStart(2, "0")}`;
      timeOptions.push(time);
    }
  }

  if (isSuccess) {
    return (
      <div className="bg-green-50 border border-green-200 rounded-2xl p-8 text-center">
        <div className="flex justify-center mb-4">
          <div className="bg-green-100 p-3 rounded-full">
            <Check className="h-8 w-8 text-green-600" />
          </div>
        </div>
        <h3 className="text-xl font-bold text-green-900 mb-2">
          ¡Reserva Confirmada!
        </h3>
        <p className="text-green-700">
          Recibirás un email de confirmación en breve.
        </p>
      </div>
    );
  }

  return (
    <div className="bg-white rounded-2xl border border-gray-200 p-6 shadow-sm">
      <h3 className="text-2xl font-heading font-bold mb-2">Reservar mesa</h3>
      <p className="text-gray-600 mb-6">en {restaurantName}</p>

      <Form {...form}>
        <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
          {/* Fecha y Hora */}
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <FormField
              control={form.control}
              name="date"
              render={({ field }) => (
                <FormItem>
                  <FormLabel className="flex items-center gap-2">
                    <Calendar className="h-4 w-4" />
                    Fecha
                  </FormLabel>
                  <FormControl>
                    <Input
                      type="date"
                      {...field}
                      min={new Date().toISOString().split("T")[0]}
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
                  <FormLabel className="flex items-center gap-2">
                    <Clock className="h-4 w-4" />
                    Hora
                  </FormLabel>
                  <Select onValueChange={field.onChange} defaultValue={field.value}>
                    <FormControl>
                      <SelectTrigger>
                        <SelectValue placeholder="Seleccionar hora" />
                      </SelectTrigger>
                    </FormControl>
                    <SelectContent className="max-h-[200px]">
                      {timeOptions.map((time) => (
                        <SelectItem key={time} value={time}>
                          {time}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                  <FormMessage />
                </FormItem>
              )}
            />
          </div>

          {/* Número de personas */}
          <FormField
            control={form.control}
            name="partySize"
            render={({ field }) => (
              <FormItem>
                <FormLabel className="flex items-center gap-2">
                  <Users className="h-4 w-4" />
                  Número de personas
                </FormLabel>
                <Select
                  onValueChange={(value) => field.onChange(parseInt(value))}
                  defaultValue={field.value.toString()}
                >
                  <FormControl>
                    <SelectTrigger>
                      <SelectValue placeholder="Seleccionar" />
                    </SelectTrigger>
                  </FormControl>
                  <SelectContent>
                    {[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20].map((num) => (
                      <SelectItem key={num} value={num.toString()}>
                        {num} {num === 1 ? "persona" : "personas"}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
                <FormMessage />
              </FormItem>
            )}
          />

          {/* Datos de contacto */}
          <div className="space-y-4 pt-4 border-t">
            <h4 className="font-semibold text-gray-900">Datos de contacto</h4>

            <FormField
              control={form.control}
              name="customerName"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Nombre completo</FormLabel>
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
                      <Input type="email" placeholder="tu@email.com" {...field} />
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
                      <Input type="tel" placeholder="612345678" {...field} />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>
          </div>

          {/* Notas especiales */}
          <FormField
            control={form.control}
            name="specialNotes"
            render={({ field }) => (
              <FormItem>
                <FormLabel>Notas especiales (opcional)</FormLabel>
                <FormControl>
                  <Textarea
                    placeholder="Alergias, preferencias de asiento, celebración..."
                    className="resize-none"
                    rows={3}
                    {...field}
                  />
                </FormControl>
                <FormDescription>
                  Máximo 500 caracteres
                </FormDescription>
                <FormMessage />
              </FormItem>
            )}
          />

          {/* Botón de envío */}
          <Button
            type="submit"
            className="w-full"
            size="lg"
            disabled={isSubmitting}
          >
            {isSubmitting && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            {isSubmitting ? "Creando reserva..." : "Confirmar reserva"}
          </Button>
        </form>
      </Form>
    </div>
  );
}
