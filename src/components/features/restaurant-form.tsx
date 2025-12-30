"use client";

import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { useRouter } from "next/navigation";
import { restaurantCreateSchema, type RestaurantCreate } from "@/lib/validations";
import { createRestaurant, updateRestaurant } from "@/server/actions/restaurants";
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
import { useToast } from "@/hooks/use-toast";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Loader2 } from "lucide-react";
import { useState } from "react";

interface RestaurantFormProps {
    initialData?: any;
    isEditing?: boolean;
}

export function RestaurantForm({ initialData, isEditing = false }: RestaurantFormProps) {
    const router = useRouter();
    const { toast } = useToast();
    const [isLoading, setIsLoading] = useState(false);

    const form = useForm<RestaurantCreate>({
        resolver: zodResolver(restaurantCreateSchema),
        defaultValues: initialData || {
            name: "",
            description: "",
            address: "",
            priceRange: "MODERATE",
            phone: "",
            website: "",
        },
    });

    async function onSubmit(values: RestaurantCreate) {
        setIsLoading(true);
        try {
            let result;
            if (isEditing && initialData?.id) {
                result = await updateRestaurant(initialData.id, values);
            } else {
                result = await createRestaurant(values);
            }

            if (result.success) {
                toast({
                    title: isEditing ? "Restaurante actualizado" : "Restaurante registrado",
                    description: isEditing
                        ? "Los cambios se han guardado correctamente."
                        : "Tu restaurante ha sido enviado para revisión.",
                });
                router.push("/dashboard/restaurants");
                router.refresh();
            } else {
                toast({
                    title: "Error",
                    description: result.error || "Algo salió mal.",
                    variant: "destructive",
                });
            }
        } catch (error) {
            toast({
                title: "Error",
                description: "Ocurrió un error inesperado.",
                variant: "destructive",
            });
        } finally {
            setIsLoading(false);
        }
    }

    return (
        <Card>
            <CardHeader>
                <CardTitle>{isEditing ? "Editar Restaurante" : "Registrar Nuevo Restaurante"}</CardTitle>
            </CardHeader>
            <CardContent>
                <Form {...form}>
                    <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-6">
                        <FormField
                            control={form.control}
                            name="name"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Nombre del Restaurante</FormLabel>
                                    <FormControl>
                                        <Input placeholder="Ej: La Pizzería Gígante" {...field} />
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
                                            placeholder="Cuéntanos qué hace especial a tu restaurante..."
                                            className="min-h-[100px]"
                                            {...field}
                                        />
                                    </FormControl>
                                    <FormDescription>
                                        Una buena descripción ayuda a los clientes a elegirte.
                                    </FormDescription>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />

                        <FormField
                            control={form.control}
                            name="address"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Dirección</FormLabel>
                                    <FormControl>
                                        <Input placeholder="Calle Falsa 123, Ciudad" {...field} />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />

                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <FormField
                                control={form.control}
                                name="phone"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Teléfono de Contacto</FormLabel>
                                        <FormControl>
                                            <Input placeholder="+34 600 000 000" {...field} />
                                        </FormControl>
                                        <FormMessage />
                                    </FormItem>
                                )}
                            />

                            <FormField
                                control={form.control}
                                name="website"
                                render={({ field }) => (
                                    <FormItem>
                                        <FormLabel>Sitio Web</FormLabel>
                                        <FormControl>
                                            <Input placeholder="https://tu-restaurante.com" {...field} />
                                        </FormControl>
                                        <FormMessage />
                                    </FormItem>
                                )}
                            />
                        </div>

                        <FormField
                            control={form.control}
                            name="priceRange"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Rango de Precio</FormLabel>
                                    <Select
                                        onValueChange={field.onChange}
                                        defaultValue={field.value}
                                    >
                                        <FormControl>
                                            <SelectTrigger>
                                                <SelectValue placeholder="Selecciona un rango" />
                                            </SelectTrigger>
                                        </FormControl>
                                        <SelectContent>
                                            <SelectItem value="CHEAP">Económico (€)</SelectItem>
                                            <SelectItem value="MODERATE">Moderado (€€)</SelectItem>
                                            <SelectItem value="EXPENSIVE">Caro (€€€)</SelectItem>
                                            <SelectItem value="LUXURY">Lujo (€€€€)</SelectItem>
                                        </SelectContent>
                                    </Select>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />

                        <div className="flex justify-end gap-4">
                            <Button
                                type="button"
                                variant="outline"
                                onClick={() => router.back()}
                                disabled={isLoading}
                            >
                                Cancelar
                            </Button>
                            <Button type="submit" disabled={isLoading}>
                                {isLoading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
                                {isEditing ? "Guardar Cambios" : "Registrar Restaurante"}
                            </Button>
                        </div>
                    </form>
                </Form>
            </CardContent>
        </Card>
    );
}
