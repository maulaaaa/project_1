-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2026 pada 16.25
-- Versi server: 10.4.32-MariaDB-log
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

DELIMITER $$
--
-- Prosedur
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi1` ()   BEGIN
START TRANSACTION;
INSERT INTO pasien
(id_pasien,nama_pasien,alamat_pasien,jenis_kelamin)
VALUES
(4,'Tito Saputra','Jl. Pakis Haji No.25','L');
SELECT * FROM pasien;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi2` ()   BEGIN
START TRANSACTION;
INSERT INTO pasien
(id_pasien,nama_pasien,alamat_pasien,jenis_kelamin)
VALUES
(4,'Tito Saputra','Jl. Pakis Haji No.25','L');
SELECT * FROM pasien;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi3` ()   BEGIN
START TRANSACTION;
UPDATE pasien
SET nama_pasien='Danar'
WHERE id_pasien=3;
ROLLBACK;
COMMIT;
SELECT * FROM pasien;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi4` ()   BEGIN
START TRANSACTION;
INSERT INTO pasien
(id_pasien,nama_pasien,alamat_pasien,jenis_kelamin)
VALUES
(5,'Rina Setiawati','Bandung','P');
ROLLBACK;
UPDATE pasien
SET nama_pasien='Septin'
WHERE id_pasien=3;
COMMIT;
SELECT * FROM pasien;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `transaksi5` ()   BEGIN
START TRANSACTION;
INSERT INTO pasien
(id_pasien,nama_pasien,alamat_pasien,jenis_kelamin)
VALUES
(5,'Andi Pratama','Bandung','L');
SAVEPOINT point1;
INSERT INTO pasien
(id_pasien,nama_pasien,alamat_pasien,jenis_kelamin)
VALUES
(6,'Rina Maharani','Jakarta','P');
ROLLBACK TO SAVEPOINT point1;
INSERT INTO pasien
(id_pasien,nama_pasien,alamat_pasien,jenis_kelamin)
VALUES
(7,'Santi Nuraini','Bogor','P');
COMMIT;
SELECT * FROM pasien;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` int(3) NOT NULL,
  `nama_admin` varchar(30) DEFAULT NULL,
  `waktu_jaga` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `administrator`
--

INSERT INTO `administrator` (`id_admin`, `nama_admin`, `waktu_jaga`) VALUES
(1, 'Andi Saputra', 'Pagi'),
(2, 'Rina Marlina', 'Siang'),
(3, 'Dewi Lestari', 'Malam'),
(4, 'Budi Hartono', 'Pagi'),
(5, 'Siti Nurhaliza', 'Siang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar`
--

