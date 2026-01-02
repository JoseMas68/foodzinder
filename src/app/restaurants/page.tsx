import { getTaxonomies } from "@/server/queries/restaurants";
import { getCities } from "@/server/queries/cities";
import { FilterBar, RestaurantGrid, SortSelect } from "@/components/features";
import { SearchAutocomplete } from "@/components/features/search-autocomplete";
import { RestaurantMapWrapper } from "@/components/features/restaurant-map-wrapper";
import { PublicHeader } from "@/components/layout/public-header";
import { HomeFooter } from "@/components/home";
import { ViewToggle } from "@/components/features/view-toggle";
import type { PriceRange } from "@/types";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";

interface PageProps {
  searchParams: Promise<{
    q?: string;
    priceRange?: string;
    cuisineTypes?: string;
    minRating?: string;
    features?: string;
    city?: string;
    lat?: string;
    lng?: string;
    page?: string;
    view?: string;
    sort?: string;
  }>;
}

interface Restaurant {
  id: string;
  name: string;
  slug: string;
  description: string;
  address: string;
  latitude?: number;
  longitude?: number;
  logoUrl?: string;
  coverUrl?: string;
  priceRange: string;
  phone?: string;
  website?: string;
  cuisineTypes: string[];
  features: string[];
  averageRating: number;
  reviewCount: number;
  distance?: number;
}

async function searchRestaurants(params: {
  q?: string;
  priceRange?: string;
  cuisineTypes?: string;
  minRating?: string;
  features?: string;
  city?: string;
  lat?: string;
  lng?: string;
  sort?: string;
  limit?: number;
  offset?: number;
}): Promise<{ hits: Restaurant[]; total: number }> {
  try {
    const query = new URLSearchParams();
    if (params.q) query.set("q", params.q);
    if (params.priceRange) query.set("priceRange", params.priceRange);
    if (params.cuisineTypes) query.set("cuisineTypes", params.cuisineTypes);
    if (params.minRating) query.set("minRating", params.minRating);
    if (params.features) query.set("features", params.features);
    if (params.city) query.set("city", params.city);
    if (params.lat) query.set("lat", params.lat);
    if (params.lng) query.set("lng", params.lng);
    if (params.sort) query.set("sort", params.sort);
    if (params.limit) query.set("limit", params.limit.toString());
    if (params.offset) query.set("offset", params.offset.toString());

    const response = await fetch(
      `${process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"}/api/search?${query.toString()}`,
      { cache: "no-store" }
    );

    if (!response.ok) {
      console.error("Search API error:", response.statusText);
      return { hits: [], total: 0 };
    }

    const data = await response.json();
    return { hits: data.hits || [], total: data.total || 0 };
  } catch (error) {
    console.error("Search error:", error);
    return { hits: [], total: 0 };
  }
}

