# 🗺️ Roadmap - Foodzinder

Planificación estratégica del desarrollo de Foodzinder con fases, sprints y milestones.

## 📊 Visión General

```
Q1 2025: MVP Base        Q2 2025: Funcionalidades     Q3 2025: Escalado      Q4 2025: Optimización
[=========]              [==========]                 [========]              [======]
v0.1-v0.3              v0.4-v0.6                     v0.7-v0.8               v0.9-v1.0
```

---

## 🎯 Fase 1: Configuración Base (v0.1.0) ✅

**Estado**: Completado
**Commits**: d5185b3, de142e6, 3d0084e

### Hitos Alcanzados
- ✅ Scaffold Next.js completo
- ✅ Schema Prisma con todas las entidades
- ✅ Server Actions base
- ✅ Query functions para restaurantes
- ✅ Componentes base (Button, Layout)
- ✅ Documentación completa
- ✅ Agentes IA organizados en .claude/

### Archivos Clave Creados
- `src/app/layout.tsx` + `page.tsx`
- `src/server/actions/auth.ts`
- `src/server/queries/restaurants.ts`
- `prisma/schema.prisma`
- `README.md` + `docs/scaffold.md`

---

## 🚀 Fase 2: Páginas Públicas (v0.2.0 - v0.3.0)

**Duración Estimada**: 2-3 semanas
**Prioridad**: 🔴 Crítica

### v0.2.0: Búsqueda y Descubrimiento

#### Frontend
- [ ] Página de búsqueda con filtros avanzados
- [ ] Mapa interactivo (OpenStreetMap/MapLibre)
- [ ] Grid de restaurantes con cards hermosas
- [ ] Filtros por precio, tipo de comida, rating
- [ ] Buscador con autocomplete
- [ ] Paginación eficiente

#### Backend
- [ ] Server Action para búsqueda
- [ ] Integración inicial con Meilisearch
- [ ] Cacheo de resultados con Redis
- [ ] Rate limiting

#### Componentes UI
- [ ] SearchInput component
- [ ] RestaurantCard component
- [ ] FilterBar component
- [ ] Map component wrapper

### v0.3.0: Detalles y Reseñas

#### Frontend
- [ ] Página de detalle de restaurante
- [ ] Galería de imágenes con Bunny.net
- [ ] Sección de menús y platos
- [ ] Listado de reseñas
- [ ] Formulario de reseña (texto + fotos)
- [ ] Sistema de rating visual

#### Backend
- [ ] Query para obtener detalles completos
- [ ] Server Action para crear reseña
- [ ] Validación de reseñas
- [ ] Sincronización con Meilisearch

#### Componentes UI
- [ ] MenuSection component
- [ ] DishCard component
- [ ] ReviewCard component
- [ ] RatingWidget component
- [ ] ImageGallery component

---

## 💳 Fase 3: Sistema de Pagos (v0.4.0 - v0.5.0)

**Duración Estimada**: 3 semanas
**Prioridad**: 🔴 Crítica

### v0.4.0: Integración Stripe

#### Backend
- [ ] Setup de Stripe (keys y webhooks)
- [ ] Server Action para crear intención de pago
- [ ] Webhooks de Stripe para eventos
- [ ] Creación de facturas automáticas

#### Frontend
- [ ] Componente de formulario de pago
- [ ] Página de planes de suscripción
- [ ] Confirmación de pago
- [ ] Gestión de métodos de pago

#### Seguridad
- [ ] Validación de datos de pago con Zod
- [ ] Encriptación de datos sensibles
- [ ] PCI compliance checks

### v0.5.0: Billing y Facturas

#### Backend
- [ ] Cálculo automático de IVA
- [ ] Generación de PDFs de facturas
- [ ] Sistema de cupones/descuentos
- [ ] Renovación automática de suscripciones
- [ ] Facturación fiscal (España)

#### Frontend
- [ ] Dashboard de facturas
- [ ] Historial de transacciones
- [ ] Gestión de métodos de pago
- [ ] Descarga de facturas

---

## 👤 Fase 4: Dashboard Owner (v0.6.0 - v0.7.0)

**Duración Estimada**: 3 semanas
**Prioridad**: 🔴 Crítica

### v0.6.0: CRUD de Restaurantes

#### Frontend
- [ ] Layout de dashboard con sidebar
- [ ] Página de lista de restaurantes
- [ ] Formulario de crear restaurante
- [ ] Formulario de editar restaurante
- [ ] Uploader de imágenes (logo, cover)
- [ ] Preview de cambios

#### Backend
- [ ] Server Actions para CRUD de restaurantes
- [ ] Validación de datos del restaurante
- [ ] Generación automática de slug
- [ ] Integración con Bunny.net para imágenes

#### Seguridad
- [ ] Verificación de ownership
- [ ] Rate limiting en creaciones

### v0.7.0: Gestión de Menús y Platos

#### Frontend
- [ ] Página de menús por restaurante
- [ ] Formulario de crear menú
- [ ] Listado de platos en menú
- [ ] Formulario de crear/editar plato
- [ ] Reordenamiento de platos (drag & drop)
- [ ] Uploader de fotos de platos

