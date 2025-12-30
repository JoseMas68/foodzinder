import Link from "next/link";
import { Facebook, Twitter, Instagram, Linkedin, Heart } from "lucide-react";
import { Logo } from "@/components/ui/logo";

export function HomeFooter() {
  const currentYear = new Date().getFullYear();

  const footerLinks = {
    producto: [
      { label: "Buscar Restaurantes", href: "/restaurants" },
      { label: "Cómo Funciona", href: "/#how-it-works" },
      { label: "Precios", href: "/pricing" },
      { label: "Para Propietarios", href: "/owner" },
    ],
    empresa: [
      { label: "Acerca de", href: "/about" },
      { label: "Blog", href: "/blog" },
      { label: "Carreras", href: "/careers" },
      { label: "Contacto", href: "/contact" },
    ],
    legal: [
      { label: "Privacidad", href: "/privacy" },
      { label: "Términos", href: "/terms" },
      { label: "Cookies", href: "/cookies" },
    ],
  };

  const socialLinks = [
    { icon: Facebook, href: "https://facebook.com", label: "Facebook" },
    { icon: Twitter, href: "https://twitter.com", label: "Twitter" },
    { icon: Instagram, href: "https://instagram.com", label: "Instagram" },
    { icon: Linkedin, href: "https://linkedin.com", label: "LinkedIn" },
  ];

  return (
    <footer className="bg-white border-t mt-20 pt-16 pb-8">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-12 mb-16">
          {/* Logo & Description */}
          <div className="lg:col-span-2 space-y-6">
            <Logo />
            <p className="text-gray-500 text-sm max-w-sm leading-relaxed">
              La plataforma premium para descubrir y disfrutar de experiencias culinarias con Wow Effect. Encontramos los mejores lugares para ti.
            </p>
            <div className="flex gap-4">
              {socialLinks.map((social) => {
                const Icon = social.icon;
                return (
                  <a
                    key={social.label}
                    href={social.href}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="w-10 h-10 rounded-full bg-gray-50 flex items-center justify-center text-gray-400 hover:bg-primary/10 hover:text-primary transition-all duration-300"
                    aria-label={social.label}
                  >
                    <Icon className="h-5 w-5" />
                  </a>
                );
              })}
            </div>
          </div>

          {/* Producto */}
          <div>
            <h3 className="font-heading font-bold text-gray-900 mb-6">Producto</h3>
            <ul className="space-y-4">
              {footerLinks.producto.map((link) => (
                <li key={link.href}>
                  <Link
                    href={link.href}
                    className="text-sm text-gray-500 hover:text-primary transition-colors font-medium"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Empresa */}
          <div>
            <h3 className="font-heading font-bold text-gray-900 mb-6">Empresa</h3>
            <ul className="space-y-4">
              {footerLinks.empresa.map((link) => (
                <li key={link.href}>
                  <Link
                    href={link.href}
                    className="text-sm text-gray-500 hover:text-primary transition-colors font-medium"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>

          {/* Legal */}
          <div>
            <h3 className="font-heading font-bold text-gray-900 mb-6">Legal</h3>
            <ul className="space-y-4">
              {footerLinks.legal.map((link) => (
                <li key={link.href}>
                  <Link
                    href={link.href}
                    className="text-sm text-gray-500 hover:text-primary transition-colors font-medium"
                  >
                    {link.label}
                  </Link>
                </li>
              ))}
            </ul>
          </div>
        </div>

        {/* Copyright */}
        <div className="border-t border-gray-100 pt-8 flex flex-col md:row items-center justify-between gap-4">
          <p className="text-sm text-gray-400 font-medium">
            © {currentYear} Foodzinder. Todos los derechos reservados.
          </p>
          <p className="text-sm text-gray-400 flex items-center gap-1 font-medium">
            Hecho con <Heart className="h-4 w-4 text-primary fill-primary" /> para amantes de la comida
          </p>
        </div>
      </div>
    </footer>
  );
}
