import { Card } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";

interface FeaturedSectionProps {
  title: string;
  description: string;
  type: "offers" | "recommended";
}

export function FeaturedSection({
  title,
  description,
  type,
}: FeaturedSectionProps) {
  return (
    <section className="container mx-auto px-4 py-12">
      <div className="flex items-center gap-3 mb-6">
        <h2 className="text-3xl font-bold">{title}</h2>
        <Badge variant="outline">Próximamente</Badge>
      </div>
      <p className="text-muted-foreground mb-8">{description}</p>

      <Card className="p-12 text-center border-dashed">
        <div className="text-muted-foreground">
          <p className="text-lg">Esta sección estará disponible en v0.3.0</p>
          <p className="text-sm mt-2">
            {type === "offers"
              ? "Mostrará ofertas y promociones especiales"
              : "Recomendaciones personalizadas basadas en IA"}
          </p>
        </div>
      </Card>
    </section>
  );
}
