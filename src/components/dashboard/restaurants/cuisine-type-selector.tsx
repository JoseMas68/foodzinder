'use client'

import { useState, useEffect } from 'react'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'

interface Taxonomy {
  id: string
  name: string
  slug: string
}

interface CuisineTypeSelectorProps {
  value?: string[]
  onChange: (ids: string[]) => void
  taxonomies: Taxonomy[]
}

export function CuisineTypeSelector({ value = [], onChange, taxonomies }: CuisineTypeSelectorProps) {
  const [selected, setSelected] = useState<string[]>(value)

  useEffect(() => {
    onChange(selected)
  }, [selected, onChange])

  const toggleTaxonomy = (id: string) => {
    setSelected(prev =>
      prev.includes(id)
        ? prev.filter(item => item !== id)
        : [...prev, id]
    )
  }

  return (
    <div className="grid grid-cols-2 md:grid-cols-3 gap-4">
      {taxonomies.map(taxonomy => (
        <div key={taxonomy.id} className="flex items-center space-x-2">
          <Checkbox
            id={taxonomy.id}
            checked={selected.includes(taxonomy.id)}
            onCheckedChange={() => toggleTaxonomy(taxonomy.id)}
          />
          <Label
            htmlFor={taxonomy.id}
            className="text-sm font-normal cursor-pointer"
          >
            {taxonomy.name}
          </Label>
        </div>
      ))}
    </div>
  )
}
