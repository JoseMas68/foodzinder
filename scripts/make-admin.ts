/**
 * Script para convertir un usuario en ADMIN
 * Uso: tsx scripts/make-admin.ts <email>
 */

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const email = process.argv[2]

  if (!email) {
    console.error('❌ Error: Debes proporcionar un email')
    console.log('\nUso:')
    console.log('  tsx scripts/make-admin.ts tu-email@example.com')
    process.exit(1)
  }

  console.log(`🔍 Buscando usuario con email: ${email}...`)

  const user = await prisma.user.findUnique({
    where: { email }
  })

  if (!user) {
    console.log('❌ Usuario no encontrado')
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

  if (user.role === 'ADMIN') {
    console.log('\n✅ El usuario ya tiene rol ADMIN')
    return
  }

  // Actualizar a ADMIN
  const updated = await prisma.user.update({
    where: { email },
    data: { role: 'ADMIN' }
  })

  console.log('\n🎉 ¡Usuario actualizado a ADMIN!', {
    id: updated.id,
    email: updated.email,
    role: updated.role
  })

  console.log('\n📝 Como ADMIN, ahora puedes:')
  console.log('1. Ver todos los restaurantes (incluyendo pendientes)')
  console.log('2. Aprobar/rechazar restaurantes desde el dashboard')
  console.log('3. Ver estadísticas globales de la plataforma')
  console.log('\n⚠️  NOTA: Actualmente el dashboard de ADMIN no está implementado.')
  console.log('Por ahora, usa los scripts para aprobar restaurantes:')
  console.log('  - tsx scripts/list-pending-restaurants.ts')
  console.log('  - tsx scripts/approve-restaurant.ts <id>')
}

main()
  .catch((e) => {
    console.error('❌ Error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
