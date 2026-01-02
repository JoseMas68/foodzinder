"use client";

import { use, useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { ArrowLeft } from "lucide-react";
import Link from "next/link";
import { toast } from "sonner";
import { replaceTemplateVariables } from "@/lib/email/template-utils";

interface PageProps {
  params: Promise<{
    id: string;
  }>;
}

// Datos de ejemplo para la vista previa
const EXAMPLE_DATA = {
  customerName: "Juan Pérez García",
  restaurantName: "Restaurante La Rosa Mediterránea",
  restaurantAddress: "Calle Mayor 123, 28013 Madrid, España",
  date: "Viernes, 15 de marzo de 2026",
  time: "20:30",
  partySize: "4",
  tableNumber: "12",
  tableArea: "Terraza Exterior",
  specialNotes: "Celebración de cumpleaños. Alergia a los frutos secos.",
};

export default function PreviewEmailTemplatePage({ params }: PageProps) {
  const resolvedParams = use(params);
  const [template, setTemplate] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [previewHtml, setPreviewHtml] = useState("");

  useEffect(() => {
    fetchTemplate();
  }, [resolvedParams.id]);

  const fetchTemplate = async () => {
    try {
      const response = await fetch(`/api/email-templates/${resolvedParams.id}`);
      if (response.ok) {
        const data = await response.json();
        setTemplate(data);

        // Generar HTML de vista previa con datos de ejemplo
        const html = replaceTemplateVariables(data.htmlContent, EXAMPLE_DATA);
        setPreviewHtml(html);
      } else {
        toast.error("Error al cargar la plantilla");
      }
    } catch (error) {
      console.error("Error fetching template:", error);
      toast.error("Error al cargar la plantilla");
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
          <p className="text-gray-500">Cargando vista previa...</p>
        </div>
      </div>
    );
  }

  if (!template) {
    return (
      <div className="flex items-center justify-center h-screen">
        <div className="text-center">
          <p className="text-gray-500 mb-4">Plantilla no encontrada</p>
          <Button asChild>
            <Link href="/dashboard/email-templates">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Volver
            </Link>
          </Button>
        </div>
      </div>
    );
  }

  return (
    <div className="h-screen flex flex-col bg-gray-50">
      {/* Header */}
      <div className="bg-white border-b px-6 py-4 flex items-center justify-between">
        <div className="flex items-center gap-4">
          <Button asChild variant="ghost" size="sm">
            <Link href="/dashboard/email-templates">
              <ArrowLeft className="h-4 w-4 mr-2" />
              Volver
            </Link>
          </Button>
          <div>
            <h1 className="text-xl font-semibold">{template.name}</h1>
            <p className="text-sm text-gray-500">Vista Previa con Datos de Ejemplo</p>
          </div>
        </div>
        <div className="flex gap-2">
          <Button asChild size="sm">
            <Link href={`/dashboard/email-templates/${template.id}/edit`}>
              Editar Plantilla
            </Link>
          </Button>
        </div>
      </div>

      {/* Preview Container */}
      <div className="flex-1 overflow-auto p-6">
        <div className="max-w-3xl mx-auto">
          {/* Info Banner */}
          <div className="bg-blue-50 border-l-4 border-blue-400 p-4 mb-6">
            <p className="text-sm text-blue-800">
              <strong>💡 Nota:</strong> Esta es una vista previa con datos de ejemplo.
              Los datos reales se insertarán automáticamente al enviar los emails.
            </p>
          </div>

          {/* Email Subject */}
          <div className="bg-white rounded-lg shadow-sm border p-4 mb-4">
            <p className="text-xs text-gray-500 font-semibold uppercase mb-1">Asunto</p>
            <p className="text-base font-medium">
              {replaceTemplateVariables(template.subject, EXAMPLE_DATA)}
            </p>
          </div>

          {/* Email Content */}
          <div className="bg-white rounded-lg shadow-sm border overflow-hidden">
            <iframe
              srcDoc={previewHtml}
              className="w-full border-0"
              style={{ height: "calc(100vh - 400px)", minHeight: "500px" }}
              title="Email Preview"
            />
          </div>
        </div>
      </div>
    </div>
  );
}
