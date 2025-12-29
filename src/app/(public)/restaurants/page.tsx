import {
  searchRestaurants,
  getTaxonomies,
  getRestaurantStats,
} from "@/server/queries/restaurants";
import { SearchInput, FilterBar, RestaurantGrid } from "@/components/features";
import type { PriceRange } from "@/types";

interface PageProps {
  searchParams: {
    q?: string;
    priceRange?: string;
    cuisineTypes?: string;
    page?: string;
  };
}

export default async function RestaurantsPage({ searchParams }: PageProps) {
  const filters = {
    q: searchParams.q,
    priceRange: searchParams.priceRange?.split(",") as PriceRange[],
    taxonomies: searchParams.cuisineTypes?.split(","),
  };

  const page = Number(searchParams.page) || 1;

  const [restaurantsData, cuisineTaxonomies] = await Promise.all([
    searchRestaurants(filters, page, 12),
    getTaxonomies("CUISINE_TYPE"),
  ]);

  // Fetch stats for each restaurant
  const restaurantsWithStats = await Promise.all(
    restaurantsData.data.map(async (restaurant) => {
      const stats = await getRestaurantStats(restaurant.id);
      return {
        ...restaurant,
        stats,
      };
    })
  );

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-4xl font-bold mb-8">Explorar Restaurantes</h1>

      <div className="mb-8 space-y-4">
        <SearchInput defaultValue={filters.q} />
        <FilterBar taxonomies={cuisineTaxonomies} />
      </div>

      <RestaurantGrid
        restaurants={restaurantsWithStats}
        emptyMessage="No se encontraron restaurantes con los filtros seleccionados"
      />
    </div>
  );
}
