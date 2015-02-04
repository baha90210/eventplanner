
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eventplanner`
--

--
-- Dumping data for table `artist`
--

INSERT INTO `artist` (`artist_id`, `name`, `rate`, `website`, `image`) VALUES
(3, 'Anouk', 9999.99, 'www.anouk.nl', 'Anouk_foto_1.jpg'),
(4, 'Deus', 9999.99, 'www.deus.com', ''),
(5, 'Dotan', 5600.00, 'www.dotan.be', ''),
(6, 'Douwe Bob', 750.00, 'www.douwe-bob.nl', 'douwebob.jpg'),
(7, 'Jet Rebel', 8900.00, 'www.jet.org', ''),
(8, 'The Kik', 450.00, 'www.dekick.nl', ''),
(9, 'Kensington', 9999.99, 'www.kensington.co.uk', ''),
(10, 'Kovacs', 1234.00, 'www.kovacs.nl', ''),
(11, 'Against Me', 1000.00, '', ''),
(12, 'Blues Pills', 750.00, 'www.bluespills', ''),
(13, 'Fiddler''s Green', 3500.00, 'www.fidlers.co.uk', ''),
(14, 'John Coffey', 650.00, 'www.johncoffey.com', ''),
(15, 'Pierre Wind', 1250.00, 'wwww.wind.nl', ''),
(16, 'Weekend Warriors', 4500.00, 'www.weekendwarriors.og', ''),
(17, 'UB40', 9999.99, 'www.ub40.nl', ''),
(18, 'De Dijk', 7400.00, 'dedijkmusic.nl', ''),
(19, 'AfroJack', 0.00, 'www.afrojack.org', 'afrojack.png'),
(20, 'W&W', 3021.00, 'www.wenw.nl', 'wenw.png'),
(21, 'Yellow Claw', 1234.00, 'www.yellowclaw.nl', 'yellow-claw.png'),
(22, 'Olivier Heldens', 3452.00, 'www.heldens.nl', ''),
(23, 'Showtek', 2341.00, 'www.showtek.com', ''),
(24, 'Nicky Romero', 4545.00, 'www.romeronicky.nl', ''),
(25, 'Fedde Le Grand', 5674.00, 'www.feddelegrande.com', ''),
(26, 'Armin van Buuren', 9974.00, 'www.vanbuuren.nl', ''),
(27, 'Hardwell', 9212.00, 'www.djhardwell.nl', '');

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `name`, `start_date`, `end_date`, `price`) VALUES
(18, 'Paaspop 2015', '2015-04-03 00:00:00', '2015-02-05 23:59:59', 99.00),
(20, 'Parkpop Den Haag 2015', '2015-06-28 00:00:00', '2015-06-28 00:00:00', 0.00),
(21, 'Flying Dutch 2015', '2015-05-30 00:00:00', '2015-05-30 00:00:00', 49.80);

--
-- Dumping data for table `event_location`
--

INSERT INTO `event_location` (`event_id`, `location_id`) VALUES
(18, 3),
(18, 4),
(18, 5),
(18, 6),
(18, 7),
(20, 8),
(21, 9),
(21, 10),
(21, 11);

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `name`, `address`, `rate`, `capacity`) VALUES
(3, 'Main Stage Appollo', 'Schijndel', 0.00, 100),
(4, 'Jack Daniels Stage', 'Schijndel', 0.00, 100),
(5, 'Phoenix Stage', 'Schijndel', 0.00, 100),
(6, 'Loco Royale Stage', 'Schijndel', 0.00, 100),
(7, 'Theater Stage', 'Schijndel', 0.00, 100),
(8, 'ParkPop Zuiderpark', 'Zuiderpark Den Haag', 0.00, 30000),
(9, 'Olympisch stadion', 'Amsterdam', 0.00, 30000),
(10, 'Ahoy Plein', 'Rotterdam', 0.00, 30000),
(11, 'Strijp S', 'Eindhoven', 0.00, 30000);

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`performance_id`, `performance_title`, `event_id`, `artist_id`, `date_from`, `date_until`, `confirmed`) VALUES
(19, 'Main Stage Anouk', 18, 3, '2015-04-05 20:00:00', '2015-04-05 20:45:00', 1),
(20, 'Main Stage Deus', 18, 4, '2015-04-05 20:55:00', '2015-04-05 21:40:00', 1),
(21, 'Main Stage Dotan', 18, 5, '2015-04-05 21:00:00', '2015-04-05 21:55:00', 1),
(22, 'Main Stage Jet Rebel', 18, 7, '2015-04-05 22:00:00', '2015-04-05 22:55:00', 1),
(23, 'Jack Daniels Stage Against Me', 18, 11, '2015-04-05 20:55:00', '2015-04-05 21:55:00', 1),
(24, 'Jack Daniels Stage Blues Pills', 18, 12, '2015-04-03 19:00:00', '2015-04-03 20:00:00', 0),
(25, 'Jack Daniels Stage Fiddlers Green', 18, 13, '2015-04-03 20:00:00', '2015-04-03 21:00:00', 1),
(26, 'Jack Daniels Stage John Coffey', 18, 14, '2015-04-04 21:00:00', '2015-04-04 22:00:00', 0),
(27, 'Loco Royale Zondag 16:00', 18, 15, '2015-04-05 16:00:00', '2015-04-05 17:00:00', 1),
(28, 'Loco Royale Zondag 17:00', 18, 16, '2015-04-05 17:00:00', '2015-04-05 18:20:00', 1),
(29, 'ParkPop UB40', 20, 17, '2015-06-28 00:00:00', '2015-06-28 00:00:00', 0),
(30, 'ParkPop 2015 de Dijk', 20, 18, '2015-06-28 00:00:00', '2015-06-28 00:00:00', 0),
(31, 'Hardwell - A''dam', 21, 27, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(32, 'Afrojack - A''dam', 21, 19, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(33, 'Armin - A''dam', 21, 26, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(34, 'Nicky Romero - A''dam', 21, 24, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(35, 'Nicky Romero - Rot''dam', 21, 24, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(36, 'Afrojack - Rot''dam', 21, 19, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(37, 'Showtek -Eindhoven', 21, 19, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0),
(38, 'Afrojack - Eindhoven', 21, 19, '2015-05-30 00:00:00', '2015-05-30 00:00:00', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
