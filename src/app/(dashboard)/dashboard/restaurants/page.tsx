import Link from "next/link";
import { Plus, MapPin, MoreHorizontal, ExternalLink, Edit, Trash2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import {
    Card,
    CardContent,
    CardDescription,
    CardFooter,
    CardHeader,
    CardTitle
} from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger
} from "@/components/ui/dropdown-menu";
import { getCurrentUser } from "@/server/actions/auth";
import { getMyRestaurants } from "@/server/queries/restaurants";

export default async function MyRestaurantsPage() {
    const user = await getCurrentUser();
    const restaurants = user ? await getMyRestaurants(user.id) : [];

    const statusColors = {
        PENDING: "bg-yellow-500",
        APPROVED: "bg-green-500",
        REJECTED: "bg-red-500",
        ARCHIVED: "bg-gray-500",
    };

    const statusLabels = {
        PENDING: "Pendiente",
        APPROVED: "Aprobado",
        REJECTED: "Rechazado",
        ARCHIVED: "Archivado",
    };

    return (
        <div className="space-y-6">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Mis Restaurantes</h1>
                    <p className="text-muted-foreground mt-1">
                        Gestiona los restaurantes que has registrado en la plataforma.
                    </p>
                </div>
                <Link href="/dashboard/restaurants/new">
                    <Button className="w-full md:w-auto">
                        <Plus className="mr-2 h-4 w-4" />
                        Registrar Restaurante
                    </Button>
                </Link>
            </div>

            {restaurants.length === 0 ? (
                <Card className="flex flex-col items-center justify-center p-12 text-center border-dashed">
                    <div className="bg-muted rounded-full p-4 mb-4">
                        <Utensils className="h-10 w-10 text-muted-foreground" />
                    </div>
                    <CardTitle className="text-xl mb-2">Aún no tienes restaurantes</CardTitle>
                    <CardDescription className="max-w-xs mb-6">
                        Registra tu primer restaurante para empezar a atraer clientes con el Wow Effect.
                    </CardDescription>
                    <Link href="/dashboard/restaurants/new">
                        <Button>Empezar ahora</Button>
                    </Link>
                </Card>
            ) : (
                <div className="grid gap-6 md:grid-cols-2 lg:grid-cols-3">
                    {restaurants.map((restaurant) => (
                        <Card key={restaurant.id} className="overflow-hidden group">
                            <div className="aspect-video relative overflow-hidden bg-muted">
                                {restaurant.coverUrl ? (
                                    <img
                                        src={restaurant.coverUrl}
                                        alt={restaurant.name}
                                        className="object-cover w-full h-full transition-transform group-hover:scale-105"
                                    />
                                ) : (
                                    <div className="flex items-center justify-center h-full">
                                        <Utensils className="h-10 w-10 text-muted-foreground/30" />
                                    </div>
                                )}
                                <div className="absolute top-2 right-2">
                                    <Badge className={`${statusColors[restaurant.status as keyof typeof statusColors]} text-white border-none shadow-sm`}>
                                        {statusLabels[restaurant.status as keyof typeof statusLabels]}
                                    </Badge>
                                </div>
                            </div>

                            <CardHeader className="pb-2">
                                <div className="flex items-start justify-between gap-2">
                                    <CardTitle className="text-xl line-clamp-1">{restaurant.name}</CardTitle>
                                    <DropdownMenu>
                                        <DropdownMenuTrigger asChild>
                                            <Button variant="ghost" className="h-8 w-8 p-0">
                                                <MoreHorizontal className="h-4 w-4" />
                                            </Button>
                                        </DropdownMenuTrigger>
                                        <DropdownMenuContent align="end">
                                            <DropdownMenuLabel>Acciones</DropdownMenuLabel>
                                            <DropdownMenuItem asChild>
                                                <Link href={`/dashboard/restaurants/${restaurant.id}`}>
                                                    <Edit className="mr-2 h-4 w-4" />
                                                    Editar detalles
                                                </Link>
                                            </DropdownMenuItem>
                                            <DropdownMenuItem asChild>
                                                <Link href={`/restaurants/${restaurant.slug}`} target="_blank">
                                                    <ExternalLink className="mr-2 h-4 w-4" />
                                                    Ver página pública
                                                </Link>
                                            </DropdownMenuItem>
                                            <DropdownMenuSeparator />
                                            <DropdownMenuItem className="text-destructive">
                                                <Trash2 className="mr-2 h-4 w-4" />
                                                Eliminar
                                            </DropdownMenuItem>
                                        </DropdownMenuContent>
                                    </DropdownMenu>
                                </div>
                                <CardDescription className="flex items-center gap-1">
                                    <MapPin className="h-3 w-3" />
                                    <span className="truncate">{restaurant.address}</span>
                                </CardDescription>
                            </CardHeader>

                            <CardFooter className="pt-0 flex justify-between gap-2 mt-auto">
                                <Link href={`/dashboard/restaurants/${restaurant.id}/menu`} className="flex-1">
                                    <Button variant="outline" size="sm" className="w-full">
                                        Gestionar Carta
                                    </Button>
                                </Link>
                                <Link href={`/dashboard/restaurants/${restaurant.id}/analytics`}>
                                    <Button variant="ghost" size="sm">
                                        Estadísticas
                                    </Button>
                                </Link>
                            </CardFooter>
                        </Card>
                    ))}
                </div>
            )}
        </div>
    );
}

import { Utensils } from "lucide-react";
