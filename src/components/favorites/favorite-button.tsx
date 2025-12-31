'use client'

import { Heart } from "lucide-react";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import { useState } from "react";
import { useRouter } from "next/navigation";
import { SignInButton } from "@clerk/nextjs";

interface FavoriteButtonProps {
  restaurantId: string;
  initialIsFavorite: boolean;
  isAuthenticated: boolean;
  variant?: "default" | "icon";
  size?: "default" | "sm" | "lg" | "icon";
  className?: string;
}

export function FavoriteButton({
  restaurantId,
  initialIsFavorite,
  isAuthenticated,
  variant = "icon",
  size = "icon",
  className,
}: FavoriteButtonProps) {
  const router = useRouter();
  const [isFavorite, setIsFavorite] = useState(initialIsFavorite);
  const [isLoading, setIsLoading] = useState(false);

  const handleToggle = async (e: React.MouseEvent) => {
    e.preventDefault();
    e.stopPropagation();

    if (!isAuthenticated) {
      return;
    }

    setIsLoading(true);

    try {
      if (isFavorite) {
        // Remove from favorites
        const response = await fetch(`/api/favorites?restaurantId=${restaurantId}`, {
          method: "DELETE",
        });

        if (!response.ok) {
          throw new Error("Failed to remove favorite");
        }

        setIsFavorite(false);
      } else {
        // Add to favorites
        const response = await fetch("/api/favorites", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({ restaurantId }),
        });

        if (!response.ok) {
          const error = await response.json();
          throw new Error(error.error || "Failed to add favorite");
        }

        setIsFavorite(true);
      }

      router.refresh();
    } catch (error) {
      console.error("Error toggling favorite:", error);
      alert(error instanceof Error ? error.message : "Error al actualizar favoritos");
      // Revert optimistic update
      setIsFavorite(!isFavorite);
    } finally {
      setIsLoading(false);
    }
  };

  if (!isAuthenticated) {
    return (
      <SignInButton mode="modal">
        <Button
          variant={variant === "icon" ? "secondary" : "outline"}
          size={size}
          className={className}
          onClick={(e) => {
            e.preventDefault();
            e.stopPropagation();
          }}
        >
          <Heart className="h-5 w-5 text-gray-700 stroke-2" />
          {variant !== "icon" && <span className="ml-2">Guardar</span>}
        </Button>
      </SignInButton>
    );
  }

  return (
    <Button
      variant={variant === "icon" ? "secondary" : "outline"}
      size={size}
      className={cn(
        className,
        "transition-all duration-200"
      )}
      onClick={handleToggle}
      disabled={isLoading}
    >
      <Heart
        className={cn(
          "h-5 w-5 transition-all duration-200 stroke-2",
          isFavorite
            ? "fill-red-500 text-red-500"
            : "fill-transparent text-gray-700"
        )}
      />
      {variant !== "icon" && (
        <span className="ml-2">
          {isFavorite ? "Guardado" : "Guardar"}
        </span>
      )}
    </Button>
  );
}
