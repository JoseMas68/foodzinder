"use client";

import { useEffect, useRef, useState } from "react";
import type { LucideIcon } from "lucide-react";

interface StatsCounterProps {
  value: number;
  label: string;
  icon: LucideIcon;
  duration?: number;
}

export function StatsCounter({
  value,
  label,
  icon: Icon,
  duration = 2000,
}: StatsCounterProps) {
  const [count, setCount] = useState(0);
  const [isVisible, setIsVisible] = useState(false);
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          setIsVisible(true);
          observer.unobserve(entry.target);
        }
      },
      { threshold: 0.1 }
    );

    if (ref.current) {
      observer.observe(ref.current);
    }

    return () => observer.disconnect();
  }, []);

  useEffect(() => {
    if (!isVisible) return;

    let start = 0;
    const increment = value / (duration / 16); // 60 FPS

    const timer = setInterval(() => {
      start += increment;
      if (start >= value) {
        setCount(value);
        clearInterval(timer);
      } else {
        setCount(Math.floor(start));
      }
    }, 16);

    return () => clearInterval(timer);
  }, [isVisible, value, duration]);

  return (
    <div
      ref={ref}
      className="flex flex-col items-center gap-2 opacity-0 transition-opacity duration-500"
      style={{ opacity: isVisible ? 1 : 0 }}
    >
      <Icon className="h-8 w-8 text-primary" />
      <div className="text-4xl font-bold">{count.toLocaleString()}</div>
      <div className="text-sm text-muted-foreground">{label}</div>
    </div>
  );
}
