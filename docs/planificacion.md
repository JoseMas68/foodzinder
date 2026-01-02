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
- [x] Gestión de mesas con filtros por estado (All/Active/Inactive).
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
- [x] Filtros por tipo de cocina y rango de precios (euros €).
- [x] **Filtros avanzados por características, opciones dietéticas y ambiente**.
- [x] **Filtro de valoración mínima con diseño vertical por checkboxes**.
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

- [x] Sistema de Reservas (Bookings) ✅ COMPLETADO (Fase 1):
  - [x] Modelo de datos Booking en Prisma
  - [x] Validaciones con Zod (bookingCreateSchema, bookingUpdateSchema)
  - [x] Server actions completas:
    - [x] createBooking (permite guests y usuarios autenticados)
    - [x] updateBooking (usuario, owner o admin)
    - [x] cancelBooking (usuario, owner o admin)
    - [x] getMyBookings (reservas del usuario)
    - [x] getRestaurantBookings (reservas de restaurantes del owner/admin)
    - [x] checkTableAvailability (verificar disponibilidad de mesa)
    - [x] getAvailableTablesForBooking (obtener mesas disponibles)
    - [x] assignTableToBooking (asignar mesa a reserva con validación)
  - [x] Componente BookingForm con validación
  - [x] Integración del formulario en página pública de restaurante
  - [x] Dashboard "Mis Reservas" (usuarios) con:
    - [x] Lista de próximas reservas (pendientes y confirmadas)
    - [x] Historial de reservas pasadas
    - [x] Botón para cancelar reservas
    - [x] Información completa de contacto y notas especiales
  - [x] Dashboard "Gestión de Reservas" (owners/admins) con:
    - [x] Vista de todas las reservas de sus restaurantes
    - [x] Filtros por restaurante y estado (BookingFilters component)
    - [x] Cambio de estado de reservas (selector dinámico)
    - [x] Asignación manual de mesas con selector inteligente
    - [x] Información completa del cliente
    - [x] Visualización de mesa asignada (número + área)
  - [x] **Dashboard "Todas las Reservas" (solo ADMIN)**:
    - [x] Vista global de todas las reservas de la plataforma
    - [x] Filtros por restaurante y estado
    - [x] Información del propietario de cada restaurante
    - [x] Estadísticas del sistema (total, pendientes, confirmadas, restaurantes)
    - [x] Optimización de rendimiento (límite de 50 reservas)
  - [x] Navegación en sidebar del dashboard reorganizada por roles:
    - [x] Sección común (Dashboard, Configuración)
    - [x] Sección USER (Favoritos, Reseñas, Mis Reservas)
    - [x] Sección OWNER (Restaurantes, Menús, Gestión de Reservas)
    - [x] Sección ADMIN (Moderación, Todas las Reservas, Page Builder)
  - [x] **Fase 1: Validación de Disponibilidad de Mesas ✅ COMPLETADO**:
    - [x] Verificación de conflictos de horarios (duración 90min)
    - [x] Validación al crear reserva (bloquea si no hay mesas)
    - [x] Validación al asignar mesa (impide sobreescribir reservas)
    - [x] UI mejorada mostrando mesas disponibles/ocupadas en tiempo real
    - [x] Contador de disponibilidad con badges
    - [x] Agrupación por áreas del restaurante
  - [x] **Fase 2: Sistema de Servicios y Turnos ✅ COMPLETADO** (estilo TheFork):
    - [x] Modelos de datos:
      - [x] BookingService (servicios: Cena, Comida, Brunch)
      - [x] BookingSlot (turnos por servicio con horarios variables)
      - [x] TableAvailability (control manual de disponibilidad por mesa/fecha/servicio)
      - [x] BookingReminder (recordatorios diarios configurables)
    - [x] Backend:
      - [x] Validaciones Zod completas con UUID
      - [x] Server actions CRUD para servicios y turnos
      - [x] Sistema de disponibilidad con 3 niveles de validación:
        - [x] Capacidad física de la mesa
        - [x] Disponibilidad manual (TableAvailability)
        - [x] Conflictos de horario con otras reservas
    - [x] Dashboard del Owner:
      - [x] Página de Servicios con listado y creación
      - [x] Diálogo para crear servicios con múltiples turnos
      - [x] Configuración de días activos por servicio
      - [x] Página de Disponibilidad con:
        - [x] Selector de fecha y servicio
        - [x] Toggle individual por mesa
        - [x] Acciones rápidas (todas disponibles/ninguna)
        - [x] Configuración de recordatorios diarios
    - [x] Formulario Público de Reservas:
      - [x] Selección de fecha → servicios disponibles ese día
      - [x] Selección de servicio → turnos del servicio
      - [x] Validación automática de capacidad antes de confirmar
      - [x] Cliente NO selecciona mesa (asignación posterior)
    - [x] Navegación integrada desde dashboard de restaurante
  - [x] **Fase 3: Auto-asignación de Mesas ✅ COMPLETADO**:
    - [x] Función `autoAssignTable()` que asigna mesa óptima
    - [x] Criterio: mesa más pequeña que pueda acomodar al grupo
    - [x] Botón "Asignar Automáticamente" en selector de mesas
    - [x] Solo se muestra cuando no hay mesa asignada
    - [x] Toast de confirmación con número de mesa asignada
  - [x] **Ordenamiento de Reservas**:
    - [x] Selector en filtros: "Más próximas primero" / "Más lejanas primero"
    - [x] Por defecto muestra próximas primero (ascendente)
    - [x] Integrado con sistema de filtros existente
  - [x] **Sistema de Notificaciones por Email ✅ COMPLETADO**:
    - [x] Integración con Resend para envío de emails
    - [x] Templates HTML responsive (BookingConfirmation, BookingCancelled, OwnerNewBooking)
    - [x] Email de confirmación al cliente al crear reserva
    - [x] Email de confirmación cuando owner confirma reserva (incluye mesa asignada)
    - [x] Email de cancelación al cliente
    - [x] Email de notificación al owner cuando recibe nueva reserva
    - [x] Envíos asíncronos (no bloquean la respuesta al usuario)
    - [x] Manejo de errores con logging
  - [ ] **Fase 4: WebSockets / Tiempo Real** (FUTURO - OPCIONAL):
    - [ ] Actualización en tiempo real de disponibilidad
    - [ ] Bloqueo temporal durante proceso de reserva
    - [ ] Notificaciones push a owners

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
