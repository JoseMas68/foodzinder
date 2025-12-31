import { MeiliSearch } from "meilisearch";
import { env } from "@/env";

if (!env.NEXT_PUBLIC_MEILISEARCH_HOST || !env.MEILISEARCH_MASTER_KEY) {
    // En desarrollo podríamos no tener Meilisearch, así que manejamos el error o retornamos null
    console.warn("Meilisearch environment variables are not defined");
}

export const meilisearch = (env.NEXT_PUBLIC_MEILISEARCH_HOST && env.MEILISEARCH_MASTER_KEY)
    ? new MeiliSearch({
        host: env.NEXT_PUBLIC_MEILISEARCH_HOST,
        apiKey: env.MEILISEARCH_MASTER_KEY,
    })
    : null;

export const RESTAURANTS_INDEX = "restaurants";

/**
 * Initialize Meilisearch indexes with proper settings
 */
export async function initializeMeilisearch() {
  if (!meilisearch) {
    throw new Error('Meilisearch is not configured');
  }

  try {
    // Get or create the restaurants index
    const restaurantsIndex = meilisearch.index(RESTAURANTS_INDEX);

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
