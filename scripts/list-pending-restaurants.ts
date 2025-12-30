/**
 * Script para listar restaurantes pendientes de aprobación
 * Uso: tsx scripts/list-pending-restaurants.ts
 */

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  console.log('🔍 Buscando restaurantes pendientes...\n')

  const pending = await prisma.restaurant.findMany({
    where: { status: 'PENDING' },
    include: {
      owner: {
        select: {
          email: true,
          firstName: true,
          lastName: true,
        }
      }
    },
    orderBy: {
      createdAt: 'desc'
    }
  })

  if (pending.length === 0) {
    console.log('✅ No hay restaurantes pendientes de aprobación')
    return
  }

  console.log(`📋 Restaurantes pendientes (${pending.length}):\n`)

  pending.forEach((restaurant, index) => {
    console.log(`${index + 1}. ${restaurant.name}`)
    console.log(`   ID: ${restaurant.id}`)
    console.log(`   Dueño: ${restaurant.owner.firstName} ${restaurant.owner.lastName} (${restaurant.owner.email})`)
    console.log(`   Dirección: ${restaurant.address}`)
    console.log(`   Creado: ${restaurant.createdAt.toLocaleDateString()}`)
    console.log('')
  })

  console.log('📝 Para aprobar un restaurante:')
  console.log('  tsx scripts/approve-restaurant.ts <restaurant-id>')
  console.log('\nEjemplo:')
  console.log(`  tsx scripts/approve-restaurant.ts ${pending[0].id}`)
}

main()
  .catch((e) => {
    console.error('❌ Error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
