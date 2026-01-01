# Plan del Sistema de Reservas - Foodzinder

## Estado Actual ✅

### Lo que YA funciona:
1. ✅ **Formulario público de reservas** - Los clientes pueden hacer reservas
2. ✅ **Panel de gestión para owners** - Ver y gestionar reservas
3. ✅ **Cambio de estado** - Pendiente → Confirmada → Completada/Cancelada
4. ✅ **Asignación manual de mesas** - Owner puede asignar mesa después de crear reserva
5. ✅ **Validaciones básicas** - Capacidad de mesa, permisos, etc.
6. ✅ **Validación de disponibilidad de mesas** - Sistema completo implementado
7. ✅ **Verificación de conflictos** - No permite reservas duplicadas en mismo horario
8. ✅ **UI inteligente de asignación** - Muestra mesas disponibles/ocupadas en tiempo real

### Bugs Identificados y Solucionados:
- ✅ **Bug de permisos**: Owners veían reservas de otros restaurantes → ARREGLADO
- ✅ **Bug de disponibilidad**: Se podían reservar múltiples veces la misma mesa → ARREGLADO

---

## ✅ COMPLETADO - Fase 1: Validación de Disponibilidad

### Implementado exitosamente:
1. ✅ **Función `checkTableAvailability()`** - Verifica conflictos de horarios
2. ✅ **Función `getAvailableTablesForBooking()`** - Obtiene mesas con estado de disponibilidad
3. ✅ **Validación en `createBooking()`** - Bloquea reservas si no hay mesas disponibles
4. ✅ **Validación en `assignTableToBooking()`** - Impide asignar mesas ocupadas
5. ✅ **UI mejorada en `AssignTableSelector`**:
   - Muestra disponibilidad en tiempo real al abrir el diálogo
   - Agrupa mesas por área del restaurante
   - Badges con contadores (X disponibles, Y ocupadas)
   - Mensajes claros cuando no hay disponibilidad
   - Loading state durante verificación

**Archivos modificados**:
- ✅ `src/server/actions/bookings.ts` - Lógica de validación
- ✅ `src/components/bookings/assign-table-selector.tsx` - UI inteligente
- ✅ `src/app/dashboard/restaurant-bookings/page.tsx` - Integración

---

## Problemas Pendientes 🔴

### 2. **Control de Disponibilidad por Owner**
**Problema**: Los clientes pueden reservar en cualquier horario, sin control del owner.

**Solución necesaria**:
- Sistema de "Slots de Reserva" configurable por owner
- Owner define:
  - ¿Qué días acepta reservas?
  - ¿Qué horarios están disponibles? (ej: solo cenas)
  - ¿Cuántas reservas simultáneas?
  - ¿Cuánto tiempo de antelación mínima/máxima?

**Nueva funcionalidad a implementar**:
```
BookingSlotConfig (YA existe en schema.prisma)
- slotName: "Almuerzo", "Cena"
- startTime/endTime
- duration: 90 minutos
- maxTables: límite de mesas
- daysOfWeek: [1,2,3,4,5] (Lun-Vie)
- isActive: true/false
```

**Archivos a crear**:
- `src/app/dashboard/restaurants/[id]/booking-settings/page.tsx` → Config de slots
- `src/components/dashboard/booking-slot-config.tsx` → Form de configuración

### 3. **Validación en Tiempo Real (WebSockets)**
**Problema**: Si dos personas reservan al mismo tiempo, pueden colisionar.

**Solución necesaria**:
- WebSocket para actualizar disponibilidad en tiempo real
- Optimistic locking (verificar antes de confirmar)
- Mostrar "alguien está reservando esta mesa" en tiempo real

**Tecnología sugerida**:
- **Pusher** (más fácil, servicio externo)
- **Socket.io** (propio servidor)
- **Ably** (alternativa a Pusher)

