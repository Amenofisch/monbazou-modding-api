-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Erstellungszeit: 02. Mrz 2024 um 13:50
-- Server-Version: 11.1.2-MariaDB-1:11.1.2+maria~ubu2204
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `modswebsite`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mods`
--

CREATE TABLE `mods` (
  `id` int(11) NOT NULL,
  `name` varchar(127) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author` varchar(127) NOT NULL,
  `nexusmods_id` int(11) NOT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `depends_on` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`depends_on`)),
  `uuid` varchar(127) NOT NULL DEFAULT uuid() COMMENT 'needed because of react'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `mods`
--

INSERT INTO `mods` (`id`, `name`, `description`, `image`, `author`, `nexusmods_id`, `tags`, `depends_on`, `uuid`) VALUES
(1, 'AutoSave', 'A basic QOL mod that automatically saves your game in a specifc interval. You can change the interval in the mod configs.', '', 'Amenofisch', 97, '[1,2]', NULL, '8c41e8fe-c31a-11ed-8ccd-0242ac140002'),
(2, 'Backpack', 'This is a simple QOL mod that adds a backpack to the game', '', 'TheBoiiii', 19, '[1]', NULL, '8c41e995-c31a-11ed-8ccd-0242ac140002'),
(3, 'BetterFPS', 'A basic FPS mod that improves performance.', '', 'Amenofisch', 125, '[2]', NULL, '8c41e9bb-c31a-11ed-8ccd-0242ac140002'),
(4, 'BrightLife', 'A basic cheat menu', '', 'TheBoiiii', 13, '[3]', NULL, '8c41e9dd-c31a-11ed-8ccd-0242ac140002'),
(5, 'Configurable Syrup Tank', 'This QOL mod allows you to configure the size of the syrup tank on the back of your OlTruck.', '', 'AToxicNinja', 155, '[2,3]', NULL, '8c41e9fd-c31a-11ed-8ccd-0242ac140002'),
(6, 'Configurable Water Can', 'This mod allows you to change the size of your watering can.', '', 'AToxicNinja', 149, '[2,3]', NULL, '8c41ea1d-c31a-11ed-8ccd-0242ac140002'),
(7, 'CustomMaps', 'A basic mod that allows you to add custom maps to the game.', '', 'Amenofisch', 115, '[2]', NULL, '8c41ea39-c31a-11ed-8ccd-0242ac140002'),
(8, 'CustomParts', 'A basic mod that adds a few parts to the game.', '', 'Amenofisch', 75, '[1]', NULL, '8c41ea54-c31a-11ed-8ccd-0242ac140002'),
(9, 'DecoCars Mini', 'This is a basic mod that adds small cars as decoration to the game.', '', 'Applelife4123', 34, '[2]', NULL, '8c41ea70-c31a-11ed-8ccd-0242ac140002'),
(10, 'Fusion Modding API', 'This is a modding api for the game Monbazou. It allows you to easily create mods for the game. It is also one of the most required mods for the game.', '', 'Im An Orange / BossDarkReaper', 49, '[4]', NULL, '8c41ea8e-c31a-11ed-8ccd-0242ac140002'),
(11, 'Grab Anything', 'A basic mod that allows you to literally grab anything.', '', 'Amenofisch', 30, '[3]', NULL, '8c41eab1-c31a-11ed-8ccd-0242ac140002'),
(12, 'Gros Martin', 'This adds a new phone number to your phone, if you call it you can buy some wood.', '', 'Ticass', 170, '[1,2]', NULL, '8c41eacd-c31a-11ed-8ccd-0242ac140002'),
(13, 'Infinite Generator Fuel', 'A basic mod that allows you to use the generator indefinitely.', '', 'MakerMacher', 136, '[3]', NULL, '8c41eaea-c31a-11ed-8ccd-0242ac140002'),
(14, 'Infinite Wood Selling and custom wood value', 'A simple mod that allows you to sell wood infinitely and also allows you to set the value of wood to whatever you want.', '', 'MakerMacher', 134, '[3]', NULL, '8c41eb05-c31a-11ed-8ccd-0242ac140002'),
(15, 'Maxwell the Cat', 'This mod adds a cat to the game that can meow...', '', 'AToxicNinja', 159, '[5]', '[49]', '8c41eb23-c31a-11ed-8ccd-0242ac140002'),
(16, 'Motionless', 'A basic cheat menu', '', 'LeftToSuffer', 5, '[3]', NULL, '8c41eb42-c31a-11ed-8ccd-0242ac140002'),
(17, 'PhoneSave', 'A basic QOL mod that save the game for you when you use your phone.', '', 'Marjo6', 24, '[2]', NULL, '8c41eb5f-c31a-11ed-8ccd-0242ac140002'),
(18, 'Save while Sleeping', 'A basic QOL mod that saves the game for you when you sleep.', '', 'cirkus', 20, '[2]', NULL, '8c41eb79-c31a-11ed-8ccd-0242ac140002'),
(19, 'Speedometer', 'A mod that adds a speedometer to the HUD.', '', 'LeftToSuffer', 87, '[2]', NULL, '8c41eb93-c31a-11ed-8ccd-0242ac140002'),
(20, 'VieFacile', 'A basic cheat menu', '', 'Amenofisch', 8, '[3]', '[49]', '8c41ebac-c31a-11ed-8ccd-0242ac140002'),
(21, 'Weapons', 'A basic mod that adds weapons to the game.', '', 'Amenofisch', 10, '[1,2,5]', '[49]', '8c41ebc9-c31a-11ed-8ccd-0242ac140002'),
(22, 'PlayerRoutes', 'This is a simple mod which allows you to creates \"routes\" that are then displayed using white lines.\r\n', '', 'Amenofisch', 175, '[1,2]', '[49]', '8c41ebe8-c31a-11ed-8ccd-0242ac140002');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `relation_mod_mod`
--

