# 🔑 Guía para Obtener Credenciales

Todas las credenciales que necesitas para desplegar Foodzinder con Easypanel.

---

## 1️⃣ Clerk (Autenticación) - GRATIS

**¿Para qué?** Login de usuarios, registro, autenticación.

### Obtener las claves:

1. Ve a: [https://dashboard.clerk.com](https://dashboard.clerk.com)
2. Crea una cuenta gratis
3. Click en **"Create Application"**
   - Nombre: `Foodzinder`
   - Selecciona métodos de login: Email, Google, etc.
4. Una vez creada, ve a **"API Keys"**
5. Copia:
   - `Publishable Key` → `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`
   - `Secret Key` → `CLERK_SECRET_KEY`
6. Para el webhook:
   - Ve a **"Webhooks"**
   - Click en **"Add Endpoint"**
   - URL: `https://tu-dominio.com/api/webhooks/clerk`
   - Events: Selecciona `user.created`, `user.updated`, `user.deleted`
   - Copia el **"Signing Secret"** → `CLERK_WEBHOOK_SECRET`

**Plan gratis incluye:**
- ✅ 10,000 usuarios activos mensuales
- ✅ Autenticación social (Google, GitHub, etc.)
- ✅ MFA (Multi-Factor Authentication)

---

## 2️⃣ Cloudinary (Imágenes) - GRATIS

**¿Para qué?** Upload y hosting de imágenes (logos, fotos de restaurantes, etc.)

### Obtener las claves:

1. Ve a: [https://cloudinary.com/users/register_free](https://cloudinary.com/users/register_free)
2. Regístrate gratis
3. Una vez dentro, ve al **Dashboard**
4. En la sección "Account Details" encontrarás:
   - `Cloud Name` → `NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME`
   - `API Key` → `CLOUDINARY_API_KEY`
   - `API Secret` → `CLOUDINARY_API_SECRET` (click en "Show")

**Plan gratis incluye:**
- ✅ 25GB de storage
- ✅ 25GB de bandwidth mensual
- ✅ Transformaciones de imágenes automáticas
- ✅ Optimización automática (WebP, AVIF)

---

## 3️⃣ Resend (Email) - GRATIS

**¿Para qué?** Enviar emails transaccionales (confirmación de reservas, bienvenida, etc.)

### Obtener las claves:

1. Ve a: [https://resend.com/signup](https://resend.com/signup)
2. Regístrate gratis
3. Confirma tu email
4. Ve a **"API Keys"**
5. Click en **"Create API Key"**
   - Nombre: `Foodzinder Production`
   - Permissions: `Full Access`
6. Copia la key → `RESEND_API_KEY`

**Plan gratis incluye:**
- ✅ 100 emails por día
- ✅ 3,000 emails por mes
- ✅ Todos los features incluidos

**Configurar dominio (opcional):**
1. Ve a **"Domains"**
2. Click en **"Add Domain"**
3. Agrega tu dominio (ej: `foodzinder.com`)
4. Sigue las instrucciones para agregar registros DNS

---

## 4️⃣ Stripe (Pagos) - GRATIS

**¿Para qué?** Procesar pagos de suscripciones de owners.

### Obtener las claves:

1. Ve a: [https://dashboard.stripe.com/register](https://dashboard.stripe.com/register)
2. Regístrate gratis
3. **IMPORTANTE**: Primero usa el modo TEST
4. Ve a **"Developers"** → **"API Keys"**
5. Copia (modo TEST):
   - `Publishable key` → `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY`
   - `Secret key` → `STRIPE_SECRET_KEY`
6. Para webhooks:
   - Ve a **"Developers"** → **"Webhooks"**
   - Click en **"Add endpoint"**
   - URL: `https://tu-dominio.com/api/webhooks/stripe`
   - Events: Selecciona todos los de `payment` y `customer`
   - Copia el **"Signing secret"** → `STRIPE_WEBHOOK_SECRET`

**Plan gratis incluye:**
- ✅ Modo test ilimitado
- ✅ Todos los métodos de pago
- ✅ Comisión solo cuando cobres (2.9% + $0.30 por transacción)

**Cuando vayas a producción:**
- Completa la verificación de cuenta
- Cambia las keys a modo LIVE
- Actualiza las variables en Easypanel

---

## 5️⃣ PostgreSQL - INCLUIDO EN EASYPANEL

**¿Para qué?** Base de datos principal.

Easypanel crea automáticamente una base de datos PostgreSQL cuando agregas el servicio.

**No necesitas credenciales externas.**

La `DATABASE_URL` será algo como:
```
postgresql://foodzinder:CONTRASEÑA_GENERADA@postgres:5432/foodzinder_db
```

---

## 6️⃣ Meilisearch - CONFIGURACIÓN MANUAL

**¿Para qué?** Búsqueda ultra-rápida de restaurantes.

### Opción A: Ejecutar en Easypanel (Recomendado)

Cuando crees el servicio de Meilisearch en Easypanel, tú defines:
- `MEILISEARCH_MASTER_KEY`: Cualquier string seguro (mínimo 16 caracteres)

**Ejemplo de master key segura:**
```
foodzinder_meili_prod_2026_ultra_secure_key_xyz123
```

### Opción B: Usar Meilisearch Cloud (Futuro)

1. Ve a: [https://cloud.meilisearch.com](https://cloud.meilisearch.com)
2. Regístrate (tienen plan gratis limitado)
3. Crea un proyecto
4. Copia la URL y master key

---

## 7️⃣ UploadThing (Alternativa a Cloudinary) - OPCIONAL

**¿Para qué?** Alternativa para upload de imágenes.

Solo si prefieres usar UploadThing en vez de Cloudinary.

1. Ve a: [https://uploadthing.com](https://uploadthing.com)
2. Regístrate con GitHub
3. Crea un proyecto
4. Ve a **"API Keys"**
5. Copia:
   - `Secret` → `UPLOADTHING_SECRET`
   - `App ID` → `UPLOADTHING_APP_ID`

---

## 8️⃣ Google Tag Manager (Analytics) - OPCIONAL

**¿Para qué?** Google Analytics, tracking de conversiones.

1. Ve a: [https://tagmanager.google.com](https://tagmanager.google.com)
2. Crea una cuenta
3. Crea un contenedor web
4. Copia el `Container ID` → `NEXT_PUBLIC_GTM_ID`
5. Formato: `GTM-XXXXXXX`

---

## 🎯 Resumen de Prioridades

### CRÍTICO (necesario para que funcione):
1. ✅ **Clerk** - Autenticación
2. ✅ **Cloudinary** - Imágenes
3. ✅ **PostgreSQL** - Base de datos (Easypanel lo crea)

### IMPORTANTE (para funcionalidad completa):
4. ✅ **Resend** - Emails
5. ✅ **Stripe** - Pagos (modo TEST primero)
6. ✅ **Meilisearch** - Búsqueda rápida

### OPCIONAL (mejoras):
7. ⏸️ UploadThing - Alternativa de imágenes
8. ⏸️ Google Tag Manager - Analytics
9. ⏸️ Bunny.net - CDN adicional

---

## 📝 Template de Variables Completo

Copia esto en un archivo de texto y ve llenando:

```env
# === CRÍTICO ===

# Clerk
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=
CLERK_SECRET_KEY=
CLERK_WEBHOOK_SECRET=

# Cloudinary
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=
CLOUDINARY_API_KEY=
CLOUDINARY_API_SECRET=

# PostgreSQL (Easypanel lo genera)
DATABASE_URL=postgresql://foodzinder:PASSWORD@postgres:5432/foodzinder_db

# === IMPORTANTE ===

# Resend
RESEND_API_KEY=

# Stripe (TEST mode)
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=

# Meilisearch
MEILISEARCH_MASTER_KEY=
NEXT_PUBLIC_MEILISEARCH_HOST=http://meilisearch:7700

# === OPCIONAL ===

# UploadThing
UPLOADTHING_SECRET=
UPLOADTHING_APP_ID=

# Google Tag Manager
NEXT_PUBLIC_GTM_ID=

# === CONFIGURACIÓN ===

NODE_ENV=production
NEXT_PUBLIC_APP_URL=https://tu-dominio.easypanel.host
NEXT_PUBLIC_FEATURE_FLAG_REVIEWS=true
NEXT_PUBLIC_FEATURE_FLAG_SUBSCRIPTIONS=true
NEXT_PUBLIC_FEATURE_FLAG_BOOKINGS=true
```

---

## ⏱️ Tiempo Estimado

- **Clerk**: 5 minutos
- **Cloudinary**: 3 minutos
- **Resend**: 3 minutos
- **Stripe**: 5 minutos (modo TEST)
- **Meilisearch**: 1 minuto (solo generar key)

**Total: ~20 minutos** para obtener todas las credenciales críticas.

---

## 🔐 Consejos de Seguridad

1. ✅ **NUNCA** compartas tus secret keys públicamente
2. ✅ **NUNCA** commitees las keys en Git
3. ✅ Usa contraseñas diferentes para cada servicio
4. ✅ Activa 2FA en todas las cuentas
5. ✅ Rota las keys cada 3-6 meses
6. ✅ Usa modo TEST de Stripe antes de LIVE

---

## 📞 Soporte de Servicios

- **Clerk**: https://clerk.com/support
- **Cloudinary**: https://support.cloudinary.com
- **Resend**: https://resend.com/docs
- **Stripe**: https://support.stripe.com
- **Meilisearch**: https://docs.meilisearch.com

---

**¿Listo?** Con todas estas credenciales, puedes desplegar Foodzinder completo en Easypanel. 🚀
