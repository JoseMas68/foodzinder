"use client";

import { RestaurantCard } from "@/components/features/restaurant-card";
import { ChevronLeft, ChevronRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useRef } from "react";

interface Restaurant {
  id: string;
  name: string;
  slug: string;
  description: string;
  address: string;
  logoUrl?: string;
  coverUrl?: string;
  priceRange: string;
  stats?: {
    averageRating: number;
    reviewCount: number;
  };
  isFavorite?: boolean;
}

interface RestaurantCarouselProps {
  title: string;
  subtitle?: string | null;
  restaurants: Restaurant[];
  isAuthenticated?: boolean;
}

export function RestaurantCarousel({ title, subtitle, restaurants, isAuthenticated }: RestaurantCarouselProps) {
  const scrollContainerRef = useRef<HTMLDivElement>(null);

  const scroll = (direction: "left" | "right") => {
    if (scrollContainerRef.current) {
      const scrollAmount = 400;
      scrollContainerRef.current.scrollBy({
        left: direction === "left" ? -scrollAmount : scrollAmount,
        behavior: "smooth",
      });
    }
  };

  if (restaurants.length === 0) return null;

  return (
    <div className="space-y-4">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl md:text-3xl font-heading font-bold text-gray-900">
            {title}
          </h2>
          {subtitle && (
            <p className="text-muted-foreground mt-1">{subtitle}</p>
          )}
        </div>
        <div className="flex gap-2">
          <Button
            variant="outline"
            size="icon"
            onClick={() => scroll("left")}
            className="rounded-full"
          >
            <ChevronLeft className="h-4 w-4" />
          </Button>
          <Button
            variant="outline"
            size="icon"
            onClick={() => scroll("right")}
            className="rounded-full"
          >
            <ChevronRight className="h-4 w-4" />
          </Button>
        </div>
      </div>

      <div
        ref={scrollContainerRef}
        className="flex gap-6 overflow-x-auto scrollbar-hide snap-x snap-mandatory pb-4"
        style={{ scrollbarWidth: "none", msOverflowStyle: "none" }}
      >
        {restaurants.map((restaurant) => (
          <div key={restaurant.id} className="flex-none w-[300px] snap-start">
            <RestaurantCard restaurant={restaurant} isAuthenticated={isAuthenticated} />
          </div>
        ))}
      </div>
    </div>
  );
}
