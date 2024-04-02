import prisma from "~/server/db/prisma"

export default defineEventHandler(async (event) => {
    try {
        const historyData = await prisma.history.findMany();
        return historyData;
    } catch (error) {
        console.error('Failed to fetch history:', error);
        // Respond with a meaningful error message
        event.res.statusCode = 500;
        return { error: "Failed to fetch history data." };
    }
});
