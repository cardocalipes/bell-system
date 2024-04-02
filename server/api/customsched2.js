import prisma from "~/server/db/prisma"

export default defineEventHandler(async () => {
    return await prisma.customsched2.findMany();
});