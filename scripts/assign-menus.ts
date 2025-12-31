import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const email = 'josemas68@gmail.com'

  const user = await prisma.user.findUnique({
    where: { email }
  })

  if (!user) {
    console.error('User not found')
    process.exit(1)
  }

  // Get user's restaurants
  const restaurants = await prisma.restaurant.findMany({
    where: { ownerId: user.id },
    select: { id: true, name: true, slug: true }
  })

  console.log(`\n🍽️  Found ${restaurants.length} restaurants:\n`)
  restaurants.forEach((r, i) => {
    console.log(`${i + 1}. ${r.name} (${r.slug})`)
  })

  // Get user's menus
  const menus = await prisma.menu.findMany({
    where: { ownerId: user.id },
    select: { id: true, title: true }
  })

  console.log(`\n📋 Found ${menus.length} menus:\n`)
  menus.forEach((m, i) => {
    console.log(`${i + 1}. ${m.title}`)
  })

  // Assign menus to restaurants
  console.log('\n🔗 Assigning menus to restaurants...\n')

  for (const restaurant of restaurants) {
    // Assign first 2-3 menus to each restaurant
    const menusToAssign = menus.slice(0, Math.min(3, menus.length))

    for (const menu of menusToAssign) {
      try {
        await prisma.restaurantMenu.create({
          data: {
            restaurantId: restaurant.id,
            menuId: menu.id
          }
        })
        console.log(`✅ Assigned "${menu.title}" to "${restaurant.name}"`)
      } catch (error: any) {
        if (error.code === 'P2002') {
          console.log(`⚠️  "${menu.title}" already assigned to "${restaurant.name}"`)
        } else {
          console.error(`❌ Error assigning menu:`, error.message)
        }
      }
    }
  }

  console.log('\n🎉 Menu assignment complete!')
  console.log('\nNext steps:')
  console.log('1. Go to http://localhost:3003/dashboard/restaurants')
  console.log('2. View any restaurant to see assigned menus')
  console.log('3. Visit the public restaurant page to see menus displayed')
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
