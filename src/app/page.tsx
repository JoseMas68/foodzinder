import { getManyRestaurantStats } from "@/server/queries/restaurants";
import { SearchAutocomplete } from "@/components/features/search-autocomplete";
import { PublicHeader } from "@/components/layout/public-header";
import { HomeFooter } from "@/components/home";
import { RestaurantCarousel } from "@/components/home/restaurant-carousel";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { MapPin, Search, Star, TrendingUp } from "lucide-react";

export default async function HomePage() {
  const currentUser = await getCurrentUser();

  // Fetch different restaurant collections in parallel
  const [topRated, newest, nearYou] = await Promise.all([
    // Top rated restaurants
    prisma.restaurant.findMany({
      where: { status: "APPROVED" },
      orderBy: [
        { reviews: { _count: "desc" } }, // First sort by review count
      ],
      take: 12,
      select: {
        id: true,
        name: true,
        slug: true,
        description: true,
        address: true,
        logoUrl: true,
        coverUrl: true,
        priceRange: true,
        latitude: true,
        longitude: true,
      },
    }),
    // Newest restaurants
    prisma.restaurant.findMany({
      where: { status: "APPROVED" },
      orderBy: { createdAt: "desc" },
      take: 12,
      select: {
        id: true,
        name: true,
        slug: true,
        description: true,
        address: true,
        logoUrl: true,
        coverUrl: true,
        priceRange: true,
        latitude: true,
        longitude: true,
      },
    }),
    // Popular in your area (for now, just random selection)
    prisma.restaurant.findMany({
      where: { status: "APPROVED" },
      orderBy: { reviews: { _count: "desc" } },
      take: 12,
      select: {
        id: true,
        name: true,
        slug: true,
        description: true,
        address: true,
        logoUrl: true,
        coverUrl: true,
        priceRange: true,
        latitude: true,
        longitude: true,
      },
    }),
  ]);

  // Fetch stats for all restaurants
  const allRestaurantIds = [...topRated, ...newest, ...nearYou].map((r) => r.id);
  const statsMap = await getManyRestaurantStats(allRestaurantIds);

  // Get user favorites if authenticated
  const userFavorites = currentUser
    ? await prisma.favorite.findMany({
        where: { userId: currentUser.id, restaurantId: { in: allRestaurantIds } },
        select: { restaurantId: true },
      })
    : [];

  const favoriteIds = new Set(userFavorites.map((f) => f.restaurantId));

  // Map restaurants with stats and favorites
  const mapWithStats = (restaurants: typeof topRated) =>
    restaurants.map((r) => ({
      ...r,
      stats: statsMap[r.id],
      isFavorite: favoriteIds.has(r.id),
    }));

  const topRatedWithStats = mapWithStats(topRated);
  const newestWithStats = mapWithStats(newest);
  const nearYouWithStats = mapWithStats(nearYou);

  return (
    <div className="flex flex-col min-h-screen bg-gray-50/50">
      <PublicHeader />

      <main className="flex-1">
        {/* HERO SECTION */}
        <section className="relative bg-gradient-to-br from-primary/5 via-white to-primary/5 border-b py-16 px-4">
          <div className="container mx-auto max-w-4xl text-center space-y-8">
            <div className="space-y-3">
              <h1 className="text-5xl md:text-6xl font-heading font-bold text-gray-900 tracking-tight">
                Descubre los mejores
                <br />
                <span className="text-primary italic">restaurantes</span>
              </h1>
              <p className="text-lg md:text-xl text-gray-600 max-w-2xl mx-auto">
                Reserva mesa en más de 1,000 restaurantes. Opiniones reales, ofertas exclusivas.
              </p>
            </div>

            <div className="bg-white p-1.5 rounded-2xl shadow-2xl shadow-primary/10 border border-gray-100 max-w-2xl mx-auto">
              <SearchAutocomplete placeholder="Nombre del restaurante, cocina, ubicación..." />
            </div>

            <div className="flex flex-wrap items-center justify-center gap-3 pt-4">
              <Link href="/restaurants">
                <Button size="lg" className="gap-2 shadow-lg">
                  <Search className="h-5 w-5" />
                  Explorar todos
                </Button>
              </Link>
              <Link href="/restaurants?sort=distance">
                <Button size="lg" variant="outline" className="gap-2">
                  <MapPin className="h-5 w-5" />
                  Cerca de mí
                </Button>
              </Link>
            </div>
          </div>
        </section>

        {/* CAROUSELS SECTION */}
        <section className="container mx-auto px-4 py-16 space-y-16">
          {/* Top Rated Carousel */}
          <RestaurantCarousel
            title="Los mejor valorados"
            restaurants={topRatedWithStats}
            isAuthenticated={!!currentUser}
          />

          {/* Newest Carousel */}
          <RestaurantCarousel
            title="Recién añadidos"
            restaurants={newestWithStats}
            isAuthenticated={!!currentUser}
          />

          {/* Popular Near You Carousel */}
          <RestaurantCarousel
            title="Popular en tu zona"
            restaurants={nearYouWithStats}
            isAuthenticated={!!currentUser}
          />
        </section>

        {/* CTA SECTION */}
        <section className="bg-primary/5 border-y py-16 px-4">
          <div className="container mx-auto max-w-4xl text-center space-y-6">
            <h2 className="text-3xl md:text-4xl font-heading font-bold text-gray-900">
              ¿Tienes un restaurante?
            </h2>
            <p className="text-lg text-gray-600">
              Únete a nuestra plataforma y llega a miles de comensales
            </p>
            <Link href="/dashboard">
              <Button size="lg" className="gap-2">
                <TrendingUp className="h-5 w-5" />
                Registra tu restaurante
              </Button>
            </Link>
          </div>
        </section>
      </main>

      <HomeFooter />
    </div>
  );
}
