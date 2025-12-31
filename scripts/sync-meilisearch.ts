import { PrismaClient } from '@prisma/client';
import { meilisearch, RESTAURANTS_INDEX, initializeMeilisearch, type RestaurantDocument } from '../src/lib/meilisearch';

const prisma = new PrismaClient();

async function syncRestaurantsToMeilisearch() {
  try {
    console.log('🚀 Starting Meilisearch synchronization...');

    if (!meilisearch) {
      throw new Error('Meilisearch is not configured. Check your environment variables.');
    }

    // Initialize Meilisearch indexes
    console.log('📋 Initializing Meilisearch indexes...');
    await initializeMeilisearch();

    // Fetch all approved restaurants from database
    console.log('📊 Fetching restaurants from database...');
    const restaurants = await prisma.restaurant.findMany({
      where: {
        status: 'APPROVED',
      },
      include: {
        taxonomies: {
          include: {
            taxonomy: true,
          },
        },
        reviews: {
          select: {
            rating: true,
          },
        },
      },
    });

    console.log(`Found ${restaurants.length} approved restaurants`);

    // Transform restaurants to Meilisearch documents
    const documents: RestaurantDocument[] = restaurants.map((restaurant) => {
      const averageRating = restaurant.reviews.length > 0
        ? restaurant.reviews.reduce((acc, r) => acc + r.rating, 0) / restaurant.reviews.length
        : 0;

      const cuisineTypes = restaurant.taxonomies
        .filter((t) => t.taxonomy.type === 'CUISINE_TYPE')
        .map((t) => t.taxonomy.name);

      const features = restaurant.taxonomies
        .filter((t) => t.taxonomy.type !== 'CUISINE_TYPE')
        .map((t) => t.taxonomy.name);

      // Extract city from address (assuming format: "Street, City")
      const city = restaurant.address.split(',').pop()?.trim();

      return {
        id: restaurant.id,
        name: restaurant.name,
        slug: restaurant.slug,
        description: restaurant.description,
        address: restaurant.address,
        city: city || undefined,
        latitude: restaurant.latitude ?? undefined,
        longitude: restaurant.longitude ?? undefined,
        status: restaurant.status,
        logoUrl: restaurant.logoUrl ?? undefined,
        coverUrl: restaurant.coverUrl ?? undefined,
        priceRange: restaurant.priceRange,
        phone: restaurant.phone ?? undefined,
        website: restaurant.website ?? undefined,
        cuisineTypes,
        features,
        averageRating: Math.round(averageRating * 10) / 10, // Round to 1 decimal
        reviewCount: restaurant.reviews.length,
        createdAt: Math.floor(restaurant.createdAt.getTime() / 1000), // Unix timestamp
      };
    });

    // Add documents to Meilisearch
    console.log('📤 Uploading documents to Meilisearch...');
    const restaurantsIndex = meilisearch.index(RESTAURANTS_INDEX);
    const task = await restaurantsIndex.addDocuments(documents, {
      primaryKey: 'id',
    });

    console.log(`✅ Task enqueued with ID: ${task.taskUid}`);
    console.log(`📊 Synced ${documents.length} restaurants to Meilisearch`);
    console.log('⏳ Indexing in progress... (check status asynchronously)');

    // Display index stats
    const stats = await restaurantsIndex.getStats();
    console.log(`📈 Index stats:`, {
      numberOfDocuments: stats.numberOfDocuments,
      isIndexing: stats.isIndexing,
    });
  } catch (error) {
    console.error('❌ Error syncing to Meilisearch:', error);
    throw error;
  } finally {
    await prisma.$disconnect();
  }
}

// Run the sync
syncRestaurantsToMeilisearch()
  .then(() => {
    console.log('🎉 Sync process completed');
    process.exit(0);
  })
  .catch((error) => {
    console.error('💥 Sync process failed:', error);
    process.exit(1);
  });
