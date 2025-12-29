# 🍽️ Foodzinder - La Plataforma de Restaurantes con "Wow Effect"

## 📋 Descripción

Foodzinder es una plataforma moderna de descubrimiento y gestión de restaurantes. Permite a los propietarios de restaurantes gestionar sus negocios, mientras que los usuarios pueden descubrir nuevos lugares para comer con una experiencia visual impactante.

### Características Principales

- **Para Propietarios (Owners)**:
  - Gestión completa de restaurantes y menús
  - Sistema de suscripción y facturación automática
  - Analytics y estadísticas de desempeño
  - Integración con Stripe para pagos

- **Para Usuarios (Consumers)**:
  - Búsqueda avanzada con filtros
  - Geolocalización en mapa interactivo
  - Sistema de reseñas y calificaciones
  - Favoritos y lista de deseos
  - Experiencia visual "Wow"

## 🏗️ Stack Tecnológico

### Frontend
- **Framework**: Next.js 16 (App Router)
- **UI Library**: React 19
- **Styling**: Tailwind CSS + shadcn/ui
- **Animaciones**: Framer Motion
- **Formularios**: React Hook Form + Zod
- **Mapas**: OpenStreetMap (MapLibre)

### Backend
- **Runtime**: Next.js Server Actions
- **Lenguaje**: TypeScript (Strict Mode)
- **Base de Datos**: PostgreSQL v17
- **ORM**: Prisma
- **Validación**: Zod

### Servicios Externos
- **Auth**: Clerk
- **Pagos**: Stripe
- **CDN**: Bunny.net
- **Búsqueda**: Meilisearch
- **Email**: Resend
- **Redis**: Upstash (opcional)

## 🚀 Instalación y Configuración

### Requisitos Previos
- Node.js >= 18
- Bun >= 1.0 (opcional pero recomendado)
- PostgreSQL >= 14
- Git

### Pasos de Instalación

1. **Clonar el repositorio**
```bash
git clone <repo-url>
cd foodzinder-web
```

2. **Instalar dependencias**
```bash
bun install
# o
npm install
```

3. **Configurar variables de entorno**
```bash
cp .env.example .env
# Editar .env con tus valores
```

4. **Configurar la base de datos**
```bash
bun run db:generate  # Generar cliente Prisma
bun run db:push      # Crear esquema en DB
```

5. **Ejecutar en desarrollo**
```bash
bun run dev
# o
npm run dev
```

Abre [http://localhost:3000](http://localhost:3000) en tu navegador.

## 📁 Estructura del Proyecto

```
foodzinder-web/
├── src/
│   ├── app/                 # Rutas Next.js (App Router)
│   │   ├── (public)/       # Rutas públicas
│   │   ├── (auth)/         # Rutas de autenticación
│   │   ├── (dashboard)/    # Rutas protegidas
│   │   └── api/            # Webhooks y endpoints
│   ├── components/          # Componentes React
│   │   ├── ui/             # Componentes base (shadcn/ui)
│   │   └── features/       # Componentes de funcionalidades
│   ├── lib/                 # Utilidades y helpers
│   ├── server/              # Backend logic
│   │   ├── actions/        # Server Actions
│   │   └── queries/        # Data Access Layer
│   ├── types/               # TypeScript types globales
│   ├── hooks/               # Custom React hooks
│   └── styles/              # CSS global
├── prisma/
│   └── schema.prisma        # Esquema de base de datos
├── docs/                    # Documentación del proyecto
└── .claude/                 # Configuración de agentes IA
```

## 🔧 Scripts Disponibles

```bash
# Desarrollo
bun run dev              # Inicia servidor de desarrollo

# Producción
bun run build           # Compila el proyecto
bun run start           # Inicia servidor de producción

# Linting y Formato
bun run lint            # Ejecuta ESLint
bun run format          # Formatea código con Prettier
bun run type-check      # Valida tipos TypeScript

# Base de Datos
bun run db:generate     # Genera cliente Prisma
bun run db:push         # Sincroniza schema con DB
bun run db:seed         # Ejecuta seed de datos
bun run db:studio       # Abre Prisma Studio
```

## 🔐 Seguridad

- **Autenticación**: Clerk con soporte para MFA y social login
- **Autorización**: Row Level Security (RLS) en PostgreSQL
- **Validación**: Zod para validación estricta de datos
- **HTTPS**: Requerido en producción
- **Headers de Seguridad**: CSP, X-Frame-Options, etc.

## 📊 Modelo de Datos

Consulta [docs/modelado-de-datos.md](docs/modelado-de-datos.md) para más detalles.

**Entidades Principales:**
- Users (Extends Clerk)
- Restaurants
- Menus
- Dishes
- Reviews
- Subscriptions
- Invoices
- Taxonomies

## 🎨 Identidad Visual

- **Color Principal**: Rosa Vibrante (#FF6B9D)
- **Tipografía**: Sistema de fuentes moderna
- **Diseño**: Mobile First, totalmente responsive
- **Animaciones**: Micro-interacciones con Framer Motion

## 📚 Documentación

- [Planificación](docs/planificacion.md) - Fases de desarrollo
- [Arquitectura](docs/arquitectura.md) - Decisiones técnicas
- [Modelado de Datos](docs/modelado-de-datos.md) - Esquema BD
- [Agentes IA](.claude/README.md) - Configuración de agentes

## 🤖 Agentes Especializados

El proyecto utiliza agentes IA especializados para diferentes aspectos:

- **The Architect**: Orquestación y decisiones arquitectónicas
- **CoreAPI**: Desarrollo backend
- **PixelPerfect**: Desarrollo frontend
- **SchemaKeeper**: Gestión de base de datos
- **Sentinel**: Seguridad y compliance
- **GrowthBot**: SEO y analytics
- **BugHunter**: QA y testing
- **Scribe**: Documentación
- **OpsMaster**: DevOps e infraestructura

Consulta [.claude/README.md](.claude/README.md) para más detalles.

## 🚢 Despliegue

### Opciones de Hosting
- **Frontend**: Vercel (recomendado) o VPS
- **Backend**: Vercel Serverless o VPS con Node.js
- **Database**: Supabase o PostgreSQL en VPS
- **Infraestructura**: Easypanel para VPS

## 📝 Licencia

Privado - Foodzinder Inc.

## 🤝 Contacto

Para preguntas o contribuciones, contacta al equipo de desarrollo.

---

**Hecho con ❤️ por el Equipo de Foodzinder**
