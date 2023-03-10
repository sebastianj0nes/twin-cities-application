-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 12:01 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twincitydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `c_ID` int(3) NOT NULL,
  `c_name` varchar(45) NOT NULL,
  `c_country` varchar(10) NOT NULL,
  `c_lat` varchar(10) NOT NULL,
  `c_long` varchar(10) NOT NULL,
  `c_population` int(7) NOT NULL,
  `c_currency` varchar(25) NOT NULL,
  `c_event` varchar(1000) NOT NULL,
  `c_wiki` varchar(100) NOT NULL,
  `c_image` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`c_ID`, `c_name`, `c_country`, `c_lat`, `c_long`, `c_population`, `c_currency`, `c_event`, `c_wiki`, `c_image`) VALUES
(1, 'Edinburgh', 'Scotland', '55.954251', '-3.19267', 554000, 'British Pound Sterling', 'Edinburgh Fringe Festival', 'https://en.wikipedia.org/wiki/Edinburgh', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Flag_of_Scotland.svg/255px-Flag_of_Scotland.svg.png'),
(2, 'Munich', 'Germany', '48.158132', '11.560550', 1487708, 'Euro', 'Oktoberfest', 'https://en.wikipedia.org/wiki/Munich', 'https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Flag_of_Germany.svg/255px-Flag_of_Germany.svg.png');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `i_ID` int(3) NOT NULL,
  `i_title` varchar(100) DEFAULT NULL,
  `i_desc` varchar(100) DEFAULT NULL,
  `i_link` varchar(400) DEFAULT NULL,
  `p_ID` int(11) DEFAULT NULL,
  `c_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`i_ID`, `i_title`, `i_desc`, `i_link`, `p_ID`, `c_ID`) VALUES
(1, 'Edinburgh Castle', 'Edinburgh Castle, shot from the North', 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Edinburgh_Castle_from_the_North.JPG/220px-Edinburgh_Castle_from_the_North.JPG', 1, 1),
(2, 'National Museum of Scotland', 'Inside view of the Museum', 'https://www.nms.ac.uk/media/1162612/2020_09_11_ra_030.jpg', 2, 1),
(3, 'Royal Botanic Garden', 'Palm House in the Royal Botanic Garden', 'https://upload.wikimedia.org/wikipedia/commons/f/f8/Palm_House%2C_Royal_Botanic_Garden_Edinburgh.JPG', 3, 1),
(4, 'Palace of Holyrood House', 'Front view of Holyrood House', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Holyroodhouse%2C_front_view.jpg/300px-Holyroodhouse%2C_front_view.jpg', 4, 1),
(5, 'Scottish National Gallery of Modern Art', 'Outside view of the Gallery', 'https://www.nationalgalleries.org/sites/default/files/styles/feature-figure/public/visit/venue/SNGMA-ModernOne.jpg', 5, 1),
(6, 'The Scotch Whiskey Experience', 'The inside of the Scotch Whiskey Experience, with a selection on offer', 'https://scotchwhisky.com/images/media/5f0c311661804c6fb2490c179f388ba6.jpg', 6, 1),
(7, 'Marienplatz', 'Panorama picture of Marienplatz', 'https://www.munich.travel/var/ger_muc/storage/images/_aliases/image_gallery_main/7/5/5/1/521557-1-ger-DE/marienplatz-panorama-2169s-foto-joerg-lutz.jpg', 7, 2),
(8, 'English Garden Munich', 'The English Garden on a busy summer day', 'https://www.fattiretours.com/app/uploads/2022/03/munich-attractions-english-garden.jpg', 8, 2),
(9, 'Nymphenburg Palace', 'Head on view of Nymphenburg Palace', 'https://upload.wikimedia.org/wikipedia/commons/0/0b/Image-Schloss_Nymphenburg_Munich_CC_edit3.jpg', 9, 2),
(10, 'Asankirche', 'The entrance to Asankirche', 'https://upload.wikimedia.org/wikipedia/commons/4/4e/St._Nepomuk_retusche.jpg', 10, 2),
(11, 'Olympiapark', 'Panorama image of Olympiapark', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/M%C3%BCnchen_-_Olympische_Bauten.jpg/250px-M%C3%BCnchen_-_Olympische_Bauten.jpg', 11, 2),
(12, 'BMW Museum', 'Entrance of the BMW Museum', 'https://upload.wikimedia.org/wikipedia/commons/b/bd/Mus%C3%A9e_BMW_004.jpg', 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `p_ID` int(3) NOT NULL,
  `p_name` varchar(45) NOT NULL,
  `p_addOne` varchar(45) NOT NULL,
  `p_addTwo` varchar(45) NOT NULL,
  `p_postcode` varchar(8) NOT NULL,
  `p_lat` varchar(10) NOT NULL,
  `p_long` varchar(10) NOT NULL,
  `p_established` int(4) DEFAULT NULL,
  `p_desc` varchar(1000) NOT NULL,
  `p_capacity` int(5) DEFAULT NULL,
  `p_website` varchar(100) NOT NULL,
  `p_wiki` varchar(100) NOT NULL,
  `p_icon` varchar(100) DEFAULT NULL,
  `city_c_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`p_ID`, `p_name`, `p_addOne`, `p_addTwo`, `p_postcode`, `p_lat`, `p_long`, `p_established`, `p_desc`, `p_capacity`, `p_website`, `p_wiki`, `p_icon`, `city_c_ID`) VALUES
