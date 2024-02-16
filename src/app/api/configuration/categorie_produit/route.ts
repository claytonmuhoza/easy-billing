import { NextApiRequest, NextApiResponse } from "next";
//get all categorie of product
export async function GET() {
  const categories = await prisma.categorie.findMany({
    where: { activer: true },
  });
  return Response.json(categories);
}
//create a new product
export async function POST() {
  return Response.json("en developpement");
}
