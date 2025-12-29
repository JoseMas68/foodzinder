import type { Metadata } from "next";
import { ClerkProvider } from "@clerk/nextjs";
import { Geist, Geist_Mono } from "next/font/google";
import "@/styles/globals.css";

const geist = Geist({
  variable: "--font-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-mono",
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
      <html lang="es">
        <body className={`${geist.variable} ${geistMono.variable} antialiased`}>
          {children}
        </body>
      </html>
    </ClerkProvider>
  );
}
