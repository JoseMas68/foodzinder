import { auth } from '@clerk/nextjs/server'
import { redirect } from 'next/navigation'

export default async function GetClerkIdPage() {
  const { userId } = await auth()

  if (!userId) {
    redirect('/sign-in')
  }

  return (
    <div className="min-h-screen flex items-center justify-center p-8">
      <div className="max-w-2xl w-full bg-white rounded-lg shadow-lg p-8">
        <h1 className="text-3xl font-bold mb-6">Tu Clerk User ID</h1>

        <div className="bg-gray-100 p-4 rounded-lg mb-6">
          <p className="text-sm text-gray-600 mb-2">Copia este ID:</p>
          <code className="text-lg font-mono bg-white p-3 rounded block break-all">
            {userId}
          </code>
        </div>

        <div className="space-y-4">
          <h2 className="text-xl font-semibold">Pasos siguientes:</h2>
          <ol className="list-decimal list-inside space-y-2 text-gray-700">
            <li>Copia el ID de arriba</li>
            <li>Abre Prisma Studio en <a href="http://localhost:5555" target="_blank" className="text-blue-600 underline">http://localhost:5555</a></li>
            <li>Ve a la tabla <strong>User</strong></li>
            <li>Busca tu email: <strong>josemas68@gmail.com</strong></li>
            <li>Actualiza el campo <code className="bg-gray-100 px-2 py-1 rounded">clerkId</code> con el ID de arriba</li>
            <li>Guarda los cambios</li>
            <li>Regresa a <a href="/dashboard" className="text-blue-600 underline">/dashboard</a></li>
          </ol>
        </div>
      </div>
    </div>
  )
}
