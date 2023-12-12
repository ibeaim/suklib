-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 02:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suklib`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username_admin` varchar(50) NOT NULL,
  `password_admin` varchar(50) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `jabatan_admin` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username_admin`, `password_admin`, `nama_admin`, `jabatan_admin`, `no_telp`) VALUES
(101, 'admin201', '376189', 'Ayu Apsari', 'Kepala Staff', '082124689753'),
(102, 'admin202', '873249', 'Aksa Pratama', 'Staff', '087722229753');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `tahun_terbit` date NOT NULL,
  `id_pengarang` int(11) NOT NULL,
  `id_penerbit` int(11) NOT NULL,
  `jumlah_halaman` int(11) NOT NULL,
  `isbn` varchar(100) DEFAULT NULL,
  `id_rak` int(11) NOT NULL,
  `stok_buku` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL,
  `poin_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `tahun_terbit`, `id_pengarang`, `id_penerbit`, `jumlah_halaman`, `isbn`, `id_rak`, `stok_buku`, `id_genre`, `poin_buku`) VALUES
(901, 'DON\'T MAKE ME THINK', '2006-01-01', 402, 301, 216, '0321648781, 9780321648785', 601, 2, 703, 5),
(902, 'YOU DON\'T KNOW JS: SCOPE & CLOSURES', '2014-03-10', 403, 303, 98, '9781449335540, 1449335543', 602, 1, 703, 5),
(903, 'RICH DAD POOR DAD', '2017-04-11', 401, 302, 336, '1612680194, 978-1612680194', 603, 3, 712, 5);

-- --------------------------------------------------------

--
-- Table structure for table `detail_peminjaman`
--

