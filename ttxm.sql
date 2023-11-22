-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2023 at 04:44 PM
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
-- Database: `ttxm`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 1,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(2, 'tienhuu', 'nguyentienhuu488@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tiến Hữu', 1, '2023-11-22 22:43:39', 2, 'tienhuu_face.jpg', '2023-11-14'),
(3, 'hieu', 'hieu@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Hiếu', 1, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '1997-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `ID` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_sent` datetime NOT NULL,
  `chat_content` text NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`ID`, `username`, `name`, `time_sent`, `chat_content`, `class_id`) VALUES
(1, '2017HS1', 'Trần Phúc An', '2018-11-06 14:24:48', 'fsdfsds', 1),
(2, '2017HS1', 'Trần Phúc An', '2018-11-06 16:12:02', 'gdfgdf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`) VALUES
(1, 'A1'),
(2, 'A2'),
(3, 'A3'),
(4, 'A4');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(1) NOT NULL,
  `gender_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_detail`) VALUES
(1, 'Chưa Xác Định'),
(2, 'Nam'),
(3, 'Nữ');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `notification_title` text NOT NULL,
  `notification_content` text NOT NULL,
  `time_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `username`, `name`, `notification_title`, `notification_content`, `time_sent`) VALUES
(193361, 'tienhuu', 'Tiến Hữu', 'lịch học', 'dd', '2023-11-18 20:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission` int(11) NOT NULL,
  `permission_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission`, `permission_detail`) VALUES
(1, 'Admin'),
(2, 'Giáo Viên'),
(3, 'Học Sinh');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `class_id` int(10) NOT NULL,
  `unit` int(2) NOT NULL,
  `question_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_a` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_b` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_c` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `answer_d` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correct_answer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `question_id` int(11) NOT NULL,
  `img` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`class_id`, `unit`, `question_content`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`, `question_id`, `img`) VALUES
(1, 1, 'cau hoi dung', 'dung', 'sai', 'sai', 'sai', 'dung', 64, ''),
(1, 1, 'cau 1', 'sai', 'sai', 'sai', 'dung', 'dung', 65, '371138870_242659618823245_5893175612219118990_n25.jpg'),
(1, 1, 'cau 2', 'sai', 'sai', 'dung', 'sai', 'dung', 66, '384547011_857547652567448_2901758554459701334_n79.jpg'),
(2, 1, '2 x2', '4', '5', '6', '7', '4', 68, ''),
(2, 1, '2 x3', '4', '5', '6', '7', '6', 69, ''),
(2, 2, '2 x4', '5', '6', '7', '8', '8', 70, ''),
(2, 3, '3 x 5', '10', '15', '20', '25', '15', 71, '');

-- --------------------------------------------------------

--
-- Table structure for table `quest_of_test`
--

CREATE TABLE `quest_of_test` (
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `quest_of_test`
--

INSERT INTO `quest_of_test` (`test_code`, `question_id`, `timest`) VALUES
(214244, 64, '2023-11-22 15:02:23'),
(214244, 65, '2023-11-22 15:02:23'),
(214244, 66, '2023-11-22 15:02:23'),
(973497, 68, '2023-11-22 15:02:54'),
(973497, 69, '2023-11-22 15:02:54'),
(973497, 70, '2023-11-22 15:02:54'),
(973497, 71, '2023-11-22 15:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `scores`
--

CREATE TABLE `scores` (
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `score_number` varchar(10) DEFAULT NULL,
  `score_detail` varchar(50) NOT NULL,
  `completion_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(1) NOT NULL,
  `detail` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`status_id`, `detail`) VALUES
(1, 'Mở'),
(2, 'Đóng'),
(3, 'Chờ Đóng');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 3,
  `class_id` int(11) NOT NULL,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL,
  `doing_exam` int(11) DEFAULT NULL,
  `starting_time` datetime DEFAULT NULL,
  `time_remaining` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `username`, `email`, `password`, `name`, `permission`, `class_id`, `last_login`, `gender_id`, `avatar`, `birthday`, `doing_exam`, `starting_time`, `time_remaining`) VALUES
