# Foodzinder v0.2.2 - Feature Components Documentation

## Overview
7 componentes de características implementados para Foodzinder v0.2.2 en Next.js 15 + React 18 + TypeScript Strict Mode.

## Componentes Implementados

### 1. RatingWidget (src/components/features/rating-widget.tsx)
**Propósito:** Mostrar ratings de estrellas con soporte para half-stars y modo interactivo

**Uso básico:**
```tsx
import { RatingWidget } from "@/components/features";

// Display mode (no interactivo)
<RatingWidget rating={4.5} size="md" showValue={true} />

// Interactive mode
<RatingWidget 
  rating={rating} 
  interactive={true} 
  onChange={(newRating) => setRating(newRating)}
/>
```

**Props:**
- `rating: number` - Rating de 0-5 (soporta decimales)
- `maxRating?: number` - Default: 5
- `size?: "sm" | "md" | "lg"` - Tamaño de las estrellas
- `showValue?: boolean` - Mostrar número decimal
- `interactive?: boolean` - Modo clickeable
- `onChange?: (rating: number) => void` - Callback

---

### 2. DishCard (src/components/features/dish-card.tsx)
**Propósito:** Mostrar información de un plato individual

**Uso básico:**
```tsx
import { DishCard } from "@/components/features";

// Layout expandido (con imagen)
<DishCard 
  dish={{
    id: "1",
    name: "Pasta Carbonara",
    description: "Italian classic pasta",
    price: 12.99,
    imageUrl: "...",
    allergens: ["gluten", "eggs"]
  }}
/>

// Layout compacto (en menús)
<DishCard dish={dishData} compact={true} />
```

**Props:**
- `dish: Dish` - Datos del plato
- `compact?: boolean` - Layout inline sin imagen

---

### 3. SearchInput (src/components/features/search-input.tsx)
**Propósito:** Input de búsqueda con debounce automático

**Uso básico:**
```tsx
import { SearchInput } from "@/components/features";

<SearchInput
  placeholder="Search restaurants..."
  defaultValue=""
  onSearch={(query) => console.log(query)}
  debounceMs={300}
/>
```

**Características:**
- Debounce de 300ms (customizable)
- Clear button automático
- "use client" directive integrado

---

### 4. RestaurantCard (src/components/features/restaurant-card.tsx)
**Propósito:** Tarjeta de restaurante con información completa

**Uso básico:**
```tsx
import { RestaurantCard } from "@/components/features";

<RestaurantCard
  restaurant={{
    id: "1",
    name: "Luigi's",
    slug: "luigis",
    description: "Best Italian restaurant",
    logoUrl: "...",
    coverUrl: "...",
    priceRange: "MODERATE"
  }}
  stats={{
    averageRating: 4.5,
    reviewCount: 127
  }}
  taxonomies={[
    { name: "Italian" },
    { name: "Pasta" }
  ]}
/>
```

**Incluye:**
- Cover image con hover effect
- Logo avatar
- Rating widget integrado
- Taxonomías/categorías
- Link a /restaurants/[slug]

---

### 5. MenuSection (src/components/features/menu-section.tsx)
**Propósito:** Sección completa de un menú con lista de platos

**Uso básico:**
```tsx
import { MenuSection } from "@/components/features";

<MenuSection
  menu={{
    id: "menu-1",
    title: "Appetizers",
    description: "Start your meal right",
    price: undefined,
    dishes: [...]
  }}
/>
```

**Características:**
- Título + descripción
- Precio opcional del menú
- Lista de platos compactos
- Separadores entre elementos

---

### 6. FilterBar (src/components/features/filter-bar.tsx)
**Propósito:** Barra de filtros con múltiples opciones

**Uso básico:**
```tsx
import { FilterBar } from "@/components/features";

const [filters, setFilters] = useState({});

<FilterBar
  onFilterChange={(newFilters) => setFilters(newFilters)}
  taxonomies={[
    { id: "1", name: "Italian" },
    { id: "2", name: "Mexican" }
  ]}
/>
```

**Filtros incluidos:**
- Price Range (CHEAP, MODERATE, EXPENSIVE, LUXURY)
- Cuisine Types (multi-select con checkboxes)
- Min Rating (5 buttons: 1-5 stars)
- Reset button
- Badge de filtros activos

---

### 7. RestaurantGrid (src/components/features/restaurant-grid.tsx)
**Propósito:** Grid responsive de restaurantes

**Uso básico:**
```tsx
import { RestaurantGrid } from "@/components/features";

<RestaurantGrid
  restaurants={restaurantList}
  isLoading={isLoading}
  emptyMessage="No restaurants found"
/>
```

**Responsive Breakpoints:**
- Mobile: 1 columna
- Tablet (md): 2 columnas
- Desktop (lg): 3 columnas
- Large (xl): 4 columnas

**Estados:**
- Loading: 6 skeleton cards
- Empty: mensaje personalizado
- Loaded: grid de RestaurantCard

---

## Utilidades (src/lib/format.ts)

### formatPrice(price: number, currency?: string): string
```tsx
formatPrice(12.50) // "$12.50"
formatPrice(99.99, "EUR") // "99.99 €"
```

### formatPriceRange(range: PriceRange): string
```tsx
formatPriceRange("CHEAP") // "$"
formatPriceRange("LUXURY") // "$$$$"
```

### getRatingStars(rating: number): { filled, half, empty }
```tsx
getRatingStars(4.5) // { filled: 4, half: true, empty: 0 }
getRatingStars(3) // { filled: 3, half: false, empty: 2 }
```

---

## Export de Índice

Todos los componentes están disponibles en un único import:
```tsx
import {
  SearchInput,
  RestaurantCard,
  FilterBar,
  RestaurantGrid,
  RatingWidget,
  MenuSection,
  DishCard
} from "@/components/features";
```

---

## Características Técnicas

✓ TypeScript Strict Mode
✓ Responsive Design (mobile-first)
✓ Accesibilidad (aria-labels, roles)
✓ Tailwind CSS utilities
✓ shadcn/ui components
✓ lucide-react icons
✓ Next.js 15 Image optimization
✓ React 18 features
✓ Client components donde es necesario ("use client")
✓ Performance optimizations (React.memo)

---

## Validación

✓ TypeScript compilation: No errors
✓ All imports validated
✓ shadcn/ui components available
✓ Format utilities working
✓ Tailwind classes applied

