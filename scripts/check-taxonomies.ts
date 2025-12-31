import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const taxonomies = await prisma.taxonomy.findMany({
    where: { type: 'CUISINE_TYPE' },
  });

  console.log('Tipos de cocina disponibles:');
  taxonomies.forEach((t) => console.log(`- ${t.name}`));
}

main()
  .finally(() => prisma.$disconnect());
