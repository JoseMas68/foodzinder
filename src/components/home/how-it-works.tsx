import { Search, MapPin, Star } from "lucide-react";

export function HowItWorks() {
  const steps = [
    {
      icon: Search,
      title: "Busca",
      description: "Encuentra restaurantes cerca de ti con filtros avanzados",
    },
    {
      icon: MapPin,
      title: "Descubre",
      description: "Explora menús, fotos y reseñas de otros usuarios",
    },
    {
      icon: Star,
      title: "Disfruta",
      description: "Visita y comparte tu experiencia con la comunidad",
    },
  ];

  return (
    <section className="container mx-auto px-4 py-16">
      <div className="text-center mb-12">
        <h2 className="text-3xl font-bold mb-3">¿Cómo Funciona?</h2>
        <p className="text-muted-foreground text-lg">
          Tres pasos para descubrir tu próximo restaurante favorito
        </p>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
        {steps.map((step, index) => {
          const Icon = step.icon;
          return (
            <div key={index} className="text-center space-y-4">
              <div className="flex justify-center">
                <div className="rounded-full bg-primary/10 p-6">
                  <Icon className="h-10 w-10 text-primary" />
                </div>
              </div>
              <h3 className="text-xl font-semibold">{step.title}</h3>
              <p className="text-muted-foreground">{step.description}</p>
            </div>
          );
        })}
      </div>
    </section>
  );
}
