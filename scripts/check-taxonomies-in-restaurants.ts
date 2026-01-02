import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  // Check restaurants with taxonomies
  const restaurantsWithTaxonomies = await prisma.restaurant.count({
    where: {
      status: 'APPROVED',
      taxonomies: {
        some: {}
      }
    }
  });

  console.log(`Restaurantes APPROVED con taxonomías: ${restaurantsWithTaxonomies} de 25`);

  // Check specific taxonomies
  const romantic = await prisma.restaurant.count({
    where: {
      status: 'APPROVED',
      taxonomies: {
        some: {
          taxonomy: {
            type: 'AMBIANCE',
            slug: { in: ['romantico', 'romantic', 'intimate'] }
          }
        }
      }
    }
  });

  const outdoor = await prisma.restaurant.count({
    where: {
      status: 'APPROVED',
      taxonomies: {
        some: {
          taxonomy: {
            type: 'RESTAURANT_FEATURE',
            slug: { in: ['outdoor', 'exterior', 'outdoor-seating'] }
          }
        }
      }
    }
  });

  console.log(`\nRestaurantes con filtro "romantic": ${romantic}`);
  console.log(`Restaurantes con filtro "outdoor": ${outdoor}`);

  // Show all available taxonomies
  const allTaxonomies = await prisma.taxonomy.findMany({
    where: {
      type: { in: ['AMBIANCE', 'RESTAURANT_FEATURE'] }
    },
    select: {
      type: true,
      slug: true,
      _count: {
        select: {
          restaurants: true
        }
      }
    },
    orderBy: [
      { type: 'asc' },
      { _count: { restaurants: 'desc' } }
    ]
  });

  console.log(`\nTaxonomías disponibles (${allTaxonomies.length}):`);
  let currentType = '';
  allTaxonomies.forEach(tax => {
    if (tax.type !== currentType) {
      currentType = tax.type;
      console.log(`\n${currentType}:`);
    }
    console.log(`  - ${tax.slug} (${tax._count.restaurants} restaurantes)`);
  });
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
