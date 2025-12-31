'use client'

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Plus, Edit, Trash2, GripVertical, ImageIcon } from "lucide-react";
import { DishDialog } from "./dish-dialog";
import { useRouter } from "next/navigation";
import Image from "next/image";

interface DishListProps {
  menuId: string;
  dishes: Array<{
    id: string;
    name: string;
    description: string | null;
    price: number;
    imageUrl: string | null;
    allergens: string[];
    order: number;
  }>;
}

export function DishList({ menuId, dishes }: DishListProps) {
  const router = useRouter();
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [editingDish, setEditingDish] = useState<typeof dishes[0] | null>(null);
  const [deletingId, setDeletingId] = useState<string | null>(null);

  const handleEdit = (dish: typeof dishes[0]) => {
    setEditingDish(dish);
    setIsDialogOpen(true);
  };

  const handleDelete = async (id: string) => {
    if (!confirm("¿Estás seguro de eliminar este plato?")) {
      return;
    }

    setDeletingId(id);

    try {
      const response = await fetch(`/api/dishes/${id}`, {
        method: "DELETE",
      });

      if (!response.ok) {
        throw new Error("Failed to delete dish");
      }

      router.refresh();
    } catch (error) {
      console.error("Error deleting dish:", error);
      alert("Error al eliminar el plato");
    } finally {
      setDeletingId(null);
    }
  };

  const handleDialogClose = () => {
    setIsDialogOpen(false);
    setEditingDish(null);
  };

  return (
    <div className="space-y-4">
      <div className="flex justify-end">
        <Button onClick={() => setIsDialogOpen(true)}>
          <Plus className="h-4 w-4 mr-2" />
          Añadir Plato
        </Button>
      </div>

      {dishes.length === 0 ? (
        <div className="text-center py-12 text-gray-500">
          <p>No hay platos en este menú todavía</p>
          <p className="text-sm mt-1">Añade el primer plato para empezar</p>
        </div>
      ) : (
        <div className="space-y-3">
          {dishes.map((dish) => (
            <div
              key={dish.id}
              className="flex items-center gap-4 p-4 border rounded-lg hover:shadow-md transition-shadow"
            >
              <GripVertical className="h-5 w-5 text-gray-400 cursor-move" />

              {dish.imageUrl ? (
                <div className="relative h-16 w-16 rounded-lg overflow-hidden flex-shrink-0">
                  <Image
                    src={dish.imageUrl}
                    alt={dish.name}
                    fill
                    className="object-cover"
                  />
                </div>
              ) : (
                <div className="h-16 w-16 rounded-lg bg-gray-100 flex items-center justify-center flex-shrink-0">
                  <ImageIcon className="h-6 w-6 text-gray-400" />
                </div>
              )}

              <div className="flex-1 min-w-0">
                <h4 className="font-medium truncate">{dish.name}</h4>
                {dish.description && (
                  <p className="text-sm text-gray-600 line-clamp-2">
                    {dish.description}
                  </p>
                )}
                {dish.allergens.length > 0 && (
                  <div className="flex flex-wrap gap-1 mt-1">
                    {dish.allergens.map((allergen) => (
                      <Badge key={allergen} variant="outline" className="text-xs">
                        {allergen}
                      </Badge>
                    ))}
                  </div>
                )}
              </div>

              <div className="flex items-center gap-3">
                <span className="font-bold text-lg whitespace-nowrap">
                  {new Intl.NumberFormat("es-ES", {
                    style: "currency",
                    currency: "EUR",
                  }).format(Number(dish.price))}
                </span>

                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => handleEdit(dish)}
                >
                  <Edit className="h-4 w-4" />
                </Button>

                <Button
                  variant="destructive"
                  size="sm"
                  onClick={() => handleDelete(dish.id)}
                  disabled={deletingId === dish.id}
                >
                  <Trash2 className="h-4 w-4" />
                </Button>
              </div>
            </div>
          ))}
        </div>
      )}

      <DishDialog
        menuId={menuId}
        dish={editingDish}
        isOpen={isDialogOpen}
        onClose={handleDialogClose}
      />
    </div>
  );
}
