'use client'

import { useState } from 'react'
import { RestaurantEditorShell } from './restaurant-editor-shell'
import { InfoForm } from './forms/info-form'
import { MediaForm } from './forms/media-form'
import { LocationForm } from './forms/location-form'
import { HoursForm } from './forms/hours-form'
import { TaxonomyForm } from './forms/taxonomy-form'
import { RestaurantMenus } from './restaurant-menus'
import { updateRestaurant } from '@/server/actions/restaurants'
import { useRouter } from 'next/navigation'

interface RestaurantEditorProps {
    restaurant: any
    taxonomies: {
        cuisineTypes: any[]
        features: any[]
        dietary: any[]
        ambiances: any[]
    }
    availableMenus: any[]
    assignedMenus: any[]
}

export function RestaurantEditor({
    restaurant,
    taxonomies,
    availableMenus,
    assignedMenus
}: RestaurantEditorProps) {
    const [activeTab, setActiveTab] = useState('general')
    const router = useRouter()

    const handleUpdate = async (data: any) => {
        const result = await updateRestaurant(restaurant.id, data)
        if (result.success) {
            router.refresh()
        }
        return result
    }

    return (
        <RestaurantEditorShell
            restaurantId={restaurant.id}
            activeTab={activeTab}
            onChangeTab={setActiveTab}
        >
            {activeTab === 'general' && (
                <InfoForm initialData={restaurant} onSubmit={handleUpdate} />
            )}
            {activeTab === 'media' && (
                <MediaForm initialData={restaurant} onSubmit={handleUpdate} />
            )}
            {activeTab === 'location' && (
                <LocationForm initialData={restaurant} onSubmit={handleUpdate} />
            )}
            {activeTab === 'hours' && (
                <HoursForm initialData={restaurant.openingHours} onSubmit={handleUpdate} />
            )}
            {activeTab === 'taxonomies' && (
                <TaxonomyForm
                    initialData={{
                        cuisineTypeIds: restaurant.taxonomies.filter((t: any) => t.taxonomy.type === 'CUISINE_TYPE').map((t: any) => t.taxonomyId),
                        featureIds: restaurant.taxonomies.filter((t: any) => t.taxonomy.type === 'RESTAURANT_FEATURE').map((t: any) => t.taxonomyId),
                        dietaryIds: restaurant.taxonomies.filter((t: any) => t.taxonomy.type === 'DIETARY').map((t: any) => t.taxonomyId),
                        ambianceIds: restaurant.taxonomies.filter((t: any) => t.taxonomy.type === 'AMBIANCE').map((t: any) => t.taxonomyId),
                    }}
                    onSubmit={handleUpdate}
                    taxonomies={taxonomies}
                />
            )}
            {activeTab === 'menus' && (
                <RestaurantMenus
                    restaurantId={restaurant.id}
                    availableMenus={availableMenus}
                    assignedMenus={assignedMenus}
                />
            )}

            {/* Otras pestañas como Mesas y Servicios pueden redireccionar o mostrar contenido embebido */}
            {(activeTab === 'tables' || activeTab === 'services' || activeTab === 'availability') && (
                <div className="flex flex-col items-center justify-center py-20 text-center">
                    <h3 className="text-xl font-bold mb-4">Gestión Avanzada</h3>
                    <p className="text-muted-foreground mb-8 max-w-md">
                        Para gestionar las mesas, servicios y turnos, utiliza las herramientas especializadas.
                    </p>
                    <div className="flex flex-wrap gap-4 justify-center">
                        <a href={`/dashboard/restaurants/${restaurant.id}/tables`} className="px-6 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors">
                            Mesas
                        </a>
                        <a href={`/dashboard/restaurants/${restaurant.id}/services`} className="px-6 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors">
                            Servicios
                        </a>
                        <a href={`/dashboard/restaurants/${restaurant.id}/availability`} className="px-6 py-2 bg-gray-900 text-white rounded-lg hover:bg-gray-800 transition-colors">
                            Disponibilidad
                        </a>
                    </div>
                </div>
            )}
        </RestaurantEditorShell>
    )
}
