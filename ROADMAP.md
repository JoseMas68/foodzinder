# FoodZinder - Roadmap de Funcionalidades

Comparación con TheFork y plan de implementación

## 📊 Estado Actual

### ✅ Implementado
- [x] Autenticación con Clerk
- [x] Base de datos con Prisma (PostgreSQL)
- [x] Roles de usuario (ADMIN, OWNER, USER)
- [x] Dashboard para OWNER
  - [x] CRUD de restaurantes
  - [x] Estadísticas básicas
- [x] Página principal con lista de restaurantes
- [x] Sistema de filtros (precio, tipo de cocina, rating)
- [x] Buscador con autocompletado
- [x] Vista de lista y mapa
- [x] Sistema de aprobación (PENDING → APPROVED)
- [x] Sistema de reviews en la base de datos

### ❌ Falta Implementar

## 🎯 Funcionalidades Críticas de TheFork

### 1. Página de Detalle del Restaurante
**Prioridad: CRÍTICA**

**TheFork tiene:**
- Galería de fotos (slider principal + thumbnails)
- Información completa:
  - Descripción del restaurante
  - Tipo de cocina
  - Rango de precio (€€€)
  - Dirección con mapa interactivo
  - Teléfono
  - Horarios de apertura
  - Website
- Sistema de reviews y valoraciones
  - Rating general (estrellas)
  - Número total de reviews
  - Reviews individuales con:
    - Nombre del usuario
    - Fecha
    - Puntuación (comida, servicio, ambiente)
    - Comentario
    - Fotos del usuario
  - Filtros de reviews (todas, recientes, mejor valoradas)
- Menú del restaurante
  - Diferentes menús disponibles
  - Platos con foto, descripción y precio
  - Alérgenos marcados
- Botón de "Añadir a favoritos"
- Botón principal de "Reservar"
- Promociones especiales destacadas
- Sección "Sobre el restaurante"
- Facilidades (WiFi, parking, terraza, etc.)

**Estado en FoodZinder:** ❌ NO EXISTE
**Archivo a crear:** `src/app/restaurants/[slug]/page.tsx`

---

### 2. Sistema de Reservas
**Prioridad: CRÍTICA**

**TheFork tiene:**
- Widget de reserva con:
  - Selector de fecha (calendario)
  - Número de comensales (dropdown)
  - Hora (slots disponibles)
  - Confirmación instantánea o pendiente
- Gestión de disponibilidad por franjas horarias
- Confirmación por email
- Recordatorio antes de la reserva
- Panel de gestión para el restaurante:
  - Ver reservas del día/semana/mes
  - Confirmar/cancelar reservas
  - Gestionar turnos y mesas
  - Bloquear horarios

**Estado en FoodZinder:** ❌ NO EXISTE
**Requiere:**
- Nueva tabla `Booking` en Prisma
- Nueva tabla `TimeSlot` o `Availability`
- Integración de calendario (react-day-picker o similar)
- Sistema de notificaciones por email

---

### 3. Sistema de Puntos/Recompensas
**Prioridad: MEDIA**

**TheFork tiene:**
- Programa Yums (puntos por reserva)
- Descuentos exclusivos
- Cashback en reservas
- Niveles de membresía (bronce, plata, oro)

**Estado en FoodZinder:** ❌ NO EXISTE
**Requiere:**
- Nueva tabla `LoyaltyPoints`
- Sistema de cálculo de puntos
- Página de "Mis Recompensas"

---

### 4. Perfiles de Usuario
**Prioridad: ALTA**

**TheFork tiene:**
- Página de perfil con:
  - Foto de perfil
  - Información personal
  - Preferencias alimentarias
  - Alergias
- Historial de reservas
- Mis restaurantes favoritos
- Mis reviews
- Configuración de notificaciones

**Estado en FoodZinder:** ❌ NO EXISTE
**Archivo a crear:** `src/app/profile/page.tsx`

---

### 5. Reviews y Fotos de Usuarios
**Prioridad: ALTA**

**TheFork tiene:**
- Sistema completo de reviews:
  - Solo usuarios que han reservado pueden opinar
  - Puntuación desglosada (comida, servicio, ambiente)
  - Subida de fotos
  - Respuestas del restaurante
  - Reportar reviews inapropiadas
  - Filtros y ordenación

