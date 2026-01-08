# 🚀 Quick Start - Deploy a 207.180.203.22

Guía ultra-rápida para desplegar Foodzinder en tu VPS.

---

## 📋 Paso 1: Preparar el VPS

```bash
# Conectarse al VPS
ssh root@207.180.203.22

# Descargar y ejecutar script de setup
wget https://raw.githubusercontent.com/TU_USUARIO/foodzinder-web/main/deploy/setup-vps.sh
chmod +x setup-vps.sh
sudo bash setup-vps.sh

# Esto instalará:
# - Docker & Docker Compose
# - Firewall (UFW) configurado
# - Directorios necesarios
# - Template de .env.production
```

---

## 📝 Paso 2: Configurar Variables de Entorno

```bash
# Editar archivo de producción
cd /opt/foodzinder
nano .env.production
```

**Valores mínimos necesarios:**

```env
# Base de datos (cambiar contraseña!)
DATABASE_URL=postgresql://foodzinder:TU_CONTRASEÑA_SEGURA_AQUI@postgres:5432/foodzinder_db
POSTGRES_PASSWORD=TU_CONTRASEÑA_SEGURA_AQUI

# URL de tu app
NEXT_PUBLIC_APP_URL=http://207.180.203.22

# Clerk (obtener en https://dashboard.clerk.com)
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=pk_live_xxxxx
CLERK_SECRET_KEY=sk_live_xxxxx

# Meilisearch (cambiar master key!)
MEILISEARCH_MASTER_KEY=una_clave_muy_segura_y_larga

# Resend (obtener en https://resend.com/api-keys)
RESEND_API_KEY=re_xxxxx
```

Guardar: `Ctrl + X` → `Y` → `Enter`

---

## 🔑 Paso 3: Configurar GitHub Actions

### 3.1. Generar clave SSH en el VPS

```bash
ssh-keygen -t ed25519 -C "github-deploy"
# Presiona Enter 3 veces (no password)

# Agregar la clave pública a authorized_keys
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys

# Copiar la clave PRIVADA (la usarás en GitHub)
cat ~/.ssh/id_ed25519
# Copia TODO el contenido (desde -----BEGIN hasta -----END-----)
```

### 3.2. Agregar Secrets en GitHub

Ve a: `https://github.com/TU_USUARIO/foodzinder-web/settings/secrets/actions`

Click en "New repository secret" y agrega:

| Name | Value |
|------|-------|
| `VPS_HOST` | `207.180.203.22` |
| `VPS_USER` | `root` |
| `VPS_SSH_KEY` | La clave privada que copiaste |
| `NEXT_PUBLIC_APP_URL` | `http://207.180.203.22` |

---

## 📦 Paso 4: Clonar el Repo y Deploy Manual (Primera vez)

```bash
# En el VPS
cd /opt/foodzinder

# Clonar repositorio
git clone https://github.com/TU_USUARIO/foodzinder-web.git .

# Levantar solo la base de datos primero
docker-compose up -d postgres meilisearch

# Esperar 10 segundos
sleep 10

# Verificar que PostgreSQL esté corriendo
docker-compose exec postgres pg_isready -U foodzinder
# Debe decir "accepting connections"
```

---

## 🏗️ Paso 5: Build y Deploy

```bash
# Opción A: Deploy manual (primera vez)
docker-compose --profile production up -d --build

# Ver los logs en tiempo real
docker-compose logs -f app

# Esperar a que termine el build (puede tardar 3-5 minutos)
```

**O simplemente:**

```bash
# Opción B: Push a GitHub (deploy automático)
# Desde tu máquina local:
git add .
git commit -m "feat: initial production deploy"
git push origin main

# GitHub Actions hará todo automáticamente
# Ve el progreso en: https://github.com/TU_USUARIO/foodzinder-web/actions
```

---

## ✅ Paso 6: Verificar que Funciona

```bash
# Desde el VPS
curl http://localhost:3000

# Debería devolver HTML

# Ver contenedores corriendo
docker ps

# Deberías ver:
# - foodzinder-app
# - foodzinder-postgres
# - foodzinder-meilisearch
# - foodzinder-nginx
```

**Abre en tu navegador:**

```
http://207.180.203.22
```

Si ves la app, **¡FUNCIONÓ!** 🎉

---

