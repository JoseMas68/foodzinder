import Image from "next/image";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { formatPrice } from "@/lib/format";

interface DishCardProps {
  dish: {
    id: string;
    name: string;
    description?: string;
    price: number;
    imageUrl?: string;
    allergens?: string[];
  };
  compact?: boolean;
}

export function DishCard({ dish, compact = false }: DishCardProps) {
  if (compact) {
    return (
      <div className="flex items-start justify-between gap-4 py-3">
        <div className="flex-1 min-w-0">
          <h4 className="text-sm font-semibold text-gray-900 truncate">
            {dish.name}
          </h4>
          {dish.description && (
            <p className="text-xs text-gray-600 line-clamp-2 mt-1">
              {dish.description}
            </p>
          )}
          {dish.allergens && dish.allergens.length > 0 && (
            <div className="flex flex-wrap gap-1 mt-2">
              {dish.allergens.map((allergen) => (
                <Badge
                  key={allergen}
                  variant="outline"
                  className="text-xs h-5"
                >
                  {allergen}
                </Badge>
              ))}
            </div>
          )}
        </div>
        <div className="flex-shrink-0">
          <span className="text-sm font-bold text-gray-900">
            {formatPrice(dish.price)}
          </span>
        </div>
      </div>
    );
  }

  return (
    <Card className="overflow-hidden hover:shadow-md transition-shadow duration-200">
      <div className="relative w-full h-32 bg-gray-100">
        {dish.imageUrl ? (
          <Image
            src={dish.imageUrl}
            alt={dish.name}
            fill
            className="object-cover"
          />
        ) : (
          <div className="w-full h-full flex items-center justify-center bg-gray-200">
            <span className="text-gray-400 text-sm">No image</span>
          </div>
        )}
      </div>

      <CardContent className="pt-4">
        <h3 className="text-sm font-semibold text-gray-900 truncate">
          {dish.name}
        </h3>

        {dish.description && (
          <p className="text-xs text-gray-600 line-clamp-2 mt-1">
            {dish.description}
          </p>
        )}

        {dish.allergens && dish.allergens.length > 0 && (
          <div className="flex flex-wrap gap-1 mt-2">
            {dish.allergens.slice(0, 2).map((allergen) => (
              <Badge
                key={allergen}
                variant="outline"
                className="text-xs h-5"
              >
                {allergen}
              </Badge>
            ))}
            {dish.allergens.length > 2 && (
              <Badge variant="outline" className="text-xs h-5">
                +{dish.allergens.length - 2}
              </Badge>
            )}
          </div>
        )}

        <div className="mt-3 flex items-center justify-between">
          <span className="text-sm font-bold text-gray-900">
            {formatPrice(dish.price)}
          </span>
        </div>
      </CardContent>
    </Card>
  );
}
