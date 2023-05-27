-- CreateTable
CREATE TABLE `mods` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(127) NOT NULL,
    `description` TEXT NULL,
    `image` VARCHAR(255) NULL,
    `author` VARCHAR(127) NOT NULL,
    `nexusmods_id` INTEGER NOT NULL,
    `tags` LONGTEXT NULL,
    `depends_on` LONGTEXT NULL,
    `uuid` VARCHAR(127) NOT NULL DEFAULT (uuid()),

    UNIQUE INDEX `uuid`(`uuid`),
    INDEX `depends_on`(`depends_on`(768)),
    INDEX `nexusmods_id`(`nexusmods_id`),
    INDEX `tags`(`tags`(768)),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tags` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `text` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL,
    `uuid` VARCHAR(127) NOT NULL DEFAULT (uuid()),

    INDEX `id`(`id`),
    INDEX `uuid`(`uuid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

