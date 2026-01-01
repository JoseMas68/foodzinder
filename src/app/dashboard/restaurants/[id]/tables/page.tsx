import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { ArrowLeft, Plus } from "lucide-react";
import Link from "next/link";
import { TableList } from "@/components/tables/table-list";

interface PageProps {
  params: Promise<{
    id: string;
  }>;
}

export default async function RestaurantTablesPage({ params }: PageProps) {
  const user = await getCurrentUser();
  const { id } = await params;

  if (!user) {
    redirect("/sign-in");
  }

  if (user.role !== "OWNER" && user.role !== "ADMIN") {
    redirect("/");
  }

  // Obtener restaurante
  const restaurant = await prisma.restaurant.findUnique({
    where: { id },
    select: {
      id: true,
      name: true,
      ownerId: true,
    },
  });

  if (!restaurant) {
    redirect("/dashboard/restaurants");
  }

  // Verificar permisos
  if (restaurant.ownerId !== user.id && user.role !== "ADMIN") {
    redirect("/dashboard/restaurants");
  }

  // Obtener mesas
  const tables = await prisma.table.findMany({
    where: { restaurantId: id },
    orderBy: [{ area: "asc" }, { tableNumber: "asc" }],
    include: {
      _count: {
        select: {
          bookings: {
            where: {
              status: {
                in: ["PENDING", "CONFIRMED"],
              },
            },
          },
        },
      },
    },
  });

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" asChild>
            <Link href={`/dashboard/restaurants/${id}`}>
              <ArrowLeft className="h-4 w-4" />
            </Link>
          </Button>
          <div>
            <h1 className="text-3xl font-heading font-bold">Gestión de Mesas</h1>
            <p className="text-gray-500 mt-1">{restaurant.name}</p>
          </div>
        </div>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Total de Mesas</CardDescription>
            <CardTitle className="text-3xl">{tables.length}</CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Mesas Activas</CardDescription>
            <CardTitle className="text-3xl">
              {tables.filter((t) => t.isActive).length}
            </CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Capacidad Total</CardDescription>
            <CardTitle className="text-3xl">
              {tables.reduce((acc, t) => acc + t.capacity, 0)} pers.
            </CardTitle>
          </CardHeader>
        </Card>
        <Card>
          <CardHeader className="pb-3">
            <CardDescription>Con Reservas</CardDescription>
            <CardTitle className="text-3xl">
              {tables.filter((t) => t._count.bookings > 0).length}
            </CardTitle>
          </CardHeader>
        </Card>
      </div>

      {/* Table List */}
      <TableList restaurantId={id} initialTables={tables} />
    </div>
  );
}
