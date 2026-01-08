"use client";

import { useState, useTransition, useEffect } from "react";
import { Button } from "@/components/ui/button";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { assignTableToBooking, getAvailableTablesForBooking, autoAssignTable } from "@/server/actions/bookings";
import { toast } from "sonner";
import { Loader2, Table as TableIcon, Check, AlertCircle } from "lucide-react";
import { Badge } from "@/components/ui/badge";

interface AssignTableSelectorProps {
  bookingId: string;
  currentTableId: string | null;
  restaurantId: string;
  bookingDate: Date;
  bookingTime: string;
  partySize: number;
}

export function AssignTableSelector({
  bookingId,
  currentTableId,
  restaurantId,
  bookingDate,
  bookingTime,
  partySize,
}: AssignTableSelectorProps) {
  const [open, setOpen] = useState(false);
  const [selectedTableId, setSelectedTableId] = useState<string | null>(currentTableId);
  const [isPending, startTransition] = useTransition();
  const [isLoading, setIsLoading] = useState(false);
  const [tablesWithAvailability, setTablesWithAvailability] = useState<any[]>([]);
  const [currentTable, setCurrentTable] = useState<any>(null);

  // Cargar mesas con disponibilidad cuando se abre el diálogo
  useEffect(() => {
    if (open) {
      loadAvailableTables();
    }
  }, [open]);

  const loadAvailableTables = async () => {
    setIsLoading(true);
    try {
      const result = await getAvailableTablesForBooking(
        restaurantId,
        bookingDate,
        bookingTime,
        partySize,
        bookingId
      );

      if (result.success && result.data) {
        setTablesWithAvailability(result.data);
        // Encontrar la mesa actual
        const current = result.data.find((t: any) => t.id === currentTableId);
        setCurrentTable(current);
      } else {
        toast.error("Error al cargar mesas disponibles");
      }
    } catch (error) {
      toast.error("Error al cargar disponibilidad");
    } finally {
      setIsLoading(false);
    }
  };

  // Separar mesas disponibles y ocupadas
  const availableTables = tablesWithAvailability.filter((t) => t.isAvailable);
  const occupiedTables = tablesWithAvailability.filter((t) => !t.isAvailable);

  // Agrupar mesas disponibles por área
  const tablesByArea = availableTables.reduce((acc, table) => {
    const area = table.area || "Sin área";
    if (!acc[area]) {
      acc[area] = [];
    }
    acc[area].push(table);
    return acc;
  }, {} as Record<string, any[]>);

  const handleAssign = () => {
    if (!selectedTableId) {
      toast.error("Selecciona una mesa");
      return;
    }

    startTransition(async () => {
      const result = await assignTableToBooking(bookingId, selectedTableId);

      if (result.success) {
        toast.success("Mesa asignada correctamente");
        setOpen(false);
      } else {
        toast.error(result.error || "Error al asignar la mesa");
      }
    });
  };

  const handleRemove = () => {
    startTransition(async () => {
      const result = await assignTableToBooking(bookingId, null);

      if (result.success) {
        toast.success("Mesa desasignada");
        setSelectedTableId(null);
        setOpen(false);
      } else {
        toast.error(result.error || "Error al desasignar la mesa");
      }
    });
  };

  const handleAutoAssign = () => {
    startTransition(async () => {
      const result = await autoAssignTable(bookingId);

      if (result.success) {
        toast.success(result.message || "Mesa asignada automáticamente");
        setOpen(false);
      } else {
        toast.error(result.error || "Error al asignar mesa automáticamente");
      }
    });
  };

  return (
    <Dialog open={open} onOpenChange={setOpen}>
      <DialogTrigger asChild>
        <Button variant="outline" size="sm" className="w-full">
          <TableIcon className="h-4 w-4 mr-2" />
          {currentTable ? (
            <>
              <Check className="h-3 w-3 mr-1 text-green-600" />
              Mesa {currentTable.tableNumber}
            </>
          ) : (
            "Asignar Mesa"
          )}
        </Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Asignar Mesa</DialogTitle>
          <DialogDescription>
            Selecciona una mesa para esta reserva de {partySize}{" "}
            {partySize === 1 ? "persona" : "personas"}
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-4 py-4">
          {isLoading ? (
            <div className="flex items-center justify-center py-8">
              <Loader2 className="h-6 w-6 animate-spin text-gray-400" />
              <span className="ml-2 text-sm text-gray-500">Cargando disponibilidad...</span>
            </div>
          ) : (
            <>
              {availableTables.length === 0 && occupiedTables.length === 0 ? (
                <p className="text-sm text-gray-500 text-center py-4">
                  No hay mesas configuradas que puedan acomodar a {partySize}{" "}
                  {partySize === 1 ? "persona" : "personas"}
                </p>
              ) : availableTables.length === 0 ? (
                <div className="text-center py-4 space-y-2">
                  <AlertCircle className="h-8 w-8 text-amber-500 mx-auto" />
                  <p className="text-sm font-medium text-gray-900">
                    No hay mesas disponibles
                  </p>
                  <p className="text-xs text-gray-500">
                    Todas las mesas están reservadas para esta hora
                  </p>
                </div>
              ) : (
                <>
                  <Select
                    value={selectedTableId || undefined}
                    onValueChange={setSelectedTableId}
                  >
                    <SelectTrigger>
                      <SelectValue placeholder="Selecciona una mesa disponible" />
                    </SelectTrigger>
                    <SelectContent>
                      {(Object.entries(tablesByArea) as [string, any[]][]).map(([area, areaTables]) => (
                        <div key={area}>
                          <div className="px-2 py-1.5 text-xs font-semibold text-gray-500">
                            {area}
                          </div>
                          {areaTables.map((table: any) => (
                            <SelectItem key={table.id} value={table.id}>
                              <div className="flex items-center gap-2">
                                <TableIcon className="h-4 w-4 text-green-600" />
                                <span className="font-medium">Mesa {table.tableNumber}</span>
                                <span className="text-xs text-gray-500">
                                  ({table.minCapacity}-{table.capacity} pers.)
                                </span>
                                <Badge variant="outline" className="ml-auto bg-green-50 text-green-700 border-green-200">
                                  Disponible
                                </Badge>
                              </div>
                            </SelectItem>
                          ))}
                        </div>
                      ))}
                    </SelectContent>
                  </Select>

                  {/* Mostrar contadores */}
                  <div className="flex gap-2 text-xs">
                    <Badge variant="outline" className="bg-green-50 text-green-700 border-green-200">
                      {availableTables.length} disponibles
                    </Badge>
                    {occupiedTables.length > 0 && (
                      <Badge variant="outline" className="bg-red-50 text-red-700 border-red-200">
                        {occupiedTables.length} ocupadas
                      </Badge>
                    )}
                  </div>
                </>
              )}

              {currentTable && (
                <div className="text-sm text-gray-600 bg-blue-50 p-3 rounded-lg border border-blue-200">
                  <p className="font-medium text-blue-900">Mesa actual:</p>
                  <p className="text-blue-800">
                    Mesa {currentTable.tableNumber} - {currentTable.area || "Sin área"}{" "}
                    ({currentTable.minCapacity}-{currentTable.capacity} personas)
                  </p>
                </div>
              )}
            </>
          )}
        </div>

        <DialogFooter className="gap-2">
          {!currentTable && availableTables.length > 0 && (
            <Button
              variant="secondary"
              onClick={handleAutoAssign}
              disabled={isPending}
              className="mr-auto"
            >
              {isPending && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
              Asignar Automáticamente
            </Button>
          )}
          {currentTable && (
            <Button
              variant="outline"
              onClick={handleRemove}
              disabled={isPending}
            >
              Desasignar
            </Button>
          )}
          <Button
            onClick={handleAssign}
            disabled={isPending || !selectedTableId || selectedTableId === currentTableId}
          >
            {isPending && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            {currentTable ? "Cambiar Mesa" : "Asignar Mesa"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
