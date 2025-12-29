
"use client";

import { useState, useCallback } from "react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Badge } from "@/components/ui/badge";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Separator } from "@/components/ui/separator";
import { Label } from "@/components/ui/label";

interface RestaurantFilters {
  priceRange?: ("CHEAP" | "MODERATE" | "EXPENSIVE" | "LUXURY")[];
  cuisineTypes?: string[];
  minRating?: number;
}

interface FilterBarProps {
  onFilterChange: (filters: RestaurantFilters) => void;
  taxonomies?: Array<{ id: string; name: string }>;
}

export function FilterBar({
  onFilterChange,
  taxonomies = [],
}: FilterBarProps) {
  const [filters, setFilters] = useState<RestaurantFilters>({
    priceRange: [],
    cuisineTypes: [],
    minRating: undefined,
  });

  const handlePriceRangeChange = useCallback(
    (priceRange: "CHEAP" | "MODERATE" | "EXPENSIVE" | "LUXURY") => {
      setFilters((prev) => {
        const currentPrices = prev.priceRange || [];
        const newPrices = currentPrices.includes(priceRange)
          ? currentPrices.filter((p) => p !== priceRange)
          : [...currentPrices, priceRange];

        const updatedFilters = {
          ...prev,
          priceRange: newPrices.length > 0 ? newPrices : undefined,
        };

        onFilterChange(updatedFilters);
        return updatedFilters;
      });
    },
    [onFilterChange]
  );

  const handleCuisineChange = useCallback(
    (cuisineId: string) => {
      setFilters((prev) => {
        const currentCuisines = prev.cuisineTypes || [];
        const newCuisines = currentCuisines.includes(cuisineId)
          ? currentCuisines.filter((c) => c !== cuisineId)
          : [...currentCuisines, cuisineId];

        const updatedFilters = {
          ...prev,
          cuisineTypes: newCuisines.length > 0 ? newCuisines : undefined,
        };

        onFilterChange(updatedFilters);
        return updatedFilters;
      });
    },
    [onFilterChange]
  );

  const handleRatingChange = useCallback(
    (rating: number) => {
      setFilters((prev) => {
        const updatedFilters = {
          ...prev,
          minRating: prev.minRating === rating ? undefined : rating,
        };

        onFilterChange(updatedFilters);
        return updatedFilters;
      });
    },
    [onFilterChange]
  );

  const handleReset = useCallback(() => {
    const resetFilters: RestaurantFilters = {
      priceRange: undefined,
      cuisineTypes: undefined,
      minRating: undefined,
    };

    setFilters(resetFilters);
    onFilterChange(resetFilters);
  }, [onFilterChange]);

  const activeFilterCount =
    (filters.priceRange?.length || 0) +
    (filters.cuisineTypes?.length || 0) +
    (filters.minRating ? 1 : 0);

  const priceRanges: Array<"CHEAP" | "MODERATE" | "EXPENSIVE" | "LUXURY"> = [
    "CHEAP",
    "MODERATE",
    "EXPENSIVE",
    "LUXURY",
  ];

  return (
    <div className="flex items-center gap-2 flex-wrap">
      <Popover>
        <PopoverTrigger asChild>
          <Button
            variant="outline"
            size="sm"
            className="gap-2"
          >
            Price Range
            {filters.priceRange && filters.priceRange.length > 0 && (
              <Badge variant="secondary" className="ml-2">
                {filters.priceRange.length}
              </Badge>
            )}
          </Button>
        </PopoverTrigger>
        <PopoverContent className="w-48">
          <div className="space-y-3">
            <h4 className="text-sm font-semibold text-gray-900">
              Price Range
            </h4>

            {priceRanges.map((priceRange) => (
              <div key={priceRange} className="flex items-center gap-2">
                <Checkbox
                  id={`price-` + priceRange}
                  checked={filters.priceRange?.includes(priceRange) || false}
                  onCheckedChange={() => handlePriceRangeChange(priceRange)}
                />
                <Label
                  htmlFor={`price-` + priceRange}
                  className="text-sm font-normal cursor-pointer"
                >
                  {priceRange.charAt(0).toUpperCase() +
                    priceRange.slice(1).toLowerCase()}
                </Label>
              </div>
            ))}
          </div>
        </PopoverContent>
      </Popover>

      {taxonomies.length > 0 && (
        <Popover>
          <PopoverTrigger asChild>
            <Button
              variant="outline"
              size="sm"
              className="gap-2"
            >
              Cuisine Type
              {filters.cuisineTypes && filters.cuisineTypes.length > 0 && (
                <Badge variant="secondary" className="ml-2">
                  {filters.cuisineTypes.length}
                </Badge>
              )}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-48">
            <div className="space-y-3">
              <h4 className="text-sm font-semibold text-gray-900">
                Cuisine Types
              </h4>

              <div className="space-y-2 max-h-48 overflow-y-auto">
                {taxonomies.map((taxonomy) => (
                  <div
                    key={taxonomy.id}
                    className="flex items-center gap-2"
                  >
                    <Checkbox
                      id={`cuisine-` + taxonomy.id}
                      checked={
                        filters.cuisineTypes?.includes(taxonomy.id) || false
                      }
                      onCheckedChange={() =>
                        handleCuisineChange(taxonomy.id)
                      }
                    />
                    <Label
                      htmlFor={`cuisine-` + taxonomy.id}
                      className="text-sm font-normal cursor-pointer"
                    >
                      {taxonomy.name}
                    </Label>
                  </div>
                ))}
              </div>
            </div>
          </PopoverContent>
        </Popover>
      )}

      <Popover>
        <PopoverTrigger asChild>
          <Button
            variant="outline"
            size="sm"
            className="gap-2"
          >
            Min Rating
            {filters.minRating && (
              <Badge variant="secondary" className="ml-2">
                {filters.minRating}+
              </Badge>
            )}
          </Button>
        </PopoverTrigger>
        <PopoverContent className="w-48">
          <div className="space-y-3">
            <h4 className="text-sm font-semibold text-gray-900">
              Minimum Rating
            </h4>

            <div className="flex gap-2">
              {[1, 2, 3, 4, 5].map((rating) => (
                <Button
                  key={rating}
                  variant={
                    filters.minRating === rating ? "default" : "outline"
                  }
                  size="sm"
                  onClick={() => handleRatingChange(rating)}
                  className="w-8 h-8 p-0"
                >
                  {rating}
                </Button>
              ))}
            </div>

            {filters.minRating && (
              <Button
                variant="ghost"
                size="sm"
                onClick={() => handleRatingChange(filters.minRating!)}
                className="w-full text-xs"
              >
                Clear
              </Button>
            )}
          </div>
        </PopoverContent>
      </Popover>

      {activeFilterCount > 0 && <Separator orientation="vertical" className="h-6" />}

      {activeFilterCount > 0 && (
        <Button
          variant="ghost"
          size="sm"
          onClick={handleReset}
          className="text-xs"
        >
          Reset Filters
        </Button>
      )}

      {activeFilterCount > 0 && (
        <Badge variant="outline" className="bg-blue-50">
          {activeFilterCount} filter{activeFilterCount > 1 ? "s" : ""} active
        </Badge>
      )}
    </div>
  );
}