CREATE TABLE `daftar` (
  `id_daftar` int(3) NOT NULL,
  `id_pasien` int(3) DEFAULT NULL,
  `id_admin` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `daftar`
--

INSERT INTO `daftar` (`id_daftar`, `id_pasien`, `id_admin`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(3) NOT NULL,
  `nama_dokter` varchar(30) DEFAULT NULL,
  `alamat_dokter` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `spesialis` varchar(15) DEFAULT NULL,
  `waktu_kerja` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `alamat_dokter`, `tanggal_lahir`, `no_hp`, `spesialis`, `waktu_kerja`) VALUES
(1, 'Dr. Andi Wijaya', 'Jl. Melati Bandung', '1980-05-10', '081234567890', 'Anak', 'Pagi'),
(2, 'Dr. Budi Santoso', 'Jl. Mawar Jakarta', '1978-11-21', '082345678901', 'Penyakit Dalam', 'Siang'),
(4, 'Dr. Deni Kurniawan', 'Jl. Anggrek Depok', '1982-03-17', '084567890123', 'Saraf', 'Pagi'),
(5, 'Dr. Eka Prasetyo', 'Jl. Dahlia Bekasi', '1979-09-30', '085678901234', 'THT', 'Siang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter_admin`
--

CREATE TABLE `dokter_admin` (
  `id_data` int(3) NOT NULL,
  `id_dokter` int(3) DEFAULT NULL,
  `id_admin` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `dokter_admin`
--

INSERT INTO `dokter_admin` (`id_data`, `id_dokter`, `id_admin`) VALUES
(1, 1, 1),
(2, 2, 2),
(4, 4, 4),
(5, 5, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(6) NOT NULL,
  `kode_obat` varchar(5) DEFAULT NULL,
  `nama_obat` varchar(30) DEFAULT NULL,
  `harga` int(10) DEFAULT NULL,
  `stok` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`id_obat`, `kode_obat`, `nama_obat`, `harga`, `stok`) VALUES
(1, 'A001', 'Amikacin', 20000, 10),
(2, 'A002', 'Amoxillin', 15000, 15),
(3, 'A003', 'Betadine', 7000, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(3) NOT NULL,
  `nama_pasien` varchar(30) DEFAULT NULL,
  `alamat_pasien` varchar(100) DEFAULT NULL,
  `jenis_kelamin` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `alamat_pasien`, `jenis_kelamin`) VALUES
(1, 'Joko Widodo', 'Jl. Pakis Haji Jakarta', '1'),
(2, 'Siti Aminah', 'Jl. Mawar Bandung', 'P'),
(3, 'Septin', 'Jl. Melati Bogor', 'L'),
(4, 'Tito Saputra', 'Jl. Pakis Haji No.25', 'L'),
(5, 'Andi Pratama', 'Bandung', 'L'),
(7, 'Santi Nuraini', 'Bogor', 'P');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien_dokter`
--

CREATE TABLE `pasien_dokter` (
  `id` int(3) NOT NULL,
  `id_dokter` int(3) DEFAULT NULL,
  `id_pasien` int(3) DEFAULT NULL,
  `waktu_periksa` date DEFAULT NULL,
  `resep` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pasien_dokter`
--

INSERT INTO `pasien_dokter` (`id`, `id_dokter`, `id_pasien`, `waktu_periksa`, `resep`) VALUES
(1, 1, 1, '2026-05-10', 'Paracetamol'),
(2, 2, 2, '2026-05-11', 'Amoxicillin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_obat`
--

CREATE TABLE `transaksi_obat` (
  `id_transaksi` int(3) NOT NULL,
  `id_pasien` int(3) DEFAULT NULL,
  `id_obat` int(3) DEFAULT NULL,
  `jumlah` int(10) DEFAULT NULL,
  `total_harga` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_obat`
--

INSERT INTO `transaksi_obat` (`id_transaksi`, `id_pasien`, `id_obat`, `jumlah`, `total_harga`) VALUES
(1, 1, 2, 5, 0);

--
-- Trigger `transaksi_obat`
--
DELIMITER $$
CREATE TRIGGER `tg_jual` AFTER INSERT ON `transaksi_obat` FOR EACH ROW BEGIN
UPDATE obat
SET stok = stok - NEW.jumlah
WHERE id_obat = NEW.id_obat;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `daftar`
--
ALTER TABLE `daftar`
  ADD PRIMARY KEY (`id_daftar`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indeks untuk tabel `dokter_admin`
--
ALTER TABLE `dokter_admin`
  ADD PRIMARY KEY (`id_data`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_admin` (`id_admin`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indeks untuk tabel `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_dokter` (`id_dokter`),
  ADD KEY `id_pasien` (`id_pasien`);

--
-- Indeks untuk tabel `transaksi_obat`
--
ALTER TABLE `transaksi_obat`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id_admin` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `daftar`
--
ALTER TABLE `daftar`
  MODIFY `id_daftar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `dokter_admin`
--
ALTER TABLE `dokter_admin`
  MODIFY `id_data` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi_obat`
--
ALTER TABLE `transaksi_obat`
  MODIFY `id_transaksi` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `daftar`
--
ALTER TABLE `daftar`
  ADD CONSTRAINT `daftar_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `daftar_ibfk_2` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dokter_admin`
--
ALTER TABLE `dokter_admin`
  ADD CONSTRAINT `dokter_admin_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dokter_admin_ibfk_2` FOREIGN KEY (`id_admin`) REFERENCES `administrator` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pasien_dokter`
--
ALTER TABLE `pasien_dokter`
  ADD CONSTRAINT `pasien_dokter_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pasien_dokter_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
