import { PriceRange } from "@/types";

/**
 * Formatea un precio numérico a formato de moneda USD
 * @param price - Número a formatear
 * @param currency - Código de moneda ISO 4217 (default: "USD")
 * @returns Precio formateado (ej: "$12.50")
 */
export function formatPrice(
  price: number,
  currency: string = "USD"
): string {
  return new Intl.NumberFormat("en-US", {
    style: "currency",
    currency,
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  }).format(price);
}

/**
 * Convierte un rango de precios a símbolos de dólar
 * @param range - Rango de precios (CHEAP, MODERATE, EXPENSIVE, LUXURY)
 * @returns String con símbolos ($, $$, $$$, $$$$)
 */
export function formatPriceRange(range: PriceRange): string {
  const priceRangeMap: Record<PriceRange, string> = {
    CHEAP: "$",
    MODERATE: "$$",
    EXPENSIVE: "$$$",
    LUXURY: "$$$$",
  };

  return priceRangeMap[range] ?? "N/A";
}

/**
 * Calcula la cantidad de estrellas llenas, medias y vacías basado en un rating
 * @param rating - Rating numérico de 0-5 (puede incluir decimales)
 * @returns Objeto con cantidad de estrellas llenas, si hay media estrella, y vacías
 *
 * @example
 * getRatingStars(4.5) // { filled: 4, half: true, empty: 0 }
 * getRatingStars(3) // { filled: 3, half: false, empty: 2 }
 * getRatingStars(0) // { filled: 0, half: false, empty: 5 }
 */
export function getRatingStars(rating: number): {
  filled: number;
  half: boolean;
  empty: number;
} {
  const maxRating = 5;

  // Limitar el rating entre 0 y 5
  const normalizedRating = Math.max(0, Math.min(rating, maxRating));

  // Calcular estrellas llenas
  const filled = Math.floor(normalizedRating);

  // Determinar si hay media estrella (parte decimal >= 0.5)
  const half = normalizedRating % 1 >= 0.5;

  // Calcular estrellas vacías
  // Si hay media estrella, cuenta como una parcial, así que los vacíos son el resto
  const empty = maxRating - filled - (half ? 1 : 0);

  return { filled, half, empty };
}
