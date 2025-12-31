import { NextRequest, NextResponse } from 'next/server';
import { meilisearch, RESTAURANTS_INDEX } from '@/lib/meilisearch';

export async function GET(request: NextRequest) {
  try {
    if (!meilisearch) {
      return NextResponse.json(
        { error: 'Search service not available' },
        { status: 503 }
      );
    }

    const { searchParams } = new URL(request.url);
    const query = searchParams.get('q') || '';
    const limit = parseInt(searchParams.get('limit') || '5');

    if (!query || query.trim().length < 2) {
      return NextResponse.json({ suggestions: [] });
    }

    // Search in Meilisearch with minimal attributes for speed
    const restaurantsIndex = meilisearch.index(RESTAURANTS_INDEX);
    const results = await restaurantsIndex.search(query, {
      filter: 'status = APPROVED',
      limit,
      attributesToRetrieve: [
        'id',
        'name',
        'slug',
        'address',
        'logoUrl',
        'cuisineTypes',
        'averageRating',
      ],
      attributesToHighlight: ['name', 'address'],
    });

    const suggestions = results.hits.map((hit: any) => ({
      id: hit.id,
      name: hit.name,
      slug: hit.slug,
      address: hit.address,
      logoUrl: hit.logoUrl,
      cuisineTypes: hit.cuisineTypes?.slice(0, 2) || [],
      averageRating: hit.averageRating,
      // Meilisearch provides highlighted matches
      _formatted: hit._formatted,
    }));

    return NextResponse.json({
      suggestions,
      processingTimeMs: results.processingTimeMs,
    });
  } catch (error) {
    console.error('Autocomplete error:', error);
    return NextResponse.json(
      { error: 'Failed to get suggestions' },
      { status: 500 }
    );
  }
}
