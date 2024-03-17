/*
  Warnings:

  - You are about to drop the column `timer` on the `schedule1` table. All the data in the column will be lost.
  - You are about to drop the column `timer` on the `schedule2` table. All the data in the column will be lost.
  - You are about to drop the column `timer` on the `schedule3` table. All the data in the column will be lost.
  - Added the required column `ringnumber` to the `schedule1` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ringnumber` to the `schedule2` table without a default value. This is not possible if the table is not empty.
  - Added the required column `ringnumber` to the `schedule3` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `schedule1` DROP COLUMN `timer`,
    ADD COLUMN `ringnumber` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `schedule2` DROP COLUMN `timer`,
    ADD COLUMN `ringnumber` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `schedule3` DROP COLUMN `timer`,
    ADD COLUMN `ringnumber` INTEGER NOT NULL;
