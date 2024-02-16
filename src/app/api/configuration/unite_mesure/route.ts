import { NextResponse, NextRequest } from "next/server";
//getAllUnite_mesure
export async function GET() {
  const unites = await prisma.uniteMesure.findMany();
  return Response.json(unites);
}
//create a unite_mesure
export async function POST(req: NextRequest) {
  const data = await req.json();
  return NextResponse.json({ data });
}
