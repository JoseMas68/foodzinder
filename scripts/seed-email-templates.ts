import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  console.log("🌱 Seeding email templates...");

  // Template de confirmación de reserva
  await prisma.emailTemplate.upsert({
    where: { type: "BOOKING_CONFIRMATION" },
    update: {},
    create: {
      type: "BOOKING_CONFIRMATION",
      name: "Confirmación de Reserva",
      description: "Email enviado al cliente cuando se crea o confirma una reserva",
      subject: "Reserva confirmada en {{restaurantName}}",
      variables: {
        fields: [
          "customerName",
          "restaurantName",
          "restaurantAddress",
          "date",
          "time",
          "partySize",
          "specialNotes",
          "tableNumber",
          "tableArea",
        ],
      },
      htmlContent: `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Confirmada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <!-- Header -->
    <div style="background: linear-gradient(135deg, #ec4899 0%, #f43f5e 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0 0 10px;">Reserva Confirmada ✓</h1>
      <p style="color: #ffffff; font-size: 16px; margin: 0; opacity: 0.9;">¡Genial! Tu reserva ha sido confirmada correctamente</p>
    </div>

    <!-- Content -->
    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>

      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido confirmada. Te esperamos el {{date}} a las {{time}}.
      </p>

      <!-- Details Box -->
      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <h2 style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Detalles de tu Reserva</h2>

        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px; vertical-align: top;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0; vertical-align: top;">
              <strong>{{restaurantName}}</strong><br>
              <span style="font-size: 13px; color: #6b7280;">{{restaurantAddress}}</span>
            </td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
          {{#if tableNumber}}
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Mesa:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">Mesa {{tableNumber}}{{#if tableArea}} - {{tableArea}}{{/if}}</td>
          </tr>
          {{/if}}
          {{#if specialNotes}}
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; vertical-align: top;">Notas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{specialNotes}}</td>
          </tr>
          {{/if}}
        </table>
      </div>

      <!-- Alert Box -->
      <div style="background: #fef3c7; border: 1px solid #fbbf24; border-left: 4px solid #f59e0b; border-radius: 6px; padding: 16px; margin: 24px 0;">
        <p style="font-size: 15px; font-weight: 600; color: #92400e; margin: 0 0 8px;">📌 Importante</p>
        <p style="font-size: 14px; line-height: 20px; color: #78350f; margin: 0;">
          Por favor, llega 10 minutos antes de tu hora de reserva. Si necesitas cancelar o modificar tu reserva, hazlo con al menos 24 horas de antelación.
        </p>
      </div>

      <p style="font-size: 16px; line-height: 26px; color: #374151;">¡Esperamos verte pronto!</p>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <!-- Footer -->
    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; line-height: 18px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899; text-decoration: underline;">Foodzinder</a>.
      </p>
      <p style="font-size: 12px; line-height: 18px; color: #6b7280; margin: 4px 0;">
        Si tienes alguna pregunta, contacta directamente con el restaurante.
      </p>
    </div>
  </div>
</body>
</html>
      `.trim(),
      isActive: true,
    },
  });

  // Template de cancelación de reserva
  await prisma.emailTemplate.upsert({
    where: { type: "BOOKING_CANCELLED" },
    update: {},
    create: {
      type: "BOOKING_CANCELLED",
      name: "Cancelación de Reserva",
      description: "Email enviado al cliente cuando se cancela una reserva",
      subject: "Reserva cancelada en {{restaurantName}}",
      variables: {
        fields: ["customerName", "restaurantName", "date", "time", "partySize", "reason"],
      },
      htmlContent: `
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reserva Cancelada</title>
</head>
<body style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; background-color: #f6f6f6; margin: 0; padding: 20px;">
  <div style="max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; overflow: hidden;">
    <div style="background: linear-gradient(135deg, #64748b 0%, #475569 100%); padding: 40px 30px; text-align: center;">
      <h1 style="color: #ffffff; font-size: 32px; margin: 0;">Reserva Cancelada ✕</h1>
    </div>

    <div style="padding: 30px;">
      <p style="font-size: 18px; font-weight: 600; color: #111827; margin: 0 0 16px;">Hola {{customerName}},</p>
      <p style="font-size: 16px; line-height: 26px; color: #374151; margin: 0 0 16px;">
        Tu reserva en <strong>{{restaurantName}}</strong> ha sido cancelada.
      </p>

      <div style="background: #f9fafb; border: 1px solid #e5e7eb; border-radius: 8px; padding: 24px; margin: 24px 0;">
        <table style="width: 100%; border-collapse: collapse;">
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0; width: 140px;">Restaurante:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;"><strong>{{restaurantName}}</strong></td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Fecha:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{date}}</td>
          </tr>
          <tr style="border-bottom: 1px solid #e5e7eb;">
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Hora:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{time}}</td>
          </tr>
          <tr>
            <td style="font-size: 14px; font-weight: 600; color: #6b7280; padding: 12px 0;">Personas:</td>
            <td style="font-size: 14px; color: #111827; padding: 12px 0;">{{partySize}}</td>
          </tr>
        </table>
      </div>

      <div style="background: #f3f4f6; padding: 16px; border-radius: 6px; margin: 20px 0;">
        <p style="margin: 0; font-size: 14px; color: #374151;">
          ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el restaurante perfecto para ti.
        </p>
      </div>
    </div>

    <hr style="border: none; border-top: 1px solid #e5e7eb; margin: 0;">

    <div style="padding: 20px 30px; text-align: center;">
      <p style="font-size: 12px; color: #6b7280; margin: 4px 0;">
        Este es un correo automático de <a href="https://foodzinder.com" style="color: #ec4899;">Foodzinder</a>.
      </p>
    </div>
  </div>
</body>
</html>
      `.trim(),
      isActive: true,
    },
  });

  console.log("✅ Email templates seeded successfully!");
}

main()
  .catch((e) => {
    console.error("❌ Error seeding email templates:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
