import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {
  console.log('🔧 Optimizing database...')
  
  // Analyze tables for better query planning
  await prisma.$executeRawUnsafe('ANALYZE')
  console.log('✅ Tables analyzed')
  
  // Vacuum to reclaim space
  console.log('🧹 Vacuuming database (this may take a moment)...')
  await prisma.$executeRawUnsafe('VACUUM')
  console.log('✅ Database vacuumed')
  
  console.log('✨ Database optimization complete!')
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
