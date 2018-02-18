-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 12, 2016 at 06:40 PM
-- Server version: 5.5.50
-- PHP Version: 5.4.45-0+deb7u4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `WebDiP2015x030`
--

-- --------------------------------------------------------

--
-- Table structure for table `dnevnik`
--

CREATE TABLE IF NOT EXISTS `dnevnik` (
  `radnja_id` int(11) NOT NULL AUTO_INCREMENT,
  `vrijeme` datetime NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `tip_radnje_id` int(11) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`radnja_id`),
  KEY `fk_dnevnik_korisnici1_idx` (`korisnik_id`),
  KEY `fk_dnevnik_tip_radnje1_idx` (`tip_radnje_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=415 ;

--
-- Dumping data for table `dnevnik`
--

INSERT INTO `dnevnik` (`radnja_id`, `vrijeme`, `korisnik_id`, `opis`, `tip_radnje_id`, `obrisan`) VALUES
(6, '2016-09-01 01:52:12', 4, 'Korisnik je blokiran', 4, 0),
(7, '2016-09-01 01:55:09', 4, 'Korisnik se prijavio u sustav', 1, 0),
(8, '2016-09-01 01:56:39', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(9, '2016-09-01 02:08:17', 4, 'Korisnik se prijavio u sustav', 1, 0),
(10, '2016-09-01 23:38:53', 4, 'Korisnik se prijavio u sustav', 1, 0),
(11, '2016-09-02 00:19:56', 4, 'Korisnik se prijavio u sustav', 1, 0),
(12, '2016-09-02 23:43:40', 4, 'Korisnik se prijavio u sustav', 1, 0),
(13, '2016-09-03 17:29:31', 4, 'Korisnik se prijavio u sustav', 1, 0),
(14, '2016-09-03 21:04:15', 4, 'Korisnik se prijavio u sustav', 1, 0),
(15, '2016-09-03 21:55:44', 4, 'Korisnik se prijavio u sustav', 1, 0),
(16, '2016-09-03 23:30:35', 4, 'Korisnik se prijavio u sustav', 1, 0),
(17, '2016-09-04 01:17:40', 4, 'Korisnik se prijavio u sustav', 1, 0),
(18, '2016-09-04 13:25:14', 4, 'Korisnik se prijavio u sustav', 1, 0),
(19, '2016-09-04 17:51:18', 4, 'Korisnik se prijavio u sustav', 1, 0),
(20, '2016-09-04 19:11:02', 4, 'Korisnik se prijavio u sustav', 1, 0),
(21, '2016-09-04 22:44:12', 4, 'Korisnik se prijavio u sustav', 1, 0),
(22, '2016-09-04 23:43:36', 4, 'Korisnik se prijavio u sustav', 1, 0),
(23, '2016-09-05 01:07:56', 4, 'Korisnik se prijavio u sustav', 1, 0),
(24, '2016-09-05 01:08:24', 4, 'Ažuriranje dvorane', 2, 0),
(25, '2016-09-05 02:47:38', 4, 'Korisnik se prijavio u sustav', 1, 0),
(26, '2016-09-05 02:54:40', 4, 'Korisnik se prijavio u sustav', 1, 0),
(27, '2016-09-05 18:34:09', 4, 'Korisnik se prijavio u sustav', 1, 0),
(28, '2016-09-05 20:35:23', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(29, '2016-09-05 20:35:53', 4, 'Korisnik se prijavio u sustav', 1, 0),
(30, '2016-09-06 21:35:40', 4, 'Korisnik se prijavio u sustav', 1, 0),
(31, '2016-09-09 21:22:47', 4, 'Korisnik se prijavio u sustav', 1, 0),
(32, '2016-09-10 21:08:51', 4, 'Korisnik se prijavio u sustav', 1, 0),
(33, '2016-09-10 22:30:07', 4, 'Korisnik se prijavio u sustav', 1, 0),
(34, '2016-09-11 14:32:17', 4, 'Korisnik se prijavio u sustav', 1, 0),
(35, '2016-09-11 15:14:39', 4, 'Korisnik se prijavio u sustav', 1, 0),
(36, '2016-09-11 21:34:29', 4, 'index.php', 3, 0),
(37, '2016-09-11 21:34:36', 4, 'lokacije.php', 3, 0),
(38, '2016-09-11 21:34:37', 4, 'korisnik_filmovi.php', 3, 0),
(39, '2016-09-11 21:34:41', 4, 'moderator_filmovi.php', 3, 0),
(40, '2016-09-11 21:35:18', 4, 'moderator_projekcije.php', 3, 0),
(41, '2016-09-11 21:35:21', 4, 'moderator_rezervacije.php', 3, 0),
(42, '2016-09-11 21:35:23', 4, 'moderator_ulaznice.php', 3, 0),
(43, '2016-09-11 21:35:24', 4, 'moderator_statistika.php', 3, 0),
(44, '2016-09-11 21:35:25', 4, 'moderator_filmovi.php', 3, 0),
(45, '2016-09-11 21:36:11', 4, 'moderator_filmovi.php', 3, 0),
(46, '2016-09-11 21:36:14', 4, 'moderator_filmovi.php', 3, 0),
(47, '2016-09-11 21:36:16', 4, 'moderator_projekcije.php', 3, 0),
(48, '2016-09-11 21:36:16', 4, 'moderator_rezervacije.php', 3, 0),
(49, '2016-09-11 21:36:17', 4, 'moderator_ulaznice.php', 3, 0),
(50, '2016-09-11 21:36:18', 4, 'moderator_statistika.php', 3, 0),
(51, '2016-09-11 21:36:20', 4, 'moderator_filmovi.php', 3, 0),
(52, '2016-09-11 21:36:20', 4, 'admin_lokacije.php', 3, 0),
(53, '2016-09-11 21:36:22', 4, 'admin_lokacije.php', 3, 0),
(54, '2016-09-11 21:36:22', 4, 'admin_dvorane.php', 3, 0),
(55, '2016-09-11 21:36:24', 4, 'admin_korisnici.php', 3, 0),
(56, '2016-09-11 21:36:25', 4, 'admin_statistika.php', 3, 0),
(57, '2016-09-11 21:36:28', 4, 'admin_dnevnik.php', 3, 0),
(58, '2016-09-11 21:37:43', 4, 'admin_statistika.php', 3, 0),
(59, '2016-09-11 21:39:43', 4, 'index.php', 3, 0),
(60, '2016-09-11 22:47:46', 4, 'Korisnik se prijavio u sustav', 1, 0),
(61, '2016-09-11 22:47:46', 4, 'admin_lokacije.php', 3, 0),
(62, '2016-09-11 22:47:50', 4, 'admin_lokacije.php', 3, 0),
(63, '2016-09-11 22:47:52', 4, 'admin_statistika.php', 3, 0),
(64, '2016-09-11 22:48:37', 4, 'admin_statistika.php', 3, 0),
(65, '2016-09-11 22:48:49', 4, 'admin_statistika.php', 3, 0),
(66, '2016-09-11 22:49:01', 4, 'admin_dnevnik.php', 3, 0),
(67, '2016-09-11 22:50:35', 4, 'index.php', 3, 0),
(68, '2016-09-11 22:50:36', 4, 'moderator_filmovi.php', 3, 0),
(69, '2016-09-11 22:53:07', 4, 'moderator_filmovi.php', 3, 0),
(70, '2016-09-11 23:19:43', 4, 'index.php', 3, 0),
(71, '2016-09-11 23:19:45', 4, 'korisnik_rezervacije.php', 3, 0),
(72, '2016-09-11 23:19:46', 4, 'moderator_filmovi.php', 3, 0),
(73, '2016-09-11 23:19:46', 4, 'admin_lokacije.php', 3, 0),
(74, '2016-09-11 23:38:10', 4, 'index.php', 3, 0),
(75, '2016-09-11 23:54:56', 4, 'index.php', 3, 0),
(76, '2016-09-12 00:02:21', 4, 'index.php', 3, 0),
(77, '2016-09-12 00:02:23', 4, 'korisnik_rezervacije.php', 3, 0),
(78, '2016-09-12 00:02:25', 4, 'korisnik_rezervacije.php', 3, 0),
(79, '2016-09-12 00:02:26', 4, 'korisnik_odobreno.php', 3, 0),
(80, '2016-09-12 00:02:30', 4, 'moderator_filmovi.php', 3, 0),
(81, '2016-09-12 00:02:33', 4, 'index.php', 3, 0),
(82, '2016-09-12 00:14:50', 4, 'index.php', 3, 0),
(83, '2016-09-12 00:15:00', 4, 'lokacije.php', 3, 0),
(84, '2016-09-12 00:15:01', 4, 'korisnik_filmovi.php', 3, 0),
(85, '2016-09-12 00:15:04', 4, 'korisnik_rezervacije.php', 3, 0),
(86, '2016-09-12 00:15:05', 4, 'moderator_filmovi.php', 3, 0),
(87, '2016-09-12 00:15:06', 4, 'admin_lokacije.php', 3, 0),
(88, '2016-09-12 00:15:08', 4, 'index.php', 3, 0),
(89, '2016-09-12 00:48:34', 4, 'index.php', 3, 0),
(90, '2016-09-12 00:49:07', 4, 'index.php', 3, 0),
(91, '2016-09-12 00:51:03', 4, 'index.php', 3, 0),
(92, '2016-09-12 00:51:09', 4, 'index.php', 3, 0),
(93, '2016-09-12 00:51:14', 4, 'index.php', 3, 0),
(94, '2016-09-12 00:51:32', 4, 'index.php', 3, 0),
(95, '2016-09-12 00:51:36', 4, 'index.php', 3, 0),
(96, '2016-09-12 00:52:32', 4, 'index.php', 3, 0),
(97, '2016-09-12 00:52:50', 4, 'index.php', 3, 0),
(98, '2016-09-12 00:53:18', 4, 'korisnik_filmovi.php', 3, 0),
(99, '2016-09-12 00:53:19', 4, 'lokacije.php', 3, 0),
(100, '2016-09-12 00:53:22', 4, 'korisnik_rezervacije.php', 3, 0),
(101, '2016-09-12 00:53:23', 4, 'moderator_filmovi.php', 3, 0),
(102, '2016-09-12 00:53:28', 4, 'index.php', 3, 0),
(103, '2016-09-12 00:53:54', 4, 'index.php', 3, 0),
(104, '2016-09-12 00:54:18', 4, 'index.php', 3, 0),
(105, '2016-09-12 00:54:51', 4, 'index.php', 3, 0),
(106, '2016-09-12 00:56:42', 4, 'index.php', 3, 0),
(107, '2016-09-12 00:57:03', 4, 'index.php', 3, 0),
(108, '2016-09-12 00:57:21', 4, 'admin_lokacije.php', 3, 0),
(109, '2016-09-12 00:57:23', 4, 'moderator_filmovi.php', 3, 0),
(110, '2016-09-12 00:57:24', 4, 'korisnik_rezervacije.php', 3, 0),
(111, '2016-09-12 00:57:25', 4, 'index.php', 3, 0),
(112, '2016-09-12 01:09:57', 4, 'index.php', 3, 0),
(113, '2016-09-12 01:10:48', 4, 'index.php', 3, 0),
(114, '2016-09-12 01:11:02', 4, 'index.php', 3, 0),
(115, '2016-09-12 01:18:25', 4, 'lokacije.php', 3, 0),
(116, '2016-09-12 01:18:35', 4, 'index.php', 3, 0),
(117, '2016-09-12 01:18:44', 4, 'index.php', 3, 0),
(118, '2016-09-12 01:31:37', 4, 'index.php', 3, 0),
(119, '2016-09-12 01:36:48', 4, 'index.php', 3, 0),
(120, '2016-09-12 01:36:53', 4, 'korisnik_filmovi.php', 3, 0),
(121, '2016-09-12 01:36:58', 4, 'index.php', 3, 0),
(122, '2016-09-12 01:37:01', 4, 'moderator_filmovi.php', 3, 0),
(123, '2016-09-12 01:37:08', 4, 'moderator_projekcije.php', 3, 0),
(124, '2016-09-12 01:37:11', 4, 'moderator_rezervacije.php', 3, 0),
(125, '2016-09-12 01:37:13', 4, 'moderator_ulaznice.php', 3, 0),
(126, '2016-09-12 01:37:14', 4, 'moderator_statistika.php', 3, 0),
(127, '2016-09-12 01:38:33', 4, 'index.php', 3, 0),
(128, '2016-09-12 01:38:38', 4, 'lokacije.php', 3, 0),
(129, '2016-09-12 01:38:40', 4, 'korisnik_filmovi.php', 3, 0),
(130, '2016-09-12 01:38:43', 4, 'index.php', 3, 0),
(131, '2016-09-12 01:38:45', 4, 'moderator_filmovi.php', 3, 0),
(132, '2016-09-12 01:38:47', 4, 'admin_lokacije.php', 3, 0),
(133, '2016-09-12 01:38:52', 4, 'admin_postavke.php', 3, 0),
(134, '2016-09-12 01:38:53', 4, 'admin_dnevnik.php', 3, 0),
(135, '2016-09-12 01:38:57', 4, 'admin_statistika.php', 3, 0),
(136, '2016-09-12 01:38:58', 4, 'admin_korisnici.php', 3, 0),
(137, '2016-09-12 01:39:00', 4, 'admin_dvorane.php', 3, 0),
(138, '2016-09-12 01:39:01', 4, 'admin_lokacije.php', 3, 0),
(139, '2016-09-12 01:57:05', 4, 'index.php', 3, 0),
(140, '2016-09-12 02:07:22', 4, 'index.php', 3, 0),
(141, '2016-09-12 02:07:25', 4, 'moderator_filmovi.php', 3, 0),
(142, '2016-09-12 02:07:26', 4, 'moderator_statistika.php', 3, 0),
(143, '2016-09-12 02:12:01', 4, 'moderator_statistika.php', 3, 0),
(144, '2016-09-12 02:13:20', 4, 'index.php', 3, 0),
(145, '2016-09-12 02:13:50', 4, 'moderator_filmovi.php', 3, 0),
(146, '2016-09-12 02:13:55', 4, 'moderator_filmovi.php', 3, 0),
(147, '2016-09-12 02:13:56', 4, 'moderator_statistika.php', 3, 0),
(148, '2016-09-12 02:15:34', 4, 'moderator_filmovi.php', 3, 0),
(149, '2016-09-12 02:15:35', 4, 'moderator_statistika.php', 3, 0),
(150, '2016-09-12 02:15:39', 4, 'index.php', 3, 0),
(151, '2016-09-12 02:15:42', 4, 'admin_lokacije.php', 3, 0),
(152, '2016-09-12 02:15:47', 4, 'moderator_filmovi.php', 3, 0),
(153, '2016-09-12 02:15:48', 4, 'moderator_statistika.php', 3, 0),
(154, '2016-09-12 02:16:51', 4, 'index.php', 3, 0),
(155, '2016-09-12 02:23:19', 4, 'moderator_filmovi.php', 3, 0),
(156, '2016-09-12 02:23:21', 4, 'moderator_statistika.php', 3, 0),
(157, '2016-09-12 02:30:22', 4, 'moderator_statistika.php', 3, 0),
(158, '2016-09-12 02:30:32', 4, 'moderator_statistika.php', 3, 0),
(159, '2016-09-12 02:32:06', 4, 'moderator_statistika.php', 3, 0),
(160, '2016-09-12 02:32:33', 4, 'moderator_statistika.php', 3, 0),
(161, '2016-09-12 02:36:11', 4, 'moderator_statistika.php', 3, 0),
(162, '2016-09-12 02:37:24', 4, 'moderator_statistika.php', 3, 0),
(163, '2016-09-12 02:37:35', 4, 'moderator_statistika.php', 3, 0),
(164, '2016-09-12 02:38:59', 4, 'index.php', 3, 0),
(165, '2016-09-12 09:31:42', 4, 'Korisnik se prijavio u sustav', 1, 0),
(166, '2016-09-12 09:31:42', 4, 'admin_lokacije.php', 3, 0),
(167, '2016-09-12 09:31:52', 4, 'moderator_filmovi.php', 3, 0),
(168, '2016-09-12 09:31:53', 4, 'moderator_statistika.php', 3, 0),
(169, '2016-09-12 09:32:41', 4, 'admin_lokacije.php', 3, 0),
(170, '2016-09-12 09:32:44', 4, 'admin_statistika.php', 3, 0),
(171, '2016-09-12 12:35:37', 4, 'Korisnik se prijavio u sustav', 1, 0),
(172, '2016-09-12 12:35:37', 4, 'admin_lokacije.php', 3, 0),
(173, '2016-09-12 12:35:40', 4, 'admin_statistika.php', 3, 0),
(174, '2016-09-12 12:39:36', 4, 'admin_statistika.php', 3, 0),
(175, '2016-09-12 12:43:06', 4, 'admin_statistika.php', 3, 0),
(176, '2016-09-12 12:44:28', 4, 'admin_statistika.php', 3, 0),
(177, '2016-09-12 12:50:58', 4, 'admin_statistika.php', 3, 0),
(178, '2016-09-12 12:52:37', 4, 'admin_dnevnik.php', 3, 0),
(179, '2016-09-12 12:52:58', 4, 'moderator_filmovi.php', 3, 0),
(180, '2016-09-12 12:53:05', 4, 'moderator_statistika.php', 3, 0),
(181, '2016-09-12 12:54:30', 4, 'moderator_statistika.php', 3, 0),
(182, '2016-09-12 12:56:29', 4, 'moderator_projekcije.php', 3, 0),
(183, '2016-09-12 13:06:53', 4, 'moderator_projekcije.php', 3, 0),
(184, '2016-09-12 13:06:55', 4, 'moderator_statistika.php', 3, 0),
(185, '2016-09-12 13:08:08', 4, 'moderator_statistika.php', 3, 0),
(186, '2016-09-12 13:20:58', 4, 'moderator_statistika.php', 3, 0),
(187, '2016-09-12 13:23:29', 4, 'moderator_statistika.php', 3, 0),
(188, '2016-09-12 13:25:57', 4, 'moderator_statistika.php', 3, 0),
(189, '2016-09-12 13:27:16', 4, 'moderator_statistika.php', 3, 0),
(190, '2016-09-12 13:29:49', 4, 'moderator_statistika.php', 3, 0),
(191, '2016-09-12 13:30:18', 4, 'moderator_projekcije.php', 3, 0),
(192, '2016-09-12 13:40:42', 4, 'moderator_projekcije.php', 3, 0),
(193, '2016-09-12 13:42:22', 4, 'moderator_projekcije.php', 3, 0),
(194, '2016-09-12 13:43:53', 4, 'moderator_projekcije.php', 3, 0),
(195, '2016-09-12 13:47:50', 4, 'moderator_projekcije.php', 3, 0),
(196, '2016-09-12 13:48:12', 4, 'moderator_projekcije.php', 3, 0),
(197, '2016-09-12 13:49:33', 4, 'moderator_projekcije.php', 3, 0),
(198, '2016-09-12 13:51:22', 4, 'moderator_projekcije.php', 3, 0),
(199, '2016-09-12 13:52:34', 4, 'moderator_projekcije.php', 3, 0),
(200, '2016-09-12 13:54:37', 4, 'korisnik_rezervacije.php', 3, 0),
(201, '2016-09-12 13:55:04', 4, 'korisnik_filmovi.php', 3, 0),
(202, '2016-09-12 13:56:02', 4, 'moderator_filmovi.php', 3, 0),
(203, '2016-09-12 13:56:03', 4, 'moderator_rezervacije.php', 3, 0),
(204, '2016-09-12 13:57:44', 4, 'admin_lokacije.php', 3, 0),
(205, '2016-09-12 13:57:45', 4, 'admin_postavke.php', 3, 0),
(206, '2016-09-12 13:57:47', 4, 'admin_lokacije.php', 3, 0),
(207, '2016-09-12 14:00:27', 4, 'moderator_filmovi.php', 3, 0),
(208, '2016-09-12 14:00:31', 4, 'moderator_projekcije.php', 3, 0),
(209, '2016-09-12 14:04:29', 4, 'moderator_projekcije.php', 3, 0),
(210, '2016-09-12 14:12:09', 4, 'moderator_projekcije.php', 3, 0),
(211, '2016-09-12 14:18:22', 4, 'moderator_projekcije.php', 3, 0),
(212, '2016-09-12 14:20:08', 4, 'moderator_projekcije.php', 3, 0),
(213, '2016-09-12 14:23:28', 4, 'moderator_projekcije.php', 3, 0),
(214, '2016-09-12 14:24:15', 4, 'moderator_projekcije.php', 3, 0),
(215, '2016-09-12 14:26:05', 4, 'moderator_projekcije.php', 3, 0),
(216, '2016-09-12 14:26:34', 4, 'index.php', 3, 0),
(217, '2016-09-12 14:29:04', 4, 'korisnik_filmovi.php', 3, 0),
(218, '2016-09-12 14:29:08', 4, 'korisnik_filmovi.php', 3, 0),
(219, '2016-09-12 14:39:13', 4, 'index.php', 3, 0),
(220, '2016-09-12 14:39:18', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(221, '2016-09-12 14:51:47', 4, 'Korisnik se prijavio u sustav', 1, 0),
(222, '2016-09-12 14:51:47', 4, 'admin_lokacije.php', 3, 0),
(223, '2016-09-12 14:51:53', 4, 'admin_postavke.php', 3, 0),
(224, '2016-09-12 14:51:55', 4, 'admin_dnevnik.php', 3, 0),
(225, '2016-09-12 15:45:11', 4, 'Korisnik se prijavio u sustav', 1, 0),
(226, '2016-09-12 15:45:11', 4, 'admin_lokacije.php', 3, 0),
(227, '2016-09-12 15:47:19', 4, 'korisnik_rezervacije.php', 3, 0),
(228, '2016-09-12 15:48:29', 4, 'korisnik_odobreno.php', 3, 0),
(229, '2016-09-12 15:51:04', 4, 'lokacije.php', 3, 0),
(230, '2016-09-12 15:53:01', 4, 'index.php', 3, 0),
(231, '2016-09-12 15:53:02', 4, 'moderator_filmovi.php', 3, 0),
(232, '2016-09-12 15:55:19', 4, 'admin_lokacije.php', 3, 0),
(233, '2016-09-12 16:25:38', 4, 'index.php', 3, 0),
(234, '2016-09-12 16:32:12', 4, 'index.php', 3, 0),
(235, '2016-09-12 16:32:16', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(236, '2016-09-12 16:32:25', 37, 'Korisnik se prijavio u sustav', 1, 0),
(237, '2016-09-12 16:32:25', 37, 'korisnik_rezervacije.php', 3, 0),
(238, '2016-09-12 16:32:27', 37, 'index.php', 3, 0),
(239, '2016-09-12 16:32:28', 37, 'korisnik_rezervacije.php', 3, 0),
(240, '2016-09-12 16:32:35', 37, 'korisnik_odobreno.php', 3, 0),
(241, '2016-09-12 16:32:38', 37, 'korisnik_rezervacije.php', 3, 0),
(242, '2016-09-12 16:32:39', 37, 'lokacije.php', 3, 0),
(243, '2016-09-12 16:32:41', 37, 'korisnik_filmovi.php', 3, 0),
(244, '2016-09-12 16:32:45', 37, 'index.php', 3, 0),
(245, '2016-09-12 16:32:46', 37, 'korisnik_rezervacije.php', 3, 0),
(246, '2016-09-12 16:34:13', 37, 'korisnik_rezervacije.php', 3, 0),
(247, '2016-09-12 16:37:01', 37, 'korisnik_rezervacije.php', 3, 0),
(248, '2016-09-12 16:37:08', 37, 'Korisnik se odjavio iz sustava', 1, 0),
(249, '2016-09-12 16:37:17', 4, 'Korisnik se prijavio u sustav', 1, 0),
(250, '2016-09-12 16:37:17', 4, 'admin_lokacije.php', 3, 0),
(251, '2016-09-12 16:37:31', 4, 'moderator_filmovi.php', 3, 0),
(252, '2016-09-12 16:37:32', 4, 'moderator_projekcije.php', 3, 0),
(253, '2016-09-12 16:37:38', 4, 'korisnik_rezervacije.php', 3, 0),
(254, '2016-09-12 16:37:44', 4, 'korisnik_odobreno.php', 3, 0),
(255, '2016-09-12 16:37:45', 4, 'moderator_filmovi.php', 3, 0),
(256, '2016-09-12 16:37:48', 4, 'moderator_rezervacije.php', 3, 0),
(257, '2016-09-12 16:39:02', 4, 'moderator_rezervacije.php', 3, 0),
(258, '2016-09-12 16:39:53', 4, 'lokacije.php', 3, 0),
(259, '2016-09-12 16:39:54', 4, 'korisnik_filmovi.php', 3, 0),
(260, '2016-09-12 16:40:07', 4, 'korisnik_rezervacije.php', 3, 0),
(261, '2016-09-12 16:42:33', 4, 'korisnik_rezervacije.php', 3, 0),
(262, '2016-09-12 16:42:54', 4, 'index.php', 3, 0),
(263, '2016-09-12 17:11:11', 4, 'Korisnik se prijavio u sustav', 1, 0),
(264, '2016-09-12 17:11:12', 4, 'admin_lokacije.php', 3, 0),
(265, '2016-09-12 17:11:25', 4, 'moderator_filmovi.php', 3, 0),
(266, '2016-09-12 17:11:27', 4, 'admin_lokacije.php', 3, 0),
(267, '2016-09-12 17:11:32', 4, 'admin_korisnici.php', 3, 0),
(268, '2016-09-12 17:11:33', 4, 'admin_dvorane.php', 3, 0),
(269, '2016-09-12 17:11:36', 4, 'moderator_filmovi.php', 3, 0),
(270, '2016-09-12 17:11:37', 4, 'moderator_filmovi.php', 3, 0),
(271, '2016-09-12 17:11:37', 4, 'moderator_projekcije.php', 3, 0),
(272, '2016-09-12 17:12:01', 4, 'moderator_projekcije.php', 3, 0),
(273, '2016-09-12 17:12:12', 4, 'moderator_projekcije.php', 3, 0),
(274, '2016-09-12 17:12:41', 4, 'moderator_projekcije.php', 3, 0),
(275, '2016-09-12 17:14:13', 4, 'moderator_projekcije.php', 3, 0),
(276, '2016-09-12 17:15:11', 4, 'moderator_filmovi.php', 3, 0),
(277, '2016-09-12 17:15:14', 4, 'korisnik_rezervacije.php', 3, 0),
(278, '2016-09-12 17:15:18', 4, 'moderator_filmovi.php', 3, 0),
(279, '2016-09-12 17:15:19', 4, 'moderator_projekcije.php', 3, 0),
(280, '2016-09-12 17:15:32', 4, 'moderator_projekcije.php', 3, 0),
(281, '2016-09-12 17:15:58', 4, 'moderator_rezervacije.php', 3, 0),
(282, '2016-09-12 17:16:21', 4, 'moderator_projekcije.php', 3, 0),
(283, '2016-09-12 17:16:22', 4, 'moderator_rezervacije.php', 3, 0),
(284, '2016-09-12 17:16:24', 4, 'moderator_ulaznice.php', 3, 0),
(285, '2016-09-12 17:16:25', 4, 'moderator_statistika.php', 3, 0),
(286, '2016-09-12 17:16:31', 4, 'korisnik_filmovi.php', 3, 0),
(287, '2016-09-12 17:16:37', 4, 'korisnik_rezervacije.php', 3, 0),
(288, '2016-09-12 17:16:40', 4, 'index.php', 3, 0),
(289, '2016-09-12 17:23:08', 4, 'Korisnik se prijavio u sustav', 1, 0),
(290, '2016-09-12 17:23:08', 4, 'admin_lokacije.php', 3, 0),
(291, '2016-09-12 17:23:10', 4, 'admin_postavke.php', 3, 0),
(292, '2016-09-12 17:23:20', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(293, '2016-09-12 17:23:27', 37, 'Korisnik se prijavio u sustav', 1, 0),
(294, '2016-09-12 17:23:27', 37, 'korisnik_rezervacije.php', 3, 0),
(295, '2016-09-12 17:23:52', 37, 'lokacije.php', 3, 0),
(296, '2016-09-12 17:25:23', 4, 'admin_postavke.php', 3, 0),
(297, '2016-09-12 19:25:30', 4, 'admin_postavke.php', 3, 0),
(298, '2016-09-14 17:25:53', 4, 'admin_postavke.php', 3, 0),
(299, '2016-09-14 17:25:57', 37, 'index.php', 3, 0),
(300, '2016-09-10 15:29:04', 4, 'index.php', 3, 0),
(301, '2016-09-10 15:29:09', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(302, '2016-09-10 15:33:00', 4, 'Korisnik se prijavio u sustav', 1, 0),
(303, '2016-09-10 15:33:00', 4, 'admin_lokacije.php', 3, 0),
(304, '2016-09-10 15:33:02', 4, 'admin_lokacije.php', 3, 0),
(305, '2016-09-10 15:33:03', 4, 'admin_postavke.php', 3, 0),
(306, '2016-09-13 23:33:32', 4, 'admin_postavke.php', 3, 0),
(307, '2016-09-11 11:33:53', 4, 'admin_postavke.php', 3, 0),
(308, '2016-09-13 13:34:06', 4, 'admin_postavke.php', 3, 0),
(309, '2016-09-12 21:34:13', 4, 'admin_postavke.php', 3, 0),
(310, '2016-09-12 12:34:35', 4, 'admin_postavke.php', 3, 0),
(311, '2016-09-12 12:34:56', 4, 'admin_postavke.php', 3, 0),
(312, '2016-09-12 18:35:01', 4, 'admin_postavke.php', 3, 0),
(313, '2016-09-12 18:38:49', 37, 'index.php', 3, 0),
(314, '2016-09-12 18:38:56', 4, 'index.php', 3, 0),
(315, '2016-09-12 18:39:44', 4, 'admin_lokacije.php', 3, 0),
(316, '2016-09-12 18:39:45', 4, 'admin_postavke.php', 3, 0),
(317, '2016-09-12 18:40:44', 37, 'Korisnik se odjavio iz sustava', 1, 0),
(318, '2016-09-12 18:48:03', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(319, '2016-09-12 18:49:35', 39, 'Korisnik se prijavio u sustav', 1, 0),
(320, '2016-09-12 18:49:35', 39, 'korisnik_rezervacije.php', 3, 0),
(321, '2016-09-12 18:49:39', 39, 'Korisnik se odjavio iz sustava', 1, 0),
(322, '2016-09-12 18:50:00', 39, 'Korisnik je blokiran', 4, 0),
(323, '2016-09-12 18:50:37', 4, 'Korisnik se prijavio u sustav', 1, 0),
(324, '2016-09-12 18:50:37', 4, 'admin_lokacije.php', 3, 0),
(325, '2016-09-12 18:50:39', 4, 'admin_korisnici.php', 3, 0),
(326, '2016-09-12 18:50:59', 4, 'korisnik_rezervacije.php', 3, 0),
(327, '2016-09-12 18:51:23', 4, 'Korisnik se odjavio iz sustava', 1, 0),
(328, '2016-09-12 18:51:30', 5, 'Korisnik se prijavio u sustav', 1, 0),
(329, '2016-09-12 18:51:30', 5, 'moderator_filmovi.php', 3, 0),
(330, '2016-09-12 18:51:41', 5, 'moderator_filmovi.php', 3, 0),
(331, '2016-09-12 18:51:50', 5, 'Korisnik se odjavio iz sustava', 1, 0),
(332, '2016-09-12 18:52:15', 7, 'Korisnik se prijavio u sustav', 1, 0),
(333, '2016-09-12 18:52:15', 7, 'korisnik_rezervacije.php', 3, 0),
(334, '2016-09-12 18:53:29', 7, 'korisnik_filmovi.php', 3, 0),
(335, '2016-09-12 18:54:55', 7, 'korisnik_rezervacije.php', 3, 0),
(336, '2016-09-12 18:54:57', 7, 'korisnik_filmovi.php', 3, 0),
(337, '2016-09-12 18:55:17', 7, 'index.php', 3, 0),
(338, '2016-09-12 18:55:53', 4, 'Korisnik se prijavio u sustav', 1, 0),
(339, '2016-09-12 18:55:54', 4, 'admin_lokacije.php', 3, 0),
(340, '2016-09-12 18:56:02', 4, 'admin_dvorane.php', 3, 0),
(341, '2016-09-12 18:56:08', 4, 'moderator_filmovi.php', 3, 0),
(342, '2016-09-12 18:56:09', 4, 'moderator_projekcije.php', 3, 0),
(343, '2016-09-12 18:56:22', 4, 'admin_lokacije.php', 3, 0),
(344, '2016-09-12 18:56:23', 4, 'admin_dvorane.php', 3, 0),
(345, '2016-09-12 18:56:28', 4, 'admin_dvorane.php', 3, 0),
(346, '2016-09-12 18:57:06', 7, 'korisnik_rezervacije.php', 3, 0),
(347, '2016-09-12 18:57:56', 4, 'moderator_filmovi.php', 3, 0),
(348, '2016-09-12 18:57:58', 4, 'moderator_rezervacije.php', 3, 0),
(349, '2016-09-12 18:59:04', 4, 'korisnik_rezervacije.php', 3, 0),
(350, '2016-09-12 19:00:36', 4, 'moderator_filmovi.php', 3, 0),
(351, '2016-09-12 19:00:38', 4, 'moderator_rezervacije.php', 3, 0),
(352, '2016-09-12 19:01:37', 4, 'moderator_rezervacije.php', 3, 0),
(353, '2016-09-12 19:02:17', 7, 'Korisnik se odjavio iz sustava', 1, 0),
(354, '2016-09-12 19:02:23', 5, 'Korisnik se prijavio u sustav', 1, 0),
(355, '2016-09-12 19:02:24', 5, 'moderator_filmovi.php', 3, 0),
(356, '2016-09-12 19:02:26', 5, 'korisnik_rezervacije.php', 3, 0),
(357, '2016-09-12 19:02:33', 5, 'Korisnik se odjavio iz sustava', 1, 0),
(358, '2016-09-12 19:03:55', 4, 'admin_lokacije.php', 3, 0),
(359, '2016-09-12 19:04:02', 4, 'lokacije.php', 3, 0),
(360, '2016-09-12 19:05:41', 4, 'admin_lokacije.php', 3, 0),
(361, '2016-09-12 19:05:44', 4, 'admin_korisnici.php', 3, 0),
(362, '2016-09-12 19:05:57', 4, 'admin_lokacije.php', 3, 0),
(363, '2016-09-12 19:07:10', 4, 'admin_lokacije.php', 3, 0),
(364, '2016-09-12 19:08:07', 4, 'admin_lokacije.php', 3, 0),
(365, '2016-09-12 19:08:42', 4, 'moderator_filmovi.php', 3, 0),
(366, '2016-09-12 19:08:49', 4, 'moderator_filmovi.php', 3, 0),
(367, '2016-09-12 19:08:50', 4, 'moderator_projekcije.php', 3, 0),
(368, '2016-09-12 19:09:42', 4, 'korisnik_rezervacije.php', 3, 0),
(369, '2016-09-12 19:10:33', 4, 'admin_lokacije.php', 3, 0),
(370, '2016-09-12 19:10:36', 4, 'admin_postavke.php', 3, 0),
(371, '2016-09-12 19:10:45', 4, 'korisnik_rezervacije.php', 3, 0),
(372, '2016-09-13 18:10:57', 4, 'admin_postavke.php', 3, 0),
(373, '2016-09-13 18:11:07', 4, 'korisnik_rezervacije.php', 3, 0),
(374, '2016-09-13 18:11:16', 4, 'korisnik_rezervacije.php', 3, 0),
(375, '2016-09-13 18:11:22', 4, 'admin_postavke.php', 3, 0),
(376, '2016-09-13 18:11:27', 4, 'admin_postavke.php', 3, 0),
(377, '2016-09-13 18:11:34', 4, 'admin_postavke.php', 3, 0),
(378, '2016-09-13 18:11:43', 4, 'admin_postavke.php', 3, 0),
(379, '2016-09-13 18:11:54', 4, 'admin_postavke.php', 3, 0),
(380, '2016-09-13 18:12:07', 4, 'admin_postavke.php', 3, 0),
(381, '2016-09-13 18:12:15', 4, 'admin_postavke.php', 3, 0),
(383, '2016-09-13 18:12:28', 4, 'Korisnik se prijavio u sustav', 1, 0),
(384, '2016-09-13 18:12:28', 4, 'admin_lokacije.php', 3, 0),
(385, '2016-09-13 18:12:30', 4, 'admin_lokacije.php', 3, 0),
(386, '2016-09-13 18:12:31', 4, 'admin_postavke.php', 3, 0),
(387, '2016-09-13 18:12:35', 4, 'admin_postavke.php', 3, 0),
(388, '2016-09-13 18:12:40', 4, 'admin_postavke.php', 3, 0),
(389, '2016-09-13 18:12:47', 4, 'admin_postavke.php', 3, 0),
(390, '2016-09-13 18:12:50', 4, 'korisnik_rezervacije.php', 3, 0),
(391, '2016-09-13 18:12:50', 4, 'moderator_filmovi.php', 3, 0),
(392, '2016-09-13 18:12:52', 4, 'moderator_rezervacije.php', 3, 0),
(393, '2016-09-13 18:12:58', 4, 'korisnik_rezervacije.php', 3, 0),
(394, '2016-09-13 18:13:00', 4, 'korisnik_odobreno.php', 3, 0),
(395, '2016-09-13 18:14:13', 4, 'admin_lokacije.php', 3, 0),
(396, '2016-09-13 18:14:15', 4, 'admin_postavke.php', 3, 0),
(397, '2016-09-13 18:14:20', 4, 'admin_postavke.php', 3, 0),
(398, '2016-09-13 18:14:22', 4, 'moderator_filmovi.php', 3, 0),
(399, '2016-09-13 18:14:28', 4, 'moderator_statistika.php', 3, 0),
(400, '2016-09-13 18:15:44', 4, 'admin_lokacije.php', 3, 0),
(401, '2016-09-13 18:15:47', 4, 'admin_statistika.php', 3, 0),
(402, '2016-09-13 18:18:04', 4, 'admin_dnevnik.php', 3, 0),
(403, '2016-09-13 18:18:37', 4, 'admin_statistika.php', 3, 0),
(404, '2016-09-13 18:18:50', 4, 'admin_postavke.php', 3, 0),
(405, '2016-09-13 18:18:51', 4, 'admin_dnevnik.php', 3, 0),
(406, '2016-09-13 18:18:52', 4, 'admin_statistika.php', 3, 0),
(407, '2016-09-13 18:18:54', 4, 'admin_korisnici.php', 3, 0),
(408, '2016-09-13 18:18:57', 4, 'admin_dvorane.php', 3, 0),
(409, '2016-09-13 18:19:04', 4, 'admin_postavke.php', 3, 0),
(410, '2016-09-13 18:19:12', 4, 'admin_dnevnik.php', 3, 0),
(411, '2016-09-13 18:30:07', 4, 'moderator_filmovi.php', 3, 0),
(412, '2016-09-13 18:30:09', 4, 'admin_lokacije.php', 3, 0),
(413, '2016-09-13 18:30:14', 4, 'korisnik_rezervacije.php', 3, 0),
(414, '2016-09-13 18:30:16', 4, 'korisnik_odobreno.php', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `drzave`
--

CREATE TABLE IF NOT EXISTS `drzave` (
  `drzava_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`drzava_id`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `drzave`
--

INSERT INTO `drzave` (`drzava_id`, `naziv`, `obrisan`) VALUES
(1, 'Austrija', 0),
(2, 'Australija', 0),
(3, 'Hrvatska', 0),
(4, 'Slovenija', 0),
(5, 'Španjolska', 0),
(6, 'Portugal', 0),
(7, 'Bosna i Hercegovina', 0),
(8, 'Srbija', 0),
(9, 'SAD', 0),
(10, 'Kanada', 0),
(11, 'Ujedinjeno Kraljevstvo', 0),
(12, 'Njemačka', 0),
(13, 'Francuska', 0),
(14, 'Jugoslavija', 0),
(15, 'Švedska', 0);

-- --------------------------------------------------------

--
-- Table structure for table `dvorane`
--

CREATE TABLE IF NOT EXISTS `dvorane` (
  `dvorana_id` int(11) NOT NULL AUTO_INCREMENT,
  `broj` int(11) NOT NULL,
  `broj_mjesta` int(11) NOT NULL,
  `lokacija_id` int(11) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dvorana_id`),
  KEY `fk_dvorane_lokacije1_idx` (`lokacija_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `dvorane`
--

INSERT INTO `dvorane` (`dvorana_id`, `broj`, `broj_mjesta`, `lokacija_id`, `obrisan`) VALUES
(1, 1, 40, 1, 0),
(2, 2, 150, 1, 0),
(5, 1, 55, 2, 0),
(6, 2, 200, 2, 0),
(7, 1, 100, 3, 0),
(8, 1, 100, 4, 0),
(9, 1, 80, 5, 0),
(10, 1, 120, 6, 0),
(11, 1, 100, 7, 0),
(12, 1, 110, 8, 0),
(13, 1, 80, 9, 0),
(14, 1, 90, 10, 0),
(15, 3, 130, 2, 1),
(16, 3, 120, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filmovi`
--

CREATE TABLE IF NOT EXISTS `filmovi` (
  `film_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `naziv_original` varchar(100) DEFAULT NULL,
  `zanr_id` int(11) NOT NULL,
  `drzava_id` int(11) NOT NULL,
  `redatelj` varchar(100) NOT NULL,
  `godina` int(11) NOT NULL,
  `uloge` varchar(500) NOT NULL,
  `opis` varchar(3000) NOT NULL,
  `trajanje` int(11) NOT NULL,
  `slika_id` int(11) DEFAULT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`film_id`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`),
  UNIQUE KEY `naziv_original_UNIQUE` (`naziv_original`),
  UNIQUE KEY `slika_id_UNIQUE` (`slika_id`),
  KEY `fk_filmovi_drzave1_idx` (`drzava_id`),
  KEY `fk_filmovi_zanrovi1_idx` (`zanr_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `filmovi`
--

INSERT INTO `filmovi` (`film_id`, `naziv`, `naziv_original`, `zanr_id`, `drzava_id`, `redatelj`, `godina`, `uloge`, `opis`, `trajanje`, `slika_id`, `obrisan`) VALUES
(1, 'Daleki rođaci: revolucija', 'Les Visiteurs: La Révolution', 4, 13, 'Jean-Marie Poiré', 2016, 'Jean Reno, Christian Clavier, Franck Dubosc, Karin Viard', 'Dvadeset i tri godine nakon prvog, a osamnaest godina nakon drugog dijela, dolazi nam treći nastavak popularne trilogije Daleki rođaci! Ovi vremenski putnici našli su se usred Francuske revolucije i ponovno uspjeli upasti u nevolje.', 110, 12, 0),
(2, 'Susjedi iz pakla', 'Neighbors 2 Sorority Rising', 4, 9, 'Nicholas Stoller', 2016, 'Seth Rogen, Zac Efron, Rose Byrne, Chloë Grace Moretz', 'Sad, kada Mac i Kelly čekaju drugo dijete, napokon su spremni napustiti predgrađe. No, baš kada se odluče prodati kuću, otkriju da su im nove susjede, cure iz sestrinstva. Umorne od strogog školskog režima, cure iz sestrinstva Kappa Nu, odluče se preseliti daleko od kampusa, gdje će moći raditi što god požele. Kada Shelby (Moretz) i njezine sestre pronađu savršenu kuću, činjenica što se nalazi u mirnom obiteljskom kvartu, neće ih spriječiti da organiziraju još luđe tulume od svojih prethodnika iz bratstva. Kada Mac i Kelly shvate da ne mogu izaći na kraj s novim susjedama u pomoć pozivaju Teddyja (Zac Efron), nadajući se da će ih on uspjeti otjerati. Ako njihovi susjedi misle da će se one predati lako bez borbe, onda su ozbiljno podcijenili žensku moć i njihovu domišljatost.', 91, 13, 0),
(3, 'Tajna služba', 'Central intelligence', 4, 9, 'Rawson Marshall Thurber', 2016, 'Dwayne Johnson, Kevin Hart, Aaron Paul, Amy Ryan', 'Priča prati CIA agenta (Johnson) koji dolazi kući na proslavu mature. Tvrdeći da radi na tajnom slučaju, traži pomoć svojeg jedinog prijatelja iz srednje škole (Hart), koji je nekada bio srednjoškolska sportska zvijezda a sada radi kao računovođa i žali za svim propuštenim prilikama koje je imao u životu. Nakon šta se ponovo ujedini sa svojim starim prijateljem preko Facebooka, računovođa je primamljen i neplanirano ulazi u svijet međunarodne špijunaže.', 120, 14, 0),
(4, 'Izdajnik po našem ukusu', 'Our kind of traitor', 17, 11, 'Susanna White', 2016, 'Damian Lewis, Ewan McGregor, Naomie Harris', 'Mladi profesor s Oxforda i njegova djevojka, odlaze na odmor na karipski otok Antiguu. Tamo upoznaju ruskog milijardera koji posjeduje otok i dijamantni sat. Ruski milijarder ih poziva odigraju partiju tenisa, ali - kao što to kod rusa obično biva - partija tenisa nikad nije samo ono što se čini.Prijedlog koji na rastanku dobiju od Rusa, čovjeka broj jedan za pranje novca ruskog kriminalnog podzemlja, odvest će ih na vrtoglavo putovanje od teniskih terena Roland Garrosa do luksuzne jahte, od sigurne kuće u švicarskim Alpama do najmračnijih zakutaka Londona i sumnjiva savezništva s britanskim obavještajnim agencijama.', 107, 16, 0),
(5, 'Ostavljeni', 'Desierto', 17, 7, 'Jonás Cuarón ', 2015, 'Gael García Bernal, Jeffrey Dean Morgan, Alondra Hidalgo', 'Moises (Gael García Bernal) s grupom imigranata putuje preko nečuvanog i kompliciranog dijela Sonorske pustinje, pokušavajući prijeći granicu u SAD. Iznenada začuju pucanj te im se pred očima stvori Sam (Jeffrey Dean Morgan), poremećeni  odmetnik koji granični zakon uzima u svoje ruke, pucajući u imigrante, jednog po jednog. Počinje mračna igra mačke i miša u kojoj Moises mora nadmudriti lovca da ne bi postao novom žrtvom ove puste zemlje. ', 94, NULL, 0),
(6, 'Pogled s neba', 'Eye in the sky', 7, 11, 'Gavin Hood ', 2016, 'Helen Mirren, Aaron Paul, Alan Rickman', 'Pukovnica, Katherine Powell (Mirren) vodi tajnu misiju hvatanja terorističke skupine koja živi u sigurnoj kući u Nairobiju, u Keniji. Kad Powell sazna da teroristička skupina planira provesti samoubilački napad, njezina misija je sada njihovo ubojstvo. Steve Watts pronalazi sigurnu kuću i priprema sve za njezino uništenje, ali tada shvati da se devetogodišnja djevojčica nalazi u njoj. Powell kontaktira političare i odvjetnike kako bi se odlučila što poduzeti.', 102, 17, 0),
(7, '11:14', '11:14', 17, 9, 'Greg Marcks', 2003, 'Rachael Leigh Cook, Henry Thomas, Blake Heron, Barbara Hershey, Clark Gregg, Patrick Swayze, Shawn Hatosy, Hilary Swank', 'The film involves a series of interconnected events that converge around two car-related accidents at 11:14 p.m.', 86, 15, 0),
(8, 'H-8', 'H-8', 1, 8, 'Nikola Tanhofer', 1958, 'Antun Vrdoljak, Boris Buzančić, Đurđa Ivezić', 'U noći 14. travnja 1957. godine na zagrebačkom autoputu se sudare autobus i tvornički kamion. Sudar je preticanjem uzrokovao nepoznati vozač koji odmah poslije toga hladnokrvno gasi svjetla i bježi, a da se nije ni osvrnuo. Ostatak filma prati događanja u autobusu i kamionu sve do same nesreće. Upoznajemo sudbine putnika autobusa - studentice klavira Alme Novak, novinara Borisa, njegovog kolege i prijatelja, propalog glumca Kreše Miljuša i njegove supruge, vozača Josipa Baraća, njegovog pomoćnika Janeza Pongraca i drugih. Istovremeno, pošiljku lima kamionom prevozi šofer Rudolf Knez, a prate ga njegov sin Vladimir i njegov poznanik iz zatvora Franjo Rosić, koji im se naknadno priključi. Istovremeno, pripovjedači zlokobno najavljuju skoru nesreću i brojeve sjedala poginulih putnika autobusa, a oni stalno mijenjaju sjedišta.', 105, NULL, 0),
(9, 'Superman', 'Superman - The movie', 8, 9, 'Richard Donner', 1978, 'Marlon Brando, Gene Hackman, Christopher Reeve, Margot Kidder', 'On the planet Krypton, using evidence provided by scientist Jor-El, the Ruling Council sentences attempted insurrectionists General Zod, Ursa, and Non to the Phantom Zone, for which Zod swears revenge on Jor-El and his family. Jor-El, despite his eminence, is unable to convince the Council that Krypton will soon be destroyed when its red supergiant sun goes supernova. To save his infant son, Kal-El, Jor-El launches a spacecraft containing him toward Earth, a planet with a suitable atmosphere where Kal-Els dense molecular structure will give him superhuman powers. Shortly after the launch, Kryptons sun explodes, destroying the planet.', 143, 18, 0),
(10, 'BFG: Blagi fantastični gorostas sink', 'The Big Friendly Giant', 2, 9, 'Steven Spielberg ', 2016, 'Duško Valentić, Gita Hajdarhodžić, Janko Popović Volarić, Duško Gojić, Urša Raukar, Ivana Krizmanić, Ivan Đuričić', 'BFG je uzbudljiva priča o desetogodišnjoj djevojčici Sophie iz Londona i misterioznom divu koji je upoznaje sa čudnovatim i opasnim svijetom divova. Film je temeljen na knjizi „BFG”, slavnog Roalda Dahla, koja je objavljena 1982. godine i od tada oduševljava čitatelje svih uzrasta. Knjiga, za koju je ilustracije napravio Quentin Blake, prethodno je adaptirana kao animirani film za britansku televiziju 1989. godine. Nova adaptacija ujedinila je ponovno Spielberga i scenaristicu neponovljivog E.T.-a, Melissu Mathison. U ulozi djevojčice, Sophie ćemo gledati Ruby Barnhill, a ulogu dobroćudnog diva dobio je Mark Rylance. Ostale uloge tumače Rebecca Hall, Bill Hader, Jemaine Clement i Penelope Wilton.', 120, NULL, 0),
(14, 'dcd', 'fefe', 1, 5, 'fefe', 2985, 'fefef', 'fefefe', 120, NULL, 1),
(15, 'ioniobnio', 'iniobniobn', 4, 6, 'knklbnklb', 1950, 'kj bihponik', 'knkik', 99, NULL, 0),
(16, 'aaaaaaaaaaaaaaaaa', 'nioii', 2, 1, 'oinioniobio', 1950, 'ewvionmnms', 'eionfioewnioen', 90, NULL, 0),
(17, 'iuhn', 'iouhioio', 5, 7, 'iewofnewiobn', 1950, 'ewfewfew', 'ewf', 99, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filmovi_ocjene`
--

CREATE TABLE IF NOT EXISTS `filmovi_ocjene` (
  `film_id` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `ocjena` int(11) NOT NULL,
  `vrijeme` datetime DEFAULT NULL,
  `obrisan` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`film_id`,`korisnik_id`),
  KEY `fk_filmovi_ocjene_korisnici1_idx` (`korisnik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filmovi_ocjene`
--

INSERT INTO `filmovi_ocjene` (`film_id`, `korisnik_id`, `ocjena`, `vrijeme`, `obrisan`) VALUES
(1, 4, 1, '2016-08-22 19:31:57', 0),
(1, 7, 0, '2016-09-12 18:54:42', 0),
(2, 4, 1, '2016-08-22 19:32:01', 0),
(2, 6, 1, '2016-05-30 21:55:23', 0),
(2, 7, 1, '2016-09-12 18:55:03', 0),
(3, 4, 1, '2016-08-22 18:51:25', 0),
(3, 5, 1, '2016-05-30 21:55:23', 0),
(3, 6, 0, '2016-05-30 21:55:47', 0),
(3, 7, 1, '2016-08-25 00:00:00', 0),
(3, 36, 1, '2016-08-25 00:00:00', 0),
(5, 4, 1, '2016-05-30 21:56:24', 0),
(5, 5, 1, '2016-05-30 21:55:47', 0),
(6, 5, 1, '2016-05-30 21:56:06', 0),
(7, 4, 1, '2016-05-30 21:56:46', 0),
(9, 6, 1, '2016-05-30 21:56:24', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `filmovi_ocjene_pogled`
--
CREATE TABLE IF NOT EXISTS `filmovi_ocjene_pogled` (
`film_id` int(11)
,`naziv` varchar(100)
,`ocjena` int(11)
,`vrijeme` datetime
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `filmovi_pogled`
--
CREATE TABLE IF NOT EXISTS `filmovi_pogled` (
`film_id` int(11)
,`film_naziv` varchar(100)
,`naziv_original` varchar(100)
,`zanr_id` int(11)
,`zanr_naziv` varchar(50)
,`drzava_id` int(11)
,`drzava_naziv` varchar(100)
,`redatelj` varchar(100)
,`godina` int(11)
,`uloge` varchar(500)
,`opis` varchar(3000)
,`trajanje` int(11)
,`slika_id` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

CREATE TABLE IF NOT EXISTS `korisnici` (
  `korisnik_id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `korime` varchar(20) NOT NULL,
  `lozinka` varchar(255) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `spol` char(1) NOT NULL,
  `drzava_id` int(11) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `slika_id` int(11) DEFAULT NULL,
  `obavijesti` tinyint(1) NOT NULL DEFAULT '1',
  `tip_id` int(11) NOT NULL,
  `vrijeme` datetime NOT NULL,
  `aktivacijski_kod` varchar(255) NOT NULL,
  `aktivan` tinyint(1) NOT NULL,
  `promasaj_broj` int(11) NOT NULL DEFAULT '0',
  `blokiran` tinyint(1) NOT NULL DEFAULT '0',
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`korisnik_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `korime_UNIQUE` (`korime`),
  KEY `fk_korisnici_drzave1_idx` (`drzava_id`),
  KEY `fk_korisnici_tip_korisnika1_idx` (`tip_id`),
  KEY `fk_korisnici_slike1_idx` (`slika_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`korisnik_id`, `ime`, `prezime`, `korime`, `lozinka`, `datum_rodjenja`, `spol`, `drzava_id`, `telefon`, `email`, `slika_id`, `obavijesti`, `tip_id`, `vrijeme`, `aktivacijski_kod`, `aktivan`, `promasaj_broj`, `blokiran`, `obrisan`) VALUES
(4, 'Saša', 'Hrgović', 'shrgovic', 'Qwertz!1', '1950-02-01', 'm', 1, '555 8899666', 'sasa.hrgovic@outlook.com', 3, 1, 1, '2016-08-25 02:33:54', '5f39161cbc71551fe9abf912e644c3eeda0d347f', 1, 0, 0, 0),
(5, 'Marko', 'Sanader', 'msanader', 'Qwertz!1', '1955-05-01', 'm', 1, '000 5589966', 'shrgovic@outlook.com', 4, 1, 2, '2016-08-25 02:38:27', '60264c2b3b43d2c9866ad9a1a09a5fcb6ebac11f', 1, 0, 0, 0),
(6, 'Ana', 'Matić', 'amatic', 'abc123abc', '1989-05-10', 'f', 4, '+38599855775', 'shrgovic2@foi.hr', NULL, 1, 2, '2016-08-25 02:38:25', 'null', 1, 0, 0, 0),
(7, 'Sanja', 'Hrgović', 'sanjahrgovic', 'Qwertz!1', '1999-01-01', 'f', 3, '099 5558899', 'manenicaluka@gmail.com', 19, 1, 2, '2016-08-20 23:30:38', 'a6fb836d83284980ea71f9a0a8906477d2f65d32', 1, 0, 0, 0),
(36, 'icninefi', 'iknd', 'winowiocnwpo', 'Qwertz!1', '1995-01-01', 'm', 12, '098 9589966', 'scxww@qw.sdq', NULL, 1, 3, '2016-08-25 15:31:40', 'a2706b5c4d58b14cba99bdd45e65d3e010a96f86', 0, 0, 0, 0),
(37, 'Marko', 'Markić', 'mmarkic', 'Qwertz!1', '1999-09-01', 'm', 5, '099 5589966', 'sasa.hrgovic@gmail.com', 0, 1, 3, '2016-09-12 16:31:15', 'eea7dfaf64f4090cd4d582be971531f6d5b68db8', 1, 0, 0, 0),
(38, 'Ana', 'Matić', 'amatic2', 'Qwertz!1', '1999-09-01', 'f', 1, '099 2559966', 'dibu@polyfaust.com', 25, 1, 3, '2016-09-10 15:32:07', '9d3c619406258569de047f8f64c1ee6578c85a6a', 0, 0, 0, 0),
(39, 'Ivana', 'Marić', 'imaric2', 'Qwertz!1', '1999-01-01', 'f', 9, '099 5889966', 'aaa@lackmail.ru', 0, 1, 3, '2016-09-12 18:44:00', '5a86cfbe82b5665f49d69edf1ce1bc551e20a4ca', 1, 4, 0, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `korisnici_pogled`
--
CREATE TABLE IF NOT EXISTS `korisnici_pogled` (
`korisnik_id` int(11)
,`ime` varchar(20)
,`prezime` varchar(30)
,`korime` varchar(20)
,`datum_rodjenja` date
,`spol` char(1)
,`drzava_id` int(11)
,`drzava_naziv` varchar(100)
,`telefon` varchar(20)
,`email` varchar(30)
,`slika_id` int(11)
,`obavijesti` tinyint(1)
,`tip_id` int(11)
,`tip_naziv` varchar(45)
,`vrijeme` datetime
,`aktivan` tinyint(1)
,`promasaj_broj` int(11)
);
-- --------------------------------------------------------

--
-- Table structure for table `lokacije`
--

CREATE TABLE IF NOT EXISTS `lokacije` (
  `lokacija_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) NOT NULL,
  `ulica` varchar(255) NOT NULL,
  `broj` int(11) NOT NULL,
  `postanski_broj` varchar(10) DEFAULT NULL,
  `grad` varchar(50) NOT NULL,
  `drzava_id` int(11) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `telefon` varchar(20) NOT NULL,
  `moderator_id` int(11) DEFAULT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lokacija_id`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`),
  KEY `fk_lokacije_korisnici1_idx` (`moderator_id`),
  KEY `fk_lokacije_drzave1_idx` (`drzava_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `lokacije`
--

INSERT INTO `lokacije` (`lokacija_id`, `naziv`, `ulica`, `broj`, `postanski_broj`, `grad`, `drzava_id`, `latitude`, `longitude`, `telefon`, `moderator_id`, `obrisan`) VALUES
(1, 'Arena Zagreb', 'Ul. Vice Vukova', 8, '10000', 'Zagreb', 3, 45.7711, 15.9434, '+38516420900', 4, 0),
(2, 'Kino Varaždin (Lumini Centar)', 'Ul. Grada Lipika', 15, '42000', 'Varaždin', 3, 46.265, 16.3753, '+38542209516', 5, 0),
(3, 'Kino Split (Joker Centar)', 'Put Brodarice', 6, '21000', 'Split', 3, 43.5202, 16.4461, '+38521559874', 7, 0),
(4, 'Kino Rijeka (Tower Centar)', 'Janka Polića Kamova 81a', 81, '51000', 'Rijeka', 3, 45.318, 14.4687, '+38516396702', 4, 0),
(5, 'Kino Osijek (Portanova centar)', 'Svilajska', 0, '31000', 'Osijek', 3, 45.5547, 18.6373, '+38516396702', 4, 0),
(6, 'Kino Kamera', 'Ul. Milentija Popovića 17', 17, '11000', 'Beograd', 8, 44.8064, 20.4285, ' +381112106477', 4, 0),
(7, 'Kino Bežigrad', 'Linhartova cesta 11', 11, '1000', 'Ljubljana', 4, 46.0644, 14.5102, '+38683807068', NULL, 0),
(8, 'Kino Dubrovnik (Dvori Lapad)', 'Masarykov put 3', 3, '20000', 'Dubrovnik', 3, 42.6543, 18.0722, '+38520671558', NULL, 0),
(9, 'Kino SB (City Colloseum)', 'Josipa Rimca 7', 7, '35000', 'Slavonski Brod', 3, 45.16, 17.999, '+38516396702', NULL, 0),
(10, 'Kino Zadar (City Galleria)', 'Put Murvice 1', 1, '23000', 'Zadar', 3, 44.1104, 15.2386, '+38516396702', NULL, 0),
(11, 'Kino Pula', 'Put svile', 22, '52000', 'Pula', 3, 0, 0, '+385992228899', 4, 0),
(20, 'Arena Zagrebiobnoiub', 'Ul. Vice Vukova', 8, '10000', 'Zagreb', 1, 45.7711, 15.9434, '+38516420900', 4, 1),
(25, 'Arena Zagrebihioh', 'Ul. Vice Vukova', 8, '10000', 'Zagreb', 4, 45.7711, 15.9434, '+38516420900', 4, 1),
(29, 'Kino Dinosaur', 'Ul. Stradalih dinosaura', 55, '65000', 'Zagreb', 3, 0, 0, '+385996677', 4, 0),
(30, 'Kino Zelena trava', 'Trg narkomana', 22, '22344', 'Zagreb', 3, 0, 0, '+3855494922', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lokacije_ocjene`
--

CREATE TABLE IF NOT EXISTS `lokacije_ocjene` (
  `lokacija_id` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `ocjena` int(11) NOT NULL,
  `vrijeme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`lokacija_id`,`korisnik_id`),
  KEY `fk_lokacije_ocjene_korisnici1_idx` (`korisnik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oznake`
--

CREATE TABLE IF NOT EXISTS `oznake` (
  `oznaka_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`oznaka_id`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `pogled`
--
CREATE TABLE IF NOT EXISTS `pogled` (
`id` int(11)
,`datum` date
,`likes` bigint(21)
,`dislikes` bigint(21)
);
-- --------------------------------------------------------

--
-- Table structure for table `postavke`
--

CREATE TABLE IF NOT EXISTS `postavke` (
  `postavka_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  `vrijednost` int(11) DEFAULT NULL,
  PRIMARY KEY (`postavka_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `postavke`
--

INSERT INTO `postavke` (`postavka_id`, `naziv`, `vrijednost`) VALUES
(1, 'pomak', 24),
(2, 'stranice', 6);

-- --------------------------------------------------------

--
-- Table structure for table `projekcije`
--

CREATE TABLE IF NOT EXISTS `projekcije` (
  `projekcija_id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) NOT NULL,
  `dvorana_id` int(11) NOT NULL,
  `vrijeme_pocetak` datetime NOT NULL,
  `vrijeme_zavrsetak` datetime DEFAULT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`projekcija_id`),
  KEY `fk_projekcije_filmovi1_idx` (`film_id`),
  KEY `fk_projekcije_dvorane1_idx` (`dvorana_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `projekcije`
--

INSERT INTO `projekcije` (`projekcija_id`, `film_id`, `dvorana_id`, `vrijeme_pocetak`, `vrijeme_zavrsetak`, `obrisan`) VALUES
(1, 1, 6, '2016-06-08 19:00:00', '2016-06-08 21:20:00', 0),
(2, 4, 1, '2016-06-08 22:00:00', '2016-06-09 00:17:00', 0),
(3, 1, 5, '2016-07-19 21:00:00', '2016-07-19 23:20:00', 0),
(4, 7, 5, '2016-06-19 19:00:00', '2016-06-19 20:56:00', 0),
(5, 8, 11, '2016-06-17 18:30:00', NULL, 0),
(6, 5, 12, '2016-06-13 19:00:00', NULL, 0),
(7, 9, 6, '2016-06-18 19:00:00', NULL, 0),
(8, 6, 11, '2016-07-21 21:00:00', NULL, 0),
(9, 5, 12, '2016-06-24 19:00:00', NULL, 0),
(10, 9, 11, '2016-06-30 19:00:00', NULL, 0),
(11, 4, 2, '2016-08-16 16:42:42', '2016-08-16 18:59:42', 0),
(12, 1, 1, '2016-06-08 20:00:00', '2016-06-08 22:20:00', 0),
(13, 1, 2, '2016-09-08 20:00:00', '2016-09-08 22:20:00', 0),
(17, 1, 2, '2016-06-08 19:00:00', '2016-06-08 21:20:00', 1),
(18, 9, 1, '2016-09-13 22:00:00', '2016-09-14 00:53:00', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `projekcije_pogled`
--
CREATE TABLE IF NOT EXISTS `projekcije_pogled` (
`projekcija_id` int(11)
,`film_id` int(11)
,`naziv` varchar(100)
,`trajanje` int(11)
,`dvorana_id` int(11)
,`broj` int(11)
,`broj_mjesta` int(11)
,`lokacija_id` int(11)
,`vrijeme_pocetak` datetime
,`vrijeme_zavrsetak` datetime
);
-- --------------------------------------------------------

--
-- Table structure for table `rezervacije`
--

CREATE TABLE IF NOT EXISTS `rezervacije` (
  `rezervacija_id` int(11) NOT NULL AUTO_INCREMENT,
  `projekcija_id` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `vrijeme` datetime NOT NULL,
  `odobrenje` tinyint(1) NOT NULL DEFAULT '0',
  `odobrenje_vrijeme` datetime DEFAULT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rezervacija_id`,`projekcija_id`,`korisnik_id`),
  KEY `fk_rezervacije_korisnici1_idx` (`korisnik_id`),
  KEY `fk_rezervacije_projekcije1_idx` (`projekcija_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `rezervacije`
--

INSERT INTO `rezervacije` (`rezervacija_id`, `projekcija_id`, `korisnik_id`, `vrijeme`, `odobrenje`, `odobrenje_vrijeme`, `obrisan`) VALUES
(1, 1, 4, '2016-08-18 15:23:37', 0, NULL, 0),
(2, 1, 5, '2016-08-18 15:23:37', 1, '2016-08-25 00:05:32', 0),
(3, 7, 6, '2016-08-18 13:03:32', 0, NULL, 0),
(4, 3, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(5, 3, 4, '2016-08-18 15:23:37', 0, NULL, 0),
(6, 3, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(7, 7, 6, '2016-08-18 15:23:37', 0, NULL, 0),
(8, 6, 4, '2016-08-18 13:04:02', 0, NULL, 0),
(9, 5, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(10, 4, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(11, 4, 6, '2016-08-18 15:23:37', 0, NULL, 0),
(12, 6, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(13, 6, 4, '2016-08-18 15:23:37', 0, NULL, 0),
(14, 8, 4, '2016-08-18 15:23:37', 0, NULL, 0),
(15, 7, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(16, 3, 6, '2016-08-18 15:23:37', 0, NULL, 0),
(17, 4, 4, '2016-08-18 15:23:37', 0, NULL, 0),
(18, 7, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(19, 6, 5, '2016-08-18 15:23:37', 0, NULL, 0),
(20, 7, 4, '2016-08-18 15:23:37', 0, NULL, 0),
(21, 4, 4, '2016-08-19 13:19:30', 0, NULL, 0),
(22, 4, 5, '2016-08-19 13:21:09', 0, NULL, 0),
(23, 1, 4, '2016-08-19 16:01:28', 0, NULL, 0),
(24, 1, 4, '2016-08-19 16:03:49', 0, NULL, 0),
(25, 1, 4, '2016-08-19 16:06:48', 0, NULL, 0),
(26, 1, 4, '2016-08-19 16:13:17', 0, NULL, 0),
(27, 1, 4, '2016-08-19 19:03:38', 0, NULL, 0),
(28, 1, 4, '2016-08-19 19:08:22', 0, NULL, 0),
(29, 1, 4, '2016-08-19 20:55:09', 0, NULL, 0),
(30, 1, 4, '2016-08-19 23:26:09', 1, '2016-08-19 23:26:09', 0),
(31, 1, 4, '2016-08-20 00:56:57', 1, '2016-08-20 00:56:57', 0),
(32, 1, 5, '2016-08-19 23:36:19', 1, '2016-08-19 23:36:19', 0),
(33, 1, 5, '2016-08-19 23:38:54', 0, NULL, 0),
(34, 1, 4, '2016-08-20 23:19:42', 1, '2016-08-20 23:19:42', 0),
(35, 4, 4, '2016-08-21 00:06:05', 1, '2016-08-21 00:09:22', 0),
(36, 4, 4, '2016-08-25 00:06:27', 1, '2016-08-25 00:07:37', 0),
(37, 18, 7, '2016-09-12 18:57:43', 1, '2016-09-12 18:58:13', 0),
(38, 18, 4, '2016-09-12 18:59:18', 1, '2016-09-12 19:00:48', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `rezervacije_pogled`
--
CREATE TABLE IF NOT EXISTS `rezervacije_pogled` (
`film_naziv` varchar(100)
,`dvorana_id` int(11)
,`lokacija_id` int(11)
,`vrijeme_pocetak` datetime
,`rezervacija_id` int(11)
,`projekcija_id` int(11)
,`korisnik_id` int(11)
,`vrijeme` datetime
,`odobrenje` tinyint(1)
,`odobrenje_vrijeme` datetime
,`ime` varchar(20)
,`prezime` varchar(30)
);
-- --------------------------------------------------------

--
-- Table structure for table `sjedala`
--

CREATE TABLE IF NOT EXISTS `sjedala` (
  `sjedalo_id` int(11) NOT NULL AUTO_INCREMENT,
  `redak_broj` int(11) NOT NULL,
  `sjedalo_broj` int(11) NOT NULL,
  `dvorana_id` int(11) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sjedalo_id`),
  KEY `fk_sjedala_dvorane1_idx` (`dvorana_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=349 ;

--
-- Dumping data for table `sjedala`
--

INSERT INTO `sjedala` (`sjedalo_id`, `redak_broj`, `sjedalo_broj`, `dvorana_id`, `obrisan`) VALUES
(1, 1, 1, 6, 0),
(2, 1, 2, 6, 0),
(3, 1, 3, 6, 0),
(4, 1, 4, 6, 0),
(5, 1, 5, 6, 0),
(6, 1, 6, 6, 0),
(7, 1, 7, 6, 0),
(8, 1, 8, 6, 0),
(9, 1, 9, 6, 0),
(10, 1, 10, 6, 0),
(11, 2, 1, 6, 0),
(12, 2, 2, 6, 0),
(13, 2, 3, 6, 0),
(14, 2, 4, 6, 0),
(15, 2, 5, 6, 0),
(16, 2, 6, 6, 0),
(17, 2, 7, 6, 0),
(18, 2, 8, 6, 0),
(19, 2, 9, 6, 0),
(20, 2, 10, 6, 0),
(21, 3, 1, 6, 0),
(22, 3, 2, 6, 0),
(23, 3, 3, 6, 0),
(24, 3, 4, 6, 0),
(25, 3, 5, 6, 0),
(26, 3, 6, 6, 0),
(27, 3, 7, 6, 0),
(28, 3, 8, 6, 0),
(29, 3, 9, 6, 0),
(30, 3, 10, 6, 0),
(31, 4, 1, 6, 0),
(32, 4, 2, 6, 0),
(33, 4, 3, 6, 0),
(34, 4, 4, 6, 0),
(35, 4, 5, 6, 0),
(36, 4, 6, 6, 0),
(37, 4, 7, 6, 0),
(38, 4, 8, 6, 0),
(39, 4, 9, 6, 0),
(40, 4, 10, 6, 0),
(41, 5, 1, 6, 0),
(42, 5, 2, 6, 0),
(43, 5, 3, 6, 0),
(44, 5, 4, 6, 0),
(45, 5, 5, 6, 0),
(46, 5, 6, 6, 0),
(47, 5, 7, 6, 0),
(48, 5, 8, 6, 0),
(49, 5, 9, 6, 0),
(50, 5, 10, 6, 0),
(51, 6, 1, 6, 0),
(52, 6, 2, 6, 0),
(53, 6, 3, 6, 0),
(54, 6, 4, 6, 0),
(55, 6, 5, 6, 0),
(56, 6, 6, 6, 0),
(57, 6, 7, 6, 0),
(58, 6, 8, 6, 0),
(59, 6, 9, 6, 0),
(60, 6, 10, 6, 0),
(61, 7, 1, 6, 0),
(62, 7, 2, 6, 0),
(63, 7, 3, 6, 0),
(64, 7, 4, 6, 0),
(65, 7, 5, 6, 0),
(66, 7, 6, 6, 0),
(67, 7, 7, 6, 0),
(68, 7, 8, 6, 0),
(69, 7, 9, 6, 0),
(70, 7, 10, 6, 0),
(71, 8, 1, 6, 0),
(72, 8, 2, 6, 0),
(73, 8, 3, 6, 0),
(74, 8, 4, 6, 0),
(75, 8, 5, 6, 0),
(76, 8, 6, 6, 0),
(77, 8, 7, 6, 0),
(78, 8, 8, 6, 0),
(79, 8, 9, 6, 0),
(80, 8, 10, 6, 0),
(81, 9, 1, 6, 0),
(82, 9, 2, 6, 0),
(83, 9, 3, 6, 0),
(84, 9, 4, 6, 0),
(85, 9, 5, 6, 0),
(86, 9, 6, 6, 0),
(87, 9, 7, 6, 0),
(88, 9, 8, 6, 0),
(89, 9, 9, 6, 0),
(90, 9, 10, 6, 0),
(91, 10, 1, 6, 0),
(92, 10, 2, 6, 0),
(93, 10, 3, 6, 0),
(94, 10, 4, 6, 0),
(95, 10, 5, 6, 0),
(96, 10, 6, 6, 0),
(97, 10, 7, 6, 0),
(98, 10, 8, 6, 0),
(99, 10, 9, 6, 0),
(100, 10, 10, 6, 0),
(137, 1, 1, 5, 0),
(138, 1, 2, 5, 0),
(139, 1, 3, 5, 0),
(140, 1, 4, 5, 0),
(141, 1, 5, 5, 0),
(142, 1, 6, 5, 0),
(143, 1, 7, 5, 0),
(147, 2, 1, 5, 0),
(148, 2, 2, 5, 0),
(149, 2, 3, 5, 0),
(150, 2, 4, 5, 0),
(151, 2, 5, 5, 0),
(152, 2, 6, 5, 0),
(153, 2, 7, 5, 0),
(157, 3, 1, 5, 0),
(158, 3, 2, 5, 0),
(159, 3, 3, 5, 0),
(160, 3, 4, 5, 0),
(161, 3, 5, 5, 0),
(162, 3, 6, 5, 0),
(163, 3, 7, 5, 0),
(167, 4, 1, 5, 0),
(168, 4, 2, 5, 0),
(169, 4, 3, 5, 0),
(170, 4, 4, 5, 0),
(171, 4, 5, 5, 0),
(172, 4, 6, 5, 0),
(173, 4, 7, 5, 0),
(177, 5, 1, 5, 0),
(178, 5, 2, 5, 0),
(179, 5, 3, 5, 0),
(180, 5, 4, 5, 0),
(181, 5, 5, 5, 0),
(182, 5, 6, 5, 0),
(183, 5, 7, 5, 0),
(187, 6, 1, 5, 0),
(188, 6, 2, 5, 0),
(189, 6, 3, 5, 0),
(190, 6, 4, 5, 0),
(191, 6, 5, 5, 0),
(192, 6, 6, 5, 0),
(193, 6, 7, 5, 0),
(197, 7, 1, 5, 0),
(198, 7, 2, 5, 0),
(199, 7, 3, 5, 0),
(200, 7, 4, 5, 0),
(201, 7, 5, 5, 0),
(202, 7, 6, 5, 0),
(203, 7, 7, 5, 0),
(207, 8, 1, 5, 0),
(208, 8, 2, 5, 0),
(209, 8, 3, 5, 0),
(210, 8, 4, 5, 0),
(211, 8, 5, 5, 0),
(212, 8, 6, 5, 0),
(213, 8, 7, 5, 0),
(266, 1, 8, 5, 0),
(267, 2, 8, 5, 0),
(268, 3, 8, 5, 0),
(269, 4, 8, 5, 0),
(270, 5, 8, 5, 0),
(271, 6, 8, 5, 0),
(272, 7, 8, 5, 0),
(273, 8, 8, 5, 0),
(274, 9, 1, 5, 0),
(275, 9, 2, 5, 0),
(276, 9, 3, 5, 0),
(277, 9, 4, 5, 0),
(278, 9, 5, 5, 0),
(279, 9, 6, 5, 0),
(280, 9, 7, 5, 0),
(281, 9, 8, 5, 0),
(282, 1, 11, 6, 0),
(283, 2, 11, 6, 0),
(284, 3, 11, 6, 0),
(285, 4, 11, 6, 0),
(286, 5, 11, 6, 0),
(287, 6, 11, 6, 0),
(288, 7, 11, 6, 0),
(289, 8, 11, 6, 0),
(290, 9, 11, 6, 0),
(291, 10, 11, 6, 0),
(304, 1, 9, 5, 0),
(305, 2, 9, 5, 0),
(306, 3, 9, 5, 0),
(307, 4, 9, 5, 0),
(308, 5, 9, 5, 0),
(309, 6, 9, 5, 0),
(310, 7, 9, 5, 0),
(311, 8, 9, 5, 0),
(312, 9, 9, 5, 0),
(313, 1, 1, 1, 0),
(314, 2, 1, 1, 0),
(315, 3, 1, 1, 0),
(316, 4, 1, 1, 0),
(317, 1, 2, 1, 0),
(318, 2, 2, 1, 0),
(319, 3, 2, 1, 0),
(320, 4, 2, 1, 0),
(321, 1, 3, 1, 0),
(322, 2, 3, 1, 0),
(323, 3, 3, 1, 0),
(324, 4, 3, 1, 0),
(325, 1, 4, 1, 0),
(326, 2, 4, 1, 0),
(327, 3, 4, 1, 0),
(328, 4, 4, 1, 0),
(329, 1, 5, 1, 0),
(330, 2, 5, 1, 0),
(331, 3, 5, 1, 0),
(332, 4, 5, 1, 0),
(333, 1, 6, 1, 0),
(334, 2, 6, 1, 0),
(335, 3, 6, 1, 0),
(336, 4, 6, 1, 0),
(337, 1, 7, 1, 0),
(338, 2, 7, 1, 0),
(339, 3, 7, 1, 0),
(340, 4, 7, 1, 0),
(341, 1, 8, 1, 0),
(342, 2, 8, 1, 0),
(343, 3, 8, 1, 0),
(344, 4, 8, 1, 0),
(345, 1, 9, 1, 0),
(346, 2, 9, 1, 0),
(347, 3, 9, 1, 0),
(348, 4, 9, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sjedalo_rezervacija`
--

CREATE TABLE IF NOT EXISTS `sjedalo_rezervacija` (
  `rezervacija_id` int(11) NOT NULL,
  `sjedalo_id` int(11) NOT NULL,
  `prodano` tinyint(1) NOT NULL DEFAULT '0',
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rezervacija_id`,`sjedalo_id`),
  KEY `fk_sjedalo_rezervacija_sjedala1_idx` (`sjedalo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sjedalo_rezervacija`
--

INSERT INTO `sjedalo_rezervacija` (`rezervacija_id`, `sjedalo_id`, `prodano`, `obrisan`) VALUES
(1, 1, 1, 0),
(1, 20, 1, 0),
(29, 4, 1, 0),
(29, 5, 1, 0),
(29, 14, 1, 0),
(29, 15, 1, 0),
(29, 45, 1, 0),
(30, 77, 1, 0),
(30, 79, 1, 0),
(30, 90, 1, 0),
(31, 63, 1, 0),
(31, 73, 1, 0),
(31, 82, 1, 0),
(32, 38, 1, 0),
(32, 39, 1, 0),
(32, 40, 1, 0),
(34, 8, 1, 0),
(34, 9, 1, 0),
(34, 10, 1, 0),
(34, 282, 1, 0),
(35, 160, 1, 0),
(35, 161, 1, 0),
(35, 162, 1, 0),
(36, 137, 1, 0),
(36, 138, 1, 0),
(36, 139, 1, 0),
(37, 321, 1, 0),
(37, 325, 1, 0),
(37, 329, 1, 0),
(38, 341, 1, 0),
(38, 345, 1, 0),
(38, 346, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `slike`
--

CREATE TABLE IF NOT EXISTS `slike` (
  `slika_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `mime` varchar(100) NOT NULL,
  `size` int(11) NOT NULL,
  `tmp_name` varchar(255) DEFAULT NULL,
  `vrijeme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`slika_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `slike`
--

INSERT INTO `slike` (`slika_id`, `name`, `mime`, `size`, `tmp_name`, `vrijeme`) VALUES
(3, 'bfc751daa79d2bfd669583e0a09ba2de736a76df.jpg', 'image/jpeg', 100896, NULL, '2016-08-06 22:22:48'),
(4, '3512d46266d3ed61d97e43b9d152e467b2df56da.jpg', 'image/jpeg', 111719, NULL, '2016-08-06 22:31:31'),
(12, 'edd83e9f30d986d2f6d2a36df6c65ebcad628e42.jpg', 'image/jpeg', 131845, NULL, '2016-08-18 20:57:48'),
(13, '0184a16199ecd2bdc2e6fa2e273b2947a5d3b25e.jpg', 'image/jpeg', 322865, NULL, '2016-08-18 21:00:03'),
(14, '2186cf546ac0aa5f043c9c7dd67f468a75e4e32e.jpg', 'image/jpeg', 94247, NULL, '2016-08-18 21:01:45'),
(15, 'dc659a4531370c87bc6957b8b802154f7f921220.jpg', 'image/jpeg', 103145, NULL, '2016-08-18 21:02:19'),
(16, '3954c7b4b0c4e49a16d504aa97a3d2891b84e661.jpg', 'image/jpeg', 115164, NULL, '2016-08-18 21:12:14'),
(17, 'a0cfb30fdf4e81c93871527e7d94b58491f3dd07.jpg', 'image/jpeg', 233199, NULL, '2016-08-18 21:14:52'),
(18, '0ad3085bf4b2868a9b508353fa04f711f19b8479.jpg', 'image/jpeg', 160662, NULL, '2016-08-18 21:19:05'),
(19, 'efad4259b4528c024bd5f6e2162fc1dfe8c37e09.jpg', 'image/jpeg', 46333, NULL, '2016-08-20 21:29:51'),
(20, 'a7d038fb2aafca96a8733766351190cb2ef4a396.png', 'image/png', 442, NULL, '2016-09-11 13:34:41'),
(21, '6179dfb20b1d06ac9d2d79ba02913616a827fff8.png', 'image/png', 442, NULL, '2016-09-11 13:35:35'),
(22, '879509db81e7454247d21e1ef46a55ca55bad931.png', 'image/png', 442, NULL, '2016-09-11 13:38:50'),
(23, 'be09940e47e8e4ef375ce4915c689e2e613ec378.png', 'image/png', 442, NULL, '2016-09-11 13:43:15'),
(24, '329a61b9b4b79d59648e50f658f744e979569c25.png', 'image/png', 442, NULL, '2016-09-11 13:44:21'),
(25, '70b563800d470f66853df98a34df545815543078.jpg', 'image/jpeg', 100896, NULL, '2016-09-12 15:32:07'),
(26, 'ea25177ac5a573553b421499883433923f5dc0ac.png', 'image/png', 442, NULL, '2016-09-12 16:13:25');

-- --------------------------------------------------------

--
-- Table structure for table `tip_korisnika`
--

CREATE TABLE IF NOT EXISTS `tip_korisnika` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_id`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tip_korisnika`
--

INSERT INTO `tip_korisnika` (`tip_id`, `naziv`, `opis`, `obrisan`) VALUES
(1, 'Administrator', 'Definira lokacije i dodjeljuje moderatore. Može vidjeti statistiku.', 0),
(2, 'Moderator', 'Definira projekcije i termine. Potvrđuje rezervacije. Vidi statistiku ocjena.', 0),
(3, 'Registriran', 'Može raditi rezervacije i pogledati već napravljene. Može ocijeniti film i lokaciju. Može postaviti sliku ulaznice.', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tip_radnje`
--

CREATE TABLE IF NOT EXISTS `tip_radnje` (
  `tip_radnje_id` int(11) NOT NULL AUTO_INCREMENT,
  `radnja` varchar(100) NOT NULL,
  `opis` varchar(255) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tip_radnje_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tip_radnje`
--

INSERT INTO `tip_radnje` (`tip_radnje_id`, `radnja`, `opis`, `obrisan`) VALUES
(1, 'prijave/odjave', 'Prijave i odjave svih korisnika registriranih u sustavu', 0),
(2, 'upiti', 'Upiti nad bazom podataka. Uključuju sve važne upite (CRUD). Ne uključuju generiranja XML-a i slično.', 0),
(3, 'posjeti', 'Posjeti svim stranicama kojima korisnik može pristupiti putem izbornika', 0),
(4, 'ostalo', 'Blokiranja, odblokiranja i ostalo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ulaznice`
--

CREATE TABLE IF NOT EXISTS `ulaznice` (
  `ulaznica_id` int(11) NOT NULL AUTO_INCREMENT,
  `rezervacija_id` int(11) NOT NULL,
  `vrijeme` datetime NOT NULL,
  `slika_id` int(11) DEFAULT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ulaznica_id`,`rezervacija_id`),
  KEY `fk_ulaznice_rezervacije1_idx` (`rezervacija_id`),
  KEY `fk_ulaznice_slike1_idx` (`slika_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ulaznice`
--

INSERT INTO `ulaznice` (`ulaznica_id`, `rezervacija_id`, `vrijeme`, `slika_id`, `obrisan`) VALUES
(1, 36, '2016-09-22 10:34:31', 22, 0),
(2, 35, '2016-09-11 15:44:21', 24, 0),
(3, 30, '2016-09-13 18:13:26', 26, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ulaznice_oznake`
--

CREATE TABLE IF NOT EXISTS `ulaznice_oznake` (
  `ulaznica_id` int(11) NOT NULL,
  `oznaka_id` int(11) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ulaznica_id`,`oznaka_id`),
  KEY `fk_ulaznice_oznake_oznake1_idx` (`oznaka_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `zanrovi`
--

CREATE TABLE IF NOT EXISTS `zanrovi` (
  `zanr_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `obrisan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`zanr_id`),
  UNIQUE KEY `naziv_UNIQUE` (`naziv`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `zanrovi`
--

INSERT INTO `zanrovi` (`zanr_id`, `naziv`, `obrisan`) VALUES
(1, 'Akcijski', 0),
(2, 'Avantura', 0),
(3, 'Animirani', 0),
(4, 'Komedija', 0),
(5, 'Dokumentarni', 0),
(6, 'Krimi', 0),
(7, 'Drama', 0),
(8, 'Znanstvena fantastika', 0),
(9, 'Povijesni', 0),
(10, 'Horror', 0),
(11, 'Glazbeni', 0),
(12, 'Misterij', 0),
(13, 'Romantični', 0),
(14, 'Sportski', 0),
(15, 'Ratni', 0),
(16, 'Western', 0),
(17, 'Triler', 0);

-- --------------------------------------------------------

--
-- Structure for view `filmovi_ocjene_pogled`
--
DROP TABLE IF EXISTS `filmovi_ocjene_pogled`;

CREATE ALGORITHM=UNDEFINED DEFINER=`WebDiP2015x030`@`localhost` SQL SECURITY DEFINER VIEW `filmovi_ocjene_pogled` AS select `filmovi_ocjene`.`film_id` AS `film_id`,`filmovi`.`naziv` AS `naziv`,`filmovi_ocjene`.`ocjena` AS `ocjena`,`filmovi_ocjene`.`vrijeme` AS `vrijeme` from (`filmovi_ocjene` join `filmovi`) where (`filmovi_ocjene`.`film_id` = `filmovi`.`film_id`);

-- --------------------------------------------------------

--
-- Structure for view `filmovi_pogled`
--
DROP TABLE IF EXISTS `filmovi_pogled`;

CREATE ALGORITHM=UNDEFINED DEFINER=`WebDiP2015x030`@`localhost` SQL SECURITY DEFINER VIEW `filmovi_pogled` AS select `filmovi`.`film_id` AS `film_id`,`filmovi`.`naziv` AS `film_naziv`,`filmovi`.`naziv_original` AS `naziv_original`,`filmovi`.`zanr_id` AS `zanr_id`,`zanrovi`.`naziv` AS `zanr_naziv`,`filmovi`.`drzava_id` AS `drzava_id`,`drzave`.`naziv` AS `drzava_naziv`,`filmovi`.`redatelj` AS `redatelj`,`filmovi`.`godina` AS `godina`,`filmovi`.`uloge` AS `uloge`,`filmovi`.`opis` AS `opis`,`filmovi`.`trajanje` AS `trajanje`,`filmovi`.`slika_id` AS `slika_id` from ((`filmovi` join `zanrovi` on((`filmovi`.`zanr_id` = `zanrovi`.`zanr_id`))) join `drzave` on((`filmovi`.`drzava_id` = `drzave`.`drzava_id`))) where (`filmovi`.`obrisan` = '0');

-- --------------------------------------------------------

--
-- Structure for view `korisnici_pogled`
--
DROP TABLE IF EXISTS `korisnici_pogled`;

CREATE ALGORITHM=UNDEFINED DEFINER=`WebDiP2015x030`@`localhost` SQL SECURITY DEFINER VIEW `korisnici_pogled` AS select `korisnici`.`korisnik_id` AS `korisnik_id`,`korisnici`.`ime` AS `ime`,`korisnici`.`prezime` AS `prezime`,`korisnici`.`korime` AS `korime`,`korisnici`.`datum_rodjenja` AS `datum_rodjenja`,`korisnici`.`spol` AS `spol`,`korisnici`.`drzava_id` AS `drzava_id`,`drzave`.`naziv` AS `drzava_naziv`,`korisnici`.`telefon` AS `telefon`,`korisnici`.`email` AS `email`,`korisnici`.`slika_id` AS `slika_id`,`korisnici`.`obavijesti` AS `obavijesti`,`korisnici`.`tip_id` AS `tip_id`,`tip_korisnika`.`naziv` AS `tip_naziv`,`korisnici`.`vrijeme` AS `vrijeme`,`korisnici`.`aktivan` AS `aktivan`,`korisnici`.`promasaj_broj` AS `promasaj_broj` from ((`korisnici` join `drzave` on((`korisnici`.`drzava_id` = `drzave`.`drzava_id`))) join `tip_korisnika` on((`tip_korisnika`.`tip_id` = `korisnici`.`tip_id`))) where (`korisnici`.`obrisan` = 0);

-- --------------------------------------------------------

--
-- Structure for view `pogled`
--
DROP TABLE IF EXISTS `pogled`;

CREATE ALGORITHM=UNDEFINED DEFINER=`WebDiP2015x030`@`localhost` SQL SECURITY DEFINER VIEW `pogled` AS select `filmovi_ocjene`.`film_id` AS `id`,cast(`filmovi_ocjene`.`vrijeme` as date) AS `datum`,(select count(`filmovi_ocjene`.`ocjena`) from `filmovi_ocjene` where ((`filmovi_ocjene`.`ocjena` = 1) and (`filmovi_ocjene`.`film_id` = `filmovi_ocjene`.`film_id`) and (cast(`filmovi_ocjene`.`vrijeme` as date) = `datum`))) AS `likes`,(select count(`filmovi_ocjene`.`ocjena`) from `filmovi_ocjene` where ((`filmovi_ocjene`.`ocjena` = 0) and (`filmovi_ocjene`.`film_id` = `filmovi_ocjene`.`film_id`) and (cast(`filmovi_ocjene`.`vrijeme` as date) = `datum`))) AS `dislikes` from `filmovi_ocjene` group by `filmovi_ocjene`.`film_id`,cast(`filmovi_ocjene`.`vrijeme` as date) order by 2;

-- --------------------------------------------------------

--
-- Structure for view `projekcije_pogled`
--
DROP TABLE IF EXISTS `projekcije_pogled`;

CREATE ALGORITHM=UNDEFINED DEFINER=`WebDiP2015x030`@`localhost` SQL SECURITY DEFINER VIEW `projekcije_pogled` AS select `projekcije`.`projekcija_id` AS `projekcija_id`,`projekcije`.`film_id` AS `film_id`,`filmovi`.`naziv` AS `naziv`,`filmovi`.`trajanje` AS `trajanje`,`projekcije`.`dvorana_id` AS `dvorana_id`,`dvorane`.`broj` AS `broj`,`dvorane`.`broj_mjesta` AS `broj_mjesta`,`dvorane`.`lokacija_id` AS `lokacija_id`,`projekcije`.`vrijeme_pocetak` AS `vrijeme_pocetak`,`projekcije`.`vrijeme_zavrsetak` AS `vrijeme_zavrsetak` from ((`filmovi` join `projekcije` on((`filmovi`.`film_id` = `projekcije`.`film_id`))) join `dvorane` on((`dvorane`.`dvorana_id` = `projekcije`.`dvorana_id`))) where (`projekcije`.`obrisan` = '0');

-- --------------------------------------------------------

--
-- Structure for view `rezervacije_pogled`
--
DROP TABLE IF EXISTS `rezervacije_pogled`;

CREATE ALGORITHM=UNDEFINED DEFINER=`WebDiP2015x030`@`localhost` SQL SECURITY DEFINER VIEW `rezervacije_pogled` AS select `projekcije_pogled`.`naziv` AS `film_naziv`,`projekcije_pogled`.`dvorana_id` AS `dvorana_id`,`projekcije_pogled`.`lokacija_id` AS `lokacija_id`,`projekcije_pogled`.`vrijeme_pocetak` AS `vrijeme_pocetak`,`rezervacije`.`rezervacija_id` AS `rezervacija_id`,`rezervacije`.`projekcija_id` AS `projekcija_id`,`rezervacije`.`korisnik_id` AS `korisnik_id`,`rezervacije`.`vrijeme` AS `vrijeme`,`rezervacije`.`odobrenje` AS `odobrenje`,`rezervacije`.`odobrenje_vrijeme` AS `odobrenje_vrijeme`,`korisnici`.`ime` AS `ime`,`korisnici`.`prezime` AS `prezime` from ((`projekcije_pogled` join `rezervacije` on((`projekcije_pogled`.`projekcija_id` = `rezervacije`.`projekcija_id`))) join `korisnici` on((`rezervacije`.`korisnik_id` = `korisnici`.`korisnik_id`))) where (`rezervacije`.`obrisan` = '0');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dnevnik`
--
ALTER TABLE `dnevnik`
  ADD CONSTRAINT `fk_dnevnik_korisnici1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_dnevnik_tip_radnje1` FOREIGN KEY (`tip_radnje_id`) REFERENCES `tip_radnje` (`tip_radnje_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dvorane`
--
ALTER TABLE `dvorane`
  ADD CONSTRAINT `fk_dvorane_lokacije1` FOREIGN KEY (`lokacija_id`) REFERENCES `lokacije` (`lokacija_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `filmovi`
--
ALTER TABLE `filmovi`
  ADD CONSTRAINT `fk_filmovi_drzave1` FOREIGN KEY (`drzava_id`) REFERENCES `drzave` (`drzava_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_filmovi_slike1` FOREIGN KEY (`slika_id`) REFERENCES `slike` (`slika_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_filmovi_zanrovi1` FOREIGN KEY (`zanr_id`) REFERENCES `zanrovi` (`zanr_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `filmovi_ocjene`
--
ALTER TABLE `filmovi_ocjene`
  ADD CONSTRAINT `fk_filmovi_ocjene_filmovi1` FOREIGN KEY (`film_id`) REFERENCES `filmovi` (`film_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_filmovi_ocjene_korisnici1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `korisnici`
--
ALTER TABLE `korisnici`
  ADD CONSTRAINT `fk_korisnici_drzave1` FOREIGN KEY (`drzava_id`) REFERENCES `drzave` (`drzava_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_korisnici_slike1` FOREIGN KEY (`slika_id`) REFERENCES `slike` (`slika_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_korisnici_tip_korisnika1` FOREIGN KEY (`tip_id`) REFERENCES `tip_korisnika` (`tip_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `lokacije`
--
ALTER TABLE `lokacije`
  ADD CONSTRAINT `fk_lokacije_drzave1` FOREIGN KEY (`drzava_id`) REFERENCES `drzave` (`drzava_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lokacije_korisnici1` FOREIGN KEY (`moderator_id`) REFERENCES `korisnici` (`korisnik_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `lokacije_ocjene`
--
ALTER TABLE `lokacije_ocjene`
  ADD CONSTRAINT `fk_lokacije_ocjene_korisnici1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lokacije_ocjene_lokacije1` FOREIGN KEY (`lokacija_id`) REFERENCES `lokacije` (`lokacija_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projekcije`
--
ALTER TABLE `projekcije`
  ADD CONSTRAINT `fk_projekcije_dvorane1` FOREIGN KEY (`dvorana_id`) REFERENCES `dvorane` (`dvorana_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_projekcije_filmovi1` FOREIGN KEY (`film_id`) REFERENCES `filmovi` (`film_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rezervacije`
--
ALTER TABLE `rezervacije`
  ADD CONSTRAINT `fk_rezervacije_korisnici1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnici` (`korisnik_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rezervacije_projekcije1` FOREIGN KEY (`projekcija_id`) REFERENCES `projekcije` (`projekcija_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sjedala`
--
ALTER TABLE `sjedala`
  ADD CONSTRAINT `fk_sjedala_dvorane1` FOREIGN KEY (`dvorana_id`) REFERENCES `dvorane` (`dvorana_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sjedalo_rezervacija`
--
ALTER TABLE `sjedalo_rezervacija`
  ADD CONSTRAINT `fk_sjedalo_rezervacija_rezervacije1` FOREIGN KEY (`rezervacija_id`) REFERENCES `rezervacije` (`rezervacija_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sjedalo_rezervacija_sjedala1` FOREIGN KEY (`sjedalo_id`) REFERENCES `sjedala` (`sjedalo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ulaznice`
--
ALTER TABLE `ulaznice`
  ADD CONSTRAINT `fk_ulaznice_rezervacije1` FOREIGN KEY (`rezervacija_id`) REFERENCES `rezervacije` (`rezervacija_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ulaznice_slike1` FOREIGN KEY (`slika_id`) REFERENCES `slike` (`slika_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `ulaznice_oznake`
--
ALTER TABLE `ulaznice_oznake`
  ADD CONSTRAINT `fk_ulaznice_oznake_oznake1` FOREIGN KEY (`oznaka_id`) REFERENCES `oznake` (`oznaka_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ulaznice_oznake_ulaznice1` FOREIGN KEY (`ulaznica_id`) REFERENCES `ulaznice` (`ulaznica_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
