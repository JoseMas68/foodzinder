import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { UserProfile } from "@clerk/nextjs";

export default function ProfilePage() {
    return (
        <div className="space-y-6">
            <div>
                <h1 className="text-3xl font-bold tracking-tight">Mi Perfil</h1>
                <p className="text-muted-foreground">
                    Gestiona tu información personal y seguridad.
                </p>
            </div>

            <div className="flex justify-center xl:justify-start">
                <UserProfile routing="hash" />
            </div>
        </div>
    );
}
