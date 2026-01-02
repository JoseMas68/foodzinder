import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Calendar, Utensils, AlertCircle } from "lucide-react";
import { TableAvailabilityManager } from "@/components/booking-services/table-availability-manager";

interface PageProps {
  params: Promise<{
    id: string;
  }>;
}

export default async function TableAvailabilityPage({ params }: PageProps) {
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

  // Get booking services
  const services = await prisma.bookingService.findMany({
    where: {
      restaurantId,
      isActive: true,
    },
    include: {
      slots: {
        orderBy: {
          startTime: "asc",
        },
      },
    },
    orderBy: {
      name: "asc",
    },
  });

  // Get tables
  const tables = await prisma.table.findMany({
    where: {
      restaurantId,
      isActive: true,
    },
    orderBy: [{ area: "asc" }, { tableNumber: "asc" }],
  });

  // Get reminder configuration
  const reminder = await prisma.bookingReminder.findUnique({
    where: { restaurantId },
  });

  return (
    <div className="space-y-8">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-heading font-bold">Disponibilidad de Mesas</h1>
        <p className="text-gray-500 mt-1">
          Gestiona qué mesas están disponibles para reservas en {restaurant.name}
        </p>
      </div>

      {/* Check if services exist */}
      {services.length === 0 ? (
        <Card className="border-yellow-200 bg-yellow-50">
          <CardContent className="p-6">
            <div className="flex items-start gap-3">
              <AlertCircle className="h-5 w-5 text-yellow-600 mt-0.5 flex-shrink-0" />
              <div>
                <p className="font-medium text-yellow-900">
                  No hay servicios configurados
                </p>
                <p className="text-sm text-yellow-800 mt-1">
                  Primero debes crear al menos un servicio de reserva (Comida, Cena, etc.) antes de
                  poder gestionar la disponibilidad de mesas.
                </p>
                <a
                  href={`/dashboard/restaurants/${restaurantId}/services`}
                  className="text-sm font-medium text-yellow-900 underline mt-2 inline-block"
                >
                  Ir a Configuración de Servicios →
                </a>
              </div>
            </div>
          </CardContent>
        </Card>
      ) : tables.length === 0 ? (
        <Card className="border-yellow-200 bg-yellow-50">
          <CardContent className="p-6">
            <div className="flex items-start gap-3">
              <AlertCircle className="h-5 w-5 text-yellow-600 mt-0.5 flex-shrink-0" />
              <div>
                <p className="font-medium text-yellow-900">No hay mesas activas</p>
                <p className="text-sm text-yellow-800 mt-1">
                  Necesitas tener al menos una mesa activa para poder gestionar la disponibilidad.
                </p>
                <a
                  href={`/dashboard/restaurants/${restaurantId}/tables`}
                  className="text-sm font-medium text-yellow-900 underline mt-2 inline-block"
                >
                  Ir a Gestión de Mesas →
                </a>
              </div>
            </div>
          </CardContent>
        </Card>
      ) : (
        <>
          {/* Info Card */}
          <Card className="bg-blue-50 border-blue-200">
            <CardContent className="p-4">
              <div className="flex items-start gap-3">
                <Utensils className="h-5 w-5 text-blue-600 mt-0.5 flex-shrink-0" />
                <div className="text-sm text-blue-900">
                  <p className="font-medium mb-1">¿Cómo funciona?</p>
                  <ul className="space-y-1 text-blue-800">
                    <li>
                      • Por defecto, todas las mesas activas están disponibles para reservas
                    </li>
                    <li>
                      • Puedes desactivar mesas específicas para días concretos si no quieres
                      aceptar reservas en ellas
                    </li>
                    <li>
                      • Los cambios solo afectan al día y servicio seleccionados
                    </li>
                    <li>• Configura recordatorios diarios para no olvidar ajustar disponibilidad</li>
                  </ul>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Table Availability Manager */}
          <TableAvailabilityManager
            restaurantId={restaurantId}
            services={services}
            tables={tables}
            reminder={reminder}
          />
        </>
      )}
    </div>
  );
}
