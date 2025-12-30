/**
 * Script para convertir un usuario en OWNER
 * Uso: tsx scripts/make-owner.ts <email>
 */

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const email = process.argv[2]

  if (!email) {
    console.error('❌ Error: Debes proporcionar un email')
    console.log('\nUso:')
    console.log('  tsx scripts/make-owner.ts tu-email@example.com')
    process.exit(1)
  }

  console.log(`🔍 Buscando usuario con email: ${email}...`)

  const user = await prisma.user.findUnique({
    where: { email }
  })

  if (!user) {
    console.log('❌ Usuario no encontrado')
    console.log('\n¿El usuario existe en Clerk?')
    console.log('El webhook debería haberlo creado automáticamente.')
    console.log('\nIntenta:')
    console.log('1. Cerrar sesión')
    console.log('2. Volver a iniciar sesión')
    console.log('3. Ejecutar este script de nuevo')
    process.exit(1)
  }

  console.log('✅ Usuario encontrado:', {
    id: user.id,
    email: user.email,
    firstName: user.firstName,
    lastName: user.lastName,
    role: user.role,
    clerkId: user.clerkId
  })

  if (user.role === 'OWNER') {
    console.log('\n✅ El usuario ya tiene rol OWNER')
    return
  }

  // Actualizar a OWNER
  const updated = await prisma.user.update({
    where: { email },
    data: { role: 'OWNER' }
  })

  console.log('\n🎉 ¡Usuario actualizado a OWNER!', {
    id: updated.id,
    email: updated.email,
    role: updated.role
  })

  console.log('\n📝 Próximos pasos:')
  console.log('1. Ve a http://localhost:3001/dashboard')
  console.log('2. Deberías ver el panel de control')
  console.log('3. Haz clic en "Nuevo Restaurante" para crear uno')
}

main()
  .catch((e) => {
    console.error('❌ Error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
