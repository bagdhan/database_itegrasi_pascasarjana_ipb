-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 24, 2019 at 09:49 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.0.31

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
-- Table structure for table `akses`
--

CREATE TABLE `akses` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akses`
--

INSERT INTO `akses` (`id`, `status`) VALUES
(1, 'admin'),
(2, 'mahasiswa'),
(3, 'dosen');

-- --------------------------------------------------------

--
-- Table structure for table `alokasiruangbahasainggris`
--

CREATE TABLE `alokasiruangbahasainggris` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `sesibahasainggrisID` int(11) NOT NULL,
  `jadwalkuliahID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bahasainggrispasca`
--

CREATE TABLE `bahasainggrispasca` (
  `ID` int(11) NOT NULL,
  `registrasiID` int(11) NOT NULL,
  `sesibahasainggrisID` int(11) NOT NULL,
  `jeniskelasbahasainggrisID` int(11) NOT NULL,
  `tahunsemesterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bimbingan`
--

CREATE TABLE `bimbingan` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `jenistugasakhirID` int(11) NOT NULL,
  `judulid` varchar(100) DEFAULT NULL,
  `judulen` varchar(100) NOT NULL,
  `tanggalmulai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tanggalselesai` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `skpembimbingID` int(11) NOT NULL,
  `tanggalproposal` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `ID` int(11) NOT NULL,
  `nidn` int(11) NOT NULL,
  `nira` int(11) NOT NULL,
  `tahunserdos` int(11) NOT NULL,
  `nomorserdos` varchar(50) NOT NULL,
  `kum` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosenbimbingan`
--

