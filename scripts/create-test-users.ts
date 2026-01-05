import { PrismaClient, UserRole } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  console.log('🔧 Creando usuarios de prueba...\n');

  // Usuario 1: ADMIN
  const admin = await prisma.user.upsert({
    where: { email: 'admin@foodzinder.com' },
    update: {
      role: UserRole.ADMIN,
    },
    create: {
      clerkId: 'test_admin_clerk_id',
      email: 'admin@foodzinder.com',
      firstName: 'Admin',
      lastName: 'Foodzinder',
      role: UserRole.ADMIN,
    },
  });

  console.log('✅ Usuario ADMIN creado:');
  console.log(`   Email: ${admin.email}`);
  console.log(`   Role: ${admin.role}`);
  console.log(`   ID: ${admin.id}\n`);

  // Usuario 2: OWNER
  const owner = await prisma.user.upsert({
    where: { email: 'owner@foodzinder.com' },
    update: {
      role: UserRole.OWNER,
    },
    create: {
      clerkId: 'test_owner_clerk_id',
      email: 'owner@foodzinder.com',
      firstName: 'Owner',
      lastName: 'Restaurant',
      role: UserRole.OWNER,
    },
  });

  console.log('✅ Usuario OWNER creado:');
  console.log(`   Email: ${owner.email}`);
  console.log(`   Role: ${owner.role}`);
  console.log(`   ID: ${owner.id}\n`);

  // Usuario 3: USER (cliente normal)
  const user = await prisma.user.upsert({
    where: { email: 'user@foodzinder.com' },
    update: {
      role: UserRole.USER,
    },
    create: {
      clerkId: 'test_user_clerk_id',
      email: 'user@foodzinder.com',
      firstName: 'Usuario',
      lastName: 'Prueba',
      role: UserRole.USER,
    },
  });

  console.log('✅ Usuario USER creado:');
  console.log(`   Email: ${user.email}`);
  console.log(`   Role: ${user.role}`);
  console.log(`   ID: ${user.id}\n`);

  console.log('🎉 ¡3 usuarios de prueba creados exitosamente!\n');
  console.log('📋 Resumen de credenciales:');
  console.log('═══════════════════════════════════════════════════\n');
  console.log('🔴 ADMIN:');
  console.log(`   Email: admin@foodzinder.com`);
  console.log(`   Clerk ID: test_admin_clerk_id`);
  console.log(`   Permisos: Acceso total, gestión de usuarios\n`);

  console.log('🟡 OWNER:');
  console.log(`   Email: owner@foodzinder.com`);
  console.log(`   Clerk ID: test_owner_clerk_id`);
  console.log(`   Permisos: Gestión de restaurantes propios\n`);

  console.log('🟢 USER:');
  console.log(`   Email: user@foodzinder.com`);
  console.log(`   Clerk ID: test_user_clerk_id`);
  console.log(`   Permisos: Reservas, reseñas, favoritos\n`);

  console.log('═══════════════════════════════════════════════════\n');
  console.log('⚠️  IMPORTANTE:');
  console.log('   Para usar estos usuarios en Clerk, necesitas:');
  console.log('   1. Ir a Clerk Dashboard');
  console.log('   2. Crear usuarios con estos emails');
  console.log('   3. Copiar el Clerk ID real de cada usuario');
  console.log('   4. Actualizar los clerkId en la base de datos\n');
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());
