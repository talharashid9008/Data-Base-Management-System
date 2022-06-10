-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 21, 2021 at 05:42 AM
-- Server version: 5.7.36-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hmaray_bachay`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `allStudents_Name` ()  BEGIN
    SELECT
        sid, name
    FROM
        student ;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accompany_info`
--

CREATE TABLE `accompany_info` (
  `student_id` int(11) NOT NULL,
  `guardian_cnic` int(11) NOT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `guardian_name` varchar(30) DEFAULT NULL,
  `class` int(11) NOT NULL,
  `pregnant` varchar(5) NOT NULL,
  `reason` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`uname`, `password`) VALUES
('labeeb', '2468'),
('momin', '1357'),
('talha', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `changed`
--

CREATE TABLE `changed` (
  `sid` int(11) DEFAULT NULL,
  `s_from` int(11) DEFAULT NULL,
  `s_to` int(11) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `approval` varchar(30) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `changed`
--

INSERT INTO `changed` (`sid`, `s_from`, `s_to`, `reason`, `approval`, `date`) VALUES
(23, 2, 3, 'Not Suited well', 'usman', '2021-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `low_age` int(11) DEFAULT NULL,
  `up_age` int(11) DEFAULT NULL,
  `fees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `low_age`, `up_age`, `fees`) VALUES
(1, 3, 5, 500),
(2, 6, 8, 700),
(3, 9, 11, 900),
(4, 12, 14, 1100);

-- --------------------------------------------------------

--
-- Table structure for table `class_section`
--

CREATE TABLE `class_section` (
  `class_id` int(11) DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_section`
--

INSERT INTO `class_section` (`class_id`, `section_id`) VALUES
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(4, 7),
(4, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `father`
--

CREATE TABLE `father` (
  `sid` int(11) DEFAULT NULL,
  `cnic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `father`
--

INSERT INTO `father` (`sid`, `cnic`) VALUES
(23, 345678);

-- --------------------------------------------------------

--
-- Table structure for table `guardian`
--

CREATE TABLE `guardian` (
  `sid` int(11) DEFAULT NULL,
  `cnic` int(11) DEFAULT NULL,
  `relation` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guardian`
--

INSERT INTO `guardian` (`sid`, `cnic`, `relation`) VALUES
(23, 765676, 'uncle');

-- --------------------------------------------------------

--
-- Table structure for table `mother`
--

CREATE TABLE `mother` (
  `sid` int(11) DEFAULT NULL,
  `cnic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mother`
--

INSERT INTO `mother` (`sid`, `cnic`) VALUES
(23, 4567);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `cnic` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`cnic`, `name`, `gender`, `contact`, `email`, `address`) VALUES
(4567, 'Shehnaz Rashid', 'Female', 10982571, 'xyz@gmail.com', '18g/675'),
(345678, 'Rashid mehmood', 'Male', 987654, 'abc@gmail.com', '18g/675'),
(765676, 'Kashif', 'Male', 987612, 'qwert@gmail.com', 'new city wah cantt');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL,
  `section_title` varchar(1) NOT NULL,
  `course_code` varchar(15) NOT NULL,
  `course_title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`section_id`, `section_title`, `course_code`, `course_title`) VALUES
(2, 'A', 'E01', 'English'),
(3, 'B', 'U02', 'Urdu'),
(4, 'A', 'C045', 'Computer'),
(5, 'C', 'I786', 'Islamic Studies'),
(6, 'B', 'C078', 'General Science'),
(7, 'A', 'Mt654', 'Mathematics'),
(8, 'B', 'cs098', 'Advanced Programming'),
(9, 'C', 'Mt098', 'Linear Algerra');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `sid` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `fee_status` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`sid`, `name`, `age`, `DOB`, `Gender`, `fee_status`) VALUES
(23, 'talha rashid', 4, '2002-01-08', 'Male', 'full'),
(24, 'haris', 4, '2000-08-15', 'Male', 'full'),
(25, 'omar khan', 5, '2001-06-05', 'Male', 'full'),
(26, 'momin', 6, '2009-06-05', 'Male', 'full'),
(27, 'laeeb', 7, '2011-06-14', 'Male', 'full'),
(28, 'waleed', 9, '2001-09-18', 'Male', 'full'),
(29, 'saad', 10, '2011-07-04', 'Male', 'full'),
(30, 'nasir', 11, '2001-09-04', 'Male', 'full'),
(31, 'zain', 11, '2015-07-11', 'Male', 'full'),
(32, 'usama', 12, '2014-05-04', 'Male', 'full'),
(33, 'atif', 13, '2011-09-08', 'Male', 'full'),
(34, 'waqas', 14, '2010-07-11', 'Male', 'full');

-- --------------------------------------------------------

--
-- Table structure for table `student_section`
--

CREATE TABLE `student_section` (
  `sid` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_section`
--

INSERT INTO `student_section` (`sid`, `section_id`) VALUES
(23, 2),
(24, 2),
(25, 3),
(26, 4),
(27, 5),
(29, 6),
(30, 6),
(31, 6),
(32, 7),
(33, 8),
(34, 9);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`tid`, `name`) VALUES
(1, 'usman'),
(2, 'Amir Gulzar'),
(3, 'Farooq'),
(4, 'Ali'),
(5, 'Ahmed'),
(6, 'Hamza'),
(7, 'Tayyaba'),
(8, 'Majid');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_section`
--

CREATE TABLE `teacher_section` (
  `tid` int(11) NOT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_section`
--

INSERT INTO `teacher_section` (`tid`, `section_id`) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accompany_info`
--
ALTER TABLE `accompany_info`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class` (`class`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`uname`);

--
-- Indexes for table `changed`
--
ALTER TABLE `changed`
  ADD KEY `sid` (`sid`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`),
  ADD UNIQUE KEY `class_id` (`class_id`);

--
-- Indexes for table `class_section`
--
ALTER TABLE `class_section`
  ADD KEY `class_id` (`class_id`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `father`
--
ALTER TABLE `father`
  ADD UNIQUE KEY `sid` (`sid`),
  ADD UNIQUE KEY `cnic` (`cnic`),
  ADD UNIQUE KEY `sid_2` (`sid`),
  ADD UNIQUE KEY `sid_3` (`sid`),
  ADD UNIQUE KEY `sid_4` (`sid`),
  ADD UNIQUE KEY `sid_5` (`sid`,`cnic`),
  ADD UNIQUE KEY `cnic_2` (`cnic`),
  ADD UNIQUE KEY `cnic_3` (`cnic`);

--
-- Indexes for table `guardian`
--
ALTER TABLE `guardian`
  ADD KEY `sid` (`sid`),
  ADD KEY `cnic` (`cnic`);

--
-- Indexes for table `mother`
--
ALTER TABLE `mother`
  ADD UNIQUE KEY `sid` (`sid`),
  ADD UNIQUE KEY `cnic` (`cnic`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`cnic`),
  ADD UNIQUE KEY `cnic` (`cnic`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`section_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `student_section`
--
ALTER TABLE `student_section`
  ADD KEY `sid` (`sid`),
  ADD KEY `section_id` (`section_id`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `teacher_section`
--
ALTER TABLE `teacher_section`
  ADD KEY `tid` (`tid`),
  ADD KEY `section_id` (`section_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accompany_info`
--
ALTER TABLE `accompany_info`
  ADD CONSTRAINT `accompany_info_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `accompany_info_ibfk_2` FOREIGN KEY (`class`) REFERENCES `class` (`class_id`);

--
-- Constraints for table `changed`
--
ALTER TABLE `changed`
  ADD CONSTRAINT `changed_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`);

--
-- Constraints for table `class_section`
--
ALTER TABLE `class_section`
  ADD CONSTRAINT `class_section_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`),
  ADD CONSTRAINT `class_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Constraints for table `father`
--
ALTER TABLE `father`
  ADD CONSTRAINT `father_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `father_ibfk_2` FOREIGN KEY (`cnic`) REFERENCES `person` (`cnic`);

--
-- Constraints for table `guardian`
--
ALTER TABLE `guardian`
  ADD CONSTRAINT `guardian_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `guardian_ibfk_2` FOREIGN KEY (`cnic`) REFERENCES `person` (`cnic`);

--
-- Constraints for table `mother`
--
ALTER TABLE `mother`
  ADD CONSTRAINT `mother_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `mother_ibfk_2` FOREIGN KEY (`cnic`) REFERENCES `person` (`cnic`);

--
-- Constraints for table `student_section`
--
ALTER TABLE `student_section`
  ADD CONSTRAINT `student_section_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  ADD CONSTRAINT `student_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

--
-- Constraints for table `teacher_section`
--
ALTER TABLE `teacher_section`
  ADD CONSTRAINT `teacher_section_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `teacher` (`tid`),
  ADD CONSTRAINT `teacher_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
