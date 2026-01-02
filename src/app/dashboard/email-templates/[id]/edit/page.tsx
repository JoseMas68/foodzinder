"use client";

import { use, useState, useEffect } from "react";
import { useRouter } from "next/navigation";
import { EmailTemplateEditor } from "@/components/email-templates/email-editor";
import { updateEmailTemplate } from "@/server/actions/email-templates";
import { toast } from "sonner";
import { Button } from "@/components/ui/button";
import { ArrowLeft } from "lucide-react";
import Link from "next/link";

interface PageProps {
  params: Promise<{
    id: string;
  }>;
}

export default function EditEmailTemplatePage({ params }: PageProps) {
  const resolvedParams = use(params);
  const router = useRouter();
  const [template, setTemplate] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetchTemplate();
  }, [resolvedParams.id]);

  const fetchTemplate = async () => {
    try {
      const response = await fetch(`/api/email-templates/${resolvedParams.id}`);
      if (response.ok) {
        const data = await response.json();
        setTemplate(data);
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

  const handleSave = async (html: string, design: any) => {
    try {
      const result = await updateEmailTemplate(resolvedParams.id, {
        htmlContent: html,
      });

      if (result.success) {
        toast.success("Plantilla guardada correctamente");
        router.push("/dashboard/email-templates");
      } else {
        toast.error(result.error || "Error al guardar la plantilla");
      }
    } catch (error) {
      console.error("Error saving template:", error);
      toast.error("Error al guardar la plantilla");
    }
  };

  if (loading) {
    return (
      <div className="flex items-center justify-center h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
          <p className="text-gray-500">Cargando editor...</p>
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

  // Intentar parsear el diseño guardado (si existe)
  let initialDesign = null;
  try {
    // Si guardamos el diseño en un campo separado, lo usaríamos aquí
    // Por ahora, iniciamos con diseño vacío
    initialDesign = null;
  } catch (e) {
    console.error("Error parsing design:", e);
  }

  return (
    <div className="h-screen flex flex-col">
      <EmailTemplateEditor
        templateName={template.name}
        initialDesign={initialDesign}
        onSave={handleSave}
      />
    </div>
  );
}
