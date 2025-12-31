'use client'

import { useForm } from 'react-hook-form'
import { zodResolver } from '@hookform/resolvers/zod'
import { restaurantCreateSchema, type RestaurantCreate } from '@/lib/validations'
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
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Loader2, Image as ImageIcon, Clock, Utensils } from 'lucide-react'
import { useState } from 'react'
import { ImageUpload } from '@/components/ui/image-upload'
import { OpeningHoursInput } from './opening-hours-input'
import { CuisineTypeSelector } from './cuisine-type-selector'

interface RestaurantFormProps {
  initialData?: Partial<RestaurantCreate> & {
    id?: string
    cuisineTypeIds?: string[]
  }
  onSubmit: (data: RestaurantCreate) => Promise<{ success: boolean; error?: string }>
  isEditing?: boolean
  cuisineTypes: Array<{ id: string; name: string; slug: string }>
}

const priceRangeLabels = {
  CHEAP: 'Económico (€)',
  MODERATE: 'Moderado (€€)',
  EXPENSIVE: 'Caro (€€€)',
  LUXURY: 'Lujo (€€€€)',
}

export function RestaurantForm({ initialData, onSubmit, isEditing = false, cuisineTypes }: RestaurantFormProps) {
  const [isSubmitting, setIsSubmitting] = useState(false)

  const form = useForm<RestaurantCreate>({
    resolver: zodResolver(restaurantCreateSchema),
    defaultValues: {
      name: initialData?.name || '',
      description: initialData?.description || '',
      address: initialData?.address || '',
      latitude: initialData?.latitude,
      longitude: initialData?.longitude,
      priceRange: initialData?.priceRange || 'MODERATE',
      phone: initialData?.phone || '',
      website: initialData?.website || '',
      logoUrl: initialData?.logoUrl || '',
      coverUrl: initialData?.coverUrl || '',
      cuisineTypeIds: initialData?.cuisineTypeIds || [],
      openingHours: initialData?.openingHours || [],
    },
  })

  const handleSubmit = async (data: RestaurantCreate) => {
    setIsSubmitting(true)
    try {
      const result = await onSubmit(data)
      if (!result.success) {
        form.setError('root', {
          type: 'manual',
          message: result.error || 'Error al guardar el restaurante',
        })
      }
    } finally {
      setIsSubmitting(false)
    }
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(handleSubmit)} className="space-y-6">
        {/* Imágenes */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <ImageIcon className="h-5 w-5" />
              Imágenes del Restaurante
            </CardTitle>
            <CardDescription>
              Sube un logo y una imagen de portada para tu restaurante
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            <FormField
              control={form.control}
              name="logoUrl"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Logo del Restaurante</FormLabel>
                  <FormControl>
                    <ImageUpload
                      value={field.value}
                      onChange={field.onChange}
                      onRemove={() => field.onChange('')}
                    />
                  </FormControl>
                  <FormDescription>
                    Imagen cuadrada recomendada (mín. 400x400px)
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
                  <FormLabel>Imagen de Portada</FormLabel>
                  <FormControl>
                    <ImageUpload
                      value={field.value}
                      onChange={field.onChange}
                      onRemove={() => field.onChange('')}
                    />
                  </FormControl>
                  <FormDescription>
                    Imagen panorámica recomendada (mín. 1200x600px)
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />
          </CardContent>
        </Card>

        {/* Información Básica */}
        <Card>
          <CardHeader>
            <CardTitle>Información Básica</CardTitle>
            <CardDescription>
              Datos principales de tu restaurante
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <FormField
              control={form.control}
              name="name"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Nombre del Restaurante</FormLabel>
                  <FormControl>
                    <Input placeholder="La Bella Italia" {...field} />
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
                      placeholder="Describe tu restaurante, especialidades, ambiente..."
                      className="min-h-32 resize-none"
                      {...field}
                    />
                  </FormControl>
                  <FormDescription>
                    Mínimo 10 caracteres. Cuenta a tus clientes qué hace especial a tu restaurante.
                  </FormDescription>
                  <FormMessage />
                </FormItem>
              )}
            />

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
          </CardContent>
        </Card>

        {/* Tipo de Cocina */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Utensils className="h-5 w-5" />
              Tipo de Cocina
            </CardTitle>
            <CardDescription>
              Selecciona los tipos de cocina que ofrece tu restaurante
            </CardDescription>
          </CardHeader>
          <CardContent>
            <FormField
              control={form.control}
              name="cuisineTypeIds"
              render={({ field }) => (
                <FormItem>
                  <FormControl>
                    <CuisineTypeSelector
                      value={field.value}
                      onChange={field.onChange}
                      taxonomies={cuisineTypes}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
          </CardContent>
        </Card>

        {/* Ubicación */}
        <Card>
          <CardHeader>
            <CardTitle>Ubicación</CardTitle>
            <CardDescription>
              Dirección y coordenadas de tu restaurante
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <FormField
              control={form.control}
              name="address"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Dirección Completa</FormLabel>
                  <FormControl>
                    <Input placeholder="Calle Mayor, 123, Madrid" {...field} />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />

            <div className="grid grid-cols-2 gap-4">
              <FormField
                control={form.control}
                name="latitude"
                render={({ field }) => (
                  <FormItem>
                    <FormLabel>Latitud (opcional)</FormLabel>
                    <FormControl>
                      <Input
                        type="number"
                        step="any"
                        placeholder="40.416775"
                        {...field}
                        onChange={(e) => field.onChange(e.target.value ? parseFloat(e.target.value) : undefined)}
                        value={field.value || ''}
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
                    <FormLabel>Longitud (opcional)</FormLabel>
                    <FormControl>
                      <Input
                        type="number"
                        step="any"
                        placeholder="-3.703790"
                        {...field}
                        onChange={(e) => field.onChange(e.target.value ? parseFloat(e.target.value) : undefined)}
                        value={field.value || ''}
                      />
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )}
              />
            </div>
            <FormDescription>
              Las coordenadas ayudan a mostrar tu restaurante en el mapa. Puedes obtenerlas desde Google Maps.
            </FormDescription>
          </CardContent>
        </Card>

        {/* Horarios de Apertura */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Clock className="h-5 w-5" />
              Horarios de Apertura
            </CardTitle>
            <CardDescription>
              Configura los horarios de tu restaurante para cada día de la semana
            </CardDescription>
          </CardHeader>
          <CardContent>
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
          </CardContent>
        </Card>

        {/* Información de Contacto */}
        <Card>
          <CardHeader>
            <CardTitle>Información de Contacto</CardTitle>
            <CardDescription>
              Datos de contacto para tus clientes
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-4">
            <FormField
              control={form.control}
              name="phone"
              render={({ field }) => (
                <FormItem>
                  <FormLabel>Teléfono (opcional)</FormLabel>
                  <FormControl>
                    <Input placeholder="+34 912 345 678" {...field} />
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
                  <FormLabel>Sitio Web (opcional)</FormLabel>
                  <FormControl>
                    <Input
                      type="url"
                      placeholder="https://www.mirestaurante.com"
                      {...field}
                    />
                  </FormControl>
                  <FormMessage />
                </FormItem>
              )}
            />
          </CardContent>
        </Card>

        {/* Error General */}
        {form.formState.errors.root && (
          <div className="rounded-md bg-destructive/10 p-4 text-sm text-destructive">
            {form.formState.errors.root.message}
          </div>
        )}

        {/* Botones */}
        <div className="flex justify-end gap-4">
          <Button
            type="button"
            variant="outline"
            onClick={() => window.history.back()}
            disabled={isSubmitting}
          >
            Cancelar
          </Button>
          <Button type="submit" disabled={isSubmitting}>
            {isSubmitting && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            {isEditing ? 'Guardar Cambios' : 'Crear Restaurante'}
          </Button>
        </div>
      </form>
    </Form>
  )
}
