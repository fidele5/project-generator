-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 12 sep. 2019 à 12:01
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `safinadb`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(70) NOT NULL,
  `telClient` varchar(12) NOT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `telClient`) VALUES
(1, 'fidele', '0974217408'),
(2, 'fidele', '0974217408'),
(3, 'fidele', '0974217408'),
(4, 'Maestro', '0974217408'),
(5, 'fidele', '0974217408'),
(6, 'fidele', '0974217408');

-- --------------------------------------------------------

--
-- Structure de la table `factures`
--

DROP TABLE IF EXISTS `factures`;
CREATE TABLE IF NOT EXISTS `factures` (
  `idFacture` int(11) NOT NULL AUTO_INCREMENT,
  `dateFacture` varchar(15) NOT NULL,
  `idReservation` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`idFacture`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `factures`
--

INSERT INTO `factures` (`idFacture`, `dateFacture`, `idReservation`, `idClient`) VALUES
(1, '10-08-2019', 1, 2),
(2, '20-08-2019', 2, 3),
(3, '11-09-2019', 3, 4),
(4, '11-09-2019', 4, 5),
(5, '12-09-2019', 5, 6);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(70) NOT NULL,
  `PostNom` varchar(70) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Adresse` varchar(15) NOT NULL,
  `Nationalite` varchar(255) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Genre` varchar(8) NOT NULL,
  `Photo` varchar(70) NOT NULL,
  `Type` varchar(70) NOT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id_membre`, `Nom`, `PostNom`, `Email`, `Adresse`, `Nationalite`, `Telephone`, `Code`, `Genre`, `Photo`, `Type`) VALUES
(1, 'fidele', 'Paluku', 'fideleplk@gmail.com', 'Lubumbashi', 'Congolaise', '0974217408', '3643525', 'Feminin', '50c42694dc74df7e3404ae73f5ac9f24.jpg', '1');

-- --------------------------------------------------------

--
-- Structure de la table `operations`
--

DROP TABLE IF EXISTS `operations`;
CREATE TABLE IF NOT EXISTS `operations` (
  `id_operation` int(11) NOT NULL AUTO_INCREMENT,
  `id_reservation` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `idSalle` int(11) NOT NULL,
  PRIMARY KEY (`id_operation`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `operations`
--

INSERT INTO `operations` (`id_operation`, `id_reservation`, `id_service`, `idSalle`) VALUES
(1, 5, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `idReservation` int(11) NOT NULL AUTO_INCREMENT,
  `idSalle` int(11) NOT NULL,
  `Projecteur` enum('0','1') NOT NULL DEFAULT '0',
  `Sonorisation` enum('0','1') NOT NULL DEFAULT '0',
  `Decoration` enum('0','1') NOT NULL DEFAULT '0',
  `Pausecafe` enum('0','1') NOT NULL DEFAULT '0',
  `CockTail` enum('0','1') NOT NULL DEFAULT '0',
  `Evenement` text NOT NULL,
  `personnes` int(11) NOT NULL,
  `date_debut` varchar(12) NOT NULL,
  `date_fin` varchar(12) NOT NULL,
  PRIMARY KEY (`idReservation`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`idReservation`, `idSalle`, `Projecteur`, `Sonorisation`, `Decoration`, `Pausecafe`, `CockTail`, `Evenement`, `personnes`, `date_debut`, `date_fin`) VALUES
(1, 2, '1', '1', '0', '1', '1', 'fete inutile', 52, '2019-12-01', '10-08-2019'),
(2, 1, '1', '1', '0', '1', '1', 'fete inutile', 50, '20-08-2019', '20-08-2019'),
(3, 1, '1', '1', '0', '0', '1', 'fete inutile', 45, '2019-09-19', '2019-09-12'),
(4, 1, '1', '1', '1', '1', '1', 'fete inutile', 54, '11-09-2019', '2019-09-12'),
(5, 1, '0', '1', '0', '0', '0', 'fete des enfants', 42, '12-09-2019', '2019-09-13');

-- --------------------------------------------------------

--
-- Structure de la table `salles`
--

DROP TABLE IF EXISTS `salles`;
CREATE TABLE IF NOT EXISTS `salles` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `salles`
--

INSERT INTO `salles` (`idSalle`, `designation`, `prix`) VALUES
(1, 'Saint Vincent de salles', 250),
(2, 'Maria Asunta', 100);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(250) NOT NULL,
  `prix` int(11) NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id_service`, `designation`, `prix`) VALUES
(1, 'cocktail', 5);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
