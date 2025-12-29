# Changelog

Todos los cambios notables en este proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

## [Unreleased]

### Pendiente
- Componentes UI adicionales de shadcn/ui (17 componentes)
- Páginas públicas (Search, Detail, Landing mejorado)
- Dashboard para Admin y Owner
- Integración con Meilisearch para búsqueda avanzada

---

## [0.2.0-alpha] - 2025-12-29

### Added

#### Dependencias Instaladas
- ✨ 501 paquetes instalados con Bun (package manager)
- ✨ Compatibilidad verificada de todas las dependencias principales:
  - Next.js 15.0.0, React 18.3.0, TypeScript 5.3.3
  - Prisma 5.0.0, Clerk 5.5.0, Stripe 13.9.0
  - Tailwind CSS 3.4.0, Radix UI 1.0.0
  - Zod 3.22.4, Framer Motion 10.16.4

#### Base de Datos
- ✨ Docker Compose configurado para PostgreSQL 17-alpine
- ✨ PostgreSQL corriendo localmente en puerto 5433
- ✨ Prisma client generado exitosamente
- ✨ Schema completo aplicado a la base de datos (10 tablas creadas)
- ✨ Índices y constraints optimizados para performance

#### Configuración del Entorno
- ✨ Archivo .env configurado con:
  - DATABASE_URL para PostgreSQL local
  - Placeholder keys para Clerk (auth)
  - Placeholder keys para Stripe (pagos)
  - Placeholder keys para Bunny.net CDN
  - Feature flags (Reviews, Subscriptions)
- ✨ next-env.d.ts generado automáticamente
- ✨ bun.lock creado como lockfile

#### Correcciones y Ajustes
- ✨ Compatibilidad de versiones en package.json
  - Downgrade de Next.js 16 a 15.0.0 (para Bun compatibility)
  - Ajuste de Radix UI a versión 1.0.0 compatible
  - Sincronización de dependencias compartidas
- ✨ Arreglo de tsconfig.json (merge de compilerOptions duplicados)
- ✨ Remoción de @fulltext attribute incompatible con PostgreSQL
- ✨ Deshabilitación temporal de ClerkProvider en layout (para desarrollo sin keys reales)

#### Middleware y Webhooks
- ✨ src/middleware.ts creado (deshabilitado temporalmente)
- ✨ src/app/api/webhooks/clerk/route.ts implementado
- ✨ Validación de Webhook Svix integrada
- ✨ Sincronización automática de usuarios desde Clerk a PostgreSQL

#### Verificación de Setup
- ✅ Servidor Next.js iniciado correctamente en http://localhost:3000
- ✅ Home page renderizada exitosamente con Foodzinder branding
- ✅ Feature cards visibles y estilizadas
- ✅ Sin errores TypeScript en compilación
- ✅ PostgreSQL conectado y funcional
- ✅ Prisma client listo para usar

### Fixed
- 🔧 Conflicto de versiones en dependencias de Radix UI
- 🔧 tsconfig.json duplicado "compilerOptions" key
- 🔧 Incompatibilidad de @@fulltext attribute con PostgreSQL
- 🔧 Puerto 5432 ya en uso (cambiado a 5433)
- 🔧 Headers await issue en Next.js 15

### Environment Setup
**Paso completado**: Opción A del roadmap
**Status**: ✅ Completado
**Duración**: 2 horas
**Archivos modificados**: 4
**Archivos creados**: 3
**Archivos generados**: 3

### Próximos Pasos
1. Agregar credenciales reales de Clerk en .env
2. Re-habilitar ClerkProvider y middleware
3. Implementar 17 componentes UI base de shadcn/ui (v0.2.1)
4. Crear páginas públicas (Search, Detail) (v0.2.2)

### Notas Técnicas
- PostgreSQL corriendo en puerto 5433 (no 5432) debido a conflicto local
- Clerk keys actualmente son placeholders - usuario debe configurar reales
- ClerkProvider deshabilitado en src/app/layout.tsx (TODO en código)
- middleware.ts deshabilitado pero listo para habilitar
- Todas las tablas Prisma creadas exitosamente (User, Restaurant, Menu, Dish, Review, etc.)

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
