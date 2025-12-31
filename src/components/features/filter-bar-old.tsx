
"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Badge } from "@/components/ui/badge";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Separator } from "@/components/ui/separator";
import { Label } from "@/components/ui/label";
import { useRouter, useSearchParams } from "next/navigation";
import { MapPin, Loader2 } from "lucide-react";
import type { PriceRange } from "@/types";

interface FilterBarProps {
  taxonomies?: Array<{ id: string; name: string }>;
  features?: Array<{ id: string; name: string }>;
  cities?: string[];
}

export function FilterBar({ taxonomies = [], features = [], cities = [] }: FilterBarProps) {
  const router = useRouter();
  const searchParams = useSearchParams();

  // Initialize state from URL
  const [selectedPriceRange, setSelectedPriceRange] = useState<PriceRange[]>(
    (searchParams.get("priceRange")?.split(",") as PriceRange[]) || []
  );
  const [selectedCuisines, setSelectedCuisines] = useState<string[]>(
    searchParams.get("cuisineTypes")?.split(",").filter(Boolean) || []
  );
  const [selectedFeatures, setSelectedFeatures] = useState<string[]>(
    searchParams.get("features")?.split(",").filter(Boolean) || []
  );
  const [selectedCity, setSelectedCity] = useState<string | null>(
    searchParams.get("city") || null
  );
  const [selectedRating, setSelectedRating] = useState<number | null>(
    searchParams.get("minRating") ? Number(searchParams.get("minRating")) : null
  );
  const [isLoadingLocation, setIsLoadingLocation] = useState(false);
  const [userLocation, setUserLocation] = useState<{ lat: number; lng: number } | null>(
    searchParams.get("lat") && searchParams.get("lng")
      ? { lat: Number(searchParams.get("lat")), lng: Number(searchParams.get("lng")) }
      : null
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

    if (selectedFeatures.length > 0) {
      params.set("features", selectedFeatures.join(","));
    } else {
      params.delete("features");
    }

    if (selectedCity) {
      params.set("city", selectedCity);
    } else {
      params.delete("city");
    }

    if (selectedRating) {
      params.set("minRating", selectedRating.toString());
    } else {
      params.delete("minRating");
    }

    if (userLocation) {
      params.set("lat", userLocation.lat.toString());
      params.set("lng", userLocation.lng.toString());
      params.set("sort", "distance");
    } else {
      params.delete("lat");
      params.delete("lng");
    }

    router.push(`?${params.toString()}`);
  };

  // Update URL whenever filters change
  useEffect(() => {
    updateURL();
  }, [selectedPriceRange, selectedCuisines, selectedFeatures, selectedCity, selectedRating, userLocation]);

  const handlePriceRangeChange = (priceRange: PriceRange) => {
    setSelectedPriceRange((prev) =>
      prev.includes(priceRange)
        ? prev.filter((p) => p !== priceRange)
        : [...prev, priceRange]
    );
  };

  const handleCuisineChange = (cuisineName: string) => {
    setSelectedCuisines((prev) =>
      prev.includes(cuisineName)
        ? prev.filter((c) => c !== cuisineName)
        : [...prev, cuisineName]
    );
  };

  const handleFeatureChange = (featureName: string) => {
    setSelectedFeatures((prev) =>
      prev.includes(featureName)
        ? prev.filter((f) => f !== featureName)
        : [...prev, featureName]
    );
  };

  const handleCityChange = (city: string) => {
    setSelectedCity((prev) => (prev === city ? null : city));
  };

  const handleRatingChange = (rating: number) => {
    setSelectedRating((prev) => (prev === rating ? null : rating));
  };

  const handleNearMe = () => {
    if (!navigator.geolocation) {
      alert("La geolocalización no está soportada en tu navegador");
      return;
    }

    setIsLoadingLocation(true);
    navigator.geolocation.getCurrentPosition(
      (position) => {
        setUserLocation({
          lat: position.coords.latitude,
          lng: position.coords.longitude,
        });
        setIsLoadingLocation(false);
      },
      (error) => {
        console.error("Error getting location:", error);
        alert("No se pudo obtener tu ubicación. Por favor, permite el acceso a tu ubicación.");
        setIsLoadingLocation(false);
      }
    );
  };

  const handleReset = () => {
    setSelectedPriceRange([]);
    setSelectedCuisines([]);
    setSelectedFeatures([]);
    setSelectedCity(null);
    setSelectedRating(null);
    setUserLocation(null);
  };

  const activeFilterCount =
    selectedPriceRange.length + selectedCuisines.length + selectedFeatures.length + (selectedCity ? 1 : 0) + (selectedRating ? 1 : 0) + (userLocation ? 1 : 0);

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
                      checked={selectedCuisines.includes(taxonomy.name)}
                      onCheckedChange={() => handleCuisineChange(taxonomy.name)}
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

      {features.length > 0 && (
        <Popover>
          <PopoverTrigger asChild>
            <Button variant="outline" size="sm" className="gap-2">
              Características
              {selectedFeatures.length > 0 && (
                <Badge variant="secondary" className="ml-2">
                  {selectedFeatures.length}
                </Badge>
              )}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-48">
            <div className="space-y-3">
              <h4 className="text-sm font-semibold">Características</h4>
              <div className="space-y-2 max-h-48 overflow-y-auto">
                {features.map((feature) => (
                  <div key={feature.id} className="flex items-center gap-2">
                    <Checkbox
                      id={`feature-${feature.id}`}
                      checked={selectedFeatures.includes(feature.name)}
                      onCheckedChange={() => handleFeatureChange(feature.name)}
                    />
                    <Label
                      htmlFor={`feature-${feature.id}`}
                      className="text-sm font-normal cursor-pointer"
                    >
                      {feature.name}
                    </Label>
                  </div>
                ))}
              </div>
            </div>
          </PopoverContent>
        </Popover>
      )}

      {cities.length > 0 && (
        <Popover>
          <PopoverTrigger asChild>
            <Button variant="outline" size="sm" className="gap-2">
              Ciudad
              {selectedCity && (
                <Badge variant="secondary" className="ml-2">
                  1
                </Badge>
              )}
            </Button>
          </PopoverTrigger>
          <PopoverContent className="w-48">
            <div className="space-y-3">
              <h4 className="text-sm font-semibold">Ciudad</h4>
              <div className="space-y-2 max-h-48 overflow-y-auto">
                {cities.map((city) => (
                  <div key={city} className="flex items-center gap-2">
                    <Checkbox
                      id={`city-${city}`}
                      checked={selectedCity === city}
                      onCheckedChange={() => handleCityChange(city)}
                    />
                    <Label
                      htmlFor={`city-${city}`}
                      className="text-sm font-normal cursor-pointer"
                    >
                      {city}
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

      <Button
        variant={userLocation ? "default" : "outline"}
        size="sm"
        onClick={userLocation ? () => setUserLocation(null) : handleNearMe}
        disabled={isLoadingLocation}
        className="gap-2"
      >
        {isLoadingLocation ? (
          <Loader2 className="h-4 w-4 animate-spin" />
        ) : (
          <MapPin className="h-4 w-4" />
        )}
        {userLocation ? "Ubicación activa" : "Cerca de mí"}
      </Button>

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
