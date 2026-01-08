'use client'

import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { restaurantUpdateSchema, type RestaurantUpdate } from '@/lib/validations'
import { Button } from '@/components/ui/button'
import { Input } from '@/components/ui/input'
import { Textarea } from '@/components/ui/textarea'
import {
    Form,
    FormControl,
    FormDescription,
    FormField,
    FormItem,
    FormLabel,
    FormMessage,
} from '@/components/ui/form'
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select'
import { Loader2, Save } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'

interface InfoFormProps {
    initialData: any
    onSubmit: (data: any) => Promise<{ success: boolean; error?: string }>
}

const priceRangeLabels = {
    CHEAP: 'Económico (€)',
    MODERATE: 'Moderado (€€)',
    EXPENSIVE: 'Caro (€€€)',
    LUXURY: 'Lujo (€€€€)',
}

export function InfoForm({ initialData, onSubmit }: InfoFormProps) {
    const [isSubmitting, setIsSubmitting] = useState(false)

    const form = useForm<any>({
        // Utilizamos un esquema parcial o específico si es necesario fuera de las validaciones globales
        defaultValues: {
            name: initialData?.name || '',
            description: initialData?.description || '',
            priceRange: initialData?.priceRange || 'MODERATE',
            phone: initialData?.phone || '',
            website: initialData?.website || '',
        },
    })

    const handleSubmit = async (data: any) => {
        setIsSubmitting(true)
        try {
            const result = await onSubmit(data)
            if (result.success) {
                toast.success('Información actualizada correctamente')
            } else {
                toast.error(result.error || 'Error al guardar los cambios')
            }
        } catch (error) {
            toast.error('Ocurrió un error inesperado')
        } finally {
            setIsSubmitting(false)
        }
    }

    return (
        <Form {...form}>
            <form onSubmit={form.handleSubmit(handleSubmit)} className="space-y-8">
                <div>
                    <h2 className="text-2xl font-bold mb-1">Información General</h2>
                    <p className="text-muted-foreground text-sm">
                        Configura los datos básicos y de contacto de tu restaurante.
                    </p>
                </div>

                <div className="grid gap-6">
                    <FormField
                        control={form.control}
                        name="name"
                        render={({ field }) => (
                            <FormItem>
                                <FormLabel>Nombre del Restaurante</FormLabel>
                                <FormControl>
                                    <Input placeholder="Ej: La Trattoria del Sol" {...field} className="max-w-xl" />
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
                                        placeholder="Cuéntanos sobre tu cocina, especialidades y ambiente..."
                                        className="min-h-[120px] max-w-2xl"
                                        {...field}
                                    />
                                </FormControl>
                                <FormDescription>
                                    Esta descripción aparecerá en la página pública de tu restaurante.
                                </FormDescription>
                                <FormMessage />
                            </FormItem>
                        )}
                    />

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-2xl">
                        <FormField
                            control={form.control}
                            name="priceRange"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Rango de Precios</FormLabel>
                                    <Select onValueChange={field.onChange} defaultValue={field.value}>
                                        <FormControl>
                                            <SelectTrigger>
                                                <SelectValue placeholder="Selecciona un rango" />
                                            </SelectTrigger>
                                        </FormControl>
                                        <SelectContent>
                                            {Object.entries(priceRangeLabels).map(([value, label]) => (
                                                <SelectItem key={value} value={value}>
                                                    {label}
                                                </SelectItem>
                                            ))}
                                        </SelectContent>
                                    </Select>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />

                        <FormField
                            control={form.control}
                            name="phone"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Teléfono de Reservas</FormLabel>
                                    <FormControl>
                                        <Input placeholder="+34 900 000 000" {...field} />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />
                    </div>

                    <FormField
                        control={form.control}
                        name="website"
                        render={({ field }) => (
                            <FormItem>
                                <FormLabel>Sitio Web</FormLabel>
                                <FormControl>
                                    <Input type="url" placeholder="https://www.mirestaurante.com" {...field} className="max-w-xl" />
                                </FormControl>
                                <FormMessage />
                            </FormItem>
                        )}
                    />
                </div>

                <div className="flex justify-end pt-4 border-t">
                    <Button type="submit" disabled={isSubmitting} className="bg-pink-500 hover:bg-pink-600">
                        {isSubmitting ? (
                            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                        ) : (
                            <Save className="mr-2 h-4 w-4" />
                        )}
                        Guardar Información
                    </Button>
                </div>
            </form>
        </Form>
    )
}
