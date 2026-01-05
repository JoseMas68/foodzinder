"use client";

import dynamic from "next/dynamic";
import type { MapRestaurant } from "@/components/features/map";

const RestaurantMapComponent = dynamic(
  () => import("@/components/features/map").then((mod) => ({ default: mod.RestaurantMap })),
  {
    ssr: false,
    loading: () => (
      <div className="w-full h-96 bg-muted rounded-lg animate-pulse flex items-center justify-center">
        <p className="text-muted-foreground">Cargando mapa...</p>
      </div>
    ),
  }
);

interface RestaurantMapWrapperProps {
  restaurants: MapRestaurant[];
}

export function RestaurantMapWrapper({ restaurants }: RestaurantMapWrapperProps) {
  return <RestaurantMapComponent restaurants={restaurants} />;
}
