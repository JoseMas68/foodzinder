import Link from "next/link";
import { Button } from "@/components/ui/button";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-center bg-gradient-to-br from-background via-background to-primary/5 p-4">
      <div className="w-full max-w-2xl space-y-8 text-center">
        {/* Hero Section */}
        <div className="space-y-4">
          <h1 className="text-5xl font-bold tracking-tight">
            🍽️ Foodzinder
          </h1>
          <p className="text-xl text-muted-foreground">
            Descubre restaurantes con{" "}
            <span className="font-bold text-primary">"Wow Effect"</span>
          </p>
        </div>

        {/* Description */}
        <p className="text-lg text-muted-foreground leading-relaxed">
          La plataforma más hermosa para descubrir, explorar y disfrutar de la
          mejor experiencia culinaria. Para propietarios que quieren brillar, y
          para usuarios que quieren descubrir.
        </p>

        {/* CTA Buttons */}
        <div className="flex flex-col gap-3 sm:flex-row justify-center pt-4">
          <Button size="lg" asChild>
            <Link href="/signin">Comenzar</Link>
          </Button>
          <Button size="lg" variant="outline" asChild>
            <Link href="#features">Conocer más</Link>
          </Button>
        </div>

        {/* Features Preview */}
        <div
          id="features"
          className="grid gap-6 pt-12 sm:grid-cols-2 lg:grid-cols-3"
        >
          <FeatureCard
            title="Búsqueda Avanzada"
            description="Encuentra restaurantes con filtros inteligentes y geolocalización"
            icon="🔍"
          />
          <FeatureCard
            title="Gestión Completa"
            description="Panel de control para propietarios con todas las herramientas"
            icon="⚙️"
          />
          <FeatureCard
            title="Pagos Seguros"
            description="Sistema de suscripción integrado con Stripe"
            icon="💳"
          />
          <FeatureCard
            title="Reseñas Reales"
            description="Comunidad de usuarios que comparten sus experiencias"
            icon="⭐"
          />
          <FeatureCard
            title="Mapas Interactivos"
            description="Explora restaurantes en el mapa con OpenStreetMap"
            icon="🗺️"
          />
          <FeatureCard
            title="Diseño Hermoso"
            description="Interfaz moderna y responsive en todos los dispositivos"
            icon="🎨"
          />
        </div>
      </div>
    </main>
  );
}

function FeatureCard({
  title,
  description,
  icon,
}: {
  title: string;
  description: string;
  icon: string;
}) {
  return (
    <div className="rounded-lg border border-border bg-card p-6 text-center shadow-sm hover:shadow-md transition-shadow">
      <div className="text-4xl mb-3">{icon}</div>
      <h3 className="font-semibold">{title}</h3>
      <p className="mt-2 text-sm text-muted-foreground">{description}</p>
    </div>
  );
}