**Estado en FoodZinder:**
- ✅ Tabla `Review` existe en base de datos
- ❌ NO hay interfaz para crear/ver reviews
**Archivos a crear:**
- `src/app/restaurants/[slug]/reviews/page.tsx`
- `src/components/features/review-form.tsx`
- `src/components/features/review-list.tsx`

---

### 6. Galería de Fotos del Restaurante
**Prioridad: ALTA**

**TheFork tiene:**
- Múltiples fotos del restaurante
- Categorías (platos, interior, exterior, ambiente)
- Subidas por el restaurante y por usuarios
- Viewer de galería con navegación

**Estado en FoodZinder:** ❌ NO EXISTE
**Requiere:**
- Nueva tabla `RestaurantPhoto` en Prisma
- Integración con Cloudinary o similar para storage
- Componente de galería (lightbox)

---

### 7. Menús Digitales
**Prioridad: ALTA**

**TheFork tiene:**
- Múltiples menús (carta, menú del día, menú degustación)
- Categorías de platos (entrantes, principales, postres)
- Fotos de platos
- Precio
- Alérgenos claramente marcados
- Descargable en PDF

**Estado en FoodZinder:**
- ✅ Tablas `Menu`, `Dish` existen en base de datos
- ❌ NO hay interfaz para gestionar/ver menús
**Archivos a crear:**
- `src/app/dashboard/menus/page.tsx` (gestión OWNER)
- `src/app/restaurants/[slug]/menu/page.tsx` (vista pública)
- `src/components/dashboard/menus/menu-form.tsx`

---

### 8. Búsqueda Avanzada y Filtros
**Prioridad: MEDIA**

**TheFork tiene:**
- Filtros múltiples:
  - Ubicación (mapa + radio)
  - Tipo de cocina (múltiple selección)
  - Precio
  - Disponibilidad (fecha/hora específica)
  - Características especiales (terraza, parking, WiFi)
  - Dietas especiales (vegano, sin gluten, etc.)
  - Promociones activas
- Guardar búsquedas
- Alertas de nuevos restaurantes

**Estado en FoodZinder:**
- ✅ Filtros básicos implementados
- ❌ Faltan filtros avanzados y guardar búsquedas

---

### 9. Promociones y Ofertas
**Prioridad: MEDIA**

**TheFork tiene:**
- Sistema de descuentos en tiempo real
- Ofertas especiales (2x1, -50%, etc.)
- Promociones por festividad
- Ofertas exclusivas para app móvil
- Banner de promociones en la página del restaurante

**Estado en FoodZinder:** ❌ NO EXISTE
**Requiere:**
- Nueva tabla `Promotion` en Prisma
- Sistema de cupones/códigos
- Lógica de aplicación de descuentos

---

### 10. Favoritos y Listas
**Prioridad: BAJA**

**TheFork tiene:**
- Guardar restaurantes favoritos
- Crear listas personalizadas ("Para probar", "Románticos", etc.)
- Compartir listas con amigos

**Estado en FoodZinder:**
- ✅ Tabla `Favorite` existe en base de datos
- ❌ NO hay interfaz para favoritos

---

### 11. Notificaciones
**Prioridad: MEDIA**

**TheFork tiene:**
- Email de confirmación de reserva
- Recordatorio 24h antes
- Confirmación de cancelación
- Ofertas personalizadas
- Newsletter

**Estado en FoodZinder:** ❌ NO EXISTE
**Requiere:**
- Integración con servicio de email (Resend, SendGrid)
- Templates de emails
- Sistema de preferencias de notificaciones

---

### 12. App Móvil / PWA
**Prioridad: BAJA**

**TheFork tiene:**
- App nativa iOS/Android
- Notificaciones push
- Escaneo de QR para menús
- Geolocalización

**Estado en FoodZinder:** ❌ NO EXISTE
**Opción:** Convertir a PWA (más simple que app nativa)

---

### 13. Dashboard de Administración
**Prioridad: ALTA**

