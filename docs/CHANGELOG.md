# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Pendiente
- FASE 3 (v0.2.3c): Página de detalle de restaurante
- Dashboard de Owner
- Integración con Meilisearch para búsqueda avanzada

---

## [0.2.3b] - 2025-12-29

### Added - Layout Público + Página de Búsqueda

#### Componentes de Layout

**1. PublicHeader** - `src/components/layout/public-header.tsx`
- ✨ Header con logo y navegación
- ✨ Links a Inicio (/), Explorar (/restaurants)
- ✨ Responsive: desktop nav oculto en móvil

**2. PublicFooter** - `src/components/layout/public-footer.tsx`
- ✨ Footer simple con copyright
- ✨ Auto-posicionado al final con flexbox

**3. Layout Público** - `src/app/(public)/layout.tsx`
- ✨ Route group (public) para todas las páginas públicas
- ✨ Wrappea contenido con Header, main, Footer
- ✨ Flex layout para footer sticky

#### Página de Búsqueda y Exploración

**4. Página de Restaurantes** - `src/app/(public)/restaurants/page.tsx`
- ✨ Server Component que maneja búsqueda y filtros
- ✨ Integración con SearchInput + FilterBar + RestaurantGrid
- ✨ Obtiene restaurantes con searchRestaurants query
- ✨ Obtiene taxonomías CUISINE_TYPE para filtros
- ✨ Carga stats (rating, count) para cada restaurante
- ✨ URL-based filtros (q, priceRange, cuisineTypes, page)

#### Componentes Actualizados

**5. SearchInput** - Actualizado con URL sync
- ✨ Ahora es client component con useRouter + useSearchParams
- ✨ Debounce 300ms antes de actualizar URL
- ✨ Sincroniza query param `q` automáticamente
- ✨ Clear button limpia búsqueda y URL

**6. FilterBar** - Actualizado con URL sync
- ✨ Ahora es client component con useRouter + useSearchParams
- ✨ Sincroniza URL params: priceRange, cuisineTypes, minRating
- ✨ Inicializa estado desde URL (bookmarkeable)
- ✨ Reset button limpia todos los filtros y URL

#### Archivos Creados
- ✨ 3 componentes de layout en `src/components/layout/`
- ✨ 1 layout público en `src/app/(public)/`
- ✨ 1 página de búsqueda en `src/app/(public)/restaurants/`
- ✨ Actualización de SearchInput con URL state
- ✨ Actualización de FilterBar con URL state

### Features
- 🚀 Página pública totalmente funcional de búsqueda
- 🚀 Filtros URL-based (bookmarkeable, shareable)
- 🚀 Layout consistente con Header y Footer
- 🚀 Integración Server + Client components
- 🚀 TypeScript Strict Mode - All components typed
- 🚀 Responsive design (mobile-first)
- 🚀 Performance: debounce en búsqueda y filtros

### Testing
- ✅ TypeScript compilation PASS
- ✅ Página accesible en /restaurants
- ✅ Búsqueda y filtros funcionales
- ✅ URL params sincronizados correctamente

---

## [0.2.3a] - 2025-12-29

### Added - Queries Avanzadas para Páginas Públicas

#### 4 Nuevas Queries en `src/server/queries/restaurants.ts`

**1. searchRestaurants(filters, page, limit)** - Búsqueda avanzada con filtros
- ✨ Búsqueda de texto en nombre y descripción (case-insensitive)
- ✨ Filtro por rango de precio (CHEAP, MODERATE, EXPENSIVE, LUXURY)
- ✨ Filtro por taxonomías (cuisine types, features, etc.)
- ✨ Paginación (12 restaurantes por página por defecto)
- ✨ Include taxonomías para mostrar badges
- ✨ Ordenamiento por fecha de creación (más recientes primero)
- ✨ Manejo de errores con fallback a datos vacíos

**2. getRestaurantWithDetails(slug)** - Datos completos del restaurante
- ✨ Obtiene restaurante aprobado por slug
- ✨ Include: taxonomías, menus activos, dishes ordenados, 10 reviews recientes
- ✨ Join con tabla de usuarios para información de reviewers
- ✨ Ordenamiento de dishes por campo `order`
- ✨ Limitado a 10 reviews iniciales (paginación en v0.3.0)
- ✨ Usado en página de detalle `/restaurants/[slug]`

**3. getTaxonomies(type?)** - Obtener opciones de filtro
- ✨ Obtiene taxonomías ordenadas alfabéticamente
- ✨ Filtro opcional por tipo (CUISINE_TYPE, RESTAURANT_FEATURE, DIETARY, AMBIANCE)
- ✨ Usado para poblar opciones en FilterBar
- ✨ Cached con React cache() para mejor rendimiento

