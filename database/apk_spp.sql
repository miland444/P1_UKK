-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2023 at 06:06 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apk_spp`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_siswa` ()  NO SQL
BEGIN
	SELECT `tbl_siswa`.*, `tbl_kelas`.`nama_kelas`, `tbl_spp`.`tahun`
                FROM `tbl_siswa` JOIN `tbl_kelas`
                ON `tbl_siswa`.`id_kelas` = `tbl_kelas`.`id_kelas`
                JOIN `tbl_spp` ON `tbl_siswa` .`id_spp` = `tbl_spp`.`id_spp` ORDER BY `tbl_siswa`.`NISN`, `tbl_siswa`.`id_kelas` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `kelas_get` ()  NO SQL
BEGIN
	SELECT `tbl_kelas`.*, `tbl_jurusan`.`jurusan` FROM `tbl_kelas` JOIN `tbl_jurusan` ON `tbl_kelas`.`id_jurusan` = `tbl_jurusan`.`id_jurusan` ORDER BY `tbl_kelas`.`id_jurusan` ASC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `level_get` (IN `level` INT)  NO SQL
BEGIN
	SELECT * FROM tbl_level WHERE level = id_level;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_check` (IN `user` VARCHAR(100), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_petugas WHERE user = username AND pass = password_petugas;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `siswa_check` (IN `user` VARCHAR(10), IN `pass` VARCHAR(225))  NO SQL
BEGIN
	SELECT * FROM tbl_siswa WHERE user = nisn AND pass = nis;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_jurusan`
--

CREATE TABLE `tbl_jurusan` (
  `ID_JURUSAN` int(11) NOT NULL,
  `JURUSAN` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_jurusan`
--

INSERT INTO `tbl_jurusan` (`ID_JURUSAN`, `JURUSAN`) VALUES
(13, 'Desain Pemodelan dan Informasi Bangunan'),
(14, 'Teknik Elektronika Industri'),
(15, 'Teknik Pemesinan');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `ID_KELAS` int(11) NOT NULL,
  `ID_JURUSAN` int(11) DEFAULT NULL,
  `NAMA_KELAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`ID_KELAS`, `ID_JURUSAN`, `NAMA_KELAS`) VALUES
(31, 13, 'X DPIB'),
(32, 13, 'XI DPIB'),
(33, 13, 'XII DPIB'),
(34, 14, 'X TEI'),
(35, 14, 'XI TEI'),
(37, 14, 'XII TEI');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_level`
--

CREATE TABLE `tbl_level` (
  `ID_LEVEL` int(11) NOT NULL,
  `LEVEL` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_level`
--

