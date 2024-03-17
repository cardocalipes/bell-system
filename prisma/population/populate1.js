import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient();

async function main() {
    const newTime = await prisma.schedule1.createMany({
        data: [
            {
                ringnumber: 1,
                realtime: new Date("2000-01-01 07:20:00"),
            },
            {
                ringnumber: 2,
                realtime: new Date("2000-01-01 07:25:00"),
            },
            {
                ringnumber: 3,
                realtime: new Date("2000-01-01 07:30:00"),
            },
            {
                ringnumber: 4,
                realtime: new Date("2000-01-01 8:15:00"),
            },
            {
                ringnumber: 5,
                realtime: new Date("2000-01-01 08:20:00"),
            },
            {
                ringnumber: 6,
                realtime: new Date("2000-01-01 09:05:00"),
            },
            {
                ringnumber: 7,
                realtime: new Date("2000-01-01 09:10:00"),
            },
            {
                ringnumber: 8,
                realtime: new Date("2000-01-01 09:25:00"),
            },
            {
                ringnumber: 9,
                realtime: new Date("2000-01-01 09:30:00"),
            },
            {
                ringnumber: 10,
                realtime: new Date("2000-01-01 10:15:00"),
            },
            {
                ringnumber: 11,
                realtime: new Date("2000-01-01 10:20:00"),
            },
            {
                ringnumber: 12,
                realtime: new Date("2000-01-01 11:05:00"),
            },
            {
                ringnumber: 13,
                realtime: new Date("2000-01-01 11:10:00"),
            },
            {
                ringnumber: 14,
                realtime: new Date("2000-01-01 11:55:00"),
            },
            {
                ringnumber: 15,
                realtime: new Date("2000-01-01 12:00:00"),
            },
            {
                ringnumber: 16,
                realtime: new Date("2000-01-01 12:45:00"),
            },
            {
                ringnumber: 17,
                realtime: new Date("2000-01-01 12:50:00"),
            },
            {
                ringnumber: 18,
                realtime: new Date("2000-01-01 13:35:00"),
            },
            {
                ringnumber: 19,
                realtime: new Date("2000-01-01 13:40:00"),
            },
            {
                ringnumber: 20,
                realtime: new Date("2000-01-01 14:25:00"),
            },
            {
                ringnumber: 21,
                realtime: new Date("2000-01-01 14:30:00"),
            },
            {
                ringnumber: 22,
                realtime: new Date("2000-01-01 14:45:00"),
            },
            {
                ringnumber: 23,
                realtime: new Date("2000-01-01 14:50:00"),
            },
            {
                ringnumber: 24,
                realtime: new Date("2000-01-01 15:35:00"),
            },
            {
                ringnumber: 25,
                realtime: new Date("2000-01-01 15:40:00"),
            },
            {
                ringnumber: 26,
                realtime: new Date("2000-01-01 16:25:00"),
            },
            {
                ringnumber: 27,
                realtime: new Date("2000-01-01 16:30:00"),
            },



        ]
    })

    console.log(newTime);
}

main()