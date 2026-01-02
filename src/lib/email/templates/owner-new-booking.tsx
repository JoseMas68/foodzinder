import * as React from "react";

interface OwnerNewBookingEmailProps {
  ownerName: string;
  restaurantName: string;
  customerName: string;
  customerEmail: string;
  customerPhone: string;
  date: string;
  time: string;
  partySize: number;
  specialNotes?: string;
  bookingId: string;
}

export function OwnerNewBookingEmail({
  ownerName,
  restaurantName,
  customerName,
  customerEmail,
  customerPhone,
  date,
  time,
  partySize,
  specialNotes,
  bookingId,
}: OwnerNewBookingEmailProps) {
  const dashboardUrl = `${process.env.NEXT_PUBLIC_APP_URL || "http://localhost:3000"}/dashboard/restaurant-bookings`;

  return (
    <html>
      <head>
        <style>{`
          body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
          }
          .header {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            color: white;
            padding: 30px;
            border-radius: 8px 8px 0 0;
            text-align: center;
          }
          .header h1 {
            margin: 0;
            font-size: 28px;
          }
          .content {
            background: #fff;
            padding: 30px;
            border: 1px solid #e5e7eb;
            border-top: none;
            border-radius: 0 0 8px 8px;
          }
          .detail-row {
            display: flex;
            padding: 12px 0;
            border-bottom: 1px solid #f3f4f6;
          }
          .detail-label {
            font-weight: 600;
            width: 140px;
            color: #6b7280;
          }
          .detail-value {
            flex: 1;
            color: #111827;
          }
          .alert {
            background: #dbeafe;
            padding: 16px;
            border-radius: 6px;
            margin: 20px 0;
            border-left: 4px solid #3b82f6;
          }
          .button {
            display: inline-block;
            background: #3b82f6;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            margin: 20px 0;
            text-align: center;
          }
          .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 14px;
          }
        `}</style>
      </head>
      <body>
        <div className="header">
          <h1>📅 Nueva Reserva</h1>
        </div>
        <div className="content">
          <p>Hola {ownerName},</p>
          <p>
            Has recibido una nueva reserva en <strong>{restaurantName}</strong>.
          </p>

          <div style={{ margin: "30px 0" }}>
            <h3 style={{ color: "#111827", marginBottom: "16px" }}>
              Detalles de la Reserva
            </h3>
            <div className="detail-row">
              <div className="detail-label">Fecha:</div>
              <div className="detail-value">{date}</div>
            </div>
            <div className="detail-row">
              <div className="detail-label">Hora:</div>
              <div className="detail-value">{time}</div>
            </div>
            <div className="detail-row">
              <div className="detail-label">Personas:</div>
              <div className="detail-value">
                {partySize} {partySize === 1 ? "persona" : "personas"}
              </div>
            </div>
          </div>

          <div style={{ margin: "30px 0" }}>
            <h3 style={{ color: "#111827", marginBottom: "16px" }}>
              Datos del Cliente
            </h3>
            <div className="detail-row">
              <div className="detail-label">Nombre:</div>
              <div className="detail-value">{customerName}</div>
            </div>
            <div className="detail-row">
              <div className="detail-label">Email:</div>
              <div className="detail-value">{customerEmail}</div>
            </div>
            <div className="detail-row">
              <div className="detail-label">Teléfono:</div>
              <div className="detail-value">{customerPhone}</div>
            </div>
            {specialNotes && (
              <div className="detail-row">
                <div className="detail-label">Notas:</div>
                <div className="detail-value">
                  <strong>{specialNotes}</strong>
                </div>
              </div>
            )}
          </div>

          <div className="alert">
            <strong>⚡ Acción requerida:</strong> Confirma esta reserva y asigna
            una mesa desde tu panel de control.
          </div>

          <div style={{ textAlign: "center" }}>
            <a href={dashboardUrl} className="button">
              Ver en Dashboard
            </a>
          </div>
        </div>
        <div className="footer">
          <p>
            Este es un correo automático de Foodzinder.
            <br />
            ID de Reserva: {bookingId}
          </p>
        </div>
      </body>
    </html>
  );
}
