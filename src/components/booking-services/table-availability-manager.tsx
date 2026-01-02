"use client";

import { useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Switch } from "@/components/ui/switch";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Input } from "@/components/ui/input";
import { Calendar, CheckCircle2, XCircle, Bell, Loader2 } from "lucide-react";
import { updateTableAvailability, upsertBookingReminder } from "@/lib/actions/booking-service";
import { toast } from "sonner";

interface Table {
  id: string;
  tableNumber: string;
  capacity: number;
  minCapacity: number;
  area: string | null;
  isActive: boolean;
}

interface Service {
  id: string;
  name: string;
  description: string | null;
  daysOfWeek: number[];
  isActive: boolean;
  slots: Array<{
    id: string;
    startTime: string;
    endTime: string;
    durationMinutes: number;
  }>;
}

interface Reminder {
  id: string;
  reminderTime: string;
  isActive: boolean;
  frequency: string;
}

type ReminderOrNull = Reminder | null;

interface TableAvailabilityManagerProps {
  restaurantId: string;
  services: Service[];
  tables: Table[];
  reminder: ReminderOrNull;
}

interface TableWithAvailability extends Table {
  isAvailableForBooking: boolean;
}

export function TableAvailabilityManager({
  restaurantId,
  services,
  tables: initialTables,
  reminder: initialReminder,
}: TableAvailabilityManagerProps) {
  const router = useRouter();
  const today = new Date().toISOString().split("T")[0];

  // State
  const [selectedDate, setSelectedDate] = useState(today);
  const [selectedServiceId, setSelectedServiceId] = useState(services[0]?.id || "");
  const [tables, setTables] = useState<TableWithAvailability[]>(
    initialTables.map((t) => ({ ...t, isAvailableForBooking: true }))
  );
  const [isLoading, setIsLoading] = useState(false);
  const [isSaving, setIsSaving] = useState(false);

  // Reminder state
  const [reminderTime, setReminderTime] = useState(initialReminder?.reminderTime || "10:00");
  const [reminderActive, setReminderActive] = useState(initialReminder?.isActive ?? false);
  const [reminderFrequency, setReminderFrequency] = useState(initialReminder?.frequency || "DAILY");

  // Load availability when date or service changes
  useEffect(() => {
    loadAvailability();
  }, [selectedDate, selectedServiceId]);

  const loadAvailability = async () => {
    if (!selectedServiceId) return;

    setIsLoading(true);
    try {
      const response = await fetch(
        `/api/restaurants/${restaurantId}/table-availability?` +
          new URLSearchParams({
            serviceId: selectedServiceId,
            date: selectedDate,
          })
      );

      if (response.ok) {
        const data = await response.json();
        setTables(data.tables);
      }
    } catch (error) {
      console.error("Error loading availability:", error);
      toast.error("Error al cargar la disponibilidad");
    } finally {
      setIsLoading(false);
    }
  };

  const handleToggleAll = async (isAvailable: boolean) => {
    setIsSaving(true);
    try {
      const result = await updateTableAvailability({
        restaurantId,
        serviceId: selectedServiceId,
        date: new Date(selectedDate),
        tableIds: tables.map((t) => t.id),
        isAvailable,
      });

      if (result.success) {
        toast.success(
          isAvailable
            ? "Todas las mesas están disponibles"
            : "Todas las mesas no están disponibles"
        );
        setTables(tables.map((t) => ({ ...t, isAvailableForBooking: isAvailable })));
      } else {
        toast.error(result.error || "Error al actualizar");
      }
    } catch (error) {
      toast.error("Error inesperado");
      console.error(error);
    } finally {
      setIsSaving(false);
    }
  };

  const handleToggleTable = async (tableId: string, isAvailable: boolean) => {
    setIsSaving(true);
    try {
      const result = await updateTableAvailability({
        restaurantId,
        serviceId: selectedServiceId,
        date: new Date(selectedDate),
        tableIds: [tableId],
        isAvailable,
      });

      if (result.success) {
        setTables(
          tables.map((t) => (t.id === tableId ? { ...t, isAvailableForBooking: isAvailable } : t))
        );
      } else {
        toast.error(result.error || "Error al actualizar");
      }
    } catch (error) {
      toast.error("Error inesperado");
      console.error(error);
    } finally {
      setIsSaving(false);
    }
  };

  const handleSaveReminder = async () => {
    setIsSaving(true);
    try {
      const result = await upsertBookingReminder({
        restaurantId,
        reminderTime,
        isActive: reminderActive,
        frequency: reminderFrequency as "DAILY" | "WEEKDAYS" | "WEEKENDS",
      });

      if (result.success) {
        toast.success("Recordatorio guardado correctamente");
        router.refresh();
      } else {
        toast.error(result.error || "Error al guardar recordatorio");
      }
    } catch (error) {
      toast.error("Error inesperado");
      console.error(error);
    } finally {
      setIsSaving(false);
    }
  };

  const selectedService = services.find((s) => s.id === selectedServiceId);
  const availableCount = tables.filter((t) => t.isAvailableForBooking).length;
  const unavailableCount = tables.length - availableCount;

  // Group tables by area
  const tablesByArea = tables.reduce((acc, table) => {
    const area = table.area || "Sin área";
    if (!acc[area]) acc[area] = [];
    acc[area].push(table);
    return acc;
  }, {} as Record<string, TableWithAvailability[]>);

  return (
    <div className="space-y-6">
      {/* Date and Service Selector */}
      <Card>
        <CardHeader>
          <CardTitle>Selecciona fecha y servicio</CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div>
              <Label htmlFor="date">Fecha</Label>
              <div className="relative mt-2">
                <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-gray-500" />
                <Input
                  id="date"
                  type="date"
                  value={selectedDate}
                  onChange={(e) => setSelectedDate(e.target.value)}
                  className="pl-10"
                  min={today}
                />
              </div>
            </div>

            <div>
              <Label htmlFor="service">Servicio</Label>
              <Select value={selectedServiceId} onValueChange={setSelectedServiceId}>
                <SelectTrigger className="mt-2">
                  <SelectValue placeholder="Selecciona un servicio" />
                </SelectTrigger>
                <SelectContent>
                  {services.map((service) => (
                    <SelectItem key={service.id} value={service.id}>
                      {service.name}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>

          {/* Service Info */}
          {selectedService && (
            <div className="p-3 bg-gray-50 rounded-lg border">
              <p className="text-sm font-medium text-gray-900">{selectedService.name}</p>
              <p className="text-xs text-gray-600 mt-1">
                {selectedService.slots.length} turnos:{" "}
                {selectedService.slots.map((s) => `${s.startTime}-${s.endTime}`).join(", ")}
              </p>
            </div>
          )}
        </CardContent>
      </Card>

      {/* Quick Actions */}
      <Card>
        <CardHeader>
          <CardTitle>Acciones rápidas</CardTitle>
        </CardHeader>
        <CardContent>
          <div className="flex flex-wrap gap-3">
            <Button
              variant="outline"
              onClick={() => handleToggleAll(true)}
              disabled={isSaving || isLoading}
            >
              <CheckCircle2 className="h-4 w-4 mr-2 text-green-600" />
              Todas disponibles
            </Button>
            <Button
              variant="outline"
              onClick={() => handleToggleAll(false)}
              disabled={isSaving || isLoading}
            >
              <XCircle className="h-4 w-4 mr-2 text-red-600" />
              Ninguna disponible
            </Button>
          </div>

          <div className="flex gap-4 mt-4 text-sm">
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-green-500"></div>
              <span className="text-gray-600">Disponibles: {availableCount}</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-3 h-3 rounded-full bg-red-500"></div>
              <span className="text-gray-600">No disponibles: {unavailableCount}</span>
            </div>
          </div>
        </CardContent>
      </Card>

      {/* Tables List */}
      <Card>
        <CardHeader>
          <CardTitle>Mesas</CardTitle>
        </CardHeader>
        <CardContent>
          {isLoading ? (
            <div className="flex items-center justify-center py-8">
              <Loader2 className="h-6 w-6 animate-spin text-primary" />
              <span className="ml-2 text-gray-600">Cargando...</span>
            </div>
          ) : (
            <div className="space-y-6">
              {Object.entries(tablesByArea).map(([area, areaTables]) => (
                <div key={area}>
                  <h3 className="text-sm font-semibold text-gray-900 mb-3">{area}</h3>
                  <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                    {areaTables.map((table) => (
                      <div
                        key={table.id}
                        className={`p-4 border rounded-lg transition-colors ${
                          table.isAvailableForBooking
                            ? "bg-green-50 border-green-200"
                            : "bg-red-50 border-red-200"
                        }`}
                      >
                        <div className="flex items-center justify-between">
                          <div className="flex-1">
                            <p className="font-medium text-gray-900">
                              Mesa {table.tableNumber}
                            </p>
                            <p className="text-sm text-gray-600">
                              {table.minCapacity === table.capacity
                                ? `${table.capacity} personas`
                                : `${table.minCapacity}-${table.capacity} personas`}
                            </p>
                          </div>
                          <Switch
                            checked={table.isAvailableForBooking}
                            onCheckedChange={(checked) => handleToggleTable(table.id, checked)}
                            disabled={isSaving}
                          />
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
          )}
        </CardContent>
      </Card>

      {/* Reminders Configuration */}
      <Card>
        <CardHeader>
          <CardTitle className="flex items-center gap-2">
            <Bell className="h-5 w-5" />
            Recordatorios
          </CardTitle>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex items-center justify-between">
            <div className="flex-1">
              <Label htmlFor="reminder-active" className="text-base">
                Activar recordatorio diario
              </Label>
              <p className="text-sm text-gray-600 mt-1">
                Recibirás una notificación para revisar la disponibilidad de mesas
              </p>
            </div>
            <Switch
              id="reminder-active"
              checked={reminderActive}
              onCheckedChange={setReminderActive}
            />
          </div>

          {reminderActive && (
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 pt-4 border-t">
              <div>
                <Label htmlFor="reminder-time">Hora del recordatorio</Label>
                <Input
                  id="reminder-time"
                  type="time"
                  value={reminderTime}
                  onChange={(e) => setReminderTime(e.target.value)}
                  className="mt-2"
                />
              </div>

              <div>
                <Label htmlFor="reminder-frequency">Frecuencia</Label>
                <Select value={reminderFrequency} onValueChange={setReminderFrequency}>
                  <SelectTrigger className="mt-2">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="DAILY">Todos los días</SelectItem>
                    <SelectItem value="WEEKDAYS">Solo entre semana</SelectItem>
                    <SelectItem value="WEEKENDS">Solo fines de semana</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
          )}

          <Button onClick={handleSaveReminder} disabled={isSaving} className="w-full">
            {isSaving ? "Guardando..." : "Guardar configuración de recordatorio"}
          </Button>
        </CardContent>
      </Card>
    </div>
  );
}
