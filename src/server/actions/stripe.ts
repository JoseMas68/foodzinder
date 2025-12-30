"use server";

import { stripe } from "@/lib/stripe";
import { auth } from "@clerk/nextjs/server";
import { prisma } from "@/lib/prisma";
import { env } from "@/env";
import { redirect } from "next/navigation";

/**
 * Crear sesión de Checkout para suscripción
 */
export async function createCheckoutSession(priceId: string) {
    const { userId } = await auth();

    if (!userId) {
        throw new Error("No autorizado");
    }

    const user = await prisma.user.findUnique({
        where: { id: userId },
    });

    if (!user) {
        throw new Error("Usuario no encontrado en la base de datos");
    }

    // Verificar si ya tiene un Stripe Customer ID, si no, lo crearemos en el webhook o aquí
    // Pero lo ideal es crearlo aquí si no existe para vincularlo.

    const session = await stripe.checkout.sessions.create({
        payment_method_types: ["card"],
        line_items: [
            {
                price: priceId,
                quantity: 1,
            },
        ],
        mode: "subscription",
        success_url: `${env.NEXT_PUBLIC_APP_URL}/dashboard/settings/billing?success=true`,
        cancel_url: `${env.NEXT_PUBLIC_APP_URL}/dashboard/settings/billing?canceled=true`,
        client_reference_id: userId,
        customer_email: user.email,
        metadata: {
            userId: userId,
        },
    });

    if (!session.url) {
        throw new Error("Error al crear sesión de Stripe");
    }

    redirect(session.url);
}

/**
 * Crear sesión de Portal de Facturación
 */
export async function createCustomerPortal() {
    const { userId } = await auth();

    if (!userId) throw new Error("No autorizado");

    // Necesitamos el stripeCustomerId guardado en el usuario
    // Nota: Deberías añadir `stripeCustomerId String? @unique` al modelo User en Prisma
    /* const user = await prisma.user.findUnique({
        where: { id: userId },
    }); */

    // if (!user?.stripeCustomerId) {
    //   throw new Error("No tienes una suscripción activa o perfil de cliente");
    // }

    // Simulación por ahora ya que el modelo no tiene stripeCustomerId
    // Deberíamos actualizar el esquema de Prisma primero.

    // const session = await stripe.billingPortal.sessions.create({
    //   customer: user.stripeCustomerId,
    //   return_url: `${env.NEXT_PUBLIC_APP_URL}/dashboard/settings/billing`,
    // });

    // redirect(session.url);

    return { error: "Portal no disponible: falta stripeCustomerId en el modelo" };
}
