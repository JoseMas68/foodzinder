"use client";

import { useRef, useEffect, useState } from "react";
import EmailEditor, { EditorRef, EmailEditorProps } from "react-email-editor";
import { Button } from "@/components/ui/button";
import { Save, Info, ChevronRight, Copy } from "lucide-react";
import { toast } from "sonner";
import {
  Sheet,
  SheetContent,
  SheetDescription,
  SheetHeader,
  SheetTitle,
  SheetTrigger,
} from "@/components/ui/sheet";

interface EmailTemplateEditorProps {
  initialDesign?: any;
  onSave?: (html: string, design: any) => void;
  templateName: string;
}

// Variables disponibles para todas las plantillas
const AVAILABLE_VARIABLES = [
  {
    name: "customerName",
    label: "Nombre del Cliente",
    description: "Nombre completo del cliente que hace la reserva",
    example: "Juan Pérez",
  },
  {
    name: "restaurantName",
    label: "Nombre del Restaurante",
    description: "Nombre del restaurante donde se hace la reserva",
    example: "Restaurante La Rosa",
  },
  {
    name: "restaurantAddress",
    label: "Dirección del Restaurante",
    description: "Dirección completa del restaurante",
    example: "Calle Mayor 123, Madrid",
  },
  {
    name: "date",
    label: "Fecha",
    description: "Fecha de la reserva (formato largo en español)",
    example: "Viernes, 15 de enero de 2026",
  },
  {
    name: "time",
    label: "Hora",
    description: "Hora de la reserva",
    example: "20:00",
  },
  {
    name: "partySize",
    label: "Número de Personas",
    description: "Cantidad de comensales",
    example: "4",
  },
  {
    name: "tableNumber",
    label: "Número de Mesa",
    description: "Número de mesa asignada (opcional)",
    example: "5",
  },
  {
    name: "tableArea",
    label: "Área de la Mesa",
    description: "Zona del restaurante donde está la mesa (opcional)",
    example: "Terraza",
  },
  {
    name: "specialNotes",
    label: "Notas Especiales",
    description: "Notas o solicitudes especiales del cliente (opcional)",
    example: "Alergia a los frutos secos",
  },
];

