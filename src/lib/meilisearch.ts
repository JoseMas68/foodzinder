import { MeiliSearch } from "meilisearch";

let _meilisearch: MeiliSearch | null | undefined;

export function getMeilisearchClient(): MeiliSearch | null {
  if (_meilisearch !== undefined) return _meilisearch;

  // Lazy import to avoid accessing env during build time
  const { env } = require("@/env");

  if (!env.NEXT_PUBLIC_MEILISEARCH_HOST || !env.MEILISEARCH_MASTER_KEY) {
    // En desarrollo podríamos no tener Meilisearch, así que manejamos el error o retornamos null
    console.warn("Meilisearch environment variables are not defined");
    _meilisearch = null;
    return null;
  }

  _meilisearch = new MeiliSearch({
    host: env.NEXT_PUBLIC_MEILISEARCH_HOST,
    apiKey: env.MEILISEARCH_MASTER_KEY,
  });

  return _meilisearch;
}

// For backwards compatibility - this will be lazily initialized
// Don't call getMeilisearchClient() here to avoid env access during build
export let meilisearch: MeiliSearch | null = null;

// Initialize on first import in a runtime context
if (typeof window === 'undefined' && process.env.NODE_ENV !== 'test') {
  // Server-side: defer until actually needed
  // Client components and API routes will call getMeilisearchClient() directly
}

export const RESTAURANTS_INDEX = "restaurants";

/**
 * Initialize Meilisearch indexes with proper settings
 */
export async function initializeMeilisearch() {
  const client = getMeilisearchClient();
  if (!client) {
    throw new Error('Meilisearch is not configured');
  }

  try {
    // Get or create the restaurants index
    const restaurantsIndex = client.index(RESTAURANTS_INDEX);

    // Configure searchable attributes
    await restaurantsIndex.updateSearchableAttributes([
      'name',
      'description',
      'address',
      'cuisineTypes',
      'features',
    ]);

    // Configure filterable attributes
    await restaurantsIndex.updateFilterableAttributes([
      'status',
      'priceRange',
      'cuisineTypes',
      'features',
      'averageRating',
      'city',
    ]);

    // Configure sortable attributes
    await restaurantsIndex.updateSortableAttributes([
      'averageRating',
      'reviewCount',
      'createdAt',
    ]);

    // Configure ranking rules
    await restaurantsIndex.updateRankingRules([
      'words',
      'typo',
      'proximity',
      'attribute',
      'sort',
      'exactness',
      'averageRating:desc',
      'reviewCount:desc',
    ]);

    console.log('✅ Meilisearch indexes initialized successfully');
  } catch (error) {
    console.error('❌ Error initializing Meilisearch:', error);
    throw error;
  }
}

/**
 * Restaurant document type for Meilisearch
 */
export interface RestaurantDocument {
  id: string;
  name: string;
  slug: string;
  description: string;
  address: string;
  city?: string;
  latitude?: number;
  longitude?: number;
  status: string;
  logoUrl?: string;
  coverUrl?: string;
  priceRange: string;
  phone?: string;
  website?: string;
  cuisineTypes: string[];
  features: string[];
  averageRating: number;
  reviewCount: number;
  createdAt: number; // Unix timestamp for sorting
}
