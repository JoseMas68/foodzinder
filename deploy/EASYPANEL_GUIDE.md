# 🚀 Guía de Despliegue con Easypanel

Guía paso a paso para desplegar Foodzinder en tu VPS (207.180.203.22) usando Easypanel.

---

## 📋 ¿Qué es Easypanel?

Easypanel es un panel de control moderno para VPS que facilita el despliegue de aplicaciones con Docker. Es como tener un Vercel/Railway pero en tu propio servidor.

**Ventajas:**
- ✅ Interfaz visual amigable
- ✅ Deploy desde GitHub automático
- ✅ Base de datos PostgreSQL con un click
- ✅ SSL automático con Let's Encrypt
- ✅ Logs en tiempo real
- ✅ Terminal integrado

---

## 🔧 Paso 1: Instalar Easypanel en tu VPS

### 1.1. Conectarse al VPS

```bash
ssh root@207.180.203.22
```

### 1.2. Instalar Easypanel

```bash
# Ejecutar el instalador oficial de Easypanel
curl -sSL https://get.easypanel.io | sh
```

Esto instalará:
- Docker y Docker Compose
- Easypanel (panel de control)
- Traefik (proxy reverso automático)

**Tiempo estimado:** 3-5 minutos

### 1.3. Acceder a Easypanel

Una vez instalado, abre en tu navegador:

```
http://207.180.203.22:3000
```

**Primera vez:**
1. Crea tu usuario admin
2. Configura una contraseña segura
3. ¡Listo! Ya estás en Easypanel

---

## 📦 Paso 2: Crear el Proyecto en Easypanel

### 2.1. Crear nuevo proyecto

1. Click en **"Create Project"**
2. Nombre del proyecto: `foodzinder`
3. Click en **"Create"**

### 2.2. Agregar servicio de Base de Datos

1. Dentro del proyecto, click **"Add Service"**
2. Selecciona **"Database"** → **"PostgreSQL"**
3. Configuración:
   - **Name**: `postgres`
   - **PostgreSQL Version**: `17` (o la más reciente)
   - **Database Name**: `foodzinder_db`
   - **Username**: `foodzinder`
   - **Password**: Genera una contraseña segura (cópiala, la necesitarás)
4. Click en **"Create"**

**Espera 1-2 minutos** a que PostgreSQL esté listo (verde).

### 2.3. Agregar servicio de Meilisearch (Opcional pero recomendado)

1. Click **"Add Service"** → **"App"**
2. Configuración:
   - **Name**: `meilisearch`
   - **Source**: **"Docker Image"**
   - **Image**: `getmeili/meilisearch:v1.11`
   - **Port**: `7700`
   - **Environment Variables**:
     ```
     MEILI_ENV=production
     MEILI_MASTER_KEY=tu_master_key_muy_segura_aqui
     MEILI_NO_ANALYTICS=true
     ```
   - **Volumes**:
     - Mount Path: `/meili_data`
     - Click "Add Volume"
3. Click en **"Create"**

---

## 🎯 Paso 3: Desplegar la App desde GitHub

### 3.1. Conectar GitHub

1. En Easypanel, click **"Add Service"** → **"App"**
2. Selecciona **"From GitHub"**
3. Si es la primera vez:
   - Click **"Connect GitHub"**
   - Autoriza Easypanel
   - Selecciona tu repositorio `foodzinder-web`
4. Configuración básica:
   - **Name**: `app`
   - **Branch**: `main`
   - **Auto Deploy**: ✅ Activado (deploy automático en push)

### 3.2. Configurar Build

En la sección **"Build"**:

```yaml
Build Method: Nixpacks (automático)
# O si prefieres Dockerfile:
Build Method: Dockerfile
Dockerfile Path: ./Dockerfile
```

**Build Command** (si usas Nixpacks):
```bash
npm install && npx prisma generate && npm run build
```

**Start Command**:
```bash
npm start
```

**Port**: `3000`

### 3.3. Configurar Variables de Entorno

En la sección **"Environment"**, copia y pega las variables del archivo `EASYPANEL_ENV.txt`:

**Variables CRÍTICAS que DEBES cambiar:**