CREATE TABLE `dosenbimbingan` (
  `ID` int(11) NOT NULL,
  `pembimbingID` int(11) NOT NULL,
  `bimbinganID` int(11) NOT NULL,
  `skpembimbingID` int(11) NOT NULL,
  `urutan` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosenbimbinganmagister`
--

CREATE TABLE `dosenbimbinganmagister` (
  `dosenbimbinganID` int(11) NOT NULL,
  `urutan` varchar(5) NOT NULL,
  `jabatankomisiID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dosenkolokium`
--

CREATE TABLE `dosenkolokium` (
  `ID` int(11) NOT NULL,
  `kolokiumID` int(11) NOT NULL,
  `dosenbimbinganID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jadwalkuliah`
--

CREATE TABLE `jadwalkuliah` (
  `ID` int(11) NOT NULL,
  `kurikulumID` int(11) NOT NULL,
  `semestermahasiswa` int(11) NOT NULL,
  `ruanganID` int(11) NOT NULL,
  `kelaspararel` varchar(100) NOT NULL,
  `hari` varchar(100) NOT NULL,
  `jammulai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jamselesai` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tipeMK` varchar(100) NOT NULL,
  `isalihtahun` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `jeniskelasID` int(11) NOT NULL,
  `koordinatorkelasID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jalurmasuk`
--

CREATE TABLE `jalurmasuk` (
  `ID` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `strataID` int(11) NOT NULL,
  `tahunberlaku` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jeniskelasbahasainggris`
--

CREATE TABLE `jeniskelasbahasainggris` (
  `ID` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelas_pps500`
--

CREATE TABLE `kelas_pps500` (
  `id` int(11) NOT NULL,
  `ruang` varchar(50) NOT NULL,
  `jam` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `sesiID` int(11) NOT NULL,
  `paketID` int(11) NOT NULL,
  `kuota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kelompokseminar`
--

CREATE TABLE `kelompokseminar` (
  `ID` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kolokium`
--

CREATE TABLE `kolokium` (
  `ID` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `kesepakatankolokium` varchar(50) NOT NULL,
  `dosenmoderatorID` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kriterianilaitugasakhir`
--

CREATE TABLE `kriterianilaitugasakhir` (
  `ID` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `bobot` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `kurikulumID` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `semestermahasiswa` varchar(100) NOT NULL,
  `hurufmutuID` int(11) NOT NULL,
  `ulang` varchar(100) NOT NULL,
  `semesterpendek` varchar(100) NOT NULL,
  `waktukrs` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktuupload` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isdihitung` varchar(100) NOT NULL,
  `waktuterakhirubah` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `isdibatalkan` varchar(100) NOT NULL,
  `penguploadID` int(11) NOT NULL,
  `pengubahID` int(11) NOT NULL,
  `penginputID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `krspascasarjana`
--

CREATE TABLE `krspascasarjana` (
  `ID` int(11) NOT NULL,
  `krsID` int(11) NOT NULL,
  `issitin` varchar(10) NOT NULL,
  `kelaskuliah` varchar(50) NOT NULL,
  `kelaspraktikum` varchar(50) NOT NULL,
  `jadwalkuliahID` int(11) NOT NULL,
  `statusmatakuliahpascaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `ID` int(11) NOT NULL,
  `orangID` int(11) NOT NULL,
  `strataID` int(11) NOT NULL,
  `nimkey` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswadoktor`
--

CREATE TABLE `mahasiswadoktor` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `mayorID` int(11) NOT NULL,
  `jalurmasukID` int(11) NOT NULL,
  `tanggalmasuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tahunmasuk` int(11) NOT NULL,
  `batasstudi` varchar(10) NOT NULL,
  `awalsemester` varchar(10) NOT NULL,
  `gelardepan` varchar(10) NOT NULL,
  `gelarbelakang` varchar(10) NOT NULL,
  `statusverifikasi` varchar(20) NOT NULL,
  `statusakademikID` int(11) NOT NULL,
  `pindahmayor` varchar(10) NOT NULL,
  `tahunsemestermasukID` int(11) NOT NULL,
  `tahunakademikID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswamagister`
--

CREATE TABLE `mahasiswamagister` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `mayorID` int(11) NOT NULL,
  `jalurmasukID` int(11) NOT NULL,
  `tanggalmasuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tahunmasuk` int(11) NOT NULL,
  `batasstudi` varchar(10) NOT NULL,
  `awalsemester` varchar(20) NOT NULL,
  `gelardepan` varchar(10) NOT NULL,
  `gelarbelakang` varchar(10) NOT NULL,
  `statusverifikasi` varchar(50) NOT NULL,
  `statusakademikID` int(11) NOT NULL,
  `pindahmayor` varchar(50) NOT NULL,
  `tahunsemestermasukID` int(11) NOT NULL,
  `tahunakademikID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mayor`
--

CREATE TABLE `mayor` (
  `ID` int(11) NOT NULL,
  `strukturorganisasiID` int(11) NOT NULL,
  `departemenID` int(11) NOT NULL,
  `strataID` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `kodepdpt` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `namaen` varchar(50) NOT NULL,
  `inisial` varchar(10) NOT NULL,
  `kaprodi` varchar(50) NOT NULL,
  `tanggaldibentuk` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nomorskdibentuk` varchar(50) NOT NULL,
  `mayorsarjanabkey` varchar(50) NOT NULL,
  `tanggalditutup` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nomorskditutup` varchar(50) NOT NULL,
  `rumpunilmuprogramstudiID` varchar(50) NOT NULL,
  `mayorpascasarjanabkey` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1548041735),
('m130524_201442_init', 1548041741);

-- --------------------------------------------------------

--
-- Table structure for table `moderator`
--

CREATE TABLE `moderator` (
  `ID` int(11) NOT NULL,
  `pegawaiID` int(11) NOT NULL,
  `kelompokseminarID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilaiujian`
--

CREATE TABLE `nilaiujian` (
  `ID` int(11) NOT NULL,
  `dosenbimbinganID` int(11) NOT NULL,
  `pengujiID` int(11) NOT NULL,
  `kriterianilaitugasakhirID` int(11) NOT NULL,
  `nilai` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pps500`
--

CREATE TABLE `nilai_pps500` (
  `id` int(11) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nilai` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL,
  `histori` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orang`
--

CREATE TABLE `orang` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempatlahir` varchar(50) NOT NULL,
  `tempatlahirID` int(11) NOT NULL,
  `tanggallahir` varchar(50) NOT NULL,
  `jeniskelaminID` varchar(20) NOT NULL,
  `nims1key` varchar(50) NOT NULL,
  `nims2key` varchar(50) NOT NULL,
  `nims3key` varchar(50) NOT NULL,
  `pgwaikey` varchar(50) NOT NULL,
  `pasangankey` varchar(50) NOT NULL,
  `anakvkey` varchar(50) NOT NULL,
  `s2lama` varchar(50) NOT NULL,
  `s3lama` varchar(50) NOT NULL,
  `orangtuavkey` varchar(100) NOT NULL,
  `nims0key` varchar(50) NOT NULL,
  `nimppdhkey` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `paket_pps500`
--

CREATE TABLE `paket_pps500` (
  `id` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `keterangan` text NOT NULL,
  `mulai` date NOT NULL,
  `tutup` date NOT NULL,
  `perpanjangan` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pembahasseminar`
--

CREATE TABLE `pembahasseminar` (
  `ID` int(11) NOT NULL,
  `seminarmahasiswaID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `pembahaske` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penguji`
--

CREATE TABLE `penguji` (
  `strataID` int(11) NOT NULL,
  `ispegawai` int(11) NOT NULL,
  `urutan` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `nipbkey` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `persyaratanseminar`
--

CREATE TABLE `persyaratanseminar` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `syaratseminarID` int(11) NOT NULL,
  `isterpenuhi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrasi`
--

CREATE TABLE `registrasi` (
  `ID` int(11) NOT NULL,
  `mahasiswaID` int(11) NOT NULL,
  `tanggaldaftar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrasiujiandoktor`
--

CREATE TABLE `registrasiujiandoktor` (
  `ID` int(11) NOT NULL,
  `registrasiID` int(11) NOT NULL,
  `usulanwaktuujian` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approval` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registrasi_pps500`
--

CREATE TABLE `registrasi_pps500` (
  `id` int(11) NOT NULL,
  `nrp` varchar(50) NOT NULL,
  `tahunsemester` varchar(50) NOT NULL,
  `golongan` int(11) NOT NULL,
  `sesiID` int(11) NOT NULL,
  `kelasID` int(11) NOT NULL,
  `paketID` int(11) NOT NULL,
  `timeCreate` datetime NOT NULL,
  `timeUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seminarmahasiswa`
--

CREATE TABLE `seminarmahasiswa` (
  `ID` int(11) NOT NULL,
  `bimbinganID` int(11) NOT NULL,
  `jumlahpeserta` int(11) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktumulai` time NOT NULL,
  `waktuselesai` time NOT NULL,
  `dosenmoderatorID` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seminarpasca`
--

CREATE TABLE `seminarpasca` (
  `ID` int(11) NOT NULL,
  `kelompokseminarID` int(11) NOT NULL,
  `riwayatkerja` varchar(500) NOT NULL,
  `moderatorID` int(11) NOT NULL,
  `abstrak` varchar(500) NOT NULL,
  `isdisetujui` varchar(20) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `makalah` varchar(100) NOT NULL,
  `tanggalbatas` date NOT NULL,
  `pendidikanformalID` int(11) NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `sesibahasainggris`
--

CREATE TABLE `sesibahasainggris` (
  `ID` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kuota` varchar(10) NOT NULL,
  `isaktif` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sesi_pps500`
--

CREATE TABLE `sesi_pps500` (
  `id` int(11) NOT NULL,
  `jadwal` varchar(255) NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `hari` varchar(50) NOT NULL,
  `waktu` varchar(50) NOT NULL,
  `ruang` varchar(30) NOT NULL,
  `kuota` int(4) NOT NULL,
  `aktif` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `skpembimbing`
--

CREATE TABLE `skpembimbing` (
  `ID` int(11) NOT NULL,
  `nomorsk` varchar(30) NOT NULL,
  `tanggalsk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statusakademik`
--

CREATE TABLE `statusakademik` (
  `ID` int(11) NOT NULL,
  `nama` int(11) NOT NULL,
  `isoutipb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `syaratseminar`
--

CREATE TABLE `syaratseminar` (
  `ID` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ujianmahasiswadoktor`
--

CREATE TABLE `ujianmahasiswadoktor` (
  `ID` int(11) NOT NULL,
  `ujiandoktorID` int(11) NOT NULL,
  `pengujiID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `akses_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `akses_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'AqjuWBktYQYE81fHTpdbQ7gjVVCvzvQ_', '$2y$13$JYx2oDTADoK2dvWAwZtryOPxWsivIfuGR7SzcjCEL9UUbwpT.t6o6', 'yiIqcBUMYAskiIjilQsuhpbywjLcxRhW_1548043206', 'alay.doski@gmail.com', 0, 10, 1548042196, 1548043206);

-- --------------------------------------------------------

--
-- Table structure for table `usulanujiandoktor`
--

CREATE TABLE `usulanujiandoktor` (
  `ID` int(11) NOT NULL,
  `registrasiujiandoktorID` int(11) NOT NULL,
  `jabatanID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `alokasiruangbahasainggris`
--
ALTER TABLE `alokasiruangbahasainggris`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bahasainggrispasca`
--
ALTER TABLE `bahasainggrispasca`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bimbingan`
--
ALTER TABLE `bimbingan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dosenbimbingan`
--
ALTER TABLE `dosenbimbingan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dosenkolokium`
--
ALTER TABLE `dosenkolokium`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jalurmasuk`
--
ALTER TABLE `jalurmasuk`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jeniskelasbahasainggris`
--
ALTER TABLE `jeniskelasbahasainggris`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kelas_pps500`
--
ALTER TABLE `kelas_pps500`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelompokseminar`
--
ALTER TABLE `kelompokseminar`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kolokium`
--
ALTER TABLE `kolokium`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kriterianilaitugasakhir`
--
ALTER TABLE `kriterianilaitugasakhir`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `krspascasarjana`
--
ALTER TABLE `krspascasarjana`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mahasiswadoktor`
--
ALTER TABLE `mahasiswadoktor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mahasiswamagister`
--
ALTER TABLE `mahasiswamagister`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mayor`
--
ALTER TABLE `mayor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `moderator`
--
ALTER TABLE `moderator`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `nilaiujian`
--
ALTER TABLE `nilaiujian`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `nilai_pps500`
--
ALTER TABLE `nilai_pps500`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orang`
--
ALTER TABLE `orang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paket_pps500`
--
ALTER TABLE `paket_pps500`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembahasseminar`
--
ALTER TABLE `pembahasseminar`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `persyaratanseminar`
--
ALTER TABLE `persyaratanseminar`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `registrasi`
--
ALTER TABLE `registrasi`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `registrasiujiandoktor`
--
ALTER TABLE `registrasiujiandoktor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `registrasi_pps500`
--
ALTER TABLE `registrasi_pps500`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seminarmahasiswa`
--
ALTER TABLE `seminarmahasiswa`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `seminarpasca`
--
ALTER TABLE `seminarpasca`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `seminar_sesi`
--
ALTER TABLE `seminar_sesi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sesibahasainggris`
--
ALTER TABLE `sesibahasainggris`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sesi_pps500`
--
ALTER TABLE `sesi_pps500`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skpembimbing`
--
ALTER TABLE `skpembimbing`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `statusakademik`
--
ALTER TABLE `statusakademik`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `syaratseminar`
--
ALTER TABLE `syaratseminar`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ujianmahasiswadoktor`
--
ALTER TABLE `ujianmahasiswadoktor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `usulanujiandoktor`
--
ALTER TABLE `usulanujiandoktor`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alokasiruangbahasainggris`
--
ALTER TABLE `alokasiruangbahasainggris`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bahasainggrispasca`
--
ALTER TABLE `bahasainggrispasca`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bimbingan`
--
ALTER TABLE `bimbingan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dosen`
--
ALTER TABLE `dosen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dosenbimbingan`
--
ALTER TABLE `dosenbimbingan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dosenkolokium`
--
ALTER TABLE `dosenkolokium`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jalurmasuk`
--
ALTER TABLE `jalurmasuk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jeniskelasbahasainggris`
--
ALTER TABLE `jeniskelasbahasainggris`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas_pps500`
--
ALTER TABLE `kelas_pps500`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelompokseminar`
--
ALTER TABLE `kelompokseminar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kolokium`
--
ALTER TABLE `kolokium`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kriterianilaitugasakhir`
--
ALTER TABLE `kriterianilaitugasakhir`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krs`
--
ALTER TABLE `krs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `krspascasarjana`
--
ALTER TABLE `krspascasarjana`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswadoktor`
--
ALTER TABLE `mahasiswadoktor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswamagister`
--
ALTER TABLE `mahasiswamagister`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mayor`
--
ALTER TABLE `mayor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `moderator`
--
ALTER TABLE `moderator`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilaiujian`
--
ALTER TABLE `nilaiujian`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembahasseminar`
--
ALTER TABLE `pembahasseminar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persyaratanseminar`
--
ALTER TABLE `persyaratanseminar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrasi`
--
ALTER TABLE `registrasi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrasiujiandoktor`
--
ALTER TABLE `registrasiujiandoktor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registrasi_pps500`
--
ALTER TABLE `registrasi_pps500`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminarmahasiswa`
--
ALTER TABLE `seminarmahasiswa`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminarpasca`
--
ALTER TABLE `seminarpasca`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sesibahasainggris`
--
ALTER TABLE `sesibahasainggris`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skpembimbing`
--
ALTER TABLE `skpembimbing`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusakademik`
--
ALTER TABLE `statusakademik`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `syaratseminar`
--
ALTER TABLE `syaratseminar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ujianmahasiswadoktor`
--
ALTER TABLE `ujianmahasiswadoktor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usulanujiandoktor`
--
ALTER TABLE `usulanujiandoktor`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
