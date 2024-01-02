-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 04:10 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_saw_topsis`
--

-- --------------------------------------------------------

--
-- Table structure for table `atlet`
--

CREATE TABLE `atlet` (
  `id_atlet` int(10) NOT NULL,
  `nomor_atlet` varchar(10) NOT NULL,
  `nama_atlet` varchar(50) NOT NULL,
  `tanggal_input` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `atlet`
--

INSERT INTO `atlet` (`id_atlet`, `nomor_atlet`, `nama_atlet`, `tanggal_input`) VALUES
(19, 'A1', 'Ierdho Dharma Putra', '2023-11-19'),
(20, 'A2', 'Ridzal Rhamdhan', '2023-11-19'),
(21, 'A3', 'Ibnu Saputra', '2023-11-19'),
(22, 'A4', 'Iqbal Tachtiar Rosadi', '2023-11-25');

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `type` enum('benefit','cost') NOT NULL,
  `bobot` float NOT NULL,
  `ada_pilihan` tinyint(1) DEFAULT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama`, `type`, `bobot`, `ada_pilihan`, `urutan_order`) VALUES
(11, 'Kemampuan Teknik', 'benefit', 0.3, 0, 0),
(12, 'Kemampuan Strategi', 'benefit', 0.3, 0, 1),
(13, 'Kemampuan Fisik', 'benefit', 0.2, 0, 2),
(14, 'Mental', 'benefit', 0.1, 0, 3),
(15, 'Sikap Sportif', 'benefit', 0.1, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `nilai_atlet`
--

CREATE TABLE `nilai_atlet` (
  `id_nilai_atlet` int(11) NOT NULL,
  `id_atlet` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai_atlet`
--

INSERT INTO `nilai_atlet` (`id_nilai_atlet`, `id_atlet`, `id_kriteria`, `nilai`) VALUES
(113, 19, 11, 80),
(114, 19, 12, 85),
(115, 19, 13, 87),
(116, 19, 14, 70),
(117, 19, 15, 78),
(118, 20, 11, 70),
(119, 20, 12, 78),
(120, 20, 13, 80),
(121, 20, 14, 85),
(122, 20, 15, 84),
(123, 21, 11, 78),
(124, 21, 12, 77),
(125, 21, 13, 86),
(126, 21, 14, 89),
(127, 21, 15, 87),
(143, 22, 11, 87),
(144, 22, 12, 78),
(145, 22, 13, 84),
(146, 22, 14, 80),
(147, 22, 15, 85);

-- --------------------------------------------------------

--
-- Table structure for table `pilihan_kriteria`
--

CREATE TABLE `pilihan_kriteria` (
  `id_pil_kriteria` int(10) NOT NULL,
  `id_kriteria` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `nilai` float NOT NULL,
  `urutan_order` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(5) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `role` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama`, `email`, `alamat`, `role`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Hendra Bagus Setiawanto', 'hendrabagussetiawanto25@gmail.com', 'Jalan Nuri 1 Blok B4 No.9 Kota Tangerang Selatan', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atlet`
--
ALTER TABLE `atlet`
  ADD PRIMARY KEY (`id_atlet`);

--
-- Indexes for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indexes for table `nilai_atlet`
--
ALTER TABLE `nilai_atlet`
  ADD PRIMARY KEY (`id_nilai_atlet`),
  ADD UNIQUE KEY `id_kambing_2` (`id_atlet`,`id_kriteria`),
  ADD KEY `id_kambing` (`id_atlet`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD PRIMARY KEY (`id_pil_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atlet`
--
ALTER TABLE `atlet`
  MODIFY `id_atlet` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `nilai_atlet`
--
ALTER TABLE `nilai_atlet`
  MODIFY `id_nilai_atlet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  MODIFY `id_pil_kriteria` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nilai_atlet`
--
ALTER TABLE `nilai_atlet`
  ADD CONSTRAINT `nilai_atlet_ibfk_1` FOREIGN KEY (`id_atlet`) REFERENCES `atlet` (`id_atlet`),
  ADD CONSTRAINT `nilai_atlet_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Constraints for table `pilihan_kriteria`
--
ALTER TABLE `pilihan_kriteria`
  ADD CONSTRAINT `pilihan_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
