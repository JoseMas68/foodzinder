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
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card'
import { Loader2, Save, Image as ImageIcon } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { ImageUpload } from '@/components/ui/image-upload'

interface MediaFormProps {
    initialData: {
        logoUrl?: string | null
        coverUrl?: string | null
    }
    onSubmit: (data: any) => Promise<{ success: boolean; error?: string }>
}

export function MediaForm({ initialData, onSubmit }: MediaFormProps) {
    const [isSubmitting, setIsSubmitting] = useState(false)

    const form = useForm({
        defaultValues: {
            logoUrl: initialData?.logoUrl || '',
            coverUrl: initialData?.coverUrl || '',
        },
    })

    const handleSubmit = async (data: any) => {
        setIsSubmitting(true)
        try {
            const result = await onSubmit(data)
            if (result.success) {
                toast.success('Imágenes actualizadas correctamente')
            } else {
                toast.error(result.error || 'Error al guardar las imágenes')
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
                        <ImageIcon className="h-6 w-6 text-pink-500" />
                        Multimedia
                    </h2>
                    <p className="text-muted-foreground text-sm">
                        Gestiona la identidad visual de tu restaurante.
                    </p>
                </div>

                <div className="grid gap-8">
                    <FormField
                        control={form.control}
                        name="logoUrl"
                        render={({ field }) => (
                            <FormItem>
                                <FormLabel className="text-base font-semibold">Logo del Restaurante</FormLabel>
                                <FormControl>
                                    <ImageUpload
                                        value={field.value || ''}
                                        onChange={field.onChange}
                                        onRemove={() => field.onChange('')}
                                    />
                                </FormControl>
                                <FormDescription>
                                    Se recomienda una imagen cuadrada de al menos 400x400px.
                                </FormDescription>
                                <FormMessage />
                            </FormItem>
                        )}
                    />

                    <FormField
                        control={form.control}
                        name="coverUrl"
                        render={({ field }) => (
                            <FormItem>
                                <FormLabel className="text-base font-semibold">Imagen de Portada</FormLabel>
                                <FormControl>
                                    <ImageUpload
                                        value={field.value || ''}
                                        onChange={field.onChange}
                                        onRemove={() => field.onChange('')}
                                    />
                                </FormControl>
                                <FormDescription>
                                    Esta es la imagen principal que verán los usuarios. Se recomienda un formato panorámico.
                                </FormDescription>
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
                        Guardar Imágenes
                    </Button>
                </div>
            </form>
        </Form>
    )
}
