"use client";

import { LayoutGrid, Map as MapIcon } from "lucide-react";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";
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
        <Tabs value={currentView} onValueChange={handleViewChange} className="w-auto">
            <TabsList className="grid w-32 grid-cols-2 bg-gray-100/50 p-1">
                <TabsTrigger
                    value="list"
                    className="data-[state=active]:bg-white data-[state=active]:text-primary data-[state=active]:shadow-sm rounded-md transition-all"
                >
                    <LayoutGrid className="h-4 w-4" />
                </TabsTrigger>
                <TabsTrigger
                    value="map"
                    className="data-[state=active]:bg-white data-[state=active]:text-primary data-[state=active]:shadow-sm rounded-md transition-all"
                >
                    <MapIcon className="h-4 w-4" />
                </TabsTrigger>
            </TabsList>
        </Tabs>
    );
}
