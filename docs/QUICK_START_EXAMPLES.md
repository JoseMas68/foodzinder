# Ejemplos de Uso Rápido - shadcn/ui Components

Ejemplos prácticos para usar cada componente en el proyecto Foodzinder.

---

## Formularios

### Input
```tsx
import { Input } from "@/components/ui/input"

export function EmailInput() {
  return (
    <Input 
      type="email" 
      placeholder="tu@email.com"
      className="max-w-md"
    />
  )
}
```

### Label + Input
```tsx
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"

export function FormField() {
  return (
    <div className="space-y-2">
      <Label htmlFor="email">Email</Label>
      <Input id="email" type="email" />
    </div>
  )
}
```

### Checkbox
```tsx
import { Checkbox } from "@/components/ui/checkbox"
import { Label } from "@/components/ui/label"

export function CheckboxField() {
  return (
    <div className="flex items-center space-x-2">
      <Checkbox id="terms" />
      <Label htmlFor="terms">Acepto los términos</Label>
    </div>
  )
}
```

### Select
```tsx
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select"

export function RestaurantTypeSelect() {
  return (
    <Select defaultValue="italiana">
      <SelectTrigger className="w-[200px]">
        <SelectValue />
      </SelectTrigger>
      <SelectContent>
        <SelectItem value="italiana">Italiana</SelectItem>
        <SelectItem value="japonesa">Japonesa</SelectItem>
        <SelectItem value="mexicana">Mexicana</SelectItem>
      </SelectContent>
    </Select>
  )
}
```

### Formulario Completo con react-hook-form
```tsx
"use client"

import { useForm } from "react-hook-form"
import {
  Form,
  FormControl,
  FormDescription,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"

export function RestaurantForm() {
  const form = useForm()

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="name"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Nombre del restaurante</FormLabel>
              <FormControl>
                <Input placeholder="Mi Restaurante" {...field} />
              </FormControl>
              <FormDescription>
                Este es el nombre público del restaurante
              </FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">Guardar</Button>
      </form>
    </Form>
  )
}

async function onSubmit(data: any) {
  console.log(data)
}
```

---

## Contenido

### Card
```tsx
import {
  Card,
  CardContent,
  CardDescription,
  CardHeader,
  CardTitle,
} from "@/components/ui/card"

export function RestaurantCard() {
  return (
    <Card>
      <CardHeader>
        <CardTitle>La Pizzería Italiana</CardTitle>
        <CardDescription>Pizzas auténticas desde Italia</CardDescription>
      </CardHeader>
      <CardContent>
        <p>★★★★★ 4.8 (125 reseñas)</p>
      </CardContent>
    </Card>
  )
}
```

### Badge
```tsx
import { Badge } from "@/components/ui/badge"

export function RestaurantBadges() {
  return (
    <div className="flex gap-2">
      <Badge>Popular</Badge>
      <Badge variant="secondary">Entrega rápida</Badge>
      <Badge variant="destructive">Oferta limitada</Badge>
    </div>
  )
}
```

### Separator
```tsx
import { Separator } from "@/components/ui/separator"

export function MenuSection() {
  return (
    <div>
      <h3>Pizzas</h3>
      <Separator className="my-4" />
      <p>Nuestras pizzas especiales...</p>
    </div>
  )
}
```

### Skeleton (Loading)
```tsx
import { Skeleton } from "@/components/ui/skeleton"

export function RestaurantListSkeleton() {
  return (
    <div className="space-y-4">
      {[1, 2, 3].map((i) => (
        <div key={i} className="flex space-x-4">
          <Skeleton className="h-12 w-12 rounded-full" />
          <div className="flex-1 space-y-2">
            <Skeleton className="h-4 w-3/4" />
            <Skeleton className="h-4 w-1/2" />
          </div>
        </div>
      ))}
    </div>
  )
}
```

