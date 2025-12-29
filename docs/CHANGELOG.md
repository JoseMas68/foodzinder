# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Pendiente
- Instalación de dependencias y setup de servicios externos
- Componentes UI adicionales de shadcn/ui
- Páginas públicas (Landing, Search, Detail)
- Dashboard para Admin y Owner
- Integración de APIs

---

## [0.1.1] - 2025-12-29

### Added
- ✨ CHANGELOG.md con semantic versioning
- ✨ ROADMAP.md con 7 fases de desarrollo hasta v1.0.0
- ✨ IDEA-BOARD.md con 50+ ideas categorizadas

### Documentation
- Tracking de versiones con semver
- Timeline de desarrollo planificado
- Ideas priorizadas para futuro

---

## [0.1.0] - 2025-12-29

### Added

#### Scaffold Base
- ✨ Estructura completa del proyecto Next.js 16
- ✨ Configuración de TypeScript (Strict Mode)
- ✨ Setup de Tailwind CSS con tema personalizado
- ✨ Configuración de ESLint y Prettier
- ✨ Variables de entorno con validación Zod

#### Base de Datos
- ✨ Schema Prisma completo con 10 entidades:
  - User (extendido de Clerk)
  - Restaurant, Menu, Dish
  - Review, Subscription, Invoice
  - Taxonomy, Favorite, AuditLog
- ✨ Relaciones completamente definidas
- ✨ Índices para optimización
- ✨ Enums y tipos nativos PostgreSQL

#### Frontend
- ✨ Layout raíz con Clerk Provider
- ✨ Home page con hero section y features preview
- ✨ Componente Button base (shadcn/ui)
- ✨ Estilos globales con CSS variables
- ✨ Sistema de colores (Rosa Vibrante primario)

#### Backend
- ✨ Server Actions para autenticación:
  - Sincronización con Clerk
  - Verificación de roles (Admin, Owner, User)
- ✨ Query functions para restaurantes:
  - Listar con paginación
  - Búsqueda por slug
  - Estadísticas
- ✨ Validaciones con Zod (Users, Restaurants, Menus, Dishes, Reviews, Billing)
- ✨ Prisma client singleton

#### Documentación
- ✨ README.md completo
- ✨ docs/scaffold.md con estructura del proyecto
- ✨ .claude/ carpeta con 9 agentes especializados
- ✨ .env.example con todas las variables requeridas

### Stack Tecnológico
- Next.js 16 (App Router)
- React 19
- TypeScript (Strict Mode)
- Tailwind CSS + shadcn/ui
- Framer Motion
- Prisma + PostgreSQL v17
- Clerk (Auth)
- Stripe (Payments)
- Zod (Validation)
- React Hook Form

### Commits
- d5185b3: feat: crear carpeta .claude con agentes centralizados
- de142e6: feat: implementar scaffold completo de Foodzinder
- 3d0084e: docs: agregar documentación del scaffold

---

## Notas

### Versionado Semántico
- **MAJOR** (X.0.0): Cambios incompatibles en API o arquitectura
- **MINOR** (0.X.0): Nuevas funcionalidades compatibles hacia atrás
- **PATCH** (0.0.X): Bug fixes y mejoras menores

### Próximas Versiones Planeadas
- **0.2.0**: Páginas públicas y búsqueda
- **0.3.0**: Dashboard de Owner
- **0.4.0**: Sistema de pagos
- **0.5.0**: Reseñas y comunidad
- **1.0.0**: MVP producción

