import prisma from "~/server/db/prisma"

export default defineEventHandler(async (event) => {
    const body = await readBody(event);
    console.log(body);

    const smthn = await prisma.user_data.findMany({
    });
    console.log(smthn);
    
    if (body.username == "Hello" && body.accessCode == "World"){
        return "OK";
    } else{
        return "NO";
    }
});