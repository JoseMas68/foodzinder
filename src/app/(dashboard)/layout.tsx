import { redirect } from "next/navigation";
import { auth } from "@clerk/nextjs/server";
import { Sidebar } from "@/components/dashboard/sidebar";
import { getCurrentUser } from "@/server/actions/auth";

export default async function DashboardLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const { userId } = await auth();

    if (!userId) {
        redirect("/sign-in");
    }

    const user = await getCurrentUser();

    if (!user) {
        // Si no está en nuestra DB, algo falló en el sync, pero por ahora permitimos
        // o podríamos redirigir a una página de "completar perfil"
    }

    return (
        <div className="flex h-screen overflow-hidden bg-background">
            {/* Sidebar - Desktop */}
            <Sidebar
                role={user?.role || "USER"}
                className="hidden md:flex flex-shrink-0"
            />

            {/* Main Content */}
            <main className="flex-1 flex flex-col min-w-0 overflow-hidden">
                {/* Header - Mobile could go here */}
                <div className="flex-1 overflow-y-auto p-4 md:p-8">
                    <div className="container mx-auto max-w-6xl">
                        {children}
                    </div>
                </div>
            </main>
        </div>
    );
}