INSERT INTO `tbl_level` (`ID_LEVEL`, `LEVEL`) VALUES
(1, 'Admin'),
(2, 'Petugas'),
(3, 'Siswa');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `log_id` int(11) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_user` varchar(50) NOT NULL,
  `log_tipe` varchar(50) NOT NULL,
  `log_aksi` varchar(50) NOT NULL,
  `log_assign_to` varchar(50) NOT NULL,
  `log_assign_type` enum('petugas','siswa','spp','kelas','jurusan','transaksi','cetak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`log_id`, `log_time`, `log_user`, `log_tipe`, `log_aksi`, `log_assign_to`, `log_assign_type`) VALUES
(9, '2020-02-23 13:07:42', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(10, '2020-02-23 13:08:06', 'Administrator', 'petugas', 'menambah data petugas', '', ''),
(11, '2020-02-23 13:15:11', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(12, '2020-02-23 13:15:16', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(13, '2020-02-23 13:15:19', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(14, '2020-02-23 13:15:27', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(15, '2020-02-23 14:06:44', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(16, '2020-02-23 14:07:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(17, '2020-02-23 14:07:36', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(18, '2020-02-23 14:08:13', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(19, '2020-02-24 12:38:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(20, '2020-02-24 12:44:24', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(21, '2020-02-25 12:00:19', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(22, '2020-02-26 10:52:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(23, '2020-02-26 10:54:51', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(24, '2020-02-26 10:55:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(25, '2020-02-26 10:56:25', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(26, '2020-02-26 10:58:30', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(27, '2020-02-26 11:01:44', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(28, '2020-02-26 11:02:05', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(29, '2020-02-26 11:41:33', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(30, '2020-02-26 11:41:37', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(31, '2020-02-26 11:41:41', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(32, '2020-02-26 11:43:40', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(33, '2020-02-26 12:03:14', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(34, '2020-02-26 12:07:03', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(35, '2020-02-26 12:07:53', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(36, '2020-02-26 15:22:58', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(37, '2020-02-26 15:23:43', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(38, '2020-02-26 15:33:49', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(39, '2020-02-26 15:35:29', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(40, '2020-02-26 16:26:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(41, '2020-02-26 16:30:38', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(42, '2020-02-26 16:36:52', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(43, '2020-02-26 16:37:34', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(44, '2020-02-26 16:39:35', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(45, '2020-02-26 17:21:22', 'Petugas', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(46, '2020-02-27 12:05:28', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(47, '2020-02-27 12:05:50', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(48, '2020-02-27 12:56:21', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(49, '2020-02-28 06:53:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(50, '2020-02-28 07:16:29', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(51, '2020-02-28 07:29:44', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(52, '2020-02-28 07:30:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(53, '2020-02-28 07:31:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(54, '2020-02-28 07:50:13', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(55, '2020-02-28 08:29:01', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(56, '2020-02-28 08:30:11', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(57, '2020-02-28 08:31:13', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(58, '2020-02-28 08:31:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(59, '2020-02-28 08:32:08', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(60, '2020-02-28 08:35:07', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(61, '2020-02-28 08:35:20', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(62, '2020-02-28 08:35:34', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(63, '2020-02-28 08:36:10', 'Administrator', 'cetak', 'Mencetak laporan data siswa', '', ''),
(64, '2020-02-28 08:36:21', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(65, '2020-02-28 08:36:37', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(66, '2020-02-28 08:37:18', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(67, '2020-02-28 08:37:33', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(68, '2020-02-28 08:38:12', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(69, '2020-02-28 08:38:18', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(70, '2020-02-28 09:21:03', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(71, '2020-02-28 09:21:34', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(72, '2023-01-27 02:20:07', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(73, '2023-01-27 06:32:34', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(74, '2023-01-27 06:33:06', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(75, '2023-01-27 06:35:10', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(76, '2023-01-27 06:35:11', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(77, '2023-01-27 06:35:12', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(78, '2023-01-27 06:37:21', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(79, '2023-01-27 06:38:18', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(80, '2023-01-27 06:38:32', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(81, '2023-01-27 06:39:11', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(82, '2023-01-27 06:41:07', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(83, '2023-01-27 06:41:27', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(84, '2023-01-27 06:42:00', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(85, '2023-01-27 06:42:26', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(86, '2023-01-27 06:42:39', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(87, '2023-01-27 06:45:32', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(88, '2023-02-01 07:17:00', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(89, '2023-02-01 07:57:00', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(90, '2023-02-03 01:04:45', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(91, '2023-02-03 01:06:25', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(92, '2023-02-03 01:07:06', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(93, '2023-02-03 01:07:07', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(94, '2023-02-03 01:07:13', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(95, '2023-02-03 01:07:28', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(96, '2023-02-03 01:07:48', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(97, '2023-02-03 01:08:02', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(98, '2023-02-03 01:08:27', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(99, '2023-02-03 01:08:28', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(100, '2023-02-03 01:08:46', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(101, '2023-02-03 01:08:53', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(102, '2023-02-03 01:09:16', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(103, '2023-02-03 01:09:35', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(104, '2023-02-03 01:09:35', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(105, '2023-02-03 01:09:51', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(106, '2023-02-03 01:09:59', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(107, '2023-02-03 01:10:20', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(108, '2023-02-03 01:10:32', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(109, '2023-02-03 01:10:33', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(110, '2023-02-03 01:10:39', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(111, '2023-02-03 01:10:50', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(112, '2023-02-03 01:11:15', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(113, '2023-02-03 01:11:17', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(114, '2023-02-03 01:11:54', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(115, '2023-02-03 01:12:11', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(116, '2023-02-03 01:12:57', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(117, '2023-02-03 01:12:58', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(118, '2023-02-03 01:13:05', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(119, '2023-02-03 01:13:19', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(120, '2023-02-03 01:13:31', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(121, '2023-02-03 01:13:31', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(122, '2023-02-03 01:13:42', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(123, '2023-02-03 01:13:56', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(124, '2023-02-03 01:14:16', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(125, '2023-02-03 01:14:30', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(126, '2023-02-03 01:14:58', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(127, '2023-02-03 01:16:51', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(128, '2023-02-03 01:17:01', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(129, '2023-02-03 01:17:08', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(130, '2023-02-03 01:25:39', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(131, '2023-02-03 01:25:39', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(132, '2023-02-03 01:25:43', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(133, '2023-02-03 01:25:47', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(134, '2023-02-03 01:30:32', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(135, '2023-02-03 01:32:09', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(136, '2023-02-03 01:32:34', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(137, '2023-02-03 01:33:25', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(138, '2023-02-03 01:36:59', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(139, '2023-02-03 01:37:37', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(140, '2023-02-03 01:37:46', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(141, '2023-02-03 01:40:47', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(142, '2023-02-03 01:41:13', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(143, '2023-02-03 02:02:19', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(144, '2023-02-03 02:02:41', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(145, '2023-02-03 02:03:05', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(146, '2023-02-03 02:04:18', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(147, '2023-02-03 02:05:27', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(148, '2023-02-03 02:05:42', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(149, '2023-02-03 02:05:53', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(150, '2023-02-03 02:06:06', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(151, '2023-02-03 02:06:28', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(152, '2023-02-03 02:07:32', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(153, '2023-02-03 02:07:47', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(154, '2023-02-03 02:08:01', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(155, '2023-02-03 02:08:10', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(156, '2023-02-03 02:08:21', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(157, '2023-02-03 02:08:33', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(158, '2023-02-03 02:08:42', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(159, '2023-02-03 02:08:52', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(160, '2023-02-03 02:09:08', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(161, '2023-02-03 02:09:29', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(162, '2023-02-03 02:11:05', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(163, '2023-02-03 02:11:08', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(164, '2023-02-03 02:15:49', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(165, '2023-02-03 02:16:01', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(166, '2023-02-03 02:16:16', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(167, '2023-02-03 02:16:18', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(168, '2023-02-03 02:16:43', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(169, '2023-02-03 02:17:19', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(170, '2023-02-03 02:17:34', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(171, '2023-02-03 02:17:55', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(172, '2023-02-03 02:21:36', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(173, '2023-02-03 02:27:18', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(174, '2023-02-03 02:27:42', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(175, '2023-02-03 02:30:25', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(176, '2023-02-03 02:32:22', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(177, '2023-02-03 02:32:28', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(178, '2023-02-06 04:53:23', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(179, '2023-02-06 06:08:01', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(180, '2023-02-06 06:08:09', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(181, '2023-02-06 06:08:36', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(182, '2023-02-06 06:10:42', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(183, '2023-02-06 06:11:06', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(184, '2023-02-06 06:12:34', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(185, '2023-02-06 06:14:43', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(186, '2023-02-06 06:22:50', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(187, '2023-02-06 06:24:27', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(188, '2023-02-06 06:25:41', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(189, '2023-02-06 06:25:52', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(190, '2023-02-06 06:26:14', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(191, '2023-02-08 01:00:07', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(192, '2023-02-08 01:06:28', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(193, '2023-02-08 01:14:24', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(194, '2023-02-08 01:15:42', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(195, '2023-02-08 01:16:39', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(196, '2023-02-08 01:16:54', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(197, '2023-02-08 01:19:33', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(198, '2023-02-08 01:20:54', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(199, '2023-02-08 01:20:58', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(200, '2023-02-08 01:22:12', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(201, '2023-02-08 01:22:19', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(202, '2023-02-08 01:22:43', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(203, '2023-02-08 01:22:51', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(204, '2023-02-08 01:23:44', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(205, '2023-02-08 01:23:57', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(206, '2023-02-08 01:24:38', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(207, '2023-02-08 01:25:00', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(208, '2023-02-08 01:25:17', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(209, '2023-02-08 01:25:32', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(210, '2023-02-08 01:53:29', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(211, '2023-02-08 01:53:31', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(212, '2023-02-08 01:53:33', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(213, '2023-02-08 01:53:42', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(214, '2023-02-08 01:53:43', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(215, '2023-02-08 01:54:05', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(216, '2023-02-08 02:09:25', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(217, '2023-02-08 02:09:46', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(218, '2023-02-08 02:09:54', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(219, '2023-02-08 02:10:03', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(220, '2023-02-08 02:10:12', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(221, '2023-02-08 07:18:29', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(222, '2023-02-08 07:19:59', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(223, '2023-02-08 07:21:24', 'Milanda Yulihari', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(224, '2023-02-08 07:21:25', 'Milanda Yulihari', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(225, '2023-02-10 01:49:09', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(226, '2023-02-10 01:49:12', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(227, '2023-02-10 01:49:35', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(228, '2023-02-10 01:51:09', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(229, '2023-02-10 01:51:12', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(230, '2023-02-10 01:54:41', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(231, '2023-02-10 01:55:01', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(232, '2023-02-10 01:59:42', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(233, '2023-02-10 02:00:25', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(234, '2023-02-10 02:00:43', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(235, '2023-02-10 02:01:03', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(236, '2023-02-10 02:01:14', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(237, '2023-02-10 02:01:38', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(238, '2023-02-10 02:01:46', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(239, '2023-02-10 02:02:08', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(240, '2023-02-10 02:02:59', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(241, '2023-02-10 02:03:31', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(242, '2023-02-10 02:06:54', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(243, '2023-02-10 02:07:02', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(244, '2023-02-11 01:43:39', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(245, '2023-02-11 01:43:51', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(246, '2023-02-11 01:44:29', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(247, '2023-02-11 01:48:46', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(248, '2023-02-11 01:49:10', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(249, '2023-02-11 01:49:15', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(250, '2023-02-11 01:49:54', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(251, '2023-02-11 02:06:43', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(252, '2023-02-11 02:39:14', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(253, '2023-02-11 02:39:17', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(254, '2023-02-13 05:15:53', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(255, '2023-02-15 03:34:38', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(256, '2023-02-15 03:36:36', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(257, '2023-02-15 03:37:29', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(258, '2023-02-17 04:16:40', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(259, '2023-02-17 05:52:56', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(260, '2023-02-17 07:19:44', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(261, '2023-02-17 07:20:11', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(262, '2023-02-17 07:21:02', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(263, '2023-02-17 07:21:27', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(264, '2023-02-17 07:21:31', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(265, '2023-02-18 02:08:16', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(266, '2023-02-18 03:30:12', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(267, '2023-02-18 03:30:31', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(268, '2023-02-18 03:31:17', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(269, '2023-02-18 03:31:49', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(270, '2023-02-18 03:32:11', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(271, '2023-02-18 03:33:22', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(272, '2023-02-18 03:33:36', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(273, '2023-02-18 03:33:44', 'Administrator', 'petugas', 'Mengedit data petugas', '', ''),
(274, '2023-02-18 03:35:01', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(275, '2023-02-18 03:36:32', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(276, '2023-02-18 03:36:50', 'Administrator', 'siswa', 'Mengedit data siswa', '', ''),
(277, '2023-02-18 03:36:59', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(278, '2023-02-18 03:37:23', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(279, '2023-02-18 03:37:34', 'Administrator', 'spp', 'Mengedit data spp', '', ''),
(280, '2023-02-18 03:37:37', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(281, '2023-02-18 03:37:53', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(282, '2023-02-18 03:38:11', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(283, '2023-02-18 03:38:19', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(284, '2023-02-18 03:38:51', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(285, '2023-02-18 03:38:58', 'Administrator', 'jurusan', 'Mengedit data jurusan', '', ''),
(286, '2023-02-18 03:39:01', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(287, '2023-02-18 03:39:45', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(288, '2023-02-18 03:39:48', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(289, '2023-02-18 03:39:55', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(290, '2023-02-18 03:39:59', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(291, '2023-02-18 03:42:30', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(292, '2023-02-18 03:42:48', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(293, '2023-02-18 03:44:05', 'Milanda Yulihari', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(294, '2023-02-18 03:44:07', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(295, '2023-02-18 04:21:59', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(296, '2023-02-18 07:20:18', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(297, '2023-02-18 07:20:51', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(298, '2023-02-18 07:21:35', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(299, '2023-02-18 07:21:48', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(300, '2023-02-18 07:22:26', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(301, '2023-02-18 07:25:41', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(302, '2023-02-20 01:32:21', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(303, '2023-02-20 01:33:52', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(304, '2023-02-20 01:33:57', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(305, '2023-02-20 01:34:31', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(306, '2023-02-20 01:34:34', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(307, '2023-02-20 01:36:07', 'Administrator', 'kelas', 'Mengedit data kelas', '', ''),
(308, '2023-02-20 01:36:45', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(309, '2023-02-20 01:36:56', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(310, '2023-02-20 01:37:40', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(311, '2023-02-20 01:37:43', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(312, '2023-02-20 01:38:08', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(313, '2023-02-20 01:38:57', 'Milanda Yulihari', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(314, '2023-02-20 01:39:00', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(315, '2023-02-20 01:39:05', 'Milanda Yulihari', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(316, '2023-02-20 02:05:20', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(317, '2023-02-20 02:57:23', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(318, '2023-02-22 00:41:30', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(319, '2023-02-22 00:43:17', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(320, '2023-02-22 00:47:20', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(321, '2023-02-22 02:49:15', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(322, '2023-02-22 07:03:36', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(323, '2023-02-22 07:28:52', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(324, '2023-02-24 06:03:31', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(325, '2023-02-24 06:03:36', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(326, '2023-02-25 02:06:02', 'Administrator', 'petugas', 'Merubah password petugas', '', ''),
(327, '2023-02-25 02:43:47', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(328, '2023-02-25 02:45:34', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(329, '2023-02-25 02:46:01', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(330, '2023-02-25 02:47:28', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(331, '2023-02-25 02:47:32', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(332, '2023-02-25 02:48:02', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(333, '2023-02-25 02:48:27', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(334, '2023-02-25 02:49:05', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(335, '2023-02-25 02:49:30', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(336, '2023-02-25 02:49:49', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(337, '2023-02-25 02:50:06', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(338, '2023-02-25 02:50:27', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(339, '2023-02-25 02:50:47', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(340, '2023-02-25 02:51:04', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(341, '2023-02-25 02:51:42', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(342, '2023-02-25 02:53:56', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(343, '2023-02-25 02:54:11', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(344, '2023-02-25 02:54:21', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(345, '2023-03-01 00:22:36', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(346, '2023-03-01 00:23:03', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(347, '2023-03-01 00:23:18', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(348, '2023-03-01 00:23:28', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(349, '2023-03-01 00:23:37', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(350, '2023-03-01 00:23:40', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(351, '2023-03-01 00:23:43', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(352, '2023-03-01 00:23:45', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(353, '2023-03-01 00:23:47', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(354, '2023-03-01 00:23:56', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(355, '2023-03-01 00:23:58', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(356, '2023-03-01 00:24:00', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(357, '2023-03-01 00:29:57', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(358, '2023-03-01 00:30:32', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(359, '2023-03-01 00:31:11', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(360, '2023-03-01 00:31:29', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(361, '2023-03-01 00:32:32', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(362, '2023-03-01 00:32:49', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(363, '2023-03-01 00:33:04', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(364, '2023-03-01 00:33:22', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(365, '2023-03-01 00:33:36', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(366, '2023-03-01 00:33:54', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(367, '2023-03-01 00:34:15', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(368, '2023-03-01 00:34:18', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(369, '2023-03-01 00:35:07', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(370, '2023-03-01 00:35:32', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(371, '2023-03-01 00:36:01', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(372, '2023-03-01 00:38:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(373, '2023-03-01 00:39:49', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(374, '2023-03-01 00:40:52', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(375, '2023-03-01 00:45:59', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(376, '2023-03-01 00:52:24', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(377, '2023-03-03 00:17:42', 'Administrator', 'siswa', 'Menghapus data siswa', '', ''),
(378, '2023-03-03 00:43:25', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(379, '2023-03-03 00:43:31', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(380, '2023-03-03 00:43:40', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(381, '2023-03-03 00:45:07', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(382, '2023-03-03 00:45:55', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(383, '2023-03-03 00:46:02', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(384, '2023-03-03 00:52:27', 'Administrator', 'jurusan', 'Menghapus data jurusan', '', ''),
(385, '2023-03-03 01:56:49', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(386, '2023-03-03 01:56:52', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(387, '2023-03-03 01:57:17', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(388, '2023-03-03 01:57:49', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(389, '2023-03-03 01:58:05', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(390, '2023-03-03 01:59:47', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(391, '2023-03-03 02:01:00', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(392, '2023-03-03 02:02:09', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(393, '2023-03-03 02:05:23', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(394, '2023-03-03 02:06:31', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(395, '2023-03-03 02:07:37', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(396, '2023-03-03 02:09:08', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(397, '2023-03-03 02:09:25', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(398, '2023-03-03 02:10:53', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(399, '2023-03-04 01:19:38', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(400, '2023-03-04 01:20:32', 'Milanda Yulihari', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(401, '2023-03-04 01:35:52', 'Milanda Yulihari', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(402, '2023-03-04 05:35:49', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(403, '2023-03-04 05:35:53', 'Administrator', 'petugas', 'Menghapus data petugas', '', ''),
(404, '2023-03-04 05:39:15', 'Administrator', 'petugas', 'Menambah data petugas', '', ''),
(405, '2023-03-06 05:29:51', 'Administrator', 'siswa', 'Menambah data siswa', '', ''),
(406, '2023-03-06 06:06:46', 'Administrator', 'spp', 'Menghapus data spp', '', ''),
(407, '2023-03-06 06:15:32', 'Administrator', 'spp', 'Menambah data spp', '', ''),
(408, '2023-03-06 06:29:45', 'Administrator', 'kelas', 'Menghapus data kelas', '', ''),
(409, '2023-03-06 06:33:20', 'Administrator', 'kelas', 'Menambah data kelas', '', ''),
(410, '2023-03-06 06:55:01', 'Administrator', 'jurusan', 'Menambah data jurusan', '', ''),
(411, '2023-03-06 07:14:56', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(412, '2023-03-06 07:17:02', 'Administrator', 'pembayaran', 'Menghapus data transaksi pembayaran', '', ''),
(413, '2023-03-06 07:17:04', 'Administrator', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(414, '2023-03-06 07:17:10', 'Administrator', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(415, '2023-03-06 07:32:57', 'Administrator', 'cetak', 'Mencetak laporan data petugas', '', ''),
(416, '2023-03-06 07:38:10', 'Administrator', 'cetak', 'Mencetak laporan data transaksi pembayaran', '', ''),
(417, '2023-03-06 08:12:39', 'Milanda Yulihari', 'pembayaran', 'Menambah data transaksi pembayaran', '', ''),
(418, '2023-03-06 08:14:53', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', ''),
(419, '2023-03-06 08:15:00', 'Milanda Yulihari', 'cetak', 'Mencetak Struk pembayaran', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pembayaran`
--

