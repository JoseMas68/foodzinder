"use client";

import { StatsCounter } from "./stats-counter";
import { HeroSearch } from "./hero-search";
import { Users, Star, UtensilsCrossed } from "lucide-react";

interface HeroSectionProps {
  totalRestaurants: number;
  totalReviews: number;
  totalUsers: number;
}

export function HeroSection({
  totalRestaurants,
  totalReviews,
  totalUsers,
}: HeroSectionProps) {
  return (
    <section className="relative flex items-center bg-gradient-to-br from-primary/10 via-background to-primary/5 py-24 md:py-32 overflow-hidden">
      {/* Animated gradient orbs */}
      <div className="absolute top-0 -left-4 w-72 h-72 bg-primary/20 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob" />
      <div className="absolute top-0 -right-4 w-72 h-72 bg-purple-500/20 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-2000" />
      <div className="absolute -bottom-8 left-20 w-72 h-72 bg-pink-500/20 rounded-full mix-blend-multiply filter blur-xl opacity-70 animate-blob animation-delay-4000" />

      <div className="container mx-auto px-4 w-full relative z-10">
        <div className="max-w-4xl mx-auto text-center space-y-8">
          {/* Title */}
          <div>
            <h1 className="text-5xl md:text-6xl font-bold mb-4">
              Descubre tu próxima
              <span className="text-primary block">experiencia culinaria</span>
            </h1>
            <p className="text-lg md:text-xl text-muted-foreground">
              Los mejores restaurantes de tu ciudad en un solo lugar
            </p>
          </div>

          {/* Search */}
          <div className="max-w-2xl mx-auto w-full">
            <HeroSearch placeholder="Busca restaurantes, cocinas o platos..." />
          </div>

          {/* Stats */}
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6 pt-8">
            <StatsCounter
              value={totalRestaurants}
              label="Restaurantes"
              icon={UtensilsCrossed}
              duration={2000}
            />
            <StatsCounter
              value={totalReviews}
              label="Reseñas"
              icon={Star}
              duration={2200}
            />
            <StatsCounter
              value={totalUsers}
              label="Usuarios"
              icon={Users}
              duration={2400}
            />
          </div>
        </div>
      </div>
    </section>
  );
}