**Implementación**:
1. Cuando alguien abre el formulario → `booking.viewing.{restaurantId}.{date}.{time}`
2. Cuando selecciona mesa → `booking.tentative.{tableId}`
3. Al confirmar → validar que nadie más la reservó

---

## Flujo Completo del Sistema

### A. **Owner configura su restaurante**
1. Crea mesas (✅ HECHO)
2. Define horarios de apertura (✅ HECHO)
3. **Configura slots de reserva** (❌ PENDIENTE)
   - Ej: "Cena: 20:00-23:00, solo Vie-Sab, máximo 10 mesas"

### B. **Cliente hace reserva**
1. Entra a página del restaurante
2. Selecciona fecha/hora (solo slots disponibles) (⚠️ PARCIAL - falta validar slots)
3. Indica número de personas
4. Completa datos de contacto (✅ HECHO)
5. **Sistema verifica disponibilidad** (❌ PENDIENTE)
   - ¿Hay mesas disponibles para X personas?
   - ¿El slot está activo?
   - ¿No está lleno?
6. Crea reserva en estado PENDING (✅ HECHO)

### C. **Owner gestiona reserva**
1. Ve reserva en panel (✅ HECHO)
2. **Sistema sugiere mesa automáticamente** (❌ PENDIENTE - ahora es manual)
3. Owner confirma o rechaza (✅ HECHO)
4. Owner asigna mesa si no está asignada (✅ HECHO)
5. Marca como completada o no-show (✅ HECHO)

### D. **Validaciones en tiempo real**
1. Al abrir formulario → Mostrar solo horarios disponibles
2. Al seleccionar hora → Mostrar capacidad restante
3. Si otro cliente reserva → Actualizar disponibilidad (❌ PENDIENTE - WebSockets)

---

## Próximos Pasos - Orden de Implementación

### ✅ **Fase 1: Validación de Disponibilidad** (COMPLETADA)
**Prioridad**: 🔴 ALTA - ✅ COMPLETADA

**Tareas completadas**:
1. ✅ Crear función `checkTableAvailability(tableId, date, time, duration)`
2. ✅ Actualizar `assignTableToBooking` para verificar disponibilidad
3. ✅ Filtrar mesas ocupadas en `AssignTableSelector`
4. ✅ Mostrar mensaje si todas las mesas están ocupadas
5. ✅ Validar en `createBooking` antes de crear reserva
6. ✅ UI mejorada con badges y agrupación por áreas

**Archivos modificados**:
- ✅ `src/server/actions/bookings.ts`
- ✅ `src/components/bookings/assign-table-selector.tsx`

### **Fase 2: Sistema de Slots de Reserva** (IMPORTANTE)
**Prioridad**: 🟡 MEDIA
**Tiempo estimado**:

**Tareas**:
1. Página de configuración de slots para owners
2. Form para crear/editar slots
3. Validar reservas contra slots configurados
4. Mostrar solo slots disponibles en formulario público

**Archivos nuevos**:
- `src/app/dashboard/restaurants/[id]/booking-settings/page.tsx`
- `src/components/dashboard/booking-slots/slot-config-form.tsx`
- `src/server/actions/booking-slots.ts`

### **Fase 3: Auto-asignación de Mesas** (MEJORA)
**Prioridad**: 🟢 BAJA
**Tiempo estimado**:

**Tareas**:
1. Algoritmo de asignación automática:
   - Buscar mesa más pequeña que acomode al grupo
   - Priorizar mesas disponibles
   - Evitar desperdiciar mesas grandes
2. Sugerencia automática al owner (no obligatoria)

### **Fase 4: WebSockets / Tiempo Real** (OPCIONAL)
**Prioridad**: ⚪ FUTURA
**Tiempo estimado**:

**Tareas**:
1. Configurar Pusher o Socket.io
2. Eventos de disponibilidad en tiempo real
3. Bloqueo temporal de mesas durante proceso de reserva
4. Notificaciones al owner de nuevas reservas

