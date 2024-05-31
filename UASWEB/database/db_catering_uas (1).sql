-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Nov 2022 pada 17.46
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catering_uas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin_telp` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`admin_id`, `admin_name`, `username`, `password`, `admin_telp`, `admin_email`, `admin_address`) VALUES
(1, 'Fernanda', 'nanda', '123456', '082259564143', 'fernanda20030726gmail.com', 'Bontonompo selatan_gowa');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_category`
--

CREATE TABLE `tb_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_category`
--

INSERT INTO `tb_category` (`category_id`, `category_name`) VALUES
(17, 'Minuman'),
(18, 'Makanan Khas Makassar'),
(20, 'Paket Komplit'),
(21, 'Kue'),
(22, 'Olahan Nasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_product`
--

CREATE TABLE `tb_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_description` text NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `product_status` tinyint(1) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_product`
--

INSERT INTO `tb_product` (`product_id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_image`, `product_status`, `date_created`) VALUES
(15, 18, 'Coto Makassar', 20000, '<p>1. Makanan khas daerah makassar</p>\r\n\r\n<p>2. Biasa dipadukan dengan ketupat, bisa juga nasi</p>\r\n\r\n<p>3. Untuk ketupat bisa request di pembelian</p>\r\n', 'produk1669275214.jpg', 1, '2022-11-24 05:05:07'),
(16, 18, 'Pallubasa Konro', 25000, '<p>1. Makanan khas daerah Makassar</p>\r\n\r\n<p>2. Dengan kuah yang didalamnya terdapat daging yang berada tulang</p>\r\n\r\n<p>3. Biasa dipadukan dengan ketupat</p>\r\n\r\n<p>4. Untuk ketupat bisa request di pembelian</p>\r\n', 'produk1669266504.jpg', 1, '2022-11-24 05:08:24'),
(17, 20, 'Paket Komplit 1', 25000, '<p>Paket Komplit 1 berisi</p>\r\n\r\n<p>1. Nasi</p>\r\n\r\n<p>2. Ayam</p>\r\n\r\n<p>3. Tahu Tempe</p>\r\n\r\n<p>4. Sambal, sayur dan lalapan</p>\r\n', 'produk1669277108.jpeg', 1, '2022-11-24 05:13:08'),
(18, 20, 'Paket Komplit 2', 30000, '<p>Paket Komplit 2 ayam geprek</p>\r\n\r\n<p>1. Nasi</p>\r\n\r\n<p>2. Ayam geprek</p>\r\n\r\n<p>3. Sambal, sayur dan lalapan</p>\r\n', 'produk1669277503.jpeg', 1, '2022-11-24 05:14:36'),
(19, 17, 'Es Teh', 5000, '<p>Es Teh</p>\r\n\r\n<p>1. Untuk rasa hambar atau manis bisa request di pembelian</p>\r\n\r\n<p>2. Untuk panas atau dingin juga bisa request</p>\r\n', 'produk1669267051.jpg', 1, '2022-11-24 05:17:31'),
(20, 17, 'Jus Alpukat', 10000, '<p>Jus alpukat, untuk toping bisa request di pembelian</p>\r\n', 'produk1669275739.jpg', 1, '2022-11-24 05:18:26'),
(21, 21, 'Jalangkote', 2000, '<p>Jalangkote adalah kue khas makassar, bentuk mirip pastel namun dengan bentuk, tekstur isian dan rasa yang berbeda</p>\r\n', 'produk1669275834.jpg', 1, '2022-11-24 05:21:18'),
(22, 21, 'Pisang Epe', 5000, '<p>Pisang Epe adalah olahan buah dari pisang khas makassar yang mana pisang ditumbuk dan dibuat pilih kemudian diberikan bumbu istimewa</p>\r\n', 'produk1669276528.jpg', 1, '2022-11-24 05:22:31'),
(23, 22, 'Nasi Goreng', 15000, '<p>Nasi Goreng Homemade</p>\r\n', 'produk1669296131.jpg', 1, '2022-11-24 13:22:11'),
(24, 22, 'Nasi telur dadar', 10000, '<p>Nasi telur dadar homemade</p>\r\n', 'produk1669296251.jpg', 1, '2022-11-24 13:24:11');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indeks untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeks untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
