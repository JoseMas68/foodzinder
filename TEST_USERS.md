# 👥 Usuarios de Prueba - Foodzinder

Guía para crear y configurar usuarios de prueba con diferentes roles.

---

## 📋 Roles Disponibles

### 🔴 ADMIN
- **Permisos**: Acceso total a la plataforma
  - Gestión de todos los restaurantes
  - Moderación de contenido
  - Gestión de usuarios
  - Acceso a estadísticas globales

### 🟡 OWNER (Dueño de Restaurante)
- **Permisos**: Gestión de sus propios restaurantes
  - Crear y editar restaurantes
  - Gestionar menús y platos
  - Ver reservas
  - Gestionar mesas y disponibilidad
  - Personalizar plantillas de email

### 🟢 USER (Cliente)
- **Permisos**: Funcionalidades de cliente
  - Buscar y explorar restaurantes
  - Hacer reservas
  - Escribir reseñas
  - Guardar favoritos
  - Ver historial de reservas

---

## 🚀 Paso 1: Crear Usuarios en la Base de Datos

```bash
npm run db:create-test-users
```

Esto creará 3 usuarios en tu base de datos local:
- `admin@foodzinder.com` - ADMIN
- `owner@foodzinder.com` - OWNER
- `user@foodzinder.com` - USER

---

## 🔐 Paso 2: Crear Usuarios en Clerk

1. **Ve a Clerk Dashboard**: https://dashboard.clerk.com
2. **Navega a tu aplicación** "Foodzinder"
3. **Ve a "Users"** en el menú lateral
4. **Click en "Create User"** y crea los 3 usuarios:

   **Usuario 1 - ADMIN:**
   - Email: `admin@foodzinder.com`
   - First name: `Admin`
   - Last name: `Foodzinder`
   - Password: `Admin123!` (⚠️ Debe ser exactamente esta)

   **Usuario 2 - OWNER:**
   - Email: `owner@foodzinder.com`
   - First name: `Owner`
   - Last name: `Restaurant`
   - Password: `Owner123!` (⚠️ Debe ser exactamente esta)

   **Usuario 3 - USER:**
   - Email: `user@foodzinder.com`
   - First name: `Usuario`
   - Last name: `Prueba`
   - Password: `User123!` (⚠️ Debe ser exactamente esta)

5. **Copia el User ID** de cada usuario (empieza con `user_...`)
   - Click en cada usuario
   - Copia su "User ID" que aparece arriba

---

## 🔗 Paso 3: Sincronizar Clerk IDs

1. **Abre el archivo**: `scripts/update-clerk-ids.ts`

2. **Pega los Clerk IDs** que copiaste:
   ```typescript
   const CLERK_IDS = {
     admin: 'user_2abc123...', // Pega el Clerk ID del admin
     owner: 'user_2def456...', // Pega el Clerk ID del owner
     user: 'user_2ghi789...',  // Pega el Clerk ID del user
   };
   ```

3. **Ejecuta el script**:
   ```bash
   npm run db:update-clerk-ids
   ```

---

## ✅ Paso 4: Verificar que Funciona

1. **Inicia tu aplicación**:
   ```bash
   npm run dev
   ```

2. **Haz login** con cada usuario:
   - Navega a `http://localhost:3000`
   - Click en "Sign in"
   - Usa los emails y contraseñas que creaste

3. **Verifica permisos**:
   - **ADMIN**: Debería ver panel de administración
   - **OWNER**: Debería poder crear/editar restaurantes
   - **USER**: Solo debería ver funcionalidades de cliente

---

## 🎯 Credenciales por Defecto (si seguiste la guía)

| Rol | Email | Password | Permisos |
|-----|-------|----------|----------|
| 🔴 ADMIN | admin@foodzinder.com | TestAdmin123! | Todos |
| 🟡 OWNER | owner@foodzinder.com | TestOwner123! | Gestión de restaurantes |
| 🟢 USER | user@foodzinder.com | TestUser123! | Cliente |

---

## 🔧 Solución de Problemas

### No puedo hacer login
- ✅ Verifica que el usuario existe en Clerk Dashboard
- ✅ Verifica que ejecutaste `npm run db:update-clerk-ids`
- ✅ Verifica que los Clerk IDs son correctos

### El usuario no tiene los permisos correctos
- ✅ Verifica el rol en Prisma Studio: `npm run db:studio`
- ✅ Asegúrate de haber ejecutado `npm run db:create-test-users` primero

### Error "User not found"
- ✅ El webhook de Clerk no se ejecutó
- ✅ Ejecuta manualmente: `npm run db:create-test-users`
- ✅ Luego: `npm run db:update-clerk-ids`

---

## 📝 Comandos Útiles

```bash
# Crear usuarios de prueba en DB
npm run db:create-test-users

# Actualizar Clerk IDs después de crearlos en Clerk
npm run db:update-clerk-ids

# Ver usuarios en Prisma Studio
npm run db:studio

# Reiniciar todo y volver a empezar
npm run db:push
npm run db:create-test-users
# (luego crear en Clerk y ejecutar update-clerk-ids)
```

---

## 🚨 Importante para Producción

⚠️ **NUNCA uses estos usuarios de prueba en producción**

Para producción:
- Crea usuarios reales a través del flow normal de registro
- Asigna roles manualmente desde Prisma Studio o un panel admin
- Usa contraseñas seguras
- Habilita 2FA para admins

---

## 🎉 ¡Listo!

Ya tienes 3 usuarios de prueba con diferentes roles para testear tu aplicación.

¿Necesitas más usuarios? Solo ejecuta los scripts nuevamente con emails diferentes.
