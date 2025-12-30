/**
 * Script para crear un usuario OWNER de prueba
 * Uso: tsx scripts/create-test-owner.ts <clerkId>
 */

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const clerkId = process.argv[2]

  if (!clerkId) {
    console.error('❌ Error: Debes proporcionar un clerkId')
    console.log('\nUso:')
    console.log('  tsx scripts/create-test-owner.ts <tu-clerk-user-id>')
    console.log('\nCómo obtener tu clerkId:')
    console.log('  1. Inicia sesión en http://localhost:3001/sign-in')
    console.log('  2. Ve a tu perfil de Clerk')
    console.log('  3. Copia tu User ID')
    process.exit(1)
  }

  console.log(`🔍 Buscando usuario con clerkId: ${clerkId}...`)

  // Verificar si ya existe
  const existing = await prisma.user.findUnique({
    where: { clerkId }
  })

  if (existing) {
    console.log('✅ Usuario encontrado:', {
      id: existing.id,
      email: existing.email,
      firstName: existing.firstName,
      lastName: existing.lastName,
      role: existing.role
    })

    if (existing.role === 'OWNER') {
      console.log('✅ El usuario ya tiene rol OWNER')
      return
    }

    // Actualizar a OWNER
    const updated = await prisma.user.update({
      where: { clerkId },
      data: { role: 'OWNER' }
    })

    console.log('✅ Usuario actualizado a OWNER:', {
      id: updated.id,
      email: updated.email,
      role: updated.role
    })
  } else {
    console.log('❌ Usuario no encontrado en la base de datos')
    console.log('\nEl usuario debe estar registrado primero:')
    console.log('  1. Ve a http://localhost:3001/sign-up')
    console.log('  2. Registra tu cuenta')
    console.log('  3. Ejecuta este script nuevamente')
  }
}

main()
  .catch((e) => {
    console.error('❌ Error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
