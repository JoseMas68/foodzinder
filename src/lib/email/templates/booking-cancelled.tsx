import * as React from "react";

interface BookingCancelledEmailProps {
  customerName: string;
  restaurantName: string;
  date: string;
  time: string;
  partySize: number;
  reason?: string;
}

export function BookingCancelledEmail({
  customerName,
  restaurantName,
  date,
  time,
  partySize,
  reason,
}: BookingCancelledEmailProps) {
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
            background: linear-gradient(135deg, #64748b 0%, #475569 100%);
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
          .info-box {
            background: #f3f4f6;
            padding: 16px;
            border-radius: 6px;
            margin: 20px 0;
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
          <h1>✕ Reserva Cancelada</h1>
        </div>
        <div className="content">
          <p>Hola {customerName},</p>
          <p>
            Tu reserva en <strong>{restaurantName}</strong> ha sido cancelada.
          </p>

          <div style={{ margin: "30px 0" }}>
            <div className="detail-row">
              <div className="detail-label">Restaurante:</div>
              <div className="detail-value">
                <strong>{restaurantName}</strong>
              </div>
            </div>
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
            {reason && (
              <div className="detail-row">
                <div className="detail-label">Motivo:</div>
                <div className="detail-value">{reason}</div>
              </div>
            )}
          </div>

          <div className="info-box">
            <p>
              Si no realizaste esta cancelación, por favor contacta con el
              restaurante lo antes posible.
            </p>
            <p style={{ margin: "10px 0 0 0" }}>
              ¿Quieres hacer otra reserva? Visita Foodzinder y encuentra el
              restaurante perfecto para ti.
            </p>
          </div>
        </div>
        <div className="footer">
          <p>
            Este es un correo automático de Foodzinder.
            <br />
            Si tienes alguna pregunta, contacta directamente con el restaurante.
          </p>
        </div>
      </body>
    </html>
  );
}
