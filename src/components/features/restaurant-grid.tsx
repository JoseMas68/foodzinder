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
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
        {Array.from({ length: 6 }).map((_, index) => (
          <div key={index} className="space-y-4">
            <Skeleton className="w-full h-40" />

            <div className="space-y-2 px-3">
              <Skeleton className="h-4 w-3/4" />
              <Skeleton className="h-3 w-1/2" />
              <Skeleton className="h-3 w-full" />
              <Skeleton className="h-3 w-5/6" />
            </div>
          </div>
        ))}
      </div>
    );
  }

  if (restaurants.length === 0) {
    return (
      <div className="flex items-center justify-center min-h-[300px]">
        <div className="text-center">
          <p className="text-lg font-semibold text-gray-900 mb-2">
            {emptyMessage}
          </p>
          <p className="text-sm text-gray-600">
            Try adjusting your filters or search query
          </p>
        </div>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
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
