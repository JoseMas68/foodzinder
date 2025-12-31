# 📅 Planificación del Proyecto: Foodzinder

Este documento describe las fases para el desarrollo de la aplicación web Foodzinder.

## Fase 1: Definición y Estrategia ✅ COMPLETADA

- [x] Definición de identidad visual y branding.
- [x] Elección del stack tecnológico.
- [x] Definición de roles y funcionalidades principales.
- [x] Creación de artefactos de arquitectura y modelo de datos.

## Fase 2: Configuración del Entorno ✅ COMPLETADA

- **Repositorio y CI/CD:**
  - [x] Configuración inicial de Git y GitHub.
  - [ ] Setup de GitHub Actions para deploy en preview.
- **Infraestructura Base:**
  - [x] Inicialización de Next.js 15 con npm.
  - [x] Configuración de Tailwind CSS y shadcn/ui.
  - [x] Configuración de linter y formateo (ESLint, Prettier).
- **Servicios Externos:**
  - [x] Setup de PostgreSQL v17 local.
  - [x] Configuración de Clerk (Auth).
  - [x] Configuración de Cloudinary (Media - reemplazo de Uploadthing).
  - [ ] Configuración inicial de Stripe (Sandbox).
  - [ ] Setup de Meilisearch (Docker/Cloud).

## Fase 3: Core y Autenticación ✅ COMPLETADA

- **Base de Datos:**
  - [x] Implementación del esquema Prisma completo.
  - [x] Migraciones iniciales.
  - [x] Seeds con datos de ejemplo (25 restaurantes).
- **Autenticación:**
  - [x] Integración de Clerk Provider.
  - [x] Webhooks de Clerk para sincronizar tabla `Users` en DB.
  - [x] Roles y Permisos (Middleware de protección de rutas).
- **Layouts Principales:**
  - [x] Layout público (Landing, Buscador).
  - [x] Layout de Dashboard (Sidebar, Header autenticado).

## Fase 4: Desarrollo de Funcionalidades (Sprints) 🔄 EN PROGRESO

### Sprint 1: Gestión de Restaurantes (Owners y Admins) ✅ COMPLETADO

- [x] CRUD de Restaurantes (Crear, Editar, Listar propios).
- [x] Formulario con validación (Zod + React Hook Form).
- [x] Gestión de horarios de apertura.
- [x] Selección de tipos de cocina (taxonomías).
- [x] Subida de imágenes (Logo y Cover) con Cloudinary.
- [x] Vista pública de restaurante individual.
- [x] **Gestión de Menús y Platos (CRUD completo)**.
- [x] **Asociación bidireccional menú ↔ restaurante**.
- [x] **Vista pública de menús en página de restaurante**.
- [ ] Flujo de Aprobación por Admin.

### Sprint 2: Experiencia de Usuario (Consumidores) 🔄 EN PROGRESO

**Completado:**
- [x] Home Page con listado de restaurantes.
- [x] Filtros por tipo de cocina y rango de precios.
- [x] Búsqueda básica de restaurantes.
- [x] Vista de detalle de Restaurante.
- [x] Sistema de rating (promedio de reseñas).
- [x] Mapa interactivo con OpenStreetMap/Leaflet.

**Pendiente:**
- [ ] Buscador avanzado con Meilisearch.
- [ ] Filtros por ubicación/distancia.
- [ ] Sistema de Reseñas (Crear, Listar, Editar propias).
- [ ] Sistema de Favoritos.

### Sprint 3: Suscripciones y Pagos (PENDIENTE)

- [ ] Integración de Stripe para planes de suscripción (Owners).
- [ ] Lógica de acceso restringido según plan.
- [ ] Sistema de cupones.
- [ ] Panel de facturación.

### Sprint 4: Social y Gamificación (PENDIENTE)

- [ ] Sistema de Reseñas mejorado (Texto + Fotos).
- [ ] Sistema de Favoritos/Deseos (Lista lateral).
- [ ] Lógica básica de Gamificación (Puntos).
- [ ] Perfil de usuario público.

## Fase 5: Optimización y Lanzamiento

- **SEO Técnico:** Metadatos dinámicos, Sitemap.
- **Analytics:** Google Tag Manager, Clarity.
- **Performance:** Optimización de imágenes, consulta a DB.
- **Testing Final:** QA manual y tests E2E críticos.
- **Deploy a Producción:** Configuración de VPS Hostinger + Easypanel.
