import { PrismaClient, RestaurantStatus } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  console.log('📢 Publicando restaurantes...\n');

  const result = await prisma.restaurant.updateMany({
    where: {
      status: RestaurantStatus.PENDING,
    },
    data: {
      status: RestaurantStatus.PUBLISHED,
    },
  });

  console.log(`✅ ${result.count} restaurantes actualizados a PUBLISHED\n`);

  const total = await prisma.restaurant.count({
    where: { status: RestaurantStatus.PUBLISHED },
  });

  console.log(`📊 Total de restaurantes publicados: ${total}`);
}

main().finally(() => prisma.$disconnect());
