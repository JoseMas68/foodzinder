/**
 * API Response Types
 */
export type ApiResponse<T = unknown> = {
  success: boolean;
  data?: T;
  error?: string;
  message?: string;
};

export type ApiError = {
  code: string;
  message: string;
  details?: Record<string, unknown>;
};

/**
 * User Types
 */
export type UserRole = "ADMIN" | "OWNER" | "USER";

export type User = {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  role: UserRole;
  taxId?: string;
  billingName?: string;
  billingAddress?: string;
  createdAt: Date;
};

/**
 * Restaurant Types
 */
export type PriceRange = "CHEAP" | "MODERATE" | "EXPENSIVE" | "LUXURY";
export type RestaurantStatus = "PENDING" | "APPROVED" | "REJECTED" | "ARCHIVED";

export type Restaurant = {
  id: string;
  ownerId?: string;
  name: string;
  slug: string;
  description: string;
  address: string;
  latitude?: number;
  longitude?: number;
  status?: RestaurantStatus;
  logoUrl?: string;
  coverUrl?: string;
  priceRange: PriceRange;
  phone?: string;
  website?: string;
  isFavorite?: boolean;
  cuisineTypes?: string[];
  features?: string[];
  averageRating?: number;
  reviewCount?: number;
  stats?: {
    averageRating?: number;
    reviewCount?: number;
  };
  distance?: number;
  createdAt?: Date | string;
  updatedAt?: Date | string;
};

/**
 * Menu Types
 */
export type Menu = {
  id: string;
  ownerId: string;
  title: string;
  description?: string;
  price?: number;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
};

/**
 * Dish Types
 */
export type Dish = {
  id: string;
  menuId: string;
  name: string;
  description?: string;
  price: number;
  imageUrl?: string;
  allergens?: string[];
  order?: number;
  createdAt: Date;
  updatedAt: Date;
};

/**
 * Review Types
 */
export type Review = {
  id: string;
  restaurantId: string;
  userId: string;
  rating: number;
  comment: string;
  photos?: string[];
  createdAt: Date;
};

/**
 * Taxonomy Types
 */
export type TaxonomyType =
  | "CUISINE_TYPE"
  | "RESTAURANT_FEATURE"
  | "DIETARY"
  | "AMBIANCE";

export type Taxonomy = {
  id: string;
  type: TaxonomyType;
  name: string;
  slug: string;
};

/**
 * Subscription Types
 */
export type SubscriptionStatus = "ACTIVE" | "PAST_DUE" | "CANCELED";

export type Subscription = {
  id: string;
  userId: string;
  startDate: Date;
  endDate: Date;
  status: SubscriptionStatus;
  planId: string;
  amount: number;
  currency: string;
  createdAt: Date;
  updatedAt: Date;
};

/**
 * Invoice Types
 */
export type InvoiceStatus = "PAID" | "VOID" | "REFUNDED";

export type Invoice = {
  id: string;
  subscriptionId: string;
  userId: string;
  number: string;
  amountSubtotal: number;
  taxAmount: number;
  taxRate: number;
  total: number;
  status: InvoiceStatus;
  issuedAt: Date;
  pdfUrl?: string;
};

/**
 * Pagination Types
 */
export type PaginationParams = {
  page: number;
  limit: number;
};

export type PaginatedResponse<T> = {
  data: T[];
  total: number;
  page: number;
  limit: number;
  pages: number;
};

/**
 * Search Types
 */
export type SearchFilters = {
  q?: string;
  priceRange?: PriceRange[];
  taxonomies?: string[];
  latitude?: number;
  longitude?: number;
  radius?: number;
  minRating?: number;
};

/**
 * Extended types for public pages (v0.2.3)
 */
export type RestaurantWithDetails = Restaurant & {
  taxonomies: Array<{ taxonomy: Taxonomy }>;
  menus: Array<{
    menu: Menu & {
      dishes: Dish[];
    };
  }>;
  reviews: Array<Review & { user: User }>;
};

export type ReviewWithUser = Review & {
  user: User;
};
