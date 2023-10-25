/*
  Warnings:

  - Made the column `ring_number` on table `schedule2` required. This step will fail if there are existing NULL values in that column.
  - Made the column `ring_number` on table `schedule3` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `schedule2` MODIFY `ring_number` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `schedule3` MODIFY `ring_number` INTEGER NOT NULL;
