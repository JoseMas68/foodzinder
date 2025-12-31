"use client";

import { LayoutGrid, Map as MapIcon } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useRouter, useSearchParams } from "next/navigation";

export function ViewToggle() {
    const router = useRouter();
    const searchParams = useSearchParams();
    const currentView = searchParams.get("view") || "list";

    const handleViewChange = (view: string) => {
        const params = new URLSearchParams(searchParams);
        params.set("view", view);
        router.push(`?${params.toString()}`, { scroll: false });
    };

    return (
        <div className="relative inline-flex items-center bg-muted rounded-full p-1 w-[200px]">
            {/* Sliding background */}
            <div
                className={`absolute top-1 bottom-1 w-[calc(50%-4px)] bg-background rounded-full shadow-sm transition-transform duration-300 ease-in-out ${
                    currentView === "map" ? "translate-x-[calc(100%+8px)]" : "translate-x-0"
                }`}
            />

            {/* List button */}
            <button
                onClick={() => handleViewChange("list")}
                className={`relative z-10 flex-1 inline-flex items-center justify-center gap-1.5 py-1.5 text-sm font-medium rounded-full transition-colors ${
                    currentView === "list"
                        ? "text-foreground"
                        : "text-muted-foreground hover:text-foreground"
                }`}
            >
                <LayoutGrid className="h-4 w-4" />
                Lista
            </button>

            {/* Map button */}
            <button
                onClick={() => handleViewChange("map")}
                className={`relative z-10 flex-1 inline-flex items-center justify-center gap-1.5 py-1.5 text-sm font-medium rounded-full transition-colors ${
                    currentView === "map"
                        ? "text-foreground"
                        : "text-muted-foreground hover:text-foreground"
                }`}
            >
                <MapIcon className="h-4 w-4" />
                Mapa
            </button>
        </div>
    );
}
