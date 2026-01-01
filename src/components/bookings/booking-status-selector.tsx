"use client";

import { useState } from "react";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { updateBooking } from "@/server/actions/bookings";
import { toast } from "sonner";
import { useRouter } from "next/navigation";
import { Loader2 } from "lucide-react";

interface BookingStatusSelectorProps {
  bookingId: string;
  currentStatus: string;
}

export function BookingStatusSelector({
  bookingId,
  currentStatus,
}: BookingStatusSelectorProps) {
  const [isLoading, setIsLoading] = useState(false);
  const [status, setStatus] = useState(currentStatus);
  const router = useRouter();

  const handleStatusChange = async (newStatus: string) => {
    if (newStatus === status) return;

    setIsLoading(true);
    setStatus(newStatus);

    try {
      const result = await updateBooking(bookingId, { status: newStatus });

      if (result.success) {
        toast.success("Estado actualizado", {
          description: "El estado de la reserva se ha actualizado correctamente.",
        });
        router.refresh();
      } else {
        toast.error("Error al actualizar", {
          description: result.error || "No se pudo actualizar el estado",
        });
        setStatus(currentStatus); // Revert on error
      }
    } catch (error) {
      toast.error("Error inesperado", {
        description: "Por favor, intenta de nuevo más tarde",
      });
      setStatus(currentStatus); // Revert on error
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="relative">
      {isLoading && (
        <div className="absolute inset-0 flex items-center justify-center bg-white/80 rounded-md z-10">
          <Loader2 className="h-4 w-4 animate-spin text-primary" />
        </div>
      )}
      <Select value={status} onValueChange={handleStatusChange} disabled={isLoading}>
        <SelectTrigger className="w-[160px]">
          <SelectValue />
        </SelectTrigger>
        <SelectContent>
          <SelectItem value="PENDING">Pendiente</SelectItem>
          <SelectItem value="CONFIRMED">Confirmar</SelectItem>
          <SelectItem value="COMPLETED">Completada</SelectItem>
          <SelectItem value="CANCELLED">Cancelar</SelectItem>
          <SelectItem value="NO_SHOW">No asistió</SelectItem>
        </SelectContent>
      </Select>
    </div>
  );
}
