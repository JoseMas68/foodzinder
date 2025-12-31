"use client";

import { useState, useEffect, useRef } from "react";
import { Search, X, Star } from "lucide-react";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar";
import { Badge } from "@/components/ui/badge";
import { useRouter, useSearchParams } from "next/navigation";

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

  // Fetch suggestions from Meilisearch
  useEffect(() => {
    if (debounceRef.current) {
      clearTimeout(debounceRef.current);
    }

    if (query.length >= 2) {
      setLoading(true);
      debounceRef.current = setTimeout(async () => {
        try {
          const response = await fetch(`/api/search/autocomplete?q=${encodeURIComponent(query)}&limit=5`);
          const data = await response.json();
          setSuggestions(data.suggestions || []);
          setShowDropdown(true);
          setLoading(false);
          setHighlightedIndex(-1);
        } catch (error) {
          console.error('Autocomplete error:', error);
          setSuggestions([]);
          setLoading(false);
        }
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
    setQuery("");
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
    if (!showDropdown || !suggestions || suggestions.length === 0) {
      if (e.key === "Enter") {
        handleSearch();
      }
      return;
    }

    switch (e.key) {
      case "ArrowDown":
        e.preventDefault();
        setHighlightedIndex((prev) =>
          prev < suggestions.length - 1 ? prev + 1 : prev
        );
        break;
      case "ArrowUp":
        e.preventDefault();
        setHighlightedIndex((prev) => (prev > 0 ? prev - 1 : -1));
        break;
      case "Enter":
        e.preventDefault();
        if (highlightedIndex >= 0 && highlightedIndex < suggestions.length) {
          handleSelectRestaurant(suggestions[highlightedIndex].slug);
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

  const hasResults = suggestions && Array.isArray(suggestions) && suggestions.length > 0;

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
            <div className="p-2">
              {suggestions.map((restaurant: any, idx: number) => {
                const initials = restaurant.name
                  .split(" ")
                  .map((word: string) => word[0])
                  .join("")
                  .toUpperCase()
                  .slice(0, 2);

                return (
                  <button
                    key={restaurant.id}
                    onClick={() => handleSelectRestaurant(restaurant.slug)}
                    className={`w-full flex items-start gap-3 px-3 py-3 rounded-lg text-sm transition-colors ${
                      highlightedIndex === idx
                        ? "bg-accent"
                        : "hover:bg-accent"
                    }`}
                  >
                    <Avatar className="w-10 h-10 flex-shrink-0">
                      {restaurant.logoUrl && (
                        <AvatarImage
                          src={restaurant.logoUrl}
                          alt={restaurant.name}
                        />
                      )}
                      <AvatarFallback className="bg-primary/10 text-primary text-xs font-bold">
                        {initials}
                      </AvatarFallback>
                    </Avatar>
                    <div className="flex-1 min-w-0 text-left">
                      <div className="font-semibold truncate">{restaurant.name}</div>
                      <div className="text-xs text-muted-foreground truncate mt-0.5">
                        {restaurant.address}
                      </div>
                      <div className="flex items-center gap-2 mt-1">
                        {restaurant.averageRating > 0 && (
                          <div className="flex items-center gap-1">
                            <Star className="h-3 w-3 fill-yellow-400 text-yellow-400" />
                            <span className="text-xs font-medium">
                              {restaurant.averageRating.toFixed(1)}
                            </span>
                          </div>
                        )}
                        {restaurant.cuisineTypes && restaurant.cuisineTypes.length > 0 && (
                          <div className="flex gap-1">
                            {restaurant.cuisineTypes.map((cuisine: string) => (
                              <Badge key={cuisine} variant="secondary" className="text-[10px] py-0 px-1.5">
                                {cuisine}
                              </Badge>
                            ))}
                          </div>
                        )}
                      </div>
                    </div>
                  </button>
                );
              })}
            </div>
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