export default async function RestaurantsPage({ searchParams }: PageProps) {
  const params = await searchParams;
  const page = Number(params.page) || 1;
  const limit = 12;
  const offset = (page - 1) * limit;
  const view = params.view || "list";

  // Para la vista de mapa, cargar todos los restaurantes; para lista, solo la página actual
  const searchLimit = view === "map" ? 1000 : limit;
  const searchOffset = view === "map" ? 0 : offset;

  // Get current user and fetch data in parallel
  const [currentUser, searchResults, cuisineTaxonomies, featureTaxonomies, cities] = await Promise.all([
    getCurrentUser(),
    searchRestaurants({
      q: params.q,
      priceRange: params.priceRange,
      cuisineTypes: params.cuisineTypes,
      minRating: params.minRating,
      features: params.features,
      city: params.city,
      lat: params.lat,
      lng: params.lng,
      sort: params.sort || "rating",
      limit: searchLimit,
      offset: searchOffset,
    }),
    getTaxonomies("CUISINE_TYPE"),
    getTaxonomies("RESTAURANT_FEATURE"),
    getCities(),
  ]);

  // Get user's favorites if authenticated
  const restaurantIds = searchResults.hits.map((r) => r.id);
  const userFavorites = currentUser && restaurantIds.length > 0
    ? await prisma.favorite.findMany({
        where: {
          userId: currentUser.id,
          restaurantId: { in: restaurantIds }
        },
        select: { restaurantId: true },
      })
    : [];

  const favoriteRestaurantIds = new Set(userFavorites.map((f) => f.restaurantId));

  const restaurantsWithFavorites = searchResults.hits.map((r) => ({
    ...r,
    stats: {
      averageRating: r.averageRating,
      reviewCount: r.reviewCount,
    },
    isFavorite: favoriteRestaurantIds.has(r.id),
  }));

  const hasResults = restaurantsWithFavorites.length > 0;
  const totalPages = Math.ceil(searchResults.total / limit);

  return (
    <div className="flex flex-col min-h-screen bg-gray-50/50">
      <PublicHeader />

      <main className="flex-1">
        {/* BUSCADOR SUPERIOR */}
        <section className="bg-white border-b py-10 px-4">
          <div className="container mx-auto max-w-3xl text-center space-y-6">
            <h1 className="text-4xl md:text-5xl font-heading font-bold text-gray-900 tracking-tight">
              Encuentra tu <span className="text-primary italic">restaurante</span> perfecto
            </h1>
            <div className="bg-white p-1 rounded-2xl shadow-xl shadow-primary/5 border border-gray-100 max-w-2xl mx-auto">
              <SearchAutocomplete defaultValue={params.q} />
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
                  <FilterBar taxonomies={cuisineTaxonomies} features={featureTaxonomies} cities={cities} />
                </div>
              </div>
            </aside>

            {/* AREA DE RESULTADOS */}
            <div className="flex-1 space-y-6">
              {/* HEADER DE RESULTADOS CON SWITCH */}
              <div className="flex flex-col sm:flex-row items-center justify-between bg-white px-8 py-5 rounded-[2.5rem] border border-gray-100 shadow-sm gap-4">
                <div className="text-left w-full sm:w-auto">
                  <p className="text-sm text-gray-500 font-medium">
                    Mostrando <span className="text-gray-900 font-bold">{searchResults.total}</span> restaurantes
                    {params.q && <span> para "<span className="text-primary">{params.q}</span>"</span>}
                  </p>
                </div>
                <div className="flex items-center gap-3">
                  <SortSelect />
                  <ViewToggle />
                </div>
              </div>

              {/* CONTENIDO: LISTA O MAPA */}
              <div className="min-h-[600px] relative z-0">
                {view === "list" ? (
                  <RestaurantGrid
                    restaurants={restaurantsWithFavorites}
                    isAuthenticated={!!currentUser}
                    emptyMessage="No se encontraron restaurantes con estos filtros."
                  />
                ) : (
                  <div className="h-[calc(100vh-280px)] rounded-[2.5rem] overflow-hidden border border-gray-100 shadow-2xl relative">
                    {hasResults ? (
                      <RestaurantMapWrapper restaurants={restaurantsWithFavorites} />
                    ) : (
                      <div className="flex items-center justify-center h-full bg-gray-50 text-gray-400 font-medium">
                        No hay resultados para mostrar en el mapa
                      </div>
                    )}
                  </div>
                )}
              </div>

              {/* PAGINACIÓN */}
              {totalPages > 1 && (
                <div className="flex justify-center gap-2 mt-8">
                  {page > 1 && (
                    <a
                      href={`?${new URLSearchParams({ ...params, page: (page - 1).toString() }).toString()}`}
                      className="px-4 py-2 bg-white border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors"
                    >
                      Anterior
                    </a>
                  )}
                  <span className="px-4 py-2 bg-white border border-gray-200 rounded-lg">
                    Página {page} de {totalPages}
                  </span>
                  {page < totalPages && (
                    <a
                      href={`?${new URLSearchParams({ ...params, page: (page + 1).toString() }).toString()}`}
                      className="px-4 py-2 bg-primary text-white rounded-lg hover:bg-primary/90 transition-colors font-medium"
                    >
                      Siguiente
                    </a>
                  )}
                </div>
              )}
            </div>
          </div>
        </section>
      </main>

      <HomeFooter />
    </div>
  );
}
