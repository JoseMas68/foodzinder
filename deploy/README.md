# 🚀 Guía de Despliegue a VPS (207.180.203.22)

Esta guía te ayudará a desplegar Foodzinder desde GitHub a tu VPS usando Docker y GitHub Actions.

## 📋 Requisitos Previos

- VPS con acceso SSH (207.180.203.22)
- Dominio apuntando al VPS (opcional pero recomendado)
- Cuenta de GitHub con el repositorio
- Docker y Docker Compose instalados en el VPS

---

## 🔧 Configuración Inicial del VPS

### 1. Conectarse al VPS

```bash
ssh root@207.180.203.22
```

### 2. Ejecutar el script de configuración

```bash
# Descargar el script
wget https://raw.githubusercontent.com/TU_USUARIO/foodzinder-web/main/deploy/setup-vps.sh

# Dar permisos de ejecución
chmod +x setup-vps.sh

# Ejecutar
sudo bash setup-vps.sh
```

Este script instalará:
- Docker y Docker Compose
- Configurará el firewall (UFW)
- Creará los directorios necesarios
- Generará un template de `.env.production`

### 3. Configurar variables de entorno

```bash
cd /opt/foodzinder
nano .env.production
```

Completa todas las variables con tus valores reales.

### 4. Clonar el repositorio

```bash
cd /opt/foodzinder
git clone https://github.com/TU_USUARIO/foodzinder-web.git .
```

---

## 🔐 Configurar GitHub Actions

### 1. Generar clave SSH (si no tienes una)

En el VPS:

```bash
ssh-keygen -t ed25519 -C "github-actions"
cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/id_ed25519  # Copia esta clave privada
```

### 2. Agregar Secrets en GitHub

Ve a tu repositorio → Settings → Secrets and variables → Actions → New repository secret

Agrega los siguientes secrets:

| Secret Name | Valor | Descripción |
|------------|-------|-------------|
| `VPS_HOST` | `207.180.203.22` | IP del VPS |
| `VPS_USER` | `root` o tu usuario | Usuario SSH |
| `VPS_SSH_KEY` | Clave privada SSH | La clave que copiaste antes |
| `VPS_PORT` | `22` | Puerto SSH (opcional) |
| `NEXT_PUBLIC_APP_URL` | `https://tu-dominio.com` | URL de producción |

### 3. Configurar permisos de GitHub Container Registry

El workflow ya está configurado para usar `ghcr.io` (GitHub Container Registry).

---

## 🌐 Configurar Dominio y SSL (Opcional)

### 1. Apuntar el dominio al VPS

En tu proveedor de DNS, crea estos registros:

```
A    @     207.180.203.22
A    www   207.180.203.22
```

### 2. Instalar Certbot para SSL

```bash
sudo apt-get install -y certbot python3-certbot-nginx

# Obtener certificado SSL
sudo certbot --nginx -d tu-dominio.com -d www.tu-dominio.com
```

### 3. Actualizar nginx.conf

Descomenta las líneas de SSL en `nginx/nginx.conf`:

```nginx
ssl_certificate /etc/nginx/ssl/fullchain.pem;
ssl_certificate_key /etc/nginx/ssl/privkey.pem;
```

---

## 🚀 Despliegue Manual (Primera vez)

### 1. Iniciar servicios básicos

```bash
cd /opt/foodzinder

# Solo PostgreSQL y Meilisearch para desarrollo local
docker-compose up -d postgres meilisearch
```

### 2. Ejecutar migraciones

```bash
# Desde tu máquina local
npm run db:generate
npm run db:push

# O desde el VPS si tienes Node.js instalado
docker-compose exec app npx prisma migrate deploy
```

### 3. Iniciar la aplicación en producción

```bash
docker-compose --profile production up -d
```

---

## 🔄 Despliegue Automático con GitHub Actions

Una vez configurado todo:

1. Haz cambios en tu código
2. Commit y push a la rama `main`:

```bash
git add .
git commit -m "feat: nueva funcionalidad"
git push origin main
```

3. GitHub Actions automáticamente:
   - ✅ Construirá la imagen Docker
   - ✅ La subirá a GitHub Container Registry
   - ✅ Se conectará al VPS por SSH
   - ✅ Descargará la nueva imagen
   - ✅ Reiniciará los contenedores
   - ✅ Ejecutará migraciones
   - ✅ Verificará que todo funcione

---

## 🛠️ Comandos Útiles

### Ver logs de la aplicación

```bash
docker-compose logs -f app
```

### Ver logs de todos los servicios

```bash
docker-compose logs -f
```

### Reiniciar la aplicación

```bash
docker-compose --profile production restart app
```

### Detener todos los servicios

```bash
docker-compose --profile production down
```

### Ver estado de contenedores

```bash
docker ps
```

### Ejecutar comandos en el contenedor

```bash
# Ejecutar migraciones
docker-compose exec app npx prisma migrate deploy

# Ejecutar seed
docker-compose exec app npm run db:seed

# Acceder a la shell
docker-compose exec app sh
```

---

## 🔍 Monitoreo y Troubleshooting

### Verificar que la app está corriendo

```bash
curl http://localhost:3000/health
```

### Ver uso de recursos

```bash
docker stats
```

### Limpiar recursos de Docker

```bash
# Limpiar imágenes no usadas
docker image prune -a

# Limpiar todo (cuidado!)
docker system prune -a --volumes
```

---

## 📊 Estructura de Servicios

Cuando ejecutas `docker-compose --profile production up -d`, se inician:

- **app** (puerto 3000): Aplicación Next.js
- **postgres** (puerto 5432): Base de datos
- **meilisearch** (puerto 7700): Motor de búsqueda
- **nginx** (puertos 80/443): Reverse proxy

---

## 🔐 Seguridad

### Recomendaciones

1. ✅ Cambia todas las contraseñas por defecto en `.env.production`
2. ✅ Configura el firewall (ya hecho con `setup-vps.sh`)
3. ✅ Usa HTTPS con Let's Encrypt
4. ✅ Mantén Docker actualizado: `apt-get update && apt-get upgrade`
5. ✅ Revisa logs regularmente: `docker-compose logs`
6. ✅ Haz backups de la base de datos regularmente

### Backup de base de datos

```bash
# Crear backup
docker-compose exec postgres pg_dump -U foodzinder foodzinder_db > backup_$(date +%Y%m%d).sql

# Restaurar backup
cat backup_20260104.sql | docker-compose exec -T postgres psql -U foodzinder foodzinder_db
```

---

## 🆘 Soporte

Si algo no funciona:

1. Revisa los logs: `docker-compose logs -f`
2. Verifica las variables de entorno en `.env.production`
3. Asegúrate de que todos los secrets de GitHub estén configurados
4. Verifica que el firewall permita los puertos 80 y 443

---

## 📝 Checklist de Despliegue

- [ ] VPS configurado con Docker
- [ ] Script `setup-vps.sh` ejecutado
- [ ] `.env.production` configurado con valores reales
- [ ] Secrets de GitHub configurados
- [ ] Dominio apuntando al VPS (opcional)
- [ ] SSL configurado con Let's Encrypt (opcional)
- [ ] Primera migración de BD ejecutada
- [ ] Push a `main` realizado
- [ ] Aplicación accesible en https://tu-dominio.com

---

**¡Listo para producción! 🎉**
