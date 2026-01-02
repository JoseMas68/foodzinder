"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  CheckCircle,
  XCircle,
  Archive,
  Eye,
  MapPin,
  Calendar,
  User,
  Mail,
  Phone,
  Globe,
  DollarSign,
} from "lucide-react";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import Image from "next/image";

interface Restaurant {
  id: string;
  name: string;
  slug: string;
  description: string;
  address: string;
  latitude: number | null;
  longitude: number | null;
  status: string;
  logoUrl: string | null;
  coverUrl: string | null;
  priceRange: string;
  phone: string | null;
  website: string | null;
  createdAt: string;
  updatedAt: string;
  owner: {
    id: string;
    email: string;
    firstName: string;
    lastName: string;
  };
  _count: {
    reviews: number;
    menus: number;
  };
}

const statusLabels: Record<string, string> = {
  PENDING: "Pendiente",
  APPROVED: "Aprobado",
  REJECTED: "Rechazado",
  ARCHIVED: "Archivado",
};

const statusColors: Record<string, string> = {
  PENDING: "bg-yellow-100 text-yellow-800 border-yellow-300",
  APPROVED: "bg-green-100 text-green-800 border-green-300",
  REJECTED: "bg-red-100 text-red-800 border-red-300",
  ARCHIVED: "bg-gray-100 text-gray-800 border-gray-300",
};

const priceRangeLabels: Record<string, string> = {
  CHEAP: "€ - Económico",
  MODERATE: "€€ - Moderado",
  EXPENSIVE: "€€€ - Caro",
  LUXURY: "€€€€ - Lujo",
};

