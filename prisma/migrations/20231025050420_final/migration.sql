/*
  Warnings:

  - Made the column `ring_number` on table `schedule1` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE `schedule1` MODIFY `ring_number` INTEGER NOT NULL;