**4. getRestaurantReviews(restaurantId, page, limit)** - Reviews paginadas
- ✨ Obtiene reviews de un restaurante con datos del usuario
- ✨ Paginación (10 reviews por página por defecto)
- ✨ Ordenadas por fecha más reciente
- ✨ Include información del usuario (name, email, etc.)
- ✨ Base para "cargar más reseñas" en página de detalle

#### 2 Tipos Extendidos en `src/types/index.ts`

**1. RestaurantWithDetails** - Type para página de detalle
```typescript
Restaurant & {
  taxonomies: Array<{ taxonomy: Taxonomy }>;
  menus: Array<{ menu: Menu & { dishes: Dish[] } }>;
  reviews: Array<Review & { user: User }>;
}
```

**2. ReviewWithUser** - Type para reviews con datos de usuario
```typescript
Review & { user: User }
```

### Features
- 🚀 Backend completamente preparado para páginas públicas
- 🚀 Queries con relaciones Prisma optimizadas
- 🚀 Filtrado dinámico sin N+1 queries
- 🚀 Cached queries con React cache() para mejor performance
- 🚀 Error handling robusto en todas las queries
- 🚀 TypeScript Strict Mode - All queries typed
- 🚀 Soporte para relaciones complejas (taxonomies, menus, dishes, reviews)

### Testing
- ✅ TypeScript compilation PASS
- ✅ Todas las queries exportadas correctamente
- ✅ Tipos extendidos correctamente estructurados

---

## [0.2.2] - 2025-12-29

### Added

#### Componentes de Características (7 componentes)

**1. RatingWidget** - `src/components/features/rating-widget.tsx`
- ✨ Widget visual de rating con estrellas (⭐)
- ✨ Soporta ratings decimales (4.5 estrellas)
- ✨ 3 tamaños: sm (16px), md (20px), lg (24px)
- ✨ Modo display (lectura) e interactivo (editable)
- ✨ Soporte para media estrella
- ✨ Valor numérico opcional

**2. DishCard** - `src/components/features/dish-card.tsx`
- ✨ Tarjeta de plato con dos layouts:
  - Expandido: Imagen + información completa
  - Compacto: Formato inline sin imagen (para menús)
- ✨ Soporte para alérgenos con badges
- ✨ Precio automáticamente formateado
- ✨ Imagen con fallback

**3. SearchInput** - `src/components/features/search-input.tsx`
- ✨ Input de búsqueda avanzado
- ✨ Debounce de 300ms sin librerías externas
- ✨ Clear button automático cuando hay texto
- ✨ Icono de búsqueda integrado (lucide-react)
- ✨ Client component optimizado

**4. RestaurantCard** - `src/components/features/restaurant-card.tsx`
- ✨ Tarjeta de restaurante con:
  - Imagen de portada con hover effect
  - Logo avatar con fallback de iniciales
  - RatingWidget integrado con conteo de reseñas
  - Taxonomías/categorías con badges
  - Link automático a `/restaurants/[slug]`
  - Precio range visual ($$$)

**5. MenuSection** - `src/components/features/menu-section.tsx`
- ✨ Sección de menú que incluye:
  - Título, descripción y precio del menú
  - Lista de DishCard en modo compacto
  - Separadores entre platos
  - Manejo de menús vacíos

**6. FilterBar** - `src/components/features/filter-bar.tsx`
- ✨ Barra de filtros compleja con:
  - Filtro Price Range: 4 opciones (CHEAP, MODERATE, EXPENSIVE, LUXURY)
  - Filtro Cuisine Types: Multi-select con checkboxes
  - Filtro Min Rating: 5 botones para ratings 1-5
  - Reset button y badge de filtros activos
  - Popover para cada sección
  - Client component optimizado

**7. RestaurantGrid** - `src/components/features/restaurant-grid.tsx`
- ✨ Grid responsive de restaurantes:
  - Responsive: 1 col (móvil) → 2 (tablet) → 3 (desktop) → 4 (large)
  - Estado de carga: 6 skeleton cards
  - Mensaje vacío personalizado
  - Optimización con React.memo

#### Utilidades de Formateo

**Format utilities** - `src/lib/format.ts`
- ✨ `formatPrice(price, currency)` - Formatea números como moneda USD
- ✨ `formatPriceRange(range)` - Convierte rangos a símbolos dólar
- ✨ `getRatingStars(rating)` - Calcula estrellas llenas/medias/vacías

#### Archivos Creados
- ✨ 7 componentes en `src/components/features/`
- ✨ 1 utilidad en `src/lib/format.ts`
- ✨ 1 archivo índice en `src/components/features/index.ts`
- ✨ 1 documentación de uso en `docs/COMPONENTS_USAGE.md`

