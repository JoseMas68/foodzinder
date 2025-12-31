import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const restaurantImages: Record<string, { logoUrl: string; coverUrl: string }> = {
  // Española
  'la-taberna-del-abuelo': {
    logoUrl: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=1200&h=600&fit=crop',
  },
  'el-rincon-andaluz': {
    logoUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=1200&h=600&fit=crop',
  },
  'casa-vasca': {
    logoUrl: 'https://images.unsplash.com/photo-1592861956120-e524fc739696?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1590846406792-0adc7f938f1d?w=1200&h=600&fit=crop',
  },
  'paella-y-mar': {
    logoUrl: 'https://images.unsplash.com/photo-1534080564583-6be75777b70a?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1622973536968-3ead9e1d9e6b?w=1200&h=600&fit=crop',
  },
  'meson-castellano': {
    logoUrl: 'https://images.unsplash.com/photo-1551218808-94e220e084d2?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17?w=1200&h=600&fit=crop',
  },

  // Italiana
  'trattoria-bella-napoli': {
    logoUrl: 'https://images.unsplash.com/photo-1595295333158-4742f28fbd85?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?w=1200&h=600&fit=crop',
  },
  'osteria-del-centro': {
    logoUrl: 'https://images.unsplash.com/photo-1579631542720-3a87824fff86?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1424847651672-bf20a4b0982b?w=1200&h=600&fit=crop',
  },
  'pizzeria-da-marco': {
    logoUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1571997478779-2adcbbe9ab2f?w=1200&h=600&fit=crop',
  },
  'il-giardino-toscano': {
    logoUrl: 'https://images.unsplash.com/photo-1517686469429-8bdb88b9f907?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1559339352-11d035aa65de?w=1200&h=600&fit=crop',
  },
  'pasta-y-basta': {
    logoUrl: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=1200&h=600&fit=crop',
  },

  // Japonesa
  'sake-sushi-bar': {
    logoUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1553621042-f6e147245754?w=1200&h=600&fit=crop',
  },
  'ramen-house-tokio': {
    logoUrl: 'https://images.unsplash.com/photo-1557872943-16a5ac26437e?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1623341214825-9f4f963727da?w=1200&h=600&fit=crop',
  },
  'izakaya-yuki': {
    logoUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=1200&h=600&fit=crop',
  },

  // China
  'dragon-wok': {
    logoUrl: 'https://images.unsplash.com/photo-1582878826629-29b7ad1cdc43?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1525755662778-989d0524087e?w=1200&h=600&fit=crop',
  },
  'casa-sichuan': {
    logoUrl: 'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1563245372-f21724e3856d?w=1200&h=600&fit=crop',
  },

  // Mexicana
  'la-taqueria-mexicana': {
    logoUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1613514785940-daed07799d9b?w=1200&h=600&fit=crop',
  },
  'cantina-del-sur': {
    logoUrl: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=1200&h=600&fit=crop',
  },
  'mariachi-loco': {
    logoUrl: 'https://images.unsplash.com/photo-1604467707321-70d5ac45adda?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1599974579688-8dbdd335c77f?w=1200&h=600&fit=crop',
  },
  'tulum-beach-club': {
    logoUrl: 'https://images.unsplash.com/photo-1514933651103-005eec06c04b?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1559827260-dc66d52bef19?w=1200&h=600&fit=crop',
  },
  'el-guero': {
    logoUrl: 'https://images.unsplash.com/photo-1625622266634-e0fd96d81426?w=400&h=400&fit=crop',
    coverUrl: 'https://images.unsplash.com/photo-1565299507177-b0ac66763828?w=1200&h=600&fit=crop',
  },
};

async function main() {
  console.log('🖼️  Actualizando imágenes de restaurantes...\n');

  let updated = 0;
  let notFound = 0;

  for (const [slug, images] of Object.entries(restaurantImages)) {
    try {
      const result = await prisma.restaurant.updateMany({
        where: { slug },
        data: {
          logoUrl: images.logoUrl,
          coverUrl: images.coverUrl,
        },
      });

      if (result.count > 0) {
        console.log(`✅ ${slug} - Imágenes actualizadas`);
        updated++;
      } else {
        console.log(`⚠️  ${slug} - No encontrado`);
        notFound++;
      }
    } catch (error) {
      console.error(`❌ Error actualizando ${slug}:`, error);
    }
  }

  console.log(`\n📊 Resumen:`);
  console.log(`   ✅ ${updated} restaurantes actualizados`);
  console.log(`   ⚠️  ${notFound} restaurantes no encontrados`);
}

main().finally(() => prisma.$disconnect());
