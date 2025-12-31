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
import { Plus, Trash2, Building2 } from "lucide-react";
import { useRouter } from "next/navigation";

interface Restaurant {
  id: string;
  name: string;
  slug: string;
  status: string;
}

interface AssignedRestaurant extends Restaurant {
  assignedAt: Date;
}

interface MenuRestaurantsProps {
  menuId: string;
  availableRestaurants: Restaurant[];
  assignedRestaurants: AssignedRestaurant[];
}

export function MenuRestaurants({
  menuId,
  availableRestaurants,
  assignedRestaurants,
}: MenuRestaurantsProps) {
  const router = useRouter();
  const [selectedRestaurantId, setSelectedRestaurantId] = useState<string>("");
  const [isAssigning, setIsAssigning] = useState(false);
  const [removingId, setRemovingId] = useState<string | null>(null);

  const handleAssignRestaurant = async () => {
    if (!selectedRestaurantId) return;

    setIsAssigning(true);

    try {
      const response = await fetch(`/api/restaurants/${selectedRestaurantId}/menus`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ menuId }),
      });

      if (!response.ok) {
        const error = await response.json();
        throw new Error(error.error || "Failed to assign menu");
      }

      setSelectedRestaurantId("");
      router.refresh();
    } catch (error) {
      console.error("Error assigning menu:", error);
      alert(error instanceof Error ? error.message : "Error al asignar el menú");
    } finally {
      setIsAssigning(false);
    }
  };

  const handleRemoveRestaurant = async (restaurantId: string) => {
    if (!confirm("¿Estás seguro de quitar este menú del restaurante?")) {
      return;
    }

    setRemovingId(restaurantId);

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
      alert("Error al quitar el menú del restaurante");
    } finally {
      setRemovingId(null);
    }
  };

  // Filter out already assigned restaurants
  const assignedRestaurantIds = new Set(assignedRestaurants.map((r) => r.id));
  const unassignedRestaurants = availableRestaurants.filter(
    (r) => !assignedRestaurantIds.has(r.id)
  );

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          <Building2 className="h-5 w-5" />
          Restaurantes con este Menú
        </CardTitle>
        <CardDescription>
          Asigna este menú a tus restaurantes para que aparezca en sus páginas públicas
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-6">
        {/* Assign to New Restaurant */}
        {unassignedRestaurants.length > 0 && (
          <div className="flex gap-3">
            <Select value={selectedRestaurantId} onValueChange={setSelectedRestaurantId}>
              <SelectTrigger className="flex-1">
                <SelectValue placeholder="Selecciona un restaurante" />
              </SelectTrigger>
              <SelectContent>
                {unassignedRestaurants.map((restaurant) => (
                  <SelectItem key={restaurant.id} value={restaurant.id}>
                    {restaurant.name}
                    {restaurant.status !== "APPROVED" && ` (${restaurant.status})`}
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
            <Button
              onClick={handleAssignRestaurant}
              disabled={!selectedRestaurantId || isAssigning}
            >
              <Plus className="h-4 w-4 mr-2" />
              Añadir
            </Button>
          </div>
        )}

        {/* Assigned Restaurants List */}
        {assignedRestaurants.length === 0 ? (
          <div className="text-center py-8 text-gray-500">
            <Building2 className="h-12 w-12 mx-auto mb-3 text-gray-300" />
            <p className="font-medium">No hay restaurantes asignados</p>
            <p className="text-sm mt-1">
              {unassignedRestaurants.length > 0
                ? "Selecciona un restaurante arriba para asignarle este menú"
                : "Crea un restaurante primero en la sección Restaurantes"}
            </p>
          </div>
        ) : (
          <div className="space-y-3">
            {assignedRestaurants.map((restaurant) => (
              <div
                key={restaurant.id}
                className="flex items-center justify-between p-4 border rounded-lg hover:shadow-sm transition-shadow"
              >
                <div className="flex-1 min-w-0">
                  <div className="flex items-center gap-2">
                    <h4 className="font-medium truncate">{restaurant.name}</h4>
                    {restaurant.status !== "APPROVED" && (
                      <Badge variant="secondary" className="text-xs">
                        {restaurant.status}
                      </Badge>
                    )}
                  </div>
                  <p className="text-sm text-gray-600 mt-1">
                    /{restaurant.slug}
                  </p>
                </div>

                <Button
                  variant="destructive"
                  size="sm"
                  onClick={() => handleRemoveRestaurant(restaurant.id)}
                  disabled={removingId === restaurant.id}
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
