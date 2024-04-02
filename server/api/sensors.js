import prisma from "~/server/db/prisma"

export default defineEventHandler(async (event) => {
    const body = await readBody(event);


    const newHistory = await prisma.history.create({
        data: {
            dateAndTime: body.currentTime,
            type: body.type,
        },
    });

    return newHistory;
});
