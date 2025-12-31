import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const total = await prisma.restaurant.count();
  console.log(`\nTotal de restaurantes en la base de datos: ${total}\n`);

  const restaurants = await prisma.restaurant.findMany({
    select: {
      name: true,
      status: true,
    },
    orderBy: {
      createdAt: 'desc',
    },
  });

  console.log('Lista de restaurantes:');
  restaurants.forEach((r, i) => {
    console.log(`${i + 1}. ${r.name} (${r.status})`);
  });
}

main().finally(() => prisma.$disconnect());
