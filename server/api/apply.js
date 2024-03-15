import prisma from "~/server/db/prisma"

export default defineEventHandler(async (event) => {
    const body = await readBody(event);
    
    console.log(body);

    
    const newStartTime = `2000-01-01 ${body.startTime}:00`;

    const newSchedule = await prisma.savedsched.create({
        data: {
            schedname: body.schedname,
            starttime: new Date(newStartTime),
            duration: body.duration,
        }
    });

    return newSchedule;
});
