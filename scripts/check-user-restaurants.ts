import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function checkUserRestaurants() {
  try {
    // Buscar el usuario por email
    const user = await prisma.user.findUnique({
      where: { email: "josemas68@gmail.com" },
      include: {
        restaurants: {
          select: {
            id: true,
            name: true,
            slug: true,
          },
        },
      },
    });

    if (!user) {
      console.log("❌ Usuario no encontrado con email: josemas68@gmail.com");
      return;
    }

    console.log(`\n👤 Usuario: ${user.firstName} ${user.lastName} (${user.email})`);
    console.log(`📊 Role: ${user.role}`);
    console.log(`🍽️  Restaurantes asignados: ${user.restaurants.length}\n`);

    if (user.restaurants.length > 0) {
      console.log("Lista de restaurantes:");
      user.restaurants.forEach((restaurant, index) => {
        console.log(`  ${index + 1}. ${restaurant.name} (${restaurant.slug})`);
      });
    }
  } catch (error) {
    console.error("Error:", error);
  } finally {
    await prisma.$disconnect();
  }
}

checkUserRestaurants();
