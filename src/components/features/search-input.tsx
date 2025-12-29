
"use client";

import { useCallback, useState, useRef, useEffect } from "react";
import { Search, X } from "lucide-react";
import { Input } from "@/components/ui/input";
import { cn } from "@/lib/utils";

interface SearchInputProps {
  placeholder?: string;
  defaultValue?: string;
  onSearch?: (query: string) => void;
  debounceMs?: number;
}

export function SearchInput({
  placeholder = "Search...",
  defaultValue = "",
  onSearch,
  debounceMs = 300,
}: SearchInputProps) {
  const [value, setValue] = useState(defaultValue);
  const debounceTimerRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    if (debounceTimerRef.current) {
      clearTimeout(debounceTimerRef.current);
    }

    debounceTimerRef.current = setTimeout(() => {
      if (onSearch) {
        onSearch(value);
      }
    }, debounceMs);

    return () => {
      if (debounceTimerRef.current) {
        clearTimeout(debounceTimerRef.current);
      }
    };
  }, [value, debounceMs, onSearch]);

  const handleChange = useCallback(
    (e: React.ChangeEvent<HTMLInputElement>) => {
      setValue(e.target.value);
    },
    []
  );

  const handleClear = useCallback(() => {
    setValue("");
  }, []);

  return (
    <div className="relative w-full">
      <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 w-4 h-4 text-gray-400 pointer-events-none" />

      <Input
        type="text"
        placeholder={placeholder}
        value={value}
        onChange={handleChange}
        className="pl-10 pr-10"
        aria-label="Search"
        role="searchbox"
      />

      {value && (
        <button
          onClick={handleClear}
          className={cn(
            "absolute right-3 top-1/2 transform -translate-y-1/2",
            "p-1 rounded-sm text-gray-400 hover:text-gray-600",
            "transition-colors duration-200"
          )}
          aria-label="Clear search"
          type="button"
        >
          <X className="w-4 h-4" />
        </button>
      )}
    </div>
  );
}
