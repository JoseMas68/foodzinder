'use client'

import { useForm } from 'react-hook-form'
import { Button } from '@/components/ui/button'
import {
    Form,
    FormControl,
    FormField,
    FormItem,
    FormLabel,
    FormMessage,
} from '@/components/ui/form'
import { Loader2, Save, Clock } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { OpeningHoursInput } from '../opening-hours-input'

interface HoursFormProps {
    initialData: any[]
    onSubmit: (data: any) => Promise<{ success: boolean; error?: string }>
}

export function HoursForm({ initialData, onSubmit }: HoursFormProps) {
    const [isSubmitting, setIsSubmitting] = useState(false)

    const form = useForm({
        defaultValues: {
            openingHours: initialData || [],
        },
    })

    const handleSubmit = async (data: any) => {
        setIsSubmitting(true)
        try {
            const result = await onSubmit(data)
            if (result.success) {
                toast.success('Horarios actualizados correctamente')
            } else {
                toast.error(result.error || 'Error al guardar los horarios')
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
                        <Clock className="h-6 w-6 text-pink-500" />
                        Horarios de Apertura
                    </h2>
                    <p className="text-muted-foreground text-sm">
                        Define cuándo está abierto tu restaurante. Estos horarios son fundamentales para las reservas.
                    </p>
                </div>

                <FormField
                    control={form.control}
                    name="openingHours"
                    render={({ field }) => (
                        <FormItem>
                            <FormControl>
                                <OpeningHoursInput
                                    value={field.value}
                                    onChange={field.onChange}
                                />
                            </FormControl>
                            <FormMessage />
                        </FormItem>
                    )}
                />

                <div className="flex justify-end pt-4 border-t">
                    <Button type="submit" disabled={isSubmitting} className="bg-pink-500 hover:bg-pink-600">
                        {isSubmitting ? (
                            <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                        ) : (
                            <Save className="mr-2 h-4 w-4" />
                        )}
                        Guardar Horarios
                    </Button>
                </div>
            </form>
        </Form>
    )
}
