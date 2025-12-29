import { SignUp } from '@clerk/nextjs'

export default function SignUpPage() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-muted/30">
      <SignUp
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
