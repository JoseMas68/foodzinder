"use client";

import { SignInButton, SignUpButton, UserButton, SignedIn, SignedOut } from "@clerk/nextjs";
import { Button } from "@/components/ui/button";
import { Logo } from "@/components/ui/logo";
import Link from "next/link";
import { Search } from "lucide-react";
import { usePathname } from "next/navigation";

export function PublicHeader() {
  const pathname = usePathname();
  const isOnHomePage = pathname === "/";
  const isOnRestaurantsPage = pathname === "/restaurants";

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
          <div className="hidden md:flex items-center gap-3">
            <SignedOut>
              <SignInButton mode="modal">
                <Button variant="ghost" size="sm" className="font-medium">
                  Iniciar Sesión
                </Button>
              </SignInButton>
              <SignUpButton mode="modal">
                <Button size="sm" className="font-semibold">
                  Registrarse
                </Button>
              </SignUpButton>
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

          {/* Mobile nav */}
          <div className="flex md:hidden items-center gap-2">
            <SignedOut>
              <SignInButton mode="modal">
                <Button variant="ghost" size="sm" className="text-xs">
                  Entrar
                </Button>
              </SignInButton>
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
        </nav>
      </div>
    </header>
  );
}
