import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const email = process.argv[2]

  if (!email) {
    console.error('Usage: npx tsx scripts/create-sample-menus.ts <owner-email>')
    process.exit(1)
  }

  const user = await prisma.user.findUnique({
    where: { email }
  })

  if (!user) {
    console.error(`❌ User not found: ${email}`)
    process.exit(1)
  }

  console.log(`✅ Found user: ${user.email} (${user.role})`)

  // Create sample menus
  const menus = [
    {
      title: 'Menú del Día',
      description: 'Menú completo de mediodía con entrante, principal y postre',
      price: 12.50,
      isActive: true,
      dishes: [
        {
          name: 'Ensalada Mixta',
          description: 'Lechuga, tomate, cebolla y aceitunas',
          price: 0,
          allergens: ['gluten'],
          order: 1
        },
        {
          name: 'Paella Valenciana',
          description: 'Arroz con pollo, conejo y verduras',
          price: 0,
          allergens: [],
          order: 2
        },
        {
          name: 'Flan Casero',
          description: 'Postre tradicional',
          price: 0,
          allergens: ['lácteos', 'huevo'],
          order: 3
        }
      ]
    },
    {
      title: 'Menú Degustación',
      description: 'Experiencia gastronómica completa con 7 platos',
      price: 45.00,
      isActive: true,
      dishes: [
        {
          name: 'Tartar de Atún',
          description: 'Atún rojo con aguacate y sésamo',
          price: 0,
          allergens: ['pescado', 'sésamo'],
          order: 1
        },
        {
          name: 'Risotto de Trufa',
          description: 'Arroz cremoso con trufa negra',
          price: 0,
          allergens: ['lácteos'],
          order: 2
        },
        {
          name: 'Solomillo de Ternera',
          description: 'Con reducción de vino tinto',
          price: 0,
          allergens: ['sulfitos'],
          order: 3
        },
        {
          name: 'Torrija con Helado',
          description: 'Torrija caramelizada con helado de vainilla',
          price: 0,
          allergens: ['gluten', 'lácteos', 'huevo'],
          order: 4
        }
      ]
    },
    {
      title: 'Carta Principal',
      description: 'Platos a la carta disponibles todo el día',
      price: null, // No fixed price, each dish has its own
      isActive: true,
      dishes: [
        {
          name: 'Jamón Ibérico de Bellota',
          description: '100g de jamón ibérico premium',
          price: 18.50,
          allergens: [],
          order: 1
        },
        {
          name: 'Croquetas de la Abuela',
          description: 'Croquetas caseras de jamón (8 unidades)',
          price: 9.50,
          allergens: ['gluten', 'lácteos', 'huevo'],
          order: 2
        },
        {
          name: 'Pulpo a la Gallega',
          description: 'Pulpo cocido con pimentón y aceite de oliva',
          price: 22.00,
          allergens: ['moluscos'],
          order: 3
        },
        {
          name: 'Lubina a la Sal',
          description: 'Lubina entera al horno (para 2 personas)',
          price: 38.00,
          allergens: ['pescado'],
          order: 4
        },
        {
          name: 'Entrecot de Buey',
          description: '300g de entrecot con guarnición',
          price: 28.50,
          allergens: [],
          order: 5
        },
        {
          name: 'Tarta de Queso',
          description: 'Cheesecake cremosa estilo Nueva York',
          price: 6.50,
          allergens: ['gluten', 'lácteos', 'huevo'],
          order: 6
        }
      ]
    },
    {
      title: 'Menú Vegetariano',
      description: 'Opciones 100% vegetales y saludables',
      price: 18.00,
      isActive: true,
      dishes: [
        {
          name: 'Hummus con Crudités',
          description: 'Hummus casero con verduras frescas',
          price: 0,
          allergens: ['sésamo'],
          order: 1
        },
        {
          name: 'Bowl Quinoa y Aguacate',
          description: 'Quinoa, aguacate, tomate cherry y edamame',
          price: 0,
          allergens: ['soja'],
          order: 2
        },
        {
          name: 'Brownie Vegano',
          description: 'Brownie de chocolate sin ingredientes animales',
          price: 0,
          allergens: ['gluten', 'frutos secos'],
          order: 3
        }
      ]
    }
  ]

  console.log('\n📝 Creating sample menus...\n')

  for (const menuData of menus) {
    const { dishes, ...menuInfo } = menuData

    const menu = await prisma.menu.create({
      data: {
        ...menuInfo,
        ownerId: user.id,
        dishes: {
          create: dishes
        }
      },
      include: {
        dishes: true
      }
    })

    console.log(`✅ Created menu: ${menu.title}`)
    console.log(`   - ${menu.dishes.length} dishes`)
    console.log(`   - Price: ${menu.price ? `€${menu.price}` : 'À la carte'}`)
    console.log(`   - Active: ${menu.isActive ? 'Yes' : 'No'}\n`)
  }

  console.log('🎉 Sample menus created successfully!')
  console.log('\nNext steps:')
  console.log('1. Go to http://localhost:3003/dashboard/menus')
  console.log('2. Edit a restaurant and assign these menus')
  console.log('3. View the restaurant public page to see the menus')
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
