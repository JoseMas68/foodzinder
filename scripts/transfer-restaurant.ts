import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const toEmail = 'josemas68@gmail.com'
  const restaurantSlug = 'dragon-wok'

  const newOwner = await prisma.user.findUnique({
    where: { email: toEmail }
  })

  if (!newOwner) {
    console.error(`User not found: ${toEmail}`)
    process.exit(1)
  }

  const restaurant = await prisma.restaurant.update({
    where: { slug: restaurantSlug },
    data: { ownerId: newOwner.id },
    include: {
      owner: {
        select: { email: true }
      }
    }
  })

  console.log(`✅ Transferred "${restaurant.name}" to ${restaurant.owner.email}`)
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