CREATE TABLE `tbl_pembayaran` (
  `ID_PEMBAYARAN` int(11) NOT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `NISN` char(10) DEFAULT NULL,
  `TGL_BAYAR` date DEFAULT NULL,
  `JATUH_TEMPO` date NOT NULL,
  `BULAN_DIBAYAR` varchar(9) DEFAULT NULL,
  `TAHUN_DIBAYAR` varchar(4) DEFAULT NULL,
  `ID_SPP` int(11) NOT NULL,
  `JUMLAH_BAYAR` int(11) NOT NULL,
  `KET` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_pembayaran`
--

INSERT INTO `tbl_pembayaran` (`ID_PEMBAYARAN`, `ID_PETUGAS`, `NISN`, `TGL_BAYAR`, `JATUH_TEMPO`, `BULAN_DIBAYAR`, `TAHUN_DIBAYAR`, `ID_SPP`, `JUMLAH_BAYAR`, `KET`) VALUES
(181, 1, '1111111111', '2023-03-03', '2022-07-20', 'Juli', '2022', 10, 50000, 'LUNAS'),
(182, 1, '1111111111', NULL, '2022-08-20', 'Agustus', '2022', 10, 50000, ''),
(183, 1, '1111111111', NULL, '2022-09-20', 'September', '2022', 10, 50000, ''),
(184, 1, '1111111111', NULL, '2022-10-20', 'Oktober', '2022', 10, 50000, ''),
(185, 1, '1111111111', NULL, '2022-11-20', 'November', '2022', 10, 50000, ''),
(186, 1, '1111111111', NULL, '2022-12-20', 'Desember', '2022', 10, 50000, ''),
(187, 1, '1111111111', NULL, '2023-01-20', 'Januari', '2023', 10, 50000, ''),
(188, 1, '1111111111', NULL, '2023-02-20', 'Februari', '2023', 10, 50000, ''),
(189, 1, '1111111111', NULL, '2023-03-20', 'Maret', '2023', 10, 50000, ''),
(190, 1, '1111111111', NULL, '2023-04-20', 'April', '2023', 10, 50000, ''),
(191, 1, '1111111111', NULL, '2023-05-20', 'Mei', '2023', 10, 50000, ''),
(192, 1, '1111111111', NULL, '2023-06-20', 'Juni', '2023', 10, 50000, ''),
(193, 1, '2222222222', '2023-03-04', '2023-07-20', 'Juli', '2023', 11, 55000, 'LUNAS'),
(194, 1, '2222222222', NULL, '2023-08-20', 'Agustus', '2023', 11, 55000, ''),
(195, 1, '2222222222', NULL, '2023-09-20', 'September', '2023', 11, 55000, ''),
(196, 1, '2222222222', NULL, '2023-10-20', 'Oktober', '2023', 11, 55000, ''),
(197, 1, '2222222222', NULL, '2023-11-20', 'November', '2023', 11, 55000, ''),
(198, 1, '2222222222', NULL, '2023-12-20', 'Desember', '2023', 11, 55000, ''),
(199, 1, '2222222222', NULL, '2024-01-20', 'Januari', '2024', 11, 55000, ''),
(200, 1, '2222222222', NULL, '2024-02-20', 'Februari', '2024', 11, 55000, ''),
(201, 1, '2222222222', NULL, '2024-03-20', 'Maret', '2024', 11, 55000, ''),
(202, 1, '2222222222', NULL, '2024-04-20', 'April', '2024', 11, 55000, ''),
(203, 1, '2222222222', NULL, '2024-05-20', 'Mei', '2024', 11, 55000, ''),
(204, 1, '2222222222', NULL, '2024-06-20', 'Juni', '2024', 11, 55000, ''),
(217, 18, '4444444444', '2023-03-06', '2022-07-20', 'Juli', '2022', 10, 50000, 'LUNAS'),
(218, 1, '4444444444', NULL, '2022-08-20', 'Agustus', '2022', 10, 50000, ''),
(219, 1, '4444444444', NULL, '2022-09-20', 'September', '2022', 10, 50000, ''),
(220, 1, '4444444444', NULL, '2022-10-20', 'Oktober', '2022', 10, 50000, ''),
(221, 1, '4444444444', NULL, '2022-11-20', 'November', '2022', 10, 50000, ''),
(222, 1, '4444444444', NULL, '2022-12-20', 'Desember', '2022', 10, 50000, ''),
(223, 1, '4444444444', NULL, '2023-01-20', 'Januari', '2023', 10, 50000, ''),
(224, 1, '4444444444', NULL, '2023-02-20', 'Februari', '2023', 10, 50000, ''),
(225, 1, '4444444444', NULL, '2023-03-20', 'Maret', '2023', 10, 50000, ''),
(226, 1, '4444444444', NULL, '2023-04-20', 'April', '2023', 10, 50000, ''),
(227, 1, '4444444444', NULL, '2023-05-20', 'Mei', '2023', 10, 50000, ''),
(228, 1, '4444444444', NULL, '2023-06-20', 'Juni', '2023', 10, 50000, ''),
(229, 1, '5555555555', NULL, '2023-07-20', 'Juli', '2023', 11, 55000, ''),
(230, 1, '5555555555', NULL, '2023-08-20', 'Agustus', '2023', 11, 55000, ''),
(231, 1, '5555555555', NULL, '2023-09-20', 'September', '2023', 11, 55000, ''),
(232, 1, '5555555555', NULL, '2023-10-20', 'Oktober', '2023', 11, 55000, ''),
(233, 1, '5555555555', NULL, '2023-11-20', 'November', '2023', 11, 55000, ''),
(234, 1, '5555555555', NULL, '2023-12-20', 'Desember', '2023', 11, 55000, ''),
(235, 1, '5555555555', NULL, '2024-01-20', 'Januari', '2024', 11, 55000, ''),
(236, 1, '5555555555', NULL, '2024-02-20', 'Februari', '2024', 11, 55000, ''),
(237, 1, '5555555555', NULL, '2024-03-20', 'Maret', '2024', 11, 55000, ''),
(238, 1, '5555555555', NULL, '2024-04-20', 'April', '2024', 11, 55000, ''),
(239, 1, '5555555555', NULL, '2024-05-20', 'Mei', '2024', 11, 55000, ''),
(240, 1, '5555555555', NULL, '2024-06-20', 'Juni', '2024', 11, 55000, ''),
(253, 1, '7777777777', '2023-03-06', '2022-07-20', 'Juli', '2022', 10, 50000, 'LUNAS'),
(254, 1, '7777777777', NULL, '2022-08-20', 'Agustus', '2022', 10, 50000, ''),
(255, 1, '7777777777', NULL, '2022-09-20', 'September', '2022', 10, 50000, ''),
(256, 1, '7777777777', NULL, '2022-10-20', 'Oktober', '2022', 10, 50000, ''),
(257, 1, '7777777777', NULL, '2022-11-20', 'November', '2022', 10, 50000, ''),
(258, 1, '7777777777', NULL, '2022-12-20', 'Desember', '2022', 10, 50000, ''),
(259, 1, '7777777777', NULL, '2023-01-20', 'Januari', '2023', 10, 50000, ''),
(260, 1, '7777777777', NULL, '2023-02-20', 'Februari', '2023', 10, 50000, ''),
(261, 1, '7777777777', NULL, '2023-03-20', 'Maret', '2023', 10, 50000, ''),
(262, 1, '7777777777', NULL, '2023-04-20', 'April', '2023', 10, 50000, ''),
(263, 1, '7777777777', NULL, '2023-05-20', 'Mei', '2023', 10, 50000, ''),
(264, 1, '7777777777', NULL, '2023-06-20', 'Juni', '2023', 10, 50000, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_petugas`
--

CREATE TABLE `tbl_petugas` (
  `ID_PETUGAS` int(11) NOT NULL,
  `ID_LEVEL` int(11) DEFAULT NULL,
  `USERNAME` varchar(100) DEFAULT NULL,
  `PASSWORD_PETUGAS` varchar(225) DEFAULT NULL,
  `NAMA_PETUGAS` varchar(50) DEFAULT NULL,
  `DESKRIPSI` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_petugas`
--

INSERT INTO `tbl_petugas` (`ID_PETUGAS`, `ID_LEVEL`, `USERNAME`, `PASSWORD_PETUGAS`, `NAMA_PETUGAS`, `DESKRIPSI`) VALUES
(1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', 'admin'),
(18, 2, 'milandayshr', 'ed8d7337d6b9f62b9fd10bb7969f1138', 'Milanda Yulihari', 'sempolbabi'),
(21, 2, 'jjh', '041e3724cbc8b0be4c129b5a17e1b04b', 'Jung Jaehyun', 'cilokayam'),
(23, 2, 'gajahricarica', '5295d4d2995f645c2d451f167cd8514a', 'Andre Widyatmoko', 'ayam123');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `NISN` char(10) NOT NULL,
  `ID_KELAS` int(11) DEFAULT NULL,
  `ID_SPP` int(11) DEFAULT NULL,
  `NIS` char(8) DEFAULT NULL,
  `NAMA` varchar(100) DEFAULT NULL,
  `ALAMAT` text,
  `NO_TELP` varchar(13) DEFAULT NULL,
  `TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`NISN`, `ID_KELAS`, `ID_SPP`, `NIS`, `NAMA`, `ALAMAT`, `NO_TELP`, `TIMESTAMP`) VALUES
('1111111111', 31, 10, '11111110', 'Kalingga Kafka Mangkualam', 'Rejoagung', '085850775500', '2023-03-03 01:59:43'),
('2222222222', 32, 11, '22222220', 'Agam Rafif Pratama', 'Semboro Kidul', '085233111133', '2023-03-03 02:00:56'),
('4444444444', 34, 10, '44444440', 'Ricardo Torang Sangapan Siahaan', 'Sidorejo', '085744005500', '2023-03-03 02:05:21'),
('5555555555', 35, 11, '55555550', 'Andara Riana Rasyid', 'Tanggul', '085811440044', '2023-03-03 02:06:28'),
('7777777777', 31, 10, '77777770', 'Abyatar Rajendra Susilo', 'Rejoagung', '085800222200', '2023-03-06 05:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_spp`
--

CREATE TABLE `tbl_spp` (
  `ID_SPP` int(11) NOT NULL,
  `TAHUN` varchar(16) DEFAULT NULL,
  `NOMINAL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_spp`
--

INSERT INTO `tbl_spp` (`ID_SPP`, `TAHUN`, `NOMINAL`) VALUES
(10, '2022/2023', 50000),
(11, '2023/2024', 55000),
(13, '2024/2025', 60000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  ADD PRIMARY KEY (`ID_JURUSAN`);

--
-- Indexes for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`ID_KELAS`),
  ADD KEY `FK_JURUSAN` (`ID_JURUSAN`);

--
-- Indexes for table `tbl_level`
--
ALTER TABLE `tbl_level`
  ADD PRIMARY KEY (`ID_LEVEL`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD PRIMARY KEY (`ID_PEMBAYARAN`),
  ADD KEY `FK_PETUGAS` (`ID_PETUGAS`),
  ADD KEY `FK_SISWA` (`NISN`);

--
-- Indexes for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`),
  ADD KEY `FK_LEVEL` (`ID_LEVEL`);

--
-- Indexes for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD KEY `FK_KELAS` (`ID_KELAS`),
  ADD KEY `FK_SPP` (`ID_SPP`);

--
-- Indexes for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  ADD PRIMARY KEY (`ID_SPP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_jurusan`
--
ALTER TABLE `tbl_jurusan`
  MODIFY `ID_JURUSAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `ID_KELAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_level`
--
ALTER TABLE `tbl_level`
  MODIFY `ID_LEVEL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=420;

--
-- AUTO_INCREMENT for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  MODIFY `ID_PEMBAYARAN` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  MODIFY `ID_PETUGAS` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_spp`
--
ALTER TABLE `tbl_spp`
  MODIFY `ID_SPP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD CONSTRAINT `FK_JURUSAN` FOREIGN KEY (`ID_JURUSAN`) REFERENCES `tbl_jurusan` (`ID_JURUSAN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_pembayaran`
--
ALTER TABLE `tbl_pembayaran`
  ADD CONSTRAINT `FK_PETUGAS` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `tbl_petugas` (`ID_PETUGAS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SISWA` FOREIGN KEY (`NISN`) REFERENCES `tbl_siswa` (`NISN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_petugas`
--
ALTER TABLE `tbl_petugas`
  ADD CONSTRAINT `FK_LEVEL` FOREIGN KEY (`ID_LEVEL`) REFERENCES `tbl_level` (`ID_LEVEL`);

--
-- Constraints for table `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD CONSTRAINT `FK_KELAS` FOREIGN KEY (`ID_KELAS`) REFERENCES `tbl_kelas` (`ID_KELAS`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_SPP` FOREIGN KEY (`ID_SPP`) REFERENCES `tbl_spp` (`ID_SPP`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