### Avatar
```tsx
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar"

export function UserAvatar() {
  return (
    <Avatar>
      <AvatarImage src="https://github.com/shadcn.png" alt="@usuario" />
      <AvatarFallback>JD</AvatarFallback>
    </Avatar>
  )
}
```

---

## Navegación

### Tabs
```tsx
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

export function RestaurantMenu() {
  return (
    <Tabs defaultValue="pizzas">
      <TabsList>
        <TabsTrigger value="pizzas">Pizzas</TabsTrigger>
        <TabsTrigger value="pastas">Pastas</TabsTrigger>
        <TabsTrigger value="bebidas">Bebidas</TabsTrigger>
      </TabsList>
      <TabsContent value="pizzas">
        <p>Pizzas disponibles...</p>
      </TabsContent>
      <TabsContent value="pastas">
        <p>Pastas disponibles...</p>
      </TabsContent>
      <TabsContent value="bebidas">
        <p>Bebidas disponibles...</p>
      </TabsContent>
    </Tabs>
  )
}
```

### Dropdown Menu
```tsx
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { Button } from "@/components/ui/button"

export function UserMenu() {
  return (
    <DropdownMenu>
      <DropdownMenuTrigger asChild>
        <Button variant="ghost">Mi Cuenta</Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end">
        <DropdownMenuItem>Mi perfil</DropdownMenuItem>
        <DropdownMenuItem>Mis pedidos</DropdownMenuItem>
        <DropdownMenuSeparator />
        <DropdownMenuItem>Cerrar sesión</DropdownMenuItem>
      </DropdownMenuContent>
    </DropdownMenu>
  )
}
```

---

## Overlay

### Dialog (Modal)
```tsx
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog"
import { Button } from "@/components/ui/button"

export function ConfirmOrderDialog() {
  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button>Confirmar Pedido</Button>
      </DialogTrigger>
      <DialogContent>
        <DialogHeader>
          <DialogTitle>Confirmar pedido</DialogTitle>
          <DialogDescription>
            ¿Estás seguro de que deseas confirmar este pedido?
          </DialogDescription>
        </DialogHeader>
        <div className="flex gap-4">
          <Button variant="outline">Cancelar</Button>
          <Button>Confirmar</Button>
        </div>
      </DialogContent>
    </Dialog>
  )
}
```

### Popover
```tsx
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover"
import { Button } from "@/components/ui/button"

export function PriceInfo() {
  return (
    <Popover>
      <PopoverTrigger asChild>
        <Button variant="outline">¿Por qué este precio?</Button>
      </PopoverTrigger>
      <PopoverContent className="w-80">
        <div className="space-y-2">
          <h4 className="font-medium">Desglose de precios</h4>
          <p className="text-sm text-muted-foreground">
            Comida: $12.00<br />
            Delivery: $2.00<br />
            Impuestos: $1.40
          </p>
        </div>
      </PopoverContent>
    </Popover>
  )
}
```

---

## Notificaciones

### Toast
```tsx
"use client"

import { useToast } from "@/hooks/use-toast"
import { Button } from "@/components/ui/button"

export function OrderNotification() {
  const { toast } = useToast()

  const handleOrderSuccess = () => {
    toast({
      title: "Pedido confirmado",
      description: "Tu pedido fue registrado exitosamente.",
    })
  }

  const handleOrderError = () => {
    toast({
      title: "Error",
      description: "Ocurrió un error al procesar tu pedido.",
      variant: "destructive",
    })
  }

  return (
    <div className="space-x-4">
      <Button onClick={handleOrderSuccess}>Éxito</Button>
      <Button onClick={handleOrderError} variant="destructive">Error</Button>
    </div>
  )
}
```

### Toaster (En Layout)
```tsx
// src/app/layout.tsx
import { Toaster } from "@/components/ui/toaster"

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es">
      <body>
        {children}
        <Toaster />
      </body>
    </html>
  )
}
```

---

## Tablas

