'use client'

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { dishSchema, type DishFormData } from "@/lib/validations/menu";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import {
  Dialog,
  DialogContent,
  DialogDescription,
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
import { LoaderCircle } from "lucide-react";
import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { ImageUpload } from "@/components/ui/image-upload";

interface DishDialogProps {
  menuId: string;
  dish?: {
    id: string;
    name: string;
    description: string | null;
    price: number;
    imageUrl: string | null;
    allergens: string[];
    order: number;
  } | null;
  isOpen: boolean;
  onClose: () => void;
}

export function DishDialog({ menuId, dish, isOpen, onClose }: DishDialogProps) {
  const router = useRouter();
  const [isSubmitting, setIsSubmitting] = useState(false);
  const isEditing = !!dish;

  const form = useForm<DishFormData>({
    resolver: zodResolver(dishSchema),
    defaultValues: {
      name: "",
      description: "",
      price: "",
      imageUrl: "",
      allergens: [],
      order: 0,
    },
  });

  // Reset form when dish changes or dialog opens
  useEffect(() => {
    if (dish) {
      form.reset({
        name: dish.name,
        description: dish.description || "",
        price: dish.price.toString(),
        imageUrl: dish.imageUrl || "",
        allergens: dish.allergens,
        order: dish.order,
      });
    } else {
      form.reset({
        name: "",
        description: "",
        price: "",
        imageUrl: "",
        allergens: [],
        order: 0,
      });
    }
  }, [dish, form]);

  const onSubmit = async (data: DishFormData) => {
    setIsSubmitting(true);

    try {
      const url = isEditing ? `/api/dishes/${dish.id}` : "/api/dishes";
      const method = isEditing ? "PATCH" : "POST";

      const response = await fetch(url, {
        method,
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          ...data,
          menuId,
        }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || "Failed to save dish");
      }

      router.refresh();
      onClose();
    } catch (error) {
      console.error("Error saving dish:", error);
      alert(error instanceof Error ? error.message : "Error al guardar el plato");
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>{isEditing ? "Editar Plato" : "Añadir Plato"}</DialogTitle>
          <DialogDescription>
            {isEditing
              ? "Modifica la información del plato"
              : "Añade un nuevo plato al menú"}
          </DialogDescription>
        </DialogHeader>

        <Form {...form}>
          <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4">
            <FormField
              control={form.control}
              name="name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Nombre del Plato *</FormLabel>
                  <FormControl>
                    <Input placeholder="Ej: Paella Valenciana" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="description"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Descripción</FormLabel>
                  <FormControl>
                    <Textarea
                      placeholder="Describe los ingredientes y características del plato..."
                      className="min-h-[80px]"
                      {...field}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="price"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Precio *</FormLabel>
                  <FormControl>
                    <Input
                      type="number"
                      step="0.01"
                      placeholder="12.50"
                      {...field}
                    />
                  </FormControl>
                  <FormDescription>Precio en euros</FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="imageUrl"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Imagen del Plato</FormLabel>
                  <FormControl>
                    <ImageUpload
                      value={field.value}
                      onChange={field.onChange}
                      onRemove={() => field.onChange("")}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            <FormField
              control={form.control}
              name="allergens"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Alérgenos</FormLabel>
                  <FormControl>
                    <Input
                      placeholder="gluten, lácteos, frutos secos (separados por comas)"
                      value={field.value.join(", ")}
                      onChange={(e) => {
                        const value = e.target.value;
                        const allergens = value
                          .split(",")
                          .map((a) => a.trim())
                          .filter(Boolean);
                        field.onChange(allergens);
                      }}
                    />
                  </FormControl>
                  <FormDescription>
                    Lista de alérgenos separados por comas
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

            <div className="flex gap-4 pt-4">
              <Button
                type="button"
                variant="outline"
                onClick={onClose}
                disabled={isSubmitting}
              >
                Cancelar
              </Button>
              <Button type="submit" disabled={isSubmitting}>
                {isSubmitting && <LoaderCircle className="mr-2 h-4 w-4 animate-spin" />}
                {isEditing ? "Guardar Cambios" : "Añadir Plato"}
              </Button>
            </div>
          </form>
        </Form>
      </DialogContent>
    </Dialog>
  );
}
