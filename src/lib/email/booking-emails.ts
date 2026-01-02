import { resend, FROM_EMAIL } from "./resend";
import { BookingConfirmationEmail } from "./templates/booking-confirmation";
import { BookingCancelledEmail } from "./templates/booking-cancelled";
import { OwnerNewBookingEmail } from "./templates/owner-new-booking";
import { render } from "@react-email/render";

interface SendBookingConfirmationParams {
  to: string;
  customerName: string;
  restaurantName: string;
  restaurantAddress: string;
  date: Date;
  time: string;
  partySize: number;
  specialNotes?: string | null;
  tableNumber?: string;
  tableArea?: string | null;
}

export async function sendBookingConfirmationEmail(params: SendBookingConfirmationParams) {
  try {
    const formattedDate = params.date.toLocaleDateString("es-ES", {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    });

    const emailHtml = render(
      BookingConfirmationEmail({
        customerName: params.customerName,
        restaurantName: params.restaurantName,
        restaurantAddress: params.restaurantAddress,
        date: formattedDate,
        time: params.time,
        partySize: params.partySize,
        specialNotes: params.specialNotes || undefined,
        tableNumber: params.tableNumber,
        tableArea: params.tableArea || undefined,
      })
    );

    const { data, error } = await resend.emails.send({
      from: FROM_EMAIL,
      to: params.to,
      subject: `Reserva confirmada en ${params.restaurantName}`,
      html: emailHtml,
    });

    if (error) {
      console.error("Error sending confirmation email:", error);
      return { success: false, error: error.message };
    }

    return { success: true, data };
  } catch (error: any) {
    console.error("Error sending confirmation email:", error);
    return { success: false, error: error.message };
  }
}

interface SendBookingCancelledParams {
  to: string;
  customerName: string;
  restaurantName: string;
  date: Date;
  time: string;
  partySize: number;
  reason?: string;
}

export async function sendBookingCancelledEmail(params: SendBookingCancelledParams) {
  try {
    const formattedDate = params.date.toLocaleDateString("es-ES", {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    });

    const emailHtml = render(
      BookingCancelledEmail({
        customerName: params.customerName,
        restaurantName: params.restaurantName,
        date: formattedDate,
        time: params.time,
        partySize: params.partySize,
        reason: params.reason,
      })
    );

    const { data, error } = await resend.emails.send({
      from: FROM_EMAIL,
      to: params.to,
      subject: `Reserva cancelada en ${params.restaurantName}`,
      html: emailHtml,
    });

    if (error) {
      console.error("Error sending cancellation email:", error);
      return { success: false, error: error.message };
    }

    return { success: true, data };
  } catch (error: any) {
    console.error("Error sending cancellation email:", error);
    return { success: false, error: error.message };
  }
}

interface SendOwnerNewBookingParams {
  to: string;
  ownerName: string;
  restaurantName: string;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
  date: Date;
  time: string;
  partySize: number;
  specialNotes?: string | null;
  bookingId: string;
}

export async function sendOwnerNewBookingEmail(params: SendOwnerNewBookingParams) {
  try {
    const formattedDate = params.date.toLocaleDateString("es-ES", {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric",
    });

    const emailHtml = render(
      OwnerNewBookingEmail({
        ownerName: params.ownerName,
        restaurantName: params.restaurantName,
        customerName: params.customerName,
        customerEmail: params.customerEmail,
        customerPhone: params.customerPhone,
        date: formattedDate,
        time: params.time,
        partySize: params.partySize,
        specialNotes: params.specialNotes || undefined,
        bookingId: params.bookingId,
      })
    );

    const { data, error } = await resend.emails.send({
      from: FROM_EMAIL,
      to: params.to,
      subject: `Nueva reserva en ${params.restaurantName}`,
      html: emailHtml,
    });

    if (error) {
      console.error("Error sending owner notification email:", error);
      return { success: false, error: error.message };
    }

    return { success: true, data };
  } catch (error: any) {
    console.error("Error sending owner notification email:", error);
    return { success: false, error: error.message };
  }
}
