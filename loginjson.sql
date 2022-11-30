-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mer 30 Novembre 2022 à 07:38
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `loginjson`
--

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `Login` varchar(16) NOT NULL,
  `Passwd` varchar(16) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Genre` set('Homme','Femme') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`ID`, `Login`, `Passwd`, `Email`, `Genre`) VALUES
(13, 'ryan', '1234', 'ryandre@gmail.com', 'Homme'),
(14, 'Arthur', '1234', 'Arthur@gmail.com', 'Homme'),
(15, 'a@gmail.com', '1234', 'a@gmail.com', 'Homme'),
(16, 'azaz', '1234', 'a@gmail.com', 'Femme'),
(17, 'ryann', '1234', 'ryann@gmail.cm', 'Femme');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
