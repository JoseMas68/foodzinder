import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";

export default function SettingsPage() {
    return (
        <div className="space-y-6">
            <div>
                <h1 className="text-3xl font-bold tracking-tight">Configuración</h1>
                <p className="text-muted-foreground">
                    Gestiona las preferencias de tu cuenta y notificaciones.
                </p>
            </div>

            <Card className="border-dashed">
                <CardHeader>
                    <CardTitle>Próximamente</CardTitle>
                    <CardDescription>
                        Estamos trabajando en esta sección para ofrecerte más opciones de personalización.
                    </CardDescription>
                </CardHeader>
                <CardContent className="h-40 flex items-center justify-center text-muted-foreground italic">
                    Funcionalidad en desarrollo...
                </CardContent>
            </Card>
        </div>
    );
}
