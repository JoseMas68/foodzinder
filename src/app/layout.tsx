import type { Metadata } from "next";
import { Inter, Outfit } from "next/font/google";
import { ClerkProvider } from "@clerk/nextjs";
import "@/styles/globals.css";
import { Toaster } from "@/components/ui/toaster";

const inter = Inter({
  variable: "--font-sans",
  subsets: ["latin"],
});

const outfit = Outfit({
  variable: "--font-heading",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Foodzinder - Descubre restaurantes con Wow Effect",
  description:
    "La plataforma de restaurantes más hermosa. Descubre, explora y disfruta de la mejor experiencia culinaria.",
  keywords: [
    "restaurantes",
    "comida",
    "gastronomía",
    "búsqueda de restaurantes",
    "reseñas",
  ],
  openGraph: {
    title: "Foodzinder",
    description: "Descubre restaurantes con Wow Effect",
    type: "website",
  },
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <ClerkProvider>
      <html lang="es" suppressHydrationWarning>
        <body
          className={`${inter.variable} ${outfit.variable} font-sans antialiased`}
          suppressHydrationWarning
        >
          {children}
          <Toaster />
        </body>
      </html>
    </ClerkProvider>
  );
}
