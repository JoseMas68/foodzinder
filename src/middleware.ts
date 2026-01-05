import { clerkMiddleware, createRouteMatcher } from '@clerk/nextjs/server'
import { NextResponse } from 'next/server'

// Define rutas públicas (accesibles sin autenticación)
const isPublicRoute = createRouteMatcher([
  '/',
  '/restaurants(.*)',
  '/sign-in(.*)',
  '/sign-up(.*)',
  '/api/webhooks(.*)',
  '/api/search(.*)',
])

export default clerkMiddleware(async (auth, request) => {
  try {
    // Si la ruta no es pública, requiere autenticación
    if (!isPublicRoute(request)) {
      const { userId, redirectToSignIn } = await auth()
      if (!userId) {
        return redirectToSignIn()
      }
    }
    // Continue to the next middleware or route handler
    return NextResponse.next()
  } catch (error) {
    // Log error but don't crash the app
    console.error('Clerk middleware error:', error)
    // If Clerk is misconfigured, allow public routes to work
    if (isPublicRoute(request)) {
      return NextResponse.next()
    }
    // For protected routes, redirect to sign-in on error
    return NextResponse.redirect(new URL('/sign-in', request.url))
  }
})

export const config = {
  matcher: [
    // Skip Next.js internals and all static files, unless found in search params
    '/((?!_next|[^?]*\\.(?:html?|css|js(?!on)|jpe?g|webp|png|gif|svg|ttf|woff2?|ico|csv|docx?|xlsx?|zip|webmanifest)).*)',
    // Always run for API routes
    '/(api|trpc)(.*)',
  ],
}
