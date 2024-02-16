import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";

const prismaClientSingleton = () => {
  return new PrismaClient().$extends({
    query: {
      utilisateur: {
        async create({ args, query }) {
          const user = await query(args);
          user.password = bcrypt.hashSync(user.password + "", 10);
          return user;
        },
        async update({ args, query }) {
          const user = await query(args);
          user.password = bcrypt.hashSync(user.password + "", 10);
          return user;
        },
      },
    },
  });
};

declare global {
  var prisma: ReturnType<typeof prismaClientSingleton>;
}

const prisma = globalThis.prisma ?? prismaClientSingleton();

export default prisma;

if (process.env.NODE_ENV !== "production") globalThis.prisma = prisma;
