import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  // Get all taxonomies used by approved restaurants
  const restaurantTaxonomies = await prisma.restaurantTaxonomy.findMany({
    where: {
      restaurant: {
        status: 'APPROVED'
      }
    },
    include: {
      taxonomy: true
    }
  });

  const taxonomyCount: Record<string, { type: string; count: number }> = {};

  restaurantTaxonomies.forEach(rt => {
    const key = rt.taxonomy.slug;
    if (!taxonomyCount[key]) {
      taxonomyCount[key] = {
        type: rt.taxonomy.type,
        count: 0
      };
    }
    taxonomyCount[key].count++;
  });

  // Sort by count
  const sorted = Object.entries(taxonomyCount).sort((a, b) => b[1].count - a[1].count);

  console.log('Taxonomías usadas en restaurantes APPROVED:\n');

  let currentType = '';
  sorted.forEach(([slug, data]) => {
    if (data.type !== currentType) {
      currentType = data.type;
      console.log(`\n${currentType}:`);
    }
    console.log(`  - ${slug}: ${data.count} restaurantes`);
  });
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
