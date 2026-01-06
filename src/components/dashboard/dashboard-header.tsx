'use client'

import { UserButton } from '@/components/auth/clerk-buttons'
import { Menu } from 'lucide-react'
import { Button } from '@/components/ui/button'

export function DashboardHeader() {
  return (
    <header className="h-16 border-b bg-white lg:ml-64">
      <div className="flex items-center justify-between h-full px-6">
        <div className="flex items-center gap-3">
          <Button variant="ghost" size="icon" className="lg:hidden">
            <Menu className="h-5 w-5" />
          </Button>
        </div>

        <div className="flex flex-1 justify-end" suppressHydrationWarning>
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
      </div>
    </header>
  )
}