export default function ModerationPage() {
  const [restaurants, setRestaurants] = useState<Restaurant[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [filterStatus, setFilterStatus] = useState<string>("PENDING");
  const [selectedRestaurant, setSelectedRestaurant] = useState<Restaurant | null>(null);
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [processingId, setProcessingId] = useState<string | null>(null);

  useEffect(() => {
    fetchRestaurants();
  }, [filterStatus]);

  const fetchRestaurants = async () => {
    try {
      const url = filterStatus === "ALL"
        ? "/api/admin/restaurants"
        : `/api/admin/restaurants?status=${filterStatus}`;

      const response = await fetch(url);
      const data = await response.json();
      // Asegurar que data sea un array
      if (Array.isArray(data)) {
        setRestaurants(data);
      } else {
        console.error("API did not return an array:", data);
        setRestaurants([]);
      }
    } catch (error) {
      console.error("Error fetching restaurants:", error);
      setRestaurants([]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleModerate = async (id: string, status: string) => {
    if (!confirm(`¿Estás seguro de cambiar el estado a ${statusLabels[status]}?`)) {
      return;
    }

    setProcessingId(id);
    try {
      await fetch(`/api/admin/restaurants/${id}/moderate`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ status }),
      });

      // Actualizar lista local
      setRestaurants((prev) =>
        prev.map((r) => (r.id === id ? { ...r, status } : r))
      );

      // Si estamos filtrando, remover de la lista
      if (filterStatus !== "ALL" && filterStatus !== status) {
        setRestaurants((prev) => prev.filter((r) => r.id !== id));
      }

      setIsDialogOpen(false);
    } catch (error) {
      console.error("Error moderating restaurant:", error);
      alert("Error al moderar el restaurante");
    } finally {
      setProcessingId(null);
    }
  };

  const openPreview = (restaurant: Restaurant) => {
    setSelectedRestaurant(restaurant);
    setIsDialogOpen(true);
  };

  if (isLoading) {
    return (
      <div className="flex items-center justify-center min-h-[400px]">
        <p className="text-muted-foreground">Cargando...</p>
      </div>
    );
  }

  return (
    <div className="space-y-6">
        <div className="flex items-center justify-between">
          <div>
            <h1 className="text-3xl font-heading font-bold">
              Moderación de Restaurantes
            </h1>
            <p className="text-muted-foreground mt-1">
              Revisa y aprueba los restaurantes pendientes
            </p>
          </div>
          <div className="w-[200px]">
            <Select value={filterStatus} onValueChange={setFilterStatus}>
              <SelectTrigger>
                <SelectValue placeholder="Filtrar por estado" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="ALL">Todos</SelectItem>
                <SelectItem value="PENDING">Pendientes</SelectItem>
                <SelectItem value="APPROVED">Aprobados</SelectItem>
                <SelectItem value="REJECTED">Rechazados</SelectItem>
                <SelectItem value="ARCHIVED">Archivados</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </div>

        {restaurants.length === 0 ? (
          <Card>
            <CardContent className="py-12">
              <div className="text-center">
                <p className="text-muted-foreground">
                  No hay restaurantes con el estado seleccionado
                </p>
              </div>
            </CardContent>
          </Card>
        ) : (
          <div className="grid gap-4">
            {restaurants.map((restaurant) => (
              <Card key={restaurant.id} className="overflow-hidden">
                <div className="flex">
                  {/* Image */}
                  <div className="relative w-48 h-48 flex-shrink-0 bg-gray-100">
                    {restaurant.coverUrl ? (
                      <Image
                        src={restaurant.coverUrl}
                        alt={restaurant.name}
                        fill
                        className="object-cover"
                      />
                    ) : (
                      <div className="flex items-center justify-center h-full text-gray-400">
                        Sin imagen
                      </div>
                    )}
                  </div>

                  {/* Content */}
                  <div className="flex-1 p-6">
                    <div className="flex items-start justify-between mb-3">
                      <div>
                        <div className="flex items-center gap-2 mb-1">
                          <h3 className="text-xl font-semibold">
                            {restaurant.name}
                          </h3>
                          <Badge
                            variant="outline"
                            className={statusColors[restaurant.status]}
                          >
                            {statusLabels[restaurant.status]}
                          </Badge>
                        </div>
                        <p className="text-sm text-muted-foreground line-clamp-2">
                          {restaurant.description}
                        </p>
                      </div>
                    </div>

                    <div className="grid grid-cols-2 gap-3 mb-4 text-sm">
                      <div className="flex items-center gap-2 text-muted-foreground">
                        <MapPin className="h-4 w-4" />
                        <span className="truncate">{restaurant.address}</span>
                      </div>
                      <div className="flex items-center gap-2 text-muted-foreground">
                        <DollarSign className="h-4 w-4" />
                        <span>{priceRangeLabels[restaurant.priceRange]}</span>
                      </div>
                      <div className="flex items-center gap-2 text-muted-foreground">
                        <User className="h-4 w-4" />
                        <span>
                          {restaurant.owner.firstName} {restaurant.owner.lastName}
                        </span>
                      </div>
                      <div className="flex items-center gap-2 text-muted-foreground">
                        <Calendar className="h-4 w-4" />
                        <span>
                          {new Date(restaurant.createdAt).toLocaleDateString(
                            "es-ES"
                          )}
                        </span>
                      </div>
                    </div>

                    {/* Actions */}
                    <div className="flex gap-2">
                      <Button
                        variant="outline"
                        size="sm"
                        onClick={() => openPreview(restaurant)}
                      >
                        <Eye className="h-4 w-4 mr-2" />
                        Ver detalles
                      </Button>
                      {restaurant.status === "PENDING" && (
                        <>
                          <Button
                            variant="default"
                            size="sm"
                            onClick={() => handleModerate(restaurant.id, "APPROVED")}
                            disabled={processingId === restaurant.id}
                          >
                            <CheckCircle className="h-4 w-4 mr-2" />
                            Aprobar
                          </Button>
                          <Button
                            variant="destructive"
                            size="sm"
                            onClick={() => handleModerate(restaurant.id, "REJECTED")}
                            disabled={processingId === restaurant.id}
                          >
                            <XCircle className="h-4 w-4 mr-2" />
                            Rechazar
                          </Button>
                        </>
                      )}
                      {restaurant.status !== "ARCHIVED" && (
                        <Button
                          variant="outline"
                          size="sm"
                          onClick={() => handleModerate(restaurant.id, "ARCHIVED")}
                          disabled={processingId === restaurant.id}
                        >
                          <Archive className="h-4 w-4 mr-2" />
                          Archivar
                        </Button>
                      )}
                    </div>
                  </div>
                </div>
              </Card>
            ))}
          </div>
        )}

        {/* Preview Dialog */}
        <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
        <DialogContent className="max-w-3xl max-h-[90vh] overflow-y-auto">
          {selectedRestaurant && (
            <>
              <DialogHeader>
                <DialogTitle className="flex items-center gap-2">
                  {selectedRestaurant.name}
                  <Badge
                    variant="outline"
                    className={statusColors[selectedRestaurant.status]}
                  >
                    {statusLabels[selectedRestaurant.status]}
                  </Badge>
                </DialogTitle>
                <DialogDescription>
                  Vista previa completa del restaurante
                </DialogDescription>
              </DialogHeader>

              <div className="space-y-6">
                {/* Cover Image */}
                {selectedRestaurant.coverUrl && (
                  <div className="relative w-full h-64 rounded-lg overflow-hidden">
                    <Image
                      src={selectedRestaurant.coverUrl}
                      alt={selectedRestaurant.name}
                      fill
                      className="object-cover"
                    />
                  </div>
                )}

                {/* Info Grid */}
                <div className="grid grid-cols-2 gap-4">
                  <div>
                    <h4 className="font-semibold mb-2 text-sm text-muted-foreground">
                      Descripción
                    </h4>
                    <p className="text-sm">{selectedRestaurant.description}</p>
                  </div>
                  <div>
                    <h4 className="font-semibold mb-2 text-sm text-muted-foreground">
                      Dirección
                    </h4>
                    <p className="text-sm flex items-start gap-2">
                      <MapPin className="h-4 w-4 mt-0.5 flex-shrink-0" />
                      {selectedRestaurant.address}
                    </p>
                  </div>
                  <div>
                    <h4 className="font-semibold mb-2 text-sm text-muted-foreground">
                      Rango de precio
                    </h4>
                    <p className="text-sm">
                      {priceRangeLabels[selectedRestaurant.priceRange]}
                    </p>
                  </div>
                  {selectedRestaurant.phone && (
                    <div>
                      <h4 className="font-semibold mb-2 text-sm text-muted-foreground">
                        Teléfono
                      </h4>
                      <p className="text-sm flex items-center gap-2">
                        <Phone className="h-4 w-4" />
                        {selectedRestaurant.phone}
                      </p>
                    </div>
                  )}
                  {selectedRestaurant.website && (
                    <div>
                      <h4 className="font-semibold mb-2 text-sm text-muted-foreground">
                        Sitio web
                      </h4>
                      <p className="text-sm flex items-center gap-2">
                        <Globe className="h-4 w-4" />
                        <a
                          href={selectedRestaurant.website}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="text-primary hover:underline truncate"
                        >
                          {selectedRestaurant.website}
                        </a>
                      </p>
                    </div>
                  )}
                  <div>
                    <h4 className="font-semibold mb-2 text-sm text-muted-foreground">
                      Propietario
                    </h4>
                    <p className="text-sm flex items-start gap-2">
                      <User className="h-4 w-4 mt-0.5" />
                      <span>
                        {selectedRestaurant.owner.firstName}{" "}
                        {selectedRestaurant.owner.lastName}
                        <br />
                        <span className="text-muted-foreground flex items-center gap-1 mt-1">
                          <Mail className="h-3 w-3" />
                          {selectedRestaurant.owner.email}
                        </span>
                      </span>
                    </p>
                  </div>
                </div>

                {/* Stats */}
                <div className="grid grid-cols-3 gap-4 pt-4 border-t">
                  <div className="text-center">
                    <p className="text-2xl font-bold">
                      {selectedRestaurant._count.reviews}
                    </p>
                    <p className="text-sm text-muted-foreground">Reseñas</p>
                  </div>
                  <div className="text-center">
                    <p className="text-2xl font-bold">
                      {selectedRestaurant._count.menus}
                    </p>
                    <p className="text-sm text-muted-foreground">Menús</p>
                  </div>
                  <div className="text-center">
                    <p className="text-2xl font-bold">
                      {selectedRestaurant.latitude && selectedRestaurant.longitude
                        ? "Sí"
                        : "No"}
                    </p>
                    <p className="text-sm text-muted-foreground">Ubicación GPS</p>
                  </div>
                </div>

                {/* Actions */}
                {selectedRestaurant.status === "PENDING" && (
                  <div className="flex gap-3 pt-4 border-t">
                    <Button
                      className="flex-1"
                      onClick={() =>
                        handleModerate(selectedRestaurant.id, "APPROVED")
                      }
                      disabled={processingId === selectedRestaurant.id}
                    >
                      <CheckCircle className="h-4 w-4 mr-2" />
                      Aprobar restaurante
                    </Button>
                    <Button
                      variant="destructive"
                      className="flex-1"
                      onClick={() =>
                        handleModerate(selectedRestaurant.id, "REJECTED")
                      }
                      disabled={processingId === selectedRestaurant.id}
                    >
                      <XCircle className="h-4 w-4 mr-2" />
                      Rechazar restaurante
                    </Button>
                  </div>
                )}
              </div>
            </>
          )}
        </DialogContent>
        </Dialog>
      </div>
  );
}
