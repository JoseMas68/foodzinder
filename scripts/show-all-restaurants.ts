import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const restaurants = await prisma.restaurant.findMany({
    take: 10,
    select: {
      id: true,
      name: true,
      slug: true,
      owner: {
        select: {
          email: true,
          role: true
        }
      }
    },
    orderBy: {
      createdAt: 'desc'
    }
  })

  console.log(`\n🍽️  Found ${restaurants.length} restaurants:\n`)

  restaurants.forEach((r, i) => {
    console.log(`${i + 1}. ${r.name}`)
    console.log(`   Slug: ${r.slug}`)
    console.log(`   Owner: ${r.owner.email} (${r.owner.role})`)
    console.log(`   ID: ${r.id}\n`)
  })

  // Show total count
  const total = await prisma.restaurant.count()
  console.log(`\nTotal restaurants in database: ${total}`)
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