### Features
- 🎨 TypeScript Strict Mode en todos los componentes
- 🎨 Responsive design (mobile-first)
- 🎨 WCAG 2.1 compliant (accesibilidad)
- 🎨 Debounce y optimizaciones de performance
- 🎨 React.memo para componentes pesados
- 🎨 Integración con componentes UI shadcn/ui
- 🎨 Soporte para estados de carga (Skeleton)
- 🎨 Manejo de estados vacíos/errores

### Technical Details
**Estado de Compilación**: ✅ TypeScript type-check PASS
**Imports**: Todos correctos usando @/ alias
**Compatibilidad**: Next.js 15, React 18, TypeScript 5.3
**Componentes UI usados**: Card, Badge, Avatar, Button, Checkbox, Popover, Separator, Skeleton, Input
**Librerías externas**: lucide-react para iconos

### Documentación
- Guía de uso: `docs/COMPONENTS_USAGE.md`
- Ejemplos prácticos en cada componente

### Composición de Componentes
- RestaurantCard: Usa RatingWidget + Card + Badge + Avatar
- MenuSection: Usa DishCard + Card + Separator
- FilterBar: Usa Popover + Checkbox + Badge + Button
- RestaurantGrid: Usa RestaurantCard + Skeleton

---

## [0.2.1] - 2025-12-29

### Added

#### Componentes UI Base (17 componentes + 1 hook)

**Componentes de Formulario (5)**
- ✨ Input: Campo de entrada de texto con soporte de estados
- ✨ Label: Etiqueta de formulario integrada con Radix UI
- ✨ Checkbox: Checkbox accesible con variantes
- ✨ Select: Dropdown completo (SelectTrigger, SelectValue, SelectContent, SelectItem, SelectGroup, SelectLabel)
- ✨ Form: Integración completa con react-hook-form y validación

**Componentes de Contenido (5)**
- ✨ Card: Contenedor flexible (Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter)
- ✨ Badge: Distintivo con 4 variantes (default, secondary, destructive, outline)
- ✨ Separator: Línea divisoria horizontal y vertical
- ✨ Skeleton: Placeholder animado para loading states
- ✨ Avatar: Avatar circular (Avatar, AvatarImage, AvatarFallback)

**Componentes de Navegación (2)**
- ✨ Tabs: Sistema de pestañas (Tabs, TabsList, TabsTrigger, TabsContent)
- ✨ Dropdown Menu: Menú desplegable completo con 15 subcomponentes

**Componentes de Overlay (2)**
- ✨ Dialog: Modal accesible (Dialog, DialogTrigger, DialogContent, DialogHeader, DialogFooter, DialogTitle, DialogDescription)
- ✨ Popover: Popover flotante con posicionamiento (Popover, PopoverTrigger, PopoverContent)

**Sistema de Notificaciones (3 + 1 hook)**
- ✨ Toast: Sistema de notificaciones
- ✨ Toaster: Renderizador de toasts (agregado a layout.tsx)
- ✨ use-toast: Hook personalizado para gestión de toasts (src/hooks/use-toast.ts)

**Componentes de Tabla (1)**
- ✨ Table: Tabla semántica (Table, TableHeader, TableBody, TableFooter, TableRow, TableHead, TableCell)

### Features
- 🎨 TypeScript Strict Mode en todos los componentes
- 🎨 Soporte dark mode (CSS variables)
- 🎨 Responsive design integrado
- 🎨 WCAG 2.1 compliant (accesibilidad)
- 🎨 Keyboard navigation en todos los componentes interactivos

---

## [0.2.0-alpha] - 2025-12-29

### Added

#### Setup del Entorno
- ✨ PostgreSQL 17 en Docker (puerto 5433)
- ✨ 501 dependencias instaladas con Bun
- ✨ Prisma client generado y schema aplicado
- ✨ .env configurado
- ✨ Webhook de Clerk implementado
- ✨ Toaster component integrado

---

## [0.1.1] - 2025-12-29

### Added
- ✨ CHANGELOG.md con semantic versioning
- ✨ ROADMAP.md con 7 fases de desarrollo hasta v1.0.0
- ✨ IDEA-BOARD.md con 50+ ideas categorizadas

---

## [0.1.0] - 2025-12-29

### Added

#### Scaffold Base
- ✨ Estructura completa del proyecto Next.js 15
- ✨ Schema Prisma completo con 10 entidades
- ✨ Server Actions base (auth)
- ✨ Query functions (restaurants)
- ✨ Componentes base (Button, Layout)
- ✨ Documentación completa
- ✨ Agentes IA organizados en `.claude/`