```env
NODE_ENV=production

# URL de tu app (Easypanel te dará una automática)
NEXT_PUBLIC_APP_URL=https://foodzinder.tu-dominio-easypanel.host

# Base de datos (usa la que creaste en el paso 2.2)
DATABASE_URL=postgresql://foodzinder:TU_CONTRASEÑA_POSTGRES@postgres:5432/foodzinder_db

# Clerk (https://dashboard.clerk.com)
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_live_xxxxxx
CLERK_SECRET_KEY=sk_live_xxxxxx
CLERK_WEBHOOK_SECRET=whsec_xxxxxx

# Cloudinary (https://cloudinary.com/console)
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=tu-cloud-name
CLOUDINARY_API_KEY=xxxxxx
CLOUDINARY_API_SECRET=xxxxxx

# Meilisearch
NEXT_PUBLIC_MEILISEARCH_HOST=http://meilisearch:7700
MEILISEARCH_MASTER_KEY=tu_master_key_de_antes

# Resend (https://resend.com/api-keys)
RESEND_API_KEY=re_xxxxxx

# Stripe (https://dashboard.stripe.com/apikeys)
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=pk_live_xxxxxx
STRIPE_SECRET_KEY=sk_live_xxxxxx
STRIPE_WEBHOOK_SECRET=whsec_xxxxxx

# Feature Flags
NEXT_PUBLIC_FEATURE_FLAG_REVIEWS=true
NEXT_PUBLIC_FEATURE_FLAG_SUBSCRIPTIONS=true
NEXT_PUBLIC_FEATURE_FLAG_BOOKINGS=true
```

### 3.4. Configurar Dominio

En la sección **"Domains"**:

**Opción A: Usar dominio de Easypanel (automático)**
- Easypanel te da un dominio gratis: `foodzinder-xxxxx.easypanel.host`
- SSL automático incluido

**Opción B: Usar tu dominio propio**
1. En tu proveedor DNS, crea un registro:
   ```
   Tipo: A
   Nombre: @ (o el subdominio que quieras)
   Valor: 207.180.203.22
   TTL: 3600
   ```
