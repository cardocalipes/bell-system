import prisma from "~/server/db/prisma"

export default defineEventHandler(async (event) => {
    try {
        // Parse the request body
        const body = await readBody(event);
        
        // Ensure that required fields are present in the request body
        if (!body.currentTime || !body.type) {
            throw new Error("Incomplete request data.");
        }

        // Convert currentTime string to a JavaScript Date object
        const dateAndTime = new Date(body.currentTime);

        // Create a new history record in the database
        const newHistory = await prisma.history.create({
            data: {
                dateAndTime: dateAndTime,
                type: body.type,
            },
        });

        // Return the newly created history record
        return newHistory;
    } catch (error) {
        // Handle any errors that occur during the process
        console.error("Error creating history record:", error);
        throw error; // Rethrow the error to propagate it
    }
});
