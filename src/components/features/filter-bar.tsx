
"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Badge } from "@/components/ui/badge";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Separator } from "@/components/ui/separator";
import { Label } from "@/components/ui/label";
import { useRouter, useSearchParams } from "next/navigation";
import type { PriceRange } from "@/types";

interface FilterBarProps {
  taxonomies?: Array<{ id: string; name: string }>;
}

export function FilterBar({ taxonomies = [] }: FilterBarProps) {
  const router = useRouter();
  const searchParams = useSearchParams();

  // Initialize state from URL
  const [selectedPriceRange, setSelectedPriceRange] = useState<PriceRange[]>(
    (searchParams.get("priceRange")?.split(",") as PriceRange[]) || []
  );
  const [selectedCuisines, setSelectedCuisines] = useState<string[]>(
    searchParams.get("cuisineTypes")?.split(",") || []
  );
  const [selectedRating, setSelectedRating] = useState<number | null>(
    searchParams.get("minRating") ? Number(searchParams.get("minRating")) : null
  );

  const updateURL = () => {
    const params = new URLSearchParams(searchParams);

    if (selectedPriceRange.length > 0) {
      params.set("priceRange", selectedPriceRange.join(","));
    } else {
      params.delete("priceRange");
    }

    if (selectedCuisines.length > 0) {
      params.set("cuisineTypes", selectedCuisines.join(","));
    } else {
      params.delete("cuisineTypes");
    }

    if (selectedRating) {
      params.set("minRating", selectedRating.toString());
    } else {
      params.delete("minRating");
    }

    router.push(`/restaurants?${params.toString()}`);
  };

  // Update URL whenever filters change
  useEffect(() => {
    updateURL();
  }, [selectedPriceRange, selectedCuisines, selectedRating]);

  const handlePriceRangeChange = (priceRange: PriceRange) => {
    setSelectedPriceRange((prev) =>
      prev.includes(priceRange)
        ? prev.filter((p) => p !== priceRange)
        : [...prev, priceRange]
    );
  };

  const handleCuisineChange = (cuisineId: string) => {
    setSelectedCuisines((prev) =>
      prev.includes(cuisineId)
        ? prev.filter((c) => c !== cuisineId)
        : [...prev, cuisineId]
    );
  };

  const handleRatingChange = (rating: number) => {
    setSelectedRating((prev) => (prev === rating ? null : rating));
  };

  const handleReset = () => {
    setSelectedPriceRange([]);
    setSelectedCuisines([]);
    setSelectedRating(null);
  };

  const activeFilterCount =
    selectedPriceRange.length + selectedCuisines.length + (selectedRating ? 1 : 0);

  const priceRanges: PriceRange[] = [
    "CHEAP",
    "MODERATE",
    "EXPENSIVE",
    "LUXURY",
  ];

  const priceRangeLabel: Record<PriceRange, string> = {
    CHEAP: "$",
    MODERATE: "$$",
    EXPENSIVE: "$$$",
    LUXURY: "$$$$",
  };

  return (
    <div className="flex items-center gap-2 flex-wrap">
      <Popover>
        <PopoverTrigger asChild>
          <Button variant="outline" size="sm" className="gap-2">
            Price Range
            {selectedPriceRange.length > 0 && (
              <Badge variant="secondary" className="ml-2">
                {selectedPriceRange.length}
              </Badge>
            )}
          </Button>
        </PopoverTrigger>
        <PopoverContent className="w-48">
          <div className="space-y-3">
            <h4 className="text-sm font-semibold">Price Range</h4>
            {priceRanges.map((priceRange) => (
              <div key={priceRange} className="flex items-center gap-2">
                <Checkbox
                  id={`price-${priceRange}`}
                  checked={selectedPriceRange.includes(priceRange)}
                  onCheckedChange={() => handlePriceRangeChange(priceRange)}
                />
                <Label
                  htmlFor={`price-${priceRange}`}
                  className="text-sm font-normal cursor-pointer"
                >
                  {priceRangeLabel[priceRange]}
                </Label>
              </div>
            ))}
          </div>
        </PopoverContent>
      </Popover>

      {taxonomies.length > 0 && (
        <Popover>
          <PopoverTrigger asChild>
            <Button variant="outline" size="sm" className="gap-2">
              Cuisine Type
              {selectedCuisines.length > 0 && (
                <Badge variant="secondary" className="ml-2">
                  {selectedCuisines.length}
                </Badge>
              )}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-48">
            <div className="space-y-3">
              <h4 className="text-sm font-semibold">Cuisine Types</h4>
              <div className="space-y-2 max-h-48 overflow-y-auto">
                {taxonomies.map((taxonomy) => (
                  <div key={taxonomy.id} className="flex items-center gap-2">
                    <Checkbox
                      id={`cuisine-${taxonomy.id}`}
                      checked={selectedCuisines.includes(taxonomy.id)}
                      onCheckedChange={() => handleCuisineChange(taxonomy.id)}
                    />
                    <Label
                      htmlFor={`cuisine-${taxonomy.id}`}
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
          <Button variant="outline" size="sm" className="gap-2">
            Min Rating
            {selectedRating && (
              <Badge variant="secondary" className="ml-2">
                {selectedRating}+
              </Badge>
            )}
          </Button>
        </PopoverTrigger>
        <PopoverContent className="w-48">
          <div className="space-y-3">
            <h4 className="text-sm font-semibold">Minimum Rating</h4>
            <div className="flex gap-2">
              {[1, 2, 3, 4, 5].map((rating) => (
                <Button
                  key={rating}
                  variant={selectedRating === rating ? "default" : "outline"}
                  size="sm"
                  onClick={() => handleRatingChange(rating)}
                  className="w-8 h-8 p-0"
                >
                  {rating}
                </Button>
              ))}
            </div>
            {selectedRating && (
              <Button
                variant="ghost"
                size="sm"
                onClick={() => setSelectedRating(null)}
                className="w-full text-xs"
              >
                Clear
              </Button>
            )}
          </div>
        </PopoverContent>
      </Popover>

      {activeFilterCount > 0 && (
        <>
          <Separator orientation="vertical" className="h-6" />
          <Button
            variant="ghost"
            size="sm"
            onClick={handleReset}
            className="text-xs"
          >
            Reset Filters
          </Button>
          <Badge variant="outline" className="bg-blue-50">
            {activeFilterCount} filter{activeFilterCount > 1 ? "s" : ""} active
          </Badge>
        </>
      )}
    </div>
  );
}
