/*
  Warnings:

  - You are about to drop the column `adressesId` on the `items` table. All the data in the column will be lost.
  - You are about to drop the column `adressesId` on the `stocks` table. All the data in the column will be lost.
  - Added the required column `addressId` to the `items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `addressId` to the `stocks` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `items` DROP FOREIGN KEY `items_adressesId_fkey`;

-- DropForeignKey
ALTER TABLE `stocks` DROP FOREIGN KEY `stocks_adressesId_fkey`;

-- AlterTable
ALTER TABLE `items` DROP COLUMN `adressesId`,
    ADD COLUMN `addressId` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `stocks` DROP COLUMN `adressesId`,
    ADD COLUMN `addressId` INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE `stocks` ADD CONSTRAINT `stocks_addressId_fkey` FOREIGN KEY (`addressId`) REFERENCES `adresses`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `items` ADD CONSTRAINT `items_addressId_fkey` FOREIGN KEY (`addressId`) REFERENCES `adresses`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
