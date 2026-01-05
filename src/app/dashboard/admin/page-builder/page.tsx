"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
  Plus,
  GripVertical,
  Eye,
  EyeOff,
  Pencil,
  Trash2,
} from "lucide-react";
import { DragDropContext, Droppable, Draggable, DropResult } from "@hello-pangea/dnd";
import { SectionDialog } from "@/components/dashboard/page-builder/section-dialog";

interface PageSection {
  id: string;
  type: string;
  title: string | null;
  subtitle: string | null;
  order: number;
  isActive: boolean;
  config: any;
}

export default function PageBuilderPage() {
  const [sections, setSections] = useState<PageSection[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isSaving, setIsSaving] = useState(false);
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [editingSection, setEditingSection] = useState<PageSection | undefined>(undefined);

  useEffect(() => {
    fetchSections();
  }, []);

  const fetchSections = async () => {
    try {
      const response = await fetch("/api/admin/page-sections");
      const data = await response.json();
      // Asegurar que data sea un array
      if (Array.isArray(data)) {
        setSections(data);
      } else {
        console.error("API did not return an array:", data);
        setSections([]);
      }
    } catch (error) {
      console.error("Error fetching sections:", error);
      setSections([]);
    } finally {
      setIsLoading(false);
    }
  };

  const handleDragEnd = async (result: DropResult) => {
    if (!result.destination) return;

    const items = Array.from(sections);
    const [reorderedItem] = items.splice(result.source.index, 1);
    items.splice(result.destination.index, 0, reorderedItem);

    // Update order values
    const updatedSections = items.map((item, index) => ({
      ...item,
      order: index,
    }));

    setSections(updatedSections);

    // Save new order to backend
    await saveOrder(updatedSections);
  };

  const saveOrder = async (updatedSections: PageSection[]) => {
    setIsSaving(true);
    try {
      await Promise.all(
        updatedSections.map((section) =>
          fetch(`/api/admin/page-sections/${section.id}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ order: section.order }),
          })
        )
      );
    } catch (error) {
      console.error("Error saving order:", error);
    } finally {
      setIsSaving(false);
    }
  };

  const toggleActive = async (id: string, currentState: boolean) => {
    try {
      await fetch(`/api/admin/page-sections/${id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ isActive: !currentState }),
      });

      setSections((prev) =>
        prev.map((s) => (s.id === id ? { ...s, isActive: !currentState } : s))
      );
    } catch (error) {
      console.error("Error toggling section:", error);
    }
  };

  const deleteSection = async (id: string) => {
    if (!confirm("¿Estás seguro de eliminar esta sección?")) return;

    try {
      await fetch(`/api/admin/page-sections/${id}`, {
        method: "DELETE",
      });

      setSections((prev) => prev.filter((s) => s.id !== id));
    } catch (error) {
      console.error("Error deleting section:", error);
    }
  };

  const openCreateDialog = () => {
    setEditingSection(undefined);
    setIsDialogOpen(true);
  };

  const openEditDialog = (section: PageSection) => {
    setEditingSection(section);
    setIsDialogOpen(true);
  };

  const handleSaveSection = async (data: any) => {
    if (editingSection) {
      // Editar sección existente
      const response = await fetch(`/api/admin/page-sections/${editingSection.id}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data),
      });

      if (response.ok) {
        const updated = await response.json();
        setSections((prev) =>
          prev.map((s) => (s.id === updated.id ? updated : s))
        );
      }
    } else {
      // Crear nueva sección
      const response = await fetch("/api/admin/page-sections", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          ...data,
          order: sections.length,
          isActive: true,
        }),
      });

      if (response.ok) {
        const newSection = await response.json();
        setSections((prev) => [...prev, newSection]);
      }
    }
  };

  const getSectionTypeLabel = (type: string) => {
    const labels: Record<string, string> = {
      HERO: "Hero",
      CAROUSEL: "Carrusel",
      CTA: "Llamada a la acción",
      FEATURED_GRID: "Grid destacados",
      CATEGORY_BANNER: "Banner categoría",
      CUSTOM_HTML: "HTML personalizado",
    };
    return labels[type] || type;
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
            <h1 className="text-3xl font-heading font-bold">Page Builder</h1>
            <p className="text-muted-foreground mt-1">
              Gestiona las secciones de la página de inicio
            </p>
          </div>
          <div className="flex gap-3">
            <Button variant="outline" onClick={openCreateDialog}>
              <Plus className="h-4 w-4 mr-2" />
              Añadir sección
            </Button>
            <Button variant="outline" asChild>
              <a href="/" target="_blank">
                <Eye className="h-4 w-4 mr-2" />
                Vista previa
              </a>
            </Button>
          </div>
        </div>

        {isSaving && (
          <Card className="border-primary bg-primary/5">
            <CardContent className="py-3">
              <p className="text-sm text-primary font-medium">
                Guardando cambios...
              </p>
            </CardContent>
          </Card>
        )}

        <Card>
          <CardHeader>
            <CardTitle>Secciones actuales</CardTitle>
          </CardHeader>
          <CardContent>
            <DragDropContext onDragEnd={handleDragEnd}>
              <Droppable droppableId="sections">
                {(provided) => (
                  <div
                    {...provided.droppableProps}
                    ref={provided.innerRef}
                    className="space-y-3"
                  >
                    {sections.map((section, index) => (
                      <Draggable
                        key={section.id}
                        draggableId={section.id}
                        index={index}
                      >
                        {(provided, snapshot) => (
                          <div
                            ref={provided.innerRef}
                            {...provided.draggableProps}
                            className={`flex items-center gap-4 p-4 border rounded-lg bg-white transition-all ${
                              snapshot.isDragging
                                ? "shadow-lg scale-105"
                                : "shadow-sm"
                            } ${
                              !section.isActive ? "opacity-60" : ""
                            }`}
                          >
                            <div
                              {...provided.dragHandleProps}
                              className="text-muted-foreground hover:text-foreground cursor-grab active:cursor-grabbing"
                            >
                              <GripVertical className="h-5 w-5" />
                            </div>

                            <div className="flex-1">
                              <div className="flex items-center gap-2 mb-1">
                                <Badge variant="secondary">
                                  {getSectionTypeLabel(section.type)}
                                </Badge>
                                {!section.isActive && (
                                  <Badge variant="outline">Oculta</Badge>
                                )}
                              </div>
                              <p className="font-semibold">
                                {section.title || "Sin título"}
                              </p>
                              {section.subtitle && (
                                <p className="text-sm text-muted-foreground">
                                  {section.subtitle}
                                </p>
                              )}
                            </div>

                            <div className="flex items-center gap-2">
                              <Button
                                variant="ghost"
                                size="icon"
                                onClick={() =>
                                  toggleActive(section.id, section.isActive)
                                }
                              >
                                {section.isActive ? (
                                  <Eye className="h-4 w-4" />
                                ) : (
                                  <EyeOff className="h-4 w-4" />
                                )}
                              </Button>
                              <Button
                                variant="ghost"
                                size="icon"
                                onClick={() => openEditDialog(section)}
                              >
                                <Pencil className="h-4 w-4" />
                              </Button>
                              <Button
                                variant="ghost"
                                size="icon"
                                onClick={() => deleteSection(section.id)}
                              >
                                <Trash2 className="h-4 w-4" />
                              </Button>
                            </div>
                          </div>
                        )}
                      </Draggable>
                    ))}
                    {provided.placeholder}
                  </div>
                )}
              </Droppable>
            </DragDropContext>

            {sections.length === 0 && (
              <div className="text-center py-12">
                <p className="text-muted-foreground mb-4">
                  No hay secciones configuradas
                </p>
                <Button variant="outline" onClick={openCreateDialog}>
                  <Plus className="h-4 w-4 mr-2" />
                  Crear primera sección
                </Button>
              </div>
            )}
          </CardContent>
        </Card>

        <SectionDialog
          open={isDialogOpen}
          onOpenChange={setIsDialogOpen}
          section={editingSection}
          onSave={handleSaveSection}
        />
    </div>
  );
}
