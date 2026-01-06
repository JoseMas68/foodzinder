"use client";

import { SignInButton as ClerkSignInButton, SignUpButton as ClerkSignUpButton, UserButton as ClerkUserButton } from "@clerk/nextjs";
import { Button } from "@/components/ui/button";

export function SignInButton({ children, className }: { children?: React.ReactNode; className?: string }) {
  return (
    <ClerkSignInButton mode="modal">
      {children || (
        <Button variant="ghost" size="sm" className={className || "font-medium"}>
          Iniciar Sesión
        </Button>
      )}
    </ClerkSignInButton>
  );
}

export function SignUpButton({ children, className }: { children?: React.ReactNode; className?: string }) {
  return (
    <ClerkSignUpButton mode="modal">
      {children || (
        <Button size="sm" className={className || "font-semibold"}>
          Registrarse
        </Button>
      )}
    </ClerkSignUpButton>
  );
}

export function UserButton({ appearance }: { appearance?: any }) {
  return <ClerkUserButton appearance={appearance} />;
}
