# 🔧 Solución: App Compila pero No Conecta a la Base de Datos

## 🎯 Problema Actual

Tu app en Easypanel **compila correctamente** ✅ pero **no puede conectar a PostgreSQL** ❌

---

## 🔍 Diagnóstico Rápido

### Paso 1: Verificar que PostgreSQL está corriendo

1. En Easypanel, ve a tu proyecto `foodzinder`
2. Busca el servicio `postgres`
3. **¿El estado es verde?**
   - ✅ **SÍ** → PostgreSQL está corriendo, sigue al Paso 2
   - ❌ **NO** → Inicia el servicio y espera 1-2 minutos

### Paso 2: Verificar el DATABASE_URL

El error más común es una **DATABASE_URL incorrecta**. Debe tener este formato EXACTO:

```
DATABASE_URL=postgresql://foodzinder:TU_PASSWORD@postgres:5432/foodzinder_db
```

**Componentes:**
- `foodzinder` = usuario de la base de datos
- `TU_PASSWORD` = la contraseña que pusiste al crear PostgreSQL
- `postgres` = nombre del servicio (debe ser exactamente "postgres")
- `5432` = puerto de PostgreSQL
- `foodzinder_db` = nombre de la base de datos

### Paso 3: Verificar Variables de Entorno en Easypanel

1. Ve a tu servicio de la app (no la base de datos)
2. Click en **"Environment"**
3. Busca la variable `DATABASE_URL`
4. **Verifica que esté configurada correctamente**

---

## 🛠️ Soluciones por Tipo de Error

### Error: "Can't reach database server"

**Causa:** El nombre del host está mal

**Solución:**
```bash
# ❌ INCORRECTO (no usar localhost, 127.0.0.1, o IPs)
DATABASE_URL=postgresql://foodzinder:password@localhost:5432/foodzinder_db
DATABASE_URL=postgresql://foodzinder:password@127.0.0.1:5432/foodzinder_db
DATABASE_URL=postgresql://foodzinder:password@207.180.203.22:5432/foodzinder_db

# ✅ CORRECTO (usar el nombre del servicio en Easypanel)
DATABASE_URL=postgresql://foodzinder:password@postgres:5432/foodzinder_db
```

### Error: "Authentication failed"

**Causa:** Usuario o contraseña incorrectos

**Solución:**
1. En Easypanel, ve al servicio PostgreSQL
2. Click en **"Environment"**
3. Verifica estos valores:
   - `POSTGRES_USER` (debe ser `foodzinder`)
   - `POSTGRES_PASSWORD` (copia esta contraseña)
   - `POSTGRES_DB` (debe ser `foodzinder_db`)
4. Actualiza el `DATABASE_URL` en tu app con la contraseña correcta

### Error: "Database does not exist"

**Causa:** El nombre de la base de datos no coincide

**Solución:**
1. Ve al servicio PostgreSQL en Easypanel
2. Verifica el valor de `POSTGRES_DB`
3. Ese nombre DEBE coincidir con el final de tu `DATABASE_URL`

Ejemplo:
```bash
# Si en PostgreSQL tienes:
POSTGRES_DB=foodzinder_db

# Entonces tu DATABASE_URL debe terminar en:
DATABASE_URL=postgresql://user:pass@postgres:5432/foodzinder_db
                                                    ^^^^^^^^^^^^^
```

---

## ✅ Configuración Correcta Paso a Paso

### 1. Configurar PostgreSQL (si no lo hiciste)

En Easypanel:
1. Proyecto `foodzinder` → **"Add Service"** → **"Database"** → **"PostgreSQL"**
2. Configuración:
   ```
   Name: postgres
   PostgreSQL Version: 17
   ```
3. Click en **"Environment"** y configura:
   ```
   POSTGRES_USER=foodzinder
   POSTGRES_PASSWORD=TU_PASSWORD_MUY_SEGURA_AQUI
   POSTGRES_DB=foodzinder_db
   ```
4. **Guarda la contraseña** en un lugar seguro
5. Click en **"Deploy"**
6. Espera a que el estado sea verde (1-2 minutos)

### 2. Configurar la App

1. Ve al servicio de tu **app Next.js**
2. Click en **"Environment"**
3. Busca o añade la variable `DATABASE_URL`
4. Usa ESTE formato (reemplaza `TU_PASSWORD` con tu contraseña real):
   ```
   DATABASE_URL=postgresql://foodzinder:TU_PASSWORD@postgres:5432/foodzinder_db
   ```
5. **IMPORTANTE:** Asegúrate que `@postgres:` dice exactamente "postgres" (el nombre del servicio)
6. Click en **"Save"**
7. Click en **"Rebuild"** (icono de recargar)

### 3. Ejecutar Migraciones de Prisma

Una vez que la app se haya reconstruido:

1. En Easypanel, ve al servicio de tu **app**
2. Click en **"Terminal"** (icono de terminal)
3. Ejecuta estos comandos uno por uno:

   ```bash
   # Generar cliente de Prisma
   npx prisma generate

   # Aplicar el schema a la base de datos
   npx prisma db push

   # Verificar conexión
   npx prisma db execute --stdin <<< "SELECT 1;"
   ```

4. Si ves "Database migration applied" o "Connection successful" → **¡Éxito!** ✅
5. Si ves un error, **copia el mensaje completo** y continúa al diagnóstico avanzado

