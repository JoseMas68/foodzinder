"use client";

import { useEffect, useState } from "react";
import { getEmailTemplates, getOwnerRestaurants } from "@/server/actions/email-templates";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Mail, Edit, Eye } from "lucide-react";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

export default function EmailTemplatesPage() {
  const [restaurants, setRestaurants] = useState<any[]>([]);
  const [selectedRestaurantId, setSelectedRestaurantId] = useState<string>("");
  const [templates, setTemplates] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  // Cargar restaurantes al montar
  useEffect(() => {
    loadRestaurants();
  }, []);

  // Cargar plantillas cuando cambia el restaurante seleccionado
  useEffect(() => {
    if (selectedRestaurantId) {
      loadTemplates();
    }
  }, [selectedRestaurantId]);

  const loadRestaurants = async () => {
    try {
      const result = await getOwnerRestaurants();
      if (result.success && result.data) {
        setRestaurants(result.data);
        // Auto-seleccionar el primer restaurante
        if (result.data.length > 0) {
          setSelectedRestaurantId(result.data[0].id);
        }
      } else {
        setError(result.error || "Error al cargar restaurantes");
      }
    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const loadTemplates = async () => {
    if (!selectedRestaurantId) return;

    try {
      setLoading(true);
      const result = await getEmailTemplates(selectedRestaurantId);
      if (result.success && result.data) {
        setTemplates(result.data);
        setError(null);
      } else {
        setError(result.error || "Error al cargar plantillas");
        setTemplates([]);
      }
    } catch (err: any) {
      setError(err.message);
      setTemplates([]);
    } finally {
      setLoading(false);
    }
  };

  const getTemplateIcon = (type: string) => {
    const icons: Record<string, string> = {
      BOOKING_CONFIRMATION: "✅",
      BOOKING_CANCELLED: "❌",
      OWNER_NEW_BOOKING: "👤",
      BOOKING_REMINDER: "⏰",
      PASSWORD_RESET: "🔑",
      WELCOME_EMAIL: "✨",
    };

    return icons[type] || "📧";
  };

  const getTemplateTypeLabel = (type: string) => {
    const labels: Record<string, string> = {
      BOOKING_CONFIRMATION: "Confirmación de Reserva",
      BOOKING_CANCELLED: "Cancelación de Reserva",
      OWNER_NEW_BOOKING: "Nueva Reserva (Owner)",
      BOOKING_REMINDER: "Recordatorio de Reserva",
      PASSWORD_RESET: "Restablecimiento de Contraseña",
      WELCOME_EMAIL: "Email de Bienvenida",
    };
    return labels[type] || type;
  };

  if (loading && restaurants.length === 0) {
    return (
      <div className="space-y-6">
        <h1 className="text-3xl font-heading font-bold">Plantillas de Email</h1>
        <Card>
          <CardContent className="p-12 text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
            <p className="text-gray-500">Cargando...</p>
          </CardContent>
        </Card>
      </div>
    );
  }

  if (error && restaurants.length === 0) {
    return (
      <div className="space-y-6">
        <h1 className="text-3xl font-heading font-bold">Plantillas de Email</h1>
        <Card>
          <CardContent className="p-12 text-center text-red-500">
            Error: {error}
          </CardContent>
        </Card>
      </div>
    );
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-heading font-bold">Plantillas de Email</h1>
        <p className="text-gray-500 mt-1">
          Gestiona y personaliza las plantillas de email que se envían automáticamente
        </p>
      </div>

      {/* Selector de Restaurante */}
      <Card>
        <CardHeader>
          <CardTitle className="text-base">Selecciona un Restaurante</CardTitle>
        </CardHeader>
        <CardContent>
          <Select value={selectedRestaurantId} onValueChange={setSelectedRestaurantId}>
            <SelectTrigger className="w-full max-w-md">
              <SelectValue placeholder="Selecciona un restaurante" />
            </SelectTrigger>
            <SelectContent>
              {restaurants.map((restaurant) => (
                <SelectItem key={restaurant.id} value={restaurant.id}>
                  {restaurant.name}
                </SelectItem>
              ))}
            </SelectContent>
          </Select>
        </CardContent>
      </Card>

      {/* Plantillas */}
      {loading ? (
        <Card>
          <CardContent className="p-12 text-center">
            <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
            <p className="text-gray-500">Cargando plantillas...</p>
          </CardContent>
        </Card>
      ) : error ? (
        <Card>
          <CardContent className="p-12 text-center text-red-500">
            Error: {error}
          </CardContent>
        </Card>
      ) : (
        <>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {templates.map((template) => (
              <Card key={template.id} className="overflow-hidden hover:shadow-lg transition-shadow">
                <CardHeader className="pb-3">
                  <div className="flex items-start justify-between">
                    <div className="flex items-center gap-3">
                      <div className="text-3xl">{getTemplateIcon(template.type)}</div>
                      <div>
                        <CardTitle className="text-lg">{template.name}</CardTitle>
                        <p className="text-xs text-gray-500 mt-1">
                          {getTemplateTypeLabel(template.type)}
                        </p>
                      </div>
                    </div>
                    <Badge variant={template.isActive ? "default" : "secondary"}>
                      {template.isActive ? "Activo" : "Inactivo"}
                    </Badge>
                  </div>
                </CardHeader>
                <CardContent>
                  {template.description && (
                    <p className="text-sm text-gray-600 mb-4">{template.description}</p>
                  )}

                  <div className="flex gap-2">
                    <Button asChild className="flex-1" size="sm">
                      <Link href={`/dashboard/email-templates/${template.id}/edit`}>
                        <Edit className="h-4 w-4 mr-2" />
                        Editar
                      </Link>
                    </Button>
                    <Button asChild variant="outline" size="sm">
                      <Link href={`/dashboard/email-templates/${template.id}/preview`}>
                        <Eye className="h-4 w-4" />
                      </Link>
                    </Button>
                  </div>

                  <div className="mt-4 pt-4 border-t">
                    <p className="text-xs text-gray-500">
                      <strong>Asunto:</strong> {template.subject}
                    </p>
                    {template.restaurant && (
                      <p className="text-xs text-gray-400 mt-1">
                        <strong>Restaurante:</strong> {template.restaurant.name}
                      </p>
                    )}
                    <p className="text-xs text-gray-400 mt-1">
                      Actualizado: {new Date(template.updatedAt).toLocaleDateString("es-ES")}
                    </p>
                  </div>
                </CardContent>
              </Card>
            ))}
          </div>

          {templates.length === 0 && (
            <Card>
              <CardContent className="p-12 text-center">
                <Mail className="h-12 w-12 text-gray-300 mx-auto mb-4" />
                <p className="text-gray-500 font-medium">No hay plantillas disponibles</p>
                <p className="text-sm text-gray-400 mt-1">
                  Selecciona un restaurante para ver sus plantillas
                </p>
              </CardContent>
            </Card>
          )}
        </>
      )}
    </div>
  );
}
