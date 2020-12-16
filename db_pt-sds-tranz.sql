-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2020 pada 15.46
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pt-sds-tranz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'sdstoken01', 1, 1, 0, '1', 1),
(2, 2, 'sdstoken02', 1, 1, 0, '1', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_armada`
--

CREATE TABLE `tb_armada` (
  `id_armada` int(11) NOT NULL,
  `no_pol` varchar(128) NOT NULL,
  `jenis` varchar(128) NOT NULL,
  `jumlah_seat` int(11) NOT NULL,
  `status` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_armada`
--

INSERT INTO `tb_armada` (`id_armada`, `no_pol`, `jenis`, `jumlah_seat`, `status`) VALUES
(1, 'S 7272 UZ', 'Vip', 54, 'Siap Jalan'),
(2, 'S 7273 UZ', 'Patas', 54, 'Siap Jalan'),
(3, 'S 7274 UZ', 'Vip', 54, 'Siap Jalan'),
(4, 'S 7275 UZ', 'Vip', 54, 'Siap Jalan'),
(5, 'S 7276 UZ', 'Executive', 32, 'Siap Jalan'),
(6, 'S 7277 UZ', 'Executive', 32, 'Siap Jalan'),
(7, 'S 7278 UZ', 'Executive', 32, 'Siap Jalan'),
(8, 'S 7279 UZ', 'Patas', 54, 'Siap Jalan'),
(9, 'S 7280 UZ', 'Super Executive', 22, 'Siap Jalan'),
(10, 'S 7271 UZ', 'Super Executive', 22, 'Siap Jalan'),
(11, 'S 7999 UZ', 'Patas', 54, 'Siap Jalan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal_berangkat`
--

CREATE TABLE `tb_jadwal_berangkat` (
  `id_jadwal_berangkat` int(11) NOT NULL,
  `armada_id` int(11) NOT NULL,
  `sopir_id` int(11) NOT NULL,
  `berangkat_surabaya` time NOT NULL,
  `berangkat_solo` time NOT NULL,
  `berangkat_semarang` time NOT NULL,
  `tiba_jakarta` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jadwal_berangkat`
--

INSERT INTO `tb_jadwal_berangkat` (`id_jadwal_berangkat`, `armada_id`, `sopir_id`, `berangkat_surabaya`, `berangkat_solo`, `berangkat_semarang`, `tiba_jakarta`) VALUES
(1, 1, 1, '06:00:00', '11:00:00', '13:00:00', '23:00:00'),
(2, 2, 2, '06:30:00', '11:30:00', '13:30:00', '23:30:00'),
(3, 3, 3, '07:00:00', '12:00:00', '14:00:00', '00:00:00'),
(4, 4, 4, '07:30:00', '12:30:00', '14:30:00', '00:30:00'),
(5, 5, 5, '08:00:00', '13:00:00', '15:00:00', '01:00:00'),
(6, 6, 6, '08:30:00', '13:30:00', '15:30:00', '01:30:00'),
(7, 7, 7, '09:00:00', '14:00:00', '16:00:00', '02:00:00'),
(8, 8, 8, '09:30:00', '14:30:00', '16:30:00', '02:30:00'),
(9, 9, 9, '10:00:00', '15:00:00', '17:00:00', '03:00:00'),
(10, 10, 10, '10:30:00', '15:30:00', '17:30:00', '03:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sopir`
--

CREATE TABLE `tb_sopir` (
  `id_sopir` int(11) NOT NULL,
  `nama_sopir` varchar(128) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `no_hp` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_sopir`
--

INSERT INTO `tb_sopir` (`id_sopir`, `nama_sopir`, `alamat`, `no_hp`) VALUES
(1, 'Sukirman', 'Sooko, Mojokerto', '085456123879'),
(2, 'Supratman', 'Pungging, Mojokerto', '085456123487'),
(3, 'Amir', 'Pungging, Mojokerto', '085456123032'),
(4, 'Didik', 'Pungging, Mojokerto', '085456123693'),
(5, 'Jarot', 'Mojosari, Mojokerto', '085456123753'),
(6, 'Gamma', 'Bangsal, Mojokerto', '085456123753'),
(7, 'Marto', 'Mojosari, Mojokerto', '085456123452'),
(8, 'Datuk', 'Mojosari, Mojokerto', '085456123365'),
(9, 'Sukran', 'Pungging, Mojokerto', '085456123749'),
(10, 'Darto', 'Bangsal, Mojokerto', '085456753852');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_armada`
--
ALTER TABLE `tb_armada`
  ADD PRIMARY KEY (`id_armada`);

--
-- Indeks untuk tabel `tb_jadwal_berangkat`
--
ALTER TABLE `tb_jadwal_berangkat`
  ADD PRIMARY KEY (`id_jadwal_berangkat`),
  ADD KEY `armada_id` (`armada_id`),
  ADD KEY `sopir_id` (`sopir_id`);

--
-- Indeks untuk tabel `tb_sopir`
--
ALTER TABLE `tb_sopir`
  ADD PRIMARY KEY (`id_sopir`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tb_armada`
--
ALTER TABLE `tb_armada`
  MODIFY `id_armada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tb_jadwal_berangkat`
--
ALTER TABLE `tb_jadwal_berangkat`
  MODIFY `id_jadwal_berangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tb_sopir`
--
ALTER TABLE `tb_sopir`
  MODIFY `id_sopir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jadwal_berangkat`
--
ALTER TABLE `tb_jadwal_berangkat`
  ADD CONSTRAINT `tb_jadwal_berangkat_ibfk_1` FOREIGN KEY (`armada_id`) REFERENCES `tb_armada` (`id_armada`),
  ADD CONSTRAINT `tb_jadwal_berangkat_ibfk_2` FOREIGN KEY (`sopir_id`) REFERENCES `tb_sopir` (`id_sopir`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
