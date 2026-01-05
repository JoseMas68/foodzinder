"use client";

import Link from "next/link";
import { cn } from "@/lib/utils";
import { Calendar, Clock, UtensilsCrossed } from "lucide-react";

const tabs = [
  {
    key: "tables" as const,
    label: "Gestionar Mesas",
    icon: UtensilsCrossed,
    buildHref: (restaurantId: string) => `/dashboard/restaurants/${restaurantId}/tables`,
  },
  {
    key: "services" as const,
    label: "Servicios y Turnos",
    icon: Clock,
    buildHref: (restaurantId: string) => `/dashboard/restaurants/${restaurantId}/services`,
  },
  {
    key: "availability" as const,
    label: "Disponibilidad",
    icon: Calendar,
    buildHref: (restaurantId: string) => `/dashboard/restaurants/${restaurantId}/availability`,
  },
];

export type RestaurantManagementTab = typeof tabs[number]["key"];

interface RestaurantManagementTabsProps {
  restaurantId: string;
  activeTab?: RestaurantManagementTab;
}

export function RestaurantManagementTabs({
  restaurantId,
  activeTab,
}: RestaurantManagementTabsProps) {
  return (
    <div className="w-full overflow-x-auto">
      <div className="inline-flex w-full min-w-[320px] gap-2 rounded-2xl border bg-white p-1 shadow-sm">
        {tabs.map((tab) => {
          const isActive = tab.key === activeTab;
          return (
            <Link
              key={tab.key}
              href={tab.buildHref(restaurantId)}
              className={cn(
                "flex flex-1 items-center justify-center gap-2 rounded-2xl px-4 py-2 text-sm font-medium transition-all",
                isActive
                  ? "bg-primary text-primary-foreground shadow"
                  : "text-muted-foreground hover:bg-muted/60 hover:text-foreground"
              )}
            >
              <tab.icon className="h-4 w-4" />
              <span>{tab.label}</span>
            </Link>
          );
        })}
      </div>
    </div>
  );
}
