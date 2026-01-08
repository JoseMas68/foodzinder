import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function copyTemplatesToRestaurants() {
  try {
    console.log("🚀 Iniciando copia de plantillas a restaurantes...\n");

    // 1. Obtener todas las plantillas globales (restaurantId = null)
    const globalTemplates = await prisma.emailTemplate.findMany({
      where: { restaurantId: null },
    });

    console.log(`📧 Found ${globalTemplates.length} global templates`);

    if (globalTemplates.length === 0) {
      console.log("⚠️  No hay plantillas globales para copiar");
      return;
    }

    // 2. Obtener todos los restaurantes
    const restaurants = await prisma.restaurant.findMany({
      select: { id: true, name: true },
    });

    console.log(`🏪 Found ${restaurants.length} restaurants\n`);

    if (restaurants.length === 0) {
      console.log("⚠️  No hay restaurantes en la base de datos");
      return;
    }

    // 3. Para cada restaurante, copiar las plantillas globales
    let totalCreated = 0;
    let totalSkipped = 0;

    for (const restaurant of restaurants) {
      console.log(`📍 Processing: ${restaurant.name} (${restaurant.id})`);

      for (const template of globalTemplates) {
        // Verificar si ya existe una plantilla de este tipo para este restaurante
        const existing = await prisma.emailTemplate.findUnique({
          where: {
            type_restaurantId: {
              type: template.type,
              restaurantId: restaurant.id,
            },
          },
        });

        if (existing) {
          console.log(`  ⏭️  Skipped ${template.type} (already exists)`);
          totalSkipped++;
          continue;
        }

        // Crear copia de la plantilla para este restaurante
        await prisma.emailTemplate.create({
          data: {
            type: template.type,
            name: template.name,
            description: template.description,
            subject: template.subject,
            htmlContent: template.htmlContent,
            variables: template.variables as any,
            isActive: template.isActive,
            restaurantId: restaurant.id,
          },
        });

        console.log(`  ✅ Created ${template.type}`);
        totalCreated++;
      }
      console.log("");
    }

    console.log("\n✨ Proceso completado!");
    console.log(`📊 Resumen:`);
    console.log(`   - Plantillas creadas: ${totalCreated}`);
    console.log(`   - Plantillas omitidas (ya existían): ${totalSkipped}`);
    console.log(
      `   - Total por restaurante: ${globalTemplates.length} plantillas`
    );
    console.log(`   - Restaurantes procesados: ${restaurants.length}`);
  } catch (error) {
    console.error("❌ Error:", error);
    throw error;
  } finally {
    await prisma.$disconnect();
  }
}

copyTemplatesToRestaurants()
  .then(() => {
    console.log("\n✅ Script completado exitosamente!");
    process.exit(0);
  })
  .catch((error) => {
    console.error("\n❌ Script falló:", error);
    process.exit(1);
  });
