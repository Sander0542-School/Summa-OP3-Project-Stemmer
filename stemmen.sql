-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 20 feb 2018 om 11:10
-- Serverversie: 10.1.26-MariaDB
-- PHP-versie: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stemmen`
--
CREATE DATABASE IF NOT EXISTS `stemmen` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `stemmen`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `codes`
--

CREATE TABLE `codes` (
  `id` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `code` int(6) NOT NULL,
  `gebruikt` enum('nee','ja') NOT NULL DEFAULT 'nee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

CREATE TABLE `gebruikers` (
  `id` int(11) NOT NULL,
  `bsn` int(11) NOT NULL,
  `voornaam` varchar(100) NOT NULL,
  `tussenvoegsels` varchar(50) NOT NULL,
  `achternaam` varchar(100) NOT NULL,
  `woonplaats` varchar(75) NOT NULL,
  `postcode` varchar(7) NOT NULL,
  `straat` varchar(100) NOT NULL,
  `huisnummer` int(5) NOT NULL,
  `huisnummerToevoeging` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `partijen`
--

CREATE TABLE `partijen` (
  `id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `afkorting` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `stemmen`
--

CREATE TABLE `stemmen` (
  `id` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `partij` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`uID`) USING BTREE;

--
-- Indexen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`bsn`);

--
-- Indexen voor tabel `partijen`
--
ALTER TABLE `partijen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UniqueNaam` (`naam`);

--
-- Indexen voor tabel `stemmen`
--
ALTER TABLE `stemmen`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE` (`uID`),
  ADD KEY `foreign_stemmen_partij` (`partij`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `partijen`
--
ALTER TABLE `partijen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT voor een tabel `stemmen`
--
ALTER TABLE `stemmen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `codes`
--
ALTER TABLE `codes`
  ADD CONSTRAINT `foreign_codes_gebruiker` FOREIGN KEY (`uID`) REFERENCES `gebruikers` (`id`);

--
-- Beperkingen voor tabel `stemmen`
--
ALTER TABLE `stemmen`
  ADD CONSTRAINT `foreign_stemmen_gebruiker` FOREIGN KEY (`uID`) REFERENCES `gebruikers` (`id`),
  ADD CONSTRAINT `foreign_stemmen_partij` FOREIGN KEY (`partij`) REFERENCES `partijen` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
