import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

// Mapeo inteligente de palabras clave a taxonomías
const taxonomyMapping = {
  // Tipos de cocina
  cuisine: {
    'española': ['espanola'],
    'español': ['espanola'],
    'tapas': ['tapas', 'espanola'],
    'italiana': ['italiana'],
    'italiano': ['italiana'],
    'pizza': ['pizza', 'italiana'],
    'pasta': ['italiana'],
    'japonesa': ['japonesa'],
    'japones': ['japonesa'],
    'sushi': ['sushi', 'japonesa'],
    'izakaya': ['japonesa'],
    'china': ['china'],
    'chino': ['china'],
    'mexicana': ['mexicana'],
    'mexicano': ['mexicana'],
    'taco': ['mexicana'],
    'burrito': ['mexicana'],
    'francesa': ['francesa'],
    'frances': ['francesa'],
    'bistro': ['francesa'],
    'india': ['india'],
    'indio': ['india'],
    'curry': ['india'],
    'tailandesa': ['tailandesa'],
    'thai': ['tailandesa'],
    'americana': ['americana'],
    'burger': ['hamburguesas', 'americana'],
    'hamburguesa': ['hamburguesas', 'americana'],
    'bbq': ['bbq-parrilla'],
    'parrilla': ['bbq-parrilla'],
    'asador': ['bbq-parrilla'],
    'argentina': ['argentina', 'bbq-parrilla'],
    'argentino': ['argentina', 'bbq-parrilla'],
    'peruana': ['peruana'],
    'peruano': ['peruana'],
    'ceviche': ['peruana', 'mariscos'],
    'mediterranea': ['mediterranea'],
    'mediterraneo': ['mediterranea'],
    'fusion': ['fusion'],
    'mariscos': ['mariscos'],
    'marisco': ['mariscos'],
    'pescado': ['mariscos'],
    'vegana': ['vegana'],
    'vegano': ['vegana'],
  },

  // Características del restaurante
  features: {
    'terraza': ['terraza'],
    'jardin': ['jardin'],
    'exterior': ['outdoor'],
    'parking': ['parking'],
    'aparcamiento': ['parking'],
    'wifi': ['wifi-gratis'],
    'mascotas': ['pet-friendly'],
    'pet': ['pet-friendly'],
    'eventos': ['eventos'],
    'privado': ['eventos'],
    'delivery': ['delivery'],
    'domicilio': ['delivery'],
    'bar': ['bar'],
    'bodega': ['bodega-vinos'],
    'vinos': ['bodega-vinos'],
    'musica': ['musica-vivo'],
    'vista': ['vista-panoramica'],
    'panoramica': ['vista-panoramica'],
  },

  // Opciones dietéticas
  dietary: {
    'vegetariano': ['vegetariano'],
    'vegano': ['vegano'],
    'gluten': ['sin-gluten'],
    'celiaco': ['sin-gluten'],
    'lactosa': ['sin-lactosa'],
    'halal': ['halal'],
    'kosher': ['kosher'],
    'organico': ['organico'],
    'bio': ['organico'],
    'saludable': ['saludable'],
    'healthy': ['saludable'],
  },

  // Ambiente
  ambiance: {
    'romantico': ['romantico'],
    'romantic': ['romantico'],
    'pareja': ['romantico'],
    'familiar': ['familiar'],
    'familia': ['familiar'],
    'niños': ['familiar'],
    'kids': ['familiar'],
    'casual': ['casual'],
    'informal': ['casual'],
    'elegante': ['elegante'],
    'fino': ['elegante'],
    'gourmet': ['elegante', 'lujo'],
    'moderno': ['moderno'],
    'contemporaneo': ['moderno'],
    'rustico': ['rustico'],
    'tradicional': ['tradicional'],
    'clasico': ['tradicional'],
    'acogedor': ['acogedor'],
    'cozy': ['acogedor'],
    'tranquilo': ['tranquilo'],
    'quiet': ['tranquilo'],
    'relajado': ['tranquilo'],
    'animado': ['animado'],
    'festivo': ['animado'],
    'fiesta': ['animado'],
    'lujo': ['lujo'],
    'luxury': ['lujo'],
    'premium': ['lujo'],
    'bohemio': ['bohemio'],
    'hipster': ['bohemio'],
    'industrial': ['industrial'],
  },
};

