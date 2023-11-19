-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2023 at 03:31 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ttttxm`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(2, 'tienhuu', 'nguyentienhuu488@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Tiến Hữu', 1, '2023-11-18 22:12:54', 2, 'tienhuu_face.jpg', '2023-11-14'),
(3, 'hieu', 'hieu@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hiếu', 1, '0000-00-00 00:00:00', 3, 'avatar-default.jpg', '1997-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

CREATE TABLE `chats` (
  `ID` int(11) NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `time_sent` datetime NOT NULL,
  `chat_content` text COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `gender_detail` varchar(20) COLLATE utf8_unicode_ci NOT NULL
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
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `detail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `detail`) VALUES
(1, 'Khối 1'),
(2, 'Khối 2'),
(3, 'Khối 3'),
(4, 'Khối 4'),
(5, 'Khối 5'),
(6, 'Khối 6'),
(7, 'Khối 7'),
(8, 'Khối 8'),
(9, 'Khối 9'),
(10, 'Khối 10'),
(11, 'Khối 11'),
(12, 'Khối 12');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `username` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `notification_title` text COLLATE utf8_unicode_ci NOT NULL,
  `notification_content` text COLLATE utf8_unicode_ci NOT NULL,
  `time_sent` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `username`, `name`, `notification_title`, `notification_content`, `time_sent`) VALUES
(1, 'giaovien', 'giaovien', 'fsd', 'fsdfsd', '2018-11-06 16:13:48'),
(2, 'giaovien', 'giaovien', 'fsdfsd', 'sdfsdfsdf', '2018-11-06 16:14:02'),
(3, 'giaovien', 'giaovien', 'fsdf', 'fsdfsdfsd', '2018-11-06 16:14:10'),
(193361, 'tienhuu', 'Tiến Hữu', 'lịch học', 'dd', '2023-11-18 20:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission` int(11) NOT NULL,
  `permission_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `question_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`class_id`, `unit`, `question_content`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `correct_answer`, `question_id`) VALUES
