import { PublicHeader } from "@/components/layout/public-header";
import { HomeFooter } from "@/components/home";
import { DynamicPageSections } from "@/components/home/dynamic-page-sections";
import { SearchAutocomplete } from "@/components/features/search-autocomplete";
import { getCurrentUser } from "@/lib/auth/roles";
import { prisma } from "@/lib/prisma";
import Link from "next/link";
import { Button } from "@/components/ui/button";
import { MapPin, Search } from "lucide-react";

export default async function HomePage() {
  const currentUser = await getCurrentUser();

  // Fetch active page sections ordered by their order field
  const sections = await prisma.pageSection.findMany({
    where: { isActive: true },
    orderBy: { order: "asc" },
  });

  // Get user favorites if authenticated
  const userFavorites = currentUser
    ? await prisma.favorite.findMany({
        where: { userId: currentUser.id },
        select: { restaurantId: true },
      })
    : [];

  const favoriteIds = new Set(userFavorites.map((f) => f.restaurantId));

  return (
    <div className="flex flex-col min-h-screen bg-gray-50/50">
      <PublicHeader />

      <main className="flex-1">
        {/* HERO SECTION PRINCIPAL - SIEMPRE VISIBLE */}
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

        {/* SECCIONES DINÁMICAS DEL PAGE BUILDER */}
        <DynamicPageSections
          sections={sections}
          isAuthenticated={!!currentUser}
          favoriteIds={favoriteIds}
        />
      </main>

      <HomeFooter />
    </div>
  );
}
