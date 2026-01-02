import Link from "next/link";
import { Button } from "@/components/ui/button";

interface DynamicHeroSectionProps {
  title: string | null;
  subtitle: string | null;
  imageUrl: string | null;
  buttonText: string | null;
  buttonAction: string | null;
  contentPosition?: string | null;
  buttonSize?: string | null;
}

export function DynamicHeroSection({
  title,
  subtitle,
  imageUrl,
  buttonText,
  buttonAction,
  contentPosition = "center",
  buttonSize = "lg",
}: DynamicHeroSectionProps) {
  const hasImage = !!imageUrl;

  // Position classes
  const positionClasses = {
    left: "text-left items-start",
    center: "text-center items-center",
    right: "text-right items-end",
  };

  const alignClasses = positionClasses[contentPosition as keyof typeof positionClasses] || positionClasses.center;

  // Button styles with proper proportions
  const getButtonClasses = () => {
    switch (buttonSize) {
      case "xl":
        return "text-2xl font-semibold px-14 py-8 h-auto min-w-[300px]";
      case "lg":
        return "text-xl font-semibold px-10 py-6 h-auto min-w-[250px]";
      case "default":
        return "text-lg font-medium px-8 py-5 h-auto min-w-[200px]";
      default:
        return "text-xl font-semibold px-10 py-6 h-auto min-w-[250px]";
    }
  };

  return (
    <section
      className={`relative py-24 px-4 ${
        hasImage ? "min-h-[600px] flex items-center" : "bg-gradient-to-br from-primary/5 via-white to-primary/5"
      } border-b`}
    >
      {/* Background Image */}
      {hasImage && (
        <>
          <div
            className="absolute inset-0 bg-cover bg-center"
            style={{ backgroundImage: `url(${imageUrl})` }}
          />
          <div className="absolute inset-0 bg-black/50" />
        </>
      )}

      {/* Content */}
      <div className={`relative container mx-auto max-w-6xl flex flex-col ${alignClasses} space-y-8`}>
        <div className={`space-y-4 max-w-3xl ${contentPosition === "center" ? "mx-auto" : ""}`}>
          {title && (
            <h1
              className={`text-5xl md:text-7xl font-heading font-bold tracking-tight leading-tight ${
                hasImage ? "text-white drop-shadow-lg" : "text-gray-900"
              }`}
            >
              {title}
            </h1>
          )}
          {subtitle && (
            <p
              className={`text-xl md:text-2xl max-w-2xl ${
                hasImage ? "text-white/95 drop-shadow-md" : "text-gray-600"
              }`}
            >
              {subtitle}
            </p>
          )}
        </div>

        {/* CTA Button - siempre visible si hay acción */}
        {buttonAction && (
          <div className="pt-4">
            <Link href={buttonAction}>
              <Button
                className={`shadow-lg transition-all hover:scale-105 ${getButtonClasses()}`}
              >
                {buttonText || "Ver más"}
              </Button>
            </Link>
          </div>
        )}
      </div>
    </section>
  );
}
