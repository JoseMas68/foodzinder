'use client'

import { useState } from 'react'
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs'
import {
    Info,
    Image as ImageIcon,
    MapPin,
    Clock,
    Tags,
    UtensilsCrossed,
    Table as TableIcon,
    Calendar,
    Settings
} from 'lucide-react'
import { Card, CardContent } from '@/components/ui/card'

interface RestaurantEditorShellProps {
    restaurantId: string
    children: React.ReactNode
    activeTab: string
    onChangeTab: (tab: string) => void
}

export function RestaurantEditorShell({
    restaurantId,
    children,
    activeTab,
    onChangeTab
}: RestaurantEditorShellProps) {
    return (
        <div className="flex flex-col lg:flex-row gap-8">
            {/* Sidebar Navigation (Desktop) / Top Navigation (Mobile) */}
            <aside className="w-full lg:w-64 shrink-0">
                <nav className="flex lg:flex-col gap-1 overflow-x-auto pb-2 lg:pb-0 scrollbar-hide">
                    <NavButton
                        active={activeTab === 'general'}
                        onClick={() => onChangeTab('general')}
                        icon={<Info className="h-4 w-4" />}
                        label="Información General"
                    />
                    <NavButton
                        active={activeTab === 'media'}
                        onClick={() => onChangeTab('media')}
                        icon={<ImageIcon className="h-4 w-4" />}
                        label="Multimedia"
                    />
                    <NavButton
                        active={activeTab === 'location'}
                        onClick={() => onChangeTab('location')}
                        icon={<MapPin className="h-4 w-4" />}
                        label="Ubicación"
                    />
                    <NavButton
                        active={activeTab === 'hours'}
                        onClick={() => onChangeTab('hours')}
                        icon={<Clock className="h-4 w-4" />}
                        label="Horarios"
                    />
                    <NavButton
                        active={activeTab === 'taxonomies'}
                        onClick={() => onChangeTab('taxonomies')}
                        icon={<Tags className="h-4 w-4" />}
                        label="Categorías y Tags"
                    />
                    <div className="my-4 border-t border-gray-100 hidden lg:block" />
                    <NavButton
                        active={activeTab === 'menus'}
                        onClick={() => onChangeTab('menus')}
                        icon={<UtensilsCrossed className="h-4 w-4" />}
                        label="Menús y Platos"
                    />
                    <NavButton
                        active={activeTab === 'tables'}
                        onClick={() => onChangeTab('tables')}
                        icon={<TableIcon className="h-4 w-4" />}
                        label="Gestión de Mesas"
                    />
                    <NavButton
                        active={activeTab === 'services'}
                        onClick={() => onChangeTab('services')}
                        icon={<Calendar className="h-4 w-4" />}
                        label="Servicios y Turnos"
                    />
                    <NavButton
                        active={activeTab === 'availability'}
                        onClick={() => onChangeTab('availability')}
                        icon={<Settings className="h-4 w-4" />}
                        label="Disponibilidad"
                    />
                </nav>
            </aside>

            {/* Main Content Area */}
            <main className="flex-1 min-w-0">
                <Card className="border-none shadow-sm overflow-hidden">
                    <CardContent className="p-6 lg:p-10">
                        {children}
                    </CardContent>
                </Card>
            </main>
        </div>
    )
}

function NavButton({ active, onClick, icon, label }: { active: boolean; onClick: () => void; icon: React.ReactNode; label: string }) {
    return (
        <button
            onClick={onClick}
            className={`
        flex items-center gap-3 px-4 py-3 rounded-xl text-sm font-medium transition-all
        whitespace-nowrap lg:whitespace-normal
        ${active
                    ? 'bg-pink-500 text-white shadow-md shadow-pink-200'
                    : 'text-gray-500 hover:bg-gray-100 hover:text-gray-900'}
      `}
        >
            <span className={active ? 'text-white' : 'text-gray-400'}>{icon}</span>
            {label}
        </button>
    )
}
