import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Calendar, MapPin, Users, Clock, Phone, Mail, User, MessageSquare } from "lucide-react";
import Link from "next/link";
import Image from "next/image";
import { CancelBookingButton } from "@/components/bookings/cancel-booking-button";

export default async function BookingsPage() {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  const bookings = await prisma.booking.findMany({
    where: { userId: user.id },
    include: {
      restaurant: {
        select: {
          id: true,
          name: true,
          slug: true,
          address: true,
          logoUrl: true,
          coverUrl: true,
          phone: true,
        },
      },
    },
    orderBy: {
      date: "desc",
    },
  });

  // Separar reservas por estado
  const upcomingBookings = bookings.filter(
    (b) => b.status === "PENDING" || b.status === "CONFIRMED"
  );
  const pastBookings = bookings.filter(
    (b) => b.status === "COMPLETED" || b.status === "CANCELLED" || b.status === "NO_SHOW"
  );

  const statusConfig = {
    PENDING: { label: "Pendiente", variant: "secondary" as const, color: "bg-yellow-100 text-yellow-800" },
    CONFIRMED: { label: "Confirmada", variant: "default" as const, color: "bg-green-100 text-green-800" },
    CANCELLED: { label: "Cancelada", variant: "destructive" as const, color: "bg-red-100 text-red-800" },
    COMPLETED: { label: "Completada", variant: "outline" as const, color: "bg-blue-100 text-blue-800" },
    NO_SHOW: { label: "No asistió", variant: "destructive" as const, color: "bg-gray-100 text-gray-800" },
  };

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-heading font-bold">Mis Reservas</h1>
        <p className="text-gray-500 mt-1">
          Gestiona tus reservas de restaurantes
        </p>
      </div>

      {/* Próximas Reservas */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Calendar className="h-5 w-5 text-primary" />
            Próximas Reservas ({upcomingBookings.length})
          </CardTitle>
          <CardDescription>
            Reservas pendientes y confirmadas
          </CardDescription>
        </CardHeader>
        <CardContent>
          {upcomingBookings.length === 0 ? (
            <div className="text-center py-12 text-gray-500">
              <Calendar className="h-12 w-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">No tienes reservas próximas</p>
              <p className="text-sm mt-1">
                Explora restaurantes y haz tu primera reserva
              </p>
              <Link
                href="/"
                className="inline-block mt-4 text-primary hover:underline"
              >
                Explorar Restaurantes →
              </Link>
            </div>
          ) : (
            <div className="space-y-4">
              {upcomingBookings.map((booking) => {
                const status = statusConfig[booking.status];
                const bookingDate = new Date(booking.date);
                const isToday = bookingDate.toDateString() === new Date().toDateString();

                return (
                  <Card key={booking.id} className="overflow-hidden">
                    <div className="flex flex-col md:flex-row">
                      {/* Imagen del restaurante */}
                      <div className="relative h-48 md:h-auto md:w-48 bg-gray-100 flex-shrink-0">
                        {booking.restaurant.coverUrl ? (
                          <Image
                            src={booking.restaurant.coverUrl}
                            alt={booking.restaurant.name}
                            fill
                            className="object-cover"
                          />
                        ) : (
                          <div className="absolute inset-0 bg-gradient-to-br from-primary/20 to-primary/5" />
                        )}

                        {/* Logo overlay */}
                        {booking.restaurant.logoUrl && (
                          <div className="absolute bottom-4 left-4">
                            <div className="w-12 h-12 rounded-full overflow-hidden border-2 border-white shadow-lg">
                              <Image
                                src={booking.restaurant.logoUrl}
                                alt={`${booking.restaurant.name} logo`}
                                width={48}
                                height={48}
                                className="object-cover"
                              />
                            </div>
                          </div>
                        )}
                      </div>

                      {/* Detalles */}
                      <CardContent className="flex-1 p-6">
                        <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4 mb-4">
                          <div>
                            <Link
                              href={`/restaurants/${booking.restaurant.slug}`}
                              className="text-xl font-bold hover:text-primary transition-colors"
                            >
                              {booking.restaurant.name}
                            </Link>
                            <div className="flex items-center gap-2 mt-2">
                              <Badge className={status.color}>
                                {status.label}
                              </Badge>
                              {isToday && (
                                <Badge variant="outline" className="bg-primary/10 text-primary border-primary">
                                  Hoy
                                </Badge>
                              )}
                            </div>
                          </div>

                          {/* Acciones */}
                          {(booking.status === "PENDING" || booking.status === "CONFIRMED") && (
                            <CancelBookingButton bookingId={booking.id} />
                          )}
                        </div>

                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm">
                          <div className="flex items-center gap-2 text-gray-700">
                            <Calendar className="h-4 w-4 text-primary flex-shrink-0" />
                            <span>
                              {bookingDate.toLocaleDateString("es-ES", {
                                weekday: "long",
                                year: "numeric",
                                month: "long",
                                day: "numeric",
                              })}
                            </span>
                          </div>

                          <div className="flex items-center gap-2 text-gray-700">
                            <Clock className="h-4 w-4 text-primary flex-shrink-0" />
                            <span>{booking.time}</span>
                          </div>

                          <div className="flex items-center gap-2 text-gray-700">
                            <Users className="h-4 w-4 text-primary flex-shrink-0" />
                            <span>
                              {booking.partySize} {booking.partySize === 1 ? "persona" : "personas"}
                            </span>
                          </div>

                          <div className="flex items-center gap-2 text-gray-700">
                            <MapPin className="h-4 w-4 text-primary flex-shrink-0" />
                            <span className="line-clamp-1">{booking.restaurant.address}</span>
                          </div>
                        </div>

                        {/* Información de contacto */}
                        <div className="mt-4 pt-4 border-t">
                          <h4 className="font-semibold text-sm text-gray-900 mb-2">Información de contacto</h4>
                          <div className="grid grid-cols-1 md:grid-cols-2 gap-2 text-sm text-gray-600">
                            <div className="flex items-center gap-2">
                              <User className="h-4 w-4 text-gray-400 flex-shrink-0" />
                              <span>{booking.customerName}</span>
                            </div>
                            <div className="flex items-center gap-2">
                              <Mail className="h-4 w-4 text-gray-400 flex-shrink-0" />
                              <span className="truncate">{booking.customerEmail}</span>
                            </div>
                            <div className="flex items-center gap-2">
                              <Phone className="h-4 w-4 text-gray-400 flex-shrink-0" />
                              <span>{booking.customerPhone}</span>
                            </div>
                          </div>
                        </div>

                        {/* Notas especiales */}
                        {booking.specialNotes && (
                          <div className="mt-4 pt-4 border-t">
                            <div className="flex items-start gap-2 text-sm">
                              <MessageSquare className="h-4 w-4 text-gray-400 flex-shrink-0 mt-0.5" />
                              <div>
                                <span className="font-semibold text-gray-900">Notas: </span>
                                <span className="text-gray-600">{booking.specialNotes}</span>
                              </div>
                            </div>
                          </div>
                        )}
                      </CardContent>
                    </div>
                  </Card>
                );
              })}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Historial de Reservas */}
      {pastBookings.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Clock className="h-5 w-5 text-gray-500" />
              Historial ({pastBookings.length})
            </CardTitle>
            <CardDescription>
              Reservas pasadas y canceladas
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {pastBookings.map((booking) => {
                const status = statusConfig[booking.status];
                const bookingDate = new Date(booking.date);

                return (
                  <Card key={booking.id} className="overflow-hidden opacity-75 hover:opacity-100 transition-opacity">
                    <CardContent className="p-4">
                      <div className="flex flex-col md:flex-row md:items-center md:justify-between gap-4">
                        <div className="flex-1">
                          <Link
                            href={`/restaurants/${booking.restaurant.slug}`}
                            className="font-bold hover:text-primary transition-colors"
                          >
                            {booking.restaurant.name}
                          </Link>
                          <div className="flex flex-wrap items-center gap-3 mt-2 text-sm text-gray-600">
                            <span className="flex items-center gap-1">
                              <Calendar className="h-4 w-4" />
                              {bookingDate.toLocaleDateString("es-ES")}
                            </span>
                            <span className="flex items-center gap-1">
                              <Clock className="h-4 w-4" />
                              {booking.time}
                            </span>
                            <span className="flex items-center gap-1">
                              <Users className="h-4 w-4" />
                              {booking.partySize} {booking.partySize === 1 ? "persona" : "personas"}
                            </span>
                          </div>
                        </div>
                        <Badge className={status.color}>
                          {status.label}
                        </Badge>
                      </div>
                    </CardContent>
                  </Card>
                );
              })}
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
