-- CreateTable
CREATE TABLE `user_data` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Username` VARCHAR(255) NOT NULL,
    `Access_Code` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `schedule1` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `ring_number` INTEGER NULL,
    `timer` TIME(0) NULL,
    `real_time` TIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `schedule2` (
    `id2` INTEGER NOT NULL AUTO_INCREMENT,
    `ring_number` INTEGER NULL,
    `timer` TIME(0) NULL,
    `real_time` TIME(0) NULL,

    PRIMARY KEY (`id2`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `schedule3` (
    `id3` INTEGER NOT NULL AUTO_INCREMENT,
    `ring_number` INTEGER NULL,
    `timer` TIME(0) NULL,
    `real_time` TIME(0) NULL,

    PRIMARY KEY (`id3`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Schedule` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Sched_num` VARCHAR(191) NOT NULL,
    `sched_name` VARCHAR(191) NOT NULL,
    `start` DATETIME(3) NOT NULL,
    `duration` INTEGER NOT NULL,
    `increment` INTEGER NOT NULL,
    `BreakTime` BOOLEAN NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
