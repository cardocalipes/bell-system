/*
  Warnings:

  - You are about to drop the column `ringnumber` on the `schedule1` table. All the data in the column will be lost.
  - You are about to drop the column `ringnumber` on the `schedule2` table. All the data in the column will be lost.
  - You are about to drop the column `ringnumber` on the `schedule3` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE `schedule1` DROP COLUMN `ringnumber`;

-- AlterTable
ALTER TABLE `schedule2` DROP COLUMN `ringnumber`;

-- AlterTable
ALTER TABLE `schedule3` DROP COLUMN `ringnumber`;