(1, 'Edinburgh Castle', 'Castlehill', 'Edinburgh', 'EH1 2NG', '55.9486', '-3.1999', 1103, 'Edinburgh Castle is a historic castle in Edinburgh, Scotland. It stands on Castle Rock, which has been occupied by humans since at least the Iron Age, although the nature of the early settlement is unclear. There has been a royal castle on the rock since at least the reign of David I in the 12th century, and the site continued to be a royal residence until 1633. From the 15th century, the castle\'s residential role declined, and by the 17th century it was principally used as military barracks with a large garrison. Its importance as a part of Scotland\'s national heritage was recognised increasingly from the early 19th century onwards, and various restoration programmes have been carried out over the past century and a half.', 1000, 'https://www.edinburghcastle.scot/', 'https://en.wikipedia.org/wiki/Edinburgh_Castle', 'https://icons.getbootstrap.com/icons/building/', 1),
(2, 'National Museum of Scotland', 'Chambers St', 'Edinburgh', 'EH1 1JF', '55.9470', '-3.1906', 1866, 'The National Museum of Scotland in Edinburgh, Scotland, was formed in 2006 with the merger of the new Museum of Scotland, with collections relating to Scottish antiquities, culture and history, and the adjacent Royal Scottish Museum (opened in 1866 as the Edinburgh Museum of Science and Art, renamed in 1904, and for the period between 1985 and the merger named the Royal Museum of Scotland or simply the Royal Museum), with international collections covering science and technology, natural history, and world cultures. The two connected buildings stand beside each other on Chambers Street, by the intersection with the George IV Bridge, in central Edinburgh. The museum is part of National Museums Scotland. Admission is free.', 1500, 'https://www.nms.ac.uk/national-museum-of-scotland/\r\n', 'https://en.wikipedia.org/wiki/National_Museum_of_Scotland\r\n', 'https://icons.getbootstrap.com/icons/bank/\r\n', 1),
(3, 'Royal Botanic Garden', 'Arboretum Pl', 'Edinburgh', 'EH3 5NZ', '55.9650', '-3.2091', 1670, 'The Royal Botanic Garden Edinburgh (RBGE) is a scientific centre for the study of plants, their diversity and conservation, as well as a popular tourist attraction. Founded in 1670 as a physic garden to grow medicinal plants, today it occupies four sites across Scotland—Edinburgh, Dawyck, Logan and Benmore—each with its own specialist collection. The RBGE\'s living collection consists of more than 13,302 plant species (34,422 accessions), whilst the herbarium contains in excess of 3 million preserved specimens. The Royal Botanic Garden Edinburgh is an executive non-departmental public body of the Scottish Government. The Edinburgh site is the main garden and the headquarters of the public body, which is led by Regius Keeper Simon Milne.', 1000, 'https://www.rbge.org.uk/', 'https://en.wikipedia.org/wiki/Royal_Botanic_Garden_Edinburgh', 'https://icons.getbootstrap.com/icons/flower1/', 1),
(4, 'Palace of Holyrood House', 'Canongate', 'Edinburgh', 'EH8 8DX', '55.9527', '-3.1723', 1671, 'The Palace of Holyroodhouse, commonly referred to as Holyrood Palace or Holyroodhouse, is the official residence of the British monarch in Scotland. Located at the bottom of the Royal Mile in Edinburgh, at the opposite end to Edinburgh Castle, Holyroodhouse has served as the principal royal residence in Scotland since the 16th century, and is a setting for state occasions and official entertaining.', 200, 'https://www.rct.uk/visit/palace-of-holyroodhouse', 'https://en.wikipedia.org/wiki/Holyrood_Palace\r\n', 'https://icons.getbootstrap.com/icons/gem/\r\n', 1),
(5, 'Scottish National Gallery of Modern Art', '73 and 75 Belford Rd', 'Edinburgh', 'EH4 3DS', '55.9518', '-3.2242', 1984, '\"The Scottish National Gallery of Modern Art is part of the National Galleries of Scotland, which are based in Edinburgh, Scotland. The National Gallery of Modern Art houses the collection of modern and contemporary art dating from about 1900 to the present in two buildings, Modern One and Modern Two, that face each other on Belford Road to the west of the city centre.\r\nThe National Gallery has a collection of more than 6000 paintings, sculptures, installations, video work, prints and drawings and also stages major exhibitions.\"\r\n', 1000, 'https://www.nationalgalleries.org/visit/scottish-national-gallery-modern-art\r\n', 'https://en.wikipedia.org/wiki/Scottish_National_Gallery_of_Modern_Art\r\n', 'https://icons.getbootstrap.com/icons/palette-fill/\r\n', 1),
(6, 'The Scotch Whiskey Experience', '354 Castlehill', 'Edinburgh', 'EH1 2NE', '55.9488', '-3.1959', 1987, 'The Scotch Whisky Experience is a whisky visitor attraction located on Castlehill in the Old Town of Edinburgh, immediately adjacent to the esplanade of Edinburgh Castle. The centre offers tours and whisky tutoring sessions, alongside a shop, corporate spaces and Amber Restaurant & Whisky Bar.\r\n', 150, 'https://www.scotchwhiskyexperience.co.uk/\r\n', 'https://en.wikipedia.org/wiki/Scotch_Whisky_Experience\r\n', 'https://icons.getbootstrap.com/icons/cup-straw/\r\n', 1),
(7, 'Marienplatz', 'Marienplatz', 'München', '80331', '48.1374', '11.5754', 1158, 'Marienplatz (English: Mary\'s Square, i.e. St. Mary, Our Lady\'s Square) is a central square in the city centre of Munich, Germany. It has been the city\'s main square since 1158.', NULL, 'https://www.munich.travel/en/pois/urban-districts/marienplatz#/', 'https://en.wikipedia.org/wiki/Marienplatz\r\n', 'https://icons.getbootstrap.com/icons/buildings/\r\n', 2),
(8, 'Englischer Garten (Munich)', 'Englischer Garten', 'München', '80805', '48.1642', '11.6056', 1789, '\"The Englischer Garten (English Garden) is a large public park in the centre of Munich, Bavaria, stretching from the city centre to the northeastern city limits. It was created in 1789 by Sir Benjamin Thompson (1753–1814), later Count Rumford (Reichsgraf von Rumford), for Prince Charles Theodore, Elector of Bavaria. Thompson\'s successors, Reinhard von Werneck (1757–1842) and Friedrich Ludwig von Sckell (1750–1823), advisers on the project from its beginning, both extended and improved the park. With an area of 3.7 km2 (1.4 sq mi) (370 ha or 910 acres), the Englischer Garten is one of the world\'s largest urban public parks. The name refers to its English garden form of informal landscape, a style popular in England from the mid-18th century to the early 19th century and particularly associated with Capability Brown.\"', 7000, 'https://www.muenchen.de/en/sights/attractions/english-garden\r\n', 'https://en.wikipedia.org/wiki/Englischer_Garten\r\n', 'https://icons.getbootstrap.com/icons/tree/\r\n', 2),
(9, 'Nymphenburg Palace', 'Schloß Nymphenburg 1', 'München', '80638', '48.1583', '11.5033', 1675, 'The Nymphenburg Palace is a Baroque palace situated in Munich\'s western district Neuhausen-Nymphenburg, in Bavaria, southern Germany. Combined with the adjacent Nymphenburg Palace Park it constitutes one of the premier royal palaces of Europe. Its frontal width of 632 m (2,073 ft) (north–south axis) even surpasses Versailles Palace. The Nymphenburg served as the main summer residence for the former rulers of Bavaria of the House of Wittelsbach.\r\n', 400, 'https://www.schloss-nymphenburg.de/englisch/palace/\r\n', 'https://en.wikipedia.org/wiki/Nymphenburg_Palace\r\n', 'https://icons.getbootstrap.com/icons/bank2/\r\n', 2),
(10, 'Asamkirche', 'Sendlinger Str. 32', 'München', '80331', '48.1352', '11.5696', 1746, 'St. Johann Nepomuk, better known as the Asam Church, is a Baroque church in Munich, southern Germany. It was built from 1733 to 1746 by a pair of brothers, sculptor Egid Quirin Asam and painter Cosmas Damian Asam, as their private church. It is considered to be one of the most important buildings of the southern German Late Baroque.\r\n', 7000, 'https://www.munich.travel/en/pois/urban-districts/asamkirche\r\n', 'https://en.wikipedia.org/wiki/Asam_Church,_Munich\r\n', 'https://icons.getbootstrap.com/icons/person-hearts/\r\n', 2),
(11, 'Olympiapark', 'Spiridon-Louis-Ring 21', 'München', '80809', '48.1755', '11.5518', 1972, 'The Olympiapark in Munich, Germany, is an Olympic Park which was constructed for the 1972 Summer Olympics. Located in the Oberwiesenfeld neighborhood of Munich, the Park continues to serve as a venue for cultural, social, and religious events, such as events of worship. It includes a contemporary carillon.', 69250, 'https://www.olympiapark.de/en/olympiapark-munich/\r\n', 'https://en.wikipedia.org/wiki/Olympiapark_(Munich)\r\n', 'https://icons.getbootstrap.com/icons/align-bottom/\r\n', 2),
(12, 'BMW Museum', 'Am Olympiapark 2', 'München', '80809', '48.1768', '11.5591', 1973, 'The BMW Museum is an automobile museum of BMW history located near the Olympiapark in Munich, Germany. The museum was established in 1973, shortly after the Summer Olympics opened. From 2004 to 2008, it was renovated in connection with the construction of the BMW Welt, directly opposite. The museum reopened on 21 June 2008. At the moment the exhibition space is 5,000 square metres for the presentation of about 120 exhibits.\r\n', 600, 'https://www.bmw-welt.com/en.html\r\n', 'https://en.wikipedia.org/wiki/BMW_Museum\r\n', 'https://icons.getbootstrap.com/icons/truck-front/\r\n', 2);

