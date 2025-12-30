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
      <Card className="overflow-hidden border-gray-100 hover:shadow-2xl hover:shadow-primary/5 hover:-translate-y-1 transition-all duration-500 cursor-pointer group rounded-3xl">
        <div className="relative w-full h-48 bg-gray-50 overflow-hidden">
          {restaurant.coverUrl ? (
            <Image
              src={restaurant.coverUrl}
              alt={restaurant.name}
              fill
              className="object-cover group-hover:scale-110 transition-transform duration-700"
            />
          ) : (
            <div className="w-full h-full bg-gradient-to-br from-primary/5 to-primary/10" />
          )}
          <div className="absolute top-3 right-3">
            <Badge className="bg-white/90 backdrop-blur-md text-gray-900 border-none shadow-sm font-semibold">
              {formatPriceRange(restaurant.priceRange)}
            </Badge>
          </div>
        </div>

        <CardContent className="pt-5 pb-5 px-5">
          <div className="flex items-start gap-4">
            <Avatar className="w-12 h-12 ring-2 ring-white shadow-md flex-shrink-0">
              {restaurant.logoUrl && (
                <AvatarImage
                  src={restaurant.logoUrl}
                  alt={restaurant.name}
                />
              )}
              <AvatarFallback className="bg-primary/10 text-primary font-bold">
                {initials}
              </AvatarFallback>
            </Avatar>

            <div className="flex-1 min-w-0">
              <h3 className="text-lg font-heading font-bold text-gray-900 truncate leading-tight group-hover:text-primary transition-colors">
                {restaurant.name}
              </h3>

              {stats && (
                <div className="flex items-center gap-1.5 mt-1">
                  <RatingWidget
                    rating={stats.averageRating}
                    size="sm"
                    showValue={true}
                  />
                  <span className="text-[10px] font-bold text-gray-400 uppercase tracking-wider">
                    ({stats.reviewCount})
                  </span>
                </div>
              )}
            </div>
          </div>

          <p className="text-sm text-gray-500 line-clamp-2 mt-4 leading-relaxed font-medium">
            {restaurant.description}
          </p>

          {taxonomies && taxonomies.length > 0 && (
            <div className="flex flex-wrap gap-1.5 mt-4">
              {taxonomies.slice(0, 2).map((taxonomy, index) => (
                <Badge
                  key={index}
                  variant="secondary"
                  className="bg-gray-50 text-gray-600 border-none text-[10px] font-bold uppercase tracking-tight py-0.5 px-2"
                >
                  {taxonomy.name}
                </Badge>
              ))}
            </div>
          )}
        </CardContent>
      </Card>
    </Link>
  );
}
