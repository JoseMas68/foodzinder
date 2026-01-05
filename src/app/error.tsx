'use client'

import { useEffect } from 'react'
import { Button } from '@/components/ui/button'

export default function Error({
  error,
  reset,
}: {
  error: Error & { digest?: string }
  reset: () => void
}) {
  useEffect(() => {
    // Log the error to the console
    console.error('Application error:', error)
  }, [error])

  return (
    <div className="flex min-h-screen flex-col items-center justify-center bg-gray-50 px-4">
      <div className="w-full max-w-md text-center">
        <div className="mb-8">
          <h1 className="text-6xl font-bold text-red-500">Error</h1>
          <h2 className="mt-4 text-2xl font-semibold text-gray-900">
            Algo salió mal
          </h2>
          <p className="mt-2 text-gray-600">
            Ocurrió un error inesperado en el servidor.
          </p>
        </div>

        <div className="rounded-lg bg-white p-6 shadow-lg">
          <div className="mb-4 text-left">
            <p className="text-sm font-medium text-gray-700">Detalles del error:</p>
            <pre className="mt-2 overflow-auto rounded bg-gray-100 p-3 text-xs text-gray-800">
              {error.message}
            </pre>
            {error.digest && (
              <p className="mt-2 text-xs text-gray-500">
                Digest: {error.digest}
              </p>
            )}
          </div>

          <div className="space-y-2">
            <Button
              onClick={reset}
              className="w-full"
            >
              Intentar de nuevo
            </Button>
            <Button
              onClick={() => window.location.href = '/health'}
              variant="outline"
              className="w-full"
            >
              Ver diagnóstico del sistema
            </Button>
            <Button
              onClick={() => window.location.href = '/'}
              variant="ghost"
              className="w-full"
            >
              Ir al inicio
            </Button>
          </div>
        </div>

        <p className="mt-6 text-sm text-gray-500">
          Si el problema persiste, contacta al administrador del sistema.
        </p>
      </div>
    </div>
  )
}
