import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

/**
 * Script para actualizar los Clerk IDs de los usuarios de prueba
 * Después de crear los usuarios en Clerk Dashboard, ejecuta este script
 * con los IDs reales
 */
async function main() {
  console.log('🔧 Actualizando Clerk IDs de usuarios de prueba...\n');

  // INSTRUCCIONES:
  // 1. Ve a Clerk Dashboard: https://dashboard.clerk.com
  // 2. Crea 3 usuarios con estos emails:
  //    - admin@foodzinder.com
  //    - owner@foodzinder.com
  //    - user@foodzinder.com
  // 3. Copia el User ID de cada uno (empieza con "user_...")
  // 4. Pégalos aquí abajo:

  const CLERK_IDS = {
    admin: 'user_XXXXXXXXXXXXXXXXX', // Pega aquí el Clerk ID del admin
    owner: 'user_XXXXXXXXXXXXXXXXX', // Pega aquí el Clerk ID del owner
    user: 'user_XXXXXXXXXXXXXXXXX',  // Pega aquí el Clerk ID del user
  };

  // Verificar que se hayan actualizado los IDs
  if (
    CLERK_IDS.admin.includes('XXX') ||
    CLERK_IDS.owner.includes('XXX') ||
    CLERK_IDS.user.includes('XXX')
  ) {
    console.error('❌ ERROR: Debes actualizar los Clerk IDs en este script primero!\n');
    console.log('📝 Pasos:');
    console.log('   1. Abre scripts/update-clerk-ids.ts');
    console.log('   2. Reemplaza los "user_XXXXXXXXXXXXXXXXX" con los IDs reales de Clerk');
    console.log('   3. Vuelve a ejecutar este script\n');
    process.exit(1);
  }

  try {
    // Actualizar ADMIN
    const admin = await prisma.user.update({
      where: { email: 'admin@foodzinder.com' },
      data: { clerkId: CLERK_IDS.admin },
    });
    console.log(`✅ Admin actualizado: ${admin.email} -> ${admin.clerkId}`);

    // Actualizar OWNER
    const owner = await prisma.user.update({
      where: { email: 'owner@foodzinder.com' },
      data: { clerkId: CLERK_IDS.owner },
    });
    console.log(`✅ Owner actualizado: ${owner.email} -> ${owner.clerkId}`);

    // Actualizar USER
    const user = await prisma.user.update({
      where: { email: 'user@foodzinder.com' },
      data: { clerkId: CLERK_IDS.user },
    });
    console.log(`✅ User actualizado: ${user.email} -> ${user.clerkId}`);

    console.log('\n🎉 ¡Clerk IDs actualizados exitosamente!\n');
    console.log('✅ Ahora puedes hacer login con estos usuarios en tu app.');
  } catch (error) {
    console.error('❌ Error actualizando usuarios:', error);
    throw error;
  }
}

main()
  .catch((e) => {
    console.error('Error:', e);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
