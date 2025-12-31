import { PrismaClient, PriceRange, RestaurantStatus } from '@prisma/client';

const prisma = new PrismaClient();

const restaurants = [
  // Japonesa (3 restaurantes)
  {
    name: 'Sake Sushi Bar',
    slug: 'sake-sushi-bar',
    description: 'Sushi y sashimi de primera calidad. Pescado fresco traído diariamente de la lonja. Omakase disponible.',
    address: 'Calle Velázquez 45, Madrid',
    latitude: 40.4248,
    longitude: -3.6827,
    priceRange: PriceRange.EXPENSIVE,
    phone: '+34 914 123 456',
    website: 'https://sakesushibar.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/sushi-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/sushi-bar.jpg',
    cuisineType: 'Japonesa',
  },
  {
    name: 'Ramen House Tokio',
    slug: 'ramen-house-tokio',
    description: 'Ramen japonés auténtico. Caldo cocinado durante 18 horas, fideos frescos hechos a mano diariamente.',
    address: 'Calle Ponzano 34, Madrid',
    latitude: 40.4413,
    longitude: -3.6966,
    priceRange: PriceRange.CHEAP,
    phone: '+34 915 456 789',
    website: 'https://ramenhousetokio.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/ramen-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/ramen-bowl.jpg',
    cuisineType: 'Japonesa',
  },
  {
    name: 'Izakaya Yuki',
    slug: 'izakaya-yuki',
    description: 'Taberna japonesa tradicional. Yakitori, gyozas y sake premium en un ambiente auténtico.',
    address: 'Calle Muntaner 234, Barcelona',
    latitude: 41.4012,
    longitude: 2.1455,
    priceRange: PriceRange.MODERATE,
    phone: '+34 933 123 456',
    website: 'https://izakayayuki.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/izakaya-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/izakaya-interior.jpg',
    cuisineType: 'Japonesa',
  },

  // China (2 restaurantes)
  {
    name: 'Dragon Wok',
    slug: 'dragon-wok',
    description: 'Cocina china tradicional y dim sum. Pato laqueado, dumplings caseros y noodles salteados al wok.',
    address: 'Calle Aribau 156, Barcelona',
    latitude: 41.3976,
    longitude: 2.1543,
    priceRange: PriceRange.MODERATE,
    phone: '+34 933 234 567',
    website: 'https://dragonwok.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/chinese-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/wok-cooking.jpg',
    cuisineType: 'China',
  },
  {
    name: 'Casa Sichuan',
    slug: 'casa-sichuan',
    description: 'Cocina de Sichuan auténtica. Platos picantes, mapo tofu y hot pot tradicional chino.',
    address: 'Calle Galileo 67, Madrid',
    latitude: 40.4319,
    longitude: -3.7083,
    priceRange: PriceRange.CHEAP,
    phone: '+34 915 234 567',
    website: 'https://casasichuan.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/sichuan-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/sichuan-food.jpg',
    cuisineType: 'China',
  },
];

async function main() {
  console.log('🍜 Creando restaurantes asiáticos...\n');

  // Obtener taxonomías existentes
  const taxonomies = await prisma.taxonomy.findMany({
    where: { type: 'CUISINE_TYPE' },
  });

  // Obtener un usuario owner (el primero disponible)
  const owner = await prisma.user.findFirst({
    where: { role: 'OWNER' },
  });

  if (!owner) {
    throw new Error('No hay usuarios OWNER en la base de datos. Ejecuta el seed primero.');
  }

  let created = 0;
  let skipped = 0;

  for (const restaurant of restaurants) {
    try {
      // Buscar la taxonomía correspondiente
      const taxonomy = taxonomies.find(
        (t) => t.name.toLowerCase() === restaurant.cuisineType.toLowerCase()
      );

      if (!taxonomy) {
        console.log(`⚠️  Taxonomía "${restaurant.cuisineType}" no encontrada, saltando ${restaurant.name}`);
        skipped++;
        continue;
      }

      // Crear restaurante
      const createdRestaurant = await prisma.restaurant.create({
        data: {
          name: restaurant.name,
          slug: restaurant.slug,
          description: restaurant.description,
          address: restaurant.address,
          latitude: restaurant.latitude,
          longitude: restaurant.longitude,
          priceRange: restaurant.priceRange,
          phone: restaurant.phone,
          website: restaurant.website,
          logoUrl: restaurant.logoUrl,
          coverUrl: restaurant.coverUrl,
          status: RestaurantStatus.PUBLISHED,
          ownerId: owner.id,
          taxonomies: {
            create: {
              taxonomyId: taxonomy.id,
            },
          },
        },
      });

      console.log(`✅ ${createdRestaurant.name} - ${restaurant.cuisineType} (${restaurant.priceRange})`);
      created++;
    } catch (error) {
      console.error(`❌ Error creando ${restaurant.name}:`, error);
      skipped++;
    }
  }

  console.log(`\n📊 Resumen:`);
  console.log(`   ✅ ${created} restaurantes asiáticos creados`);
  console.log(`   ⚠️  ${skipped} restaurantes saltados`);
  console.log(`\n🎉 ¡Proceso completado!`);
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
