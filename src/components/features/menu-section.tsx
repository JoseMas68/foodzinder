import { Card, CardContent } from "@/components/ui/card";
import { Separator } from "@/components/ui/separator";
import { DishCard } from "./dish-card";
import { formatPrice } from "@/lib/format";

interface MenuSectionProps {
  menu: {
    id: string;
    title: string;
    description?: string;
    price?: number;
    dishes: Array<{
      id: string;
      name: string;
      description?: string;
      price: number;
      imageUrl?: string;
      allergens?: string[];
    }>;
  };
}

export function MenuSection({ menu }: MenuSectionProps) {
  return (
    <Card>
      <CardContent className="pt-4 pb-4">
        <div className="mb-4">
          <h3 className="text-lg font-bold text-gray-900">{menu.title}</h3>

          {menu.description && (
            <p className="text-sm text-gray-600 mt-1">{menu.description}</p>
          )}

          {menu.price !== undefined && (
            <p className="text-sm font-semibold text-gray-900 mt-2">
              {formatPrice(menu.price)}
            </p>
          )}
        </div>

        <Separator className="mb-4" />

        <div>
          {menu.dishes.length > 0 ? (
            <div>
              {menu.dishes.map((dish, index) => (
                <div key={dish.id}>
                  <DishCard dish={dish} compact={true} />
                  {index < menu.dishes.length - 1 && (
                    <Separator className="my-2" />
                  )}
                </div>
              ))}
            </div>
          ) : (
            <p className="text-sm text-gray-500 text-center py-4">
              No dishes available
            </p>
          )}
        </div>
      </CardContent>
    </Card>
  );
}
