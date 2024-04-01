import prisma from "~/server/db/prisma"

export default defineEventHandler(async () => {
    return await prisma.customSched7.findMany();
});