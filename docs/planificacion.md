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
- [x] **Sistema completo de Taxonomías (58 taxonomías en 4 categorías)**:
  - [x] CUISINE_TYPE (20): Española, Italiana, Japonesa, China, etc.
  - [x] RESTAURANT_FEATURE (17): Terraza, Jardín, Parking, WiFi, etc.
  - [x] DIETARY (8): Vegetariano, Vegano, Sin gluten, etc.
  - [x] AMBIANCE (13): Romántico, Familiar, Casual, Elegante, etc.
  - [x] Componente reutilizable TaxonomySelector con checkboxes
  - [x] Integración en formularios de creación/edición de restaurantes
  - [x] Script de auto-asignación de taxonomías a restaurantes existentes
  - [x] Filtros expandidos en Page Builder (40+ opciones con emojis)
- [x] Subida de imágenes (Logo y Cover) con Cloudinary.
- [x] Vista pública de restaurante individual.
- [x] **Gestión de Menús y Platos (CRUD completo)**.
- [x] **Asociación bidireccional menú ↔ restaurante**.
- [x] **Vista pública de menús en página de restaurante**.
- [ ] Flujo de Aprobación por Admin.

### Sprint 2: Experiencia de Usuario (Consumidores) 🔄 EN PROGRESO

**Completado:**
- [x] Home Page con listado de restaurantes.
- [x] **Page Builder dinámico con secciones configurables**:
  - [x] Hero Section personalizable
  - [x] Secciones de carruseles de restaurantes
  - [x] Filtros por taxonomías (40+ opciones)
  - [x] Gestión visual de secciones (crear, editar, reordenar, eliminar)
- [x] Filtros por tipo de cocina y rango de precios.
- [x] **Filtros avanzados por características, opciones dietéticas y ambiente**.
- [x] Búsqueda básica de restaurantes.
- [x] Vista de detalle de Restaurante.
- [x] Sistema de rating (promedio de reseñas).
- [x] **Mapa interactivo mejorado con OpenStreetMap/Leaflet**:
  - [x] Toggle Lista/Mapa con animación deslizante
  - [x] Tooltips en marcadores con nombre y rating
  - [x] Panel lateral con lista completa de restaurantes
  - [x] Carga dinámica (1000 restaurantes en vista mapa, 12 en lista paginada)
  - [x] Botones de paginación estilizados (rosa primary)

**Completado:**
- [x] Sistema de Reseñas completo:
  - [x] CRUD de reseñas (crear, editar, eliminar)
  - [x] Vista en página pública de restaurante
  - [x] Dashboard de "Mis Reseñas"
  - [x] Validación con Zod
  - [x] Solo una reseña por usuario por restaurante
  - [x] Calificación con estrellas (1-5)

- [x] Sistema de Favoritos completo:
  - [x] Guardar/quitar restaurantes de favoritos
  - [x] Botón de favorito en página de detalle
  - [x] Dashboard de "Mis Favoritos"
  - [x] Indicador visual (corazón relleno)
  - [x] Sign-in prompt para no autenticados

- [x] Sistema de Reservas (Bookings) ✅ COMPLETADO:
  - [x] Modelo de datos Booking en Prisma
  - [x] Validaciones con Zod (bookingCreateSchema, bookingUpdateSchema)
  - [x] Server actions completas:
    - [x] createBooking (permite guests y usuarios autenticados)
    - [x] updateBooking (usuario, owner o admin)
    - [x] cancelBooking (usuario, owner o admin)
    - [x] getMyBookings (reservas del usuario)
    - [x] getRestaurantBookings (reservas de restaurantes del owner/admin)
  - [x] Componente BookingForm con validación
  - [x] Integración del formulario en página pública de restaurante
  - [x] Dashboard "Mis Reservas" (usuarios) con:
    - [x] Lista de próximas reservas (pendientes y confirmadas)
    - [x] Historial de reservas pasadas
    - [x] Botón para cancelar reservas
    - [x] Información completa de contacto y notas especiales
  - [x] Dashboard "Gestión de Reservas" (owners/admins) con:
    - [x] Vista de todas las reservas de sus restaurantes
    - [x] Filtros por restaurante y estado
    - [x] Cambio de estado de reservas (selector dinámico)
    - [x] Información completa del cliente
  - [x] Navegación en sidebar del dashboard
  - [ ] Sistema de notificaciones por email
  - [ ] Validación de disponibilidad y horarios en tiempo real

**Pendiente:**
- [ ] Buscador avanzado con Meilisearch.
- [ ] Filtros por ubicación/distancia.

### Sprint 3: Suscripciones y Pagos (PENDIENTE)

- [ ] Integración de Stripe para planes de suscripción (Owners).
- [ ] Lógica de acceso restringido según plan.
- [ ] Sistema de cupones.
- [ ] Panel de facturación.

### Sprint 4: Social y Gamificación 🔄 EN PROGRESO

- [x] Sistema de Reseñas básico (implementado en Sprint 2).
- [ ] Sistema de Reseñas mejorado (añadir fotos a las reseñas).
- [x] Sistema de Favoritos (implementado en Sprint 2).
- [ ] Lógica básica de Gamificación (Puntos).
- [ ] Perfil de usuario público.
- [ ] Sistema de seguimiento de usuarios.
- [ ] Actividad social (feed de reseñas de usuarios seguidos).

## Fase 5: Optimización y Lanzamiento

- **SEO Técnico:** Metadatos dinámicos, Sitemap.
- **Analytics:** Google Tag Manager, Clarity.
- **Performance:** Optimización de imágenes, consulta a DB.
- **Testing Final:** QA manual y tests E2E críticos.
- **Deploy a Producción:** Configuración de VPS Hostinger + Easypanel.
