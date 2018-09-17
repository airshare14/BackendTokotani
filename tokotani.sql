-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2018 at 05:23 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tokotani`
--

-- --------------------------------------------------------

--
-- Table structure for table `hubungi_kami`
--

CREATE TABLE IF NOT EXISTS `hubungi_kami` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) NOT NULL,
  `judul_pertanyaan` varchar(90) NOT NULL,
  `kategori` varchar(25) NOT NULL,
  `deskripsi` varchar(360) NOT NULL,
  `foto` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hubungi_kami`
--

INSERT INTO `hubungi_kami` (`id`, `id_pengguna`, `judul_pertanyaan`, `kategori`, `deskripsi`, `foto`) VALUES
(1, 1, 'Test', 'Kategori', 'Deskripsi', 'Foto'),
(2, 1, 'Test 2', 'Kategori', 'Deskripsi', 'Foto'),
(3, 1, '313131', 'Pembelian', '313131', '');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasipengiriman`
--

CREATE TABLE IF NOT EXISTS `konfirmasipengiriman` (
  `id_pengiriman` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` varchar(35) NOT NULL,
  `nomor_pengiriman` varchar(35) NOT NULL,
  PRIMARY KEY (`id_pengiriman`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `konfirmasipengiriman`
--

INSERT INTO `konfirmasipengiriman` (`id_pengiriman`, `id_pengguna`, `nomor_pengiriman`) VALUES
(1, '1', ''),
(2, '1', ''),
(3, '1', '1313131'),
(4, '1', '2424242'),
(6, '1', '31313131'),
(7, '1', 'a4a4a44a'),
(8, '1', 'a4a4a44a'),
(9, '1', 'B356EHI'),
(10, '1', 'B31459EHI');

-- --------------------------------------------------------

--
-- Table structure for table `mitra_berjejaring`
--

CREATE TABLE IF NOT EXISTS `mitra_berjejaring` (
  `id_mitraberjejaring` int(11) NOT NULL AUTO_INCREMENT,
  `id_pengguna` int(11) NOT NULL,
  `nama_mitra` varchar(35) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `email` varchar(25) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  `tempat_didirikan` varchar(35) NOT NULL,
  `tanggal_didirikan` varchar(12) NOT NULL,
  `nomor_akta` varchar(20) NOT NULL,
  `akta_perubahan_terakhir` varchar(20) NOT NULL,
  `tanggal_perubahan_terakhir` varchar(12) NOT NULL,
  PRIMARY KEY (`id_mitraberjejaring`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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

CREATE TABLE IF NOT EXISTS `mitra_petani` (
  `id_pengguna` int(11) NOT NULL,
  `id_mitrapetani` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) NOT NULL,
  `kota` varchar(15) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `alamat` varchar(90) NOT NULL,
  `min_kuantiti` int(6) NOT NULL,
  `maks_kuantiti` int(9) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_mitrapetani`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mitra_petani`
--

INSERT INTO `mitra_petani` (`id_pengguna`, `id_mitrapetani`, `nama`, `kota`, `no_telp`, `alamat`, `min_kuantiti`, `maks_kuantiti`, `harga`) VALUES
(1, 1, 'Ilham', 'Jakarta', '081288779966', 'Perumahan yang ada dijakarta', 3000, 8000, 500000),
(1, 5, 'Ivan', 'Bo', '08888888', 'Bogor Permai', 10000, 12000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE IF NOT EXISTS `pengguna` (
  `id_pengguna` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(25) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id_pengguna`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

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

CREATE TABLE IF NOT EXISTS `pengiriman` (
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

CREATE TABLE IF NOT EXISTS `penjualan` (
  `id_penjualan` int(11) NOT NULL AUTO_INCREMENT,
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
  `foto4` varchar(30) NOT NULL,
  PRIMARY KEY (`id_penjualan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_pengguna`, `judul_produk`, `kategori`, `satuan`, `minimal_pembelian`, `jumlah_stok`, `harga_minimal`, `harga_maksimal`, `transportasi`, `deskripsi`, `foto1`, `foto2`, `foto3`, `foto4`) VALUES
(1, 1, 'Bibit Pepaya Calina', 'bibit', 'kg', 1, 200, 2000, 3000, 'kurir', 'Bibit Pepaya asli dari calina', '1.jpg', '1.jpg', '1.jpg', '1.jpg'),
(3, 2, 'timun', 'bibit', 'kg', 5, 200, 5000, 10000, 'mitra petani', 'ini adalah timun terbaik se nusantara', '2.jpg', '', '', ''),
(18, 1, 'Test Produk', 'bibit', 'kg', 1, 12, 12, 123, 'mitraPetani', 'Test Deskripsi', 'kelengkeng.jpg', '', '', ''),
(20, 4, 'Penjualan Perusahaan', 'buah', 'ton', 123, 123, 123, 123, 'mitraPetani', 'asdsad', 'icon_image_grey.png', '', '', ''),
(21, 1, 'Bibit Semangka', 'bibit', 'kg', 5, 20, 10000, 12000, 'mitraPetani', 'barangnya semoga bagus', '1432657455161178996.jpg', '', '', ''),
(22, 1, 'Bawang Merah', 'sayur', 'kg', 3, 1, 3000, 5000, 'Mitra Petani', 'Bawang Merah Kualitas Terbaik', '1432657455161178996.jpg', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_penjualan`
--

CREATE TABLE IF NOT EXISTS `transaksi_penjualan` (
  `id_transPenjualan` int(11) NOT NULL AUTO_INCREMENT,
  `id_penjualan` int(11) NOT NULL,
  `alamat` varchar(90) NOT NULL,
  `tanggal_pembayaran` varchar(15) NOT NULL,
  `metode_pengiriman` varchar(20) NOT NULL,
  `pesanan` varchar(90) NOT NULL,
  `catatan` varchar(60) NOT NULL,
  `status` varchar(25) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_transPenjualan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `transaksi_penjualan`
--

INSERT INTO `transaksi_penjualan` (`id_transPenjualan`, `id_penjualan`, `alamat`, `tanggal_pembayaran`, `metode_pengiriman`, `pesanan`, `catatan`, `status`, `harga`) VALUES
(4, 1, 'Perumahan Tangerang Baru No.45', '20/08/2018', 'JNE', 'Bibit Pepaya Calina 3 kg', 'Ini yang statusnya 1', '4', 6000),
(6, 1, 'Perumahan Bogor Baru ', '10/09/2018', 'JNE', 'Semangka 6kg', 'Ini yang statusnya 1', '4', 8000),
(7, 1, 'Cilibende', '15/09/2018', 'Mitra Petani', 'Bawang Merah', 'Tolong dikemas sebaik mungkin', '4', 3000);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
