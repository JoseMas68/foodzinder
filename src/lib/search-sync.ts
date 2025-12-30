import { meilisearch, RESTAURANTS_INDEX } from "./meilisearch";
import { prisma } from "./prisma";

/**
 * Sincronizar un restaurante específico con Meilisearch
 */
export async function syncRestaurantToMeilisearch(restaurantId: string) {
    if (!meilisearch) return;

    try {
        const restaurant = await prisma.restaurant.findUnique({
            where: { id: restaurantId },
            include: {
                taxonomies: {
                    include: { taxonomy: true },
                },
            },
        });

        if (!restaurant || restaurant.status !== "APPROVED") {
            // Si no existe o no está aprobado, lo borramos del índice
            await meilisearch.index(RESTAURANTS_INDEX).deleteDocument(restaurantId);
            return;
        }

        // Preparar el documento para Meilisearch
        const document = {
            id: restaurant.id,
            name: restaurant.name,
            description: restaurant.description,
            slug: restaurant.slug,
            address: restaurant.address,
            priceRange: restaurant.priceRange,
            phone: restaurant.phone,
            website: restaurant.website,
            logoUrl: restaurant.logoUrl,
            coverUrl: restaurant.coverUrl,
            taxonomies: restaurant.taxonomies.map((t) => t.taxonomy.name),
            createdAt: restaurant.createdAt.getTime(),
        };

        await meilisearch.index(RESTAURANTS_INDEX).addDocuments([document]);
    } catch (error) {
        console.error(`Error syncing restaurant ${restaurantId} to Meilisearch:`, error);
    }
}

/**
 * Reiniciar e indexar todos los restaurantes aprobados
 */
export async function reindexAllRestaurants() {
    if (!meilisearch) return;

    try {
        const restaurants = await prisma.restaurant.findMany({
            where: { status: "APPROVED" },
            include: {
                taxonomies: {
                    include: { taxonomy: true },
                },
            },
        });

        const documents = restaurants.map((r) => ({
            id: r.id,
            name: r.name,
            description: r.description,
            slug: r.slug,
            address: r.address,
            priceRange: r.priceRange,
            phone: r.phone,
            website: r.website,
            logoUrl: r.logoUrl,
            coverUrl: r.coverUrl,
            taxonomies: r.taxonomies.map((t) => t.taxonomy.name),
            createdAt: r.createdAt.getTime(),
        }));

        await meilisearch.index(RESTAURANTS_INDEX).deleteAllDocuments();
        await meilisearch.index(RESTAURANTS_INDEX).addDocuments(documents);

        // Configurar filtros y búsqueda
        await meilisearch.index(RESTAURANTS_INDEX).updateSettings({
            filterableAttributes: ["priceRange", "taxonomies"],
            searchableAttributes: ["name", "description", "taxonomies", "address"],
        });

        console.log(`Reindexed ${documents.length} restaurants in Meilisearch`);
    } catch (error) {
        console.error("Error reindexing all restaurants:", error);
    }
}