#### Backend
- [ ] Server Actions para CRUD de menús
- [ ] Server Actions para CRUD de platos
- [ ] Validación completa con Zod
- [ ] Caché invalidación

---

## 📈 Fase 5: Admin Dashboard (v0.8.0)

**Duración Estimada**: 2 semanas
**Prioridad**: 🟠 Importante

### Features
- [ ] Panel de aprobación de restaurantes
- [ ] Gestión de usuarios y roles
- [ ] Analytics global
- [ ] Moderación de reseñas
- [ ] Gestión de taxonomías
- [ ] Sistema de reportes

---

## ⭐ Fase 6: Funcionalidades Sociales (v0.9.0)

**Duración Estimada**: 2 semanas
**Prioridad**: 🟡 Media

### Features
- [ ] Sistema de favoritos
- [ ] Seguimiento de usuarios
- [ ] Feed social
- [ ] Notificaciones
- [ ] Sistema de gamificación (puntos)
- [ ] Badges y logros

---

## 🎯 Fase 7: SEO y Performance (v1.0.0)

**Duración Estimada**: 2 semanas
**Prioridad**: 🟠 Importante

### SEO
- [ ] Metadatos dinámicos por página
- [ ] Sitemap automático
- [ ] robots.txt
- [ ] JSON-LD schema para restaurantes
- [ ] Open Graph tags

### Performance
- [ ] Image optimization
- [ ] Code splitting
- [ ] Bundle analysis
- [ ] Core Web Vitals optimization
- [ ] Database query optimization

### Analytics
- [ ] Google Tag Manager setup
- [ ] Google Analytics 4 events
- [ ] Hotjar integration
- [ ] Conversion tracking

---

## 🚀 Lanzamiento a Producción (v1.0.0)

**Duración Estimada**: 1 semana
**Prioridad**: 🔴 Crítica

### Tareas
- [ ] Testing final (E2E, UI)
- [ ] Security audit completo
- [ ] Performance testing
- [ ] Load testing
- [ ] Setup de Sentry para error tracking
- [ ] CI/CD pipeline en GitHub Actions
- [ ] Deploy a VPS (Hostinger + Easypanel)
- [ ] DNS y certificado SSL
- [ ] Backup y recovery plan

---

## 📋 Próximas Versiones Post-MVP

### v1.1.0: Mobile App
- React Native / Flutter
- Push notifications
- Offline mode

### v1.2.0: Advanced Search
- Búsqueda por voz
- IA recommendations
- Trending restaurants

### v1.3.0: Delivery Integration
- Integración con servicios de delivery
- Tracking en tiempo real

### v2.0.0: B2B Features
- API pública para partners
- Webhooks custom
- Advanced analytics

---

## 📊 Métricas de Progreso

### Cobertura de Sprints
```
Fase 1: ████████████████████ 100% (Completado)
Fase 2: ░░░░░░░░░░░░░░░░░░░░   0% (Por iniciar)
Fase 3: ░░░░░░░░░░░░░░░░░░░░   0% (Por iniciar)
Fase 4: ░░░░░░░░░░░░░░░░░░░░   0% (Por iniciar)
Fase 5: ░░░░░░░░░░░░░░░░░░░░   0% (Por iniciar)
Fase 6: ░░░░░░░░░░░░░░░░░░░░   0% (Por iniciar)
Fase 7: ░░░░░░░░░░░░░░░░░░░░   0% (Por iniciar)
```

### Timeline
```
Semana 1-2:   Fase 1 ✅
Semana 3-5:   Fase 2
Semana 6-8:   Fase 3
Semana 9-11:  Fase 4
Semana 12:    Fase 5
Semana 13:    Fase 6
Semana 14-15: Fase 7
Semana 16:    MVP Lanzamiento
```

---

## 🎨 Dependencias Entre Fases

```
Fase 1 (Scaffold)
   ↓
   ├→ Fase 2 (Búsqueda)
   │   ↓
   │   └→ Fase 3 (Admin)
   │
   ├→ Fase 2 (Búsqueda)
   │   ↓
   │   └→ Fase 4 (Owner Dashboard)
   │       ↓
   │       └→ Fase 5 (Pagos)
   │
   └→ Fase 6 (Social)
       ↓
       └→ Fase 7 (SEO & Perf)
           ↓
           └→ Lanzamiento (v1.0.0)
```

---

## ⚠️ Riesgos y Contingencias

| Riesgo | Probabilidad | Impacto | Mitigation |
|--------|-------------|---------|-----------|
| Delays en Stripe setup | Media | Alto | Tener dev keys listas |
| Performance issues | Media | Alto | Profiling temprano |
| Cambios de scope | Alta | Medio | MVP claro y limitado |
| Issues de Clerk webhooks | Baja | Medio | Testing exhaustivo |

---

## 📞 Contacto y Escalación

- **Product Lead**: Daniel (daniel@codeia.academy)
- **Tech Lead**: DevTeam (.claude/)
- **Issues Críticos**: Slack #foodzinder-critical