(1, '2017HS1', 'example1@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Trần Phúc An', 3, 1, '2018-11-08 14:25:09', 2, 'avatar-default.jpg', '2023-11-15', 294005, '2018-11-08 14:25:07', '20:00'),
(2, '2017HS2', 'example2@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Lều Tuấn Anh', 3, 1, '2018-11-15 19:37:31', 2, 'avatar-default.jpg', '2008-09-07', NULL, NULL, NULL),
(3, '2017HS3', 'example3@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Phạm Văn Bội', 3, 1, '2018-11-16 08:50:02', 2, 'avatar-default.jpg', '2023-11-06', NULL, NULL, NULL),
(4, '2017HS4', 'example4@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Trần Khánh Duy', 3, 1, '2018-09-20 04:19:27', 2, 'avatar-default.jpg', '2008-05-10', NULL, NULL, NULL),
(5, '2017HS5', 'example5@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Trần Thành Đạt', 3, 1, '2018-09-19 04:09:18', 2, 'avatar-default.jpg', '2008-05-03', NULL, NULL, NULL),
(6, '2017HS6', 'example6@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Quang Điện', 3, 1, '2018-09-24 06:13:23', 1, 'avatar-default.jpg', '2008-10-10', NULL, NULL, NULL),
(7, '2017HS7', 'example7@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Thị Diệu Hằng', 3, 1, '2018-09-26 05:17:17', 1, 'avatar-default.jpg', '2008-02-03', NULL, NULL, NULL),
(8, '2017HS8', 'example8@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phạm Khánh Hoàng', 3, 1, '2018-09-18 06:17:12', 1, 'avatar-default.jpg', '2008-01-01', NULL, NULL, NULL),
(9, '2017HS9', 'example9@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Khánh Linh', 3, 1, '2018-09-18 05:10:10', 1, 'avatar-default.jpg', '2008-01-03', NULL, NULL, NULL),
(10, '2017HS10', 'example10@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ngô Trần Khôi', 3, 1, '2018-09-28 06:17:28', 1, 'avatar-default.jpg', '2008-04-06', NULL, NULL, NULL),
(11, '2017HS11', 'example11@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Thị Khánh Ly', 3, 1, '2018-09-20 03:13:13', 1, 'avatar-default.jpg', '2008-01-03', NULL, NULL, NULL),
(12, '2017HS12', 'example12@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Phương Mai', 3, 1, '2018-09-20 09:13:13', 1, 'avatar-default.jpg', '2008-01-06', NULL, NULL, NULL),
(13, '2017HS13', 'example13@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đỗ Thị Mùi', 3, 1, '2018-09-20 03:07:11', 1, 'avatar-default.jpg', '2008-09-13', NULL, NULL, NULL),
(14, '2017HS14', 'example14@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Bùi Kim Oanh', 3, 1, '2018-09-20 10:23:16', 1, 'avatar-default.jpg', '2008-10-30', NULL, NULL, NULL),
(15, '2017HS15', 'example15@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Thị Kiều Oanh', 3, 1, '2018-09-15 00:00:00', 1, 'avatar-default.jpg', '2008-11-20', NULL, NULL, NULL),
(16, '2017HS16', 'example16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Thị Hà', 3, 1, '2018-09-22 08:17:14', 1, 'avatar-default.jpg', '2008-03-26', NULL, NULL, NULL),
(17, '2017HS17', 'example17@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Thị G', 3, 1, '2018-09-14 06:15:15', 1, 'avatar-default.jpg', '2008-01-12', NULL, NULL, NULL),
(18, '2017HS18', 'example18@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hoàng Thị H', 3, 1, '2018-09-21 10:20:11', 1, 'avatar-default.jpg', '2008-01-03', NULL, NULL, NULL),
(19, '2017HS19', 'example19@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Lê Thị Khánh Ly', 3, 1, '2018-09-20 06:14:11', 1, 'avatar-default.jpg', '2008-06-06', NULL, NULL, NULL),
(20, '2017HS20', 'example20@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Vũ Huy Hoàng', 3, 1, '2018-09-28 13:12:12', 1, 'avatar-default.jpg', '2008-01-02', NULL, NULL, NULL),
(23, '2017HS23', 'example23@gmail.com', 'd41d8cd98f00b204e9800998ecf8427e', 'Nguyễn Thị Thu', 3, 2, '2018-11-16 10:48:33', 2, 'avatar-default.jpg', '2023-11-15', NULL, NULL, NULL),
(24, 'duyduc', 'duyduc@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đức', 3, 1, '2023-11-22 22:19:20', 2, 'avatar-default.jpg', '2023-11-14', NULL, NULL, NULL),
(25, 'quanhoang5202', 'hquan20020915@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hoàng Quân', 3, 1, '2023-11-20 15:51:53', 2, 'avatar-default.jpg', '2003-11-15', NULL, NULL, NULL),
(26, 'quanhoang', 'quanhoang5202@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hoàng Anh', 3, 2, '2023-11-20 17:05:16', 1, 'avatar-default.jpg', '2002-11-22', NULL, NULL, NULL),
(27, 'quanhoang5203', 'quanhoang52022@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hoàng Quânn', 3, 3, '0000-00-00 00:00:00', 2, 'avatar-default.jpg', '2023-11-20', NULL, NULL, NULL),
(28, 'quanhoang5205', 'quanhoang52222@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Hoàng Quânnnn', 3, 3, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '2023-11-20', NULL, NULL, NULL),
(29, 'phong', 'phong@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Phong', 3, 1, '2023-11-21 23:59:01', 2, 'avatar-default.jpg', '2023-11-10', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_notifications`
--

CREATE TABLE `student_notifications` (
  `ID` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_notifications`
--

INSERT INTO `student_notifications` (`ID`, `notification_id`, `class_id`) VALUES
(4, 193361, 1),
(5, 193361, 2),
(6, 193361, 3),
(7, 193361, 4);

-- --------------------------------------------------------

--
-- Table structure for table `student_test_detail`
--

CREATE TABLE `student_test_detail` (
  `ID` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `test_code` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_a` text DEFAULT NULL,
  `answer_b` text DEFAULT NULL,
  `answer_c` text DEFAULT NULL,
  `answer_d` text DEFAULT NULL,
  `student_answer` text DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `permission` int(1) DEFAULT 2,
  `last_login` datetime NOT NULL,
  `gender_id` int(1) NOT NULL DEFAULT 1,
  `avatar` varchar(255) DEFAULT 'avatar-default.jpg',
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(1, 'giaovien', 'giaovien@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'giaovien', 2, '2018-11-16 11:10:31', 3, 'avatar-default.jpg', '1997-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_code` int(11) NOT NULL,
  `test_name` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `time_to_do` int(11) NOT NULL,
  `note` text NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_code`, `test_name`, `class_id`, `total_questions`, `time_to_do`, `note`, `status_id`, `timest`) VALUES
(214244, 'A1', 1, 3, 5, 'A1', 1, '2023-11-22 15:43:29'),
(973497, 'A2', 2, 4, 4, 'A2', 1, '2023-11-22 15:03:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n4` (`permission`),
  ADD KEY `admins_gender_id` (`gender_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_name` (`class_name`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `k9` (`class_id`),
  ADD KEY `unit` (`unit`);

--
-- Indexes for table `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD PRIMARY KEY (`test_code`,`question_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`student_id`,`test_code`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `test_code` (`test_code`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n9` (`class_id`),
  ADD KEY `n11` (`permission`),
  ADD KEY `students_gender_id` (`gender_id`);

--
-- Indexes for table `student_notifications`
--
ALTER TABLE `student_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD PRIMARY KEY (`student_id`,`test_code`,`question_id`),
  ADD KEY `fk4` (`test_code`),
  ADD KEY `fk6` (`question_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `n2` (`permission`),
  ADD KEY `teachers_gender_id` (`gender_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_code`),
  ADD KEY `fk2` (`status_id`),
  ADD KEY `class_id` (`class_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193362;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `student_notifications`
--
ALTER TABLE `student_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=973498;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `n4` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`);

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chat_classes_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `k9` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `quest_of_test`
--
ALTER TABLE `quest_of_test`
  ADD CONSTRAINT `quest_of_test_ibfk_1` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`),
  ADD CONSTRAINT `quest_of_test_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`);

--
-- Constraints for table `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `n11` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `n9` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`),
  ADD CONSTRAINT `students_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Constraints for table `student_notifications`
--
ALTER TABLE `student_notifications`
  ADD CONSTRAINT `student_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `student_notifications_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Constraints for table `student_test_detail`
--
ALTER TABLE `student_test_detail`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`test_code`) REFERENCES `tests` (`test_code`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`),
  ADD CONSTRAINT `fk9` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `n2` FOREIGN KEY (`permission`) REFERENCES `permissions` (`permission`),
  ADD CONSTRAINT `teachers_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`);

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`),
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
