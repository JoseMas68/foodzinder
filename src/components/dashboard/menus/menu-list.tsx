'use client'

import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Edit, Trash2, Eye, EyeOff, UtensilsCrossed } from "lucide-react";
import Link from "next/link";
import { useState } from "react";
import { useRouter } from "next/navigation";

interface MenuListProps {
  menus: Array<{
    id: string;
    title: string;
    description: string | null;
    price: number | null;
    isActive: boolean;
    dishes: Array<{
      id: string;
      name: string;
      price: number;
    }>;
    restaurants: Array<{
      restaurant: {
        id: string;
        name: string;
        slug: string;
      };
    }>;
  }>;
}

export function MenuList({ menus }: MenuListProps) {
  const router = useRouter();
  const [deletingId, setDeletingId] = useState<string | null>(null);

  const handleDelete = async (id: string) => {
    if (!confirm("¿Estás seguro de eliminar este menú? Esta acción no se puede deshacer.")) {
      return;
    }

    setDeletingId(id);

    try {
      const response = await fetch(`/api/menus/${id}`, {
        method: "DELETE",
      });

      if (!response.ok) {
        throw new Error("Failed to delete menu");
      }

      router.refresh();
    } catch (error) {
      console.error("Error deleting menu:", error);
      alert("Error al eliminar el menú");
    } finally {
      setDeletingId(null);
    }
  };

  return (
    <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
      {menus.map((menu) => (
        <Card key={menu.id} className="hover:shadow-lg transition-shadow">
          <CardHeader>
            <div className="flex items-start justify-between">
              <div className="flex-1">
                <CardTitle className="flex items-center gap-2">
                  {menu.title}
                  {menu.isActive ? (
                    <Badge variant="default" className="ml-2">
                      <Eye className="h-3 w-3 mr-1" />
                      Activo
                    </Badge>
                  ) : (
                    <Badge variant="secondary" className="ml-2">
                      <EyeOff className="h-3 w-3 mr-1" />
                      Inactivo
                    </Badge>
                  )}
                </CardTitle>
                {menu.description && (
                  <CardDescription className="mt-2 line-clamp-2">
                    {menu.description}
                  </CardDescription>
                )}
              </div>
            </div>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {menu.price && (
                <div className="text-lg font-bold text-primary">
                  {new Intl.NumberFormat("es-ES", {
                    style: "currency",
                    currency: "EUR",
                  }).format(Number(menu.price))}
                </div>
              )}

              <div className="flex items-center gap-2 text-sm text-gray-600">
                <UtensilsCrossed className="h-4 w-4" />
                <span>{menu.dishes.length} plato{menu.dishes.length !== 1 ? "s" : ""}</span>
              </div>

              {menu.restaurants.length > 0 && (
                <div className="text-sm text-gray-600">
                  <p className="font-medium mb-1">Asociado a:</p>
                  <div className="flex flex-wrap gap-1">
                    {menu.restaurants.map((r) => (
                      <Badge key={r.restaurant.id} variant="outline" className="text-xs">
                        {r.restaurant.name}
                      </Badge>
                    ))}
                  </div>
                </div>
              )}

              <div className="flex gap-2 pt-4">
                <Link href={`/dashboard/menus/${menu.id}`} className="flex-1">
                  <Button variant="outline" className="w-full">
                    <Edit className="h-4 w-4 mr-2" />
                    Editar
                  </Button>
                </Link>
                <Button
                  variant="destructive"
                  onClick={() => handleDelete(menu.id)}
                  disabled={deletingId === menu.id}
                >
                  <Trash2 className="h-4 w-4" />
                </Button>
              </div>
            </div>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
