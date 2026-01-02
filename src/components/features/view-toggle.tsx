"use client";

import { LayoutGrid, Map as MapIcon } from "lucide-react";
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
        <div className="relative inline-flex items-center bg-gray-200 dark:bg-gray-800 rounded-full p-1 h-10">
            {/* Sliding background indicator */}
            <div
                className={`absolute top-1 bottom-1 left-1 right-1 w-[calc(50%-4px)] bg-primary rounded-full shadow-md transition-all duration-300 ease-in-out ${
                    currentView === "map" ? "translate-x-full" : "translate-x-0"
                }`}
            />

            {/* List button */}
            <button
                onClick={() => handleViewChange("list")}
                className={`relative z-10 flex-1 inline-flex items-center justify-center gap-1.5 px-6 py-1.5 text-sm font-medium rounded-full transition-colors ${
                    currentView === "list"
                        ? "text-white"
                        : "text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-300"
                }`}
            >
                <LayoutGrid className="h-4 w-4" />
                <span>Lista</span>
            </button>

            {/* Map button */}
            <button
                onClick={() => handleViewChange("map")}
                className={`relative z-10 flex-1 inline-flex items-center justify-center gap-1.5 px-6 py-1.5 text-sm font-medium rounded-full transition-colors ${
                    currentView === "map"
                        ? "text-white"
                        : "text-gray-600 dark:text-gray-400 hover:text-gray-800 dark:hover:text-gray-300"
                }`}
            >
                <MapIcon className="h-4 w-4" />
                <span>Mapa</span>
            </button>
        </div>
    );
}
