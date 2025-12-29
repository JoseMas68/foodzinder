import { SignIn } from '@clerk/nextjs'

export default function SignInPage() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-muted/30">
      <SignIn
        appearance={{
          elements: {
            formButtonPrimary: 'bg-[#FF6B9D] hover:bg-[#FF6B9D]/90',
            footerActionLink: 'text-[#FF6B9D] hover:text-[#FF6B9D]/90',
          }
        }}
      />
    </div>
  )
}