## 🌐 Paso 7: Configurar Dominio (Opcional)

Si tienes un dominio (ej: `miapp.com`):

### 7.1. Configurar DNS

En tu proveedor de DNS:

```
Tipo  Nombre  Valor
A     @       207.180.203.22
A     www     207.180.203.22
```

### 7.2. Instalar SSL (Let's Encrypt)

```bash
# En el VPS
sudo apt install -y certbot python3-certbot-nginx

# Obtener certificado
sudo certbot certonly --standalone -d miapp.com -d www.miapp.com

# Los certificados estarán en:
# /etc/letsencrypt/live/miapp.com/fullchain.pem
# /etc/letsencrypt/live/miapp.com/privkey.pem

# Copiar a la carpeta de nginx
sudo cp /etc/letsencrypt/live/miapp.com/fullchain.pem /opt/foodzinder/nginx/ssl/
sudo cp /etc/letsencrypt/live/miapp.com/privkey.pem /opt/foodzinder/nginx/ssl/
```

### 7.3. Activar SSL en Nginx

```bash
cd /opt/foodzinder
nano nginx/nginx.conf
```

Descomentar las líneas:

```nginx
ssl_certificate /etc/nginx/ssl/fullchain.pem;
ssl_certificate_key /etc/nginx/ssl/privkey.pem;
ssl_protocols TLSv1.2 TLSv1.3;
# ... etc
```

Guardar y reiniciar nginx:

```bash
docker-compose restart nginx
```

### 7.4. Actualizar .env.production

```bash
nano .env.production
```

Cambiar:

```env
NEXT_PUBLIC_APP_URL=https://miapp.com
```

Reiniciar app:

```bash
docker-compose restart app
```

**¡Listo!** Ahora tu app está en `https://miapp.com` 🔒

---

## 🔧 Comandos Útiles

```bash
# Ver logs
docker-compose logs -f app

# Reiniciar app
docker-compose restart app

# Detener todo
docker-compose down

# Iniciar todo
docker-compose --profile production up -d

# Ver uso de recursos
docker stats

# Ejecutar migraciones
docker-compose exec app npx prisma migrate deploy

# Acceder a la base de datos
docker-compose exec postgres psql -U foodzinder foodzinder_db

# Backup de BD
docker-compose exec postgres pg_dump -U foodzinder foodzinder_db > backup_$(date +%Y%m%d).sql

# Limpiar imágenes viejas
docker image prune -af
```

---

## 🆘 Troubleshooting

### La app no inicia

```bash
# Ver logs
docker-compose logs app

# Verificar que PostgreSQL esté corriendo
docker-compose exec postgres pg_isready -U foodzinder

# Reiniciar todo
docker-compose down
docker-compose --profile production up -d
```

### No puedo acceder desde el navegador

```bash
# Verificar firewall
sudo ufw status

# Debe permitir 80 y 443
sudo ufw allow 80
sudo ufw allow 443

# Verificar que nginx esté corriendo
docker ps | grep nginx

# Ver logs de nginx
docker-compose logs nginx
```

### Error de migraciones

```bash
# Ejecutar manualmente
docker-compose exec app npx prisma migrate deploy

# Si falla, resetear BD (¡CUIDADO! Borra todos los datos)
docker-compose exec app npx prisma migrate reset
```

### GitHub Actions falla

- Verifica que los secrets estén bien configurados
- Verifica que la clave SSH sea la PRIVADA
- Verifica que el usuario tenga permisos de sudo

---

## 📊 Monitoreo

### Ver uso de recursos

```bash
# CPU, RAM, Network
docker stats

# Espacio en disco
df -h

# Logs del sistema
journalctl -xe
```

---

## 🎉 ¡Todo Listo!

Tu app está desplegada en:

- **HTTP**: http://207.180.203.22
- **HTTPS**: https://tu-dominio.com (si configuraste)

**Próximos pasos:**

1. ✅ Configurar SSL con Let's Encrypt
2. ✅ Configurar backups automáticos
3. ✅ Agregar monitoring (Sentry, Uptime Robot)
4. ✅ Configurar CDN (Cloudflare)

---

**¿Problemas?** Revisa los logs: `docker-compose logs -f`

**¿Todo funciona?** 🎊 ¡Felicitaciones! Tu app está en producción.
