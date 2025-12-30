'use client'

import { useState, useEffect } from 'react'
import { Switch } from '@/components/ui/switch'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import type { OpeningHourInput } from '@/lib/validations'

interface OpeningHoursInputProps {
  value?: OpeningHourInput[]
  onChange: (hours: OpeningHourInput[]) => void
}

const DAYS = [
  { id: 0, name: 'Domingo' },
  { id: 1, name: 'Lunes' },
  { id: 2, name: 'Martes' },
  { id: 3, name: 'Miércoles' },
  { id: 4, name: 'Jueves' },
  { id: 5, name: 'Viernes' },
  { id: 6, name: 'Sábado' },
]

export function OpeningHoursInput({ value = [], onChange }: OpeningHoursInputProps) {
  const [hours, setHours] = useState<OpeningHourInput[]>(() => {
    // Initialize with default values if empty
    if (value.length === 0) {
      return DAYS.map(day => ({
        dayOfWeek: day.id,
        openTime: '09:00',
        closeTime: '22:00',
        isClosed: false,
      }))
    }
    return value
  })

  useEffect(() => {
    onChange(hours)
  }, [hours, onChange])

  const updateDay = (dayOfWeek: number, field: keyof OpeningHourInput, newValue: string | boolean) => {
    setHours(prev => prev.map(h =>
      h.dayOfWeek === dayOfWeek
        ? { ...h, [field]: newValue }
        : h
    ))
  }

  return (
    <div className="space-y-4">
      {DAYS.map(day => {
        const dayHours = hours.find(h => h.dayOfWeek === day.id) || {
          dayOfWeek: day.id,
          openTime: '09:00',
          closeTime: '22:00',
          isClosed: false,
        }

        return (
          <div key={day.id} className="flex items-center gap-4 rounded-lg border p-4">
            <div className="w-28 font-medium">{day.name}</div>

            <div className="flex items-center gap-2">
              <Switch
                checked={!dayHours.isClosed}
                onCheckedChange={(checked) => updateDay(day.id, 'isClosed', !checked)}
              />
              <Label className="text-sm text-gray-600">
                {dayHours.isClosed ? 'Cerrado' : 'Abierto'}
              </Label>
            </div>

            {!dayHours.isClosed && (
              <div className="flex items-center gap-2 flex-1">
                <Input
                  type="time"
                  value={dayHours.openTime || '09:00'}
                  onChange={(e) => updateDay(day.id, 'openTime', e.target.value)}
                  className="w-32"
                />
                <span className="text-gray-400">-</span>
                <Input
                  type="time"
                  value={dayHours.closeTime || '22:00'}
                  onChange={(e) => updateDay(day.id, 'closeTime', e.target.value)}
                  className="w-32"
                />
              </div>
            )}
          </div>
        )
      })}
    </div>
  )
}
