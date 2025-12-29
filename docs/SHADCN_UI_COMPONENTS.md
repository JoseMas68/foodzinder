# Componentes shadcn/ui Implementados

Este documento describe todos los componentes UI de shadcn/ui que han sido implementados en el proyecto Foodzinder.

## Resumen de Implementación

**Total de componentes creados:** 18 componentes + 1 hook + 1 archivo de índice

### Estructura de directorios
```
src/
├── components/
│   └── ui/
│       ├── input.tsx
│       ├── label.tsx
│       ├── checkbox.tsx
│       ├── select.tsx
│       ├── form.tsx
│       ├── card.tsx
│       ├── badge.tsx
│       ├── separator.tsx
│       ├── skeleton.tsx
│       ├── avatar.tsx
│       ├── tabs.tsx
│       ├── dropdown-menu.tsx
│       ├── dialog.tsx
│       ├── popover.tsx
│       ├── toast.tsx
│       ├── toaster.tsx
│       ├── table.tsx
│       ├── button.tsx (ya existía)
│       └── index.ts (exports)
└── hooks/
    └── use-toast.ts
```

---

## FASE 1: Formularios

### 1. Input
**Archivo:** `src/components/ui/input.tsx`
- Componente de entrada de texto estándar
- Soporta todos los atributos HTML del input
- Estilos Tailwind CSS integrados
- Soporte para file uploads con estilos especiales

**Uso:**
```tsx
import { Input } from "@/components/ui/input"

<Input type="email" placeholder="correo@ejemplo.com" />
```

### 2. Label
**Archivo:** `src/components/ui/label.tsx`
- Componente de etiqueta basado en Radix UI
- Accesible y responsive
- Incluye soporte para estados disabled

**Uso:**
```tsx
import { Label } from "@/components/ui/label"

<Label htmlFor="email">Correo electrónico</Label>
```

### 3. Checkbox
**Archivo:** `src/components/ui/checkbox.tsx`
- Componente checkbox basado en Radix UI
- Indicador visual con ícono Check
- Estados: checked, unchecked, indeterminate
- Accesible con navegación por teclado

**Uso:**
```tsx
import { Checkbox } from "@/components/ui/checkbox"

<Checkbox id="terms" />
```

### 4. Select
**Archivo:** `src/components/ui/select.tsx`
- Componente select completo con dropdown
- Exporta: `Select`, `SelectGroup`, `SelectValue`, `SelectTrigger`, `SelectContent`, `SelectItem`, `SelectLabel`
- Basado en Radix UI Select
- Soporta grouping y custom icons

**Uso:**
```tsx
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

<Select>
  <SelectTrigger>
    <SelectValue placeholder="Selecciona una opción" />
  </SelectTrigger>
  <SelectContent>
    <SelectItem value="opcion1">Opción 1</SelectItem>
    <SelectItem value="opcion2">Opción 2</SelectItem>
  </SelectContent>
</Select>
```

### 5. Form
**Archivo:** `src/components/ui/form.tsx`
- Integración con react-hook-form
- Exporta: `Form`, `FormField`, `FormItem`, `FormLabel`, `FormControl`, `FormDescription`, `FormMessage`, `useFormField`
- Manejo automático de errores
- Validación integrada

**Uso:**
```tsx
import { Form, FormField, FormItem, FormLabel, FormControl } from "@/components/ui/form"
import { useForm } from "react-hook-form"

const form = useForm()

<Form {...form}>
  <FormField
    control={form.control}
    name="email"
    render={({ field }) => (
      <FormItem>
        <FormLabel>Correo</FormLabel>
        <FormControl>
          <Input {...field} />
        </FormControl>
      </FormItem>
    )}
  />
</Form>
```

---

## FASE 2: Contenido

### 6. Card
**Archivo:** `src/components/ui/card.tsx`
- Contenedor de contenido con borde y sombra
- Exporta: `Card`, `CardHeader`, `CardTitle`, `CardDescription`, `CardContent`, `CardFooter`
- Estructura semántica para organización de contenido

**Uso:**
```tsx
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"

<Card>
  <CardHeader>
    <CardTitle>Título</CardTitle>
  </CardHeader>
  <CardContent>
    Contenido del card
  </CardContent>
</Card>
```

### 7. Badge
**Archivo:** `src/components/ui/badge.tsx`
- Componente de etiqueta/distintivo
- Variantes: default, secondary, destructive, outline
- Pequeño y compacto

