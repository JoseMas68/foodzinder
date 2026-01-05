import { NextRequest, NextResponse } from 'next/server';
import { RESTAURANTS_INDEX } from '@/lib/meilisearch';
import { calculateDistance } from '@/lib/distance';

// Force dynamic rendering to avoid env access during build
export const dynamic = 'force-dynamic';

export async function GET(request: NextRequest) {
  // Lazy import to avoid accessing env during build time
  const { getMeilisearchClient } = await import('@/lib/meilisearch');

  try {
    const meilisearch = getMeilisearchClient();

    if (!meilisearch) {
      return NextResponse.json(
        { error: 'Search service not available' },
        { status: 503 }
      );
    }

    const { searchParams } = new URL(request.url);
    const query = searchParams.get('q') || '';
    const limit = parseInt(searchParams.get('limit') || '20');
    const offset = parseInt(searchParams.get('offset') || '0');

    // Filter parameters
    const priceRange = searchParams.get('priceRange');
    const cuisineTypes = searchParams.get('cuisineTypes');
    const minRating = searchParams.get('minRating');
    const features = searchParams.get('features');
    const city = searchParams.get('city');

    // Geolocation parameters
    const userLat = searchParams.get('lat');
    const userLng = searchParams.get('lng');

    // Sort parameter - map friendly names to Meilisearch format
    const sortParam = searchParams.get('sort') || 'rating';
    const sortMap: Record<string, string> = {
      'rating': 'averageRating:desc',
      'reviews': 'reviewCount:desc',
      'newest': 'createdAt:desc',
    };
    const sort = sortMap[sortParam] || 'averageRating:desc';

    // Build filter string
    const filters: string[] = ['status = APPROVED'];

    if (priceRange) {
      const ranges = priceRange.split(',');
      const rangeFilters = ranges.map(r => `priceRange = ${r}`);
      filters.push(`(${rangeFilters.join(' OR ')})`);
    }

    if (cuisineTypes) {
      const types = cuisineTypes.split(',');
      const typeFilters = types.map(t => `cuisineTypes = "${t}"`);
      filters.push(`(${typeFilters.join(' OR ')})`);
    }

    if (features) {
      const featureList = features.split(',');
      const featureFilters = featureList.map(f => `features = "${f}"`);
      filters.push(`(${featureFilters.join(' OR ')})`);
    }

    if (minRating) {
      filters.push(`averageRating >= ${minRating}`);
    }

    if (city) {
      filters.push(`city = "${city}"`);
    }

    // Search in Meilisearch
    const restaurantsIndex = meilisearch.index(RESTAURANTS_INDEX);

    // If sorting by distance, we need more results to sort client-side
    const distanceBatchSize = Math.min(500, Math.max(limit * 5, 100));
    const searchLimit =
      sortParam === 'distance' && userLat && userLng ? distanceBatchSize : limit;

    const results = await restaurantsIndex.search(query, {
      filter: filters.join(' AND '),
      sort: sortParam === 'distance' ? [] : [sort], // No Meilisearch sorting if we sort by distance
      limit: searchLimit,
      offset: sortParam === 'distance' ? 0 : offset,
      attributesToRetrieve: [
        'id',
        'name',
        'slug',
        'description',
        'address',
        'latitude',
        'longitude',
        'logoUrl',
        'coverUrl',
        'priceRange',
        'phone',
        'website',
        'cuisineTypes',
        'features',
        'averageRating',
        'reviewCount',
      ],
    });

    let processedHits = results.hits;

    // Calculate distances and sort by distance if user location is provided
    if (userLat && userLng && sortParam === 'distance') {
      const lat = parseFloat(userLat);
      const lng = parseFloat(userLng);

      processedHits = results.hits
        .map((restaurant: any) => {
          if (restaurant.latitude && restaurant.longitude) {
            const distance = calculateDistance(
              lat,
              lng,
              restaurant.latitude,
              restaurant.longitude
            );
            return { ...restaurant, distance };
          }
          return { ...restaurant, distance: 999999 }; // Put restaurants without coords at the end
        })
        .sort((a: any, b: any) => (a.distance || 0) - (b.distance || 0))
        .slice(offset, offset + limit); // Apply pagination after sorting
    }

    return NextResponse.json({
      hits: processedHits,
      total: results.estimatedTotalHits,
      limit,
      offset,
      processingTimeMs: results.processingTimeMs,
    });
  } catch (error) {
    console.error('Search error:', error);
    return NextResponse.json(
      { error: 'Failed to perform search' },
      { status: 500 }
    );
  }
}
