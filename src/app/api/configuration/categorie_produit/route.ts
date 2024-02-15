import { prismaClient } from "@/utils/prismaclient";
import { NextResponse } from "next/server";
//get all categorie of product
export async function GET() {
  const categories = await prismaClient.categorie.findMany({
    where: { activer: true },
  });
  return NextResponse.json(categories);
}
//create a new product
export async function POST(request: Request) {
  //const reques = await request.json();
  return NextResponse.json("creer avec succes");
}