---

## Decisiones de Diseño

### ¿Cómo funciona la disponibilidad?
**Opción A** (Actual - Básico):
- Owner asigna mesa DESPUÉS de recibir reserva
- No hay validación de disponibilidad previa
- Puede haber conflictos

**Opción B** (Recomendado):
- Sistema calcula disponibilidad en tiempo real
- Solo muestra horarios con mesas disponibles
- Owner puede sobreescribir si es necesario

**Opción C** (Avanzado):
- WebSockets para actualización en tiempo real
- Bloqueo temporal durante reserva
- Sistema inteligente de asignación

### Duración de Reservas
**Configuración sugerida**:
- Por defecto: 90 minutos
- Configurable por slot
- Ej: "Almuerzo: 60min", "Cena: 120min"

### Capacidad del Restaurante
**Dos enfoques**:
1. **Por mesas**: Max X mesas reservadas simultáneamente
2. **Por personas**: Max Y personas en el restaurante

---

## Preguntas para el Owner

1. **¿Quieres que el cliente elija mesa específica o solo pedir reserva?**
   - Actual: Cliente NO elige, owner asigna después
   - Alternativa: Cliente ve plano y elige mesa

2. **¿Cómo manejar overbooking?**
   - Permitir más reservas que mesas (con confirmación manual)
   - Bloquear cuando se llena

3. **¿Qué pasa si el cliente cancela?**
   - Liberar mesa automáticamente
   - Penalización / depósito

4. **¿Notificaciones?**
   - Email al cliente al confirmar
   - Email/SMS recordatorio 24h antes
   - Notificación al owner de nueva reserva

---

## Notas Técnicas

### Modelos de Base de Datos (Prisma)
Ya existen en el schema:
- ✅ `Booking` - Reservas
- ✅ `Table` - Mesas
- ✅ `BookingSlotConfig` - Configuración de horarios (NO USADO AÚN)
- ✅ `TableBlockSchedule` - Bloqueos temporales de mesas (NO USADO AÚN)
- ✅ `SpecialEvent` - Eventos especiales (NO USADO AÚN)

### Server Actions
Existentes:
- ✅ `createBooking()` - Crear reserva (con validación de disponibilidad)
- ✅ `updateBooking()` - Actualizar reserva
- ✅ `cancelBooking()` - Cancelar reserva
- ✅ `assignTableToBooking()` - Asignar mesa (con validación)
- ✅ `checkTableAvailability()` - Verificar disponibilidad de mesa
- ✅ `getAvailableTablesForBooking()` - Obtener mesas disponibles
- ✅ `getMyBookings()` - Reservas del usuario
- ✅ `getRestaurantBookings()` - Reservas de restaurantes del owner

Pendientes (Fase 2+):
- ❌ `getAvailableSlots()` - Obtener horarios disponibles según configuración
- ❌ `suggestTable()` - Sugerir mesa automáticamente (Fase 3)

---

## Resumen

**LO QUE FUNCIONA HOY**:
- ✅ Formulario de reservas básico
- ✅ Panel de gestión
- ✅ Asignación manual de mesas
- ✅ Cambios de estado
- ✅ **Validación completa de disponibilidad de mesas**
- ✅ **Verificación de conflictos de horarios**
- ✅ **UI inteligente con mesas disponibles/ocupadas**

**LO QUE FALTA (PRÓXIMAS FASES)**:
- 🟡 Configuración de slots por owner (Fase 2 - MEDIA PRIORIDAD)
- 🟡 Mostrar solo horarios disponibles según slots (Fase 2)
- 🟢 Auto-asignación inteligente de mesas (Fase 3 - BAJA PRIORIDAD)

**LO QUE FALTA (FUTURO)**:
- ⚪ WebSockets para tiempo real (Fase 4 - OPCIONAL)
- ⚪ Notificaciones automáticas por email
- ⚪ Integración con calendario externo
