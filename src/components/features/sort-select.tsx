"use client";

import { useRouter, useSearchParams } from "next/navigation";
import { useEffect, useState } from "react";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";

const sortOptions = [
  { value: "rating", label: "Mejor valorados" },
  { value: "reviews", label: "Más reseñas" },
  { value: "newest", label: "Más recientes" },
  { value: "distance", label: "Más cerca" },
];

export function SortSelect() {
  const router = useRouter();
  const searchParams = useSearchParams();
  const currentSort = searchParams.get("sort") || "rating";
  const hasLocation = searchParams.get("lat") && searchParams.get("lng");

  // Estado para controlar si mostramos la opción de distancia
  const [showDistanceOption, setShowDistanceOption] = useState(false);

  useEffect(() => {
    setShowDistanceOption(!!hasLocation);
  }, [hasLocation]);

  const handleSortChange = (value: string) => {
    if (value === "distance" && !hasLocation) {
      alert("Activa 'Cerca de mí' para ordenar por distancia");
      return;
    }

    const params = new URLSearchParams(searchParams);
    params.set("sort", value);
    router.push(`?${params.toString()}`);
  };

  // Filtrar opciones basado en si hay ubicación
  const availableOptions = showDistanceOption
    ? sortOptions
    : sortOptions.filter(opt => opt.value !== "distance");

  return (
    <Select value={currentSort} onValueChange={handleSortChange}>
      <SelectTrigger className="w-[180px]">
        <SelectValue placeholder="Ordenar por" />
      </SelectTrigger>
      <SelectContent>
        {availableOptions.map((option) => (
          <SelectItem key={option.value} value={option.value}>
            {option.label}
          </SelectItem>
        ))}
      </SelectContent>
    </Select>
  );
}
