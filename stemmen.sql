-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 27 feb 2018 om 11:48
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

DROP TABLE IF EXISTS `codes`;
CREATE TABLE `codes` (
  `id` int(11) NOT NULL,
  `uID` int(11) NOT NULL,
  `code` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `codes`
--

INSERT INTO `codes` (`id`, `uID`, `code`) VALUES
(2, 1, 683928),
(3, 2, 567896);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
CREATE TABLE `gebruikers` (
  `id` int(11) NOT NULL,
  `bsn` int(11) NOT NULL,
  `voornaam` varchar(100) NOT NULL,
  `tussenvoegsels` varchar(50) NOT NULL,
  `achternaam` varchar(100) NOT NULL,
  `gemeente` int(11) DEFAULT NULL,
  `woonplaats` varchar(75) NOT NULL,
  `postcode` varchar(7) NOT NULL,
  `straat` varchar(100) NOT NULL,
  `huisnummer` int(5) NOT NULL,
  `huisnummerToevoeging` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gebruikers`
--

INSERT INTO `gebruikers` (`id`, `bsn`, `voornaam`, `tussenvoegsels`, `achternaam`, `gemeente`, `woonplaats`, `postcode`, `straat`, `huisnummer`, `huisnummerToevoeging`) VALUES
(1, 123456, 'Sander', '', 'Jochems', 108, 'Geldrop', '5664 EX', 'Hout Oost', 9, ''),
(2, 234567, 'Bram', '', 'Swinkels', 299, 'Someren', '5711 AN', 'Beatrixlaan', 18, '');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `gemeenten`
--

DROP TABLE IF EXISTS `gemeenten`;
CREATE TABLE `gemeenten` (
  `id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `gemeenten`
--

INSERT INTO `gemeenten` (`id`, `naam`) VALUES
(1, 'Aa en Hunze'),
(2, 'Aalburg'),
(3, 'Aalsmeer'),
(4, 'Aalten'),
(5, 'Achtkarspelen'),
(6, 'Alblasserdam'),
(7, 'Albrandswaard'),
(8, 'Alkmaar'),
(9, 'Almelo'),
(10, 'Almere'),
(11, 'Alphen aan den Rijn'),
(12, 'Alphen-Chaam'),
(13, 'Ameland'),
(14, 'Amersfoort'),
(15, 'Amstelveen'),
(16, 'Amsterdam'),
(17, 'Apeldoorn'),
(18, 'Appingedam'),
(19, 'Arnhem'),
(20, 'Assen'),
(21, 'Asten'),
(22, 'Baarle-Nassau'),
(23, 'Baarn'),
(24, 'Barendrecht'),
(25, 'Barneveld'),
(26, 'Bedum'),
(27, 'Beek'),
(28, 'Beemster'),
(29, 'Beesel'),
(30, 'Bellingwedde'),
(31, 'Berg en Dal'),
(32, 'Bergeijk'),
(33, 'Bergen (L.)'),
(34, 'Bergen (NH.)'),
(35, 'Bergen op Zoom'),
(36, 'Berkelland'),
(37, 'Bernheze'),
(38, 'Best'),
(39, 'Beuningen'),
(40, 'Beverwijk'),
(41, 'het Bildt'),
(42, 'De Bilt'),
(43, 'Binnenmaas'),
(44, 'Bladel'),
(45, 'Blaricum'),
(46, 'Bloemendaal'),
(47, 'Bodegraven-Reeuwijk'),
(48, 'Boekel'),
(49, 'Ten Boer'),
(50, 'Borger-Odoorn'),
(51, 'Borne'),
(52, 'Borsele'),
(53, 'Boxmeer'),
(54, 'Boxtel'),
(55, 'Breda'),
(56, 'Brielle'),
(57, 'Bronckhorst'),
(58, 'Brummen'),
(59, 'Brunssum'),
(60, 'Bunnik'),
(61, 'Bunschoten'),
(62, 'Buren'),
(63, 'Capelle aan den IJssel'),
(64, 'Castricum'),
(65, 'Coevorden'),
(66, 'Cranendonck'),
(67, 'Cromstrijen'),
(68, 'Cuijk'),
(69, 'Culemborg'),
(70, 'Dalfsen'),
(71, 'Dantumadiel'),
(72, 'Delft'),
(73, 'Delfzijl'),
(74, 'Deurne'),
(75, 'Deventer'),
(76, 'Diemen'),
(77, 'Dinkelland'),
(78, 'Doesburg'),
(79, 'Doetinchem'),
(80, 'Dongen'),
(81, 'Dongeradeel'),
(82, 'Dordrecht'),
(83, 'Drechterland'),
(84, 'Drimmelen'),
(85, 'Dronten'),
(86, 'Druten'),
(87, 'Duiven'),
(88, 'Echt-Susteren'),
(89, 'Edam-Volendam'),
(90, 'Ede'),
(91, 'Eemnes'),
(92, 'Eemsmond'),
(93, 'Eersel'),
(94, 'Eijsden-Margraten'),
(95, 'Eindhoven'),
(96, 'Elburg'),
(97, 'Emmen'),
(98, 'Enkhuizen'),
(99, 'Enschede'),
(100, 'Epe'),
(101, 'Ermelo'),
(102, 'Etten-Leur'),
(103, 'Ferwerderadiel'),
(104, 'Franekeradeel'),
(105, 'De Fryske Marren'),
(106, 'Geertruidenberg'),
(107, 'Geldermalsen'),
(108, 'Geldrop-Mierlo'),
(109, 'Gemert-Bakel'),
(110, 'Gennep'),
(111, 'Giessenlanden'),
(112, 'Gilze en Rijen'),
(113, 'Goeree-Overflakkee'),
(114, 'Goes'),
(115, 'Goirle'),
(116, 'Gooise Meren'),
(117, 'Gorinchem'),
(118, 'Gouda'),
(119, 'Grave'),
(120, '\'s-Gravenhage'),
(121, 'Groningen'),
(122, 'Grootegast'),
(123, 'Gulpen-Wittem'),
(124, 'Haaksbergen'),
(125, 'Haaren'),
(126, 'Haarlem'),
(127, 'Haarlemmerliede en Spaarnwoude'),
(128, 'Haarlemmermeer'),
(129, 'Halderberge'),
(130, 'Hardenberg'),
(131, 'Harderwijk'),
(132, 'Hardinxveld-Giessendam'),
(133, 'Haren'),
(134, 'Harlingen'),
(135, 'Hattem'),
(136, 'Heemskerk'),
(137, 'Heemstede'),
(138, 'Heerde'),
(139, 'Heerenveen'),
(140, 'Heerhugowaard'),
(141, 'Heerlen'),
(142, 'Heeze-Leende'),
(143, 'Heiloo'),
(144, 'Den Helder'),
(145, 'Hellendoorn'),
(146, 'Hellevoetsluis'),
(147, 'Helmond'),
(148, 'Hendrik-Ido-Ambacht'),
(149, 'Hengelo'),
(150, '\'s-Hertogenbosch'),
(151, 'Heumen'),
(152, 'Heusden'),
(153, 'Hillegom'),
(154, 'Hilvarenbeek'),
(155, 'Hilversum'),
(156, 'Hof van Twente'),
(157, 'Hollands Kroon'),
(158, 'Hoogeveen'),
(159, 'Hoogezand-Sappemeer'),
(160, 'Hoorn'),
(161, 'Horst aan de Maas'),
(162, 'Houten'),
(163, 'Huizen'),
(164, 'Hulst'),
(165, 'IJsselstein'),
(166, 'Kaag en Braassem'),
(167, 'Kampen'),
(168, 'Kapelle'),
(169, 'Katwijk'),
(170, 'Kerkrade'),
(171, 'Koggenland'),
(172, 'Kollumerland en Nieuwkruisland'),
(173, 'Korendijk'),
(174, 'Krimpen aan den IJssel'),
(175, 'Krimpenerwaard'),
(176, 'Laarbeek'),
(177, 'Landerd'),
(178, 'Landgraaf'),
(179, 'Landsmeer'),
(180, 'Langedijk'),
(181, 'Lansingerland'),
(182, 'Laren'),
(183, 'Leek'),
(184, 'Leerdam'),
(185, 'Leeuwarden'),
(186, 'Leeuwarderadeel'),
(187, 'Leiden'),
(188, 'Leiderdorp'),
(189, 'Leidschendam-Voorburg'),
(190, 'Lelystad'),
(191, 'Leudal'),
(192, 'Leusden'),
(193, 'Lingewaal'),
(194, 'Lingewaard'),
(195, 'Lisse'),
(196, 'Littenseradiel'),
(197, 'Lochem'),
(198, 'Loon op Zand'),
(199, 'Lopik'),
(200, 'Loppersum'),
(201, 'Losser'),
(202, 'Maasdriel'),
(203, 'Maasgouw'),
(204, 'Maassluis'),
(205, 'Maastricht'),
(206, 'De Marne'),
(207, 'Marum'),
(208, 'Medemblik'),
(209, 'Meerssen'),
(210, 'Meierijstad'),
(211, 'Menameradiel'),
(212, 'Menterwolde'),
(213, 'Meppel'),
(214, 'Middelburg'),
(215, 'Midden-Delfland'),
(216, 'Midden-Drenthe'),
(217, 'Mill en Sint Hubert'),
(218, 'Moerdijk'),
(219, 'Molenwaard'),
(220, 'Montferland'),
(221, 'Montfoort'),
(222, 'Mook en Middelaar'),
(223, 'Neder-Betuwe'),
(224, 'Nederweert'),
(225, 'Neerijnen'),
(226, 'Nieuwegein'),
(227, 'Nieuwkoop'),
(228, 'Nijkerk'),
(229, 'Nijmegen'),
(230, 'Nissewaard'),
(231, 'Noord-Beveland'),
(232, 'Noordenveld'),
(233, 'Noordoostpolder'),
(234, 'Noordwijk'),
(235, 'Noordwijkerhout'),
(236, 'Nuenen, Gerwen en Nederwetten'),
(237, 'Nunspeet'),
(238, 'Nuth'),
(239, 'Oegstgeest'),
(240, 'Oirschot'),
(241, 'Oisterwijk'),
(242, 'Oldambt'),
(243, 'Oldebroek'),
(244, 'Oldenzaal'),
(245, 'Olst-Wijhe'),
(246, 'Ommen'),
(247, 'Onderbanken'),
(248, 'Oost Gelre'),
(249, 'Oosterhout'),
(250, 'Ooststellingwerf'),
(251, 'Oostzaan'),
(252, 'Opmeer'),
(253, 'Opsterland'),
(254, 'Oss'),
(255, 'Oud-Beijerland'),
(256, 'Oude IJsselstreek'),
(257, 'Ouder-Amstel'),
(258, 'Oudewater'),
(259, 'Overbetuwe'),
(260, 'Papendrecht'),
(261, 'Peel en Maas'),
(262, 'Pekela'),
(263, 'Pijnacker-Nootdorp'),
(264, 'Purmerend'),
(265, 'Putten'),
(266, 'Raalte'),
(267, 'Reimerswaal'),
(268, 'Renkum'),
(269, 'Renswoude'),
(270, 'Reusel-De Mierden'),
(271, 'Rheden'),
(272, 'Rhenen'),
(273, 'Ridderkerk'),
(274, 'Rijnwaarden'),
(275, 'Rijssen-Holten'),
(276, 'Rijswijk'),
(277, 'Roerdalen'),
(278, 'Roermond'),
(279, 'De Ronde Venen'),
(280, 'Roosendaal'),
(281, 'Rotterdam'),
(282, 'Rozendaal'),
(283, 'Rucphen'),
(284, 'Schagen'),
(285, 'Scherpenzeel'),
(286, 'Schiedam'),
(287, 'Schiermonnikoog'),
(288, 'Schinnen'),
(289, 'Schouwen-Duiveland'),
(290, 'Simpelveld'),
(291, 'Sint Anthonis'),
(292, 'Sint-Michielsgestel'),
(293, 'Sittard-Geleen'),
(294, 'Sliedrecht'),
(295, 'Slochteren'),
(296, 'Sluis'),
(297, 'Smallingerland'),
(298, 'Soest'),
(299, 'Someren'),
(300, 'Son en Breugel'),
(301, 'Stadskanaal'),
(302, 'Staphorst'),
(303, 'Stede Broec'),
(304, 'Steenbergen'),
(305, 'Steenwijkerland'),
(306, 'Stein'),
(307, 'Stichtse Vecht'),
(308, 'Strijen'),
(309, 'Súdwest-Fryslân'),
(310, 'Terneuzen'),
(311, 'Terschelling'),
(312, 'Texel'),
(313, 'Teylingen'),
(314, 'Tholen'),
(315, 'Tiel'),
(316, 'Tilburg'),
(317, 'Tubbergen'),
(318, 'Twenterand'),
(319, 'Tynaarlo'),
(320, 'Tytsjerksteradiel'),
(321, 'Uden'),
(322, 'Uitgeest'),
(323, 'Uithoorn'),
(324, 'Urk'),
(325, 'Utrecht'),
(326, 'Utrechtse Heuvelrug'),
(327, 'Vaals'),
(328, 'Valkenburg aan de Geul'),
(329, 'Valkenswaard'),
(330, 'Veendam'),
(331, 'Veenendaal'),
(332, 'Veere'),
(333, 'Veldhoven'),
(334, 'Velsen'),
(335, 'Venlo'),
(336, 'Venray'),
(337, 'Vianen'),
(338, 'Vlaardingen'),
(339, 'Vlagtwedde'),
(340, 'Vlieland'),
(341, 'Vlissingen'),
(342, 'Voerendaal'),
(343, 'Voorschoten'),
(344, 'Voorst'),
(345, 'Vught'),
(346, 'Waalre'),
(347, 'Waalwijk'),
(348, 'Waddinxveen'),
(349, 'Wageningen'),
(350, 'Wassenaar'),
(351, 'Waterland'),
(352, 'Weert'),
(353, 'Weesp'),
(354, 'Werkendam'),
(355, 'West Maas en Waal'),
(356, 'Westerveld'),
(357, 'Westervoort'),
(358, 'Westland'),
(359, 'Weststellingwerf'),
(360, 'Westvoorne'),
(361, 'Wierden'),
(362, 'Wijchen'),
(363, 'Wijdemeren'),
(364, 'Wijk bij Duurstede'),
(365, 'Winsum'),
(366, 'Winterswijk'),
(367, 'Woensdrecht'),
(368, 'Woerden'),
(369, 'De Wolden'),
(370, 'Wormerland'),
(371, 'Woudenberg'),
(372, 'Woudrichem'),
(373, 'Zaanstad'),
(374, 'Zaltbommel'),
(375, 'Zandvoort'),
(376, 'Zederik'),
(377, 'Zeewolde'),
(378, 'Zeist'),
(379, 'Zevenaar'),
(380, 'Zoetermeer'),
(381, 'Zoeterwoude'),
(382, 'Zuidhorn'),
(383, 'Zuidplas'),
(384, 'Zundert'),
(385, 'Zutphen'),
(386, 'Zwartewaterland'),
(387, 'Zwijndrecht'),
(388, 'Zwolle');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `partijen`
--

DROP TABLE IF EXISTS `partijen`;
CREATE TABLE `partijen` (
  `id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `afkorting` varchar(10) NOT NULL,
  `gemeenten` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Gegevens worden geëxporteerd voor tabel `partijen`
--

INSERT INTO `partijen` (`id`, `naam`, `afkorting`, `gemeenten`) VALUES
(2, 'Partij van de Arbeid', 'PvdA', 108),
(3, 'Partij voor de Vrijheid', 'PVV', 299),
(4, 'Christen-Democratisch Appèl', 'CDA', 299),
(6, 'Partij voor de Vrijheid', 'PVV', 108),
(7, 'Partij voor de Dieren', 'PvdD', 38),
(8, 'GroenLinks', 'GroenLinks', 299),
(10, 'Democraten 66', 'D66', 352),
(11, 'Volkspartij voor Vrijheid en Democratie', 'VVD', 352),
(12, 'DENK', 'DENK', 38);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `stemmen`
--

DROP TABLE IF EXISTS `stemmen`;
CREATE TABLE `stemmen` (
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
  ADD UNIQUE KEY `UNIQUE` (`bsn`),
  ADD KEY `foreign_gebruikers_gemeenten` (`gemeente`);

--
-- Indexen voor tabel `gemeenten`
--
ALTER TABLE `gemeenten`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `partijen`
--
ALTER TABLE `partijen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreign_partijen_gemeenten` (`gemeenten`);

--
-- Indexen voor tabel `stemmen`
--
ALTER TABLE `stemmen`
  ADD PRIMARY KEY (`uID`),
  ADD KEY `foreign_stemmen_partij` (`partij`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT voor een tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT voor een tabel `gemeenten`
--
ALTER TABLE `gemeenten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;
--
-- AUTO_INCREMENT voor een tabel `partijen`
--
ALTER TABLE `partijen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `codes`
--
ALTER TABLE `codes`
  ADD CONSTRAINT `foreign_codes_gebruiker` FOREIGN KEY (`uID`) REFERENCES `gebruikers` (`id`);

--
-- Beperkingen voor tabel `gebruikers`
--
ALTER TABLE `gebruikers`
  ADD CONSTRAINT `foreign_gebruikers_gemeenten` FOREIGN KEY (`gemeente`) REFERENCES `gemeenten` (`id`);

--
-- Beperkingen voor tabel `partijen`
--
ALTER TABLE `partijen`
  ADD CONSTRAINT `foreign_partijen_gemeenten` FOREIGN KEY (`gemeenten`) REFERENCES `gemeenten` (`id`);

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