async function assignTaxonomies() {
  console.log('🔍 Analizando restaurantes y asignando taxonomías...\n');

  // Obtener todas las taxonomías
  const allTaxonomies = await prisma.taxonomy.findMany();
  const taxonomyMap = new Map(allTaxonomies.map(t => [t.slug, t.id]));

  // Obtener todos los restaurantes APPROVED
  const restaurants = await prisma.restaurant.findMany({
    where: { status: 'APPROVED' },
    select: {
      id: true,
      name: true,
      description: true,
      address: true,
      priceRange: true,
      taxonomies: {
        select: {
          taxonomyId: true,
        },
      },
    },
  });

  console.log(`📊 Encontrados ${restaurants.length} restaurantes APPROVED\n`);

  let updated = 0;
  let skipped = 0;

  for (const restaurant of restaurants) {
    const searchText = `${restaurant.name} ${restaurant.description} ${restaurant.address}`.toLowerCase();
    const newTaxonomyIds = new Set<string>();

    // Detectar tipos de cocina
    for (const [keyword, slugs] of Object.entries(taxonomyMapping.cuisine)) {
      if (searchText.includes(keyword.toLowerCase())) {
        slugs.forEach(slug => {
          const taxId = taxonomyMap.get(slug);
          if (taxId) newTaxonomyIds.add(taxId);
        });
      }
    }

    // Detectar características
    for (const [keyword, slugs] of Object.entries(taxonomyMapping.features)) {
      if (searchText.includes(keyword.toLowerCase())) {
        slugs.forEach(slug => {
          const taxId = taxonomyMap.get(slug);
          if (taxId) newTaxonomyIds.add(taxId);
        });
      }
    }

    // Detectar opciones dietéticas
    for (const [keyword, slugs] of Object.entries(taxonomyMapping.dietary)) {
      if (searchText.includes(keyword.toLowerCase())) {
        slugs.forEach(slug => {
          const taxId = taxonomyMap.get(slug);
          if (taxId) newTaxonomyIds.add(taxId);
        });
      }
    }

    // Detectar ambiente
    for (const [keyword, slugs] of Object.entries(taxonomyMapping.ambiance)) {
      if (searchText.includes(keyword.toLowerCase())) {
        slugs.forEach(slug => {
          const taxId = taxonomyMap.get(slug);
          if (taxId) newTaxonomyIds.add(taxId);
        });
      }
    }

    // Asignar taxonomías basadas en precio
    if (restaurant.priceRange === 'LUXURY') {
      const luxuryId = taxonomyMap.get('lujo');
      if (luxuryId) newTaxonomyIds.add(luxuryId);
      const elegantId = taxonomyMap.get('elegante');
      if (elegantId) newTaxonomyIds.add(elegantId);
    } else if (restaurant.priceRange === 'CHEAP') {
      const casualId = taxonomyMap.get('casual');
      if (casualId) newTaxonomyIds.add(casualId);
    }

    // Detectar ubicaciones en el nombre/dirección
    if (searchText.includes('madrid')) {
      // Puede agregar lógica adicional si lo deseas
    }

    // Si no se encontraron taxonomías, asignar algunas por defecto
    if (newTaxonomyIds.size === 0) {
      console.log(`⚠️  ${restaurant.name}: No se detectaron taxonomías automáticamente`);

      // Asignar al menos "casual" como ambiente por defecto
      const casualId = taxonomyMap.get('casual');
      if (casualId) newTaxonomyIds.add(casualId);

      skipped++;
      continue;
    }

    // Obtener taxonomías existentes
    const existingIds = new Set(restaurant.taxonomies.map(t => t.taxonomyId));

    // Combinar existentes con nuevas (no duplicar)
    const finalTaxonomyIds = new Set([...existingIds, ...newTaxonomyIds]);

    // Solo actualizar si hay cambios
    if (finalTaxonomyIds.size !== existingIds.size ||
        ![...finalTaxonomyIds].every(id => existingIds.has(id))) {

      // Eliminar taxonomías existentes
      await prisma.restaurantTaxonomy.deleteMany({
        where: { restaurantId: restaurant.id },
      });

      // Crear nuevas taxonomías
      if (finalTaxonomyIds.size > 0) {
        await prisma.restaurantTaxonomy.createMany({
          data: [...finalTaxonomyIds].map(taxonomyId => ({
            restaurantId: restaurant.id,
            taxonomyId,
          })),
        });
      }

      const taxonomyNames = [...newTaxonomyIds]
        .map(id => allTaxonomies.find(t => t.id === id)?.name)
        .filter(Boolean);

      console.log(`✅ ${restaurant.name}: ${taxonomyNames.join(', ')}`);
      updated++;
    } else {
      skipped++;
    }
  }

  console.log('\n📈 Resumen:');
  console.log(`   ✅ Actualizados: ${updated}`);
  console.log(`   ⏭️  Sin cambios: ${skipped}`);
  console.log(`   📊 Total: ${restaurants.length}`);
}

assignTaxonomies()
  .catch((e) => {
    console.error('❌ Error:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
