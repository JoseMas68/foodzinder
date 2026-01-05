'use client'

import { useSignIn } from '@clerk/nextjs'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card'
import { Shield, Store, User } from 'lucide-react'
import { useState } from 'react'

const DEMO_USERS = {
  admin: {
    email: 'admin@foodzinder.com',
    password: 'FoodZ1nd3r@Adm1n2026!',
    role: 'ADMIN',
    icon: Shield,
    color: 'bg-red-500 hover:bg-red-600',
    description: 'Acceso total • Gestión de plataforma',
  },
  owner: {
    email: 'owner@foodzinder.com',
    password: 'FoodZ1nd3r@Own3r2026!',
    role: 'OWNER',
    icon: Store,
    color: 'bg-yellow-500 hover:bg-yellow-600',
    description: 'Gestión de restaurantes',
  },
  user: {
    email: 'user@foodzinder.com',
    password: 'FoodZ1nd3r@Us3r2026!',
    role: 'USER',
    icon: User,
    color: 'bg-green-500 hover:bg-green-600',
    description: 'Reservas • Reseñas • Favoritos',
  },
}

export function DemoAccess() {
  const { isLoaded, signIn, setActive } = useSignIn()
  const [loading, setLoading] = useState<string | null>(null)

  const handleDemoLogin = async (userType: keyof typeof DEMO_USERS) => {
    if (!isLoaded || !signIn) return

    setLoading(userType)

    try {
      const demoUser = DEMO_USERS[userType]

      const result = await signIn.create({
        identifier: demoUser.email,
        password: demoUser.password,
      })

      // Completar la autenticación si está pendiente
      if (result.status === 'complete' && setActive) {
        await setActive({ session: result.createdSessionId })
        window.location.href = '/dashboard'
      }
    } catch (error: any) {
      console.error('Error en demo login:', error)
      alert(
        `⚠️ Usuario demo no configurado correctamente.\n\n` +
        `Por favor, crea el usuario en Clerk:\n` +
        `Email: ${DEMO_USERS[userType].email}\n` +
        `Password: ${DEMO_USERS[userType].password}\n\n` +
        `Consulta TEST_USERS.md para más información.`
      )
    } finally {
      setLoading(null)
    }
  }

  return (
    <Card className="w-full max-w-md border-2">
      <CardHeader className="text-center">
        <CardTitle className="text-2xl">🎭 Modo Demo</CardTitle>
        <CardDescription>
          Explora Foodzinder con diferentes roles
        </CardDescription>
      </CardHeader>
      <CardContent className="space-y-3">
        {(Object.keys(DEMO_USERS) as Array<keyof typeof DEMO_USERS>).map((key) => {
          const demo = DEMO_USERS[key]
          const Icon = demo.icon

          return (
            <Button
              key={key}
              onClick={() => handleDemoLogin(key)}
              disabled={!isLoaded || loading !== null}
              className={`w-full h-auto py-4 px-6 flex items-start gap-4 ${demo.color} text-white`}
              variant="default"
            >
              <Icon className="h-6 w-6 mt-0.5 flex-shrink-0" />
              <div className="flex-1 text-left">
                <div className="font-semibold text-base">
                  {loading === key ? 'Accediendo...' : `Demo ${demo.role}`}
                </div>
                <div className="text-xs text-white/90 mt-0.5">
                  {demo.description}
                </div>
              </div>
            </Button>
          )
        })}

        <div className="pt-4 border-t">
          <p className="text-xs text-muted-foreground text-center">
            💡 Estos usuarios de prueba te permiten explorar todas las funcionalidades de la plataforma
          </p>
        </div>
      </CardContent>
    </Card>
  )
}
