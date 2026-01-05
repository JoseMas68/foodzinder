import { redirect } from "next/navigation";
import { getCurrentUser } from "@/lib/auth/roles";
import { getEmailTemplates } from "@/server/actions/email-templates";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { Mail, Edit, Eye } from "lucide-react";

export default async function EmailTemplatesPage() {
  const user = await getCurrentUser();

  if (!user || user.role !== "ADMIN") {
    redirect("/dashboard");
  }

  const result = await getEmailTemplates();

  if (!result.success) {
    return (
      <div className="space-y-6">
        <h1 className="text-3xl font-heading font-bold">Plantillas de Email</h1>
        <Card>
          <CardContent className="p-12 text-center text-gray-500">
            Error al cargar plantillas: {result.error}
          </CardContent>
        </Card>
      </div>
    );
  }

  const templates = result.data || [];

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

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-heading font-bold">Plantillas de Email</h1>
        <p className="text-gray-500 mt-1">
          Gestiona y personaliza las plantillas de email que se envían automáticamente
        </p>
      </div>

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
                  <Link href={`/dashboard/admin/email-templates/${template.id}/edit`}>
                    <Edit className="h-4 w-4 mr-2" />
                    Editar
                  </Link>
                </Button>
                <Button asChild variant="outline" size="sm">
                  <Link href={`/dashboard/admin/email-templates/${template.id}/preview`}>
                    <Eye className="h-4 w-4" />
                  </Link>
                </Button>
              </div>

              <div className="mt-4 pt-4 border-t">
                <p className="text-xs text-gray-500">
                  <strong>Asunto:</strong> {template.subject}
                </p>
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
              Ejecuta el seed para crear las plantillas por defecto
            </p>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
