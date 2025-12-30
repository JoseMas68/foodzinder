/**
 * Seed script para poblar la base de datos con datos de prueba
 * Ejecutar con: npm run db:seed
 */

import { PrismaClient, UserRole, RestaurantStatus, PriceRange, TaxonomyType } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  console.log('🌱 Iniciando seed de la base de datos...')

  // Limpiar datos existentes (opcional - comentar si no quieres borrar)
  console.log('🗑️  Limpiando datos existentes...')
  await prisma.review.deleteMany()
  await prisma.dish.deleteMany()
  await prisma.restaurantMenu.deleteMany()
  await prisma.menu.deleteMany()
  await prisma.restaurantTaxonomy.deleteMany()
  await prisma.taxonomy.deleteMany()
  await prisma.restaurant.deleteMany()
  await prisma.user.deleteMany()

  // 1. Crear Usuarios
  console.log('👤 Creando usuarios...')
  const admin = await prisma.user.create({
    data: {
      id: 'admin_001',
      clerkId: 'clerk_admin_001',
      email: 'admin@foodzinder.com',
      firstName: 'Admin',
      lastName: 'Foodzinder',
      role: UserRole.ADMIN,
    },
  })

  const owner1 = await prisma.user.create({
    data: {
      id: 'owner_001',
      clerkId: 'clerk_owner_001',
      email: 'juan@restaurant.com',
      firstName: 'Juan',
      lastName: 'García',
      role: UserRole.OWNER,
    },
  })

  const owner2 = await prisma.user.create({
    data: {
      id: 'owner_002',
      clerkId: 'clerk_owner_002',
      email: 'maria@restaurant.com',
      firstName: 'María',
      lastName: 'López',
      role: UserRole.OWNER,
    },
  })

  const user1 = await prisma.user.create({
    data: {
      id: 'user_001',
      clerkId: 'clerk_user_001',
      email: 'carlos@example.com',
      firstName: 'Carlos',
      lastName: 'Martínez',
      role: UserRole.USER,
    },
  })

  const user2 = await prisma.user.create({
    data: {
      id: 'user_002',
      clerkId: 'clerk_user_002',
      email: 'ana@example.com',
      firstName: 'Ana',
      lastName: 'Rodríguez',
      role: UserRole.USER,
    },
  })

  console.log(`✅ ${5} usuarios creados`)

  // 2. Crear Taxonomías
  console.log('🏷️  Creando taxonomías...')
  const cuisineTypes = await Promise.all([
    prisma.taxonomy.create({
      data: { type: TaxonomyType.CUISINE_TYPE, name: 'Italiana', slug: 'italiana' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.CUISINE_TYPE, name: 'Mexicana', slug: 'mexicana' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.CUISINE_TYPE, name: 'Japonesa', slug: 'japonesa' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.CUISINE_TYPE, name: 'Española', slug: 'espanola' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.CUISINE_TYPE, name: 'Americana', slug: 'americana' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.CUISINE_TYPE, name: 'China', slug: 'china' },
    }),
  ])

  const features = await Promise.all([
    prisma.taxonomy.create({
      data: { type: TaxonomyType.RESTAURANT_FEATURE, name: 'Terraza', slug: 'terraza' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.RESTAURANT_FEATURE, name: 'Wifi Gratis', slug: 'wifi-gratis' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.RESTAURANT_FEATURE, name: 'Parking', slug: 'parking' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.RESTAURANT_FEATURE, name: 'Pet Friendly', slug: 'pet-friendly' },
    }),
  ])

  const dietary = await Promise.all([
    prisma.taxonomy.create({
      data: { type: TaxonomyType.DIETARY, name: 'Vegano', slug: 'vegano' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.DIETARY, name: 'Vegetariano', slug: 'vegetariano' },
    }),
    prisma.taxonomy.create({
      data: { type: TaxonomyType.DIETARY, name: 'Sin Gluten', slug: 'sin-gluten' },
    }),
  ])

  console.log(`✅ ${cuisineTypes.length + features.length + dietary.length} taxonomías creadas`)

  // 3. Crear Restaurantes
  console.log('🍽️  Creando restaurantes...')

  const restaurant1 = await prisma.restaurant.create({
    data: {
      name: 'La Trattoria di Roma',
      slug: 'la-trattoria-di-roma',
      description: 'Auténtica cocina italiana en el corazón de la ciudad. Pasta fresca hecha a mano todos los días.',
      address: 'Calle Mayor 45, Madrid',
      latitude: 40.4168,
      longitude: -3.7038,
      status: RestaurantStatus.APPROVED,
      logoUrl: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=200',
      coverUrl: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800',
      priceRange: PriceRange.MODERATE,
      ownerId: owner1.id,
    },
  })

  const restaurant2 = await prisma.restaurant.create({
    data: {
      name: 'Sushi Master',
      slug: 'sushi-master',
      description: 'Experiencia japonesa auténtica. Sushi y sashimi de la más alta calidad.',
      address: 'Avenida Diagonal 123, Barcelona',
      latitude: 41.3851,
      longitude: 2.1734,
      status: RestaurantStatus.APPROVED,
      logoUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=200',
      coverUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=800',
      priceRange: PriceRange.EXPENSIVE,
      ownerId: owner1.id,
    },
  })

  const restaurant3 = await prisma.restaurant.create({
    data: {
      name: 'Tacos El Patrón',
      slug: 'tacos-el-patron',
      description: 'Los mejores tacos de la ciudad. Recetas tradicionales mexicanas con un toque moderno.',
      address: 'Calle de Alcalá 78, Madrid',
      latitude: 40.4200,
      longitude: -3.6900,
      status: RestaurantStatus.APPROVED,
      logoUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=200',
      coverUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=800',
      priceRange: PriceRange.CHEAP,
      ownerId: owner2.id,
    },
  })

  const restaurant4 = await prisma.restaurant.create({
    data: {
      name: 'Burger Haven',
      slug: 'burger-haven',
      description: 'Hamburguesas gourmet con ingredientes premium. La mejor carne angus de la región.',
      address: 'Gran Vía 56, Madrid',
      latitude: 40.4190,
      longitude: -3.7000,
      status: RestaurantStatus.APPROVED,
      logoUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=200',
      coverUrl: 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=800',
      priceRange: PriceRange.MODERATE,
      ownerId: owner2.id,
    },
  })

  const restaurant5 = await prisma.restaurant.create({
    data: {
      name: 'El Asador Vasco',
      slug: 'el-asador-vasco',
      description: 'Cocina vasca tradicional. Chuletón a la brasa y pescado fresco del Cantábrico.',
      address: 'Paseo de la Castellana 90, Madrid',
      latitude: 40.4300,
      longitude: -3.6900,
      status: RestaurantStatus.APPROVED,
      logoUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=200',
      coverUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=800',
      priceRange: PriceRange.LUXURY,
      ownerId: owner1.id,
    },
  })

  console.log(`✅ ${5} restaurantes creados`)

  // 4. Asociar Taxonomías a Restaurantes
  console.log('🔗 Asociando taxonomías a restaurantes...')

  await prisma.restaurantTaxonomy.createMany({
    data: [
      { restaurantId: restaurant1.id, taxonomyId: cuisineTypes[0].id }, // Italiana
      { restaurantId: restaurant1.id, taxonomyId: features[0].id }, // Terraza
      { restaurantId: restaurant1.id, taxonomyId: features[1].id }, // Wifi

      { restaurantId: restaurant2.id, taxonomyId: cuisineTypes[2].id }, // Japonesa
      { restaurantId: restaurant2.id, taxonomyId: features[3].id }, // Pet Friendly

      { restaurantId: restaurant3.id, taxonomyId: cuisineTypes[1].id }, // Mexicana
      { restaurantId: restaurant3.id, taxonomyId: features[2].id }, // Parking
      { restaurantId: restaurant3.id, taxonomyId: dietary[1].id }, // Vegetariano

      { restaurantId: restaurant4.id, taxonomyId: cuisineTypes[4].id }, // Americana
      { restaurantId: restaurant4.id, taxonomyId: features[0].id }, // Terraza

      { restaurantId: restaurant5.id, taxonomyId: cuisineTypes[3].id }, // Española
      { restaurantId: restaurant5.id, taxonomyId: features[2].id }, // Parking
    ],
  })

  console.log('✅ Taxonomías asociadas')

  // 5. Crear Menús
  console.log('📜 Creando menús...')

  const menu1 = await prisma.menu.create({
    data: {
      title: 'Menú del Día',
      description: 'Primer plato, segundo plato, postre y bebida',
      price: 15.90,
      isActive: true,
      ownerId: owner1.id,
    },
  })

  const menu2 = await prisma.menu.create({
    data: {
      title: 'Carta de Sushi',
      description: 'Selección premium de sushi y sashimi',
      isActive: true,
      ownerId: owner1.id,
    },
  })

  const menu3 = await prisma.menu.create({
    data: {
      title: 'Menú Mexicano',
      description: 'Tacos, quesadillas y más',
      isActive: true,
      ownerId: owner2.id,
    },
  })

  console.log(`✅ ${3} menús creados`)

  // 6. Asociar Menús a Restaurantes
  await prisma.restaurantMenu.createMany({
    data: [
      { restaurantId: restaurant1.id, menuId: menu1.id },
      { restaurantId: restaurant2.id, menuId: menu2.id },
      { restaurantId: restaurant3.id, menuId: menu3.id },
    ],
  })

  // 7. Crear Platos
  console.log('🍕 Creando platos...')

  await prisma.dish.createMany({
    data: [
      // Menú Italiano
      {
        name: 'Spaghetti Carbonara',
        description: 'Pasta fresca con huevo, queso pecorino y guanciale',
        price: 12.50,
        imageUrl: 'https://images.unsplash.com/photo-1612874742237-6526221588e3?w=400',
        allergens: ['huevo', 'gluten', 'lácteos'],
        order: 1,
        menuId: menu1.id,
      },
      {
        name: 'Pizza Margherita',
        description: 'Tomate, mozzarella, albahaca fresca',
        price: 10.00,
        imageUrl: 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002?w=400',
        allergens: ['gluten', 'lácteos'],
        order: 2,
        menuId: menu1.id,
      },
      {
        name: 'Tiramisú',
        description: 'Postre tradicional italiano con café y mascarpone',
        price: 6.50,
        imageUrl: 'https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400',
        allergens: ['huevo', 'lácteos', 'gluten'],
        order: 3,
        menuId: menu1.id,
      },

      // Menú Sushi
      {
        name: 'Nigiri de Salmón',
        description: '2 piezas de salmón fresco sobre arroz',
        price: 8.00,
        imageUrl: 'https://images.unsplash.com/photo-1579584425555-c3ce17fd4351?w=400',
        allergens: ['pescado'],
        order: 1,
        menuId: menu2.id,
      },
      {
        name: 'California Roll',
        description: 'Rollo de cangrejo, aguacate y pepino',
        price: 12.00,
        imageUrl: 'https://images.unsplash.com/photo-1617196034796-73dfa7b1fd56?w=400',
        allergens: ['pescado', 'mariscos'],
        order: 2,
        menuId: menu2.id,
      },
      {
        name: 'Sashimi Variado',
        description: 'Selección de 12 piezas de pescado fresco',
        price: 22.00,
        allergens: ['pescado'],
        order: 3,
        menuId: menu2.id,
      },

      // Menú Mexicano
      {
        name: 'Tacos al Pastor',
        description: '3 tacos de cerdo marinado con piña',
        price: 9.50,
        imageUrl: 'https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400',
        allergens: [],
        order: 1,
        menuId: menu3.id,
      },
      {
        name: 'Quesadillas de Pollo',
        description: 'Tortilla rellena de pollo y queso',
        price: 8.00,
        imageUrl: 'https://images.unsplash.com/photo-1618040996337-56904b7850b9?w=400',
        allergens: ['lácteos'],
        order: 2,
        menuId: menu3.id,
      },
      {
        name: 'Guacamole con Nachos',
        description: 'Guacamole fresco con chips de maíz',
        price: 6.50,
        imageUrl: 'https://images.unsplash.com/photo-1534939561126-855b8675edd7?w=400',
        allergens: [],
        order: 3,
        menuId: menu3.id,
      },
    ],
  })

  console.log('✅ 9 platos creados')

  // 8. Crear Reseñas
  console.log('⭐ Creando reseñas...')

  await prisma.review.createMany({
    data: [
      {
        rating: 5,
        comment: '¡Excelente! La pasta estaba deliciosa y el servicio impecable. Volveré sin duda.',
        photos: [],
        restaurantId: restaurant1.id,
        userId: user1.id,
      },
      {
        rating: 4,
        comment: 'Muy buena comida italiana. El tiramisú es espectacular. Un poco caro pero vale la pena.',
        photos: [],
        restaurantId: restaurant1.id,
        userId: user2.id,
      },
      {
        rating: 5,
        comment: 'El mejor sushi que he probado en mi vida. Fresco y delicioso.',
        photos: [],
        restaurantId: restaurant2.id,
        userId: user1.id,
      },
      {
        rating: 4,
        comment: 'Tacos auténticos y muy sabrosos. Buen precio.',
        photos: [],
        restaurantId: restaurant3.id,
        userId: user2.id,
      },
      {
        rating: 5,
        comment: 'Las hamburguesas están increíbles. Ingredientes de primera calidad.',
        photos: [],
        restaurantId: restaurant4.id,
        userId: user1.id,
      },
      {
        rating: 5,
        comment: 'Chuletón espectacular. Ambiente elegante y servicio excelente.',
        photos: [],
        restaurantId: restaurant5.id,
        userId: user2.id,
      },
    ],
  })

  console.log('✅ 6 reseñas creadas')

  console.log('\n✅ ¡Seed completado exitosamente!')
  console.log('\n📊 Resumen:')
  console.log(`   - ${5} usuarios creados`)
  console.log(`   - ${cuisineTypes.length + features.length + dietary.length} taxonomías creadas`)
  console.log(`   - ${5} restaurantes creados`)
  console.log(`   - ${3} menús creados`)
  console.log(`   - ${9} platos creados`)
  console.log(`   - ${6} reseñas creadas`)
  console.log('\n🎉 La base de datos está lista para usar!')
}

main()
  .catch((e) => {
    console.error('❌ Error al ejecutar seed:', e)
    process.exit(1)
  })
  .finally(async () => {
    await prisma.$disconnect()
  })
