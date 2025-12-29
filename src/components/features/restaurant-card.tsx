import Image from "next/image";
import Link from "next/link";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar";
import { RatingWidget } from "./rating-widget";
import { formatPriceRange } from "@/lib/format";
import { PriceRange } from "@/types";

interface RestaurantCardProps {
  restaurant: {
    id: string;
    name: string;
    slug: string;
    description: string;
    logoUrl?: string;
    coverUrl?: string;
    priceRange: PriceRange;
  };
  stats?: {
    averageRating: number;
    reviewCount: number;
  };
  taxonomies?: Array<{ name: string }>;
}

export function RestaurantCard({
  restaurant,
  stats,
  taxonomies,
}: RestaurantCardProps) {
  const initials = restaurant.name
    .split(" ")
    .map((word) => word[0])
    .join("")
    .toUpperCase()
    .slice(0, 2);

  return (
    <Link href={`/restaurants/${restaurant.slug}`}>
      <Card className="overflow-hidden hover:shadow-lg transition-all duration-300 cursor-pointer group">
        <div className="relative w-full h-40 bg-gray-200 overflow-hidden">
          {restaurant.coverUrl ? (
            <Image
              src={restaurant.coverUrl}
              alt={restaurant.name}
              fill
              className="object-cover group-hover:scale-105 transition-transform duration-300"
            />
          ) : (
            <div className="w-full h-full bg-gradient-to-br from-gray-100 to-gray-200" />
          )}
        </div>

        <CardContent className="pt-4 pb-4">
          <div className="flex gap-3 mb-3">
            <Avatar className="w-12 h-12 flex-shrink-0">
              {restaurant.logoUrl && (
                <AvatarImage
                  src={restaurant.logoUrl}
                  alt={restaurant.name}
                />
              )}
              <AvatarFallback className="bg-blue-100 text-blue-700">
                {initials}
              </AvatarFallback>
            </Avatar>

            <div className="flex-1 min-w-0">
              <h3 className="text-sm font-bold text-gray-900 truncate">
                {restaurant.name}
              </h3>
              <p className="text-xs text-gray-500">
                {formatPriceRange(restaurant.priceRange)}
              </p>
            </div>
          </div>

          <p className="text-xs text-gray-600 line-clamp-2 mb-3">
            {restaurant.description}
          </p>

          {stats && (
            <div className="flex items-center gap-2 mb-3">
              <RatingWidget
                rating={stats.averageRating}
                size="sm"
                showValue={true}
              />
              <span className="text-xs text-gray-500">
                ({stats.reviewCount} {stats.reviewCount === 1 ? "review" : "reviews"})
              </span>
            </div>
          )}

          {taxonomies && taxonomies.length > 0 && (
            <div className="flex flex-wrap gap-1">
              {taxonomies.slice(0, 2).map((taxonomy, index) => (
                <Badge
                  key={index}
                  variant="secondary"
                  className="text-xs"
                >
                  {taxonomy.name}
                </Badge>
              ))}
              {taxonomies.length > 2 && (
                <Badge variant="secondary" className="text-xs">
                  +{taxonomies.length - 2}
                </Badge>
              )}
            </div>
          )}
        </CardContent>
      </Card>
    </Link>
  );
}