---

## 🔬 Diagnóstico Avanzado

### Opción 1: Probar la conexión directamente desde la app

1. Terminal en el servicio de la app:
   ```bash
   # Ver la DATABASE_URL que está usando la app
   echo $DATABASE_URL
   ```

2. Verifica que se vea algo como:
   ```
   postgresql://foodzinder:password@postgres:5432/foodzinder_db
   ```

3. Si está vacío o dice "undefined" → La variable no está configurada

### Opción 2: Probar conexión con psql

1. Terminal en el servicio PostgreSQL:
   ```bash
   psql -U foodzinder -d foodzinder_db
   ```

2. Si te pide contraseña, ingresa la que configuraste
3. Si conecta → PostgreSQL está funcionando correctamente
4. Escribe `\q` para salir

### Opción 3: Verificar conectividad entre servicios

1. Terminal en el servicio de la **app**:
   ```bash
   # Probar si puede alcanzar el servicio postgres
   ping -c 3 postgres

   # O usar nslookup
   nslookup postgres

   # O telnet
   nc -zv postgres 5432
   ```

2. Si dice "connection refused" o "host not found" → Hay un problema de red entre servicios

**Solución:** Asegúrate que ambos servicios (app y postgres) están en el **mismo proyecto** de Easypanel

---

## 📝 Checklist de Verificación

Marca cada uno:

- [ ] PostgreSQL está corriendo (estado verde en Easypanel)
- [ ] El servicio PostgreSQL se llama exactamente `postgres`
- [ ] La variable `POSTGRES_DB` es `foodzinder_db`
- [ ] La variable `POSTGRES_USER` es `foodzinder`
- [ ] Copié correctamente la `POSTGRES_PASSWORD`
- [ ] En la app, `DATABASE_URL` tiene el formato correcto
- [ ] En `DATABASE_URL`, el host es `postgres` (no localhost)
- [ ] En `DATABASE_URL`, la contraseña coincide con `POSTGRES_PASSWORD`
- [ ] En `DATABASE_URL`, el nombre de DB coincide con `POSTGRES_DB`
- [ ] Reconstruí la app después de cambiar variables
- [ ] Ejecuté `npx prisma generate`
- [ ] Ejecuté `npx prisma db push`

---

## 🎯 Configuración Recomendada (Copia/Pega)

### En PostgreSQL Service → Environment:
```bash
POSTGRES_USER=foodzinder
POSTGRES_PASSWORD=FoodZ1nd3r_S3cur3_2025_DB
POSTGRES_DB=foodzinder_db
```

### En App Service → Environment:
```bash
DATABASE_URL=postgresql://foodzinder:FoodZ1nd3r_S3cur3_2025_DB@postgres:5432/foodzinder_db
```

**⚠️ IMPORTANTE:** Cambia `FoodZ1nd3r_S3cur3_2025_DB` por tu propia contraseña segura

---

## 🚨 Errores Comunes y Soluciones

### "P1001: Can't reach database server"
- ✅ Cambia `@localhost` o `@127.0.0.1` por `@postgres`
- ✅ Verifica que ambos servicios estén en el mismo proyecto

### "P1002: The database server was reached but timed out"
- ✅ PostgreSQL está iniciando, espera 1-2 minutos
- ✅ Reinicia el servicio PostgreSQL

### "P1003: Database does not exist"
- ✅ Crea la base de datos o verifica el nombre en `POSTGRES_DB`
- ✅ El nombre en `DATABASE_URL` debe coincidir con `POSTGRES_DB`

### "P1017: Server has closed the connection"
- ✅ PostgreSQL está sobrecargado, reinicia el servicio
- ✅ Verifica que el VPS tenga suficiente RAM (mínimo 2GB)

### "SSL is not supported by this database"
- ✅ Cambia `DATABASE_URL` a:
  ```
  postgresql://foodzinder:password@postgres:5432/foodzinder_db?sslmode=prefer
  ```

---

## 🔄 Si Nada Funciona: Reset Completo

### Opción Nuclear (⚠️ Borrará todos los datos):

1. **Eliminar PostgreSQL:**
   - Ve al servicio `postgres` en Easypanel
   - Click en **"Settings"** → **"Delete Service"**
   - Confirma

2. **Crear PostgreSQL desde cero:**
   - Sigue los pasos de "Configuración Correcta Paso a Paso" arriba
   - Usa una contraseña NUEVA

3. **Actualizar la app:**
   - Actualiza `DATABASE_URL` con la nueva contraseña
   - Rebuild
   - Ejecuta las migraciones

---

## 📞 Necesitas Más Ayuda

Si después de seguir estos pasos aún no funciona, proporciona:

1. **Screenshot del error** que ves en los logs
2. **El valor de DATABASE_URL** (oculta la contraseña)
3. **Screenshot de las variables de entorno** del servicio PostgreSQL
4. **Screenshot del estado** de todos los servicios en Easypanel

---

## ✅ Verificación Final

Una vez que todo funcione, verifica:

```bash
# En la terminal de la app
npx prisma db execute --stdin <<< "SELECT NOW();"
```

Si ves la fecha y hora actual → **¡Conexión exitosa!** 🎉

Tu app ahora debería:
- Compilar ✅
- Conectar a la base de datos ✅
- Funcionar correctamente ✅
