import Link from "next/link";

export function PublicHeader() {
  return (
    <header className="border-b">
      <div className="container mx-auto px-4 py-4">
        <nav className="flex items-center justify-between">
          <Link href="/" className="text-2xl font-bold">
            Foodzinder
          </Link>

          <div className="hidden md:flex gap-6">
            <Link href="/" className="hover:text-primary transition-colors">
              Inicio
            </Link>
            <Link
              href="/restaurants"
              className="hover:text-primary transition-colors"
            >
              Explorar
            </Link>
          </div>

          {/* Mobile nav: simplificado en v0.2.3b */}
          <div className="md:hidden">
            <Link
              href="/restaurants"
              className="text-sm font-medium hover:text-primary"
            >
              Explorar
            </Link>
          </div>
        </nav>
      </div>
    </header>
  );
}
