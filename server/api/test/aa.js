import prisma from "~/server/db/prisma"

export default defineEventHandler(async () => {
    return await prisma.schedule1.findFirst({
        where: {
            id: 9,
        }
    });
});
