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

interface BookingService {
  id: string;
  name: string;
  description: string | null;
  daysOfWeek: number[];
  slots: Array<{
    id: string;
    startTime: string;
    endTime: string;
    durationMinutes: number;
  }>;
}

interface BookingFormProps {
  restaurantId: string;
  restaurantName: string;
  currentUser?: {
    firstName: string;
    lastName: string;
    email: string;
  } | null;
  services?: BookingService[];
}

export function BookingForm({ restaurantId, restaurantName, currentUser, services = [] }: BookingFormProps) {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [isSuccess, setIsSuccess] = useState(false);
  const [selectedServiceId, setSelectedServiceId] = useState<string>("");

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

  // Obtener servicios disponibles para la fecha seleccionada
  const getAvailableServices = () => {
    const selectedDate = form.watch("date");
    if (!selectedDate) return [];

    const date = new Date(selectedDate);
    const dayOfWeek = date.getDay();

    // Filtrar servicios que están activos en el día seleccionado
    return services.filter(service =>
      service.daysOfWeek.includes(dayOfWeek)
    );
  };

  // Obtener turnos del servicio seleccionado
  const getAvailableSlots = () => {
    if (!selectedServiceId) return [];

    const service = services.find(s => s.id === selectedServiceId);
    if (!service) return [];

    return service.slots.map(slot => ({
      id: slot.id,
      label: `${slot.startTime} - ${slot.endTime}`,
      value: slot.startTime,
    }));
  };

  const availableServices = getAvailableServices();
  const availableSlots = getAvailableSlots();

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
            {/* Fecha */}
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
                      onChange={(e) => {
                        field.onChange(e);
                        setSelectedServiceId(""); // Reset service cuando cambia la fecha
                        form.setValue("time", ""); // Reset time
                      }}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Servicio */}
            <div className="space-y-4">
              <div>
                <FormLabel>Servicio</FormLabel>
                <Select
                  value={selectedServiceId}
                  onValueChange={(value) => {
                    setSelectedServiceId(value);
                    form.setValue("time", ""); // Reset time cuando cambia el servicio
                  }}
                  disabled={!form.watch("date") || availableServices.length === 0}
                >
                  <SelectTrigger>
                    <SelectValue placeholder="Selecciona un servicio" />
                  </SelectTrigger>
                  <SelectContent>
                    {availableServices.length === 0 ? (
                      <SelectItem value="no-service" disabled>
                        {form.watch("date") ? "No hay servicios disponibles este día" : "Selecciona una fecha primero"}
                      </SelectItem>
                    ) : (
                      availableServices.map((service) => (
                        <SelectItem key={service.id} value={service.id}>
                          <div>
                            <div className="font-medium">{service.name}</div>
                            {service.description && (
                              <div className="text-xs text-muted-foreground">{service.description}</div>
                            )}
                          </div>
                        </SelectItem>
                      ))
                    )}
                  </SelectContent>
                </Select>
              </div>

              {/* Hora / Turno */}
              <FormField
                control={form.control}
                name="time"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Turno</FormLabel>
                    <Select
                      onValueChange={field.onChange}
                      value={field.value}
                      disabled={!selectedServiceId || availableSlots.length === 0}
                    >
                      <FormControl>
                        <SelectTrigger>
                          <SelectValue placeholder="Selecciona un turno" />
                        </SelectTrigger>
                      </FormControl>
                      <SelectContent>
                        {availableSlots.length === 0 ? (
                          <SelectItem value="no-slots" disabled>
                            {selectedServiceId ? "No hay turnos disponibles" : "Selecciona un servicio primero"}
                          </SelectItem>
                        ) : (
                          availableSlots.map((slot) => (
                            <SelectItem key={slot.id} value={slot.value}>
                              <div className="flex items-center gap-2">
                                <Clock className="h-4 w-4" />
                                {slot.label}
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
