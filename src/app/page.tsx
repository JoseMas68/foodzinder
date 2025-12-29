import Link from "next/link";
import { Button } from "@/components/ui/button";
import {
  getApprovedRestaurants,
  getTaxonomies,
  getRestaurantStats,
} from "@/server/queries/restaurants";
import {
  HeroSection,
  CategoryBadges,
  HowItWorks,
  FeaturedSection,
  HomeFooter,
} from "@/components/home";
import { RestaurantGrid } from "@/components/features";

export default async function HomePage() {
  // Fetch data in parallel
  const [restaurantsData, cuisineTaxonomies] = await Promise.all([
    getApprovedRestaurants(1, 8), // Solo 8 destacados
    getTaxonomies("CUISINE_TYPE"),
  ]);

  // Cargar stats por cada restaurante
  const restaurantsWithStats = await Promise.all(
    restaurantsData.data.map(async (r) => ({
      ...r,
      stats: await getRestaurantStats(r.id),
    }))
  );

  return (
    <main className="min-h-screen">
      {/* Hero Section */}
      <HeroSection
        totalRestaurants={restaurantsData.total}
        totalReviews={5432} // Hardcoded por ahora, agregado en v0.3.0
        totalUsers={1234} // Hardcoded por ahora
      />

      {/* Category Badges */}
      <section className="container mx-auto px-4 py-12">
        <h2 className="text-3xl font-bold mb-6">Explora por Tipo de Cocina</h2>
        <CategoryBadges taxonomies={cuisineTaxonomies} />
      </section>

      {/* Featured Restaurants */}
      <section className="container mx-auto px-4 py-12 bg-muted/30 rounded-lg">
        <h2 className="text-3xl font-bold mb-2">Restaurantes Destacados</h2>
        <p className="text-muted-foreground mb-8">
          Los mejores lugares para comer cerca de ti
        </p>

        <RestaurantGrid
          restaurants={restaurantsWithStats}
          emptyMessage="Sé el primero en agregar un restaurante"
        />

        <div className="flex justify-center mt-8">
          <Link href="/restaurants">
            <Button size="lg">Ver todos los restaurantes</Button>
          </Link>
        </div>
      </section>

      {/* How It Works */}
      <HowItWorks />

      {/* Best Offers Section */}
      <FeaturedSection
        title="Mejores Ofertas"
        description="Descubre promociones exclusivas de nuestros restaurantes"
        type="offers"
      />

      {/* Best For You Section */}
      <FeaturedSection
        title="Lo Mejor para Ti"
        description="Recomendaciones personalizadas basadas en tus preferencias"
        type="recommended"
      />

      {/* Footer */}
      <HomeFooter />
    </main>
  );
}
