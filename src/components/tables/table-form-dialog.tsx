"use client";

import { useState } from "react";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
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
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Loader2 } from "lucide-react";
import { createTable, updateTable } from "@/server/actions/tables";
import { toast } from "sonner";

const tableSchema = z.object({
  tableNumber: z.string().min(1, "El número de mesa es requerido"),
  capacity: z.coerce.number().min(1, "La capacidad debe ser al menos 1").max(50, "Máximo 50 personas"),
  minCapacity: z.coerce.number().min(1).max(50).optional(),
  area: z.string().optional(),
  shape: z.enum(["SQUARE", "RECTANGLE", "ROUND", "BOOTH"]),
});

type TableFormData = z.infer<typeof tableSchema>;

interface TableFormDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  restaurantId: string;
  table?: {
    id: string;
    tableNumber: string;
    capacity: number;
    minCapacity: number;
    area: string | null;
    shape: string;
  };
  onSuccess: () => void;
}

const shapeOptions = [
  { value: "SQUARE", label: "Cuadrada" },
  { value: "RECTANGLE", label: "Rectangular" },
  { value: "ROUND", label: "Redonda" },
  { value: "BOOTH", label: "Reservado" },
];

const areaOptions = [
  "Interior",
  "Terraza",
  "Ventana",
  "Barra",
  "VIP",
  "Jardín",
  "Privado",
];

export function TableFormDialog({
  open,
  onOpenChange,
  restaurantId,
  table,
  onSuccess,
}: TableFormDialogProps) {
  const [isSubmitting, setIsSubmitting] = useState(false);
  const isEditing = !!table;

  const form = useForm<TableFormData>({
    resolver: zodResolver(tableSchema),
    defaultValues: {
      tableNumber: table?.tableNumber || "",
      capacity: table?.capacity || 4,
      minCapacity: table?.minCapacity || 1,
      area: table?.area || "",
      shape: (table?.shape as any) || "SQUARE",
    },
  });

  const onSubmit = async (data: TableFormData) => {
    setIsSubmitting(true);
    try {
      const result = isEditing
        ? await updateTable(table.id, data)
        : await createTable({
            ...data,
            restaurantId,
          });

      if (result.success) {
        toast.success(
          isEditing ? "Mesa actualizada correctamente" : "Mesa creada correctamente"
        );
        form.reset();
        onOpenChange(false); // Cerrar el diálogo primero
        onSuccess(); // Luego recargar
      } else {
        toast.error(result.error || "Error al guardar la mesa");
      }
    } catch (error) {
      toast.error("Error inesperado");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="sm:max-w-[500px]">
        <DialogHeader>
          <DialogTitle>{isEditing ? "Editar Mesa" : "Nueva Mesa"}</DialogTitle>
          <DialogDescription>
            {isEditing
              ? "Modifica los datos de la mesa"
              : "Agrega una nueva mesa al restaurante"}
          </DialogDescription>
        </DialogHeader>

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <FormField
                control={form.control}
                name="tableNumber"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Número/ID de Mesa</FormLabel>
                    <FormControl>
                      <Input placeholder="1, A1, T3..." {...field} />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />

              <FormField
                control={form.control}
                name="shape"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Forma</FormLabel>
                    <Select onValueChange={field.onChange} defaultValue={field.value}>
                      <FormControl>
                        <SelectTrigger>
                          <SelectValue placeholder="Selecciona forma" />
                        </SelectTrigger>
                      </FormControl>
                      <SelectContent>
                        {shapeOptions.map((option) => (
                          <SelectItem key={option.value} value={option.value}>
                            {option.label}
                          </SelectItem>
                        ))}
                      </SelectContent>
                    </Select>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            <div className="grid grid-cols-2 gap-4">
              <FormField
                control={form.control}
                name="minCapacity"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Capacidad Mínima</FormLabel>
                    <FormControl>
                      <Input type="number" placeholder="1" {...field} />
                    </FormControl>
                    <FormDescription className="text-xs">
                      Mínimo de personas
                    </FormDescription>
                    <FormMessage />
                  </FormItem>
                )}
              />

              <FormField
                control={form.control}
                name="capacity"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Capacidad Máxima</FormLabel>
                    <FormControl>
                      <Input type="number" placeholder="4" {...field} />
                    </FormControl>
                    <FormDescription className="text-xs">
                      Máximo de personas
                    </FormDescription>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>

            <FormField
              control={form.control}
              name="area"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Área / Zona (Opcional)</FormLabel>
                  <Select
                    onValueChange={(value) => field.onChange(value === "_none_" ? "" : value)}
                    defaultValue={field.value || "_none_"}
                  >
                    <FormControl>
                      <SelectTrigger>
                        <SelectValue placeholder="Selecciona o deja vacío" />
                      </SelectTrigger>
                    </FormControl>
                    <SelectContent>
                      <SelectItem value="_none_">Sin área específica</SelectItem>
                      {areaOptions.map((area) => (
                        <SelectItem key={area} value={area}>
                          {area}
                        </SelectItem>
                      ))}
                    </SelectContent>
                  </Select>
                  <FormDescription className="text-xs">
                    Ayuda a organizar tus mesas
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            <DialogFooter>
              <Button
                type="button"
                variant="outline"
                onClick={() => onOpenChange(false)}
                disabled={isSubmitting}
              >
                Cancelar
              </Button>
              <Button type="submit" disabled={isSubmitting}>
                {isSubmitting && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                {isEditing ? "Guardar Cambios" : "Crear Mesa"}
              </Button>
            </DialogFooter>
          </form>
        </Form>
      </DialogContent>
    </Dialog>
  );
}
