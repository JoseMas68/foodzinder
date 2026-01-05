import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { Card, CardContent, CardDescription, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Plus, UtensilsCrossed } from "lucide-react";
import Link from "next/link";
import { MenuList } from "@/components/dashboard/menus/menu-list";

export default async function MenusPage() {
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  if (user.role !== "OWNER" && user.role !== "ADMIN") {
    redirect("/");
  }

  const menusRaw = await prisma.menu.findMany({
    where: { ownerId: user.id },
    include: {
      dishes: {
        orderBy: { order: "asc" },
      },
      restaurants: {
        include: {
          restaurant: {
            select: {
              id: true,
              name: true,
              slug: true,
            },
          },
        },
      },
    },
    orderBy: { createdAt: "desc" },
  });

  // Serialize Decimal to number for client components
  const menus = menusRaw.map(menu => ({
    ...menu,
    price: menu.price ? Number(menu.price) : null,
    dishes: menu.dishes.map(dish => ({
      ...dish,
      price: Number(dish.price),
    })),
  }));

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-heading font-bold">Menús</h1>
          <p className="text-gray-500 mt-1">
            Gestiona los menús y platos de tus restaurantes
          </p>
        </div>
        <Link href="/dashboard/menus/new">
          <Button>
            <Plus className="h-4 w-4 mr-2" />
            Nuevo Menú
          </Button>
        </Link>
      </div>

      {menus.length === 0 ? (
        <Card>
          <CardContent className="flex flex-col items-center justify-center py-16">
            <UtensilsCrossed className="h-12 w-12 text-gray-400 mb-4" />
            <CardTitle className="text-xl mb-2">No tienes menús todavía</CardTitle>
            <CardDescription className="text-center mb-6 max-w-md">
              Crea tu primer menú para empezar a añadir platos y asociarlo a tus restaurantes
            </CardDescription>
            <Link href="/dashboard/menus/new">
              <Button>
                <Plus className="h-4 w-4 mr-2" />
                Crear Primer Menú
              </Button>
            </Link>
          </CardContent>
        </Card>
      ) : (
        <MenuList menus={menus} />
      )}
    </div>
  );
}
