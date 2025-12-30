import { clerkMiddleware, createRouteMatcher } from '@clerk/nextjs/server'

// Define rutas públicas (accesibles sin autenticación)
const isPublicRoute = createRouteMatcher([
  '/',
  '/restaurants(.*)',
  '/sign-in(.*)',
  '/sign-up(.*)',
  '/api/webhooks(.*)',
])

export default clerkMiddleware(async (auth, request) => {
  // Si la ruta no es pública, requiere autenticación
  if (!isPublicRoute(request)) {
    const { userId, redirectToSignIn } = await auth()
    if (!userId) {
      return redirectToSignIn()
    }
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
