/*
  Warnings:

  - You are about to drop the column `ringNumber` on the `history` table. All the data in the column will be lost.
  - You are about to alter the column `time` on the `history` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Time(0)`.
  - The primary key for the `schedule1` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id1` on the `schedule1` table. All the data in the column will be lost.
  - You are about to drop the column `real_time` on the `schedule1` table. All the data in the column will be lost.
  - You are about to drop the column `ring_number` on the `schedule1` table. All the data in the column will be lost.
  - The primary key for the `schedule2` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id2` on the `schedule2` table. All the data in the column will be lost.
  - You are about to drop the column `real_time` on the `schedule2` table. All the data in the column will be lost.
  - You are about to drop the column `ring_number` on the `schedule2` table. All the data in the column will be lost.
  - The primary key for the `schedule3` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id3` on the `schedule3` table. All the data in the column will be lost.
  - You are about to drop the column `real_time` on the `schedule3` table. All the data in the column will be lost.
  - You are about to drop the column `ring_number` on the `schedule3` table. All the data in the column will be lost.
  - You are about to drop the `saved_schedule` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `user_data` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id` to the `schedule1` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `schedule2` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `schedule3` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `history` DROP COLUMN `ringNumber`,
    ADD COLUMN `ringnum` INTEGER NULL,
    MODIFY `id` INTEGER NOT NULL,
    MODIFY `date` TIME(0) NULL,
    MODIFY `time` TIME(0) NULL,
    MODIFY `type` VARCHAR(255) NULL;

-- AlterTable
ALTER TABLE `schedule1` DROP PRIMARY KEY,
    DROP COLUMN `id1`,
    DROP COLUMN `real_time`,
    DROP COLUMN `ring_number`,
    ADD COLUMN `id` INTEGER NOT NULL,
    ADD COLUMN `realtime` TIME(0) NULL,
    ADD COLUMN `ringnumber` INTEGER NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `schedule2` DROP PRIMARY KEY,
    DROP COLUMN `id2`,
    DROP COLUMN `real_time`,
    DROP COLUMN `ring_number`,
    ADD COLUMN `id` INTEGER NOT NULL,
    ADD COLUMN `realtime` TIME(0) NULL,
    ADD COLUMN `ringnumber` INTEGER NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `schedule3` DROP PRIMARY KEY,
    DROP COLUMN `id3`,
    DROP COLUMN `real_time`,
    DROP COLUMN `ring_number`,
    ADD COLUMN `id` INTEGER NOT NULL,
    ADD COLUMN `realtime` TIME(0) NULL,
    ADD COLUMN `ringnumber` INTEGER NULL,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `saved_schedule`;

-- DropTable
DROP TABLE `user_data`;

-- CreateTable
CREATE TABLE `savedsched` (
    `id` INTEGER NOT NULL,
    `schednum` INTEGER NULL,
    `schedname` VARCHAR(255) NULL,
    `starttime` TIME(0) NULL,
    `duration` INTEGER NULL,
    `increment` INTEGER NULL,
    `breaktime` BOOLEAN NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
