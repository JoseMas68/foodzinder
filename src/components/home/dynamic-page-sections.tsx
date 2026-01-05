import { DynamicHeroSection } from "./dynamic-hero-section";
import { CarouselSection } from "./carousel-section";

interface DynamicPageSectionsProps {
  sections: Array<{
    id: string;
    type: string;
    title: string | null;
    subtitle: string | null;
    order: number;
    isActive: boolean;
    config: any;
  }>;
  isAuthenticated: boolean;
  favoriteIds: string[];
}

export async function DynamicPageSections({
  sections,
  isAuthenticated,
  favoriteIds,
}: DynamicPageSectionsProps) {
  // Render each section based on its type
  const renderedSections = await Promise.all(
    sections.map(async (section) => {
      switch (section.type) {
        case "HERO":
          return (
            <DynamicHeroSection
              key={section.id}
              title={section.title}
              subtitle={section.subtitle}
              imageUrl={section.config?.imageUrl}
              buttonText={section.config?.buttonText}
              buttonAction={section.config?.buttonAction}
              contentPosition={section.config?.contentPosition}
              buttonSize={section.config?.buttonSize}
            />
          );

        case "CAROUSEL":
          return (
            <CarouselSection
              key={section.id}
              title={section.title}
              subtitle={section.subtitle}
              filter={section.config?.filter}
              limit={section.config?.limit || 12}
              isAuthenticated={isAuthenticated}
              favoriteIds={favoriteIds}
            />
          );

        default:
          return null;
      }
    })
  );

  return <>{renderedSections}</>;
}
