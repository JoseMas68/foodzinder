# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Pendiente
- Componentes de características (SearchInput, RestaurantCard, FilterBar)
- Páginas públicas (Search, Detail)
- Dashboard de Owner
- Integración con Meilisearch para búsqueda avanzada

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

#### Dependencias Instaladas
- ✨ @radix-ui/react-checkbox@1.3.3
- ✨ @radix-ui/react-separator@1.1.8
- ✨ @radix-ui/react-avatar@1.1.11
- ✨ @radix-ui/react-toast@1.2.15
- ✨ svix@1.82.0 (para webhooks)

#### Archivos Creados
- ✨ 17 componentes en `src/components/ui/` 
- ✨ 1 archivo índice en `src/components/ui/index.ts` (68+ exports)
- ✨ 1 hook personalizado en `src/hooks/use-toast.ts`
- ✨ 5 documentos de referencia en `docs/`:
  - SHADCN_UI_COMPONENTS.md - Documentación técnica completa
  - QUICK_START_EXAMPLES.md - Ejemplos de uso de cada componente
  - IMPLEMENTATION_SUMMARY.md - Resumen de implementación
  - VERIFICATION_CHECKLIST.md - Checklist de verificación
  - COMPONENTS_MANIFEST.json - Metadata de componentes

#### Modificaciones
- ✨ src/app/layout.tsx: Agregado `<Toaster />` component

### Features
- 🎨 TypeScript Strict Mode en todos los componentes
- 🎨 Soporte dark mode (CSS variables)
- 🎨 Responsive design integrado
- 🎨 WCAG 2.1 compliant (accesibilidad)
- 🎨 Keyboard navigation en todos los componentes interactivos
- 🎨 Variantes CSS con CVA (class-variance-authority)
- 🎨 Integración completa con Tailwind CSS

### Technical Details
**Estado de Compilación**: ✅ TypeScript type-check PASS
**Imports**: Todos correctos usando @/ alias
**Compatibilidad**: Next.js 15, React 18, TypeScript 5.3

### Documentación
- Guía completa: `docs/SHADCN_UI_COMPONENTS.md`
- Ejemplos prácticos: `docs/QUICK_START_EXAMPLES.md`
- Referencias: `docs/COMPONENTS_MANIFEST.json`

---

# Existing changelog content restored
