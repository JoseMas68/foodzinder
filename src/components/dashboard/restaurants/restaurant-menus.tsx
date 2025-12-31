'use client'

import { useState } from "react";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Plus, Trash2, UtensilsCrossed } from "lucide-react";
import { useRouter } from "next/navigation";

interface Menu {
  id: string;
  title: string;
  description: string | null;
  price: number | null;
  isActive: boolean;
}

interface AssignedMenu extends Menu {
  assignedAt: Date;
}

interface RestaurantMenusProps {
  restaurantId: string;
  availableMenus: Menu[];
  assignedMenus: AssignedMenu[];
}

export function RestaurantMenus({
  restaurantId,
  availableMenus,
  assignedMenus,
}: RestaurantMenusProps) {
  const router = useRouter();
  const [selectedMenuId, setSelectedMenuId] = useState<string>("");
  const [isAssigning, setIsAssigning] = useState(false);
  const [removingId, setRemovingId] = useState<string | null>(null);

  const handleAssignMenu = async () => {
    if (!selectedMenuId) return;

    setIsAssigning(true);

    try {
      const response = await fetch(`/api/restaurants/${restaurantId}/menus`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ menuId: selectedMenuId }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || "Failed to assign menu");
      }

      setSelectedMenuId("");
      router.refresh();
    } catch (error) {
      console.error("Error assigning menu:", error);
      alert(error instanceof Error ? error.message : "Error al asignar el menú");
    } finally {
      setIsAssigning(false);
    }
  };

  const handleRemoveMenu = async (menuId: string) => {
    if (!confirm("¿Estás seguro de quitar este menú del restaurante?")) {
      return;
    }

    setRemovingId(menuId);

    try {
      const response = await fetch(
        `/api/restaurants/${restaurantId}/menus?menuId=${menuId}`,
        {
          method: "DELETE",
        }
      );

      if (!response.ok) {
        throw new Error("Failed to remove menu");
      }

      router.refresh();
    } catch (error) {
      console.error("Error removing menu:", error);
      alert("Error al quitar el menú");
    } finally {
      setRemovingId(null);
    }
  };

  // Filter out already assigned menus
  const assignedMenuIds = new Set(assignedMenus.map((m) => m.id));
  const unassignedMenus = availableMenus.filter((m) => !assignedMenuIds.has(m.id));

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <UtensilsCrossed className="h-5 w-5" />
          Menús del Restaurante
        </CardTitle>
        <CardDescription>
          Asocia menús existentes a este restaurante para que los clientes puedan verlos
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-6">
        {/* Assign New Menu */}
        {unassignedMenus.length > 0 && (
          <div className="flex gap-3">
            <Select value={selectedMenuId} onValueChange={setSelectedMenuId}>
              <SelectTrigger className="flex-1">
                <SelectValue placeholder="Selecciona un menú para añadir" />
              </SelectTrigger>
              <SelectContent>
                {unassignedMenus.map((menu) => (
                  <SelectItem key={menu.id} value={menu.id}>
                    {menu.title}
                    {menu.price && ` - ${Number(menu.price).toFixed(2)}€`}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            <Button
              onClick={handleAssignMenu}
              disabled={!selectedMenuId || isAssigning}
            >
              <Plus className="h-4 w-4 mr-2" />
              Añadir
            </Button>
          </div>
        )}

        {/* Assigned Menus List */}
        {assignedMenus.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            <UtensilsCrossed className="h-12 w-12 mx-auto mb-3 text-gray-300" />
            <p className="font-medium">No hay menús asignados</p>
            <p className="text-sm mt-1">
              {unassignedMenus.length > 0
                ? "Selecciona un menú arriba para añadirlo"
                : "Crea un menú primero en la sección Menús"}
            </p>
          </div>
        ) : (
          <div className="space-y-3">
            {assignedMenus.map((menu) => (
              <div
                key={menu.id}
                className="flex items-center justify-between p-4 border rounded-lg hover:shadow-sm transition-shadow"
              >
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <h4 className="font-medium truncate">{menu.title}</h4>
                    {!menu.isActive && (
                      <Badge variant="secondary" className="text-xs">
                        Inactivo
                      </Badge>
                    )}
                  </div>
                  {menu.description && (
                    <p className="text-sm text-gray-600 truncate mt-1">
                      {menu.description}
                    </p>
                  )}
                  {menu.price && (
                    <p className="text-sm font-bold text-primary mt-1">
                      {new Intl.NumberFormat("es-ES", {
                        style: "currency",
                        currency: "EUR",
                      }).format(Number(menu.price))}
                    </p>
                  )}
                </div>

                <Button
                  variant="destructive"
                  size="sm"
                  onClick={() => handleRemoveMenu(menu.id)}
                  disabled={removingId === menu.id}
                >
                  <Trash2 className="h-4 w-4" />
                </Button>
              </div>
            ))}
          </div>
        )}
      </CardContent>
    </Card>
  );
}
