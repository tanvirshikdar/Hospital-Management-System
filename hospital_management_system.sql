-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2024 at 04:08 PM
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
-- Database: `hospital_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admissions`
--

CREATE TABLE `admissions` (
  `admission_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admissions`
--

INSERT INTO `admissions` (`admission_id`, `patient_id`, `admission_date`, `discharge_date`, `room`) VALUES
(1, 1, '2024-05-01', '2024-05-05', '101'),
(2, 2, '2024-05-06', '2024-05-10', '102'),
(3, 3, '2024-05-11', '2024-05-15', '103');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `doctor_id`, `date`, `time`) VALUES
(1, 1, '2024-05-20', '10:00:00'),
(2, 2, '2024-05-21', '11:00:00'),
(3, 3, '2024-05-22', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `beds`
--

CREATE TABLE `beds` (
  `bed_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `availability` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `beds`
--

INSERT INTO `beds` (`bed_id`, `department_id`, `type`, `availability`) VALUES
(1, 1, 'Single', 'Available'),
(2, 2, 'Double', 'Occupied'),
(3, 3, 'ICU', 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `bill_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `doctor_bill` decimal(10,2) DEFAULT NULL,
  `test_bill` decimal(10,2) DEFAULT NULL,
  `due_amount` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`bill_id`, `patient_id`, `date`, `doctor_bill`, `test_bill`, `due_amount`, `total_amount`) VALUES
(1, 1, '2024-05-05', 200.00, 100.00, 50.00, 350.00),
(2, 2, '2024-05-10', 300.00, 200.00, 100.00, 600.00),
(3, 3, '2024-05-15', 250.00, 150.00, 75.00, 475.00);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `doctor_id`, `name`, `description`) VALUES
(1, 1, 'Cardiology', 'Heart related department'),
(2, 2, 'Neurology', 'Brain and nervous system related department'),
(3, 3, 'Pediatrics', 'Child health related department');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `specialty` varchar(100) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `degrees` varchar(200) DEFAULT NULL,
  `institutes` varchar(200) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctor_id`, `first_name`, `last_name`, `specialty`, `experience_years`, `qualification`, `degrees`, `institutes`, `contact_number`, `email`, `address`) VALUES
(1, 'John', 'Doe', 'Cardiologist', 15, 'MBBS', 'MD', 'Harvard Medical School', '1234567890', 'john.doe@example.com', '123 Main St'),
(2, 'Jane', 'Smith', 'Neurologist', 10, 'MBBS', 'PhD', 'Stanford University', '0987654321', 'jane.smith@example.com', '456 Elm St'),
(3, 'Emily', 'Jones', 'Pediatrician', 8, 'MBBS', 'MD', 'Yale University', '5556667777', 'emily.jones@example.com', '789 Oak St');

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `installment_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `amount_remaining` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `installments`
--

INSERT INTO `installments` (`installment_id`, `payment_id`, `number`, `amount_remaining`) VALUES
(1, 1, 1, 100.00),
(2, 2, 2, 200.00),
(3, 3, 3, 50.00);

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `medication_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `proper_usage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medications`
--

INSERT INTO `medications` (`medication_id`, `doctor_id`, `patient_id`, `name`, `dosage`, `proper_usage`) VALUES
(1, 1, 1, 'Aspirin', '100mg', 'Take one daily'),
(2, 2, 2, 'Ibuprofen', '200mg', 'Take two daily'),
(3, 3, 3, 'Paracetamol', '500mg', 'Take one every 4 hours');

-- --------------------------------------------------------

--
-- Table structure for table `medication_patient`
--

CREATE TABLE `medication_patient` (
  `medication_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medication_patient`
--

INSERT INTO `medication_patient` (`medication_id`, `patient_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `admission_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `doctor_id`, `admission_id`, `department_id`, `name`, `age`, `gender`, `phone_number`) VALUES
(1, 1, 1, 1, 'Alice Brown', 30, 'Female', '1112223333'),
(2, 2, 2, 2, 'Bob White', 45, 'Male', '4445556666'),
(3, 3, 3, 3, 'Charlie Green', 5, 'Male', '7778889999');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `patient_id`, `date`, `amount`) VALUES
(1, 1, '2024-05-05', 500.00),
(2, 2, '2024-05-10', 1000.00),
(3, 3, '2024-05-15', 750.00);

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `prescription_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`prescription_id`, `doctor_id`, `patient_id`, `date`, `details`) VALUES
(1, 1, 1, '2024-05-03', 'Take rest and avoid stress'),
(2, 2, 2, '2024-05-08', 'Follow a balanced diet'),
(3, 3, 3, '2024-05-13', 'Ensure regular exercise');

