import { NextResponse } from 'next/server';

export const dynamic = 'force-dynamic';

export async function GET() {
  try {
    // Check environment variables
    const hasClerk = !!(process.env.NEXT_PUBLIC_CLERK_PUBLISHABLE_KEY && process.env.CLERK_SECRET_KEY);
    const hasDatabase = !!process.env.DATABASE_URL;

    // Try to import prisma
    let canConnectDB = false;
    let dbError = null;
    try {
      const { prisma } = await import('@/lib/prisma');
      await prisma.$queryRaw`SELECT 1`;
      canConnectDB = true;
    } catch (error) {
      dbError = error instanceof Error ? error.message : 'Unknown database error';
      console.error('Database connection error:', error);
    }

    return NextResponse.json({
      status: 'ok',
      timestamp: new Date().toISOString(),
      env: {
        nodeEnv: process.env.NODE_ENV,
        hasClerk,
        hasDatabase,
        canConnectDB,
        dbError,
      },
      git: {
        sha: process.env.GIT_SHA || 'unknown',
      }
    });
  } catch (error) {
    return NextResponse.json({
      status: 'error',
      error: error instanceof Error ? error.message : 'Unknown error',
      stack: error instanceof Error ? error.stack : undefined,
    }, { status: 500 });
  }
}
