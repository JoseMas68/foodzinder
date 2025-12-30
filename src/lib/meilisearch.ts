import { MeiliSearch } from "meilisearch";
import { env } from "@/env";

if (!env.NEXT_PUBLIC_MEILISEARCH_HOST || !env.MEILISEARCH_API_KEY) {
    // En desarrollo podríamos no tener Meilisearch, así que manejamos el error o retornamos null
    console.warn("Meilisearch environment variables are not defined");
}

export const meilisearch = (env.NEXT_PUBLIC_MEILISEARCH_HOST && env.MEILISEARCH_API_KEY)
    ? new MeiliSearch({
        host: env.NEXT_PUBLIC_MEILISEARCH_HOST,
        apiKey: env.MEILISEARCH_API_KEY,
    })
    : null;

export const RESTAURANTS_INDEX = "restaurants";
