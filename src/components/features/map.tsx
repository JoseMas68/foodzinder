"use client";

import { useState, useEffect } from "react";
import { MapContainer, TileLayer, Marker, Popup, useMap, Tooltip } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { ChevronLeft, ChevronRight, MapPin, Star } from "lucide-react";
import { Badge } from "@/components/ui/badge";

// Fix para iconos de Leaflet en Next.js
delete (L.Icon.Default.prototype as any)._getIconUrl;
L.Icon.Default.mergeOptions({
  iconRetinaUrl:
    "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon-2x.png",
  iconUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-icon.png",
  shadowUrl: "https://unpkg.com/leaflet@1.9.4/dist/images/marker-shadow.png",
});

interface Restaurant {
  id: string;
  name: string;
  slug: string;
  description: string;
  address: string;
  latitude?: number;
  longitude?: number;
  logoUrl?: string;
  coverUrl?: string;
  priceRange: string;
  cuisineTypes: string[];
  stats?: {
    averageRating: number;
    reviewCount: number;
  };
  distance?: number;
}

interface RestaurantMapProps {
  restaurants: Restaurant[];
  center?: [number, number];
  zoom?: number;
}

function MapController({ center }: { center: [number, number] }) {
  const map = useMap();
  useEffect(() => {
    map.setView(center);
  }, [center, map]);
  return null;
}

export function RestaurantMap({
  restaurants,
  center = [40.4168, -3.7038], // Madrid coordinates by default
  zoom = 13,
}: RestaurantMapProps) {
  const [isListOpen, setIsListOpen] = useState(true);
  const [selectedRestaurant, setSelectedRestaurant] = useState<Restaurant | null>(null);
  const [mapCenter, setMapCenter] = useState<[number, number]>(center);

  const restaurantsWithLocation = restaurants.filter(
    (r) => r.latitude && r.longitude
  );

  // Calculate center based on restaurants if available
  useEffect(() => {
    if (restaurantsWithLocation.length > 0) {
      const avgLat = restaurantsWithLocation.reduce((sum, r) => sum + r.latitude!, 0) / restaurantsWithLocation.length;
      const avgLng = restaurantsWithLocation.reduce((sum, r) => sum + r.longitude!, 0) / restaurantsWithLocation.length;
      setMapCenter([avgLat, avgLng]);
    }
  }, [restaurants]);

  const handleRestaurantClick = (restaurant: Restaurant) => {
    setSelectedRestaurant(restaurant);
    if (restaurant.latitude && restaurant.longitude) {
      setMapCenter([restaurant.latitude, restaurant.longitude]);
    }
  };

  const priceRangeSymbol = {
    CHEAP: "€",
    MODERATE: "€€",
    EXPENSIVE: "€€€",
    LUXURY: "€€€€",
  };

  return (
    <div className="relative w-full h-full flex">
      {/* Collapsible Restaurant List */}
      <div
        className={`absolute left-0 top-0 bottom-0 bg-white shadow-xl transition-all duration-300 z-[1000] flex flex-col ${
          isListOpen ? "w-96" : "w-0"
        }`}
      >
        {isListOpen && (
          <div className="flex-1 overflow-y-auto p-4 space-y-3">
            <div className="sticky top-0 bg-white pb-2 mb-2 border-b">
              <h3 className="font-bold text-lg">
                {restaurantsWithLocation.length} restaurantes
              </h3>
            </div>
            {restaurantsWithLocation.map((restaurant) => (
              <div
                key={restaurant.id}
                className={`p-4 border rounded-lg cursor-pointer transition-all hover:shadow-md ${
                  selectedRestaurant?.id === restaurant.id
                    ? "border-primary bg-primary/5"
                    : "border-gray-200 hover:border-primary/50"
                }`}
                onClick={() => handleRestaurantClick(restaurant)}
              >
                <div className="flex gap-3">
                  {restaurant.logoUrl && (
                    <img
                      src={restaurant.logoUrl}
                      alt={restaurant.name}
                      className="w-16 h-16 rounded-lg object-cover flex-shrink-0"
                    />
                  )}
                  <div className="flex-1 min-w-0">
                    <h4 className="font-semibold text-sm truncate">
                      {restaurant.name}
                    </h4>
                    <p className="text-xs text-muted-foreground truncate mt-0.5">
                      {restaurant.address}
                    </p>
                    <div className="flex items-center gap-2 mt-2">
                      {restaurant.stats && (
                        <div className="flex items-center gap-1 text-xs">
                          <Star className="h-3 w-3 fill-yellow-400 text-yellow-400" />
                          <span className="font-medium">
                            {restaurant.stats.averageRating.toFixed(1)}
                          </span>
                        </div>
                      )}
                      <span className="text-xs text-muted-foreground">
                        {priceRangeSymbol[restaurant.priceRange as keyof typeof priceRangeSymbol]}
                      </span>
                      {restaurant.distance !== undefined && restaurant.distance < 999999 && (
                        <div className="flex items-center gap-1 text-xs text-muted-foreground">
                          <MapPin className="h-3 w-3" />
                          {restaurant.distance} km
                        </div>
                      )}
                    </div>
                  </div>
                </div>
                <Link
                  href={`/restaurants/${restaurant.slug}`}
                  className="text-xs text-primary hover:underline font-medium mt-2 inline-block"
                  onClick={(e) => e.stopPropagation()}
                >
                  Ver detalles →
                </Link>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Toggle Button */}
      <Button
        size="icon"
        variant="secondary"
        className={`absolute top-4 z-[1001] shadow-lg transition-all duration-300 ${
          isListOpen ? "left-[23.5rem]" : "left-4"
        }`}
        onClick={() => setIsListOpen(!isListOpen)}
      >
        {isListOpen ? <ChevronLeft className="h-4 w-4" /> : <ChevronRight className="h-4 w-4" />}
      </Button>

      {/* Map */}
      <div className="flex-1 w-full h-full">
        <MapContainer
          center={mapCenter}
          zoom={zoom}
          scrollWheelZoom={true}
          className="h-full w-full"
        >
          <MapController center={mapCenter} />
          <TileLayer
            attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />

          {restaurantsWithLocation.map((restaurant) => (
            <Marker
              key={restaurant.id}
              position={[restaurant.latitude!, restaurant.longitude!]}
              eventHandlers={{
                click: () => handleRestaurantClick(restaurant),
              }}
            >
              <Tooltip direction="top" offset={[0, -20]} opacity={0.9} permanent={false}>
                <div className="text-center">
                  <div className="font-semibold text-xs">{restaurant.name}</div>
                  {restaurant.stats && (
                    <div className="flex items-center justify-center gap-1 text-xs mt-0.5">
                      <Star className="h-3 w-3 fill-yellow-400 text-yellow-400" />
                      <span>{restaurant.stats.averageRating.toFixed(1)}</span>
                    </div>
                  )}
                </div>
              </Tooltip>
              <Popup>
                <div className="p-2">
                  <h3 className="font-semibold text-sm mb-2">{restaurant.name}</h3>
                  <Link
                    href={`/restaurants/${restaurant.slug}`}
                    className="text-primary text-sm hover:underline font-medium"
                  >
                    Ver detalles →
                  </Link>
                </div>
              </Popup>
            </Marker>
          ))}
        </MapContainer>
      </div>
    </div>
  );
}
