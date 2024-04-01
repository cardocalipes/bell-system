-- CreateTable
CREATE TABLE `schedule1` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `schedule2` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `schedule3` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `history` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` TIME(0) NULL,
    `time` TIME(0) NULL,
    `type` VARCHAR(255) NULL,
    `ringnum` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched1` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched2` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched3` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched4` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched5` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched6` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched7` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched8` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched9` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customSched10` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `realtime` TIME(0) NULL,
    `ringnumber` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
