# 🚀 Instrucciones de Configuración - Foodzinder

## ✅ Pasos Completados

1. ✅ Archivo `.env` creado con credenciales correctas
2. ✅ Dependencias instaladas (573 paquetes)
3. ✅ React actualizado a versión 19

---

## 🔴 PASOS QUE DEBES HACER AHORA

### PASO 1: Iniciar Docker Desktop

**IMPORTANTE:** Necesitas iniciar Docker Desktop manualmente.

1. Abre **Docker Desktop** en Windows
2. Espera a que Docker se inicie completamente (el ícono de la ballena debe estar verde)
3. Verifica que Docker está corriendo

---

### PASO 2: Iniciar PostgreSQL con Docker Compose

Una vez Docker esté corriendo, ejecuta en la terminal:

```bash
cd c:\Users\Jose\foodzinder-web
docker-compose up -d
```

Esto iniciará PostgreSQL 17 en el puerto 5433 con las siguientes credenciales:
- **Usuario:** foodzinder
- **Contraseña:** foodzinder_dev_2025
- **Base de datos:** foodzinder_db
- **Puerto:** 5433

---

### PASO 3: Verificar que PostgreSQL está corriendo

```bash
docker ps
```

Deberías ver un contenedor llamado `foodzinder-postgres` corriendo.

---

### PASO 4: Aplicar el Schema de Prisma

```bash
npm run db:push
```

Este comando creará todas las tablas en la base de datos según el schema de Prisma.

---

### PASO 5: Generar el Cliente de Prisma

```bash
npm run db:generate
```

---

### PASO 6: Crear Datos de Prueba

El script de seed está pendiente. Después de ejecutar los pasos anteriores, avísame para crear el script de seed con datos de ejemplo.

---

### PASO 7: Configurar Clerk (Autenticación)

**IMPORTANTE:** Para que la autenticación funcione, necesitas:

1. Crear una cuenta en [Clerk.com](https://clerk.com)
2. Crear una nueva aplicación
3. Obtener las API keys
4. Actualizar el archivo `.env` con las keys reales:

```env
NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY=tu_key_real
CLERK_SECRET_KEY=tu_secret_key_real
CLERK_WEBHOOK_SECRET=tu_webhook_secret_real
```

**Por ahora puedes omitir este paso** si solo quieres ver la interfaz sin autenticación.

---

### PASO 8: Iniciar el Servidor de Desarrollo

```bash
npm run dev
```

Luego abre http://localhost:3000 en tu navegador.

---

## 📋 Resumen de Comandos

```bash
# 1. Iniciar Docker Desktop manualmente (GUI)

# 2. Levantar PostgreSQL
docker-compose up -d

# 3. Aplicar schema
npm run db:push

# 4. Generar cliente Prisma
npm run db:generate

# 5. (Pendiente) Ejecutar seed
npm run db:seed

# 6. Iniciar servidor
npm run dev
```

---

## 🔍 Verificación

Para verificar que todo está funcionando:

1. **Docker:** `docker ps` debería mostrar `foodzinder-postgres`
2. **Base de datos:** `npm run db:studio` abre Prisma Studio (GUI para ver la BD)
3. **Servidor:** `http://localhost:3000` debería mostrar la home page

---

## ❓ Problemas Comunes

### Docker no se inicia
- Reinicia Docker Desktop
- Verifica que la virtualización está habilitada en el BIOS

### Error de conexión a la base de datos
- Verifica que Docker está corriendo: `docker ps`
- Verifica las credenciales en `.env`
- Reinicia el contenedor: `docker-compose restart`

### Errores de TypeScript
- Ejecuta: `npm run type-check`
- Si hay errores, avísame para corregirlos

---

## 🎯 Próximos Pasos (Después de Setup)

Una vez todo esté corriendo:
1. Crear script de seed con datos de prueba
2. Configurar Clerk para autenticación
3. Implementar CRUD de restaurantes
4. Integrar Stripe para pagos

---

**¡Avísame cuando hayas completado los pasos anteriores para continuar!**
