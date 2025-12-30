/**
 * Script para aprobar restaurantes manualmente
 * Uso: tsx scripts/approve-restaurant.ts <restaurant-id>
 */

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const restaurantId = process.argv[2]

  if (!restaurantId) {
    console.error('❌ Error: Debes proporcionar el ID del restaurante')
    console.log('\nUso:')
    console.log('  tsx scripts/approve-restaurant.ts <restaurant-id>')
    console.log('\nPara ver los restaurantes pendientes:')
    console.log('  tsx scripts/list-pending-restaurants.ts')
    process.exit(1)
  }

  console.log(`🔍 Buscando restaurante con ID: ${restaurantId}...`)

  const restaurant = await prisma.restaurant.findUnique({
    where: { id: restaurantId },
    include: {
      owner: {
        select: {
          email: true,
          firstName: true,
          lastName: true,
        }
      }
    }
  })

  if (!restaurant) {
    console.log('❌ Restaurante no encontrado')
    process.exit(1)
  }

  console.log('✅ Restaurante encontrado:', {
    id: restaurant.id,
    name: restaurant.name,
    status: restaurant.status,
    owner: `${restaurant.owner.firstName} ${restaurant.owner.lastName} (${restaurant.owner.email})`,
  })

  if (restaurant.status === 'APPROVED') {
    console.log('\n✅ El restaurante ya está APROBADO')
    return
  }

  if (restaurant.status === 'ARCHIVED') {
    console.log('\n⚠️  El restaurante está ARCHIVADO')
    console.log('¿Quieres aprobarlo de todas formas? Usa --force')
    if (!process.argv.includes('--force')) {
      process.exit(1)
    }
  }

  // Aprobar restaurante
  const updated = await prisma.restaurant.update({
    where: { id: restaurantId },
    data: {
      status: 'APPROVED',
      updatedAt: new Date()
    }
  })

  console.log('\n🎉 ¡Restaurante APROBADO!', {
    id: updated.id,
    name: updated.name,
    status: updated.status,
  })

  console.log('\n📝 El restaurante ahora aparecerá en:')
  console.log('1. Página pública: http://localhost:3001/restaurants')
  console.log('2. Página del restaurante: http://localhost:3001/restaurants/' + updated.id)
  console.log('3. Dashboard del dueño: http://localhost:3001/dashboard/restaurants')
}

main()
  .catch((e) => {
    console.error('❌ Error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
