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
  customerName,
  restaurantName,
  restaurantAddress,
  date,
  time,
  partySize,
  specialNotes,
  tableNumber,
  tableArea,
}: BookingConfirmationEmailProps) {
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
            background: linear-gradient(135deg, #ec4899 0%, #f43f5e 100%);
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
          .highlight {
            background: #fef3c7;
            padding: 16px;
            border-radius: 6px;
            margin: 20px 0;
            border-left: 4px solid #f59e0b;
          }
          .footer {
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #e5e7eb;
            color: #6b7280;
            font-size: 14px;
          }
          .button {
            display: inline-block;
            background: #ec4899;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            text-decoration: none;
            margin: 20px 0;
          }
        `}</style>
      </head>
      <body>
        <div className="header">
          <h1>✓ Reserva Confirmada</h1>
        </div>
        <div className="content">
          <p>Hola {customerName},</p>
          <p>
            Tu reserva en <strong>{restaurantName}</strong> ha sido confirmada
            correctamente.
          </p>

          <div style={{ margin: "30px 0" }}>
            <div className="detail-row">
              <div className="detail-label">Restaurante:</div>
              <div className="detail-value">
                <strong>{restaurantName}</strong>
                <br />
                {restaurantAddress}
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
            {tableNumber && (
              <div className="detail-row">
                <div className="detail-label">Mesa:</div>
                <div className="detail-value">
                  Mesa {tableNumber}
                  {tableArea && ` - ${tableArea}`}
                </div>
              </div>
            )}
            {specialNotes && (
              <div className="detail-row">
                <div className="detail-label">Notas:</div>
                <div className="detail-value">{specialNotes}</div>
              </div>
            )}
          </div>

          <div className="highlight">
            <strong>📌 Importante:</strong> Por favor, llega 10 minutos antes de
            tu hora de reserva. Si necesitas cancelar o modificar tu reserva,
            hazlo con al menos 24 horas de antelación.
          </div>

          <p>¡Esperamos verte pronto!</p>
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
