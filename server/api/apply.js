import prisma from "~/server/db/prisma";

export default defineEventHandler(async (event) => {
    const body = await readBody(event);
    const { customScheduleNumber, scheduleTimes } = body;

    // Fetch the corresponding Prisma model operation based on customScheduleNumber
    const modelMap = {
        '1': prisma.customsched1,
        '2': prisma.customsched2,
        '3': prisma.customsched3,
        '4': prisma.customsched4,
        '5': prisma.customsched5,
        '6': prisma.customsched6,
        '7': prisma.customsched7,
        '8': prisma.customsched8,
        '9': prisma.customsched9,
        '10': prisma.customsched10,
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
