import { PrismaClient, RestaurantStatus } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  console.log('✅ Aprobando restaurantes...\n');

  const result = await prisma.restaurant.updateMany({
    where: {
      status: RestaurantStatus.PENDING,
    },
    data: {
      status: RestaurantStatus.APPROVED,
    },
  });

  console.log(`✅ ${result.count} restaurantes actualizados a APPROVED\n`);

  const total = await prisma.restaurant.count({
    where: { status: RestaurantStatus.APPROVED },
  });

  console.log(`📊 Total de restaurantes aprobados: ${total}`);
}

main().finally(() => prisma.$disconnect());