-- --------------------------------------------------------

--
-- Table structure for table `place_type`
--

CREATE TABLE `place_type` (
  `type_t_ID` int(3) NOT NULL,
  `place_p_ID` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place_type`
--

INSERT INTO `place_type` (`type_t_ID`, `place_p_ID`) VALUES
(1, 2),
(1, 5),
(1, 12),
(2, 1),
(3, 3),
(3, 8),
(4, 4),
(4, 9),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(8, 11),
(9, 10);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `t_ID` int(3) NOT NULL,
  `t_name` varchar(45) NOT NULL,
  `t_icon` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`t_ID`, `t_name`, `t_icon`) VALUES
(1, 'Museum', NULL),
(2, 'Castle', NULL),
(3, 'Garden', NULL),
(4, 'Palace', NULL),
(5, 'Gallery', NULL),
(6, 'Experience', NULL),
(7, 'Landmark', NULL),
(8, 'Park', NULL),
(9, 'Church', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`c_ID`),
  ADD UNIQUE KEY `city_ID_UNIQUE` (`c_ID`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`i_ID`),
  ADD KEY `p_ID` (`p_ID`),
  ADD KEY `c_ID` (`c_ID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`p_ID`),
  ADD UNIQUE KEY `place_of_interest_ID_UNIQUE` (`p_ID`),
  ADD KEY `fk_place_of_interest_city_idx` (`city_c_ID`);

--
-- Indexes for table `place_type`
--
ALTER TABLE `place_type`
  ADD PRIMARY KEY (`type_t_ID`,`place_p_ID`),
  ADD KEY `fk_place_type_place1_idx` (`place_p_ID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`t_ID`),
  ADD UNIQUE KEY `t_id_UNIQUE` (`t_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `c_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `i_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `place`
--
ALTER TABLE `place`
  MODIFY `p_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `t_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`p_ID`) REFERENCES `place` (`p_ID`),
  ADD CONSTRAINT `image_ibfk_2` FOREIGN KEY (`c_ID`) REFERENCES `city` (`c_ID`);

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `fk_place_of_interest_city` FOREIGN KEY (`city_c_ID`) REFERENCES `city` (`c_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `place_type`
--
ALTER TABLE `place_type`
  ADD CONSTRAINT `fk_place_type_place1` FOREIGN KEY (`place_p_ID`) REFERENCES `place` (`p_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_place_type_type1` FOREIGN KEY (`type_t_ID`) REFERENCES `type` (`t_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
