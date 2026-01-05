import { SignIn } from '@clerk/nextjs'
import { DemoAccess } from '@/components/auth/demo-access'

export default function SignInPage() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-muted/30 p-4">
      <div className="grid md:grid-cols-2 gap-8 max-w-5xl w-full">
        {/* Demo Access - Lado izquierdo */}
        <div className="flex items-center justify-center">
          <DemoAccess />
        </div>

        {/* Sign In Form - Lado derecho */}
        <div className="flex items-center justify-center">
          <SignIn
            appearance={{
              elements: {
                formButtonPrimary: 'bg-[#FF6B9D] hover:bg-[#FF6B9D]/90',
                footerActionLink: 'text-[#FF6B9D] hover:text-[#FF6B9D]/90',
              }
            }}
            forceRedirectUrl="/dashboard"
            signUpUrl="/sign-up"
          />
        </div>
      </div>
    </div>
  )
}
