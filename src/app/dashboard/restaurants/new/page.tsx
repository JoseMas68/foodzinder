import { redirect } from 'next/navigation'
import { getCurrentUser } from '@/lib/auth/roles'
import { createRestaurant } from '@/server/actions/restaurants'
import { RestaurantForm } from '@/components/dashboard/restaurants/restaurant-form'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import Link from 'next/link'
import { ChevronLeft } from 'lucide-react'
import { Button } from '@/components/ui/button'
import { getTaxonomies } from '@/server/queries/restaurants'

export default async function NewRestaurantPage() {
  const user = await getCurrentUser()

  if (!user) {
    redirect('/sign-in')
  }

  if (user.role !== 'OWNER' && user.role !== 'ADMIN') {
    redirect('/')
  }

  // Obtener tipos de cocina para el selector
  const cuisineTypes = await getTaxonomies('CUISINE_TYPE')

  async function handleCreateRestaurant(data: any) {
    'use server'

    const result = await createRestaurant(data)

    if (result.success) {
      redirect('/dashboard/restaurants')
    }

    return result
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center gap-4">
        <Button variant="ghost" size="icon" asChild>
          <Link href="/dashboard/restaurants">
            <ChevronLeft className="h-5 w-5" />
          </Link>
        </Button>
        <div>
          <h1 className="text-3xl font-bold">Nuevo Restaurante</h1>
          <p className="text-muted-foreground mt-1">
            Crea un nuevo restaurante en Foodzinder
          </p>
        </div>
      </div>

      {/* Info Card */}
      <Card className="border-primary/20 bg-primary/5">
        <CardHeader>
          <CardTitle className="text-lg">Proceso de Aprobación</CardTitle>
          <CardDescription>
            Tu restaurante será revisado por nuestro equipo antes de ser publicado.
            Recibirás una notificación cuando el estado cambie.
          </CardDescription>
        </CardHeader>
      </Card>

      {/* Form */}
      <RestaurantForm onSubmit={handleCreateRestaurant} cuisineTypes={cuisineTypes} />
    </div>
  )
}
