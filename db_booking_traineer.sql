-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Jul 2025 pada 19.10
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_booking_traineer`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `booking_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Pending','Confirmed','Cancelled','Complete') NOT NULL,
  `notes` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `session_id`, `booking_time`, `status`, `notes`, `user_id`) VALUES
(2, 1, '2025-06-23 16:11:22', 'Pending', 'Booking dari client', 12),
(3, 7, '2025-06-23 16:14:22', 'Pending', 'Booking dari client1', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `session_id` int(11) NOT NULL,
  `traineer_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` enum('Available','Booked','Complete','Cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`session_id`, `traineer_id`, `location`, `start_time`, `end_time`, `status`) VALUES
(2, 2, 'Tangerang', '2025-06-24 10:00:00', '2025-06-24 12:00:00', 'Available'),
(3, 3, 'Jakarta', '2025-06-23 09:30:00', '2025-06-23 11:00:00', 'Available'),
(4, 5, 'Jakarta', '2025-06-23 09:00:00', '2025-06-24 11:00:00', 'Available'),
(5, 6, 'Depok', '2025-06-23 16:00:00', '2025-06-23 18:00:00', 'Available'),
(8, 2, 'Tangerang', '2025-06-25 10:00:00', '2025-06-25 10:00:00', 'Available');

-- --------------------------------------------------------

--
-- Struktur dari tabel `traineers`
--

CREATE TABLE `traineers` (
  `traineer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` text NOT NULL,
  `specialization` varchar(50) NOT NULL,
  `experience_years` int(2) NOT NULL,
  `rating` float NOT NULL,
  `gender` enum('Male','Female','','') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `traineers`
--

INSERT INTO `traineers` (`traineer_id`, `user_id`, `name`, `bio`, `specialization`, `experience_years`, `rating`, `gender`, `created_at`, `edited_at`) VALUES
(2, 10, 'Adelia Anastasia', 'Kebugaran umum, nutrisi, penggunaan alat suspensi', 'Corrective Exercise', 6, 5, 'Female', '2025-06-22 05:22:39', '2025-06-22 05:22:39'),
(3, 13, 'Asep Azis Muslim', 'Kebugaran dasar & umum', 'Strength and Conditioning', 5, 5, 'Male', '2025-06-22 05:23:21', '2025-06-22 05:23:21'),
(4, 14, 'Randy', 'Fat Loss, Core Strengthening, Gain Mass', 'Strength and Conditioning', 3, 4, 'Male', '2025-06-22 05:23:51', '2025-06-22 05:23:51'),
(5, 15, 'Sisca F', 'Weight & fat loss, Strength & Conditioning, Slim & Shape, Muay Thai, Kick boxing & Self‑Defense', 'Weight Loss', 5, 3, 'Female', '2025-06-22 05:30:19', '2025-06-22 05:30:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` enum('Client','Traineer','Admin','') NOT NULL,
  `gender` enum('Male','Female','','') NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `edited_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `phone`, `role`, `gender`, `date_of_birth`, `created_at`, `edited_at`) VALUES
(10, 'Adelia Anastasia', 'traineer@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '123456789', 'Traineer', 'Male', '2002-10-09', '2025-06-18 15:33:38', '2025-06-18 15:33:38'),
(11, 'admin1', 'admin@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '1234567891', 'Admin', 'Female', '2004-10-09', '2025-06-18 15:34:02', '2025-06-18 15:34:02'),
(12, 'client1', 'client@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '987654321', 'Client', 'Male', '1999-02-09', '2025-06-18 15:34:33', '2025-06-18 15:34:33'),
(13, 'Asep Azis Muslim', 'traineer2@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '22113331123', 'Traineer', 'Female', '2010-01-01', '2025-06-18 15:54:35', '2025-06-18 15:54:35'),
(14, 'Randy', 'traineer3@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', '3456789', 'Traineer', 'Female', '2025-12-21', '2025-06-21 02:58:53', '2025-06-21 02:58:53');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indeks untuk tabel `traineers`
--
ALTER TABLE `traineers`
  ADD PRIMARY KEY (`traineer_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `traineers`
--
ALTER TABLE `traineers`
  MODIFY `traineer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