(1, 2, '30 - 12 = ?', '10', '15', '18', '82', '18', 1),
(1, 1, '5 + 7 = ?', '12', '13', '14', '11', '12', 2),
(1, 1, '5 + 9 = ?', '13', '15', '17', '14', '14', 3),
(1, 1, '2 x 1 = ?', '1', '2', '3', '4', '2', 4),
(1, 1, '18 + 5 = ?', '20', '21', '22', '23', '23', 6),
(1, 1, '14 + 8 = ?', '20', '21', '22', '23', '22', 7),
(1, 1, '13 - 3 = ?', '7', '8', '9', '10', '10', 8),
(1, 1, '14 - 7 = ?', '7', '6', '5', '8', '7', 9),
(1, 2, '3 + 6 = ?', '7', '6', '9', '8', '9', 11),
(1, 2, '5+10 ?', '15', '10', '5', '4', '15', 12),
(1, 2, '2 x 7 = ?', '14', '16', '18', '12', '14', 13),
(1, 2, '2 x 9 = ?', '14', '16', '18', '12', '18', 14),
(1, 2, '3 x 7 = ?', '14', '16', '18', '21', '21', 15),
(1, 2, '3 x 5 = ?', '14', '16', '15', '12', '15', 16),
(1, 2, '4 x 10 = ?', '40', '4', '10', '1', '40', 17),
(1, 2, '2 x 10 = ?', '14', '16', '18', '20', '20', 18),
(1, 2, '10 + 20 = ?', '10', '20', '30', '03', '30', 19),
(1, 3, '10 x 10 = ?', '10', '20', '100', '11', '100', 20),
(1, 3, '2 x 5 = ?', '14', '16', '10', '12', '10', 21),
(1, 3, '4 x 7 =?', '27', '28', '29', '30', '28', 22),
(1, 3, '10 * 0 = ?', '10', '0', '1', '11', '0', 23),
(1, 3, '4 x 5 =?', '27', '28', '29', '20', '20', 24),
(1, 3, '5 x 8 =?', '37', '38', '39', '40', '40', 25),
(1, 3, '5 x 5 =?', '27', '28', '25', '30', '25', 26),
(1, 3, '7 x 9 = ?', '61', '63', '65', '67', '63', 27),
(1, 3, '7 x 7 = ?', '41', '43', '45', '49', '49', 28),
(1, 3, '7 x 8 = ?', '61', '63', '56', '67', '56', 29),
(1, 4, '9 x 9 = ?', '81', '63', '65', '67', '81', 30),
(1, 4, '6 x 9 = ?', '61', '63', '65', '54', '54', 31),
(1, 4, '21 : 3 = ?', '5', '6', '7', '8', '7', 32),
(1, 4, '24 : 8 = ?', '1', '2', '3', '4', '3', 33),
(1, 4, '27 : 3 = ?', '6', '7', '8', '9', '9', 34),
(1, 4, '32 : 8 = ?', '1', '2', '3', '4', '4', 35),
(1, 4, '25 : 5 = ?', '5', '2', '3', '4', '5', 36),
(1, 4, '42 : 7 = ?', '6', '5', '3', '4', '6', 37),
(1, 4, '56 : 8 = ?', '8', '7', '3', '4', '7', 38),
(1, 4, '81 : 9 = ?', '7', '8', '9', '81', '9', 39),
(1, 4, '40 : 8 = ?', '5', '2', '3', '4', '5', 40),
(1, 2, 'câu hỏi', 'sai', 'sai', 'đúng', 'sai', 'đúng', 46);

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
(181565, 1, '2023-11-15 16:51:55'),
(181565, 3, '2023-11-15 16:51:55'),
(181565, 4, '2023-11-15 16:51:55'),
(181565, 7, '2023-11-15 16:51:55'),
(181565, 9, '2023-11-15 16:51:55'),
(294005, 2, '2018-11-06 07:41:09'),
(294005, 3, '2018-11-06 07:41:09'),
(294005, 4, '2018-11-06 07:41:09'),
(294005, 6, '2018-11-06 07:41:09'),
(294005, 8, '2018-11-06 07:41:09'),
(294005, 11, '2018-11-06 07:41:09'),
(294005, 12, '2018-11-06 07:41:09'),
(294005, 13, '2018-11-06 07:41:09'),
(294005, 15, '2018-11-06 07:41:09'),
(294005, 19, '2018-11-06 07:41:09'),
(294005, 21, '2018-11-06 07:41:09'),
(294005, 22, '2018-11-06 07:41:09'),
(294005, 24, '2018-11-06 07:41:09'),
(294005, 27, '2018-11-06 07:41:09'),
(294005, 28, '2018-11-06 07:41:09'),
(294005, 32, '2018-11-06 07:41:09'),
(294005, 34, '2018-11-06 07:41:09'),
(294005, 38, '2018-11-06 07:41:09'),
(294005, 39, '2018-11-06 07:41:09'),
(294005, 40, '2018-11-06 07:41:09'),
(607315, 4, '2018-11-16 03:46:28'),
(607315, 6, '2018-11-16 03:46:28'),
(607315, 7, '2018-11-16 03:46:28'),
(607315, 8, '2018-11-16 03:46:28'),
(607315, 9, '2018-11-16 03:46:28'),
(607315, 11, '2018-11-16 03:46:28'),
(607315, 12, '2018-11-16 03:46:28'),
(607315, 15, '2018-11-16 03:46:28'),
(607315, 17, '2018-11-16 03:46:28'),
(607315, 18, '2018-11-16 03:46:28'),
(607315, 21, '2018-11-16 03:46:28'),
(607315, 22, '2018-11-16 03:46:28'),
(607315, 24, '2018-11-16 03:46:28'),
(607315, 27, '2018-11-16 03:46:28'),
(607315, 28, '2018-11-16 03:46:28'),
(607315, 31, '2018-11-16 03:46:28'),
(607315, 33, '2018-11-16 03:46:28'),
(607315, 34, '2018-11-16 03:46:28'),
(607315, 37, '2018-11-16 03:46:28'),
(607315, 38, '2018-11-16 03:46:28'),
(933750, 20, '2023-11-16 07:44:38'),
(933750, 21, '2023-11-16 07:44:38'),
(933750, 22, '2023-11-16 07:44:38'),
(933750, 23, '2023-11-16 07:44:38'),
(933750, 24, '2023-11-16 07:44:38'),
(933750, 25, '2023-11-16 07:44:38'),
(933750, 26, '2023-11-16 07:44:38'),
(933750, 27, '2023-11-16 07:44:38'),
(933750, 28, '2023-11-16 07:44:38'),
(933750, 29, '2023-11-16 07:44:38');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scores`
--

INSERT INTO `scores` (`student_id`, `test_code`, `score_number`, `score_detail`, `completion_time`) VALUES
(24, 181565, '10', '5/5', '2023-11-18 21:42:21'),
(24, 294005, '9', '18/20', '2023-11-18 21:44:49');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(1) NOT NULL,
  `detail` varchar(50) COLLATE utf8_unicode_ci NOT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(24, 'duyduc', 'duyduc@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Đức', 3, 1, '2023-11-18 21:45:30', 2, 'avatar-default.jpg', '2023-11-14', NULL, NULL, NULL);

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
(2, 2, 1),
(3, 2, 1),
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
  `answer_a` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_b` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_c` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `answer_d` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_answer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_test_detail`