### Tabla de Restaurantes
```tsx
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table"

export function RestaurantsList() {
  const restaurants = [
    { id: 1, name: "La Pizzería", rating: 4.8, orders: 125 },
    { id: 2, name: "Sushi Palace", rating: 4.6, orders: 98 },
    { id: 3, name: "Taco Fiesta", rating: 4.9, orders: 156 },
  ]

  return (
    <Table>
      <TableHeader>
        <TableRow>
          <TableHead>Nombre</TableHead>
          <TableHead>Rating</TableHead>
          <TableHead>Órdenes</TableHead>
        </TableRow>
      </TableHeader>
      <TableBody>
        {restaurants.map((restaurant) => (
          <TableRow key={restaurant.id}>
            <TableCell>{restaurant.name}</TableCell>
            <TableCell>★ {restaurant.rating}</TableCell>
            <TableCell>{restaurant.orders}</TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )
}
```

---

## Patrones Comunes

### Loading State
```tsx
import { Skeleton } from "@/components/ui/skeleton"

export function RestaurantDetailsLoading() {
  return (
    <div className="space-y-4">
      <Skeleton className="h-32 w-full" />
      <Skeleton className="h-4 w-3/4" />
      <Skeleton className="h-4 w-1/2" />
    </div>
  )
}
```

### Empty State
```tsx
import { Button } from "@/components/ui/button"

export function EmptyOrders() {
  return (
    <div className="text-center py-12">
      <h3 className="text-lg font-semibold">No hay pedidos</h3>
      <p className="text-muted-foreground">
        Aún no has realizado ningún pedido
      </p>
      <Button className="mt-4">Explorar restaurantes</Button>
    </div>
  )
}
```

### Form with Validation
```tsx
"use client"

import { useForm } from "react-hook-form"
import { zodResolver } from "@hookform/resolvers/zod"
import { z } from "zod"
import {
  Form,
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form"
import { Input } from "@/components/ui/input"
import { Button } from "@/components/ui/button"
import { useToast } from "@/hooks/use-toast"

const schema = z.object({
  email: z.string().email("Email inválido"),
  password: z.string().min(8, "Mínimo 8 caracteres"),
})

type FormData = z.infer<typeof schema>

export function LoginForm() {
  const { toast } = useToast()
  const form = useForm<FormData>({
    resolver: zodResolver(schema),
  })

  async function onSubmit(data: FormData) {
    try {
      // Llamar API
      toast({
        title: "Éxito",
        description: "Has iniciado sesión",
      })
    } catch (error) {
      toast({
        title: "Error",
        description: "Credenciales inválidas",
        variant: "destructive",
      })
    }
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="email"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Email</FormLabel>
              <FormControl>
                <Input type="email" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <FormField
          control={form.control}
          name="password"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Contraseña</FormLabel>
              <FormControl>
                <Input type="password" {...field} />
              </FormControl>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit" className="w-full">
          Iniciar sesión
        </Button>
      </form>
    </Form>
  )
}
```

---

## Tips y Mejores Prácticas

1. **Siempre importa del index centralizado:**
   ```tsx
   import { Button, Input, Card } from "@/components/ui"
   ```

2. **Combina componentes para crear complejos:**
   ```tsx
   <Card>
     <CardHeader>
       <CardTitle>Título</CardTitle>
     </CardHeader>
     <CardContent>
       <Form>
         {/* Contenido */}
       </Form>
     </CardContent>
   </Card>
   ```

3. **Usa variantes para estilos:**
   ```tsx
   <Button variant="outline" size="lg">
     Haz clic
   </Button>
   ```

4. **Mantén toast en layout raíz:**
   ```tsx
   // Siempre incluye en el layout principal
   <Toaster />
   ```

5. **Personaliza con className:**
   ```tsx
   <Input className="max-w-sm" />
   <Button className="w-full">Enviar</Button>
   ```

---

**Más información:** Ver `SHADCN_UI_COMPONENTS.md` para documentación completa.
