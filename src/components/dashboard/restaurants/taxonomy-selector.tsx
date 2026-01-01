'use client'

import { useState, useEffect } from 'react'
import { Checkbox } from '@/components/ui/checkbox'
import { Label } from '@/components/ui/label'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'

interface Taxonomy {
  id: string
  name: string
  slug: string
  type: string
}

interface TaxonomySelectorProps {
  value?: string[]
  onChange: (ids: string[]) => void
  taxonomies: Taxonomy[]
  title: string
  description?: string
  icon?: React.ReactNode
}

export function TaxonomySelector({
  value = [],
  onChange,
  taxonomies,
  title,
  description,
  icon
}: TaxonomySelectorProps) {
  const [selected, setSelected] = useState<string[]>(value)

  useEffect(() => {
    setSelected(value)
  }, [value])

  const toggleTaxonomy = (id: string) => {
    const newSelected = selected.includes(id)
      ? selected.filter(item => item !== id)
      : [...selected, id]

    setSelected(newSelected)
    onChange(newSelected)
  }

  if (taxonomies.length === 0) return null

  return (
    <Card>
      <CardHeader>
        <CardTitle className="flex items-center gap-2">
          {icon}
          {title}
        </CardTitle>
        {description && <CardDescription>{description}</CardDescription>}
      </CardHeader>
      <CardContent>
        <div className="max-h-[200px] overflow-y-auto pr-4">
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
                  className="text-sm font-normal cursor-pointer leading-tight"
                >
                  {taxonomy.name}
                </Label>
              </div>
            ))}
          </div>
        </div>
        {selected.length > 0 && (
          <p className="text-xs text-muted-foreground mt-3">
            {selected.length} seleccionado{selected.length !== 1 ? 's' : ''}
          </p>
        )}
      </CardContent>
    </Card>
  )
}