--

INSERT INTO `student_test_detail` (`ID`, `student_id`, `test_code`, `question_id`, `answer_a`, `answer_b`, `answer_c`, `answer_d`, `student_answer`, `timest`) VALUES
(699365356, 1, 294005, 2, '11', '14', '12', '13', NULL, '2018-11-06 07:41:36'),
(343414991, 1, 294005, 3, '13', '15', '17', '14', NULL, '2018-11-06 07:41:36'),
(542662526, 1, 294005, 4, '4', '1', '3', '2', NULL, '2018-11-06 07:41:36'),
(450837748, 1, 294005, 6, '21', '22', '20', '23', NULL, '2018-11-06 07:41:36'),
(286400670, 1, 294005, 8, '9', '7', '10', '8', NULL, '2018-11-06 07:41:36'),
(1379351060, 1, 294005, 11, '6', '9', '7', '8', NULL, '2018-11-06 07:41:36'),
(472119203, 1, 294005, 12, '10', '4', '15', '5', NULL, '2018-11-06 07:41:36'),
(808664468, 1, 294005, 13, '12', '14', '16', '18', NULL, '2018-11-06 07:41:36'),
(1164902165, 1, 294005, 15, '14', '21', '16', '18', NULL, '2018-11-06 07:41:36'),
(1417214909, 1, 294005, 19, '20', '30', '03', '10', NULL, '2018-11-06 07:41:36'),
(660579040, 1, 294005, 21, '16', '10', '14', '12', NULL, '2018-11-06 07:41:36'),
(125942593, 1, 294005, 22, '29', '30', '27', '28', NULL, '2018-11-06 07:41:36'),
(747328301, 1, 294005, 24, '27', '28', '20', '29', NULL, '2018-11-06 07:41:36'),
(436989982, 1, 294005, 27, '63', '61', '65', '67', NULL, '2018-11-06 07:41:36'),
(1448475645, 1, 294005, 28, '41', '45', '43', '49', NULL, '2018-11-06 07:41:36'),
(1338764864, 1, 294005, 32, '8', '7', '6', '5', NULL, '2018-11-06 07:41:36'),
(1356122610, 1, 294005, 34, '8', '7', '6', '9', NULL, '2018-11-06 07:41:36'),
(1067443496, 1, 294005, 38, '8', '3', '7', '4', NULL, '2018-11-06 07:41:36'),
(270354166, 1, 294005, 39, '9', '8', '81', '7', NULL, '2018-11-06 07:41:36'),
(817766306, 1, 294005, 40, '2', '3', '5', '4', NULL, '2018-11-06 07:41:36'),
(1124225112, 2, 294005, 2, '13', '12', '14', '11', NULL, '2018-11-15 12:36:28'),
(1171063655, 2, 294005, 3, '14', '15', '17', '13', NULL, '2018-11-15 12:36:28'),
(62405982, 2, 294005, 4, '3', '2', '1', '4', NULL, '2018-11-15 12:36:28'),
(682921276, 2, 294005, 6, '22', '20', '23', '21', NULL, '2018-11-15 12:36:28'),
(741056118, 2, 294005, 8, '10', '8', '9', '7', NULL, '2018-11-15 12:36:28'),
(995158141, 2, 294005, 11, '8', '6', '9', '7', NULL, '2018-11-15 12:36:28'),
(1168023809, 2, 294005, 12, '5', '15', '4', '10', NULL, '2018-11-15 12:36:28'),
(162098473, 2, 294005, 13, '14', '16', '18', '12', NULL, '2018-11-15 12:36:28'),
(9441170, 2, 294005, 15, '21', '16', '14', '18', '21', '2018-11-15 12:36:35'),
(842734937, 2, 294005, 19, '03', '10', '20', '30', NULL, '2018-11-15 12:36:28'),
(264194709, 2, 294005, 21, '12', '16', '10', '14', NULL, '2018-11-15 12:36:28'),
(411822707, 2, 294005, 22, '28', '27', '30', '29', NULL, '2018-11-15 12:36:28'),
(1358509098, 2, 294005, 24, '29', '28', '20', '27', NULL, '2018-11-15 12:36:28'),
(1250256822, 2, 294005, 27, '67', '61', '65', '63', NULL, '2018-11-15 12:36:28'),
(125044076, 2, 294005, 28, '41', '49', '45', '43', NULL, '2018-11-15 12:36:28'),
(234481787, 2, 294005, 32, '8', '6', '7', '5', NULL, '2018-11-15 12:36:28'),
(1131614951, 2, 294005, 34, '8', '7', '9', '6', NULL, '2018-11-15 12:36:28'),
(1204289755, 2, 294005, 38, '3', '8', '7', '4', NULL, '2018-11-15 12:36:28'),
(124745437, 2, 294005, 39, '8', '9', '81', '7', NULL, '2018-11-15 12:36:28'),
(152984221, 2, 294005, 40, '4', '3', '5', '2', NULL, '2018-11-15 12:36:28'),
(725481410, 3, 294005, 2, '11', '12', '14', '13', '11', '2018-11-16 01:49:44'),
(956643423, 3, 294005, 3, '13', '14', '17', '15', '17', '2018-11-16 01:49:49'),
(933924874, 3, 294005, 4, '1', '4', '3', '2', '4', '2018-11-16 01:49:47'),
(972941471, 3, 294005, 6, '23', '20', '22', '21', '23', '2018-11-16 01:49:50'),
(190029045, 3, 294005, 8, '8', '10', '7', '9', '9', '2018-11-16 01:49:39'),
(1242021003, 3, 294005, 11, '9', '6', '8', '7', '6', '2018-11-16 01:49:53'),
(1387696544, 3, 294005, 12, '15', '10', '4', '5', '10', '2018-11-16 01:49:54'),
(1388474118, 3, 294005, 13, '16', '12', '18', '14', '12', '2018-11-16 01:49:55'),
(365413750, 3, 294005, 15, '16', '14', '21', '18', '14', '2018-11-16 01:49:41'),
(616556902, 3, 294005, 19, '30', '20', '03', '10', '20', '2018-11-16 01:49:43'),
(4698384, 3, 294005, 21, '12', '16', '10', '14', '10', '2018-11-16 01:49:36'),
(509280545, 3, 294005, 22, '27', '29', '30', '28', '28', '2018-11-16 01:49:42'),
(1473641031, 3, 294005, 24, '28', '20', '29', '27', '28', '2018-11-16 01:50:00'),
(1453081883, 3, 294005, 27, '67', '61', '63', '65', '63', '2018-11-16 01:49:59'),
(1115091839, 3, 294005, 28, '41', '49', '45', '43', '49', '2018-11-16 01:49:52'),
(981955747, 3, 294005, 32, '8', '5', '7', '6', '6', '2018-11-16 01:49:51'),
(312348534, 3, 294005, 34, '7', '9', '6', '8', '8', '2018-11-16 01:49:40'),
(911207132, 3, 294005, 38, '3', '7', '8', '4', '8', '2018-11-16 01:49:45'),
(169516863, 3, 294005, 39, '81', '7', '8', '9', '7', '2018-11-16 01:49:37'),
(1442637997, 3, 294005, 40, '4', '5', '2', '3', '3', '2018-11-16 01:49:58'),
(1208186219, 23, 607315, 4, '3', '2', '1', '4', '3', '2018-11-16 03:48:27'),
(438702149, 23, 607315, 6, '22', '20', '23', '21', '23', '2018-11-16 03:48:16'),
(34348690, 23, 607315, 7, '22', '23', '21', '20', '22', '2018-11-16 03:48:10'),
(1397933449, 23, 607315, 8, '8', '7', '9', '10', '7', '2018-11-16 03:48:28'),
(236533864, 23, 607315, 9, '8', '7', '5', '6', '5', '2018-11-16 03:48:11'),
(471146233, 23, 607315, 11, '9', '8', '7', '6', '7', '2018-11-16 03:48:17'),
(834462403, 23, 607315, 12, '4', '15', '5', '10', '4', '2018-11-16 03:48:21'),
(471203469, 23, 607315, 15, '21', '14', '18', '16', '16', '2018-11-16 03:48:18'),
(1113378242, 23, 607315, 17, '4', '40', '10', '1', '4', '2018-11-16 03:48:26'),
(511354923, 23, 607315, 18, '18', '16', '14', '20', '20', '2018-11-16 03:48:19'),
(352746548, 23, 607315, 21, '10', '16', '12', '14', '12', '2018-11-16 03:48:13'),
(349676011, 23, 607315, 22, '28', '29', '30', '27', '27', '2018-11-16 03:48:12'),
(964155246, 23, 607315, 24, '29', '28', '20', '27', '20', '2018-11-16 03:48:25'),
(24753220, 23, 607315, 27, '63', '65', '61', '67', '67', '2018-11-16 03:48:09'),
(407287587, 23, 607315, 28, '41', '45', '43', '49', '49', '2018-11-16 03:48:15'),
(1495520790, 23, 607315, 31, '61', '54', '65', '63', '65', '2018-11-16 03:48:30'),
(1472597789, 23, 607315, 33, '2', '1', '4', '3', '4', '2018-11-16 03:48:29'),
(1108014412, 23, 607315, 34, '7', '8', '9', '6', '6', '2018-11-16 03:48:22'),
(589028259, 23, 607315, 37, '4', '6', '3', '5', '6', '2018-11-16 03:48:20'),
(406859792, 23, 607315, 38, '3', '7', '8', '4', '8', '2018-11-16 03:48:14'),
(1553792534, 24, 181565, 1, '10', '18', '82', '15', '18', '2023-11-18 14:42:18'),
(1175873028, 24, 181565, 3, '13', '14', '15', '17', '14', '2023-11-18 14:42:13'),
(1279506854, 24, 181565, 4, '3', '2', '1', '4', '2', '2023-11-18 14:42:16'),
(770872149, 24, 181565, 7, '23', '20', '21', '22', '22', '2023-11-18 14:42:11'),
(203927958, 24, 181565, 9, '6', '7', '5', '8', '7', '2023-11-18 14:42:09'),
(694213656, 24, 294005, 2, '11', '13', '14', '12', '12', '2023-11-18 14:44:24'),
(622010894, 24, 294005, 3, '17', '14', '15', '13', '13', '2023-11-18 14:44:16'),
(1635090540, 24, 294005, 4, '2', '4', '3', '1', '2', '2023-11-18 14:44:46'),
(310725090, 24, 294005, 6, '22', '23', '21', '20', '23', '2023-11-18 14:44:09'),
(1679440130, 24, 294005, 8, '10', '8', '9', '7', '10', '2023-11-18 14:44:47'),
(190074734, 24, 294005, 11, '8', '9', '7', '6', '9', '2023-11-18 14:44:07'),
(1469773601, 24, 294005, 12, '4', '10', '5', '15', '15', '2023-11-18 14:44:38'),
(1564160145, 24, 294005, 13, '18', '14', '12', '16', '14', '2023-11-18 14:44:41'),
(322407370, 24, 294005, 15, '21', '18', '16', '14', '21', '2023-11-18 14:44:11'),
(1234913073, 24, 294005, 19, '10', '30', '20', '03', '30', '2023-11-18 14:44:29'),
(1581750799, 24, 294005, 21, '16', '10', '14', '12', '10', '2023-11-18 14:44:43'),
(1361229449, 24, 294005, 22, '30', '28', '27', '29', '28', '2023-11-18 14:44:34'),
(1209845648, 24, 294005, 24, '29', '28', '27', '20', '20', '2023-11-18 14:44:28'),
(630998081, 24, 294005, 27, '61', '67', '65', '63', '63', '2023-11-18 14:44:22'),
(1381177858, 24, 294005, 28, '45', '43', '49', '41', '49', '2023-11-18 14:44:36'),
(1592573037, 24, 294005, 32, '7', '8', '6', '5', '7', '2023-11-18 14:44:44'),
(913274960, 24, 294005, 34, '7', '6', '8', '9', '9', '2023-11-18 14:44:25'),
(1331562039, 24, 294005, 38, '8', '4', '7', '3', '8', '2023-11-18 14:44:32'),
(1535198949, 24, 294005, 39, '7', '8', '9', '81', '9', '2023-11-18 14:44:39'),
(492199465, 24, 294005, 40, '4', '5', '3', '2', '5', '2023-11-18 14:44:14');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_detail` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`subject_id`, `subject_detail`) VALUES
(1, 'Toán'),
(2, 'Tiếng Anh');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `username`, `email`, `password`, `name`, `permission`, `last_login`, `gender_id`, `avatar`, `birthday`) VALUES
(1, 'giaovien', 'giaovien@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'giaovien', 2, '2018-11-16 11:10:31', 3, 'avatar-default.jpg', '1997-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_notifications`
--

