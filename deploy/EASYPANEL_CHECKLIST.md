# ✅ Checklist de Deploy con Easypanel

Usa este checklist para asegurarte de que todo esté configurado correctamente.

---

## 📋 Pre-Deploy

### VPS
- [ ] Tengo acceso SSH a mi VPS (207.180.203.22)
- [ ] El VPS tiene al menos 2GB de RAM
- [ ] El VPS tiene al menos 20GB de espacio en disco

### Cuentas Necesarias
- [ ] Cuenta de GitHub con el repositorio de Foodzinder
- [ ] Cuenta de Clerk ([https://clerk.com](https://clerk.com)) - **GRATIS**
- [ ] Cuenta de Cloudinary ([https://cloudinary.com](https://cloudinary.com)) - **GRATIS**
- [ ] Cuenta de Resend ([https://resend.com](https://resend.com)) - **GRATIS**
- [ ] Cuenta de Stripe ([https://stripe.com](https://stripe.com)) - **GRATIS en modo test**

---

## 🔧 Instalación de Easypanel

- [ ] Me conecté al VPS: `ssh root@207.180.203.22`
- [ ] Ejecuté: `curl -sSL https://get.easypanel.io | sh`
- [ ] Esperé 3-5 minutos a que termine la instalación
- [ ] Abrí el navegador en: `http://207.180.203.22:3000`
- [ ] Creé mi usuario admin en Easypanel
- [ ] Puedo acceder al dashboard de Easypanel

---

## 📦 Configuración del Proyecto

### Crear Proyecto
- [ ] Click en "Create Project"
- [ ] Nombre del proyecto: `foodzinder`
- [ ] Proyecto creado exitosamente

### PostgreSQL
- [ ] Click en "Add Service" → "Database" → "PostgreSQL"
- [ ] Configuré:
  - Name: `postgres`
  - Version: `17`
  - Database: `foodzinder_db`
  - Username: `foodzinder`
  - Password: Generada y guardada ✍️
- [ ] PostgreSQL está corriendo (estado verde)

### Meilisearch (Opcional)
- [ ] Click en "Add Service" → "App"
- [ ] Source: "Docker Image"
- [ ] Image: `getmeili/meilisearch:v1.11`
- [ ] Port: `7700`
- [ ] Variables de entorno configuradas
- [ ] Volume agregado: `/meili_data`
- [ ] Meilisearch está corriendo (estado verde)

---

## 🚀 Deploy de la App

### Conectar GitHub
- [ ] Click en "Add Service" → "App" → "From GitHub"
- [ ] Conecté GitHub con Easypanel
- [ ] Seleccioné el repositorio `foodzinder-web`
- [ ] Branch seleccionada: `main`
- [ ] Auto Deploy activado ✅

### Configuración de Build
- [ ] Build Method: Nixpacks (o Dockerfile)
- [ ] Port: `3000`
- [ ] Start command configurado (si es necesario)

### Variables de Entorno
- [ ] Copié todas las variables de `EASYPANEL_ENV.txt`
- [ ] Actualicé estas variables con MIS valores reales:
  - [ ] `DATABASE_URL` (con mi contraseña de PostgreSQL)
  - [ ] `NEXT_PUBLIC_APP_URL` (mi dominio de Easypanel)
  - [ ] `NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY`
  - [ ] `CLERK_SECRET_KEY`
  - [ ] `CLERK_WEBHOOK_SECRET`
  - [ ] `NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME`
  - [ ] `CLOUDINARY_API_KEY`
  - [ ] `CLOUDINARY_API_SECRET`
  - [ ] `MEILISEARCH_MASTER_KEY`
  - [ ] `RESEND_API_KEY`
  - [ ] `NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY`
  - [ ] `STRIPE_SECRET_KEY`
  - [ ] `STRIPE_WEBHOOK_SECRET`

### Dominio
- [ ] Configuré dominio en Easypanel (automático o personalizado)
- [ ] SSL habilitado ✅
- [ ] Dominio funciona en el navegador

### Deploy
- [ ] Click en "Deploy"
- [ ] Esperé 5-10 minutos al primer build
- [ ] Build completado exitosamente (verde)
- [ ] App está corriendo (verde)

---

## 🔄 Post-Deploy

### Migraciones
- [ ] Abrí Terminal en Easypanel (servicio `app`)
- [ ] Ejecuté: `npx prisma generate`
- [ ] Ejecuté: `npx prisma db push`
- [ ] Migraciones completadas sin errores

### Verificación
- [ ] Abrí mi app en el navegador
- [ ] La página principal carga correctamente
- [ ] Puedo ver el formulario de login
- [ ] Revisé los logs (no hay errores críticos)

### Testing Básico
- [ ] Puedo hacer login con Clerk
- [ ] Puedo crear una cuenta
- [ ] El dashboard carga correctamente
- [ ] Las imágenes cargan desde Cloudinary

---

## 🔐 Seguridad

- [ ] SSL/HTTPS está activo (candado verde en navegador)
- [ ] Las contraseñas de producción son DIFERENTES a las de desarrollo
- [ ] La `MEILISEARCH_MASTER_KEY` es segura (mínimo 16 caracteres)
- [ ] No compartí mis secrets con nadie

---

## 📊 Monitoreo

- [ ] Configuré un monitor de uptime (UptimeRobot, etc.)
- [ ] Configuré backups automáticos en Easypanel
- [ ] Sé cómo ver los logs en tiempo real
- [ ] Sé cómo reiniciar la app si es necesario

---

## 🎉 Deploy Completo

Si marcaste todo ✅, ¡felicitaciones! Tu app está en producción.

**URL de tu app:** _______________________________

**Próximos pasos opcionales:**
- [ ] Configurar dominio personalizado
- [ ] Configurar webhooks de Clerk
- [ ] Configurar webhooks de Stripe
- [ ] Configurar analytics (Google Analytics, etc.)
- [ ] Agregar más features

---

## 🆘 Si algo no funciona

### Problemas comunes:

**App no inicia:**
1. ✅ Revisa logs en Easypanel
2. ✅ Verifica que todas las variables de entorno estén configuradas
3. ✅ Verifica que `DATABASE_URL` sea correcta
4. ✅ Reinicia el servicio

**Build falla:**
1. ✅ Revisa logs de build
2. ✅ Verifica que `package.json` esté correcto
3. ✅ Intenta rebuild desde Easypanel

**Base de datos no conecta:**
1. ✅ Verifica que PostgreSQL esté corriendo (verde)
2. ✅ Verifica que `DATABASE_URL` use `postgres` como host (no `localhost`)
3. ✅ Verifica que la contraseña sea correcta

**502 Bad Gateway:**
1. ✅ La app no está corriendo
2. ✅ Reinicia desde Easypanel
3. ✅ Revisa los logs

---

## 📞 Recursos

- **Documentación Easypanel**: https://easypanel.io/docs
- **Guía Completa**: `deploy/EASYPANEL_GUIDE.md`
- **Variables de entorno**: `deploy/EASYPANEL_ENV.txt`
- **Comunidad Easypanel**: https://discord.gg/easypanel

---

**¿Todo OK?** 🎊 ¡Tu app está lista para recibir usuarios!
