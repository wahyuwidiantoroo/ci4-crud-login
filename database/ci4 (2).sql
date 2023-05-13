-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 10:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ci4`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_groups`
--

INSERT INTO `auth_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Admin'),
(2, 'user', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `auth_permissions`
--

INSERT INTO `auth_permissions` (`id`, `name`, `description`) VALUES
(1, 'manage-users', 'Manage All Users'),
(2, 'manage-profile', 'Manage User\'s Profile');

-- --------------------------------------------------------

--
-- Table structure for table `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `sampul` varchar(500) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2023-01-22-005736', 'App\\Database\\Migrations\\Orang', 'default', 'App', 1674350032, 1),
(2, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1674532218, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orang`
--

CREATE TABLE `orang` (
  `id` int(5) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orang`
--

INSERT INTO `orang` (`id`, `nama`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 'Paulin Lalita Mulyani M.Pd', 'Kpg. Gatot Subroto No. 218, Pangkal Pinang 13699, Banten', '1970-02-14 21:30:57', '2023-01-22 01:59:27'),
(2, 'Jessica Mayasari S.Psi', 'Kpg. Rajawali No. 827, Sukabumi 70970, NTB', '2013-01-07 07:52:31', '2023-01-22 01:59:27'),
(3, 'Belinda Dewi Aryani', 'Ds. Labu No. 869, Mataram 49673, Jambi', '2009-11-15 22:59:03', '2023-01-22 01:59:27'),
(4, 'Titin Utami', 'Kpg. Cikutra Timur No. 167, Surakarta 71075, JaTim', '1996-03-18 05:50:25', '2023-01-22 01:59:27'),
(5, 'Wardi Marbun', 'Psr. Jakarta No. 522, Tebing Tinggi 49210, DKI', '1989-04-26 19:46:47', '2023-01-22 01:59:27'),
(6, 'Natalia Astuti S.Psi', 'Ds. Supono No. 245, Sawahlunto 61112, SulTra', '1988-02-12 15:05:49', '2023-01-22 01:59:27'),
(7, 'Ulya Handayani', 'Ki. Baing No. 727, Semarang 75891, BaBel', '2003-01-24 11:56:13', '2023-01-22 01:59:27'),
(8, 'Almira Namaga', 'Psr. Achmad No. 901, Tual 53889, Maluku', '1973-02-25 05:50:12', '2023-01-22 01:59:27'),
(9, 'Ega Sakti Budiyanto M.Farm', 'Kpg. Salam No. 699, Mataram 39755, BaBel', '2017-09-14 13:45:37', '2023-01-22 01:59:27'),
(10, 'Rangga Sihotang', 'Ds. Kartini No. 615, Tanjungbalai 10247, DIY', '1982-01-28 18:05:54', '2023-01-22 01:59:27'),
(11, 'Hilda Azalea Handayani S.Pd', 'Gg. Ketandan No. 888, Parepare 52764, KalSel', '1983-08-21 01:08:52', '2023-01-22 01:59:27'),
(12, 'Ulya Alika Handayani', 'Dk. Eka No. 108, Tanjung Pinang 74549, Lampung', '1974-12-09 21:54:14', '2023-01-22 01:59:27'),
(13, 'Cakrajiya Viktor Thamrin M.TI.', 'Kpg. Salam No. 296, Bau-Bau 90239, JaTeng', '2012-09-12 11:33:14', '2023-01-22 01:59:27'),
(14, 'Yance Farida', 'Jln. Bayam No. 709, Payakumbuh 56992, SumUt', '1973-11-21 02:46:40', '2023-01-22 01:59:27'),
(15, 'Bakiman Balamantri Maulana S.Pt', 'Dk. Gremet No. 201, Gorontalo 20034, DIY', '1994-03-06 19:13:57', '2023-01-22 01:59:27'),
(16, 'Wakiman Pradipta S.Ked', 'Ds. Tubagus Ismail No. 253, Bengkulu 96938, SumUt', '2008-05-11 15:02:23', '2023-01-22 01:59:27'),
(17, 'Dimas Dariati Irawan', 'Jr. Raya Ujungberung No. 584, Padangsidempuan 85207, KalUt', '1977-11-20 09:38:09', '2023-01-22 01:59:27'),
(18, 'Elisa Nurdiyanti', 'Ds. Supono No. 463, Jayapura 74524, JaTeng', '2021-08-18 15:14:30', '2023-01-22 01:59:27'),
(19, 'Dina Laksita', 'Ds. Gotong Royong No. 276, Surabaya 80030, SulTra', '1988-10-09 00:09:51', '2023-01-22 01:59:27'),
(20, 'Queen Agustina', 'Gg. Villa No. 223, Cilegon 44805, KalSel', '1992-11-15 09:56:52', '2023-01-22 01:59:27'),
(21, 'Padma Mardhiyah', 'Psr. Jend. A. Yani No. 220, Batu 45317, KalSel', '2017-07-24 14:24:33', '2023-01-22 01:59:27'),
(22, 'Maria Irma Novitasari S.Pt', 'Ds. Padma No. 150, Banda Aceh 57875, Jambi', '2005-06-07 19:41:48', '2023-01-22 01:59:27'),
(23, 'Rina Tantri Purwanti', 'Ki. Peta No. 985, Tomohon 59286, Banten', '1997-07-25 16:05:15', '2023-01-22 01:59:27'),
(24, 'Karen Nasyiah', 'Psr. Sutarjo No. 856, Medan 95547, SulBar', '1992-12-15 11:37:54', '2023-01-22 01:59:27'),
(25, 'Sabar Lazuardi S.Ked', 'Ds. Orang No. 732, Magelang 91393, SulUt', '2017-09-30 09:22:57', '2023-01-22 01:59:27'),
(26, 'Gadang Manullang', 'Kpg. Villa No. 467, Bima 66684, KalUt', '2022-01-14 22:12:51', '2023-01-22 01:59:27'),
(27, 'Padma Cindy Usamah S.IP', 'Jln. R.M. Said No. 665, Pariaman 95038, SulTra', '2009-11-06 16:58:51', '2023-01-22 01:59:27'),
(28, 'Jane Gabriella Wijayanti S.Psi', 'Gg. Tangkuban Perahu No. 95, Bengkulu 61969, Papua', '2019-09-28 12:51:58', '2023-01-22 01:59:27'),
(29, 'Michelle Zulaika', 'Jr. Yos No. 553, Sungai Penuh 78734, Bali', '2004-06-24 00:57:47', '2023-01-22 01:59:27'),
(30, 'Rosman Megantara', 'Ki. K.H. Maskur No. 133, Payakumbuh 54784, SulTeng', '1974-09-27 17:54:41', '2023-01-22 01:59:27'),
(31, 'Victoria Rahmi Halimah S.T.', 'Dk. R.M. Said No. 181, Kediri 78865, SulSel', '1994-06-09 23:42:47', '2023-01-22 01:59:27'),
(32, 'Kala Edi Siregar', 'Psr. Yogyakarta No. 152, Palangka Raya 95910, Papua', '1990-09-26 22:40:09', '2023-01-22 01:59:27'),
(33, 'Wadi Asman Suwarno', 'Kpg. Bah Jaya No. 648, Tanjung Pinang 92191, JaTeng', '2000-07-28 20:52:27', '2023-01-22 01:59:27'),
(34, 'Bakianto Simbolon', 'Psr. Bayam No. 92, Salatiga 73691, SulBar', '2006-03-25 20:04:34', '2023-01-22 01:59:27'),
(35, 'Paris Nuraini', 'Gg. Sudirman No. 23, Pekanbaru 67418, PapBar', '1993-12-10 19:50:00', '2023-01-22 01:59:27'),
(36, 'Elvin Daliono Hardiansyah', 'Jr. Tubagus Ismail No. 230, Palembang 23088, SumBar', '1985-10-03 22:23:28', '2023-01-22 01:59:27'),
(37, 'Daliono Cahyanto Gunarto', 'Ds. Bah Jaya No. 492, Depok 30701, Banten', '2002-10-08 17:50:23', '2023-01-22 01:59:27'),
(38, 'Daru Wijaya', 'Psr. Gambang No. 898, Pontianak 31062, NTB', '2022-11-05 08:47:57', '2023-01-22 01:59:27'),
(39, 'Kayla Uyainah', 'Jln. Baiduri No. 165, Administrasi Jakarta Utara 31970, SumSel', '1997-01-01 09:40:10', '2023-01-22 01:59:27'),
(40, 'Lalita Winarsih', 'Psr. Sutami No. 308, Mojokerto 55321, JaTeng', '2003-01-18 04:49:52', '2023-01-22 01:59:27'),
(41, 'Viktor Arsipatra Saputra', 'Dk. Abdul Rahmat No. 457, Madiun 41594, Jambi', '1993-08-28 16:13:32', '2023-01-22 01:59:27'),
(42, 'Ophelia Citra Padmasari', 'Ki. Pasir Koja No. 886, Banjar 49493, PapBar', '1987-12-06 10:42:48', '2023-01-22 01:59:27'),
(43, 'Cagak Sinaga', 'Psr. Supono No. 983, Palu 35771, Banten', '2001-09-02 23:34:14', '2023-01-22 01:59:27'),
(44, 'Sabrina Padmasari', 'Ds. Baja No. 601, Mojokerto 25282, Maluku', '2011-10-14 00:18:55', '2023-01-22 01:59:27'),
(45, 'Kariman Situmorang S.Pd', 'Ki. Suniaraja No. 855, Depok 85187, SumBar', '1996-09-20 02:36:44', '2023-01-22 01:59:27'),
(46, 'Shania Astuti', 'Dk. Jend. Sudirman No. 8, Yogyakarta 42877, PapBar', '2008-10-31 04:42:48', '2023-01-22 01:59:27'),
(47, 'Wawan Irawan', 'Gg. Rajawali No. 43, Batu 17717, Gorontalo', '2004-10-21 00:52:41', '2023-01-22 01:59:27'),
(48, 'Ilsa Purnawati S.Gz', 'Jr. Supono No. 804, Administrasi Jakarta Pusat 73796, SulTeng', '1982-12-18 19:04:34', '2023-01-22 01:59:27'),
(49, 'Dinda Rahayu S.IP', 'Ds. Nanas No. 179, Balikpapan 45163, SulTeng', '2020-09-25 11:34:38', '2023-01-22 01:59:27'),
(50, 'Marsudi Koko Damanik S.Gz', 'Kpg. Krakatau No. 621, Samarinda 45788, Aceh', '2010-05-04 17:21:01', '2023-01-22 01:59:27'),
(51, 'Dadap Hutasoit', 'Gg. Bakti No. 250, Langsa 31717, SulTeng', '2012-03-06 03:47:59', '2023-01-22 01:59:27'),
(52, 'Alika Wani Hastuti', 'Ki. Fajar No. 475, Jayapura 23768, Aceh', '2010-11-30 04:16:18', '2023-01-22 01:59:27'),
(53, 'Reza Habibi S.Psi', 'Dk. Haji No. 723, Jambi 86182, PapBar', '1972-11-10 02:23:04', '2023-01-22 01:59:27'),
(54, 'Kala Wijaya', 'Jln. Setia Budi No. 853, Palangka Raya 24616, SumBar', '2000-02-11 10:04:46', '2023-01-22 01:59:27'),
(55, 'Citra Calista Farida', 'Ds. Cikutra Barat No. 539, Bandar Lampung 17955, NTB', '1988-03-31 01:53:52', '2023-01-22 01:59:27'),
(56, 'Kenes Adriansyah', 'Jr. Juanda No. 22, Parepare 18203, KepR', '2002-08-10 07:29:44', '2023-01-22 01:59:27'),
(57, 'Joko Prabowo', 'Ds. Suryo No. 556, Tidore Kepulauan 95221, SulBar', '1991-10-14 12:57:33', '2023-01-22 01:59:27'),
(58, 'Maria Utami', 'Dk. Flores No. 543, Sorong 40666, DKI', '1980-08-23 13:25:05', '2023-01-22 01:59:27'),
(59, 'Elisa Putri Pratiwi', 'Jr. Cihampelas No. 597, Parepare 23502, Bengkulu', '1975-08-23 01:29:41', '2023-01-22 01:59:27'),
(60, 'Hafshah Nasyidah M.M.', 'Jln. Pattimura No. 985, Administrasi Jakarta Selatan 45156, Bengkulu', '1985-03-08 21:38:42', '2023-01-22 01:59:27'),
(61, 'Shakila Safitri S.Farm', 'Psr. Dipatiukur No. 422, Pariaman 30555, MalUt', '1978-02-27 08:53:08', '2023-01-22 01:59:27'),
(62, 'Diah Fitriani Hariyah S.Gz', 'Kpg. Banal No. 105, Dumai 47670, KalTeng', '2014-03-07 22:43:01', '2023-01-22 01:59:27'),
(63, 'Rahmi Hesti Melani M.Ak', 'Jr. Gremet No. 102, Tangerang 49742, BaBel', '1973-01-22 22:59:32', '2023-01-22 01:59:27'),
(64, 'Amalia Purwanti', 'Ki. Hasanuddin No. 89, Administrasi Jakarta Utara 21504, Maluku', '2014-02-23 01:46:14', '2023-01-22 01:59:27'),
(65, 'Bagya Wasita', 'Jln. Cemara No. 585, Sabang 47487, Bali', '2012-04-15 09:22:37', '2023-01-22 01:59:27'),
(66, 'Silvia Nilam Yuniar', 'Ds. Setiabudhi No. 686, Sawahlunto 55786, SulUt', '2022-07-07 09:55:04', '2023-01-22 01:59:27'),
(67, 'Patricia Safitri', 'Jln. Urip Sumoharjo No. 825, Padangpanjang 41517, KepR', '1993-11-16 11:47:45', '2023-01-22 01:59:27'),
(68, 'Lasmono Zulkarnain', 'Ds. Arifin No. 133, Sorong 58832, PapBar', '1998-03-19 17:16:14', '2023-01-22 01:59:27'),
(69, 'Hamima Andriani S.Ked', 'Kpg. Juanda No. 869, Surabaya 63708, SulUt', '1977-01-22 16:58:36', '2023-01-22 01:59:27'),
(70, 'Baktiadi Prabowo S.Pd', 'Ds. Adisucipto No. 358, Cirebon 77447, NTB', '2009-08-21 18:15:05', '2023-01-22 01:59:27'),
(71, 'Kamal Nababan', 'Psr. Abdul Rahmat No. 28, Lubuklinggau 87270, Banten', '1981-06-18 06:20:44', '2023-01-22 01:59:27'),
(72, 'Yosef Cengkal Wibisono', 'Psr. Sutarjo No. 568, Parepare 82561, KepR', '1991-01-02 08:55:27', '2023-01-22 01:59:27'),
(73, 'Soleh Simanjuntak', 'Dk. Jaksa No. 593, Pekalongan 74785, Gorontalo', '1998-06-07 06:09:55', '2023-01-22 01:59:27'),
(74, 'Lasmanto Prasasta S.Farm', 'Jln. Gajah No. 442, Banjarbaru 42872, KalTeng', '2007-02-19 06:15:24', '2023-01-22 01:59:27'),
(75, 'Alika Vera Nurdiyanti', 'Jln. Pasirkoja No. 178, Gorontalo 92870, NTB', '2014-07-29 05:05:00', '2023-01-22 01:59:27'),
(76, 'Belinda Melani', 'Jr. Camar No. 702, Parepare 38652, Bengkulu', '1983-12-14 04:14:02', '2023-01-22 01:59:27'),
(77, 'Novi Nadine Hastuti M.TI.', 'Gg. Sutami No. 576, Solok 39357, KalUt', '1993-04-07 14:23:00', '2023-01-22 01:59:27'),
(78, 'Dadap Maras Hidayat M.Kom.', 'Gg. Baranang Siang Indah No. 73, Cimahi 42810, SumSel', '1974-12-31 20:05:39', '2023-01-22 01:59:27'),
(79, 'Lukman Wijaya', 'Ds. Hang No. 214, Pematangsiantar 34921, KalBar', '1998-02-24 08:19:23', '2023-01-22 01:59:27'),
(80, 'Galih Sitorus', 'Psr. Kiaracondong No. 32, Probolinggo 79828, Lampung', '1976-06-02 07:21:28', '2023-01-22 01:59:27'),
(81, 'Lili Aryani S.E.I', 'Psr. Bata Putih No. 685, Langsa 75712, Bali', '2017-05-11 00:54:02', '2023-01-22 01:59:27'),
(82, 'Arsipatra Kuswoyo', 'Kpg. Bagas Pati No. 167, Tanjung Pinang 49295, JaBar', '2021-10-10 09:41:46', '2023-01-22 01:59:27'),
(83, 'Darsirah Sitorus', 'Dk. Bappenas No. 547, Pasuruan 51087, SulTeng', '1988-10-13 01:53:51', '2023-01-22 01:59:27'),
(84, 'Tiara Natalia Uyainah S.T.', 'Ds. Gegerkalong Hilir No. 912, Mojokerto 19781, KalUt', '2007-10-12 02:38:14', '2023-01-22 01:59:27'),
(85, 'Olivia Hesti Handayani', 'Kpg. Basoka No. 774, Administrasi Jakarta Selatan 91934, Bengkulu', '1983-06-05 15:12:38', '2023-01-22 01:59:27'),
(86, 'Julia Kuswandari', 'Psr. Dewi Sartika No. 477, Palangka Raya 63066, JaBar', '2002-08-28 06:12:24', '2023-01-22 01:59:27'),
(87, 'Siti Farida', 'Jr. Gremet No. 566, Salatiga 51031, Jambi', '2003-03-13 05:17:13', '2023-01-22 01:59:27'),
(88, 'Harja Mustofa', 'Ki. Bakau Griya Utama No. 448, Payakumbuh 21303, KalTim', '1993-03-18 12:52:30', '2023-01-22 01:59:27'),
(89, 'Sadina Halimah', 'Kpg. R.E. Martadinata No. 916, Bima 81785, SulTra', '1991-02-13 05:26:15', '2023-01-22 01:59:27'),
(90, 'Najam Situmorang', 'Ki. Nangka No. 783, Binjai 30076, JaTim', '1979-10-31 20:50:57', '2023-01-22 01:59:27'),
(91, 'Gasti Hassanah', 'Ds. Baabur Royan No. 502, Tanjungbalai 12549, Maluku', '2008-11-12 16:26:48', '2023-01-22 01:59:27'),
(92, 'Bakijan Firgantoro S.Farm', 'Dk. Urip Sumoharjo No. 659, Semarang 84811, NTT', '2002-07-08 21:28:39', '2023-01-22 01:59:27'),
(93, 'Rahmi Nurul Hassanah M.Ak', 'Gg. Ekonomi No. 587, Batam 13886, SumUt', '1989-09-05 07:02:00', '2023-01-22 01:59:27'),
(94, 'Jaeman Purwadi Hutapea M.Kom.', 'Kpg. Bak Mandi No. 288, Pagar Alam 87853, Jambi', '2018-06-07 09:58:30', '2023-01-22 01:59:27'),
(95, 'Radit Cecep Kurniawan', 'Dk. Sugiyopranoto No. 373, Surakarta 97477, Lampung', '1997-09-17 09:41:11', '2023-01-22 01:59:27'),
(96, 'Dina Novitasari S.Gz', 'Dk. Nakula No. 32, Bima 67358, Aceh', '2014-09-24 17:19:48', '2023-01-22 01:59:27'),
(97, 'Intan Melinda Namaga', 'Jr. Rajawali No. 75, Padangpanjang 75822, KalTim', '2016-05-06 15:56:01', '2023-01-22 01:59:27'),
(98, 'Kasim Dongoran', 'Ds. Laswi No. 863, Kupang 46879, BaBel', '2015-01-27 07:16:08', '2023-01-22 01:59:27'),
(99, 'Nasrullah Waskita', 'Jln. Sentot Alibasa No. 659, Administrasi Jakarta Pusat 84916, KalTim', '1984-10-01 10:12:06', '2023-01-22 01:59:27'),
(100, 'Pia Safitri', 'Gg. Tambak No. 630, Parepare 72224, Papua', '1993-03-30 22:41:17', '2023-01-22 01:59:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, 'admin@gmail.com', 'admin', '$2y$10$QfN/XHYFdUu1r8mibBm4lermC3lo8acA7dLdsCpH.irpg.luITZjq', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2023-05-13 04:55:54', '2023-05-13 04:55:54', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indexes for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indexes for table `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indexes for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orang`
--
ALTER TABLE `orang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orang`
--
ALTER TABLE `orang`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
