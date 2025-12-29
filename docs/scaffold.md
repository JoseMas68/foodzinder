# 🏗️ Scaffold del Proyecto Foodzinder

Este documento describe la estructura del scaffold implementado y cómo está organizado el proyecto.

## 📦 Estructura Creada

### Configuración de Proyecto

```
├── package.json              # Dependencias y scripts
├── tsconfig.json             # Configuración TypeScript
├── next.config.ts            # Configuración Next.js
├── tailwind.config.ts        # Configuración Tailwind CSS
├── postcss.config.js         # Configuración PostCSS
├── .eslintrc.json            # Configuración ESLint
├── .prettierrc                # Configuración Prettier
├── .env.example               # Variables de entorno (template)
└── .gitignore                 # Git ignore rules
```

### Estructura de Carpetas

```
src/
├── app/                       # Next.js App Router
│   ├── (public)/             # Rutas públicas (Home, Search)
│   ├── (auth)/               # Rutas de autenticación
│   ├── (dashboard)/          # Rutas protegidas (Admin, Owner)
│   ├── api/                  # Webhooks y endpoints
│   ├── layout.tsx            # Layout raíz
│   └── page.tsx              # Home page
│
├── components/
│   ├── ui/                   # Componentes base (shadcn/ui)
│   │   └── button.tsx        # Button component
│   └── features/             # Componentes de funcionalidades
│
├── lib/
│   ├── prisma.ts             # Cliente Prisma singleton
│   ├── utils.ts              # Funciones utilitarias
│   ├── validations.ts        # Esquemas Zod
│   └── env.ts                # Validación de variables de entorno
│
├── server/
│   ├── actions/
│   │   └── auth.ts           # Server Actions de autenticación
│   └── queries/
│       └── restaurants.ts    # Data Access Layer para restaurantes
│
├── types/
│   └── index.ts              # Type definitions globales
│
├── hooks/                    # Custom React hooks (vacío)
├── styles/
│   └── globals.css           # Estilos globales
└── env.ts                    # Configuration de variables de entorno

prisma/
└── schema.prisma             # Schema de base de datos

docs/
├── planificacion.md          # Fases de desarrollo
├── arquitectura.md           # Decisiones técnicas
├── modelado-de-datos.md      # Esquema de BD
└── scaffold.md               # Este archivo

.claude/
├── README.md                 # Documentación de agentes
├── agents-config.md          # Configuración de agentes
└── agents/                   # Definiciones de agentes
```

## 🔧 Configuraciones Clave

### TypeScript
- **Strict Mode**: Habilitado para máxima seguridad de tipos
- **Paths**: Aliases configurados para mejor importación (@/components, @/lib, etc)
- **Target**: ES2020 para soporte moderno

### Tailwind CSS
- **Dark Mode**: Soportado con clases
- **Colors**: Variables CSS personalizadas para tema adaptable
- **Extensions**: Animaciones y estilos personalizados
- **Theme**: Colores del proyecto (Rosa Vibrante como primario)

### Next.js
- **App Router**: Configurado como router principal
- **Security Headers**: CSP, X-Frame-Options, etc.
- **Image Optimization**: Dominio permitido para Bunny.net

### Prisma
- **Database**: PostgreSQL v17
- **Generator**: PrismaClient generado
- **Migrations**: Soporte para migraciones idempotentes

## 📊 Modelo de Datos

Entidades principales implementadas:

- **User**: Extendido de Clerk, con información de facturación
- **Restaurant**: Gestión de restaurantes con estado y ubicación
- **Menu**: Menús independientes asignables a múltiples restaurantes
- **Dish**: Platos dentro de menús
- **Taxonomy**: Categorías y etiquetas (Cuisine, Features, Dietary, etc)
- **Review**: Reseñas y calificaciones
- **Subscription**: Suscripciones de propietarios
- **Invoice**: Facturas para cumplimiento fiscal
- **Favorite**: Favoritos de usuarios
- **AuditLog**: Log de cambios (opcional)

## 🎯 Archivos Clave Creados

### Frontend

- **layout.tsx**: Layout raíz con Clerk Provider
- **page.tsx**: Home page con preview de features
- **button.tsx**: Componente Button base de shadcn/ui

### Estilos

- **globals.css**:
  - Variables CSS para tema claro/oscuro
  - Tailwind directives (@tailwind)
  - Custom scrollbar
  - Smooth scrolling

### Backend

- **auth.ts**: Server Actions para sincronización con Clerk
  - `syncUserFromClerk()`: Sincronizar usuario
  - `getCurrentUser()`: Obtener usuario autenticado
  - `hasRole()`, `isOwner()`, `isAdmin()`: Verificar roles

- **restaurants.ts**: Queries para restaurantes
  - `getApprovedRestaurants()`: Listar restaurantes aprobados
  - `getRestaurantBySlug()`: Obtener por slug
  - `getMyRestaurants()`: Restaurantes del propietario
  - `getRestaurantStats()`: Estadísticas del restaurante

### Utilidades

- **prisma.ts**: Cliente Prisma singleton para evitar múltiples instancias
- **utils.ts**: Funciones de utilidad (cn, formatPrice, formatDate, generateSlug, etc)
- **validations.ts**: Esquemas Zod para validación de datos
- **env.ts**: Validación y caching de variables de entorno

### Tipos

- **index.ts**: Type definitions globales para toda la app
  - `User`, `Restaurant`, `Menu`, `Dish`
  - `Review`, `Subscription`, `Invoice`
  - `ApiResponse`, `PaginatedResponse`
  - Enums para estados

## 🚀 Próximos Pasos

1. **Instalar dependencias**
   ```bash
   bun install
   ```

2. **Configurar .env**
   ```bash
   cp .env.example .env
   # Rellenar con valores reales
   ```

3. **Configurar base de datos**
   ```bash
   bun run db:push
   ```

4. **Iniciar desarrollo**
   ```bash
   bun run dev
   ```

## 📝 Notas Importantes

- El proyecto usa **Next.js App Router** como estándar
- **Server Actions** para backend en lugar de API REST tradicional
- **Clerk** para autenticación integrada
- **Prisma** como ORM con PostgreSQL
- **Zod** para validación de datos en tiempo de ejecución
- **shadcn/ui** como base para componentes
- **Framer Motion** para animaciones
- **TypeScript Strict Mode** para máxima seguridad de tipos

## 🔐 Seguridad

El scaffold incluye:
- Headers de seguridad en Next.js
- Validación de datos con Zod
- Autenticación con Clerk
- Tipos seguros con TypeScript
- Environment variables validadas

## 📚 Documentación

- [README.md](../README.md) - Información general del proyecto
- [planificacion.md](planificacion.md) - Fases de desarrollo
- [arquitectura.md](arquitectura.md) - Decisiones técnicas
- [modelado-de-datos.md](modelado-de-datos.md) - Esquema BD
- [.claude/README.md](../.claude/README.md) - Agentes especializados
