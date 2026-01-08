'use client'

import { useForm } from 'react-hook-form'
import { Button } from '@/components/ui/button'
import {
    Form,
    FormControl,
    FormDescription,
    FormField,
    FormItem,
    FormLabel,
    FormMessage,
} from '@/components/ui/form'
import { Input } from '@/components/ui/input'
import { Loader2, Save, MapPin } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'

interface LocationFormProps {
    initialData: {
        address: string
        latitude?: number | null
        longitude?: number | null
    }
    onSubmit: (data: any) => Promise<{ success: boolean; error?: string }>
}

export function LocationForm({ initialData, onSubmit }: LocationFormProps) {
    const [isSubmitting, setIsSubmitting] = useState(false)

    const form = useForm({
        defaultValues: {
            address: initialData?.address || '',
            latitude: initialData?.latitude || undefined,
            longitude: initialData?.longitude || undefined,
        },
    })

    const handleSubmit = async (data: any) => {
        setIsSubmitting(true)
        try {
            const result = await onSubmit(data)
            if (result.success) {
                toast.success('Ubicación actualizada correctamente')
            } else {
                toast.error(result.error || 'Error al guardar la ubicación')
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
                    <h2 className="text-2xl font-bold mb-1 flex items-center gap-2">
                        <MapPin className="h-6 w-6 text-pink-500" />
                        Ubicación
                    </h2>
                    <p className="text-muted-foreground text-sm">
                        Define la dirección exacta y las coordenadas para que tus clientes te encuentren.
                    </p>
                </div>

                <div className="grid gap-6">
                    <FormField
                        control={form.control}
                        name="address"
                        render={({ field }) => (
                            <FormItem>
                                <FormLabel>Dirección Completa</FormLabel>
                                <FormControl>
                                    <Input placeholder="Ej: Calle Mayor 1, Madrid" {...field} className="max-w-xl" />
                                </FormControl>
                                <FormMessage />
                            </FormItem>
                        )}
                    />

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-xl">
                        <FormField
                            control={form.control}
                            name="latitude"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Latitud</FormLabel>
                                    <FormControl>
                                        <Input
                                            type="number"
                                            step="any"
                                            placeholder="40.4168"
                                            {...field}
                                            onChange={(e) => field.onChange(e.target.value ? parseFloat(e.target.value) : undefined)}
                                            value={field.value ?? ''}
                                        />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />

                        <FormField
                            control={form.control}
                            name="longitude"
                            render={({ field }) => (
                                <FormItem>
                                    <FormLabel>Longitud</FormLabel>
                                    <FormControl>
                                        <Input
                                            type="number"
                                            step="any"
                                            placeholder="-3.7038"
                                            {...field}
                                            onChange={(e) => field.onChange(e.target.value ? parseFloat(e.target.value) : undefined)}
                                            value={field.value ?? ''}
                                        />
                                    </FormControl>
                                    <FormMessage />
                                </FormItem>
                            )}
                        />
                    </div>
                    <FormDescription className="max-w-xl">
                        Las coordenadas son opcionales pero recomendadas por si la dirección no se geolocaliza correctamente en el mapa.
                    </FormDescription>
                </div>

                <div className="flex justify-end pt-4 border-t">
                    <Button type="submit" disabled={isSubmitting} className="bg-pink-500 hover:bg-pink-600">
                        {isSubmitting ? (
                            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                        ) : (
                            <Save className="mr-2 h-4 w-4" />
                        )}
                        Guardar Ubicación
                    </Button>
                </div>
            </form>
        </Form>
    )
}