-- --------------------------------------------------------

--
-- Table structure for table `prescription_patient`
--

CREATE TABLE `prescription_patient` (
  `prescription_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prescription_patient`
--

INSERT INTO `prescription_patient` (`prescription_id`, `patient_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `ward_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `number_of_beds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`room_id`, `ward_id`, `type`, `number_of_beds`) VALUES
(1, 1, 'Single', 1),
(2, 2, 'Double', 2),
(3, 3, 'Suite', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `test_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `date_of_test` date DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_id`, `doctor_id`, `patient_id`, `name`, `description`, `cost`, `date_of_test`, `result`) VALUES
(1, 1, 1, 'ECG', 'Heart test', 100.00, '2024-05-02', 'Normal'),
(2, 2, 2, 'MRI', 'Brain scan', 500.00, '2024-05-07', 'Normal'),
(3, 3, 3, 'X-Ray', 'Chest scan', 200.00, '2024-05-12', 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `test_patient`
--

CREATE TABLE `test_patient` (
  `test_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `test_patient`
--

INSERT INTO `test_patient` (`test_id`, `patient_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fullname`, `birthdate`, `gender`, `created_at`) VALUES
(24, 'tanvir', '$2y$10$3EBM9zOWdlintsVGibnYheradvAmv/3Bl8C3V97ymHhphZISCVera', 'tanvir.shikdar@pm.me', 'Tanvir Shikdar', '2000-01-01', 'male', '2024-05-30 09:26:14');

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `ward_id` int(11) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `number_of_beds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`ward_id`, `department_id`, `type`, `number_of_beds`) VALUES
(1, 1, 'General', 20),
(2, 2, 'Special', 15),
(3, 3, 'ICU', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admissions`
--
ALTER TABLE `admissions`
  ADD PRIMARY KEY (`admission_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `beds`
--
ALTER TABLE `beds`
  ADD PRIMARY KEY (`bed_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`installment_id`),
  ADD KEY `payment_id` (`payment_id`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`medication_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `medication_patient`
--
ALTER TABLE `medication_patient`
  ADD PRIMARY KEY (`medication_id`,`patient_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`prescription_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `prescription_patient`
--
ALTER TABLE `prescription_patient`
  ADD PRIMARY KEY (`prescription_id`,`patient_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `ward_id` (`ward_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `test_patient`
--
ALTER TABLE `test_patient`
  ADD PRIMARY KEY (`test_id`,`patient_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`ward_id`),
  ADD KEY `department_id` (`department_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admissions`
--
ALTER TABLE `admissions`
  MODIFY `admission_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `beds`
--
ALTER TABLE `beds`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `installment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `medication_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `ward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admissions`
--
ALTER TABLE `admissions`
  ADD CONSTRAINT `admissions_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `beds`
--
ALTER TABLE `beds`
  ADD CONSTRAINT `beds_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_ibfk_1` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medications`
--
ALTER TABLE `medications`
  ADD CONSTRAINT `medications_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medications_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medication_patient`
--
ALTER TABLE `medication_patient`
  ADD CONSTRAINT `medication_patient_ibfk_1` FOREIGN KEY (`medication_id`) REFERENCES `medications` (`medication_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `medication_patient_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prescription_patient`
--
ALTER TABLE `prescription_patient`
  ADD CONSTRAINT `prescription_patient_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`prescription_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prescription_patient_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`ward_id`) REFERENCES `wards` (`ward_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tests_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_patient`
--
ALTER TABLE `test_patient`
  ADD CONSTRAINT `test_patient_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test_patient_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wards`
--
ALTER TABLE `wards`
  ADD CONSTRAINT `wards_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
