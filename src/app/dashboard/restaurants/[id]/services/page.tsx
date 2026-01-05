import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { ArrowLeft, Clock, Utensils } from "lucide-react";
import { ServiceList } from "@/components/booking-services/service-list";
import { CreateServiceDialog } from "@/components/booking-services/create-service-dialog";
import { RestaurantManagementTabs } from "@/components/dashboard/restaurants/restaurant-management-tabs";
import Link from "next/link";

interface PageProps {
  params: Promise<{
    id: string;
  }>;
}

const DAYS_OF_WEEK = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];

export default async function BookingServicesPage({ params }: PageProps) {
  const user = await getCurrentUser();
  const { id: restaurantId } = await params;

  if (!user) {
    redirect("/sign-in");
  }

  // Check if user owns this restaurant or is admin
  const restaurant = await prisma.restaurant.findUnique({
    where: { id: restaurantId },
    select: {
      id: true,
      name: true,
      ownerId: true,
    },
  });

  if (!restaurant) {
    redirect("/dashboard/restaurants");
  }

  if (restaurant.ownerId !== user.id && user.role !== "ADMIN") {
    redirect("/dashboard/restaurants");
  }

  // Get booking services with slots
  const services = await prisma.bookingService.findMany({
    where: { restaurantId },
    include: {
      slots: {
        orderBy: {
          startTime: "asc",
        },
      },
    },
    orderBy: {
      createdAt: "asc",
    },
  });

  return (
    <div className="space-y-8">
      {/* Header */}
      <div className="space-y-4">
        <div className="flex flex-wrap items-center justify-between gap-4">
          <div className="flex items-center gap-4">
            <Button variant="ghost" size="icon" asChild>
              <Link href={`/dashboard/restaurants/${restaurantId}`}>
                <ArrowLeft className="h-4 w-4" />
              </Link>
            </Button>
            <div>
              <h1 className="text-3xl font-heading font-bold">Servicios de Reserva</h1>
              <p className="text-gray-500 mt-1">
                Configura los horarios y turnos para {restaurant.name}
              </p>
            </div>
          </div>
          <CreateServiceDialog restaurantId={restaurantId} />
        </div>
        <RestaurantManagementTabs restaurantId={restaurantId} activeTab="services" />
      </div>

      {/* Info Card */}
      <Card className="bg-blue-50 border-blue-200">
        <CardContent className="p-4">
          <div className="flex items-start gap-3">
            <Utensils className="h-5 w-5 text-blue-600 mt-0.5 flex-shrink-0" />
            <div className="text-sm text-blue-900">
              <p className="font-medium mb-1">¿Cómo funciona?</p>
              <ul className="space-y-1 text-blue-800">
                <li>• Crea servicios (Comida, Cena, Brunch) con sus horarios</li>
                <li>• Define turnos para cada servicio (ej: 20:00-21:30, 21:30-23:00)</li>
                <li>• Los clientes solo podrán reservar en los turnos configurados</li>
                <li>• Puedes activar/desactivar servicios según el día de la semana</li>
              </ul>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Services List */}
      {services.length === 0 ? (
        <Card>
          <CardContent className="p-12">
            <div className="text-center text-gray-500">
              <Utensils className="h-12 w-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">No hay servicios configurados</p>
              <p className="text-sm mt-1">
                Crea tu primer servicio para empezar a aceptar reservas
              </p>
              <div className="mt-4">
                <CreateServiceDialog restaurantId={restaurantId} variant="primary" />
              </div>
            </div>
          </CardContent>
        </Card>
      ) : (
        <div className="space-y-4">
          {services.map((service) => (
            <Card key={service.id} className={!service.isActive ? "opacity-60" : ""}>
              <CardHeader>
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    <div className="flex items-center gap-3">
                      <CardTitle className="flex items-center gap-2">
                        <Utensils className="h-5 w-5 text-primary" />
                        {service.name}
                      </CardTitle>
                      {service.isActive ? (
                        <Badge className="bg-green-100 text-green-800">Activo</Badge>
                      ) : (
                        <Badge variant="outline">Inactivo</Badge>
                      )}
                    </div>
                    {service.description && (
                      <CardDescription className="mt-1">{service.description}</CardDescription>
                    )}
                  </div>
                </div>
              </CardHeader>
              <CardContent>
                <div className="space-y-4">
                  {/* Days of Week */}
                  <div>
                    <p className="text-sm font-medium text-gray-700 mb-2">Días activos:</p>
                    <div className="flex flex-wrap gap-2">
                      {service.daysOfWeek.map((day) => (
                        <Badge key={day} variant="outline">
                          {DAYS_OF_WEEK[day]}
                        </Badge>
                      ))}
                    </div>
                  </div>

                  {/* Time Slots */}
                  <div>
                    <p className="text-sm font-medium text-gray-700 mb-2">
                      Turnos ({service.slots.length}):
                    </p>
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-3">
                      {service.slots.map((slot) => (
                        <div
                          key={slot.id}
                          className="flex items-center gap-2 p-3 bg-gray-50 rounded-lg border"
                        >
                          <Clock className="h-4 w-4 text-gray-500 flex-shrink-0" />
                          <div className="flex-1 min-w-0">
                            <p className="font-medium text-sm">
                              {slot.startTime} - {slot.endTime}
                            </p>
                            <p className="text-xs text-gray-600">
                              {slot.durationMinutes} minutos
                              {slot.maxCapacity && ` • Máx ${slot.maxCapacity} personas`}
                            </p>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      )}

      {/* Service List Component (for edit/delete actions) */}
      <ServiceList services={services} restaurantId={restaurantId} />
    </div>
  );
}
