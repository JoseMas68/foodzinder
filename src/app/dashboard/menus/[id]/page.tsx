import { redirect, notFound } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import { MenuForm } from "@/components/dashboard/menus/menu-form";
import { DishList } from "@/components/dashboard/menus/dish-list";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";

export default async function MenuDetailPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const user = await getCurrentUser();

  if (!user) {
    redirect("/sign-in");
  }

  if (user.role !== "OWNER" && user.role !== "ADMIN") {
    redirect("/");
  }

  const menuRaw = await prisma.menu.findFirst({
    where: {
      id,
      ownerId: user.id,
    },
    include: {
      dishes: {
        orderBy: { order: "asc" },
      },
    },
  });

  if (!menuRaw) {
    notFound();
  }

  // Serialize Decimal to number/string for client components
  const menu = {
    ...menuRaw,
    price: menuRaw.price ? Number(menuRaw.price) : null,
    dishes: menuRaw.dishes.map(dish => ({
      ...dish,
      price: Number(dish.price),
    })),
  };

  return (
    <div className="space-y-8">
      <div>
        <h1 className="text-3xl font-heading font-bold">Editar Menú</h1>
        <p className="text-gray-500 mt-1">
          Modifica la información del menú y gestiona sus platos
        </p>
      </div>

      <MenuForm
        initialData={{
          id: menu.id,
          title: menu.title,
          description: menu.description || "",
          price: menu.price?.toString() || "",
          isActive: menu.isActive,
        }}
        isEditing
      />

      <Separator className="my-8" />

      <Card>
        <CardHeader>
          <CardTitle>Platos del Menú</CardTitle>
          <CardDescription>
            Gestiona los platos que componen este menú
          </CardDescription>
        </CardHeader>
        <CardContent>
          <DishList menuId={menu.id} dishes={menu.dishes} />
        </CardContent>
      </Card>
    </div>
  );
}