CREATE TABLE `detail_peminjaman` (
  `id_detail_pinjam` int(11) NOT NULL,
  `id_pinjam` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `kondisi_buku` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_peminjaman`
--

INSERT INTO `detail_peminjaman` (`id_detail_pinjam`, `id_pinjam`, `id_buku`, `judul_buku`, `kondisi_buku`) VALUES
(7011, 701, 901, 'DON\'T MAKE ME THINK', 'HARD COPY'),
(7021, 702, 903, 'RICH DAD POOR DAD', 'HARD COPY'),
(7031, 703, 902, 'YOU DON\'T KNOW JS: SCOPE & CLOSURES', 'HARD COPY');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengembalian`
--

CREATE TABLE `detail_pengembalian` (
  `id_detail_pengembalian` int(11) NOT NULL,
  `id_pengembalian` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE `genre` (
  `id_genre` int(11) NOT NULL,
  `kategori_genre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id_genre`, `kategori_genre`) VALUES
(701, 'Fiksi Ilmiah'),
(702, 'Romance'),
(703, 'Akademi dan Profesional'),
(704, 'Sejarah'),
(705, 'Action'),
(706, 'Fantasi'),
(707, 'Sejarah'),
(708, 'Humor'),
(709, 'Misteri'),
(710, 'Klasik'),
(711, 'Non-Fiksi'),
(712, 'Finansial');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `username_member` varchar(50) NOT NULL,
  `password_member` varchar(50) DEFAULT NULL,
  `nama_member` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `username_member`, `password_member`, `nama_member`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_telp`) VALUES
(201, 'dityadika', 'aditya001', 'Aditya Dika', '2003-04-22', 'Laki-Laki', 'Jl. Sukapura', '081234567891'),
(202, 'agnes17', 'agnesctk', 'Putri Agnes', '2002-01-23', 'Perempuan', 'Jl. Sukapura', '081198765432'),
(203, 'lely_aa', 'lely44', 'Lely Anastasia', '2002-03-10', 'Perempuan', 'Jl. Sukapura', '87726578899'),
(204, 'sky_dumb', 'skystar', 'Sakti Pradana', '2003-06-16', 'Laki-Laki', 'Jl. Sukabirus', '82144455567'),
(205, 'gheafad', 'flow21', 'Ghea Fadhilla', '2003-08-17', 'Perempuan', 'Jl. Sukabirus', '8213322267');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `id_member`, `tanggal_peminjaman`, `tanggal_pengembalian`, `id_admin`) VALUES
(701, 201, '2023-12-02', '2023-12-08', 101),
(702, 201, '2023-12-10', '2023-12-14', 102),
(703, 201, '2023-12-08', '2023-12-11', 101);

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id_penerbit` int(11) NOT NULL,
  `nama_penerbit` varchar(50) NOT NULL,
  `kontak_penerbit` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id_penerbit`, `nama_penerbit`, `kontak_penerbit`, `alamat`) VALUES
(301, 'New Riders Publishing', 'www.peachpit.com', '1249 Eighth Street, Berkeley, CA 94710'),
(302, 'Plata Publishing, LLC.', 'platapublishing.com', '4330 N. Civic Center Plaza, Suite 100, Scottsdale, AZ 85251'),
(303, 'O Reilly Media', 'oreilly.com', '1005 Gravenstein Highway North');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id_pengarang` int(11) NOT NULL,
  `nama_pengarang` varchar(50) NOT NULL,
  `kontak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id_pengarang`, `nama_pengarang`, `kontak`) VALUES
(401, 'Robert Kiyosaki', 'twitter.com/therealkiyosaki'),
(402, 'Steve Krug', 'skrug@sensible.com'),
(403, 'Kyle Simpson', 'https://me.getify.com/');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id_pengembalian` int(11) NOT NULL,
  `id_pinjam` int(11) NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  `denda` int(11) DEFAULT NULL,
  `id_pilihan_bayar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pilihan_pembayaran`
--

CREATE TABLE `pilihan_pembayaran` (
  `id_pilihan_bayar` int(11) NOT NULL,
  `pilihan_transaksi` varchar(100) NOT NULL,
  `nomor_rekening` int(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pilihan_pembayaran`
--

INSERT INTO `pilihan_pembayaran` (`id_pilihan_bayar`, `pilihan_transaksi`, `nomor_rekening`) VALUES
(501, 'Mandiri', 123456789),
(502, 'Dana', 800000000);

-- --------------------------------------------------------

--
-- Table structure for table `poin_member`
--

CREATE TABLE `poin_member` (
  `id_member` int(11) NOT NULL,
  `id_pinjam` int(11) NOT NULL,
  `jumlah_poin` int(11) NOT NULL,
  `tanggal_didapat` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rak`
--

CREATE TABLE `rak` (
  `id_rak` int(11) NOT NULL,
  `lokasi_rak` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rak`
--

INSERT INTO `rak` (`id_rak`, `lokasi_rak`) VALUES
(601, 'AA'),
(602, 'AB'),
(603, 'AC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `id_pengarang` (`id_pengarang`),
  ADD KEY `id_penerbit` (`id_penerbit`),
  ADD KEY `id_rak` (`id_rak`),
  ADD KEY `id_genre` (`id_genre`);

--
-- Indexes for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD PRIMARY KEY (`id_detail_pinjam`),
  ADD KEY `id_pinjam` (`id_pinjam`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  ADD PRIMARY KEY (`id_detail_pengembalian`),
  ADD KEY `id_pengembalian` (`id_pengembalian`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id_genre`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`),
  ADD KEY `id_member` (`id_member`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id_penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id_pengarang`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id_pengembalian`),
  ADD KEY `id_pinjam` (`id_pinjam`),
  ADD KEY `id_pilihan_bayar` (`id_pilihan_bayar`);

--
-- Indexes for table `pilihan_pembayaran`
--
ALTER TABLE `pilihan_pembayaran`
  ADD PRIMARY KEY (`id_pilihan_bayar`);

--
-- Indexes for table `poin_member`
--
ALTER TABLE `poin_member`
  ADD PRIMARY KEY (`id_member`),
  ADD KEY `id_pinjam` (`id_pinjam`);

--
-- Indexes for table `rak`
--
ALTER TABLE `rak`
  ADD PRIMARY KEY (`id_rak`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rak`
--
ALTER TABLE `rak`
  MODIFY `id_rak` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=604;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`id_pengarang`) REFERENCES `pengarang` (`id_pengarang`),
  ADD CONSTRAINT `buku_ibfk_2` FOREIGN KEY (`id_penerbit`) REFERENCES `penerbit` (`id_penerbit`),
  ADD CONSTRAINT `buku_ibfk_3` FOREIGN KEY (`id_rak`) REFERENCES `rak` (`id_rak`),
  ADD CONSTRAINT `buku_ibfk_4` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`);

--
-- Constraints for table `detail_peminjaman`
--
ALTER TABLE `detail_peminjaman`
  ADD CONSTRAINT `detail_peminjaman_ibfk_1` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`),
  ADD CONSTRAINT `detail_peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `detail_pengembalian`
--
ALTER TABLE `detail_pengembalian`
  ADD CONSTRAINT `detail_pengembalian_ibfk_1` FOREIGN KEY (`id_pengembalian`) REFERENCES `pengembalian` (`id_pengembalian`),
  ADD CONSTRAINT `detail_pengembalian_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Constraints for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`),
  ADD CONSTRAINT `pengembalian_ibfk_2` FOREIGN KEY (`id_pilihan_bayar`) REFERENCES `pilihan_pembayaran` (`id_pilihan_bayar`);

--
-- Constraints for table `poin_member`
--
ALTER TABLE `poin_member`
  ADD CONSTRAINT `poin_member_ibfk_1` FOREIGN KEY (`id_member`) REFERENCES `member` (`id_member`),
  ADD CONSTRAINT `poin_member_ibfk_2` FOREIGN KEY (`id_pinjam`) REFERENCES `peminjaman` (`id_pinjam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
