import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
export const prismaClient = new PrismaClient().$extends({
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
