#!/bin/bash
# Script de configuración inicial del VPS para Foodzinder
# Ejecutar como root: sudo bash setup-vps.sh

set -e

echo "🚀 Configurando VPS para Foodzinder..."

# Actualizar el sistema
echo "📦 Actualizando sistema..."
apt-get update && apt-get upgrade -y

# Instalar dependencias básicas
echo "📦 Instalando dependencias..."
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    git \
    wget \
    ufw

# Instalar Docker
echo "🐳 Instalando Docker..."
if ! command -v docker &> /dev/null; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sh get-docker.sh
    rm get-docker.sh
    systemctl enable docker
    systemctl start docker
    echo "✅ Docker instalado"
else
    echo "✅ Docker ya está instalado"
fi

# Instalar Docker Compose
echo "🐳 Instalando Docker Compose..."
if ! command -v docker-compose &> /dev/null; then
    DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep 'tag_name' | cut -d\" -f4)
    curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    echo "✅ Docker Compose instalado"
else
    echo "✅ Docker Compose ya está instalado"
fi

# Configurar firewall
echo "🔥 Configurando firewall..."
ufw --force enable
ufw allow 22/tcp    # SSH
ufw allow 80/tcp    # HTTP
ufw allow 443/tcp   # HTTPS
echo "✅ Firewall configurado"

# Crear directorio de la aplicación
echo "📁 Creando directorio de aplicación..."
mkdir -p /opt/foodzinder
cd /opt/foodzinder

# Crear archivo .env.production (template)
echo "📝 Creando archivo .env.production..."
cat > .env.production << 'EOF'
# Production Environment Variables
NODE_ENV=production

# Database
DATABASE_URL=postgresql://foodzinder:CHANGE_THIS_PASSWORD@postgres:5432/foodzinder_db
POSTGRES_USER=foodzinder
POSTGRES_PASSWORD=CHANGE_THIS_PASSWORD
POSTGRES_DB=foodzinder_db

# App URL
NEXT_PUBLIC_APP_URL=https://your-domain.com

# Clerk Authentication
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=your_clerk_key
CLERK_SECRET_KEY=your_clerk_secret
CLERK_WEBHOOK_SECRET=your_webhook_secret

# Stripe
NEXT_PUBLIC_STRIPE_PUBLISHABLE_KEY=your_stripe_key
STRIPE_SECRET_KEY=your_stripe_secret
STRIPE_WEBHOOK_SECRET=your_stripe_webhook

# Cloudinary
NEXT_PUBLIC_CLOUDINARY_CLOUD_NAME=your_cloudinary_name
CLOUDINARY_API_KEY=your_cloudinary_key
CLOUDINARY_API_SECRET=your_cloudinary_secret

# Meilisearch
NEXT_PUBLIC_MEILISEARCH_HOST=http://meilisearch:7700
MEILISEARCH_MASTER_KEY=CHANGE_THIS_MASTER_KEY
MEILI_ENV=production

# Email (Resend)
RESEND_API_KEY=your_resend_key
EOF

echo "⚠️  IMPORTANTE: Edita /opt/foodzinder/.env.production con tus valores reales"

# Configurar permisos
echo "🔐 Configurando permisos..."
chmod 600 /opt/foodzinder/.env.production

# Crear directorios para nginx
mkdir -p /opt/foodzinder/nginx/ssl
mkdir -p /opt/foodzinder/nginx/logs

# Instrucciones finales
echo ""
echo "✅ Configuración inicial completada!"
echo ""
echo "📋 Próximos pasos:"
echo "1. Edita /opt/foodzinder/.env.production con tus credenciales reales"
echo "2. Clona tu repositorio en /opt/foodzinder"
echo "3. Configura los secrets en GitHub:"
echo "   - VPS_HOST: 207.180.203.22"
echo "   - VPS_USER: tu_usuario"
echo "   - VPS_SSH_KEY: tu_clave_privada_ssh"
echo "   - NEXT_PUBLIC_APP_URL: https://tu-dominio.com"
echo "4. Configura SSL con Let's Encrypt (opcional):"
echo "   sudo certbot --nginx -d tu-dominio.com -d www.tu-dominio.com"
echo "5. Haz push a main para desplegar automáticamente"
echo ""
echo "🔐 Para configurar SSH key en GitHub Actions:"
echo "   cat ~/.ssh/id_rsa (copia la clave privada)"
echo "   Agrégala como secret VPS_SSH_KEY en GitHub"
echo ""
