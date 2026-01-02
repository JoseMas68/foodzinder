import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  console.log("🚀 Asignando restaurantes al usuario...\n");

  // 1. Buscar el usuario por email
  const user = await prisma.user.findUnique({
    where: { email: "josemas68@gmail.com" },
  });

  if (!user) {
    console.log("❌ Usuario no encontrado con email: josemas68@gmail.com");
    return;
  }

  console.log(`👤 Usuario encontrado: ${user.firstName} ${user.lastName} (${user.email})`);
  console.log(`   Clerk ID: ${user.clerkId}`);
  console.log(`   Role: ${user.role}\n`);

  // 2. Actualizar role a OWNER si no lo es
  if (user.role !== "OWNER" && user.role !== "ADMIN") {
    await prisma.user.update({
      where: { id: user.id },
      data: { role: "OWNER" },
    });
    console.log("✅ Usuario actualizado a OWNER\n");
  }

  // 3. Obtener restaurantes que NO son tuyos
  const availableRestaurants = await prisma.restaurant.findMany({
    where: {
      ownerId: {
        not: user.id,
      },
    },
  });

  console.log(`📊 Restaurantes disponibles para asignar: ${availableRestaurants.length}\n`);

  // 4. Seleccionar 6 restaurantes aleatorios para asignarte
  const numToAssign = Math.min(6, availableRestaurants.length);
  const restaurantsToOwn = availableRestaurants
    .sort(() => Math.random() - 0.5)
    .slice(0, numToAssign);

  console.log(`🍽️  Asignando ${restaurantsToOwn.length} restaurantes adicionales...\n`);

  for (const restaurant of restaurantsToOwn) {
    await prisma.restaurant.update({
      where: { id: restaurant.id },
      data: { ownerId: user.id },
    });
    console.log(`   ✓ ${restaurant.name}`);
  }

  // 5. Mostrar resumen final
  const totalRestaurants = await prisma.restaurant.count({
    where: { ownerId: user.id },
  });

  console.log(`\n✅ ¡Asignación completada!`);
  console.log(`📋 Total de restaurantes de tu propiedad: ${totalRestaurants}\n`);

  // Listar todos tus restaurantes
  const myRestaurants = await prisma.restaurant.findMany({
    where: { ownerId: user.id },
    select: { name: true, slug: true },
  });

  console.log("📖 Tus restaurantes:");
  myRestaurants.forEach((r, i) => {
    console.log(`   ${i + 1}. ${r.name} (${r.slug})`);
  });
}

main()
  .catch((e) => {
    console.error("❌ Error:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
