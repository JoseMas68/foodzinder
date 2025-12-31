import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  const email = process.argv[2]

  if (!email) {
    console.error('Usage: npx tsx scripts/make-owner.ts <email>')
    process.exit(1)
  }

  const user = await prisma.user.update({
    where: { email },
    data: { role: 'OWNER' }
  })

  console.log(`✅ User ${user.email} is now OWNER`)
  console.log(`   Name: ${user.firstName} ${user.lastName}`)
  console.log(`   ID: ${user.id}`)
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
