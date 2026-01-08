import { redirect } from 'next/navigation'
import { getCurrentUser } from '@/lib/auth/roles'
import { getOwnerRestaurantStats, getOwnerRecentReviews } from '@/server/queries/owner'
import { StatsCard } from '@/components/dashboard/stats-card'
import { Building2, Clock, Star, TrendingUp } from 'lucide-react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { formatDistanceToNow } from 'date-fns'
import { es } from 'date-fns/locale'

export default async function DashboardPage() {
  const user = await getCurrentUser()

  if (!user) {
    redirect('/sign-in')
  }

  if (user.role !== 'OWNER' && user.role !== 'ADMIN') {
    redirect('/')
  }

  const stats = await getOwnerRestaurantStats(user.id)
  const recentReviews = await getOwnerRecentReviews(user.id, 5)

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-bold font-heading">
          ¡Bienvenido, {user.firstName}!
        </h1>
        <p className="text-muted-foreground mt-1">
          Aquí está el resumen de tus restaurantes
        </p>
      </div>

      {/* Stats Grid */}
      <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
        <StatsCard
          title="Total Restaurantes"
          value={stats.totalRestaurants}
          icon={Building2}
          description="Restaurantes registrados"
        />
        <StatsCard
          title="Pendientes"
          value={stats.byStatus['PENDING'] || 0}
          icon={Clock}
          description="En espera de aprobación"
          variant="warning"
        />
        <StatsCard
          title="Aprobados"
          value={stats.byStatus['APPROVED'] || 0}
          icon={TrendingUp}
          description="Restaurantes activos"
          variant="success"
        />
        <StatsCard
          title="Total Reseñas"
          value={stats.totalReviews}
          icon={Star}
          description="Reseñas recibidas"
        />
      </div>

      {/* Recent Reviews */}
      <Card>
        <CardHeader>
          <CardTitle>Reseñas Recientes</CardTitle>
          <CardDescription>
            Últimas opiniones de tus clientes
          </CardDescription>
        </CardHeader>
        <CardContent>
          {recentReviews.length === 0 ? (
            <p className="text-sm text-muted-foreground text-center py-8">
              Aún no tienes reseñas
            </p>
          ) : (
            <div className="space-y-4">
              {recentReviews.map((review) => (
                <div
                  key={review.id}
                  className="flex items-start gap-4 pb-4 border-b last:border-0"
                >
                  <div className="flex-1 space-y-1">
                    <div className="flex items-center gap-2">
                      <p className="text-sm font-medium">
                        {review.user?.firstName || 'Usuario'} {review.user?.lastName || 'Desconocido'}
                      </p>
                      {review.restaurant && (
                        <span className="text-xs text-muted-foreground">
                          en {review.restaurant.name}
                        </span>
                      )}
                    </div>
                    <div className="flex items-center gap-1">
                      {[...Array(5)].map((_, i) => (
                        <Star
                          key={i}
                          className={`w-3 h-3 ${i < (review.rating || 0)
                              ? 'fill-yellow-400 text-yellow-400'
                              : 'text-gray-300'
                            }`}
                        />
                      ))}
                    </div>
                    <p className="text-sm text-muted-foreground line-clamp-2">
                      {review.comment || 'Sin comentario'}
                    </p>
                    <p className="text-xs text-muted-foreground">
                      {review.createdAt ? formatDistanceToNow(new Date(review.createdAt), {
                        addSuffix: true,
                        locale: es,
                      }) : 'Recientemente'}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </div>
  )
}
