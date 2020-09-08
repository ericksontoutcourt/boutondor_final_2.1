-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: mysql-ericksonttcourt.alwaysdata.net
-- Generation Time: Sep 08, 2020 at 08:28 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ericksonttcourt_bdor`
--
CREATE DATABASE IF NOT EXISTS `ericksonttcourt_bdor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ericksonttcourt_bdor`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `login` varchar(200) NOT NULL,
  `mdp` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `login`, `mdp`, `type`) VALUES
(1, 'admin', '2a3d9b4ea4e787bc11bacb55a4575d9d4738a801', 'Administrateur');

-- --------------------------------------------------------

--
-- Table structure for table `ordinateur`
--

CREATE TABLE `ordinateur` (
  `id_ordi` int(11) NOT NULL,
  `nom_ordi` varchar(200) NOT NULL,
  `type_ordi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordinateur`
--

INSERT INTO `ordinateur` (`id_ordi`, `nom_ordi`, `type_ordi`) VALUES
(4, 'POSTES12', 'Fixe'),
(5, 'POSTEB12', 'Fixe'),
(6, 'POSTEA11', 'Portable');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id_res` int(11) NOT NULL,
  `id_util` varchar(200) NOT NULL,
  `id_ordi` varchar(200) NOT NULL,
  `date_res` date NOT NULL,
  `debuth_res` varchar(200) NOT NULL,
  `finh_res` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id_res`, `id_util`, `id_ordi`, `date_res`, `debuth_res`, `finh_res`) VALUES
(3, 'gravier', 'POSTES12', '2020-09-16', '8h50', '9h30'),
(4, 'gravier', 'POSTES12', '2020-09-10', '8h50', '9h30'),
(5, 'Thomas Grondin', 'POSTEB12', '2020-09-17', '10h50', '14h50');

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_util` int(11) NOT NULL,
  `nom_prenom_util` varchar(200) NOT NULL,
  `mail_util` varchar(200) NOT NULL,
  `date_naiss_util` date NOT NULL,
  `tel_util` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`id_util`, `nom_prenom_util`, `mail_util`, `date_naiss_util`, `tel_util`) VALUES
(5, 'gravier erickson', 'ericksongravier974@gmail.com', '2020-09-18', '0693208736'),
(6, 'Payet Kevin', 'kevin361@gmail.com', '1999-06-25', '0693254786'),
(7, 'Grondin Thomas', 'thomas@outlook.fr', '1985-06-05', '0692548756'),
(8, 'Mahon Teddy', 'Teddy@gmail.com', '1998-08-05', '0692547863');

--
-- Triggers `utilisateur`
--
DELIMITER $$
CREATE TRIGGER `delete_util` AFTER DELETE ON `utilisateur` FOR EACH ROW BEGIN INSERT INTO utilisateur_histo (id_util, nom_prenom_util, mail_util,date_naiss_util, tel_util ,date_histo_util, user_util, evenement_util) VALUES(old.id_util, old.nom_prenom_util, old.mail_util, old.date_naiss_util,old.tel_util, NOW(), CURRENT_USER, 'DELETE');END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_histo`
--

CREATE TABLE `utilisateur_histo` (
  `id_util` int(11) NOT NULL,
  `nom_prenom_util` varchar(200) NOT NULL,
  `mail_util` varchar(200) NOT NULL,
  `date_naiss_util` date NOT NULL,
  `tel_util` varchar(200) NOT NULL,
  `date_histo_util` date NOT NULL,
  `user_util` varchar(200) NOT NULL,
  `evenement_util` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilisateur_histo`
--

INSERT INTO `utilisateur_histo` (`id_util`, `nom_prenom_util`, `mail_util`, `date_naiss_util`, `tel_util`, `date_histo_util`, `user_util`, `evenement_util`) VALUES
(3, 'gravier', 'ericksongravier361@mail.com', '2020-09-17', '1662626', '2020-09-07', '213043@%', 'DELETE'),
(4, 'payet kevin', 'gravier', '2020-09-17', '0693208736', '2020-09-07', '213043@%', 'DELETE');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordinateur`
--
ALTER TABLE `ordinateur`
  ADD PRIMARY KEY (`id_ordi`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_res`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_util`);

--
-- Indexes for table `utilisateur_histo`
--
ALTER TABLE `utilisateur_histo`
  ADD PRIMARY KEY (`id_util`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ordinateur`
--
ALTER TABLE `ordinateur`
  MODIFY `id_ordi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_res` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_util` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `utilisateur_histo`
--
ALTER TABLE `utilisateur_histo`
  MODIFY `id_util` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
