import { PrismaClient, TaxonomyType } from '@prisma/client';

const prisma = new PrismaClient();

const taxonomies = [
  // ============================================================================
  // CUISINE_TYPE - Tipos de cocina
  // ============================================================================
  { type: 'CUISINE_TYPE', name: 'Española', slug: 'espanola' },
  { type: 'CUISINE_TYPE', name: 'Italiana', slug: 'italiana' },
  { type: 'CUISINE_TYPE', name: 'Japonesa', slug: 'japonesa' },
  { type: 'CUISINE_TYPE', name: 'China', slug: 'china' },
  { type: 'CUISINE_TYPE', name: 'Mexicana', slug: 'mexicana' },
  { type: 'CUISINE_TYPE', name: 'Francesa', slug: 'francesa' },
  { type: 'CUISINE_TYPE', name: 'India', slug: 'india' },
  { type: 'CUISINE_TYPE', name: 'Tailandesa', slug: 'tailandesa' },
  { type: 'CUISINE_TYPE', name: 'Americana', slug: 'americana' },
  { type: 'CUISINE_TYPE', name: 'Argentina', slug: 'argentina' },
  { type: 'CUISINE_TYPE', name: 'Peruana', slug: 'peruana' },
  { type: 'CUISINE_TYPE', name: 'Mediterránea', slug: 'mediterranea' },
  { type: 'CUISINE_TYPE', name: 'Fusión', slug: 'fusion' },
  { type: 'CUISINE_TYPE', name: 'Sushi', slug: 'sushi' },
  { type: 'CUISINE_TYPE', name: 'BBQ/Parrilla', slug: 'bbq-parrilla' },
  { type: 'CUISINE_TYPE', name: 'Mariscos', slug: 'mariscos' },
  { type: 'CUISINE_TYPE', name: 'Tapas', slug: 'tapas' },
  { type: 'CUISINE_TYPE', name: 'Hamburguesas', slug: 'hamburguesas' },
  { type: 'CUISINE_TYPE', name: 'Pizza', slug: 'pizza' },
  { type: 'CUISINE_TYPE', name: 'Vegana', slug: 'vegana' },

  // ============================================================================
  // RESTAURANT_FEATURE - Características del restaurante
  // ============================================================================
  { type: 'RESTAURANT_FEATURE', name: 'Terraza', slug: 'terraza' },
  { type: 'RESTAURANT_FEATURE', name: 'Jardín', slug: 'jardin' },
  { type: 'RESTAURANT_FEATURE', name: 'Espacio exterior', slug: 'outdoor' },
  { type: 'RESTAURANT_FEATURE', name: 'Parking', slug: 'parking' },
  { type: 'RESTAURANT_FEATURE', name: 'WiFi gratis', slug: 'wifi-gratis' },
  { type: 'RESTAURANT_FEATURE', name: 'Accesible', slug: 'accesible' },
  { type: 'RESTAURANT_FEATURE', name: 'Acepta mascotas', slug: 'pet-friendly' },
  { type: 'RESTAURANT_FEATURE', name: 'Aire acondicionado', slug: 'aire-acondicionado' },
  { type: 'RESTAURANT_FEATURE', name: 'Música en vivo', slug: 'musica-vivo' },
  { type: 'RESTAURANT_FEATURE', name: 'Eventos privados', slug: 'eventos' },
  { type: 'RESTAURANT_FEATURE', name: 'Servicio a domicilio', slug: 'delivery' },
  { type: 'RESTAURANT_FEATURE', name: 'Para llevar', slug: 'takeaway' },
  { type: 'RESTAURANT_FEATURE', name: 'Bar', slug: 'bar' },
  { type: 'RESTAURANT_FEATURE', name: 'Bodega de vinos', slug: 'bodega-vinos' },
  { type: 'RESTAURANT_FEATURE', name: 'Vista panorámica', slug: 'vista-panoramica' },
  { type: 'RESTAURANT_FEATURE', name: 'Chimenea', slug: 'chimenea' },
  { type: 'RESTAURANT_FEATURE', name: 'Reserva online', slug: 'reserva-online' },

  // ============================================================================
  // DIETARY - Opciones dietéticas
  // ============================================================================
  { type: 'DIETARY', name: 'Vegetariano', slug: 'vegetariano' },
  { type: 'DIETARY', name: 'Vegano', slug: 'vegano' },
  { type: 'DIETARY', name: 'Sin gluten', slug: 'sin-gluten' },
  { type: 'DIETARY', name: 'Sin lactosa', slug: 'sin-lactosa' },
  { type: 'DIETARY', name: 'Halal', slug: 'halal' },
  { type: 'DIETARY', name: 'Kosher', slug: 'kosher' },
  { type: 'DIETARY', name: 'Opciones saludables', slug: 'saludable' },
  { type: 'DIETARY', name: 'Orgánico', slug: 'organico' },

  // ============================================================================
  // AMBIANCE - Ambiente
  // ============================================================================
  { type: 'AMBIANCE', name: 'Romántico', slug: 'romantico' },
  { type: 'AMBIANCE', name: 'Familiar', slug: 'familiar' },
  { type: 'AMBIANCE', name: 'Casual', slug: 'casual' },
  { type: 'AMBIANCE', name: 'Elegante', slug: 'elegante' },
  { type: 'AMBIANCE', name: 'Moderno', slug: 'moderno' },
  { type: 'AMBIANCE', name: 'Rústico', slug: 'rustico' },
  { type: 'AMBIANCE', name: 'Acogedor', slug: 'acogedor' },
  { type: 'AMBIANCE', name: 'Tranquilo', slug: 'tranquilo' },
  { type: 'AMBIANCE', name: 'Animado', slug: 'animado' },
  { type: 'AMBIANCE', name: 'De lujo', slug: 'lujo' },
  { type: 'AMBIANCE', name: 'Tradicional', slug: 'tradicional' },
  { type: 'AMBIANCE', name: 'Bohemio', slug: 'bohemio' },
  { type: 'AMBIANCE', name: 'Industrial', slug: 'industrial' },
] as const;

async function main() {
  console.log('🌱 Poblando taxonomías...\n');

  let created = 0;
  let existing = 0;

  for (const taxonomy of taxonomies) {
    const result = await prisma.taxonomy.upsert({
      where: {
        type_slug: {
          type: taxonomy.type as TaxonomyType,
          slug: taxonomy.slug,
        },
      },
      update: {
        name: taxonomy.name,
      },
      create: {
        type: taxonomy.type as TaxonomyType,
        name: taxonomy.name,
        slug: taxonomy.slug,
      },
    });

    if (result.createdAt.getTime() === result.createdAt.getTime()) {
      created++;
    } else {
      existing++;
    }
  }

  console.log(`✅ Taxonomías procesadas:`);
  console.log(`   - Creadas: ${created}`);
  console.log(`   - Actualizadas: ${existing}`);
  console.log(`   - Total: ${taxonomies.length}\n`);

  // Show summary by type
  const grouped = taxonomies.reduce((acc, t) => {
    acc[t.type] = (acc[t.type] || 0) + 1;
    return acc;
  }, {} as Record<string, number>);

  console.log('📊 Resumen por tipo:');
  Object.entries(grouped).forEach(([type, count]) => {
    console.log(`   - ${type}: ${count} taxonomías`);
  });
}

main()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
