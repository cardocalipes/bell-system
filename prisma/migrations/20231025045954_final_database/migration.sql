/*
  Warnings:

  - The primary key for the `schedule1` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `schedule1` table. All the data in the column will be lost.
  - You are about to drop the `schedule` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id1` to the `schedule1` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `schedule1` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `id1` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id1`);

-- DropTable
DROP TABLE `schedule`;

-- CreateTable
CREATE TABLE `Saved_schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Sched_num` VARCHAR(191) NOT NULL,
    `sched_name` VARCHAR(191) NOT NULL,
    `start` DATETIME(3) NOT NULL,
    `duration` INTEGER NOT NULL,
    `increment` INTEGER NOT NULL,
    `BreakTime` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `History` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ringNumber` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `time` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
