"use client";

import dynamic from "next/dynamic";

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

import { Restaurant } from "@/types";

interface RestaurantMapWrapperProps {
  restaurants: Restaurant[];
}

export function RestaurantMapWrapper({ restaurants }: RestaurantMapWrapperProps) {
  return <RestaurantMapComponent restaurants={restaurants} />;
}
