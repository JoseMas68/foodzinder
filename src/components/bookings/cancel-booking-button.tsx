"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
  AlertDialogTrigger,
} from "@/components/ui/alert-dialog";
import { X, Loader2 } from "lucide-react";
import { cancelBooking } from "@/server/actions/bookings";
import { toast } from "sonner";
import { useRouter } from "next/navigation";

interface CancelBookingButtonProps {
  bookingId: string;
}

export function CancelBookingButton({ bookingId }: CancelBookingButtonProps) {
  const [isOpen, setIsOpen] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const router = useRouter();

  const handleCancel = async () => {
    setIsLoading(true);
    try {
      const result = await cancelBooking(bookingId);

      if (result.success) {
        toast.success("Reserva cancelada", {
          description: "Tu reserva ha sido cancelada correctamente.",
        });
        setIsOpen(false);
        router.refresh();
      } else {
        toast.error("Error al cancelar", {
          description: result.error || "No se pudo cancelar la reserva",
        });
      }
    } catch (error) {
      toast.error("Error inesperado", {
        description: "Por favor, intenta de nuevo más tarde",
      });
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <AlertDialog open={isOpen} onOpenChange={setIsOpen}>
      <AlertDialogTrigger asChild>
        <Button variant="outline" size="sm" className="text-red-600 hover:text-red-700 hover:bg-red-50">
          <X className="h-4 w-4 mr-2" />
          Cancelar Reserva
        </Button>
      </AlertDialogTrigger>
      <AlertDialogContent>
        <AlertDialogHeader>
          <AlertDialogTitle>¿Cancelar reserva?</AlertDialogTitle>
          <AlertDialogDescription>
            Esta acción no se puede deshacer. La reserva será cancelada y el restaurante
            será notificado.
          </AlertDialogDescription>
        </AlertDialogHeader>
        <AlertDialogFooter>
          <AlertDialogCancel disabled={isLoading}>
            No, mantener reserva
          </AlertDialogCancel>
          <AlertDialogAction
            onClick={handleCancel}
            disabled={isLoading}
            className="bg-red-600 hover:bg-red-700"
          >
            {isLoading && <Loader2 className="mr-2 h-4 w-4 animate-spin" />}
            {isLoading ? "Cancelando..." : "Sí, cancelar reserva"}
          </AlertDialogAction>
        </AlertDialogFooter>
      </AlertDialogContent>
    </AlertDialog>
  );
}
