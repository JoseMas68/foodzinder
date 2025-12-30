'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import { cn } from '@/lib/utils'
import { Building2, Home, PlusCircle, Settings } from 'lucide-react'
import { Logo } from '@/components/ui/logo'

const navigation = [
  {
    name: 'Dashboard',
    href: '/dashboard',
    icon: Home,
  },
  {
    name: 'Mis Restaurantes',
    href: '/dashboard/restaurants',
    icon: Building2,
  },
  {
    name: 'Nuevo Restaurante',
    href: '/dashboard/restaurants/new',
    icon: PlusCircle,
  },
  {
    name: 'Configuración',
    href: '/dashboard/settings',
    icon: Settings,
  },
]

export function DashboardSidebar() {
  const pathname = usePathname()

  return (
    <div className="hidden lg:flex lg:flex-col lg:w-64 lg:fixed lg:inset-y-0 border-r bg-white">
      <div className="flex flex-col flex-1">
        {/* Logo */}
        <div className="flex items-center h-16 px-6 border-b">
          <Logo />
        </div>

        {/* Navigation */}
        <nav className="flex-1 px-4 py-6 space-y-1">
          {navigation.map((item) => {
            const isActive = pathname === item.href
            return (
              <Link
                key={item.name}
                href={item.href}
                className={cn(
                  'flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-lg transition-colors',
                  isActive
                    ? 'bg-primary/10 text-primary'
                    : 'text-gray-600 hover:bg-muted hover:text-gray-900'
                )}
              >
                <item.icon className="h-5 w-5" />
                {item.name}
              </Link>
            )
          })}
        </nav>

        {/* Footer */}
        <div className="p-4 border-t">
          <Link
            href="/"
            className="flex items-center gap-2 px-3 py-2 text-sm text-gray-600 hover:text-gray-900 transition-colors"
          >
            <span>← Volver al sitio</span>
          </Link>
        </div>
      </div>
    </div>
  )
}
