import { stripe } from "@/lib/stripe";
import { headers } from "next/headers";
import { prisma } from "@/lib/prisma";
import { env } from "@/env";
import Stripe from "stripe";

export async function POST(req: Request) {
    const body = await req.text();
    const signature = (await headers()).get("Stripe-Signature") as string;

    if (!env.STRIPE_WEBHOOK_SECRET) {
        return new Response('Stripe webhook not configured', { status: 503 });
    }

    let event: Stripe.Event;

    try {
        event = stripe.webhooks.constructEvent(
            body,
            signature,
            env.STRIPE_WEBHOOK_SECRET
        );
    } catch (error: any) {
        return new Response(`Webhook Error: ${error.message}`, { status: 400 });
    }

    const session = event.data.object as Stripe.Checkout.Session;

    if (event.type === "checkout.session.completed") {
        const subscription = await stripe.subscriptions.retrieve(
            session.subscription as string
        );

        if (!session?.metadata?.userId) {
            return new Response("User id is required", { status: 400 });
        }

        // Actualizar usuario con ID de cliente y suscripción
        await prisma.user.update({
            where: {
                id: session.metadata.userId,
            },
            data: {
                stripeCustomerId: session.customer as string,
                // Aquí podrías crear la entrada en la tabla Subscription
            },
        });

        // Crear registro en la tabla Subscription del modelo
        await prisma.subscription.create({
            data: {
                userId: session.metadata.userId,
                startDate: new Date(subscription.current_period_start * 1000),
                endDate: new Date(subscription.current_period_end * 1000),
                status: "ACTIVE",
                planId: subscription.items.data[0].price.id,
                amount: (subscription.items.data[0].price.unit_amount || 0) / 100,
                currency: subscription.currency.toUpperCase(),
            },
        });
    }

    if (event.type === "invoice.payment_succeeded") {
        const subscription = await stripe.subscriptions.retrieve(
            session.subscription as string
        );

        // Actualizar fecha de fin de la suscripción
        await prisma.subscription.updateMany({
            where: {
                planId: subscription.items.data[0].price.id,
                // Podríamos buscar por stripeCustomerId si lo vinculamos mejor
            },
            data: {
                endDate: new Date(subscription.current_period_end * 1000),
            },
        });

        // Aquí se podría generar la factura en el modelo Invoice
    }

    return new Response(null, { status: 200 });
}
