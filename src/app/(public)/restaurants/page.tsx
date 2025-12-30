import {
  searchRestaurants,
  getTaxonomies,
  getManyRestaurantStats,
} from "@/server/queries/restaurants";
import { FilterBar, RestaurantGrid, Pagination } from "@/components/features";
import { SearchAutocomplete } from "@/components/features/search-autocomplete";
import { RestaurantMapWrapper } from "@/components/features/restaurant-map-wrapper";
import type { PriceRange } from "@/types";

interface PageProps {
  searchParams: Promise<{
    q?: string;
    priceRange?: string;
    cuisineTypes?: string;
    page?: string;
  }>;
}

export default async function RestaurantsPage({ searchParams }: PageProps) {
  const params = await searchParams;

  const filters = {
    q: params.q,
    priceRange: params.priceRange?.split(",") as PriceRange[],
    taxonomies: params.cuisineTypes?.split(","),
  };

  const page = Number(params.page) || 1;

  const [restaurantsData, cuisineTaxonomies] = await Promise.all([
    searchRestaurants(filters, page, 12),
    getTaxonomies("CUISINE_TYPE"),
  ]);

  // Fetch stats in bulk
  const restaurantIds = restaurantsData.data.map((r) => r.id);
  const statsMap = await getManyRestaurantStats(restaurantIds);

  const restaurantsWithStats = restaurantsData.data.map((restaurant) => ({
    ...restaurant,
    stats: statsMap[restaurant.id],
  }));

  // Calcular total de páginas (12 items por página)
  const totalPages = Math.ceil(restaurantsData.total / 12);
  const hasResults = restaurantsWithStats.length > 0;

  return (
    <div className="container mx-auto px-4 py-8">
      <h1 className="text-4xl font-bold mb-8">Explorar Restaurantes</h1>

      <div className="mb-8 space-y-4">
        <SearchAutocomplete defaultValue={filters.q} />
        <FilterBar taxonomies={cuisineTaxonomies} />
      </div>

      {/* Map - solo mostrar si hay resultados */}
      {hasResults && (
        <div className="mb-8">
          <h2 className="text-2xl font-bold mb-4">Ubicación de Restaurantes</h2>
          <RestaurantMapWrapper restaurants={restaurantsWithStats} />
        </div>
      )}

      <RestaurantGrid
        restaurants={restaurantsWithStats}
        emptyMessage="No se encontraron restaurantes con los filtros seleccionados"
      />

      {/* Pagination - solo mostrar si hay resultados */}
      {hasResults && totalPages > 1 && (
        <div className="mt-12">
          <Pagination
            currentPage={page}
            totalPages={totalPages}
            totalItems={restaurantsData.total}
          />
        </div>
      )}
    </div>
  );
}