**Uso:**
```tsx
import { Badge } from "@/components/ui/badge"

<Badge variant="secondary">Nuevo</Badge>
```

### 8. Separator
**Archivo:** `src/components/ui/separator.tsx`
- Línea divisoria horizontal o vertical
- Basado en Radix UI Separator
- Accesible y semántico

**Uso:**
```tsx
import { Separator } from "@/components/ui/separator"

<Separator />
<Separator orientation="vertical" />
```

### 9. Skeleton
**Archivo:** `src/components/ui/skeleton.tsx`
- Placeholder animado para contenido cargando
- Útil para loading states
- Animación pulse de Tailwind

**Uso:**
```tsx
import { Skeleton } from "@/components/ui/skeleton"

<Skeleton className="h-12 w-12 rounded-full" />
```

### 10. Avatar
**Archivo:** `src/components/ui/avatar.tsx`
- Componente de avatar circular
- Exporta: `Avatar`, `AvatarImage`, `AvatarFallback`
- Basado en Radix UI Avatar
- Fallback automático si no carga la imagen

**Uso:**
```tsx
import { Avatar, AvatarImage, AvatarFallback } from "@/components/ui/avatar"

<Avatar>
  <AvatarImage src="https://..." />
  <AvatarFallback>JD</AvatarFallback>
</Avatar>
```

---

## FASE 3: Navegación

### 11. Tabs
**Archivo:** `src/components/ui/tabs.tsx`
- Componente de pestañas
- Exporta: `Tabs`, `TabsList`, `TabsTrigger`, `TabsContent`
- Basado en Radix UI Tabs
- Navegación por teclado incluida

**Uso:**
```tsx
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

<Tabs defaultValue="tab1">
  <TabsList>
    <TabsTrigger value="tab1">Pestaña 1</TabsTrigger>
    <TabsTrigger value="tab2">Pestaña 2</TabsTrigger>
  </TabsList>
  <TabsContent value="tab1">Contenido 1</TabsContent>
  <TabsContent value="tab2">Contenido 2</TabsContent>
</Tabs>
```

### 12. Dropdown Menu
**Archivo:** `src/components/ui/dropdown-menu.tsx`
- Menú desplegable completo
- Exporta: `DropdownMenu`, `DropdownMenuTrigger`, `DropdownMenuContent`, `DropdownMenuItem`, `DropdownMenuCheckboxItem`, `DropdownMenuRadioItem`, `DropdownMenuLabel`, `DropdownMenuSeparator`, `DropdownMenuShortcut`, `DropdownMenuGroup`, `DropdownMenuPortal`, `DropdownMenuSub`, `DropdownMenuSubContent`, `DropdownMenuSubTrigger`, `DropdownMenuRadioGroup`
- Basado en Radix UI Dropdown Menu
- Soporte para submenús y checkboxes

**Uso:**
```tsx
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"

<DropdownMenu>
  <DropdownMenuTrigger>Menú</DropdownMenuTrigger>
  <DropdownMenuContent>
    <DropdownMenuItem>Opción 1</DropdownMenuItem>
    <DropdownMenuItem>Opción 2</DropdownMenuItem>
  </DropdownMenuContent>
</DropdownMenu>
```

---

## FASE 4: Overlay

### 13. Dialog
**Archivo:** `src/components/ui/dialog.tsx`
- Modal/diálogo accesible
- Exporta: `Dialog`, `DialogTrigger`, `DialogContent`, `DialogHeader`, `DialogFooter`, `DialogTitle`, `DialogDescription`, `DialogPortal`, `DialogOverlay`, `DialogClose`
- Basado en Radix UI Dialog
- Manejo automático del focus

**Uso:**
```tsx
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"

<Dialog>
  <DialogTrigger>Abrir</DialogTrigger>
  <DialogContent>
    <DialogHeader>
      <DialogTitle>Título del diálogo</DialogTitle>
      <DialogDescription>Descripción</DialogDescription>
    </DialogHeader>
  </DialogContent>
</Dialog>
```

### 14. Popover
**Archivo:** `src/components/ui/popover.tsx`
- Popover flotante posicionado
- Exporta: `Popover`, `PopoverTrigger`, `PopoverContent`
- Basado en Radix UI Popover
- Posicionamiento automático

**Uso:**
```tsx
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"

<Popover>
  <PopoverTrigger>Abierto</PopoverTrigger>
  <PopoverContent>
    Contenido del popover
  </PopoverContent>
</Popover>
```

---

## FASE 5: Notificaciones

