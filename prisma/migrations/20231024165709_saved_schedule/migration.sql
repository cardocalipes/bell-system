/*
  Warnings:

  - You are about to drop the `schedule` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `schedule`;

-- CreateTable
CREATE TABLE `Saved_Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Sched_num` VARCHAR(191) NOT NULL,
    `sched_name` VARCHAR(191) NOT NULL,
    `start` DATETIME(3) NOT NULL,
    `duration` INTEGER NOT NULL,
    `increment` INTEGER NOT NULL,
    `BreakTime` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
