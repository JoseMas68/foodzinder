'use client'

import { UserButton } from '@clerk/nextjs'
import { Menu } from 'lucide-react'
import { Button } from '@/components/ui/button'

export function DashboardHeader() {
  return (
    <header className="h-16 border-b bg-white lg:ml-64">
      <div className="flex items-center justify-between h-full px-6">
        {/* Mobile menu button */}
        <Button
          variant="ghost"
          size="icon"
          className="lg:hidden"
        >
          <Menu className="h-5 w-5" />
        </Button>

        {/* Spacer */}
        <div className="flex-1 lg:hidden" />

        {/* User menu */}
        <div className="flex items-center gap-4">
          <UserButton
            appearance={{
              elements: {
                avatarBox: 'w-9 h-9',
              },
            }}
          />
        </div>
      </div>
    </header>
  )
}
