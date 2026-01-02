"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { zodResolver } from "@hookform/resolvers/zod";
import { useForm, useFieldArray } from "react-hook-form";
import { Plus, X, Clock, Trash2 } from "lucide-react";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
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
import { Checkbox } from "@/components/ui/checkbox";
import { createBookingService } from "@/lib/actions/booking-service";
import {
  createBookingServiceSchema,
  type CreateBookingService,
} from "@/lib/validations/booking-service";
import { toast } from "sonner";

interface CreateServiceDialogProps {
  restaurantId: string;
  variant?: "primary" | "default";
}

const DAYS_OF_WEEK = [
  { value: 1, label: "Lun" },
  { value: 2, label: "Mar" },
  { value: 3, label: "Mié" },
  { value: 4, label: "Jue" },
  { value: 5, label: "Vie" },
  { value: 6, label: "Sáb" },
  { value: 0, label: "Dom" },
];

export function CreateServiceDialog({ restaurantId, variant = "default" }: CreateServiceDialogProps) {
  const [open, setOpen] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const router = useRouter();

  const form = useForm<CreateBookingService>({
    resolver: zodResolver(createBookingServiceSchema),
    defaultValues: {
      restaurantId,
      name: "",
      description: "",
      daysOfWeek: [1, 2, 3, 4, 5, 6, 0], // All days by default
      isActive: true,
      slots: [
        {
          startTime: "20:00",
          endTime: "21:30",
          durationMinutes: 90,
        },
      ],
    },
  });

  const { fields, append, remove } = useFieldArray({
    control: form.control,
    name: "slots",
  });

  const onSubmit = async (data: CreateBookingService) => {
    console.log("✅ Form submitted with data:", data);
    setIsLoading(true);
    try {
      const result = await createBookingService(data);
      console.log("✅ Result from server:", result);

      if (result.success) {
        toast.success("Servicio creado correctamente");
        setOpen(false);
        form.reset();
        router.refresh();
      } else {
        toast.error(result.error || "Error al crear el servicio");
      }
    } catch (error) {
      toast.error("Error inesperado al crear el servicio");
      console.error("❌ Error creating service:", error);
    } finally {
      setIsLoading(false);
    }
  };

  const onError = (errors: any) => {
    console.error("❌ Form validation errors:", errors);
    toast.error("Por favor, completa todos los campos requeridos");
  };

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant={variant === "primary" ? "default" : "outline"}>
          <Plus className="h-4 w-4 mr-2" />
          Nuevo Servicio
        </Button>
      </DialogTrigger>
      <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>Crear Servicio de Reserva</DialogTitle>
          <DialogDescription>
            Configura un nuevo servicio con sus horarios y turnos disponibles
          </DialogDescription>
        </DialogHeader>

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit, onError)} className="space-y-6">
            {/* Name */}
            <FormField
              control={form.control}
              name="name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Nombre del servicio *</FormLabel>
                  <FormControl>
                    <Input placeholder="Ej: Cena, Comida, Brunch" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Description */}
            <FormField
              control={form.control}
              name="description"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Descripción (opcional)</FormLabel>
                  <FormControl>
                    <Textarea
                      placeholder="Describe este servicio..."
                      className="resize-none"
                      {...field}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Days of Week */}
            <FormField
              control={form.control}
              name="daysOfWeek"
              render={() => (
                <FormItem>
                  <div className="mb-4">
                    <FormLabel>Días activos *</FormLabel>
                    <FormDescription>
                      Selecciona los días en que este servicio estará disponible
                    </FormDescription>
                  </div>
                  <div className="flex flex-wrap gap-4">
                    {DAYS_OF_WEEK.map((day) => (
                      <FormField
                        key={day.value}
                        control={form.control}
                        name="daysOfWeek"
                        render={({ field }) => {
                          return (
                            <FormItem
                              key={day.value}
                              className="flex flex-row items-start space-x-3 space-y-0"
                            >
                              <FormControl>
                                <Checkbox
                                  checked={field.value?.includes(day.value)}
                                  onCheckedChange={(checked) => {
                                    return checked
                                      ? field.onChange([...field.value, day.value])
                                      : field.onChange(
                                          field.value?.filter((value) => value !== day.value)
                                        );
                                  }}
                                />
                              </FormControl>
                              <FormLabel className="font-normal cursor-pointer">
                                {day.label}
                              </FormLabel>
                            </FormItem>
                          );
                        }}
                      />
                    ))}
                  </div>
                  <FormMessage />
                </FormItem>
              )}
            />

            {/* Time Slots */}
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <div>
                  <FormLabel>Turnos *</FormLabel>
                  <FormDescription>
                    Define los horarios disponibles para este servicio
                  </FormDescription>
                </div>
                <Button
                  type="button"
                  variant="outline"
                  size="sm"
                  onClick={() =>
                    append({
                      startTime: "",
                      endTime: "",
                      durationMinutes: 90,
                    })
                  }
                >
                  <Plus className="h-4 w-4 mr-2" />
                  Añadir turno
                </Button>
              </div>

              <div className="space-y-3">
                {fields.map((field, index) => (
                  <div key={field.id} className="p-4 border rounded-lg bg-gray-50">
                    <div className="flex items-start justify-between mb-3">
                      <p className="text-sm font-medium">Turno {index + 1}</p>
                      {fields.length > 1 && (
                        <Button
                          type="button"
                          variant="ghost"
                          size="sm"
                          onClick={() => remove(index)}
                        >
                          <Trash2 className="h-4 w-4 text-red-600" />
                        </Button>
                      )}
                    </div>

                    <div className="grid grid-cols-3 gap-3">
                      <FormField
                        control={form.control}
                        name={`slots.${index}.startTime`}
                        render={({ field }) => (
                          <FormItem>
                            <FormLabel className="text-xs">Hora inicio</FormLabel>
                            <FormControl>
                              <Input
                                type="time"
                                {...field}
                                className="text-sm"
                              />
                            </FormControl>
                            <FormMessage />
                          </FormItem>
                        )}
                      />

                      <FormField
                        control={form.control}
                        name={`slots.${index}.endTime`}
                        render={({ field }) => (
                          <FormItem>
                            <FormLabel className="text-xs">Hora fin</FormLabel>
                            <FormControl>
                              <Input
                                type="time"
                                {...field}
                                className="text-sm"
                              />
                            </FormControl>
                            <FormMessage />
                          </FormItem>
                        )}
                      />

                      <FormField
                        control={form.control}
                        name={`slots.${index}.durationMinutes`}
                        render={({ field }) => (
                          <FormItem>
                            <FormLabel className="text-xs">Duración (min)</FormLabel>
                            <FormControl>
                              <Input
                                type="number"
                                min={30}
                                max={300}
                                {...field}
                                onChange={(e) => field.onChange(parseInt(e.target.value))}
                                className="text-sm"
                              />
                            </FormControl>
                            <FormMessage />
                          </FormItem>
                        )}
                      />
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Submit */}
            <div className="flex justify-end gap-3 pt-4 border-t">
              <Button
                type="button"
                variant="outline"
                onClick={() => setOpen(false)}
                disabled={isLoading}
              >
                Cancelar
              </Button>
              <Button type="submit" disabled={isLoading}>
                {isLoading ? "Creando..." : "Crear Servicio"}
              </Button>
            </div>
          </form>
        </Form>
      </DialogContent>
    </Dialog>
  );
}
