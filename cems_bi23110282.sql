-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2026 at 05:58 AM
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
-- Database: `cems_bi23110282`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `organizer` varchar(100) DEFAULT NULL,
  `contact_person` varchar(100) DEFAULT NULL,
  `contact_no` varchar(20) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `venue` varchar(100) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `event_time` time DEFAULT NULL,
  `mode` enum('physical','online','hybrid') DEFAULT NULL,
  `reg_close_date` date DEFAULT NULL,
  `max_participant` int(11) DEFAULT NULL,
  `fee` varchar(20) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `visibility` enum('public','university') NOT NULL DEFAULT 'public',
  `status` enum('pending','approved','archived') DEFAULT 'pending',
  `highlighted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `event_name`, `description`, `organizer`, `contact_person`, `contact_no`, `type`, `venue`, `event_date`, `event_time`, `mode`, `reg_close_date`, `max_participant`, `fee`, `remarks`, `poster`, `created_at`, `visibility`, `status`, `highlighted`) VALUES
(15, 1, 'Jom Masuk U 2026', 'A nationwide roadshow for secondary school students to explore higher education options and scholarships.', 'Universiti Malaysia Sabah', 'Asha Ibrahim', '0102086223', 'Festival', 'Dewan Kuliah Pusat 22', '2026-02-20', '10:00:00', 'physical', NULL, 500, 'Free', '', '1768532342_Karnival-Jom-Masuk-IPT.webp', '2026-01-16 02:59:02', 'public', 'approved', 0),
(16, 1, 'UMS Job Fest 2026', 'The major annual career and networking event for UMS students and graduates.', 'Universiti Malaysia Sabah', 'Asha Ibrahim', '0102837736', 'Course', 'Dewan Kuliah Pusat 22', '2026-04-28', '11:00:00', 'physical', NULL, 200, 'Free', '', '1768532519_66c6cea3bb56300011438b0e_og_TALENTBANK PenangCF_184.jpg', '2026-01-16 03:01:59', 'public', 'approved', 0),
(17, 1, 'Fun Charity Run UMS (5km & 3km)', 'A student-led charity event aimed at promoting health and fundraising.', 'Universiti Malaysia Sabah', 'Evanessha Natok', '0102837736', 'Sport', 'Padang Kawad UMS ', '2026-04-28', '07:00:00', 'physical', NULL, 100, 'RM30', '', '1768532655_Austism_Run.jpg', '2026-01-16 03:04:15', 'public', 'approved', 0),
(18, 3, 'Liga Sukan UMS', 'A large-scale campus competition open to students. ', 'Universiti Malaysia Sabah', 'Evanessha Natok', '0102837736', 'Competition', 'Stadium UMS', '2026-05-16', '16:00:00', 'physical', NULL, 30, 'Free ', '', '1768533019_images (5).jpg', '2026-01-16 03:10:19', 'university', 'approved', 0),
(19, 3, 'BE in SABAH 2026 (3rd International Business Events Forum)', '\"Global Collaboration through Business Events.\" Features keynote speakers from the UAE, Japan, and Australia.', 'Universiti Malaysia Sabah', 'Asrul Asmat ', '01136467136', 'Seminar', 'SICC', '2026-06-16', '10:00:00', 'physical', NULL, 400, 'Free', '', '1768533256_BE-in-Sabah-2025-scaled-1-scaled.jpeg', '2026-01-16 03:14:16', 'public', 'approved', 0),
(20, 3, 'Applied Engineering Technology workshop', 'The workshop provides a hands-on environment for researchers, engineers, and students to navigate industry uncertainties using actionable strategies. Unlike a lecture, this session focuses on \"discovery through breakthrough solutions\" and real-life case studies.', 'Universiti Malaysia Sabah', 'Diyana Nadra', '0102847336', 'Workshop', 'SICC', '2026-07-16', '11:00:00', 'physical', NULL, 150, 'Free', '', '1768533476_images (6).jpg', '2026-01-16 03:17:56', 'public', 'approved', 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_feedback`
--