export function EmailTemplateEditor({
  initialDesign,
  onSave,
  templateName,
}: EmailTemplateEditorProps) {
  const emailEditorRef = useRef<EditorRef>(null);
  const [isVariablesOpen, setIsVariablesOpen] = useState(false);

  useEffect(() => {
    // Cargar diseño inicial si existe
    if (initialDesign && emailEditorRef.current) {
      emailEditorRef.current.editor?.loadDesign(initialDesign);
    }
  }, [initialDesign]);

  const exportHtml = () => {
    const editor = emailEditorRef.current?.editor;

    if (!editor) {
      toast.error("Editor no está listo");
      return;
    }

    editor.exportHtml((data) => {
      const { design, html } = data;

      if (onSave) {
        onSave(html, design);
      } else {
        // Download HTML
        const blob = new Blob([html], { type: "text/html" });
        const url = URL.createObjectURL(blob);
        const link = document.createElement("a");
        link.href = url;
        link.download = `${templateName}.html`;
        link.click();
        URL.revokeObjectURL(url);
        toast.success("HTML exportado correctamente");
      }
    });
  };

  const onLoad = () => {
    console.log("Editor loaded");

    const editor = emailEditorRef.current?.editor;
    if (editor && initialDesign) {
      editor.loadDesign(initialDesign);
    }
  };

  const onReady = () => {
    console.log("Editor ready");
  };

  const copyVariable = (varName: string) => {
    const text = `{{${varName}}}`;
    navigator.clipboard.writeText(text);
    toast.success(`Variable ${text} copiada al portapapeles`);
  };

  return (
    <div className="flex flex-col h-full">
      {/* Toolbar */}
      <div className="bg-white border-b px-4 py-3 flex items-center justify-between">
        <div>
          <h2 className="font-semibold text-lg">{templateName}</h2>
          <p className="text-sm text-gray-500">Editor de Plantilla</p>
        </div>
        <div className="flex gap-2">
          <Sheet open={isVariablesOpen} onOpenChange={setIsVariablesOpen}>
            <SheetTrigger asChild>
              <Button variant="outline" size="sm">
                <Info className="h-4 w-4 mr-2" />
                Variables Disponibles
              </Button>
            </SheetTrigger>
            <SheetContent className="overflow-y-auto">
              <SheetHeader>
                <SheetTitle>Variables Dinámicas</SheetTitle>
                <SheetDescription>
                  Usa estas variables en tu plantilla de email. Serán
                  reemplazadas automáticamente con datos reales al enviar el
                  correo.
                </SheetDescription>
              </SheetHeader>

              <div className="mt-6 space-y-4">
                {AVAILABLE_VARIABLES.map((variable) => (
                  <div
                    key={variable.name}
                    className="border rounded-lg p-4 hover:bg-gray-50 transition-colors"
                  >
                    <div className="flex items-start justify-between mb-2">
                      <div>
                        <h4 className="font-semibold text-sm">
                          {variable.label}
                        </h4>
                        <code className="text-xs bg-gray-100 px-2 py-1 rounded mt-1 inline-block text-primary">
                          {`{{${variable.name}}}`}
                        </code>
                      </div>
                      <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => copyVariable(variable.name)}
                        className="h-8 w-8 p-0"
                      >
                        <Copy className="h-4 w-4" />
                      </Button>
                    </div>
                    <p className="text-xs text-gray-600 mb-2">
                      {variable.description}
                    </p>
                    <div className="bg-blue-50 border-l-4 border-blue-400 p-2 mt-2">
                      <p className="text-xs text-gray-700">
                        <span className="font-semibold">Ejemplo:</span>{" "}
                        {variable.example}
                      </p>
                    </div>
                  </div>
                ))}

                <div className="border-t pt-4 mt-6">
                  <h4 className="font-semibold text-sm mb-2">
                    Condicionales (Datos Opcionales)
                  </h4>
                  <p className="text-xs text-gray-600 mb-3">
                    Para mostrar contenido solo si una variable existe:
                  </p>
                  <div className="bg-gray-100 p-3 rounded-md font-mono text-xs">
                    <div>{`{{#if tableNumber}}`}</div>
                    <div className="pl-4">{`Mesa: {{tableNumber}}`}</div>
                    <div>{`{{/if}}`}</div>
                  </div>
                </div>
              </div>
            </SheetContent>
          </Sheet>

          <Button onClick={exportHtml} size="sm">
            <Save className="h-4 w-4 mr-2" />
            Guardar
          </Button>
        </div>
      </div>

      {/* Editor */}
      <div className="flex-1">
        <EmailEditor
          ref={emailEditorRef}
          onLoad={onLoad}
          onReady={onReady}
          minHeight="calc(100vh - 200px)"
          options={{
            features: {
              userUploads: false,
            },
            appearance: {
              theme: "light",
              panels: {
                tools: {
                  dock: "left",
                },
              },
            },
            locale: "es-ES",
            tools: {
              image: {
                enabled: true,
              },
            },
            mergeTags: {
              customerName: {
                name: "Nombre del Cliente",
                value: "{{customerName}}",
              },
              restaurantName: {
                name: "Nombre del Restaurante",
                value: "{{restaurantName}}",
              },
              restaurantAddress: {
                name: "Dirección del Restaurante",
                value: "{{restaurantAddress}}",
              },
              date: {
                name: "Fecha",
                value: "{{date}}",
              },
              time: {
                name: "Hora",
                value: "{{time}}",
              },
              partySize: {
                name: "Número de Personas",
                value: "{{partySize}}",
              },
              tableNumber: {
                name: "Número de Mesa",
                value: "{{tableNumber}}",
              },
              tableArea: {
                name: "Área de la Mesa",
                value: "{{tableArea}}",
              },
              specialNotes: {
                name: "Notas Especiales",
                value: "{{specialNotes}}",
              },
            },
          }}
        />
      </div>
    </div>
  );
}
