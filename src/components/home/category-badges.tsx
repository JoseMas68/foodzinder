"use client";

import { Badge } from "@/components/ui/badge";
import { useRouter } from "next/navigation";

interface CategoryBadgesProps {
  taxonomies: Array<{ id: string; name: string }>;
}

export function CategoryBadges({ taxonomies }: CategoryBadgesProps) {
  const router = useRouter();

  const handleClick = (taxonomyId: string) => {
    router.push(`/restaurants?cuisineTypes=${taxonomyId}`);
  };

  return (
    <div className="flex gap-3 overflow-x-auto pb-4 scrollbar-hide md:grid md:grid-cols-6 md:gap-4">
      {taxonomies.map((taxonomy) => (
        <Badge
          key={taxonomy.id}
          variant="secondary"
          className="cursor-pointer hover:scale-105 transition-transform px-6 py-3 text-base whitespace-nowrap"
          onClick={() => handleClick(taxonomy.id)}
        >
          {taxonomy.name}
        </Badge>
      ))}
    </div>
  );
}
