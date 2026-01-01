"use client";

import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Plus, Pencil, Trash2, Users, MapPin } from "lucide-react";
import { TableFormDialog } from "./table-form-dialog";
import { deleteTable, toggleTableStatus } from "@/server/actions/tables";
import { toast } from "sonner";
import { useRouter } from "next/navigation";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from "@/components/ui/alert-dialog";
import { Switch } from "@/components/ui/switch";

interface Table {
  id: string;
  tableNumber: string;
  capacity: number;
  minCapacity: number;
  area: string | null;
  shape: string;
  isActive: boolean;
  _count: {
    bookings: number;
  };
}

interface TableListProps {
  restaurantId: string;
  initialTables: Table[];
}

const shapeLabels = {
  SQUARE: "Cuadrada",
  RECTANGLE: "Rectangular",
  ROUND: "Redonda",
  BOOTH: "Reservado",
};

const shapeIcons = {
  SQUARE: "⬜",
  RECTANGLE: "▭",
  ROUND: "⭕",
  BOOTH: "🪑",
};

export function TableList({ restaurantId, initialTables }: TableListProps) {
  const [tables, setTables] = useState<Table[]>(initialTables);
  const [isCreateOpen, setIsCreateOpen] = useState(false);
  const [editingTable, setEditingTable] = useState<Table | null>(null);
  const [deletingTableId, setDeletingTableId] = useState<string | null>(null);
  const router = useRouter();

  const handleCreate = () => {
    setIsCreateOpen(true);
  };

  const handleEdit = (table: Table) => {
    setEditingTable(table);
  };

  const handleDelete = async (tableId: string) => {
    const result = await deleteTable(tableId);

    if (result.success) {
      toast.success("Mesa eliminada correctamente");
      setTables(tables.filter((t) => t.id !== tableId));
      setDeletingTableId(null);
    } else {
      toast.error(result.error || "Error al eliminar la mesa");
    }
  };

  const handleToggleStatus = async (tableId: string, isActive: boolean) => {
    const result = await toggleTableStatus(tableId, isActive);

    if (result.success) {
      toast.success(isActive ? "Mesa activada" : "Mesa desactivada");
      setTables(tables.map((t) => (t.id === tableId ? { ...t, isActive } : t)));
    } else {
      toast.error(result.error || "Error al cambiar el estado");
    }
  };

  const handleSuccess = () => {
    router.refresh();
    setIsCreateOpen(false);
    setEditingTable(null);
  };

  // Agrupar mesas por área
  const groupedTables = tables.reduce((acc, table) => {
    const area = table.area || "Sin área";
    if (!acc[area]) {
      acc[area] = [];
    }
    acc[area].push(table);
    return acc;
  }, {} as Record<string, Table[]>);

  return (
    <>
      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Mesas del Restaurante</CardTitle>
            <Button onClick={handleCreate}>
              <Plus className="h-4 w-4 mr-2" />
              Nueva Mesa
            </Button>
          </div>
        </CardHeader>
        <CardContent>
          {tables.length === 0 ? (
            <div className="text-center py-12 text-gray-500">
              <Users className="h-12 w-12 mx-auto mb-3 text-gray-300" />
              <p className="font-medium">No hay mesas configuradas</p>
              <p className="text-sm mt-1">
                Agrega mesas para empezar a recibir reservas
              </p>
              <Button onClick={handleCreate} className="mt-4">
                <Plus className="h-4 w-4 mr-2" />
                Crear Primera Mesa
              </Button>
            </div>
          ) : (
            <div className="space-y-6">
              {Object.entries(groupedTables).map(([area, areaTables]) => (
                <div key={area}>
                  <h3 className="font-semibold text-lg mb-3 flex items-center gap-2">
                    <MapPin className="h-5 w-5 text-primary" />
                    {area}
                  </h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                    {areaTables.map((table) => (
                      <Card
                        key={table.id}
                        className={!table.isActive ? "opacity-60" : ""}
                      >
                        <CardContent className="p-4">
                          <div className="flex items-start justify-between mb-3">
                            <div className="flex items-center gap-2">
                              <span className="text-2xl">
                                {shapeIcons[table.shape as keyof typeof shapeIcons]}
                              </span>
                              <div>
                                <h4 className="font-bold text-lg">
                                  Mesa {table.tableNumber}
                                </h4>
                                <p className="text-xs text-gray-500">
                                  {shapeLabels[table.shape as keyof typeof shapeLabels]}
                                </p>
                              </div>
                            </div>
                            <Switch
                              checked={table.isActive}
                              onCheckedChange={(checked) =>
                                handleToggleStatus(table.id, checked)
                              }
                            />
                          </div>

                          <div className="space-y-2 mb-3">
                            <div className="flex items-center justify-between text-sm">
                              <span className="text-gray-600">Capacidad:</span>
                              <Badge variant="secondary">
                                {table.minCapacity} - {table.capacity} personas
                              </Badge>
                            </div>
                            {table._count.bookings > 0 && (
                              <div className="flex items-center justify-between text-sm">
                                <span className="text-gray-600">Reservas activas:</span>
                                <Badge variant="default">
                                  {table._count.bookings}
                                </Badge>
                              </div>
                            )}
                          </div>

                          <div className="flex gap-2">
                            <Button
                              variant="outline"
                              size="sm"
                              onClick={() => handleEdit(table)}
                              className="flex-1"
                            >
                              <Pencil className="h-3 w-3 mr-1" />
                              Editar
                            </Button>
                            <Button
                              variant="destructive"
                              size="sm"
                              onClick={() => setDeletingTableId(table.id)}
                              disabled={table._count.bookings > 0}
                            >
                              <Trash2 className="h-3 w-3" />
                            </Button>
                          </div>
                        </CardContent>
                      </Card>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Create Dialog */}
      <TableFormDialog
        open={isCreateOpen}
        onOpenChange={setIsCreateOpen}
        restaurantId={restaurantId}
        onSuccess={handleSuccess}
      />

      {/* Edit Dialog */}
      {editingTable && (
        <TableFormDialog
          open={!!editingTable}
          onOpenChange={(open) => !open && setEditingTable(null)}
          restaurantId={restaurantId}
          table={editingTable}
          onSuccess={handleSuccess}
        />
      )}

      {/* Delete Confirmation */}
      <AlertDialog
        open={!!deletingTableId}
        onOpenChange={(open) => !open && setDeletingTableId(null)}
      >
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle>¿Eliminar mesa?</AlertDialogTitle>
            <AlertDialogDescription>
              Esta acción no se puede deshacer. La mesa será eliminada permanentemente.
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Cancelar</AlertDialogCancel>
            <AlertDialogAction
              onClick={() => deletingTableId && handleDelete(deletingTableId)}
              className="bg-red-600 hover:bg-red-700"
            >
              Eliminar
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </>
  );
}
