"use client";

import { Button } from "@/components/ui/button";
import { Logo } from "@/components/ui/logo";
import Link from "next/link";
import { usePathname } from "next/navigation";
import dynamic from "next/dynamic";
import { useEffect, useState } from "react";

// Lazy load ALL Clerk components to avoid SSR issues
const ClerkAuth = dynamic(() => import("./clerk-auth-buttons"), { ssr: false });

export function PublicHeader() {
  const pathname = usePathname();
  const isOnHomePage = pathname === "/";
  const isOnRestaurantsPage = pathname === "/restaurants";
  const [mounted, setMounted] = useState(false);

  useEffect(() => {
    setMounted(true);
  }, []);

  return (
    <header className="border-b bg-white/80 backdrop-blur-md sticky top-0 z-50">
      <div className="container mx-auto px-4 py-3">
        <nav className="flex items-center justify-between">
          {/* Logo - Left */}
          <Logo />

          {/* Navigation - Center */}
          <div className="hidden md:flex items-center gap-1 absolute left-1/2 -translate-x-1/2">
            <Link href="/">
              <Button
                variant="ghost"
                className={`font-semibold transition-colors ${
                  isOnHomePage
                    ? "text-primary bg-primary/5"
                    : "text-muted-foreground hover:text-white"
                }`}
              >
                Inicio
              </Button>
            </Link>
            <Link href="/restaurants">
              <Button
                variant="ghost"
                className={`font-semibold transition-colors ${
                  isOnRestaurantsPage
                    ? "text-primary bg-primary/5"
                    : "text-muted-foreground hover:text-white"
                }`}
              >
                Buscar Restaurante
              </Button>
            </Link>
          </div>

          {/* Auth - Right */}
          {mounted && <ClerkAuth />}
        </nav>
      </div>
    </header>
  );
}
