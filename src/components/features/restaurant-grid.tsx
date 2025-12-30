import React from "react";
import { Skeleton } from "@/components/ui/skeleton";
import { RestaurantCard } from "./restaurant-card";
import { Restaurant } from "@/types";

interface RestaurantGridProps {
  restaurants: Restaurant[];
  isLoading?: boolean;
  emptyMessage?: string;
}

const RestaurantGridComponent = ({
  restaurants,
  isLoading = false,
  emptyMessage = "No restaurants found",
}: RestaurantGridProps) => {
  if (isLoading) {
    return (
      <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
        {Array.from({ length: 6 }).map((_, index) => (
          <div key={index} className="space-y-4 bg-white p-4 rounded-[2.5rem] border border-gray-100">
            <Skeleton className="w-full h-48 rounded-2xl" />
            <div className="space-y-3 px-2">
              <Skeleton className="h-6 w-3/4 rounded-md" />
              <Skeleton className="h-4 w-1/2 rounded-md" />
              <Skeleton className="h-4 w-full rounded-md" />
            </div>
          </div>
        ))}
      </div>
    );
  }

  if (restaurants.length === 0) {
    return (
      <div className="flex flex-col items-center justify-center min-h-[400px] bg-white rounded-[2.5rem] border border-dashed border-gray-200 p-12">
        <div className="text-center">
          <p className="text-xl font-heading font-bold text-gray-900 mb-2">
            {emptyMessage}
          </p>
          <p className="text-sm text-gray-500 max-w-xs mx-auto">
            Prueba a ajustar tus filtros o busca algo diferente para encontrar lo que buscas.
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">
      {restaurants.map((restaurant) => (
        <RestaurantCard
          key={restaurant.id}
          restaurant={restaurant}
        />
      ))}
    </div>
  );
};

export const RestaurantGrid = React.memo(RestaurantGridComponent);
