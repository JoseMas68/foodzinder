"use client";

import { useState, useEffect } from "react";
import { Button } from "@/components/ui/button";
import { Checkbox } from "@/components/ui/checkbox";
import { Badge } from "@/components/ui/badge";
import { Label } from "@/components/ui/label";
import { useRouter, useSearchParams } from "next/navigation";
import { MapPin, Loader2, ChevronDown, ChevronUp, X } from "lucide-react";
import type { PriceRange } from "@/types";

interface FilterBarProps {
  taxonomies?: Array<{ id: string; name: string }>;
  features?: Array<{ id: string; name: string }>;
  cities?: string[];
}

export function FilterBar({ taxonomies = [], features = [], cities = [] }: FilterBarProps) {
  const router = useRouter();
  const searchParams = useSearchParams();

  // Accordion states
  const [openSections, setOpenSections] = useState<string[]>(["price"]);

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

  const toggleSection = (section: string) => {
    setOpenSections(prev =>
      prev.includes(section)
        ? prev.filter(s => s !== section)
        : [...prev, section]
    );
  };

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
    CHEAP: "€ Económico",
    MODERATE: "€€ Moderado",
    EXPENSIVE: "€€€ Caro",
    LUXURY: "€€€€ Lujo",
  };

  const AccordionSection = ({
    id,
    title,
    count,
    children
  }: {
    id: string;
    title: string;
    count?: number;
    children: React.ReactNode
  }) => {
    const isOpen = openSections.includes(id);

    return (
      <div className="border-b border-gray-100 last:border-b-0">
        <button
          onClick={() => toggleSection(id)}
          className="w-full flex items-center justify-between py-4 px-2 hover:bg-gray-50/50 transition-colors rounded-lg group"
        >
          <div className="flex items-center gap-2">
            <span className="font-semibold text-gray-900 group-hover:text-primary transition-colors">
              {title}
            </span>
            {count !== undefined && count > 0 && (
              <Badge variant="secondary" className="bg-primary/10 text-primary">
                {count}
              </Badge>
            )}
          </div>
          {isOpen ? (
            <ChevronUp className="h-4 w-4 text-gray-400 group-hover:text-primary transition-colors" />
          ) : (
            <ChevronDown className="h-4 w-4 text-gray-400 group-hover:text-primary transition-colors" />
          )}
        </button>
        <div
          className={`overflow-hidden transition-all duration-300 ease-in-out ${
            isOpen ? "max-h-[600px] opacity-100" : "max-h-0 opacity-0"
          }`}
        >
          <div className="pb-4 px-2 space-y-2">
            {children}
          </div>
        </div>
      </div>
    );
  };

  return (
    <div className="space-y-6">
      {/* Near Me Button */}
      <Button
        variant={userLocation ? "default" : "outline"}
        size="lg"
        onClick={userLocation ? () => setUserLocation(null) : handleNearMe}
        disabled={isLoadingLocation}
        className="w-full gap-2 h-12 text-base font-semibold"
      >
        {isLoadingLocation ? (
          <Loader2 className="h-5 w-5 animate-spin" />
        ) : (
          <MapPin className="h-5 w-5" />
        )}
        {userLocation ? "Ubicación activa" : "Cerca de mí"}
      </Button>

      {/* Filters Count and Reset */}
      {activeFilterCount > 0 && (
        <div className="flex items-center justify-between p-3 bg-primary/5 rounded-lg border border-primary/10">
          <span className="text-sm font-medium text-primary">
            {activeFilterCount} filtro{activeFilterCount > 1 ? "s" : ""} activo{activeFilterCount > 1 ? "s" : ""}
          </span>
          <Button
            variant="ghost"
            size="sm"
            onClick={handleReset}
            className="h-8 text-xs text-primary hover:text-primary hover:bg-primary/10"
          >
            <X className="h-3 w-3 mr-1" />
            Limpiar
          </Button>
        </div>
      )}

      {/* Accordion Sections */}
      <div className="space-y-1">
        <AccordionSection id="price" title="Precio" count={selectedPriceRange.length}>
          <div className="space-y-2">
            {priceRanges.map((priceRange) => (
              <div key={priceRange} className="flex items-center gap-2">
                <Checkbox
                  id={`price-${priceRange}`}
                  checked={selectedPriceRange.includes(priceRange)}
                  onCheckedChange={() => handlePriceRangeChange(priceRange)}
                />
                <Label
                  htmlFor={`price-${priceRange}`}
                  className="text-sm font-normal cursor-pointer flex-1"
                >
                  {priceRangeLabel[priceRange]}
                </Label>
              </div>
            ))}
          </div>
        </AccordionSection>

        {taxonomies.length > 0 && (
          <AccordionSection id="cuisine" title="Tipo de Cocina" count={selectedCuisines.length}>
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
                    className="text-sm font-normal cursor-pointer flex-1"
                  >
                    {taxonomy.name}
                  </Label>
                </div>
              ))}
            </div>
          </AccordionSection>
        )}

        {features.length > 0 && (
          <AccordionSection id="features" title="Características" count={selectedFeatures.length}>
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
                    className="text-sm font-normal cursor-pointer flex-1"
                  >
                    {feature.name}
                  </Label>
                </div>
              ))}
            </div>
          </AccordionSection>
        )}

        {cities.length > 0 && (
          <AccordionSection id="city" title="Ciudad" count={selectedCity ? 1 : 0}>
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
                    className="text-sm font-normal cursor-pointer flex-1"
                  >
                    {city}
                  </Label>
                </div>
              ))}
            </div>
          </AccordionSection>
        )}

        <AccordionSection id="rating" title="Valoración Mínima" count={selectedRating ? 1 : 0}>
          <div className="space-y-2">
            {[5, 4, 3, 2, 1].map((rating) => (
              <div key={rating} className="flex items-center gap-2">
                <Checkbox
                  id={`rating-${rating}`}
                  checked={selectedRating === rating}
                  onCheckedChange={() => handleRatingChange(rating)}
                />
                <Label
                  htmlFor={`rating-${rating}`}
                  className="text-sm font-normal cursor-pointer flex-1 flex items-center gap-1"
                >
                  <span className="font-semibold">{rating}</span>
                  <span className="text-yellow-500">★</span>
                  <span className="text-gray-500">o más</span>
                </Label>
              </div>
            ))}
          </div>
        </AccordionSection>
      </div>
    </div>
  );
}
