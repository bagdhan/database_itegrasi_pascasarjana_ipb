-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2019 at 10:46 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pascaonline`
--

-- --------------------------------------------------------

--
-- Table structure for table `bimbingan`
--

CREATE TABLE `bimbingan` (
  `id` int(11) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `judul` text NOT NULL,
  `nomor_sk` text,
  `id_pembimbing` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosen_pembimbing`
--

CREATE TABLE `dosen_pembimbing` (
  `id` int(11) NOT NULL,
  `nip` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `gelardepan` varchar(255) NOT NULL,
  `gelarbelakang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelompok`
--

CREATE TABLE `kelompok` (
  `id` int(11) NOT NULL,
  `namakelompok` varchar(100) NOT NULL,
  `namapanjang` text NOT NULL,
  `ruang` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `id_orang` int(11) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kodemayor` varchar(5) NOT NULL,
  `strata` varchar(2) NOT NULL,
  `status_verifikasi` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `id` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `id_kelompok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orang`
--

CREATE TABLE `orang` (
  `id` int(11) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `tempatlahir` varchar(50) NOT NULL,
  `tanggallahir` varchar(50) NOT NULL,
  `jeniskelamin` varchar(20) NOT NULL,
  `orangtua` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pps500`
--

CREATE TABLE `pps500` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `mulai` date NOT NULL,
  `tutup` date NOT NULL,
  `perpanjangan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pps500_sesi`
--

CREATE TABLE `pps500_sesi` (
  `id` int(11) NOT NULL,
  `jadwal` varchar(255) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `ruangan` varchar(30) NOT NULL,
  `kuota` int(4) NOT NULL,
  `aktif` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

CREATE TABLE `seminar` (
  `id` int(11) NOT NULL,
  `id_kelompok` int(11) NOT NULL,
  `id_moderator` int(11) NOT NULL,
  `persetujuan` tinyint(1) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `makalah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seminar_sesi`
--

CREATE TABLE `seminar_sesi` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jam` varchar(255) NOT NULL,
  `aktif` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelompok`
--
ALTER TABLE `kelompok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seminar_sesi`
--
ALTER TABLE `seminar_sesi`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
