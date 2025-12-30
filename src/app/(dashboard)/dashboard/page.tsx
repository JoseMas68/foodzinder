import { getCurrentUser } from "@/server/actions/auth";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Utensils, Star, ThumbsUp, TrendingUp } from "lucide-react";

export default async function DashboardPage() {
    const user = await getCurrentUser();

    const stats = [
        {
            title: "Mis Restaurantes",
            value: "0", // Estos valores se cargarán dinámicamente luego
            description: "Restaurantes activos",
            icon: Utensils,
            color: "text-blue-600",
        },
        {
            title: "Reseñas Totales",
            value: "0",
            description: "Valoraciones de clientes",
            icon: Star,
            color: "text-yellow-600",
        },
        {
            title: "Favoritos",
            value: "0",
            description: "Usuarios que te siguen",
            icon: ThumbsUp,
            color: "text-pink-600",
        },
        {
            title: "Visitas",
            value: "0",
            description: "En los últimos 30 días",
            icon: TrendingUp,
            color: "text-green-600",
        },
    ];

    return (
        <div className="space-y-8">
            <div>
                <h1 className="text-3xl font-bold tracking-tight">Bienvenido, {user?.firstName} 👋</h1>
                <p className="text-muted-foreground text-lg mt-2">
                    Desde aquí puedes gestionar tus restaurantes, menús y ver el rendimiento de tu negocio.
                </p>
            </div>

            {/* Stats Grid */}
            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
                {stats.map((stat) => (
                    <Card key={stat.title}>
                        <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
                            <CardTitle className="text-sm font-medium">
                                {stat.title}
                            </CardTitle>
                            <stat.icon className={`h-4 w-4 ${stat.color}`} />
                        </CardHeader>
                        <CardContent>
                            <div className="text-2xl font-bold">{stat.value}</div>
                            <p className="text-xs text-muted-foreground">
                                {stat.description}
                            </p>
                        </CardContent>
                    </Card>
                ))}
            </div>

            <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-7">
                <Card className="col-span-4">
                    <CardHeader>
                        <CardTitle>Actividad Reciente</CardTitle>
                        <CardDescription>
                            Resumen de los últimos eventos en tus restaurantes.
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <div className="flex flex-col items-center justify-center py-10 text-center">
                            <div className="bg-muted rounded-full p-4 mb-4">
                                <TrendingUp className="h-8 w-8 text-muted-foreground" />
                            </div>
                            <p className="text-muted-foreground">No hay actividad reciente para mostrar.</p>
                        </div>
                    </CardContent>
                </Card>

                <Card className="col-span-3">
                    <CardHeader>
                        <CardTitle>Accesos Rápidos</CardTitle>
                        <CardDescription>Acciones frecuentes que podrías necesitar.</CardDescription>
                    </CardHeader>
                    <CardContent className="space-y-4">
                        <div className="space-y-2">
                            {/* Aquí links a "Crear Restaurante", "Añadir Plato", etc. */}
                            <p className="text-sm">Configurando accesos rápidos...</p>
                        </div>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}
