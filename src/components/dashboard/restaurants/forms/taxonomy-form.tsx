'use client'

import { useForm } from 'react-hook-form'
import { Button } from '@/components/ui/button'
import {
    Form,
    FormControl,
    FormField,
    FormItem,
    FormMessage,
} from '@/components/ui/form'
import { Loader2, Save, Tags, Utensils, Sparkles, Leaf, Heart } from 'lucide-react'
import { useState } from 'react'
import { toast } from 'sonner'
import { CuisineTypeSelector } from '../cuisine-type-selector'
import { TaxonomySelector } from '../taxonomy-selector'

interface TaxonomyFormProps {
    initialData: {
        cuisineTypeIds: string[]
        featureIds: string[]
        dietaryIds: string[]
        ambianceIds: string[]
    }
    onSubmit: (data: any) => Promise<{ success: boolean; error?: string }>
    taxonomies: {
        cuisineTypes: any[]
        features: any[]
        dietary: any[]
        ambiances: any[]
    }
}

export function TaxonomyForm({ initialData, onSubmit, taxonomies }: TaxonomyFormProps) {
    const [isSubmitting, setIsSubmitting] = useState(false)

    const form = useForm({
        defaultValues: {
            cuisineTypeIds: initialData?.cuisineTypeIds || [],
            featureIds: initialData?.featureIds || [],
            dietaryIds: initialData?.dietaryIds || [],
            ambianceIds: initialData?.ambianceIds || [],
        },
    })

    const handleSubmit = async (data: any) => {
        setIsSubmitting(true)
        try {
            const result = await onSubmit(data)
            if (result.success) {
                toast.success('Categorías actualizadas correctamente')
            } else {
                toast.error(result.error || 'Error al guardar las categorías')
            }
        } catch (error) {
            toast.error('Ocurrió un error inesperado')
        } finally {
            setIsSubmitting(false)
        }
    }

    return (
        <Form {...form}>
            <form onSubmit={form.handleSubmit(handleSubmit)} className="space-y-10">
                <div>
                    <h2 className="text-2xl font-bold mb-1 flex items-center gap-2">
                        <Tags className="h-6 w-6 text-pink-500" />
                        Categorización
                    </h2>
                    <p className="text-muted-foreground text-sm">
                        Clasifica tu restaurante para que los usuarios puedan encontrarlo más fácilmente.
                    </p>
                </div>

                <div className="grid gap-8">
                    {/* Tipo de Cocina */}
                    <FormField
                        control={form.control}
                        name="cuisineTypeIds"
                        render={({ field }) => (
                            <FormItem>
                                <FormControl>
                                    <CuisineTypeSelector
                                        value={field.value}
                                        onChange={field.onChange}
                                        taxonomies={taxonomies.cuisineTypes}
                                    />
                                </FormControl>
                                <FormMessage />
                            </FormItem>
                        )}
                    />

                    {/* Características */}
                    <FormField
                        control={form.control}
                        name="featureIds"
                        render={({ field }) => (
                            <FormItem>
                                <FormControl>
                                    <TaxonomySelector
                                        value={field.value}
                                        onChange={field.onChange}
                                        taxonomies={taxonomies.features}
                                        title="Características"
                                        description="Servicios y facilidades disponibles"
                                        icon={<Sparkles className="h-5 w-5 text-pink-500" />}
                                    />
                                </FormControl>
                                <FormMessage />
                            </FormItem>
                        )}
                    />

                    {/* Opciones Dietéticas */}
                    <FormField
                        control={form.control}
                        name="dietaryIds"
                        render={({ field }) => (
                            <FormItem>
                                <FormControl>
                                    <TaxonomySelector
                                        value={field.value}
                                        onChange={field.onChange}
                                        taxonomies={taxonomies.dietary}
                                        title="Opciones Dietéticas"
                                        description="Opciones especiales de alimentación"
                                        icon={<Leaf className="h-5 w-5 text-pink-500" />}
                                    />
                                </FormControl>
                                <FormMessage />
                            </FormItem>
                        )}
                    />

                    {/* Ambiente */}
                    <FormField
                        control={form.control}
                        name="ambianceIds"
                        render={({ field }) => (
                            <FormItem>
                                <FormControl>
                                    <TaxonomySelector
                                        value={field.value}
                                        onChange={field.onChange}
                                        taxonomies={taxonomies.ambiances}
                                        title="Ambiente"
                                        description="Clasifica el estilo y atmósfera"
                                        icon={<Heart className="h-5 w-5 text-pink-500" />}
                                    />
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
                        Guardar Categorías
                    </Button>
                </div>
            </form>
        </Form>
    )
}
