import {
  Body,
  Container,
  Head,
  Heading,
  Hr,
  Html,
  Link,
  Preview,
  Section,
  Text,
} from "@react-email/components";
import * as React from "react";

interface BookingConfirmationEmailProps {
  customerName: string;
  restaurantName: string;
  restaurantAddress: string;
  date: string;
  time: string;
  partySize: number;
  specialNotes?: string;
  tableNumber?: string;
  tableArea?: string;
}

export function BookingConfirmationEmail({
  customerName = "Juan Pérez",
  restaurantName = "Restaurante La Rosa",
  restaurantAddress = "Calle Mayor 123, Madrid",
  date = "Viernes, 15 de enero de 2026",
  time = "20:00",
  partySize = 4,
  specialNotes,
  tableNumber,
  tableArea,
}: BookingConfirmationEmailProps) {
  return (
    <Html>
      <Head />
      <Preview>Tu reserva en {restaurantName} ha sido confirmada</Preview>
      <Body style={main}>
        <Container style={container}>
          {/* Header */}
          <Section style={header}>
            <Heading style={heading}>Reserva Confirmada ✓</Heading>
            <Text style={subheading}>
              ¡Genial! Tu reserva ha sido confirmada correctamente
            </Text>
          </Section>

          {/* Content */}
          <Section style={content}>
            <Text style={greeting}>Hola {customerName},</Text>
            <Text style={paragraph}>
              Tu reserva en <strong>{restaurantName}</strong> ha sido confirmada.
              Te esperamos el {date} a las {time}.
            </Text>

            {/* Booking Details */}
            <Section style={detailsBox}>
              <Heading as="h2" style={detailsHeading}>
                Detalles de tu Reserva
              </Heading>

              <table style={detailsTable}>
                <tr style={detailRow}>
                  <td style={detailLabel}>Restaurante:</td>
                  <td style={detailValue}>
                    <strong>{restaurantName}</strong>
                    <br />
                    <span style={addressText}>{restaurantAddress}</span>
                  </td>
                </tr>
                <tr style={detailRow}>
                  <td style={detailLabel}>Fecha:</td>
                  <td style={detailValue}>{date}</td>
                </tr>
                <tr style={detailRow}>
                  <td style={detailLabel}>Hora:</td>
                  <td style={detailValue}>{time}</td>
                </tr>
                <tr style={detailRow}>
                  <td style={detailLabel}>Personas:</td>
                  <td style={detailValue}>
                    {partySize} {partySize === 1 ? "persona" : "personas"}
                  </td>
                </tr>
                {tableNumber && (
                  <tr style={detailRow}>
                    <td style={detailLabel}>Mesa:</td>
                    <td style={detailValue}>
                      Mesa {tableNumber}
                      {tableArea && ` - ${tableArea}`}
                    </td>
                  </tr>
                )}
                {specialNotes && (
                  <tr style={detailRow}>
                    <td style={detailLabel}>Notas:</td>
                    <td style={detailValue}>{specialNotes}</td>
                  </tr>
                )}
              </table>
            </Section>

            {/* Important Notice */}
            <Section style={alertBox}>
              <Text style={alertHeading}>📌 Importante</Text>
              <Text style={alertText}>
                Por favor, llega 10 minutos antes de tu hora de reserva. Si necesitas
                cancelar o modificar tu reserva, hazlo con al menos 24 horas de
                antelación.
              </Text>
            </Section>

            <Text style={paragraph}>¡Esperamos verte pronto!</Text>
          </Section>

          <Hr style={hr} />

          {/* Footer */}
          <Section style={footer}>
            <Text style={footerText}>
              Este es un correo automático de{" "}
              <Link href="https://foodzinder.com" style={link}>
                Foodzinder
              </Link>
              .
            </Text>
            <Text style={footerText}>
              Si tienes alguna pregunta, contacta directamente con el restaurante.
            </Text>
          </Section>
        </Container>
      </Body>
    </Html>
  );
}

export default BookingConfirmationEmail;

// Styles
const main = {
  backgroundColor: "#f6f6f6",
  fontFamily:
    '-apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Ubuntu,sans-serif',
};

const container = {
  backgroundColor: "#ffffff",
  margin: "0 auto",
  padding: "0",
  maxWidth: "600px",
};

const header = {
  background: "linear-gradient(135deg, #ec4899 0%, #f43f5e 100%)",
  padding: "40px 30px",
  textAlign: "center" as const,
  borderRadius: "8px 8px 0 0",
};

const heading = {
  color: "#ffffff",
  fontSize: "32px",
  fontWeight: "bold",
  margin: "0 0 10px",
};

const subheading = {
  color: "#ffffff",
  fontSize: "16px",
  margin: "0",
  opacity: "0.9",
};

const content = {
  padding: "30px",
};

const greeting = {
  fontSize: "18px",
  fontWeight: "600",
  color: "#111827",
  margin: "0 0 16px",
};

const paragraph = {
  fontSize: "16px",
  lineHeight: "26px",
  color: "#374151",
  margin: "0 0 16px",
};

const detailsBox = {
  backgroundColor: "#f9fafb",
  border: "1px solid #e5e7eb",
  borderRadius: "8px",
  padding: "24px",
  margin: "24px 0",
};

const detailsHeading = {
  fontSize: "18px",
  fontWeight: "600",
  color: "#111827",
  margin: "0 0 16px",
};

const detailsTable = {
  width: "100%",
  borderCollapse: "collapse" as const,
};

const detailRow = {
  borderBottom: "1px solid #e5e7eb",
};

const detailLabel = {
  fontSize: "14px",
  fontWeight: "600",
  color: "#6b7280",
  padding: "12px 0",
  width: "140px",
  verticalAlign: "top" as const,
};

const detailValue = {
  fontSize: "14px",
  color: "#111827",
  padding: "12px 0",
  verticalAlign: "top" as const,
};

const addressText = {
  fontSize: "13px",
  color: "#6b7280",
};

const alertBox = {
  backgroundColor: "#fef3c7",
  border: "1px solid #fbbf24",
  borderLeft: "4px solid #f59e0b",
  borderRadius: "6px",
  padding: "16px",
  margin: "24px 0",
};

const alertHeading = {
  fontSize: "15px",
  fontWeight: "600",
  color: "#92400e",
  margin: "0 0 8px",
};

const alertText = {
  fontSize: "14px",
  lineHeight: "20px",
  color: "#78350f",
  margin: "0",
};

const hr = {
  borderColor: "#e5e7eb",
  margin: "0",
};

const footer = {
  padding: "20px 30px",
  textAlign: "center" as const,
};

const footerText = {
  fontSize: "12px",
  lineHeight: "18px",
  color: "#6b7280",
  margin: "4px 0",
};

const link = {
  color: "#ec4899",
  textDecoration: "underline",
};