**TheFork tiene (para restaurantes):**
- Gestión de reservas en tiempo real
- Calendario de disponibilidad
- Gestión de menús
- Ver y responder reviews
- Estadísticas detalladas:
  - Reservas por día/mes
  - Tasa de ocupación
  - Reviews promedio
  - Ingresos estimados
- Gestión de promociones
- Configuración del perfil del restaurante

**Estado en FoodZinder:**
- ✅ Dashboard básico para OWNER (solo CRUD restaurantes)
- ❌ Falta todo lo demás

**Para ADMIN:**
- ❌ No existe dashboard de admin
**Requiere:**
- `src/app/admin/page.tsx`
- Aprobación de restaurantes desde interfaz
- Moderación de reviews
- Estadísticas globales de la plataforma

---

### 14. Integración con Google Maps
**Prioridad: ALTA**

**TheFork tiene:**
- Mapa interactivo en cada restaurante
- Cómo llegar (direcciones)
- Vista de Street View
- Restaurantes cercanos

**Estado en FoodZinder:**
- ✅ Mapa básico implementado (vista lista)
- ❌ Falta integración completa en página de detalle

---

### 15. Sistema de Pagos
**Prioridad: MEDIA-BAJA**

**TheFork tiene:**
- Pago anticipado opcional
- Reservas con tarjeta de garantía
- Gestión de no-shows

**Estado en FoodZinder:**
- ✅ Stripe configurado en schema (para suscripciones)
- ❌ NO implementado para reservas/pagos

---

## 🚀 Plan de Implementación Sugerido

### FASE 1: Funcionalidades Core (2-3 semanas)
**Objetivo: Tener un MVP funcional**

1. **Página de Detalle del Restaurante** (Sprint 2.1)
   - Vista completa del restaurante
   - Galería de fotos
   - Información completa
   - Mapa integrado

2. **Sistema de Reviews** (Sprint 2.2)
   - Ver reviews existentes
   - Crear nueva review
   - Subir fotos
   - Sistema de valoración

3. **Gestión de Menús** (Sprint 2.3)
   - Dashboard para OWNER: crear/editar menús
   - Vista pública de menús
   - Categorías de platos
   - Alérgenos

### FASE 2: Reservas (2-3 semanas)
**Objetivo: Sistema de reservas funcional**

4. **Sistema de Reservas Básico** (Sprint 3.1)
   - Crear modelo de datos
   - Widget de reserva en frontend
   - Confirmación por email
   - Panel de gestión para OWNER

5. **Disponibilidad y Turnos** (Sprint 3.2)
   - Configurar horarios y turnos
   - Gestión de mesas
   - Bloqueo de horarios

### FASE 3: Funcionalidades Sociales (1-2 semanas)
**Objetivo: Engagement de usuarios**

6. **Perfiles de Usuario** (Sprint 4.1)
   - Página de perfil
   - Editar información
   - Ver historial

7. **Favoritos** (Sprint 4.2)
   - Guardar restaurantes
   - Ver mis favoritos

### FASE 4: Dashboard Completo (1-2 semanas)
**Objetivo: Herramientas para OWNER y ADMIN**

8. **Dashboard de OWNER Mejorado** (Sprint 5.1)
   - Estadísticas detalladas
   - Gestión de reservas
   - Responder reviews

9. **Dashboard de ADMIN** (Sprint 5.2)
   - Aprobar restaurantes desde UI
   - Moderar reviews
   - Estadísticas globales

### FASE 5: Optimizaciones y Extras (Ongoing)

10. **Promociones**
11. **Sistema de Puntos**
12. **Notificaciones avanzadas**
13. **PWA**
14. **Búsqueda avanzada**

---

## 📋 Próximos Pasos Inmediatos

### Sugerencia: Empezar con Sprint 2.1

**¿Quieres que empiece con la página de detalle del restaurante?**

Esto incluiría:
- Ver toda la información del restaurante
- Galería de fotos
- Mapa de ubicación
- Reviews (vista inicial, crear en siguiente sprint)
- Información de contacto y horarios

Esto daría una experiencia mucho más completa y sería la base para el resto de funcionalidades.

**Alternativa:**
Si prefieres priorizar otra funcionalidad (reviews, menús, reservas), dime y ajustamos el plan.
