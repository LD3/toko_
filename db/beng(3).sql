-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2016 at 09:03 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `beng`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode` char(13) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `provider` varchar(15) NOT NULL,
  `jenis` varchar(15) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `potongan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode`, `nama`, `provider`, `jenis`, `stok`, `harga`, `potongan`) VALUES
('213', 'velg b', '0812345', 'velg', 3, 9000, 4),
('321', 'velg a', '0812345', 'velg', 4, 1000, 0);

--
-- Triggers `barang`
--
DELIMITER //
CREATE TRIGGER `barang_AFTER_INSERT` AFTER INSERT ON `barang`
 FOR EACH ROW BEGIN
	INSERT INTO `dagangan` VALUES (0,NEW.kode);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dagangan`
--

CREATE TABLE IF NOT EXISTS `dagangan` (
  `jenis` tinyint(1) DEFAULT NULL,
  `kode` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dagangan`
--

INSERT INTO `dagangan` (`jenis`, `kode`) VALUES
(1, '123'),
(0, '321'),
(0, '213');

-- --------------------------------------------------------

--
-- Table structure for table `detil_pemesanan`
--

CREATE TABLE IF NOT EXISTS `detil_pemesanan` (
  `pemesanan` datetime NOT NULL,
  `barang` char(13) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `detil_penjualan`
--

CREATE TABLE IF NOT EXISTS `detil_penjualan` (
  `no_nota` varchar(10) NOT NULL,
  `jenis` varchar(5) NOT NULL,
  `nama` char(13) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `potongan` int(11) NOT NULL,
  `totalharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jasa`
--

CREATE TABLE IF NOT EXISTS `jasa` (
  `kode` char(13) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jasa`
--

INSERT INTO `jasa` (`kode`, `nama`, `harga`) VALUES
('123', 'Ganti Oli', 5000);

--
-- Triggers `jasa`
--
DELIMITER //
CREATE TRIGGER `jasa_AFTER_INSERT` AFTER INSERT ON `jasa`
 FOR EACH ROW BEGIN
	INSERT INTO `dagangan` VALUES (1,NEW.kode);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE IF NOT EXISTS `pemesanan` (
  `waktu` datetime NOT NULL,
  `totalbiaya` bigint(20) NOT NULL,
  `pemesan` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE IF NOT EXISTS `penjualan` (
  `no_nota` varchar(10) NOT NULL,
  `totalharga` int(11) NOT NULL,
  `totalbayar` int(11) NOT NULL,
  `totalkembalian` int(11) NOT NULL,
  `staff` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE IF NOT EXISTS `provider` (
  `telp` varchar(15) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`telp`, `nama`) VALUES
('0812345', 'aaa');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` varchar(12) NOT NULL,
  `password` char(32) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `lastEdit` varchar(12) NOT NULL,
  `editedAt` datetime NOT NULL,
  `gaji` int(11) NOT NULL,
  `valid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`, `nama`, `telp`, `admin`, `lastEdit`, `editedAt`, `gaji`, `valid`) VALUES
('0', '0', '0', '0', 0, '0', '0000-00-00 00:00:00', 0, 0),
('2132423', '8b128658b24dea6b2d290daf373d2ec2', 'lendra', '08987543212', 1, 'admin', '2010-01-01 05:46:29', 900000, 1),
('admin', '7fbf644a15f770792ff42b2c8c386bc1', 'admin', '', 1, '', '2016-03-06 16:38:32', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
 ADD PRIMARY KEY (`kode`), ADD KEY `provider` (`provider`);

--
-- Indexes for table `dagangan`
--
ALTER TABLE `dagangan`
 ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `detil_pemesanan`
--
ALTER TABLE `detil_pemesanan`
 ADD KEY `pemesanan` (`pemesanan`), ADD KEY `barang` (`barang`);

--
-- Indexes for table `detil_penjualan`
--
ALTER TABLE `detil_penjualan`
 ADD KEY `no_nota` (`no_nota`), ADD KEY `nama` (`nama`);

--
-- Indexes for table `jasa`
--
ALTER TABLE `jasa`
 ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
 ADD PRIMARY KEY (`waktu`), ADD KEY `pemesan` (`pemesan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
 ADD PRIMARY KEY (`no_nota`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
 ADD PRIMARY KEY (`telp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`provider`) REFERENCES `provider` (`telp`);

--
-- Constraints for table `detil_pemesanan`
--
ALTER TABLE `detil_pemesanan`
ADD CONSTRAINT `detil_pemesanan_ibfk_1` FOREIGN KEY (`pemesanan`) REFERENCES `pemesanan` (`waktu`),
ADD CONSTRAINT `detil_pemesanan_ibfk_2` FOREIGN KEY (`barang`) REFERENCES `barang` (`kode`);

--
-- Constraints for table `detil_penjualan`
--
ALTER TABLE `detil_penjualan`
ADD CONSTRAINT `detil_penjualan_ibfk_1` FOREIGN KEY (`no_nota`) REFERENCES `penjualan` (`no_nota`),
ADD CONSTRAINT `detil_penjualan_ibfk_2` FOREIGN KEY (`nama`) REFERENCES `dagangan` (`kode`) ON UPDATE CASCADE;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`pemesan`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