2. En Easypanel:
   - Click **"Add Domain"**
   - Ingresa tu dominio: `tudominio.com`
   - Activa **"Enable SSL"** (Let's Encrypt automático)
   - Click **"Add"**

### 3.5. Deploy!

1. Click en **"Deploy"** (botón grande arriba a la derecha)
2. Easypanel empezará a:
   - ✅ Clonar tu repo
   - ✅ Instalar dependencias
   - ✅ Build de Next.js
   - ✅ Iniciar la app
   - ✅ Configurar SSL

**Tiempo estimado:** 5-10 minutos (primer deploy)

---

## 🔄 Paso 4: Ejecutar Migraciones

Una vez que la app esté desplegada (estado verde):

1. En Easypanel, ve a tu servicio `app`
2. Click en la pestaña **"Terminal"**
3. Ejecuta:

```bash
# Generar cliente de Prisma
npx prisma generate

# Ejecutar migraciones (crear tablas)
npx prisma db push

# Opcional: Seed de datos iniciales
npm run db:seed
```

---

## ✅ Paso 5: Verificar que Funciona

### 5.1. Verificar la App

Abre tu dominio en el navegador:
```
https://foodzinder-xxxxx.easypanel.host
```

Deberías ver la página principal de Foodzinder.

### 5.2. Verificar Logs

En Easypanel:
1. Ve a tu servicio `app`
2. Click en **"Logs"**
3. Deberías ver:
   ```
   ▲ Next.js 15.0.0
   - Local:        http://localhost:3000
   - Ready in XXXms
   ```

### 5.3. Verificar Base de Datos

En la terminal de Easypanel:

```bash
# Conectar a PostgreSQL
psql $DATABASE_URL

# Ver tablas
\dt

# Deberías ver: User, Restaurant, Menu, etc.

# Salir
\q
```

---

## 🔄 Despliegue Automático

Una vez configurado, cada vez que hagas:

```bash
git push origin main
```

Easypanel automáticamente:
1. ✅ Detecta el cambio
2. ✅ Build de la nueva versión
3. ✅ Deploy sin downtime
4. ✅ Rollback automático si falla

---

## 🛠️ Comandos Útiles

### Ver Logs en Tiempo Real

En Easypanel → `app` → **"Logs"** → Click en **"Follow"**

### Reiniciar la App

En Easypanel → `app` → **"Restart"**

### Ejecutar Comandos

En Easypanel → `app` → **"Terminal"**:

```bash
# Ver variables de entorno
env | grep NEXT

# Ejecutar migraciones
npx prisma migrate deploy

# Ver versión de Node
node -v

# Ver espacio en disco
df -h
```

### Backup de Base de Datos

En Easypanel → `postgres` → **"Backups"**:
- Click **"Create Backup"**
- Los backups se guardan automáticamente

**O manualmente:**

```bash
# En terminal de postgres
pg_dump $DATABASE_URL > backup_$(date +%Y%m%d).sql
```

---

## 🔐 Seguridad

### SSL/HTTPS

✅ Easypanel configura SSL automáticamente con Let's Encrypt
✅ Renovación automática cada 90 días

### Firewall

Easypanel ya configura el firewall, pero verifica:

```bash
# En tu VPS (fuera de Easypanel)
sudo ufw status

# Debe permitir:
# 22/tcp (SSH)
# 80/tcp (HTTP)
# 443/tcp (HTTPS)
```

### Actualizar Contraseñas

Si necesitas cambiar contraseñas:

1. En Easypanel → `postgres` → **"Environment"**
2. Cambia la contraseña
3. Actualiza `DATABASE_URL` en el servicio `app`
4. Reinicia ambos servicios

---

## 🆘 Troubleshooting

### "Build Failed"

1. Revisa los logs de build en Easypanel
2. Verifica que `package.json` tenga todos los scripts
3. Asegúrate de que `.env` tenga todas las variables

### "Application Error"

1. Revisa los logs de la app
2. Verifica que `DATABASE_URL` sea correcta
3. Asegúrate de haber ejecutado `npx prisma db push`

### "502 Bad Gateway"

1. La app no está corriendo
2. Ve a Easypanel → `app` → **"Restart"**
3. Revisa los logs

### "Cannot connect to database"

1. Verifica que PostgreSQL esté corriendo (verde)
2. Verifica que `DATABASE_URL` tenga el formato correcto
3. El formato debe ser:
   ```
   postgresql://usuario:contraseña@postgres:5432/nombre_db
   ```
   Nota: `postgres` (sin la IP, es el nombre del servicio)

---

## 📊 Monitoreo

### Recursos

En Easypanel → Dashboard:
- CPU usage
- Memory usage
- Disk usage
- Network traffic

### Uptime

Configura un monitor externo (gratis):
- [UptimeRobot](https://uptimerobot.com) - 50 monitors gratis
- [Better Uptime](https://betteruptime.com) - Plan gratis disponible

### Logs

Easypanel guarda logs automáticamente:
- Últimos 1000 eventos
- Búsqueda en tiempo real
- Export a archivo

---

## 🎉 ¡Listo!

Tu app está desplegada en Easypanel con:

✅ Deploy automático desde GitHub
✅ SSL/HTTPS configurado
✅ Base de datos PostgreSQL
✅ Búsqueda con Meilisearch
✅ Backups automáticos
✅ Logs en tiempo real
✅ Zero-downtime deployments

---

## 📚 Recursos Adicionales

- **Documentación de Easypanel**: https://easypanel.io/docs
- **Comunidad**: https://discord.gg/easypanel
- **Guía de Prisma**: https://www.prisma.io/docs
- **Next.js Deployment**: https://nextjs.org/docs/deployment

---

## 🔄 Próximos Pasos

1. ✅ Configurar dominio personalizado
2. ✅ Configurar backups automáticos (Easypanel lo hace)
3. ✅ Configurar monitoring externo
4. ✅ Optimizar imágenes con CDN (Cloudinary ya lo hace)
5. ✅ Configurar Clerk webhooks
6. ✅ Configurar Stripe webhooks

---

**¿Problemas?** Revisa los logs en Easypanel o contacta en Discord.

**¿Todo funciona?** 🎊 ¡Felicitaciones! Tu app está en producción con Easypanel.
