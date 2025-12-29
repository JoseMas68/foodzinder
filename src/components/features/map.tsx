"use client";

import { MapContainer, TileLayer, Marker, Popup } from "react-leaflet";
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import Link from "next/link";

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
  latitude?: number;
  longitude?: number;
}

interface RestaurantMapProps {
  restaurants: Restaurant[];
  center?: [number, number];
  zoom?: number;
}

export function RestaurantMap({
  restaurants,
  center = [40.4168, -3.7038], // Madrid coordinates by default
  zoom = 13,
}: RestaurantMapProps) {
  const restaurantsWithLocation = restaurants.filter(
    (r) => r.latitude && r.longitude
  );

  return (
    <div className="w-full h-96 rounded-lg overflow-hidden border">
      <MapContainer
        center={center}
        zoom={zoom}
        scrollWheelZoom={false}
        className="h-full w-full"
      >
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />

        {restaurantsWithLocation.map((restaurant) => (
          <Marker
            key={restaurant.id}
            position={[restaurant.latitude!, restaurant.longitude!]}
          >
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
  );
}
