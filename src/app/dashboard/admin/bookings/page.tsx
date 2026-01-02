import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Calendar, Users, Clock, Phone, Mail, User, MessageSquare, Store, ShieldCheck } from "lucide-react";
import Image from "next/image";
import { BookingStatusSelector } from "@/components/bookings/booking-status-selector";
import { AssignTableSelector } from "@/components/bookings/assign-table-selector";
import { BookingFilters } from "@/components/bookings/booking-filters";

interface PageProps {
  searchParams: Promise<{
    restaurant?: string;
    status?: string;
  }>;
}

export default async function AdminBookingsPage({ searchParams }: PageProps) {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  if (user.role !== "ADMIN") {
    redirect("/");
  }

  const params = await searchParams;

  // ADMIN ve TODOS los restaurantes de la plataforma
  const restaurants = await prisma.restaurant.findMany({
    select: {
      id: true,
      name: true,
      slug: true,
    },
    orderBy: {
      name: "asc",
    },
  });

  // Filtros
  const selectedRestaurantId = params.restaurant;
  const selectedStatus = params.status;

  // Query de reservas - ADMIN ve TODAS las reservas
  const whereClause: any = {};

  if (selectedRestaurantId) {
    whereClause.restaurantId = selectedRestaurantId;
  }

  if (selectedStatus) {
    whereClause.status = selectedStatus;
  }

  // Limitar a las últimas 50 reservas para mejorar rendimiento
  const bookings = await prisma.booking.findMany({
    where: whereClause,
    include: {
      restaurant: {
        select: {
          id: true,
          name: true,
          slug: true,
          address: true,
          logoUrl: true,
          owner: {
            select: {
              firstName: true,
              lastName: true,
              email: true,
            },
          },
        },
      },
      user: {
        select: {
          firstName: true,
          lastName: true,
          email: true,
        },
      },
      table: {
        select: {
          id: true,
          tableNumber: true,
          capacity: true,
          minCapacity: true,
          area: true,
          shape: true,
        },
      },
    },
    orderBy: {
      date: "desc",
    },
    take: 50, // Limitar a 50 resultados
  });

  // Separar reservas
  const pendingBookings = bookings.filter((b) => b.status === "PENDING");
  const confirmedBookings = bookings.filter((b) => b.status === "CONFIRMED");
  const otherBookings = bookings.filter(
    (b) => b.status !== "PENDING" && b.status !== "CONFIRMED"
  );

  const statusConfig = {
    PENDING: { label: "Pendiente", color: "bg-yellow-100 text-yellow-800" },
    CONFIRMED: { label: "Confirmada", color: "bg-green-100 text-green-800" },
    CANCELLED: { label: "Cancelada", color: "bg-red-100 text-red-800" },
    COMPLETED: { label: "Completada", color: "bg-blue-100 text-blue-800" },
    NO_SHOW: { label: "No asistió", color: "bg-gray-100 text-gray-800" },
  };

  const BookingCard = ({ booking }: { booking: (typeof bookings)[0] }) => {
    const status = statusConfig[booking.status];
    const bookingDate = new Date(booking.date);
    const isToday = bookingDate.toDateString() === new Date().toDateString();

    return (
      <Card key={booking.id} className="overflow-hidden">
        <CardContent className="p-6">
          <div className="flex flex-col lg:flex-row lg:items-start lg:justify-between gap-4 mb-4">
            <div className="flex-1">
              {/* Restaurant info */}
              <div className="flex items-center gap-3 mb-3">
                {booking.restaurant.logoUrl && (
                  <div className="w-10 h-10 rounded-full overflow-hidden border-2 border-gray-200 flex-shrink-0">
                    <Image
                      src={booking.restaurant.logoUrl}
                      alt={booking.restaurant.name}
                      width={40}
                      height={40}
                      className="object-cover"
                    />
                  </div>
                )}
                <div className="flex-1">
                  <h3 className="font-bold text-lg">{booking.restaurant.name}</h3>
                  <p className="text-sm text-gray-600">{booking.restaurant.address}</p>
                  <p className="text-xs text-gray-500 mt-1">
                    Propietario: {booking.restaurant.owner.firstName} {booking.restaurant.owner.lastName}
                    {" "}({booking.restaurant.owner.email})
                  </p>
                </div>
              </div>

              {/* Booking details */}
              <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm">
                <div className="flex items-center gap-2 text-gray-700">
                  <Calendar className="h-4 w-4 text-primary flex-shrink-0" />
                  <span>
                    {bookingDate.toLocaleDateString("es-ES", {
                      weekday: "short",
                      year: "numeric",
                      month: "short",
                      day: "numeric",
                    })}
                  </span>
                  {isToday && (
                    <Badge variant="outline" className="ml-2 bg-primary/10 text-primary border-primary">
                      Hoy
                    </Badge>
                  )}
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

                {booking.table && (
                  <div className="flex items-center gap-2 text-gray-700">
                    <span className="text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded-full font-medium">
                      Mesa {booking.table.tableNumber} {booking.table.area && `- ${booking.table.area}`}
                    </span>
                  </div>
                )}
              </div>
            </div>

            {/* Status selector */}
            <div className="flex flex-col gap-2">
              <Badge className={status.color}>{status.label}</Badge>
              <BookingStatusSelector
                bookingId={booking.id}
                currentStatus={booking.status}
              />
              <AssignTableSelector
                bookingId={booking.id}
                currentTableId={booking.tableId}
                restaurantId={booking.restaurantId}
                bookingDate={booking.date}
                bookingTime={booking.time}
                partySize={booking.partySize}
              />
            </div>
          </div>

          {/* Customer info */}
          <div className="mt-4 pt-4 border-t">
            <h4 className="font-semibold text-sm text-gray-900 mb-3">Cliente</h4>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-3 text-sm text-gray-600">
              <div className="flex items-center gap-2">
                <User className="h-4 w-4 text-gray-400 flex-shrink-0" />
                <span>
                  {booking.user
                    ? `${booking.user.firstName} ${booking.user.lastName}`
                    : booking.customerName}
                </span>
              </div>
              <div className="flex items-center gap-2">
                <Mail className="h-4 w-4 text-gray-400 flex-shrink-0" />
                <span className="truncate">
                  {booking.user ? booking.user.email : booking.customerEmail}
                </span>
              </div>
              <div className="flex items-center gap-2">
                <Phone className="h-4 w-4 text-gray-400 flex-shrink-0" />
                <span>{booking.customerPhone}</span>
              </div>
            </div>
          </div>

          {/* Special notes */}
          {booking.specialNotes && (
            <div className="mt-4 pt-4 border-t">
              <div className="flex items-start gap-2 text-sm">
                <MessageSquare className="h-4 w-4 text-gray-400 flex-shrink-0 mt-0.5" />
                <div>
                  <span className="font-semibold text-gray-900">Notas especiales: </span>
                  <span className="text-gray-600">{booking.specialNotes}</span>
                </div>
              </div>
            </div>
          )}
        </CardContent>
      </Card>
    );
  };

  return (
    <div className="space-y-8">
      <div className="flex items-center gap-3">
        <ShieldCheck className="h-8 w-8 text-primary" />
        <div>
          <h1 className="text-3xl font-heading font-bold">Administración de Reservas</h1>
          <p className="text-gray-500 mt-1">
            Vista global de todas las reservas de la plataforma (últimas 50 reservas)
          </p>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card>
          <CardContent className="p-4">
            <div className="text-sm text-gray-600">Total Reservas</div>
            <div className="text-2xl font-bold">{bookings.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4">
            <div className="text-sm text-gray-600">Pendientes</div>
            <div className="text-2xl font-bold text-yellow-600">{pendingBookings.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4">
            <div className="text-sm text-gray-600">Confirmadas</div>
            <div className="text-2xl font-bold text-green-600">{confirmedBookings.length}</div>
          </CardContent>
        </Card>
        <Card>
          <CardContent className="p-4">
            <div className="text-sm text-gray-600">Restaurantes</div>
            <div className="text-2xl font-bold">{restaurants.length}</div>
          </CardContent>
        </Card>
      </div>

      {/* Filters */}
      <BookingFilters restaurants={restaurants} />

      {/* Pending bookings */}
      {pendingBookings.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Calendar className="h-5 w-5 text-yellow-600" />
              Reservas Pendientes ({pendingBookings.length})
            </CardTitle>
            <CardDescription>
              Requieren confirmación o acción
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {pendingBookings.map((booking) => (
                <BookingCard key={booking.id} booking={booking} />
              ))}
            </div>
          </CardContent>
        </Card>
      )}

      {/* Confirmed bookings */}
      {confirmedBookings.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Calendar className="h-5 w-5 text-green-600" />
              Reservas Confirmadas ({confirmedBookings.length})
            </CardTitle>
            <CardDescription>
              Próximas reservas confirmadas
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {confirmedBookings.map((booking) => (
                <BookingCard key={booking.id} booking={booking} />
              ))}
            </div>
          </CardContent>
        </Card>
      )}

      {/* Other bookings */}
      {otherBookings.length > 0 && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Clock className="h-5 w-5 text-gray-500" />
              Otras Reservas ({otherBookings.length})
            </CardTitle>
            <CardDescription>
              Completadas, canceladas y no-show
            </CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {otherBookings.map((booking) => (
                <BookingCard key={booking.id} booking={booking} />
              ))}
            </div>
          </CardContent>
        </Card>
      )}

      {/* Empty state */}
      {bookings.length === 0 && (
        <Card>
          <CardContent className="p-12">
            <div className="text-center text-gray-500">
              <Store className="h-12 w-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">No hay reservas</p>
              <p className="text-sm mt-1">
                Las reservas de todos los restaurantes aparecerán aquí
              </p>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
