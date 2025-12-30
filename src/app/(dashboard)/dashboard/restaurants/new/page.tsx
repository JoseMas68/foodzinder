import { RestaurantForm } from "@/components/features/restaurant-form";
import { ChevronLeft } from "lucide-react";
import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function NewRestaurantPage() {
    return (
        <div className="max-w-3xl mx-auto space-y-6">
            <div className="flex items-center gap-4">
                <Link href="/dashboard/restaurants">
                    <Button variant="outline" size="icon">
                        <ChevronLeft className="h-4 w-4" />
                    </Button>
                </Link>
                <div>
                    <h1 className="text-3xl font-bold tracking-tight">Nuevo Restaurante</h1>
                    <p className="text-muted-foreground">
                        Completa la información para registrar tu establecimiento.
                    </p>
                </div>
            </div>

            <RestaurantForm />
        </div>
    );
}
