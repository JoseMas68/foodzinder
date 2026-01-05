#!/bin/bash
# Script de gestión de Foodzinder en VPS
# Uso: ./manage.sh [comando]

set -e

COMPOSE_FILE="docker-compose.yml"
APP_DIR="/opt/foodzinder"

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función de ayuda
show_help() {
    echo "🍽️  Foodzinder Management Script"
    echo ""
    echo "Uso: ./manage.sh [comando]"
    echo ""
    echo "Comandos disponibles:"
    echo ""
    echo "  start          - Iniciar todos los servicios"
    echo "  stop           - Detener todos los servicios"
    echo "  restart        - Reiniciar todos los servicios"
    echo "  restart-app    - Reiniciar solo la aplicación"
    echo "  logs           - Ver logs en tiempo real"
    echo "  logs-app       - Ver logs solo de la app"
    echo "  status         - Ver estado de contenedores"
    echo "  stats          - Ver uso de recursos"
    echo "  update         - Actualizar desde GitHub y redesplegar"
    echo "  migrate        - Ejecutar migraciones de base de datos"
    echo "  seed           - Ejecutar seed de datos"
    echo "  backup         - Crear backup de base de datos"
    echo "  restore        - Restaurar backup de base de datos"
    echo "  clean          - Limpiar imágenes y contenedores no usados"
    echo "  shell          - Acceder a shell de la app"
    echo "  db-shell       - Acceder a shell de PostgreSQL"
    echo "  help           - Mostrar esta ayuda"
    echo ""
}

# Iniciar servicios
start_services() {
    echo -e "${GREEN}🚀 Iniciando servicios...${NC}"
    docker-compose --profile production up -d
    echo -e "${GREEN}✅ Servicios iniciados${NC}"
}

# Detener servicios
stop_services() {
    echo -e "${YELLOW}⏸️  Deteniendo servicios...${NC}"
    docker-compose --profile production down
    echo -e "${GREEN}✅ Servicios detenidos${NC}"
}

# Reiniciar servicios
restart_services() {
    echo -e "${YELLOW}🔄 Reiniciando servicios...${NC}"
    docker-compose --profile production restart
    echo -e "${GREEN}✅ Servicios reiniciados${NC}"
}

# Reiniciar solo la app
restart_app() {
    echo -e "${YELLOW}🔄 Reiniciando aplicación...${NC}"
    docker-compose restart app
    echo -e "${GREEN}✅ Aplicación reiniciada${NC}"
}

# Ver logs
view_logs() {
    echo -e "${GREEN}📋 Mostrando logs (Ctrl+C para salir)...${NC}"
    docker-compose logs -f
}

# Ver logs de app
view_app_logs() {
    echo -e "${GREEN}📋 Mostrando logs de app (Ctrl+C para salir)...${NC}"
    docker-compose logs -f app
}

# Ver estado
show_status() {
    echo -e "${GREEN}📊 Estado de contenedores:${NC}"
    docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
}

# Ver estadísticas
show_stats() {
    echo -e "${GREEN}📈 Uso de recursos:${NC}"
    docker stats --no-stream
}

# Actualizar desde GitHub
update_app() {
    echo -e "${YELLOW}📥 Actualizando desde GitHub...${NC}"

    # Backup antes de actualizar
    echo "Creando backup de seguridad..."
    backup_database

    # Pull latest
    git pull origin main

    # Rebuild y restart
    echo -e "${YELLOW}🔨 Rebuilding...${NC}"
    docker-compose --profile production up -d --build

    # Ejecutar migraciones
    echo -e "${YELLOW}🗄️  Ejecutando migraciones...${NC}"
    docker-compose exec app npx prisma migrate deploy

    echo -e "${GREEN}✅ Actualización completada${NC}"
}

# Ejecutar migraciones
run_migrations() {
    echo -e "${YELLOW}🗄️  Ejecutando migraciones...${NC}"
    docker-compose exec app npx prisma migrate deploy
    echo -e "${GREEN}✅ Migraciones completadas${NC}"
}

