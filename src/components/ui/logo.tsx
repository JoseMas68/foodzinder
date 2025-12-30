import Link from "next/link";
import { Utensils } from "lucide-react";

interface LogoProps {
    className?: string;
    showText?: boolean;
}

export function Logo({ className = "", showText = true }: LogoProps) {
    return (
        <Link href="/" className={`flex items-center gap-2 group ${className}`}>
            <div className="bg-primary p-2 rounded-full transition-transform group-hover:scale-110 duration-300 shadow-sm shadow-primary/20">
                <Utensils className="h-5 w-5 text-white" />
            </div>
            {showText && (
                <span className="text-2xl font-heading font-bold tracking-tight text-gray-900 group-hover:text-primary transition-colors duration-300">
                    Foodzinder
                </span>
            )}
        </Link>
    );
}
