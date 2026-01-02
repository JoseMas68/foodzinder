import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const approvedCount = await prisma.restaurant.count({
    where: { status: 'APPROVED' }
  });

  console.log(`Total restaurantes APPROVED: ${approvedCount}`);

  if (approvedCount > 0) {
    const sample = await prisma.restaurant.findMany({
      where: { status: 'APPROVED' },
      take: 3,
      select: {
        name: true,
        address: true,
        priceRange: true,
      }
    });

    console.log('\nEjemplos de restaurantes APPROVED:');
    sample.forEach((r, i) => {
      console.log(`${i + 1}. ${r.name} - ${r.address} - ${r.priceRange}`);
    });
  }

  const sections = await prisma.pageSection.findMany({
    where: { isActive: true, type: 'CAROUSEL' },
    select: {
      title: true,
      config: true,
    }
  });

  console.log(`\nSecciones CAROUSEL activas: ${sections.length}`);
  sections.forEach((s, i) => {
    console.log(`${i + 1}. "${s.title}" - Filter: ${s.config?.filter}, Limit: ${s.config?.limit}`);
  });
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
