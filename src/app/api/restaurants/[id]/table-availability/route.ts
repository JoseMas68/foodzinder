import { NextRequest, NextResponse } from "next/server";
import { getTableAvailability } from "@/lib/actions/booking-service";

export async function GET(
  request: NextRequest,
  { params }: { params: Promise<{ id: string }> }
) {
  try {
    const { id: restaurantId } = await params;
    const searchParams = request.nextUrl.searchParams;
    const serviceId = searchParams.get("serviceId");
    const dateStr = searchParams.get("date");

    if (!serviceId || !dateStr) {
      return NextResponse.json(
        { error: "Missing serviceId or date parameter" },
        { status: 400 }
      );
    }

    const date = new Date(dateStr);
    const result = await getTableAvailability(restaurantId, serviceId, date);

    if (result.success) {
      return NextResponse.json({ tables: result.data });
    } else {
      return NextResponse.json({ error: result.error }, { status: 500 });
    }
  } catch (error) {
    console.error("Error in table-availability API:", error);
    return NextResponse.json({ error: "Internal server error" }, { status: 500 });
  }
}
