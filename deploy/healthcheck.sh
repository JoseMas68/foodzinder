#!/bin/bash
# Health Check Script para Foodzinder
# Uso: ./healthcheck.sh
# Para cron job: */5 * * * * /opt/foodzinder/deploy/healthcheck.sh

set -e

# Configuración
APP_URL="http://localhost:3000"
SLACK_WEBHOOK="" # Opcional: agregar webhook de Slack para notificaciones
EMAIL="" # Opcional: email para notificaciones

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Log file
LOG_FILE="/var/log/foodzinder-health.log"
mkdir -p "$(dirname "$LOG_FILE")"

# Timestamp
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Función para log
log_message() {
    echo "[$TIMESTAMP] $1" >> "$LOG_FILE"
    echo -e "$1"
}

# Función para enviar alerta
send_alert() {
    local MESSAGE="$1"

    # Log
    log_message "${RED}❌ ALERTA: $MESSAGE${NC}"

    # Slack (si está configurado)
    if [ -n "$SLACK_WEBHOOK" ]; then
        curl -X POST "$SLACK_WEBHOOK" \
            -H 'Content-Type: application/json' \
            -d "{\"text\":\"🚨 Foodzinder Health Alert: $MESSAGE\"}" \
            2>/dev/null || true
    fi

    # Email (si está configurado)
    if [ -n "$EMAIL" ]; then
        echo "$MESSAGE" | mail -s "Foodzinder Health Alert" "$EMAIL" 2>/dev/null || true
    fi
}

# Check 1: Contenedores corriendo
check_containers() {
    log_message "🔍 Verificando contenedores..."

    CONTAINERS=("foodzinder-app" "foodzinder-postgres" "foodzinder-meilisearch" "foodzinder-nginx")

    for CONTAINER in "${CONTAINERS[@]}"; do
        if ! docker ps --format '{{.Names}}' | grep -q "^${CONTAINER}$"; then
            send_alert "Contenedor $CONTAINER no está corriendo"
            return 1
        fi
    done

    log_message "${GREEN}✅ Todos los contenedores están corriendo${NC}"
    return 0
}

# Check 2: App responde
check_app_response() {
    log_message "🔍 Verificando respuesta de la app..."

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$APP_URL" --max-time 10 || echo "000")

    if [ "$HTTP_CODE" != "200" ] && [ "$HTTP_CODE" != "301" ] && [ "$HTTP_CODE" != "302" ]; then
        send_alert "App no responde correctamente (HTTP $HTTP_CODE)"
        return 1
    fi

    log_message "${GREEN}✅ App respondiendo correctamente (HTTP $HTTP_CODE)${NC}"
    return 0
}

# Check 3: PostgreSQL healthy
check_postgres() {
    log_message "🔍 Verificando PostgreSQL..."

    if ! docker-compose exec -T postgres pg_isready -U foodzinder > /dev/null 2>&1; then
        send_alert "PostgreSQL no está disponible"
        return 1
    fi

    log_message "${GREEN}✅ PostgreSQL está saludable${NC}"
    return 0
}

# Check 4: Meilisearch healthy
check_meilisearch() {
    log_message "🔍 Verificando Meilisearch..."

    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://localhost:7700/health" --max-time 5 || echo "000")

    if [ "$HTTP_CODE" != "200" ]; then
        send_alert "Meilisearch no está disponible (HTTP $HTTP_CODE)"
        return 1
    fi

    log_message "${GREEN}✅ Meilisearch está saludable${NC}"
    return 0
}

# Check 5: Disco disponible
check_disk_space() {
    log_message "🔍 Verificando espacio en disco..."

    DISK_USAGE=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

    if [ "$DISK_USAGE" -gt 85 ]; then
        send_alert "Espacio en disco bajo: ${DISK_USAGE}% usado"
        return 1
    fi

    log_message "${GREEN}✅ Espacio en disco OK: ${DISK_USAGE}% usado${NC}"
    return 0
}

# Check 6: Memoria disponible
check_memory() {
    log_message "🔍 Verificando memoria..."

    MEM_USAGE=$(free | grep Mem | awk '{print int($3/$2 * 100)}')

    if [ "$MEM_USAGE" -gt 90 ]; then
        send_alert "Uso de memoria alto: ${MEM_USAGE}%"
        # No retorna error, solo alerta
    fi

    log_message "${GREEN}✅ Memoria: ${MEM_USAGE}% usado${NC}"
    return 0
}

# Check 7: Logs de errores recientes
check_error_logs() {
    log_message "🔍 Verificando errores recientes..."

    ERROR_COUNT=$(docker-compose logs --tail=100 app 2>/dev/null | grep -i "error" | wc -l || echo "0")

    if [ "$ERROR_COUNT" -gt 10 ]; then
        send_alert "Muchos errores en logs: $ERROR_COUNT errores en últimas 100 líneas"
        # No retorna error, solo alerta
    fi

    log_message "ℹ️  Errores en logs: $ERROR_COUNT"
    return 0
}

# Ejecutar todos los checks
main() {
    echo ""
    log_message "======================================"
    log_message "🏥 Iniciando health check de Foodzinder"
    log_message "======================================"
    echo ""

    FAILED_CHECKS=0

    check_containers || ((FAILED_CHECKS++))
    check_app_response || ((FAILED_CHECKS++))
    check_postgres || ((FAILED_CHECKS++))
    check_meilisearch || ((FAILED_CHECKS++))
    check_disk_space || ((FAILED_CHECKS++))
    check_memory
    check_error_logs

    echo ""
    log_message "======================================"

    if [ "$FAILED_CHECKS" -eq 0 ]; then
        log_message "${GREEN}✅ Todos los checks pasaron correctamente${NC}"
        log_message "======================================"
        exit 0
    else
        log_message "${RED}❌ $FAILED_CHECKS checks fallaron${NC}"
        log_message "======================================"
        exit 1
    fi
}

# Ejecutar
main
