"use client";

import { useState, useEffect, useRef } from "react";
import { Search, X, UtensilsCrossed, Utensils, Tag } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { useRouter, useSearchParams } from "next/navigation";
import { getAutocomplete } from "@/server/queries/autocomplete";

interface SearchAutocompleteProps {
  placeholder?: string;
  defaultValue?: string;
}

export function SearchAutocomplete({
  placeholder = "Buscar restaurantes, platos o cocinas...",
  defaultValue = "",
}: SearchAutocompleteProps) {
  const [query, setQuery] = useState(defaultValue);
  const [suggestions, setSuggestions] = useState<any>(null);
  const [showDropdown, setShowDropdown] = useState(false);
  const [loading, setLoading] = useState(false);
  const [highlightedIndex, setHighlightedIndex] = useState(-1);
  const debounceRef = useRef<NodeJS.Timeout | null>(null);
  const dropdownRef = useRef<HTMLDivElement>(null);
  const router = useRouter();
  const searchParams = useSearchParams();

  // Fetch suggestions
  useEffect(() => {
    if (debounceRef.current) {
      clearTimeout(debounceRef.current);
    }

    if (query.length >= 2) {
      setLoading(true);
      debounceRef.current = setTimeout(async () => {
        const results = await getAutocomplete(query);
        setSuggestions(results);
        setShowDropdown(true);
        setLoading(false);
        setHighlightedIndex(-1);
      }, 300);
    } else {
      setSuggestions(null);
      setShowDropdown(false);
    }

    return () => {
      if (debounceRef.current) clearTimeout(debounceRef.current);
    };
  }, [query]);

  // Handle clicks outside dropdown
  useEffect(() => {
    const handleClickOutside = (event: MouseEvent) => {
      if (
        dropdownRef.current &&
        !dropdownRef.current.contains(event.target as Node)
      ) {
        setShowDropdown(false);
      }
    };

    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

  const handleSelectRestaurant = (slug: string) => {
    router.push(`/restaurants/${slug}`);
    setShowDropdown(false);
  };

  const handleSelectDish = (slug: string) => {
    router.push(`/restaurants/${slug}`);
    setShowDropdown(false);
  };

  const handleSelectCuisine = (id: string) => {
    const params = new URLSearchParams(searchParams);
    params.set("cuisineTypes", id);
    params.delete("page"); // Reset to page 1
    router.push(`/restaurants?${params.toString()}`);
    setShowDropdown(false);
  };

  const handleSearch = () => {
    if (query.trim()) {
      const params = new URLSearchParams(searchParams);
      params.set("q", query);
      params.delete("page"); // Reset to page 1
      router.push(`/restaurants?${params.toString()}`);
      setShowDropdown(false);
    }
  };

  const handleKeyDown = (e: React.KeyboardEvent<HTMLInputElement>) => {
    if (!showDropdown || !suggestions) return;

    const allItems = [
      ...suggestions.restaurants.map((r: any) => ({ type: "restaurant", data: r })),
      ...suggestions.dishes.map((d: any) => ({ type: "dish", data: d })),
      ...suggestions.cuisines.map((c: any) => ({ type: "cuisine", data: c })),
    ];

    switch (e.key) {
      case "ArrowDown":
        e.preventDefault();
        setHighlightedIndex((prev) =>
          prev < allItems.length - 1 ? prev + 1 : prev
        );
        break;
      case "ArrowUp":
        e.preventDefault();
        setHighlightedIndex((prev) => (prev > 0 ? prev - 1 : -1));
        break;
      case "Enter":
        e.preventDefault();
        if (highlightedIndex >= 0 && highlightedIndex < allItems.length) {
          const item = allItems[highlightedIndex];
          if (item.type === "restaurant") {
            handleSelectRestaurant(item.data.slug);
          } else if (item.type === "dish") {
            handleSelectDish(item.data.restaurantSlug);
          } else if (item.type === "cuisine") {
            handleSelectCuisine(item.data.id);
          }
        } else {
          handleSearch();
        }
        break;
      case "Escape":
        e.preventDefault();
        setShowDropdown(false);
        break;
    }
  };

  const handleClear = () => {
    setQuery("");
    setShowDropdown(false);
  };

  const hasResults =
    suggestions &&
    (suggestions.restaurants.length > 0 ||
      suggestions.dishes.length > 0 ||
      suggestions.cuisines.length > 0);

  return (
    <div className="relative w-full" ref={dropdownRef}>
      <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
      <Input
        type="text"
        placeholder={placeholder}
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        onKeyDown={handleKeyDown}
        onFocus={() => query.length >= 2 && setShowDropdown(true)}
        className="pl-10 pr-10"
      />
      {query && (
        <Button
          variant="ghost"
          size="sm"
          onClick={handleClear}
          className="absolute right-1 top-1/2 -translate-y-1/2 h-7 w-7 p-0"
        >
          <X className="h-4 w-4" />
        </Button>
      )}

      {/* Dropdown de sugerencias */}
      {showDropdown && (
        <div className="absolute top-full mt-2 w-full bg-popover border rounded-lg shadow-lg z-50 max-h-96 overflow-y-auto">
          {loading && (
            <div className="p-4 text-center text-sm text-muted-foreground">
              Buscando...
            </div>
          )}

          {hasResults && !loading && (
            <>
              {/* Restaurantes */}
              {suggestions.restaurants.length > 0 && (
                <div className="p-2 border-b last:border-b-0">
                  <div className="text-xs font-semibold text-muted-foreground px-2 py-1">
                    Restaurantes
                  </div>
                  {suggestions.restaurants.map((r: any, idx: number) => (
                    <button
                      key={r.id}
                      onClick={() => handleSelectRestaurant(r.slug)}
                      className={`w-full flex items-center gap-2 px-2 py-2 rounded text-sm transition-colors ${
                        highlightedIndex === idx
                          ? "bg-accent"
                          : "hover:bg-accent"
                      }`}
                    >
                      <UtensilsCrossed className="h-4 w-4 text-muted-foreground flex-shrink-0" />
                      <span className="truncate">{r.name}</span>
                    </button>
                  ))}
                </div>
              )}

              {/* Platos */}
              {suggestions.dishes.length > 0 && (
                <div className="p-2 border-b last:border-b-0">
                  <div className="text-xs font-semibold text-muted-foreground px-2 py-1">
                    Platos
                  </div>
                  {suggestions.dishes.map((d: any, idx: number) => (
                    <button
                      key={d.id}
                      onClick={() => handleSelectDish(d.restaurantSlug)}
                      className={`w-full flex items-center gap-2 px-2 py-2 rounded text-sm transition-colors ${
                        highlightedIndex ===
                        suggestions.restaurants.length + idx
                          ? "bg-accent"
                          : "hover:bg-accent"
                      }`}
                    >
                      <Utensils className="h-4 w-4 text-muted-foreground flex-shrink-0" />
                      <div className="flex flex-col items-start min-w-0">
                        <span className="truncate">{d.name}</span>
                        <span className="text-xs text-muted-foreground truncate">
                          {d.restaurantName}
                        </span>
                      </div>
                    </button>
                  ))}
                </div>
              )}

              {/* Tipos de cocina */}
              {suggestions.cuisines.length > 0 && (
                <div className="p-2">
                  <div className="text-xs font-semibold text-muted-foreground px-2 py-1">
                    Tipos de Cocina
                  </div>
                  {suggestions.cuisines.map((c: any, idx: number) => (
                    <button
                      key={c.id}
                      onClick={() => handleSelectCuisine(c.id)}
                      className={`w-full flex items-center gap-2 px-2 py-2 rounded text-sm transition-colors ${
                        highlightedIndex ===
                        suggestions.restaurants.length +
                          suggestions.dishes.length +
                          idx
                          ? "bg-accent"
                          : "hover:bg-accent"
                      }`}
                    >
                      <Tag className="h-4 w-4 text-muted-foreground flex-shrink-0" />
                      <span className="truncate">{c.name}</span>
                    </button>
                  ))}
                </div>
              )}
            </>
          )}

          {!loading && !hasResults && query.length >= 2 && (
            <div className="p-4 text-center text-sm text-muted-foreground">
              No se encontraron resultados para "{query}"
            </div>
          )}
        </div>
      )}
    </div>
  );
}
