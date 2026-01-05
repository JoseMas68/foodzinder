"use client";

// This is a client component for handling service actions (edit/delete)
// The actual UI is rendered in the server component page.tsx
// This component is just a placeholder for future edit/delete functionality

interface ServiceListProps {
  services: any[];
  restaurantId: string;
}

export function ServiceList(_props: ServiceListProps) {
  // This component will be enhanced later with edit/delete dialogs
  // For now, it's just a placeholder
  return null;
}