CREATE TABLE `event_feedback` (
  `id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` tinyint(4) NOT NULL CHECK (`rating` between 1 and 5),
  `feedback` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('event','approval','announcement','reminder') NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `is_read`, `created_at`) VALUES
(1, 1, 'Event Approved ✅', 'Your event \'Artificial Intelligence: Trends & Impact\' has been approved.', 'approval', 1, '2026-01-13 16:40:52'),
(2, 1, 'Event Approved ✅', 'Your event \'Artificial Intelligence: Trends & Impact\' has been approved.', 'approval', 1, '2026-01-13 17:21:07'),
(3, 1, 'Event Approved ✅', 'Your event \'Artificial Intelligence: Trends & Impact\' has been approved.', 'approval', 1, '2026-01-13 17:21:09'),
(4, 4, 'New Event Pending Approval', 'Event \'test\' is waiting for approval.', 'approval', 1, '2026-01-13 17:29:39'),
(5, 1, 'Event Approved ✅', 'Your event \'test\' has been approved.', 'approval', 1, '2026-01-13 17:34:07'),
(6, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'test\'.', '', 1, '2026-01-13 17:39:46'),
(7, 3, 'Registration Approved 🎉', 'Your registration for \'test\' has been approved.', '', 1, '2026-01-13 17:43:17'),
(8, 4, 'New Event Pending Approval', 'Event \'Jom Masuk U 2026\' is waiting for approval.', 'approval', 1, '2026-01-16 10:59:02'),
(9, 4, 'New Event Pending Approval', 'Event \'UMS Job Fest 2026\' is waiting for approval.', 'approval', 1, '2026-01-16 11:01:59'),
(10, 4, 'New Event Pending Approval', 'Event \'Fun Charity Run UMS (5km & 3km)\' is waiting for approval.', 'approval', 1, '2026-01-16 11:04:15'),
(11, 4, 'New Event Pending Approval', 'Event \'Liga Sukan UMS\' is waiting for approval.', 'approval', 1, '2026-01-16 11:10:19'),
(12, 4, 'New Event Pending Approval', 'Event \'BE in SABAH 2026 (3rd International Business Events Forum)\' is waiting for approval.', 'approval', 1, '2026-01-16 11:14:16'),
(13, 4, 'New Event Pending Approval', 'Event \'Applied Engineering Technology workshop\' is waiting for approval.', 'approval', 1, '2026-01-16 11:17:56'),
(14, 3, 'Event Approved ✅', 'Your event \'Applied Engineering Technology workshop\' has been approved.', 'approval', 1, '2026-01-16 11:29:57'),
(15, 3, 'Event Approved ✅', 'Your event \'BE in SABAH 2026 (3rd International Business Events Forum)\' has been approved.', 'approval', 1, '2026-01-16 11:30:01'),
(16, 3, 'Event Approved ✅', 'Your event \'Liga Sukan UMS\' has been approved.', 'approval', 1, '2026-01-16 11:30:05'),
(17, 1, 'Event Approved ✅', 'Your event \'UMS Job Fest 2026\' has been approved.', 'approval', 1, '2026-01-16 11:30:08'),
(18, 1, 'Event Approved ✅', 'Your event \'Fun Charity Run UMS (5km & 3km)\' has been approved.', 'approval', 1, '2026-01-16 11:30:10'),
(19, 1, 'Event Approved ✅', 'Your event \'Jom Masuk U 2026\' has been approved.', 'approval', 1, '2026-01-16 11:30:13'),
(20, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'Jom Masuk U 2026\'.', '', 1, '2026-01-16 12:19:57'),
(21, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'UMS Job Fest 2026\'.', '', 1, '2026-01-16 12:20:02'),
(22, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'Fun Charity Run UMS (5km & 3km)\'.', '', 1, '2026-01-16 12:20:06'),
(23, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'Jom Masuk U 2026\'.', '', 1, '2026-01-16 12:20:24'),
(24, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'UMS Job Fest 2026\'.', '', 1, '2026-01-16 12:20:28'),
(25, 1, 'New Participant Registered 👤', 'A new participant has registered for your event \'Fun Charity Run UMS (5km & 3km)\'.', '', 1, '2026-01-16 12:20:31'),
(26, 3, 'New Participant Registered 👤', 'A new participant has registered for your event \'BE in SABAH 2026 (3rd International Business Events Forum)\'.', '', 0, '2026-01-16 12:20:35'),
(27, 3, 'New Participant Registered 👤', 'A new participant has registered for your event \'Applied Engineering Technology workshop\'.', '', 0, '2026-01-16 12:20:40'),
(28, 3, 'Registration Approved 🎉', 'Your registration for \'UMS Job Fest 2026\' has been approved.', '', 0, '2026-01-16 12:22:28'),
(29, 3, 'New Participant Registered 👤', 'A new participant has registered for your event \'Liga Sukan UMS\'.', '', 0, '2026-01-16 12:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `registered_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `attendance` enum('present','absent') DEFAULT 'absent'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `user_id`, `event_id`, `registered_at`, `status`, `attendance`) VALUES
(15, 3, 15, '2026-01-16 04:19:57', 'pending', 'absent'),
(16, 3, 16, '2026-01-16 04:20:02', 'approved', 'absent'),
(17, 3, 17, '2026-01-16 04:20:06', 'pending', 'absent'),
(18, 6, 15, '2026-01-16 04:20:24', 'pending', 'absent'),
(19, 6, 16, '2026-01-16 04:20:28', 'pending', 'absent'),
(20, 6, 17, '2026-01-16 04:20:31', 'pending', 'absent'),
(21, 6, 19, '2026-01-16 04:20:35', 'pending', 'absent'),
(22, 6, 20, '2026-01-16 04:20:40', 'pending', 'absent');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `role` enum('public','student','staff','admin') NOT NULL DEFAULT 'public',
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `organization` varchar(100) DEFAULT NULL,
  `recommend_events` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','suspended') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `email`, `phone`, `organization`, `recommend_events`, `password`, `created_at`, `status`) VALUES
(1, 'student', 'ASHA BINTI IBRAHIM', 'ashaibrahim0000@gmail.com', '0102086223', 'Student', 'Workshop, Seminar, Competition, Festival, Course', '$2y$10$D2IxhnAvFEUZLHoB5yGXbelqBrOO4y.NMcHEC5EsBksElQbJAUIo6', '2026-01-06 17:02:15', 'active'),
(3, 'staff', 'Asrul Asmat', 'asrulasmat12@gmail.com', '01136467136', NULL, 'Workshop, Seminar, Competition, Festival, Sport, Course', '$2y$10$ANTBp0Fm7ahKjgXd1Bmpgum6JsECngfnk4HdpPFUhVXDtid4Z/0zi', '2026-01-12 09:11:18', 'active'),
(4, 'admin', 'System Admin', 'admin@cems.com', NULL, NULL, NULL, '$2y$10$Mtyd8kZPPONqspDlo.ISZeKij2v1ilbxjOqcUCjzUuBeLxpQXp2V2', '2026-01-12 11:20:54', 'active'),
(6, 'public', 'AYU AEROZZA', 'aerozzayu@gmail.com', '0102938827', NULL, 'Workshop, Seminar, Competition, Festival, Sport, Course', '$2y$10$M8ISviTubQ3usU5oTWM/KOxqO.KYugY7E1/ehUxLlxy5s7zUAEjOm', '2026-01-16 02:37:31', 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `event_feedback`
--
ALTER TABLE `event_feedback`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id` (`event_id`,`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `event_feedback`
--
ALTER TABLE `event_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `registrations_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