CREATE TABLE `relation_mod_mod` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT uuid(),
  `mod` int(11) DEFAULT NULL,
  `dependency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `relation_mod_mod`
--

INSERT INTO `relation_mod_mod` (`uuid`, `mod`, `dependency`) VALUES
('1e036a71-02ff-11ee-ad57-0242ac120003', 8, 49),
('1e037eb9-02ff-11ee-ad57-0242ac120003', 10, 49),
('1e035d87-02ff-11ee-ad57-0242ac120003', 159, 49),
('1e04bf01-02ff-11ee-ad57-0242ac120003', 175, 49);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `relation_mod_tag`
--

CREATE TABLE `relation_mod_tag` (
  `uuid` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT uuid(),
  `mod` int(11) DEFAULT NULL,
  `tag` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `relation_mod_tag`
--

INSERT INTO `relation_mod_tag` (`uuid`, `mod`, `tag`) VALUES
('477a6255-02fd-11ee-ad57-0242ac120003', 5, 3),
('663f5349-02fd-11ee-ad57-0242ac120003', 8, 3),
('6c50c3a0-02fd-11ee-ad57-0242ac120003', 10, 5),
('f9a0640d-02fc-11ee-ad57-0242ac120003', 13, 3),
('5c1aff70-02ef-11ee-ad57-0242ac120003', 19, 1),
('5a5832fb-02fd-11ee-ad57-0242ac120003', 20, 2),
('4c44d342-02fd-11ee-ad57-0242ac120003', 24, 2),
('2a6f1c24-02fd-11ee-ad57-0242ac120003', 30, 3),
('221ce33c-02fd-11ee-ad57-0242ac120003', 34, 2),
('265a9d4a-02fd-11ee-ad57-0242ac120003', 49, 4),
('1bc3a88a-02fd-11ee-ad57-0242ac120003', 75, 1),
('615437ce-02fd-11ee-ad57-0242ac120003', 87, 2),
('3c73c5e9-02ef-11ee-ad57-0242ac120003', 97, 1),
('4f6aca48-02ef-11ee-ad57-0242ac120003', 97, 2),
('175c0c93-02fd-11ee-ad57-0242ac120003', 115, 2),
('6035959c-02ef-11ee-ad57-0242ac120003', 125, 2),
('3f17f918-02fd-11ee-ad57-0242ac120003', 134, 3),
('3678dd8e-02fd-11ee-ad57-0242ac120003', 136, 3),
('0f3db3e5-02fd-11ee-ad57-0242ac120003', 149, 2),
('11b1d345-02fd-11ee-ad57-0242ac120003', 149, 3),
('05e5abc4-02fd-11ee-ad57-0242ac120003', 155, 2),
('0b40c1c7-02fd-11ee-ad57-0242ac120003', 155, 3),
('43a90a06-02fd-11ee-ad57-0242ac120003', 159, 5),
('2dd32746-02fd-11ee-ad57-0242ac120003', 170, 1),
('31a2abde-02fd-11ee-ad57-0242ac120003', 170, 2),
('70704806-02fd-11ee-ad57-0242ac120003', 175, 1),
('74b96d28-02fd-11ee-ad57-0242ac120003', 175, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `uuid` varchar(127) NOT NULL DEFAULT uuid() COMMENT 'needed because of react'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `tags`
--

INSERT INTO `tags` (`id`, `text`, `color`, `uuid`) VALUES
(1, 'Gameplay', 'green', '687d8cca-c31a-11ed-8ccd-0242ac140002'),
(2, 'QOL', 'blue', '687d8d21-c31a-11ed-8ccd-0242ac140002'),
(3, 'Cheat', 'red', '687d8d3c-c31a-11ed-8ccd-0242ac140002'),
(4, 'Dependency', 'purple', '687d8d52-c31a-11ed-8ccd-0242ac140002'),
(5, 'Fun', 'yellow', '687d8d67-c31a-11ed-8ccd-0242ac140002');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('18d9323b-9171-4736-a412-0fe25c9cb097', '52458c875018c08b2fd47d5755a1b7dc412bc184ea2c253183c6b4b4cc207659', '2023-05-27 15:54:36.791', '0_init', '', NULL, '2023-05-27 15:54:36.791', 0);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `mods`
--
ALTER TABLE `mods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `nexusmods_id_2` (`nexusmods_id`),
  ADD UNIQUE KEY `nexusmods_id_3` (`nexusmods_id`),
  ADD UNIQUE KEY `nexusmods_id_4` (`nexusmods_id`,`uuid`),
  ADD KEY `nexusmods_id` (`nexusmods_id`);

--
-- Indizes für die Tabelle `relation_mod_mod`
--
ALTER TABLE `relation_mod_mod`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `mod` (`mod`,`dependency`),
  ADD KEY `tag` (`dependency`);

--
-- Indizes für die Tabelle `relation_mod_tag`
--
ALTER TABLE `relation_mod_tag`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `mod` (`mod`,`tag`),
  ADD KEY `tag` (`tag`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uuid` (`uuid`),
  ADD KEY `id` (`id`);

--
-- Indizes für die Tabelle `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `mods`
--
ALTER TABLE `mods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `relation_mod_tag`
--
ALTER TABLE `relation_mod_tag`
  ADD CONSTRAINT `relation_mod_tag_ibfk_1` FOREIGN KEY (`tag`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relation_mod_tag_ibfk_2` FOREIGN KEY (`mod`) REFERENCES `mods` (`nexusmods_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