# Ejecutar seed
run_seed() {
    echo -e "${YELLOW}🌱 Ejecutando seed...${NC}"
    docker-compose exec app npm run db:seed
    echo -e "${GREEN}✅ Seed completado${NC}"
}

# Backup de base de datos
backup_database() {
    echo -e "${YELLOW}💾 Creando backup de base de datos...${NC}"

    BACKUP_DIR="$APP_DIR/backups"
    mkdir -p "$BACKUP_DIR"

    TIMESTAMP=$(date +%Y%m%d_%H%M%S)
    BACKUP_FILE="$BACKUP_DIR/foodzinder_backup_$TIMESTAMP.sql"

    docker-compose exec -T postgres pg_dump -U foodzinder foodzinder_db > "$BACKUP_FILE"

    # Comprimir
    gzip "$BACKUP_FILE"

    echo -e "${GREEN}✅ Backup creado: $BACKUP_FILE.gz${NC}"

    # Limpiar backups antiguos (mantener últimos 7)
    ls -t "$BACKUP_DIR"/*.sql.gz | tail -n +8 | xargs -r rm
    echo -e "${GREEN}📦 Backups antiguos limpiados (manteniendo últimos 7)${NC}"
}

# Restaurar backup
restore_database() {
    echo -e "${YELLOW}⚠️  RESTAURAR BASE DE DATOS${NC}"
    echo "Esto sobrescribirá TODOS los datos actuales."
    echo ""
    echo "Backups disponibles:"
    ls -lh "$APP_DIR/backups/"*.sql.gz 2>/dev/null || echo "No hay backups disponibles"
    echo ""
    read -p "Nombre del archivo a restaurar (ej: foodzinder_backup_20260104_120000.sql.gz): " BACKUP_FILE

    if [ ! -f "$APP_DIR/backups/$BACKUP_FILE" ]; then
        echo -e "${RED}❌ Archivo no encontrado${NC}"
        exit 1
    fi

    read -p "¿Estás seguro? (escribe 'SI' para confirmar): " CONFIRM

    if [ "$CONFIRM" != "SI" ]; then
        echo -e "${YELLOW}❌ Restauración cancelada${NC}"
        exit 0
    fi

    echo -e "${YELLOW}📥 Restaurando backup...${NC}"

    gunzip -c "$APP_DIR/backups/$BACKUP_FILE" | docker-compose exec -T postgres psql -U foodzinder foodzinder_db

    echo -e "${GREEN}✅ Backup restaurado${NC}"
}

# Limpiar Docker
clean_docker() {
    echo -e "${YELLOW}🧹 Limpiando Docker...${NC}"

    echo "Limpiando imágenes no usadas..."
    docker image prune -af

    echo "Limpiando contenedores detenidos..."
    docker container prune -f

    echo "Limpiando redes no usadas..."
    docker network prune -f

    echo -e "${GREEN}✅ Limpieza completada${NC}"
}

# Acceder a shell de la app
app_shell() {
    echo -e "${GREEN}🐚 Accediendo a shell de la app...${NC}"
    docker-compose exec app sh
}

# Acceder a shell de PostgreSQL
db_shell() {
    echo -e "${GREEN}🐚 Accediendo a PostgreSQL...${NC}"
    docker-compose exec postgres psql -U foodzinder foodzinder_db
}

# Main
case "${1}" in
    start)
        start_services
        ;;
    stop)
        stop_services
        ;;
    restart)
        restart_services
        ;;
    restart-app)
        restart_app
        ;;
    logs)
        view_logs
        ;;
    logs-app)
        view_app_logs
        ;;
    status)
        show_status
        ;;
    stats)
        show_stats
        ;;
    update)
        update_app
        ;;
    migrate)
        run_migrations
        ;;
    seed)
        run_seed
        ;;
    backup)
        backup_database
        ;;
    restore)
        restore_database
        ;;
    clean)
        clean_docker
        ;;
    shell)
        app_shell
        ;;
    db-shell)
        db_shell
        ;;
    help|*)
        show_help
        ;;
esac
