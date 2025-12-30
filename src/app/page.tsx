import {
  getApprovedRestaurants,
  getTaxonomies,
  getManyRestaurantStats,
} from "@/server/queries/restaurants";
import { FilterBar, RestaurantGrid } from "@/components/features";
import { SearchAutocomplete } from "@/components/features/search-autocomplete";
import { RestaurantMapWrapper } from "@/components/features/restaurant-map-wrapper";
import { PublicHeader } from "@/components/layout/public-header";
import { HomeFooter } from "@/components/home";
import { ViewToggle } from "@/components/features/view-toggle";
import type { PriceRange } from "@/types";

interface PageProps {
  searchParams: Promise<{
    q?: string;
    priceRange?: string;
    cuisineTypes?: string;
    minRating?: string;
    page?: string;
    view?: string;
  }>;
}

export default async function HomePage({ searchParams }: PageProps) {
  const params = await searchParams;
  const page = Number(params.page) || 1;
  const view = params.view || "list";

  const filters = {
    q: params.q,
    priceRange: params.priceRange?.split(",") as PriceRange[],
    taxonomies: params.cuisineTypes?.split(","),
    minRating: params.minRating ? Number(params.minRating) : undefined,
  };

  // Fetch data in parallel
  const [restaurantsData, cuisineTaxonomies] = await Promise.all([
    getApprovedRestaurants(page, 12),
    getTaxonomies("CUISINE_TYPE"),
  ]);

  // Fetch stats in bulk (Optimization)
  const restaurantIds = restaurantsData.data.map((r) => r.id);
  const statsMap = await getManyRestaurantStats(restaurantIds);

  const restaurantsWithStats = restaurantsData.data.map((r) => ({
    ...r,
    stats: statsMap[r.id],
  }));

  const hasResults = restaurantsWithStats.length > 0;

  return (
    <div className="flex flex-col min-h-screen bg-gray-50/50">
      <PublicHeader />

      <main className="flex-1">
        {/* BUSCADOR SUPERIOR */}
        <section className="bg-white border-b py-10 px-4">
          <div className="container mx-auto max-w-3xl text-center space-y-6">
            <h1 className="text-4xl md:text-5xl font-heading font-bold text-gray-900 tracking-tight">
              ¿Qué te apetece <span className="text-primary italic">hoy</span>?
            </h1>
            <div className="bg-white p-1 rounded-2xl shadow-xl shadow-primary/5 border border-gray-100 max-w-2xl mx-auto">
              <SearchAutocomplete defaultValue={filters.q} />
            </div>
          </div>
        </section>

        <section className="container mx-auto px-4 py-12">
          <div className="flex flex-col lg:flex-row gap-8">
            {/* PANEL LATERAL DE FILTROS */}
            <aside className="w-full lg:w-72 flex-shrink-0">
              <div className="bg-white p-8 rounded-[2.5rem] border border-gray-100 shadow-sm sticky top-24">
                <h2 className="text-xl font-heading font-bold mb-6 text-gray-900 flex items-center gap-2">
                  <span className="w-1.5 h-6 bg-primary rounded-full" />
                  Filtros
                </h2>
                <div className="flex flex-col gap-4">
                  <FilterBar taxonomies={cuisineTaxonomies} />
                </div>
              </div>
            </aside>

            {/* AREA DE RESULTADOS */}
            <div className="flex-1 space-y-6">
              {/* HEADER DE RESULTADOS CON SWITCH */}
              <div className="flex flex-col sm:flex-row items-center justify-between bg-white px-8 py-5 rounded-[2.5rem] border border-gray-100 shadow-sm gap-4">
                <div className="text-left w-full sm:w-auto">
                  <p className="text-sm text-gray-500 font-medium">
                    Mostrando <span className="text-gray-900 font-bold">{restaurantsData.total}</span> restaurantes
                    {filters.q && <span> para "<span className="text-primary">{filters.q}</span>"</span>}
                  </p>
                </div>
                <ViewToggle />
              </div>

              {/* CONTENIDO: LISTA O MAPA */}
              <div className="min-h-[600px] relative z-0">
                {view === "list" ? (
                  <RestaurantGrid
                    restaurants={restaurantsWithStats}
                    emptyMessage="No se encontraron restaurantes con estos filtros."
                  />
                ) : (
                  <div className="h-[750px] rounded-[2.5rem] overflow-hidden border border-gray-100 shadow-2xl relative">
                    {hasResults ? (
                      <RestaurantMapWrapper restaurants={restaurantsWithStats} />
                    ) : (
                      <div className="flex items-center justify-center h-full bg-gray-50 text-gray-400 font-medium">
                        No hay resultados para mostrar en el mapa
                      </div>
                    )}
                  </div>
                )}
              </div>
            </div>
          </div>
        </section>
      </main>

      <HomeFooter />
    </div>
  );
}
