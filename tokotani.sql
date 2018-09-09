-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 09, 2018 at 02:41 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokotani`
--

-- --------------------------------------------------------

--
-- Table structure for table `hubungi_kami`
--

CREATE TABLE `hubungi_kami` (
  `id` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `judul_pertanyaan` varchar(90) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `deskripsi` varchar(360) NOT NULL,
  `foto` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hubungi_kami`
--

INSERT INTO `hubungi_kami` (`id`, `id_pengguna`, `judul_pertanyaan`, `kategori`, `deskripsi`, `foto`) VALUES
(1, 1, 'Test', 'Kategori', 'Deskripsi', 'Foto'),
(2, 1, 'Test 2', 'Kategori', 'Deskripsi', 'Foto'),
(3, 4, 'Judulnya', '30', 'Deskripsinya', '');

-- --------------------------------------------------------

--
-- Table structure for table `mitra_berjejaring`
--

CREATE TABLE `mitra_berjejaring` (
  `id_mitraberjejaring` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `nama_mitra` varchar(35) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `email` varchar(25) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `tempat_didirikan` varchar(35) NOT NULL,
  `tanggal_didirikan` varchar(12) NOT NULL,
  `nomor_akta` varchar(20) NOT NULL,
  `akta_perubahan_terakhir` varchar(20) NOT NULL,
  `tanggal_perubahan_terakhir` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mitra_berjejaring`
--

INSERT INTO `mitra_berjejaring` (`id_mitraberjejaring`, `id_pengguna`, `nama_mitra`, `no_telp`, `email`, `alamat`, `tempat_didirikan`, `tanggal_didirikan`, `nomor_akta`, `akta_perubahan_terakhir`, `tanggal_perubahan_terakhir`) VALUES
(2, 3, 'CV Mitra Ku Mitra Mu', '081288796444', 'cvmitraku@gmail.com', 'bogor baru', 'Kota Bogor', '20/05/2016', '20202020', '30303030', '20/05/2017'),
(4, 3, 'asdasd', 'e234', 'zxczxc', 'zxczxc', 'zxczxczx', '2018-09-11', 'zxcxzc', 'zxcxzc', '2018-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `mitra_petani`
--

CREATE TABLE `mitra_petani` (
  `id_pengguna` int(11) NOT NULL,
  `id_mitrapetani` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `kota` varchar(15) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `alamat` varchar(90) NOT NULL,
  `min_kuantiti` int(6) NOT NULL,
  `maks_kuantiti` int(9) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mitra_petani`
--

INSERT INTO `mitra_petani` (`id_pengguna`, `id_mitrapetani`, `nama`, `kota`, `no_telp`, `alamat`, `min_kuantiti`, `maks_kuantiti`, `harga`) VALUES
(1, 1, 'Ilham', 'Jakarta', '081288779966', 'Perumahan yang ada dijakarta', 3000, 8000, 500000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `email`, `password`, `nama`, `level`) VALUES
(1, 'ivan@gmail.com', 'ivan123', 'ivan pradana', 1),
(2, 'ipang@gmail.com', 'ipang123', 'irfan jafar', 2),
(3, 'cvmakmurjaya@gmail.com', '123', 'CV Makmur Jaya', 4),
(4, 'perusahaan@gmail.com', '123', 'CV Maju Mundur', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pengiriman`
--

CREATE TABLE `pengiriman` (
  `metode_pengiriman` varchar(25) NOT NULL,
  `nomor_pengiriman` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengiriman`
--

INSERT INTO `pengiriman` (`metode_pengiriman`, `nomor_pengiriman`) VALUES
('kurir', '213213123123123123');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_pengguna` int(11) NOT NULL,
  `judul_produk` varchar(35) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `minimal_pembelian` int(11) NOT NULL,
  `jumlah_stok` int(11) NOT NULL,
  `harga_minimal` int(11) NOT NULL,
  `harga_maksimal` int(11) NOT NULL,
  `transportasi` varchar(15) NOT NULL,
  `deskripsi` varchar(360) NOT NULL,
  `foto1` varchar(30) NOT NULL,
  `foto2` varchar(30) NOT NULL,
  `foto3` varchar(30) NOT NULL,
  `foto4` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_pengguna`, `judul_produk`, `kategori`, `satuan`, `minimal_pembelian`, `jumlah_stok`, `harga_minimal`, `harga_maksimal`, `transportasi`, `deskripsi`, `foto1`, `foto2`, `foto3`, `foto4`) VALUES
(1, 1, 'Bibit Pepaya Calina', 'bibit', 'kg', 1, 200, 2000, 3000, 'kurir', 'Bibit Pepaya asli dari calina', '1.jpg', '1.jpg', '1.jpg', '1.jpg'),
(3, 2, 'timun', 'bibit', 'kg', 5, 200, 5000, 10000, 'mitra petani', 'ini adalah timun terbaik se nusantara', '2.jpg', '', '', ''),
(18, 1, 'Test Produk', 'bibit', 'kg', 1, 12, 12, 123, 'mitraPetani', 'Test Deskripsi', 'kelengkeng.jpg', '', '', ''),
(19, 3, 'Judul Produk', 'bibit', 'kg', 1, 12, 12, 123, 'mitraPetani', 'qwewqeqwe', 'user-img.png', '', '', ''),
(20, 4, 'Penjualan Perusahaan', 'buah', 'ton', 123, 123, 123, 123, 'mitraPetani', 'asdsad', 'icon_image_grey.png', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_penjualan`
--

CREATE TABLE `transaksi_penjualan` (
  `id_transPenjualan` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `alamat` varchar(90) NOT NULL,
  `tanggal_pembayaran` varchar(15) NOT NULL,
  `metode_pengiriman` varchar(20) NOT NULL,
  `pesanan` varchar(90) NOT NULL,
  `catatan` varchar(60) NOT NULL,
  `status` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi_penjualan`
--

INSERT INTO `transaksi_penjualan` (`id_transPenjualan`, `id_penjualan`, `alamat`, `tanggal_pembayaran`, `metode_pengiriman`, `pesanan`, `catatan`, `status`, `harga`) VALUES
(1, 1, 'Perumahan Tangerang Baru No.45', '20/08/2018', 'JNE', 'Bibit Pepaya Calina 3 kg', 'Ini yang statusnya 2', '2', 6000),
(2, 1, 'Perumahan Tangerang Baru No.45', '20/08/2018', 'JNE', 'Bibit Pepaya Calina 3 kg', 'Ini yang statusnya 3', '3', 6000),
(3, 1, 'Perumahan Tangerang Baru No.45', '20/08/2018', 'JNE', 'Bibit Pepaya Calina 3 kg', 'Ini yang statusnya 4', '4', 6000),
(4, 1, 'Perumahan Tangerang Baru No.45', '20/08/2018', 'JNE', 'Bibit Pepaya Calina 3 kg', 'Ini yang statusnya 1', '1', 6000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hubungi_kami`
--
ALTER TABLE `hubungi_kami`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mitra_berjejaring`
--
ALTER TABLE `mitra_berjejaring`
  ADD PRIMARY KEY (`id_mitraberjejaring`);

--
-- Indexes for table `mitra_petani`
--
ALTER TABLE `mitra_petani`
  ADD PRIMARY KEY (`id_mitrapetani`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `transaksi_penjualan`
--
ALTER TABLE `transaksi_penjualan`
  ADD PRIMARY KEY (`id_transPenjualan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungi_kami`
--
ALTER TABLE `hubungi_kami`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mitra_berjejaring`
--
ALTER TABLE `mitra_berjejaring`
  MODIFY `id_mitraberjejaring` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mitra_petani`
--
ALTER TABLE `mitra_petani`
  MODIFY `id_mitrapetani` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transaksi_penjualan`
--
ALTER TABLE `transaksi_penjualan`
  MODIFY `id_transPenjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