CREATE TABLE `teacher_notifications` (
  `ID` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_code` int(11) NOT NULL,
  `test_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `class_id` int(11) NOT NULL,
  `total_questions` int(11) NOT NULL,
  `time_to_do` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci NOT NULL,
  `status_id` int(11) DEFAULT NULL,
  `timest` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_code`, `test_name`, `password`, `class_id`, `total_questions`, `time_to_do`, `note`, `status_id`, `timest`) VALUES
(181565, 'A1', 'e10adc3949ba59abbe56e057f20f883e', 1, 5, 5, 'a1', 1, '2023-11-16 00:55:42'),
(294005, 'Thử', 'e10adc3949ba59abbe56e057f20f883e', 1, 20, 20, 'Thử', 1, '2023-11-15 16:49:44'),
(607315, 'Thử 2', 'e10adc3949ba59abbe56e057f20f883e', 1, 20, 15, 'Thử 2', 1, '2018-11-16 03:47:44'),
(933750, 'test', 'e10adc3949ba59abbe56e057f20f883e', 1, 10, 5, 'test nha', 2, '2023-11-16 07:45:37');

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
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`);

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
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

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
-- Indexes for table `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `notification_id` (`notification_id`),
  ADD KEY `teacher_id` (`teacher_id`);

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
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `status_id` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `student_notifications`
--
ALTER TABLE `student_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=933751;

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
-- Constraints for table `teacher_notifications`
--
ALTER TABLE `teacher_notifications`
  ADD CONSTRAINT `teacher_notifications_ibfk_1` FOREIGN KEY (`notification_id`) REFERENCES `notifications` (`notification_id`),
  ADD CONSTRAINT `teacher_notifications_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

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
