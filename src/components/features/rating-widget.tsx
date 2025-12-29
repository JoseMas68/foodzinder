import { Star } from "lucide-react";
import { getRatingStars } from "@/lib/format";
import { cn } from "@/lib/utils";

interface RatingWidgetProps {
  rating: number;
  maxRating?: number;
  size?: "sm" | "md" | "lg";
  showValue?: boolean;
  interactive?: boolean;
  onChange?: (rating: number) => void;
}

export function RatingWidget({
  rating,
  size = "md",
  showValue = false,
  interactive = false,
  onChange,
}: RatingWidgetProps) {
  const { filled, half, empty } = getRatingStars(rating);

  const sizeMap = {
    sm: "w-4 h-4",
    md: "w-5 h-5",
    lg: "w-6 h-6",
  };

  const starSize = sizeMap[size];

  const handleStarClick = (index: number) => {
    if (interactive && onChange) {
      onChange(index + 1);
    }
  };

  return (
    <div className="flex items-center gap-2">
      <div className="flex items-center gap-0.5">
        {Array.from({ length: filled }).map((_, index) => (
          <button
            key={`filled-${index}`}
            className={cn(
              starSize,
              "transition-colors duration-200",
              interactive
                ? "cursor-pointer hover:text-amber-400"
                : "cursor-default"
            )}
            onClick={() => handleStarClick(index)}
            aria-label={interactive ? `Rate ${index + 1} stars` : undefined}
            disabled={!interactive}
          >
            <Star
              className="w-full h-full fill-amber-400 text-amber-400"
              aria-hidden="true"
            />
          </button>
        ))}

        {half && (
          <div
            key="half"
            className={cn(
              starSize,
              "relative",
              interactive ? "cursor-pointer" : "cursor-default"
            )}
            onClick={() => handleStarClick(filled)}
          >
            <Star className={cn(starSize, "text-gray-300")} />
            <div className="absolute inset-0 overflow-hidden w-1/2">
              <Star
                className={cn(
                  starSize,
                  "fill-amber-400 text-amber-400"
                )}
              />
            </div>
          </div>
        )}

        {Array.from({ length: empty }).map((_, index) => (
          <button
            key={`empty-${index}`}
            className={cn(
              starSize,
              "transition-colors duration-200",
              interactive
                ? "cursor-pointer hover:text-amber-400"
                : "cursor-default"
            )}
            onClick={() => handleStarClick(filled + (half ? 1 : 0) + index)}
            disabled={!interactive}
          >
            <Star
              className={cn(starSize, "text-gray-300")}
              aria-hidden="true"
            />
          </button>
        ))}
      </div>

      {showValue && (
        <span className="text-sm font-medium text-gray-700">
          {rating.toFixed(1)}
        </span>
      )}
    </div>
  );
}
