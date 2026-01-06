"use client";

import { SignedIn, SignedOut } from "@clerk/nextjs";
import { SignInButton, SignUpButton, UserButton } from "@/components/auth/clerk-buttons";
import { Button } from "@/components/ui/button";
import Link from "next/link";

export default function ClerkAuthButtons() {
  return (
    <>
      {/* Desktop Auth */}
      <div className="hidden md:flex items-center gap-3">
        <SignedOut>
          <SignInButton />
          <SignUpButton />
        </SignedOut>
        <SignedIn>
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
        </SignedIn>
      </div>

      {/* Mobile Auth */}
      <div className="flex md:hidden items-center gap-2">
        <SignedOut>
          <SignInButton className="text-xs" />
        </SignedOut>
        <SignedIn>
          <Link href="/dashboard">
            <Button variant="ghost" size="sm" className="text-xs">
              Panel
            </Button>
          </Link>
          <UserButton />
        </SignedIn>
      </div>
    </>
  );
}
