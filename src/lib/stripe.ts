import Stripe from "stripe";
import { env } from "@/env";

if (!env.STRIPE_SECRET_KEY) {
    throw new Error("STRIPE_SECRET_KEY is not defined");
}

export const stripe = new Stripe(env.STRIPE_SECRET_KEY, {
    apiVersion: "2023-10-16", // Usa la versión que prefieras o la más reciente compatible
    typescript: true,
});
