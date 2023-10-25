/*
  Warnings:

  - The primary key for the `schedule1` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id` on the `schedule1` table. All the data in the column will be lost.
  - Added the required column `id1` to the `schedule1` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `schedule1` DROP PRIMARY KEY,
    DROP COLUMN `id`,
    ADD COLUMN `id1` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id1`);

-- CreateTable
CREATE TABLE `History` (
    `ring_number` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL,
    `time` DATETIME(3) NOT NULL,
    `type` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `History_ring_number_key`(`ring_number`),
    PRIMARY KEY (`ring_number`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