### 15. Toast
**Archivo:** `src/components/ui/toast.tsx`
- Sistema de notificaciones (toasts)
- Exporta: `Toast`, `ToastTitle`, `ToastDescription`, `ToastClose`, `ToastAction`, `ToastProvider`, `ToastViewport`
- Basado en Radix UI Toast
- Soporte para variantes (default, destructive)
- Gestos swipe para descartar

**Características:**
- Posición automática bottom-right
- Animaciones suaves
- Acciones customizables

### 16. Toaster
**Archivo:** `src/components/ui/toaster.tsx`
- Componente de renderizado de toasts
- Debe ser incluido en el layout raíz
- Usa el hook `useToast`

**Uso:**
```tsx
// En tu app layout:
import { Toaster } from "@/components/ui/toaster"

export default function RootLayout() {
  return (
    <html>
      <body>
        {/* Tu contenido */}
        <Toaster />
      </body>
    </html>
  )
}
```

### 17. use-toast Hook
**Archivo:** `src/hooks/use-toast.ts`
- Hook personalizado para gestionar toasts
- Exporta: `useToast()`, `toast()`, tipos
- Gestión de estado global

**Uso:**
```tsx
import { useToast } from "@/hooks/use-toast"

const { toast } = useToast()

toast({
  title: "Éxito",
  description: "La operación se completó correctamente",
})

toast({
  title: "Error",
  description: "Ocurrió un error",
  variant: "destructive",
})
```

---

## FASE 6: Tablas

### 18. Table
**Archivo:** `src/components/ui/table.tsx`
- Componente de tabla semántico
- Exporta: `Table`, `TableHeader`, `TableBody`, `TableFooter`, `TableHead`, `TableRow`, `TableCell`
- Estilos responsive
- Soporte para hover states

**Uso:**
```tsx
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

<Table>
  <TableHeader>
    <TableRow>
      <TableHead>Nombre</TableHead>
      <TableHead>Email</TableHead>
    </TableRow>
  </TableHeader>
  <TableBody>
    <TableRow>
      <TableCell>Juan</TableCell>
      <TableCell>juan@ejemplo.com</TableCell>
    </TableRow>
  </TableBody>
</Table>
```

---

## Dependencias Instaladas

Todos los componentes dependen de las siguientes librerías que ya están instaladas:

### Radix UI (Base primitives)
- `@radix-ui/react-checkbox@1.3.3`
- `@radix-ui/react-separator@1.1.8`
- `@radix-ui/react-avatar@1.1.11`
- `@radix-ui/react-toast@1.2.15`
- `@radix-ui/react-dialog@1.1.0`
- `@radix-ui/react-dropdown-menu@2.0.0`
- `@radix-ui/react-label@2.0.0`
- `@radix-ui/react-popover@1.0.0`
- `@radix-ui/react-select@2.0.0`
- `@radix-ui/react-slot@1.0.0`
- `@radix-ui/react-tabs@1.0.0`

### Utilidades
- `class-variance-authority` - Para variants de componentes
- `clsx` - Para condicionales de className
- `tailwind-merge` - Para merge de clases Tailwind
- `lucide-react` - Para iconos
- `react-hook-form` - Para formularios
- `tailwindcss-animate` - Para animaciones

### Configuración
- `@/lib/utils` - Función `cn()` para merge de clases
- `src/styles/globals.css` - Variables CSS de diseño

---

## Integración en el Proyecto

### Exportar desde index.ts
Todos los componentes están disponibles desde `src/components/ui/index.ts`:

```tsx
import {
  Button,
  Input,
  Label,
  Card,
  Dialog,
  // ... etc
} from "@/components/ui"
```

### TypeScript Strict Mode
Todos los componentes cumplen con TypeScript Strict Mode con:
- Types correctamente definidos
- Props interfaces explícitas
- Proper generic handling
- Forward refs correctamente tipados

### Accesibilidad
Todos los componentes incluyen:
- Atributos ARIA apropiados
- Navegación por teclado
- Focus management
- Screen reader support

---

## Próximos Pasos

1. Incluir `<Toaster />` en el layout raíz del proyecto
2. Usar los componentes en las páginas de la aplicación
3. Personalizar colores y estilos según el diseño de Foodzinder
4. Extender componentes con variantes custom si es necesario

---

## Compatibilidad

- **Next.js:** 15.0.0+
- **React:** 18.3.0+
- **TypeScript:** 5.3.3+
- **Node.js:** 18.0.0+

---

**Creado:** 2025-12-29
**Versión:** 1.0.0
