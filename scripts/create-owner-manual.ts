/**
 * Script para crear manualmente un usuario OWNER
 * Usa esto si el webhook no funcionó
 */

import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const email = 'josemas68@gmail.com'
  const clerkId = process.argv[2] || 'temp_clerk_id_' + Date.now()

  console.log(`🔨 Creando usuario OWNER manualmente...`)
  console.log(`📧 Email: ${email}`)
  console.log(`🔑 ClerkId: ${clerkId}`)

  try {
    const user = await prisma.user.create({
      data: {
        clerkId,
        email,
        firstName: 'Jose',
        lastName: 'Mas',
        role: 'OWNER',
      },
    })

    console.log('\n✅ Usuario OWNER creado exitosamente!', {
      id: user.id,
      email: user.email,
      role: user.role,
      clerkId: user.clerkId,
    })

    console.log('\n📝 IMPORTANTE:')
    console.log('Este usuario tiene un clerkId temporal.')
    console.log('Cuando inicies sesión con Clerk, actualiza el clerkId real.')
    console.log('\nPuedes hacerlo en Prisma Studio:')
    console.log('1. Abre http://localhost:5555')
    console.log('2. Ve a la tabla User')
    console.log('3. Busca josemas68@gmail.com')
    console.log('4. Actualiza el clerkId con tu ID real de Clerk')

  } catch (error: any) {
    if (error.code === 'P2002') {
      console.log('\n⚠️  El usuario ya existe. Intentando actualizar a OWNER...')

      const updated = await prisma.user.update({
        where: { email },
        data: { role: 'OWNER' },
      })

      console.log('\n✅ Usuario actualizado a OWNER!', {
        id: updated.id,
        email: updated.email,
        role: updated.role,
      })
    } else {
      throw error
    }
  }

  console.log('\n🎉 ¡Listo! Ahora puedes:')
  console.log('1. Ir a http://localhost:3001/dashboard')
  console.log('2. Crear restaurantes desde el panel')
}

main()
  .catch((e) => {
    console.error('❌ Error:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
