import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Calendar, Users, Clock, Phone, Mail, User, MessageSquare, Store } from "lucide-react";
import Image from "next/image";
import { BookingStatusSelector } from "@/components/bookings/booking-status-selector";
import { AssignTableSelector } from "@/components/bookings/assign-table-selector";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

interface PageProps {
  searchParams: Promise<{
    restaurant?: string;
    status?: string;
  }>;
}

export default async function RestaurantBookingsPage({ searchParams }: PageProps) {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  if (user.role !== "OWNER" && user.role !== "ADMIN") {
    redirect("/");
  }

  const params = await searchParams;

  // Obtener restaurantes del owner
  const restaurants = await prisma.restaurant.findMany({
    where: user.role === "ADMIN" ? {} : { ownerId: user.id },
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

  // Query de reservas - SIEMPRE filtrar por restaurantes del owner si no es admin
  const whereClause: any = {};

  if (selectedRestaurantId) {
    // Si se selecciona un restaurante específico, verificar que pertenece al owner
    const ownsRestaurant = user.role === "ADMIN" || restaurants.some(r => r.id === selectedRestaurantId);
    if (!ownsRestaurant) {
      // Si no es dueño de este restaurante y no es admin, no mostrar nada
      whereClause.restaurantId = "invalid-id";
    } else {
      whereClause.restaurantId = selectedRestaurantId;
    }
  } else {
    // Sin filtro de restaurante: mostrar solo los del owner (o todos si es admin)
    if (user.role !== "ADMIN") {
      whereClause.restaurantId = {
        in: restaurants.map((r) => r.id),
      };
    }
  }

  if (selectedStatus) {
    whereClause.status = selectedStatus;
  }

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
                <div>
                  <h3 className="font-bold text-lg">{booking.restaurant.name}</h3>
                  <p className="text-sm text-gray-600">{booking.restaurant.address}</p>
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
      <div>
        <h1 className="text-3xl font-heading font-bold">Gestión de Reservas</h1>
        <p className="text-gray-500 mt-1">
          Administra las reservas de tus restaurantes
        </p>
      </div>

      {/* Filters */}
      <Card>
        <CardContent className="p-4">
          <div className="flex flex-col md:flex-row gap-4">
            <div className="flex-1">
              <label className="text-sm font-medium mb-2 block">Restaurante</label>
              <Select defaultValue={selectedRestaurantId || "all"}>
                <SelectTrigger>
                  <SelectValue placeholder="Todos los restaurantes" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">Todos los restaurantes</SelectItem>
                  {restaurants.map((restaurant) => (
                    <SelectItem key={restaurant.id} value={restaurant.id}>
                      {restaurant.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>

            <div className="flex-1">
              <label className="text-sm font-medium mb-2 block">Estado</label>
              <Select defaultValue={selectedStatus || "all"}>
                <SelectTrigger>
                  <SelectValue placeholder="Todos los estados" />
                </SelectTrigger>
                <SelectContent>
                  <SelectItem value="all">Todos los estados</SelectItem>
                  <SelectItem value="PENDING">Pendientes</SelectItem>
                  <SelectItem value="CONFIRMED">Confirmadas</SelectItem>
                  <SelectItem value="COMPLETED">Completadas</SelectItem>
                  <SelectItem value="CANCELLED">Canceladas</SelectItem>
                  <SelectItem value="NO_SHOW">No asistió</SelectItem>
                </SelectContent>
              </Select>
            </div>
          </div>
        </CardContent>
      </Card>

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
                Las reservas de tus restaurantes aparecerán aquí
              </p>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
