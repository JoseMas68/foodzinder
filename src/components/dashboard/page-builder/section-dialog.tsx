"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { Textarea } from "@/components/ui/textarea";
import { ImageUpload } from "@/components/ui/image-upload";

interface SectionDialogProps {
  open: boolean;
  onOpenChange: (open: boolean) => void;
  section?: {
    id: string;
    type: string;
    title: string | null;
    subtitle: string | null;
    order: number;
    isActive: boolean;
    config: any;
  };
  onSave: (data: any) => Promise<void>;
}

const sectionTypes = [
  { value: "HERO", label: "Slider / Hero", description: "Banner con imagen de fondo" },
  { value: "CAROUSEL", label: "Carrusel de restaurantes", description: "Carrusel horizontal" },
];

// Acciones predefinidas para los botones
const buttonActions = [
  { value: "/restaurants", label: "Ver todos los restaurantes" },
  { value: "/restaurants?sort=rating", label: "Mejor valorados" },
  { value: "/restaurants?sort=newest", label: "Más recientes" },
  { value: "/dashboard/restaurants/new", label: "Registra tu restaurante" },
  { value: "/about", label: "Sobre nosotros" },
  { value: "/contact", label: "Contacto" },
];

export function SectionDialog({
  open,
  onOpenChange,
  section,
  onSave,
}: SectionDialogProps) {
  const [type, setType] = useState(section?.type || "HERO");
  const [title, setTitle] = useState(section?.title || "");
  const [subtitle, setSubtitle] = useState(section?.subtitle || "");
  const [isSaving, setIsSaving] = useState(false);

  // Campos para HERO (Slider)
  const [imageUrl, setImageUrl] = useState(section?.config?.imageUrl || "");
  const [buttonText, setButtonText] = useState(section?.config?.buttonText || "");
  const [buttonAction, setButtonAction] = useState(section?.config?.buttonAction || "/restaurants");
  const [contentPosition, setContentPosition] = useState(section?.config?.contentPosition || "center");
  const [buttonSize, setButtonSize] = useState(section?.config?.buttonSize || "lg");

  // Campos para CAROUSEL
  const [limit, setLimit] = useState(section?.config?.limit?.toString() || "12");
  const [filter, setFilter] = useState(section?.config?.filter || "rating");

  useEffect(() => {
    if (section) {
      setType(section.type);
      setTitle(section.title || "");
      setSubtitle(section.subtitle || "");
      setImageUrl(section.config?.imageUrl || "");
      setButtonText(section.config?.buttonText || "");
      setButtonAction(section.config?.buttonAction || "/restaurants");
      setContentPosition(section.config?.contentPosition || "center");
      setButtonSize(section.config?.buttonSize || "lg");
      setLimit(section.config?.limit?.toString() || "12");
      setFilter(section.config?.filter || "rating");
    } else {
      // Reset
      setType("HERO");
      setTitle("");
      setSubtitle("");
      setImageUrl("");
      setButtonText("");
      setButtonAction("/restaurants");
      setContentPosition("center");
      setButtonSize("lg");
      setLimit("12");
      setFilter("rating");
    }
  }, [section, open]);

  const handleSave = async () => {
    setIsSaving(true);
    try {
      let config: any = {};

      if (type === "HERO") {
        config = {
          imageUrl: imageUrl || null,
          buttonText: buttonText || null,
          buttonAction: buttonAction,
          contentPosition: contentPosition,
          buttonSize: buttonSize,
        };
      } else if (type === "CAROUSEL") {
        config = {
          limit: parseInt(limit) || 12,
          filter: filter,
        };
      }

      const data = {
        type,
        title: title || null,
        subtitle: subtitle || null,
        config,
      };

      await onSave(data);
      onOpenChange(false);
    } catch (error) {
      console.error("Error saving section:", error);
      alert("Error al guardar la sección");
    } finally {
      setIsSaving(false);
    }
  };

  return (
    <Dialog open={open} onOpenChange={onOpenChange}>
      <DialogContent className="max-w-2xl max-h-[90vh] overflow-y-auto">
        <DialogHeader>
          <DialogTitle>
            {section ? "Editar Sección" : "Nueva Sección"}
          </DialogTitle>
          <DialogDescription>
            Configura la sección de la página de inicio
          </DialogDescription>
        </DialogHeader>

        <div className="space-y-6 py-4">
          {/* Tipo de sección */}
          <div className="grid gap-2">
            <Label htmlFor="type">Tipo de sección</Label>
            <Select value={type} onValueChange={setType}>
              <SelectTrigger id="type">
                <SelectValue />
              </SelectTrigger>
              <SelectContent>
                {sectionTypes.map((st) => (
                  <SelectItem key={st.value} value={st.value}>
                    <div>
                      <div className="font-medium">{st.label}</div>
                      <div className="text-xs text-muted-foreground">{st.description}</div>
                    </div>
                  </SelectItem>
                ))}
              </SelectContent>
            </Select>
          </div>

          {/* Campos comunes */}
          <div className="grid gap-4 p-4 border rounded-lg bg-muted/30">
            <h3 className="font-semibold text-sm">Contenido del texto</h3>

            <div className="grid gap-2">
              <Label htmlFor="title">Título principal</Label>
              <Input
                id="title"
                value={title}
                onChange={(e) => setTitle(e.target.value)}
                placeholder="Ej: Descubre los mejores restaurantes"
              />
            </div>

            <div className="grid gap-2">
              <Label htmlFor="subtitle">Subtítulo</Label>
              <Textarea
                id="subtitle"
                value={subtitle}
                onChange={(e) => setSubtitle(e.target.value)}
                placeholder="Ej: Explora una selección de restaurantes cuidadosamente seleccionados"
                rows={2}
              />
            </div>
          </div>

          {/* Configuración específica para HERO */}
          {type === "HERO" && (
            <div className="grid gap-4 p-4 border rounded-lg">
              <h3 className="font-semibold text-sm">Configuración del Hero/Slider</h3>

              <div className="grid gap-2">
                <Label>Imagen de fondo del Hero</Label>
                <ImageUpload
                  value={imageUrl}
                  onChange={(url) => setImageUrl(url)}
                  onRemove={() => setImageUrl("")}
                  disabled={isSaving}
                />
              </div>

              <div className="grid gap-2">
                <Label htmlFor="buttonText">Texto del botón (opcional)</Label>
                <Input
                  id="buttonText"
                  value={buttonText}
                  onChange={(e) => setButtonText(e.target.value)}
                  placeholder="Ej: Explorar restaurantes"
                />
              </div>

              <div className="grid gap-2">
                <Label htmlFor="buttonAction">Acción del botón</Label>
                <Select value={buttonAction} onValueChange={setButtonAction}>
                  <SelectTrigger id="buttonAction">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    {buttonActions.map((action) => (
                      <SelectItem key={action.value} value={action.value}>
                        {action.label}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              <div className="grid gap-2">
                <Label htmlFor="buttonSize">Tamaño del botón</Label>
                <Select value={buttonSize} onValueChange={setButtonSize}>
                  <SelectTrigger id="buttonSize">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="default">Normal</SelectItem>
                    <SelectItem value="lg">Grande</SelectItem>
                    <SelectItem value="xl">Extra Grande</SelectItem>
                  </SelectContent>
                </Select>
              </div>

              <div className="grid gap-2">
                <Label htmlFor="contentPosition">Posición del contenido</Label>
                <Select value={contentPosition} onValueChange={setContentPosition}>
                  <SelectTrigger id="contentPosition">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="left">Izquierda</SelectItem>
                    <SelectItem value="center">Centro</SelectItem>
                    <SelectItem value="right">Derecha</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
          )}

          {/* Configuración para CAROUSEL */}
          {type === "CAROUSEL" && (
            <div className="grid gap-4 p-4 border rounded-lg">
              <h3 className="font-semibold text-sm">Configuración del Carrusel</h3>

              <div className="grid gap-2">
                <Label htmlFor="filter">Filtrar por</Label>
                <Select value={filter} onValueChange={setFilter}>
                  <SelectTrigger id="filter">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent className="max-h-[300px]">
                    <SelectItem value="rating">✨ Mejor valorados</SelectItem>
                    <SelectItem value="newest">🆕 Más recientes</SelectItem>
                    <SelectItem value="popular">🔥 Más populares</SelectItem>
                    <SelectItem value="random">🎲 Aleatorios</SelectItem>

                    {/* Características */}
                    <SelectItem value="garden">🌳 Con jardín</SelectItem>
                    <SelectItem value="terrace">☀️ Con terraza</SelectItem>
                    <SelectItem value="outdoor">🏞️ Espacio exterior</SelectItem>
                    <SelectItem value="parking">🚗 Con parking</SelectItem>
                    <SelectItem value="events">🎉 Para eventos</SelectItem>
                    <SelectItem value="delivery">🚚 Con delivery</SelectItem>
                    <SelectItem value="bar">🍷 Con bar</SelectItem>
                    <SelectItem value="live-music">🎵 Música en vivo</SelectItem>

                    {/* Opciones dietéticas */}
                    <SelectItem value="vegetarian">🥗 Vegetariano</SelectItem>
                    <SelectItem value="vegan">🌱 Vegano</SelectItem>
                    <SelectItem value="gluten-free">🌾 Sin gluten</SelectItem>
                    <SelectItem value="lactose-free">🥛 Sin lactosa</SelectItem>

                    {/* Ambiente */}
                    <SelectItem value="romantic">💑 Ambiente romántico</SelectItem>
                    <SelectItem value="family">👨‍👩‍👧‍👦 Ambiente familiar</SelectItem>
                    <SelectItem value="casual">😎 Casual</SelectItem>
                    <SelectItem value="elegant">✨ Elegante</SelectItem>
                    <SelectItem value="modern">🏙️ Moderno</SelectItem>
                    <SelectItem value="rustic">🏡 Rústico</SelectItem>
                    <SelectItem value="quiet">🤫 Tranquilo</SelectItem>
                    <SelectItem value="lively">🎊 Animado</SelectItem>

                    {/* Precio */}
                    <SelectItem value="luxury">💎 De lujo</SelectItem>
                    <SelectItem value="cheap">💰 Económicos</SelectItem>

                    {/* Ciudades */}
                    <SelectItem value="madrid">📍 Madrid</SelectItem>
                    <SelectItem value="barcelona">📍 Barcelona</SelectItem>
                    <SelectItem value="valencia">📍 Valencia</SelectItem>
                    <SelectItem value="sevilla">📍 Sevilla</SelectItem>
                  </SelectContent>
                </Select>
                <p className="text-xs text-muted-foreground">
                  Elige qué tipo de restaurantes mostrar
                </p>
              </div>

              <div className="grid gap-2">
                <Label htmlFor="limit">Cantidad de restaurantes</Label>
                <Select value={limit} onValueChange={setLimit}>
                  <SelectTrigger id="limit">
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="6">6 restaurantes</SelectItem>
                    <SelectItem value="8">8 restaurantes</SelectItem>
                    <SelectItem value="12">12 restaurantes (recomendado)</SelectItem>
                    <SelectItem value="16">16 restaurantes</SelectItem>
                    <SelectItem value="20">20 restaurantes</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
          )}
        </div>

        <DialogFooter>
          <Button
            variant="outline"
            onClick={() => onOpenChange(false)}
            disabled={isSaving}
          >
            Cancelar
          </Button>
          <Button onClick={handleSave} disabled={isSaving}>
            {isSaving ? "Guardando..." : section ? "Guardar cambios" : "Crear sección"}
          </Button>
        </DialogFooter>
      </DialogContent>
    </Dialog>
  );
}
