import prisma from "~/server/db/prisma";

export default defineEventHandler(async (event) => {
    const body = await readBody(event);
    const { customScheduleNumber, scheduleTimes } = body;

    // Fetch the corresponding Prisma model operation based on customScheduleNumber
    const modelMap = {
        '1': prisma.customSched1,
        '2': prisma.customSched2,
        '3': prisma.customSched3,
        '4': prisma.customSched4,
        '5': prisma.customSched5,
        '6': prisma.customSched6,
        '7': prisma.customSched7,
        '8': prisma.customSched8,
        '9': prisma.customSched9,
        '10': prisma.customSched10,
    };
    const model = modelMap[customScheduleNumber];
    if (!model) {
        throw new Error(`Unsupported customScheduleNumber: ${customScheduleNumber}`);
    }

    try {
        // Start a transaction to ensure atomicity
        await prisma.$transaction([
            // Clear the existing records from the database table
            model.deleteMany(),
            // Insert new records
            ...scheduleTimes.map((time, index) => {
                return model.create({
                    data: {
                        realtime: new Date(`2000-01-01T${time}:00`),
                        ringnumber: index + 1
                    }
                });
            })
        ]);

        return { success: true, message: 'Custom schedule applied successfully.' };
    } catch (error) {
        // Handle any errors that occur during database operations
        console.error("Error:", error);
        throw new Error("An error occurred while processing the request.");
    }
});
