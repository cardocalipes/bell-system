import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient();

async function main() {
    const newTime = await prisma.schedule2.createMany({
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
                realtime: new Date("2000-01-01 09:55:00"),
            },
            {
                ringnumber: 9,
                realtime: new Date("2000-01-01 10:00:00"),
            },
            {
                ringnumber: 10,
                realtime: new Date("2000-01-01 10:45:00"),
            },
            {
                ringnumber: 11,
                realtime: new Date("2000-01-01 10:50:00"),
            },
            {
                ringnumber: 12,
                realtime: new Date("2000-01-01 11:35:00"),
            },
            {
                ringnumber: 13,
                realtime: new Date("2000-01-01 11:40:00"),
            },
            {
                ringnumber: 14,
                realtime: new Date("2000-01-01 12:25:00"),
            },
            {
                ringnumber: 15,
                realtime: new Date("2000-01-01 12:30:00"),
            },
            {
                ringnumber: 16,
                realtime: new Date("2000-01-01 13:15:00"),
            },
            {
                ringnumber: 17,
                realtime: new Date("2000-01-01 13:20:00"),
            },
            {
                ringnumber: 18,
                realtime: new Date("2000-01-01 14:05:00"),
            },
            {
                ringnumber: 19,
                realtime: new Date("2000-01-01 14:10:00"),
            },
            {
                ringnumber: 20,
                realtime: new Date("2000-01-01 14:55:00"),
            },
            {
                ringnumber: 21,
                realtime: new Date("2000-01-01 15:00:00"),
            },
            {
                ringnumber: 22,
                realtime: new Date("2000-01-01 15:45:00"),
            },
            {
                ringnumber: 23,
                realtime: new Date("2000-01-01 15:50:00"),
            },
        ]
    })

    console.log(newTime);
}

main()