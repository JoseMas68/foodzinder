"use client";

import { useAuth, useUser } from "@clerk/nextjs";
import { SignInButton, SignUpButton, UserButton } from "@/components/auth/clerk-buttons";
import { Button } from "@/components/ui/button";
import Link from "next/link";

export default function ClerkAuthButtons() {
  const { isSignedIn } = useAuth();
  const { isLoaded } = useUser();

  // Don't render until Clerk is loaded
  if (!isLoaded) {
    return (
      <div className="hidden md:flex items-center gap-3 h-9 w-48">
        {/* Placeholder while loading */}
      </div>
    );
  }

  return (
    <>
      {/* Desktop Auth */}
      <div className="hidden md:flex items-center gap-3">
        {!isSignedIn ? (
          <>
            <SignInButton />
            <SignUpButton />
          </>
        ) : (
          <>
            <Link href="/dashboard">
              <Button variant="ghost" size="sm" className="font-medium">
                Dashboard
              </Button>
            </Link>
            <UserButton
              appearance={{
                elements: {
                  avatarBox: "w-9 h-9",
                },
              }}
            />
          </>
        )}
      </div>

      {/* Mobile Auth */}
      <div className="flex md:hidden items-center gap-2">
        {!isSignedIn ? (
          <SignInButton className="text-xs" />
        ) : (
          <>
            <Link href="/dashboard">
              <Button variant="ghost" size="sm" className="text-xs">
                Panel
              </Button>
            </Link>
            <UserButton />
          </>
        )}
      </div>
    </>
  );
}
