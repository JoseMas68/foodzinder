"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";
import { cn } from "@/lib/utils";
import {
    LayoutDashboard,
    Utensils,
    Menu as MenuIcon,
    ShieldCheck,
    Tags,
    UserCircle,
    ChevronLeft,
    Settings
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { UserButton } from "@/components/auth/clerk-buttons";

interface SidebarProps {
    role?: "ADMIN" | "OWNER" | "USER";
    className?: string;
}

export function Sidebar({ role = "USER", className }: SidebarProps) {
    const pathname = usePathname();

    const routes = [
        {
            label: "Dashboard",
            icon: LayoutDashboard,
            href: "/dashboard",
            active: pathname === "/dashboard",
        },
        {
            label: "Mis Restaurantes",
            icon: Utensils,
            href: "/dashboard/restaurants",
            active: pathname.startsWith("/dashboard/restaurants"),
            show: role === "OWNER" || role === "ADMIN",
        },
        {
            label: "Mis Menús",
            icon: MenuIcon,
            href: "/dashboard/menus",
            active: pathname.startsWith("/dashboard/menus"),
            show: role === "OWNER" || role === "ADMIN",
        },
        {
            label: "Aprobaciones",
            icon: ShieldCheck,
            href: "/dashboard/admin/approvals",
            active: pathname.startsWith("/dashboard/admin/approvals"),
            show: role === "ADMIN",
        },
        {
            label: "Taxonomías",
            icon: Tags,
            href: "/dashboard/admin/taxonomies",
            active: pathname.startsWith("/dashboard/admin/taxonomies"),
            show: role === "ADMIN",
        },
        {
            label: "Perfil",
            icon: UserCircle,
            href: "/dashboard/profile",
            active: pathname === "/dashboard/profile",
        },
        {
            label: "Configuración",
            icon: Settings,
            href: "/dashboard/settings",
            active: pathname === "/dashboard/settings",
        },
    ];

    return (
        <div className={cn("flex flex-col h-full bg-card border-r w-64 pt-6 pb-4", className)}>
            <div className="px-6 mb-8 flex items-center justify-between">
                <Link href="/" className="flex items-center gap-2">
                    <div className="w-8 h-8 rounded-full bg-primary flex items-center justify-center">
                        <Utensils className="w-5 h-5 text-primary-foreground" />
                    </div>
                    <span className="font-bold text-xl tracking-tight">Foodzinder</span>
                </Link>
            </div>

            <nav className="flex-1 px-3 space-y-1">
                {routes.map((route) => {
                    if (route.show === false) return null;

                    return (
                        <Link
                            key={route.href}
                            href={route.href}
                            className={cn(
                                "group flex items-center px-3 py-2 text-sm font-medium rounded-md transition-colors",
                                route.active
                                    ? "bg-primary text-primary-foreground"
                                    : "text-muted-foreground hover:bg-muted hover:text-foreground"
                            )}
                        >
                            <route.icon className={cn(
                                "mr-3 h-5 w-5 flex-shrink-0",
                                route.active ? "text-primary-foreground" : "text-muted-foreground group-hover:text-foreground"
                            )} />
                            {route.label}
                        </Link>
                    );
                })}
            </nav>

            <div className="px-3 pt-4 border-t space-y-4">
                <div className="flex items-center gap-3 px-3 py-2">
                    <UserButton afterSignOutUrl="/" />
                    <div className="flex flex-col overflow-hidden">
                        <span className="text-sm font-medium truncate">Mi Cuenta</span>
                        <span className="text-xs text-muted-foreground truncate">{role}</span>
                    </div>
                </div>

                <Link href="/">
                    <Button variant="ghost" className="w-full justify-start text-muted-foreground" size="sm">
                        <ChevronLeft className="mr-2 h-4 w-4" />
                        Volver a la Web
                    </Button>
                </Link>
            </div>
        </div>
    );
}
