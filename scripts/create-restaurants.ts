import { PrismaClient, PriceRange, RestaurantStatus } from '@prisma/client';

const prisma = new PrismaClient();

const restaurants = [
  // Española (5 restaurantes)
  {
    name: 'La Taberna del Abuelo',
    slug: 'la-taberna-del-abuelo',
    description: 'Cocina tradicional española en un ambiente acogedor. Especialidades de la casa: cocido madrileño, paella valenciana y chuletón de buey.',
    address: 'Calle Mayor 28, Madrid',
    latitude: 40.4168,
    longitude: -3.7038,
    priceRange: PriceRange.MODERATE,
    phone: '+34 915 123 456',
    website: 'https://latabernadelabuelo.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/spanish-restaurant-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/spanish-restaurant.jpg',
    cuisineType: 'Española',
  },
  {
    name: 'El Rincón Andaluz',
    slug: 'el-rincon-andaluz',
    description: 'Tapas y raciones andaluzas con el mejor ambiente flamenco. Prueba nuestros pescaítos fritos y salmorejo cordobés.',
    address: 'Plaza de España 15, Sevilla',
    latitude: 37.3891,
    longitude: -5.9845,
    priceRange: PriceRange.CHEAP,
    phone: '+34 954 234 567',
    website: 'https://elrinconandaluz.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/andalusian-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/andalusian-tapas.jpg',
    cuisineType: 'Española',
  },
  {
    name: 'Casa Vasca',
    slug: 'casa-vasca',
    description: 'Alta cocina vasca con productos de temporada. Especialidades: bacalao al pil-pil, txuleton y kokotxas de merluza.',
    address: 'Paseo de la Concha 7, San Sebastián',
    latitude: 43.3183,
    longitude: -1.9812,
    priceRange: PriceRange.EXPENSIVE,
    phone: '+34 943 345 678',
    website: 'https://casavasca.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/basque-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/basque-cuisine.jpg',
    cuisineType: 'Española',
  },
  {
    name: 'Paella & Mar',
    slug: 'paella-y-mar',
    description: 'Restaurante frente al mar especializado en arroces y mariscos valencianos. Paella tradicional cocinada con leña.',
    address: 'Paseo Marítimo 45, Valencia',
    latitude: 39.4699,
    longitude: -0.3763,
    priceRange: PriceRange.MODERATE,
    phone: '+34 963 456 789',
    website: 'https://paellaymar.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/paella-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/paella-restaurant.jpg',
    cuisineType: 'Española',
  },
  {
    name: 'Mesón Castellano',
    slug: 'meson-castellano',
    description: 'Cocina castellana de toda la vida. Cordero asado, cochinillo y sopa castellana en horno de leña tradicional.',
    address: 'Plaza Mayor 3, Segovia',
    latitude: 40.9429,
    longitude: -4.1088,
    priceRange: PriceRange.MODERATE,
    phone: '+34 921 567 890',
    website: 'https://mesoncastellano.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/castilian-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/castilian-food.jpg',
    cuisineType: 'Española',
  },

  // Italiana (5 restaurantes)
  {
    name: 'Trattoria Bella Napoli',
    slug: 'trattoria-bella-napoli',
    description: 'Auténtica cocina napolitana. Pizza en horno de piedra, pasta fresca casera y postres tradicionales italianos.',
    address: 'Calle Goya 32, Barcelona',
    latitude: 41.3851,
    longitude: 2.1734,
    priceRange: PriceRange.MODERATE,
    phone: '+34 933 678 901',
    website: 'https://bellanapoli.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/italian-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/italian-restaurant.jpg',
    cuisineType: 'Italiana',
  },
  {
    name: 'Osteria del Centro',
    slug: 'osteria-del-centro',
    description: 'Cocina italiana moderna con toques contemporáneos. Risotto de trufa, ossobuco y tiramisú de la casa.',
    address: 'Calle Serrano 89, Madrid',
    latitude: 40.4378,
    longitude: -3.6879,
    priceRange: PriceRange.EXPENSIVE,
    phone: '+34 914 789 012',
    website: 'https://osteriadelcentro.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/osteria-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/osteria-interior.jpg',
    cuisineType: 'Italiana',
  },
  {
    name: 'Pizzeria Da Marco',
    slug: 'pizzeria-da-marco',
    description: 'Pizzería familiar con recetas traídas directamente de Roma. Masa madre de 48h de fermentación.',
    address: 'Avenida Diagonal 234, Barcelona',
    latitude: 41.3977,
    longitude: 2.1607,
    priceRange: PriceRange.CHEAP,
    phone: '+34 932 890 123',
    website: 'https://pizzeriadamarco.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/pizzeria-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/pizza-oven.jpg',
    cuisineType: 'Italiana',
  },
  {
    name: 'Il Giardino Toscano',
    slug: 'il-giardino-toscano',
    description: 'Cocina toscana de alta gama. Carnes a la parrilla, pasta fresca y una extensa carta de vinos italianos.',
    address: 'Paseo de Gracia 67, Barcelona',
    latitude: 41.3922,
    longitude: 2.1649,
    priceRange: PriceRange.LUXURY,
    phone: '+34 933 901 234',
    website: 'https://ilgiardinotoscano.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/tuscan-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/tuscan-restaurant.jpg',
    cuisineType: 'Italiana',
  },
  {
    name: 'Pasta & Basta',
    slug: 'pasta-y-basta',
    description: 'Restaurante casual italiano especializado en pasta fresca. Precios asequibles y ambiente familiar.',
    address: 'Calle Fuencarral 78, Madrid',
    latitude: 40.4267,
    longitude: -3.7007,
    priceRange: PriceRange.CHEAP,
    phone: '+34 915 012 345',
    website: 'https://pastaybasta.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/pasta-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/fresh-pasta.jpg',
    cuisineType: 'Italiana',
  },

  // Asiática (5 restaurantes)
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
    cuisineType: 'Asiática',
  },
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
    cuisineType: 'Asiática',
  },
  {
    name: 'Thai Orchid',
    slug: 'thai-orchid',
    description: 'Auténtica cocina tailandesa. Curry verde, pad thai y tom yum preparados por chefs tailandeses.',
    address: 'Plaza Santa Ana 12, Madrid',
    latitude: 40.4145,
    longitude: -3.7007,
    priceRange: PriceRange.MODERATE,
    phone: '+34 915 345 678',
    website: 'https://thaiorchid.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/thai-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/thai-restaurant.jpg',
    cuisineType: 'Asiática',
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
    cuisineType: 'Asiática',
  },
  {
    name: 'Pho Vietnam',
    slug: 'pho-vietnam',
    description: 'Cocina vietnamita tradicional. Pho, banh mi y rollitos frescos en un ambiente auténtico.',
    address: 'Calle Escudellers 23, Barcelona',
    latitude: 41.3798,
    longitude: 2.1738,
    priceRange: PriceRange.CHEAP,
    phone: '+34 933 567 890',
    website: 'https://phovietnam.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/vietnamese-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/pho-bowl.jpg',
    cuisineType: 'Asiática',
  },

  // Mexicana (5 restaurantes)
  {
    name: 'La Taquería Mexicana',
    slug: 'la-taqueria-mexicana',
    description: 'Tacos auténticos estilo México DF. Carne asada, al pastor y carnitas con tortillas hechas a mano.',
    address: 'Calle Hortaleza 92, Madrid',
    latitude: 40.4289,
    longitude: -3.6976,
    priceRange: PriceRange.CHEAP,
    phone: '+34 915 678 901',
    website: 'https://lataqueriamexicana.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/taqueria-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/tacos-mexicanos.jpg',
    cuisineType: 'Mexicana',
  },
  {
    name: 'Cantina del Sur',
    slug: 'cantina-del-sur',
    description: 'Cocina mexicana tradicional y mezcalería. Mole poblano, cochinita pibil y más de 100 tipos de mezcal.',
    address: 'Calle Blai 45, Barcelona',
    latitude: 41.3745,
    longitude: 2.1669,
    priceRange: PriceRange.MODERATE,
    phone: '+34 933 789 012',
    website: 'https://cantinadelsur.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/cantina-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/mexican-cantina.jpg',
    cuisineType: 'Mexicana',
  },
  {
    name: 'Mariachi Loco',
    slug: 'mariachi-loco',
    description: 'Tex-Mex con ambiente festivo. Burritos gigantes, fajitas y margaritas. Mariachis los fines de semana.',
    address: 'Calle Cruz 15, Madrid',
    latitude: 40.4156,
    longitude: -3.7025,
    priceRange: PriceRange.CHEAP,
    phone: '+34 915 890 123',
    website: 'https://mariachiloco.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/mariachi-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/tex-mex.jpg',
    cuisineType: 'Mexicana',
  },
  {
    name: 'Tulum Beach Club',
    slug: 'tulum-beach-club',
    description: 'Cocina mexicana de autor con vistas al mar. Ceviches, tiraditos y coctelería tropical de lujo.',
    address: 'Paseo Marítimo 12, Marbella',
    latitude: 36.5101,
    longitude: -4.8842,
    priceRange: PriceRange.LUXURY,
    phone: '+34 952 901 234',
    website: 'https://tulumbeachclub.com',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/tulum-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/beach-mexican.jpg',
    cuisineType: 'Mexicana',
  },
  {
    name: 'El Güero',
    slug: 'el-guero',
    description: 'Street food mexicano. Quesadillas, tortas y elotes en un local informal y divertido.',
    address: 'Rambla del Raval 34, Barcelona',
    latitude: 41.3796,
    longitude: 2.1688,
    priceRange: PriceRange.CHEAP,
    phone: '+34 933 012 345',
    website: 'https://elguero.es',
    logoUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/street-mexican-logo.jpg',
    coverUrl: 'https://res.cloudinary.com/dtrrkfgy2/image/upload/v1735607000/samples/food/street-tacos.jpg',
    cuisineType: 'Mexicana',
  },
];

async function main() {
  console.log('🍽️  Creando 20 restaurantes...\n');

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
  console.log(`   ✅ ${created} restaurantes creados`);
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
