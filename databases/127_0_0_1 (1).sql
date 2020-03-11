-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 15 nov. 2019 à 17:43
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `deal_man`
--
-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `id_utilisateur` int(11) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id_admin`, `id_utilisateur`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

DROP TABLE IF EXISTS `boutique`;
CREATE TABLE IF NOT EXISTS `boutique` (
  `id_boutique` int(11) NOT NULL AUTO_INCREMENT,
  `nom_boutique` varchar(70) NOT NULL,
  `id_vendeur` int(11) NOT NULL,
  `date_creation` varchar(20) NOT NULL,
  PRIMARY KEY (`id_boutique`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `boutique`
--

INSERT INTO `boutique` (`id_boutique`, `nom_boutique`, `id_vendeur`, `date_creation`) VALUES
(1, 'MyShop', 5, '30-10-2019 09:25:58'),
(2, 'E-Shop', 3, '30-10-2019 9:10:3');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idcmd` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) DEFAULT NULL,
  `idutilisateur` int(11) DEFAULT NULL,
  `datecmd` varchar(60) DEFAULT NULL,
  `qtecmd` int(11) DEFAULT NULL,
  `etat` enum('0','1') NOT NULL DEFAULT '0',
  `Livraison` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcmd`),
  KEY `idprod_idx` (`idprod`),
  KEY `idutilisateur_idx` (`idutilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcmd`, `idprod`, `idutilisateur`, `datecmd`, `qtecmd`, `etat`, `Livraison`) VALUES
(6, 4, 2, '21/10/2019 04:18:19', 8, '1', '1'),
(8, 1, 2, '23/10/2019 08:14:31', 2, '0', '0'),
(12, 16, 3, '29/10/2019 01:39:26', 10, '1', '1'),
(20, 16, 3, '05/11/2019 11:41:27', 2, '1', '1'),
(24, 4, 5, '06/11/2019 04:04:52', 2, '0', '0'),
(25, 2, 3, '09/11/2019 09:45:51', 2, '0', '0');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `idprod` int(11) NOT NULL AUTO_INCREMENT,
  `nomprod` varchar(500) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `qtestock` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `devise` varchar(3) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `capture` varchar(45) DEFAULT NULL,
  `id_vendeur` int(11) NOT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`idprod`, `nomprod`, `prix`, `qtestock`, `description`, `categorie`, `devise`, `couleur`, `capture`, `id_vendeur`) VALUES
(1, 'TÃ©lÃ©phone', 100, 10, 'TÃ©lÃ©phone de trÃ¨s bonne qualitÃ©', 'Habillement', 'USD', NULL, '2019-30-09-44.jpg', 0),
(2, 'blanche', 20, 5, 'Chaussure de trÃ¨s bonne qualitÃ©', 'Habillement', 'USD', NULL, '2019-30-09-36.jpg', 0),
(4, 'Sac a main', 20, 10, 'Sac a main de bonne qualite', 'Habillement', 'USD', 'noir', '2019-15-10-43.jpg', 0),
(15, 'Chaussure', 20, 5, 'Chaussure', 'Habillement', 'USD', 'blanche', '2019-29-10-09.jpg', 3),
(16, 'TÃ©lÃ©phone', 100, 60, 'TÃ©lÃ©phone', 'Informatiques', 'USD', 'blanche', '2019-29-10-51.jpg', 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idutilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `adresse` varchar(60) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `type` char(2) NOT NULL,
  `Avatar` varchar(70) NOT NULL,
  PRIMARY KEY (`idutilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idutilisateur`, `username`, `adresse`, `email`, `password`, `type`, `Avatar`) VALUES
(1, 'Given2018', 'commune annexes', 'munungakawika@gmail.com', 'Given2018', '', 'â€ª+243 851 067 447â€¬ 20180919_205055.jpg'),
(2, 'Given2018', 'commune annexes', '16mk292@esisalama.org', 'Dieudo123', 'A', 'user.png'),
(3, 'MUNUNGA', 'commune annexes', 'munungakawika@yahoo.com', 'Deal123', 'V', 'IMG_20180826_135609.jpg'),
(5, 'Dieudonne', 'commune annexes', 'Given2018@gmail.com', '123@PLK', 'V', 'user.png');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `idprod` FOREIGN KEY (`idprod`) REFERENCES `produits` (`idprod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idutilisateur` FOREIGN KEY (`idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de données :  `easy-book`
--
CREATE DATABASE IF NOT EXISTS `easy-book` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `easy-book`;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `propri` int(11) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`propri`, `name`) VALUES
(1, 'Intélligence Artificielle'),
(2, 'Programmation web'),
(3, 'Programmation Mobile'),
(3, 'Management'),
(4, 'Developpement Desktop'),
(5, 'Programmation orientée objet');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contenu` varchar(1200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id`, `name`, `phone`, `email`, `contenu`) VALUES
(1, 'Dieudonne', '0851067447', 'dieudo@gmail.com', 'hello world'),
(4, 'merveille', '0993211020', 'merveille@gmail.com', 'salut Dieudonne'),
(5, 'merveille', '0993211020', 'merveille@gmail.com', 'salut Dieudonne'),
(6, 'merveille', '0993211020', 'merveille@gmail.com', 'salut Dieudonne'),
(7, 'merveille', '0993211020', 'merveille@gmail.com', 'salut Dieudonne');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(25) NOT NULL,
  `mdp` varchar(8) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_connect` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id`, `pseudo`, `mdp`, `email`, `date_connect`) VALUES
(1, 'Given', 'Given201', 'munungakawika@gmail.com', '2019-05-17 10:42:05'),
(2, 'Caleb', 'caleb', 'caleb@gmail.com', '2019-05-25 18:29:54'),
(3, 'Given2018', 'Given201', 'mkd@gmail.com', '2019-05-27 18:24:46');

-- --------------------------------------------------------

--
-- Structure de la table `postsujet`
--

DROP TABLE IF EXISTS `postsujet`;
CREATE TABLE IF NOT EXISTS `postsujet` (
  `propri` int(11) NOT NULL,
  `contenu` varchar(3500) NOT NULL,
  `date` date NOT NULL,
  `sujet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `postsujet`
--

INSERT INTO `postsujet` (`propri`, `contenu`, `date`, `sujet`) VALUES
(1, 'c\'est un algorithme d\'apprentissage', '2019-05-25', 0),
(2, 'c\'est un technique d\'apprentissage machine\r\n', '2019-05-25', 0);

-- --------------------------------------------------------

--
-- Structure de la table `sujets`
--

DROP TABLE IF EXISTS `sujets`;
CREATE TABLE IF NOT EXISTS `sujets` (
  `name` varchar(500) NOT NULL,
  `categorie` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sujets`
--

INSERT INTO `sujets` (`name`, `categorie`) VALUES
('C\'est quoi les machines learning ?', 'Intelligence Artificielle');
--
-- Base de données :  `eazip`
--
CREATE DATABASE IF NOT EXISTS `eazip` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eazip`;

-- --------------------------------------------------------

--
-- Structure de la table `codeqr`
--

DROP TABLE IF EXISTS `codeqr`;
CREATE TABLE IF NOT EXISTS `codeqr` (
  `idqr` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) NOT NULL,
  `codeQr` varchar(255) NOT NULL,
  PRIMARY KEY (`idqr`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idcommande` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) NOT NULL,
  `nomClient` varchar(255) NOT NULL,
  `prenomClient` varchar(255) NOT NULL,
  `emailClient` varchar(255) NOT NULL,
  `telClient` varchar(25) NOT NULL,
  `adresseClient` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `token` varchar(255) NOT NULL,
  `codeQrCommande` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcommande`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcommande`, `idprod`, `nomClient`, `prenomClient`, `emailClient`, `telClient`, `adresseClient`, `status`, `date`, `token`, `codeQrCommande`) VALUES
(1, 2, 'Mwamba', 'Merdi', 'merdi@gmail.com', '0820833233', 'Q/KASAPA\r\nC/ANNEXE', 0, '2018-05-19 09:11:44', '', ''),
(2, 1, 'gloria', 'mmm', 'glo@s.com', '444444', 'bjhhbh', 0, '2018-05-19 13:13:54', '', ''),
(3, 1, 'Gloire', 'Lui', 'pa@j.com', '5645454', 'Q Kasapa C Annexxe', 0, '2018-05-19 13:39:18', '', ''),
(4, 1, 'gloria', 'popo', 'pas@gmail.com', '236565', 'kakakakakak', 0, '2018-05-19 16:00:18', 'vIA0KwJN9UiB', NULL),
(5, 1, 'gloria', 'popo', 'pas@gmail.com', '236565', 'kakakakakak', 0, '2018-05-19 16:03:07', 'TAEZujCyWLUN', NULL),
(6, 1, 'gloria', 'popo', 'pas@gmail.com', '236565', 'kakakakakak', 0, '2018-05-19 16:05:49', 'mPECCqYyN6lI', NULL),
(7, 1, 'gloria', 'popo', 'pas@gmail.com', '236565', 'kakakakakak', 0, '2018-05-19 16:08:51', 'U1qmHyGXxm08', NULL),
(8, 1, 'gloria', 'popo', 'pas@gmail.com', '236565', 'kakakakakak', 0, '2018-05-19 16:10:49', 'EoVfLtmk0MFR', NULL),
(9, 3, 'koko', 'kitoyo', 'kito@gmail.com', '1254', 'papaooid  dkqjsdk qdjsqk qosjd qodjqsk', 0, '2018-05-19 16:13:31', '0Yf8s8pbnlun', NULL),
(10, 3, 'koko', 'kitoyo', 'kito@gmail.com', '1254', 'papaooid  dkqjsdk qdjsqk qosjd qodjqsk', 0, '2018-05-19 17:04:15', 'DhGQOzUdLCXu', NULL),
(11, 3, 'koko', 'kitoyo', 'kito@gmail.com', '1254', 'papaooid  dkqjsdk qdjsqk qosjd qodjqsk', 0, '2018-05-19 17:10:32', 'AnxbCyciIjdm', NULL),
(12, 3, 'koko', 'kitoyo', 'kito@gmail.com', '1254', 'papaooid  dkqjsdk qdjsqk qosjd qodjqsk', 0, '2018-05-19 17:11:29', 'vBDe3w7g85Wg', NULL),
(13, 3, 'koko', 'kitoyo', 'kito@gmail.com', '1254', 'papaooid  dkqjsdk qdjsqk qosjd qodjqsk', 0, '2018-05-19 17:13:57', '0A02aLEYNAUb', NULL),
(14, 1, 'koko', 'kitoyo', 'pao@4gmail.com', '454545', 'jdksjhdsjx', 0, '2018-05-19 17:33:02', 'hhQPGEIGIwXn', NULL),
(15, 5, 'Mwamba', 'Pascal', 'pas@gmail.com', '0820833233', 'Q/KIMBEBMBE', 0, '2018-05-19 18:18:17', 'UAc45mVhl5gl', NULL),
(16, 3, 'Gloire', 'kitoyo', 'io@j.com', '458', 'Q/Kasapa', 0, '2018-05-19 20:23:27', 'wZozI9XXZHDn', NULL),
(17, 3, 'Gloire', 'kitoyo', 'io@j.com', '458', 'Q/Kasapa', 0, '2018-05-19 20:26:54', 'iaZ3C9oA0YeW', NULL),
(18, 5, 'bebe', 'piple', 'piple@gmail.com', '022222222225', 'kauyjnrgvnnjuiykjtjyhfbg', 0, '2018-05-19 21:08:46', 'ZuKuunXhRJWi', NULL),
(19, 2, 'comgfgfgfgfq', 'rfrsr', 'ytygg@j.com', '4848484', 'ttytytyty', 0, '2018-05-19 21:54:30', '3x2vcwJNXBUh', NULL),
(20, 5, 'Gloire', 'Toto', 'toto@gm.com', '026464645', 'Q KAsapa c/Annexe', 0, '2018-05-22 10:23:14', 'yCVapAh06vyP', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `distributeur`
--

DROP TABLE IF EXISTS `distributeur`;
CREATE TABLE IF NOT EXISTS `distributeur` (
  `id_distr` int(11) NOT NULL AUTO_INCREMENT,
  `nom_distr` varchar(255) NOT NULL,
  `email_distr` varchar(255) NOT NULL,
  `adresse` text NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_distr`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idprod` int(11) NOT NULL AUTO_INCREMENT,
  `nomprod` varchar(255) NOT NULL,
  `prix` int(11) NOT NULL,
  `devise` varchar(10) NOT NULL,
  `qtestock` int(11) NOT NULL,
  `capture` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `echeance` varchar(30) NOT NULL,
  `codeQr` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idprod`, `nomprod`, `prix`, `devise`, `qtestock`, `capture`, `description`, `echeance`, `codeQr`) VALUES
(1, 'jkj', 56, 'CDF', 2, '5.jpg', 'ssjjdjddddddd', '2', NULL),
(2, 'titre 2', 20, 'USD', 23, '2018-19-05-16.jpg', 'mdmdm', '2', NULL),
(3, 'lampe ya bien', 3500, 'CDF', 45, '2018-19-05-04.jpg', 'Une grande capacitÃ©, conserve l\'Ã©bergie pendant 3 semaines max, Ã  moins cher.', '6 jours', NULL),
(4, 'lampe de table', 2500, 'CDF', 5, '2018-19-05-53.jpg', 'C\'est une lampe facile Ã  manipuler et Ã  dÃ©placer. ', '2 semaines ', NULL),
(5, 'lampe Ã  main', 3000, 'CDF', 5, '2018-19-05-54.jpg', 'Lampe a main  chargeable pendant 4h  sous le soleil et qui a une durÃ©e de 24h et qui facilite le deplacement la nuit Ã©tant donnÃ©  qu\'elle est dotÃ©e d\'une manche. ', '3 jours', NULL),
(6, 'lamape ', 50, 'USD', 250, '', 'NouveautÃ© de lampe solaire, avec une capacitÃ© de conserver l\'Ã©nergie pendant plus de 3 jours 24h/24h.\r\nVous avez la possibilitÃ© de le charger. lors de l\'achat on vous remet le kit complet composÃ© des diifferents composants qui vous permettrons de bien conserver votre lampe.\r\n\r\nC\'est la qualitÃ©\r\n', '2 semaine', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(30) NOT NULL DEFAULT 'distributeur',
  `phone` varchar(25) NOT NULL DEFAULT '0820833233',
  `adressAdmin` varchar(255) NOT NULL DEFAULT 'adresse',
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `reset_token` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `phone`, `adressAdmin`, `confirmation_token`, `confirmed_at`, `reset_token`, `reset_at`, `remember_token`) VALUES
(5, 'Paque', 'admin@giptech.org', '$2y$10$a/oPMtjyC8xw0sArI/ilHOUP544MiYCY8HXqQgMOt5ZQMZNBjg4jG', 'admin', '0820833233', 'adresse', NULL, '2018-04-09 10:46:45', 'UESChOmM0axGXfBgG8LHfsLF5Hph4582GCv6UGjX1nUlKdrZ1VkDZtKvzrTa', '2018-05-18 17:52:44', 'b38L5zwVuvKn8HfxkQJ7ykgEMj0jXljTcSeMdv3ShXAyijsA6GEF24GHa0VAFeEaKVWYxvKO6OLSi6UyV3kthx2kPmffbK9ipyCX1VhLFjaEf3qPd84GzWoNrQkYzmrirNGYUqfNcwHXGQHczmUHEgCCPMHlvDIJFEFi2A1RVLyHMjIqBj4P0ncrOxRVsgZfNThBekxkPRAz79sXGPTtGpNQ7xBQ6WEj9cMO9B9apCOGBoywESX6cIVr15'),
(14, 'jean', 'jean@gmail.com', '$2y$10$B3SJN0v0NQ8avJOImjCQuOVs8KpBBUqumgJHJa4hOwWRdqyLYFR3S', 'distributeur', '0820833233', 'adresse', '2JhtSbTjmuPeD5ElPY7KwTjQndQbtvXNKwTwJvUXvwQblba81LuyJp874PhY', NULL, NULL, NULL, NULL),
(15, 'paul', 'paul@gmail.com', '$2y$10$rWYvRB0m2IHaSgG3ln3uTeybcqBPKCf/h8QrANF/Ks06FAIrxfzF2', 'distributeur', '0820833233', 'adresse', '3GNK0YbuYtoZGqkRe7dHUKDdyxIilnepvmKsvvzFvxS2ERCgCkjXglPAZQ3D', NULL, NULL, NULL, NULL),
(16, 'glory', 'glo6@gmail.com', '$2y$10$NGKATfpLUUetRKGxyjlVRe23I01i20WhPbJKVe98AcJsZmxohxQo.', 'distributeur', '0820833233', 'adresse', '8f8H1hcQCSJ1bQVbvAi9AjI3oRFuCaioLZgXsuRhkjK6ssLRSSZ4R7R79d4B', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE IF NOT EXISTS `vente` (
  `id_vente` int(11) NOT NULL AUTO_INCREMENT,
  `idcom` int(11) NOT NULL,
  `montantTotal` int(11) NOT NULL,
  `montantPayer` int(11) NOT NULL,
  `montantRestant` int(11) NOT NULL,
  `id_distr` int(11) NOT NULL,
  PRIMARY KEY (`id_vente`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id_vente`, `idcom`, `montantTotal`, `montantPayer`, `montantRestant`, `id_distr`) VALUES
(1, 1, 2500, 1000, 1500, 14);
--
-- Base de données :  `magstore`
--
CREATE DATABASE IF NOT EXISTS `magstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `magstore`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `prix_unitaire` decimal(10,0) NOT NULL,
  `qte_stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `postnom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `telephone` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `detail_facture`
--

DROP TABLE IF EXISTS `detail_facture`;
CREATE TABLE IF NOT EXISTS `detail_facture` (
  `id_facture` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `qte_article` int(11) NOT NULL,
  KEY `FK_detail_facture_article_id` (`id_article`),
  KEY `FK_detail_facture_facture_id` (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_facture` varchar(255) NOT NULL,
  `id_client` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_facture_client_id` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `postnom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `adresse` varchar(20) NOT NULL,
  `type` enum('gestionnaire','admin','client','caissier') NOT NULL,
  `genre` enum('M','F') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `pwd`, `nom`, `postnom`, `prenom`, `adresse`, `type`, `genre`) VALUES
(1, 'pat22@gmail.com', '1234', 'KASONGO', 'ILUNGA', 'PATRICK', 'LUBUMBASHI', 'admin', 'M'),
(2, 'alain12@gmail.com', '1234', 'KAZADI', 'KABONGO', 'ALAIN', 'LIKASI', 'gestionnaire', 'M'),
(3, 'junio2010@gmail.com', '1234', 'JUNIOR', 'NKASHAMA', 'JUNIOR', 'LUBUMBASHI', 'caissier', 'M');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `detail_facture`
--
ALTER TABLE `detail_facture`
  ADD CONSTRAINT `FK_detail_facture_article_id` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `FK_detail_facture_facture_id` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `FK_facture_client_id` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);
--
-- Base de données :  `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `mydb`;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idcmd` int(11) NOT NULL AUTO_INCREMENT,
  `idprod` int(11) DEFAULT NULL,
  `idutilisateur` int(11) DEFAULT NULL,
  `datecmd` date DEFAULT NULL,
  `qtecmd` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcmd`),
  KEY `idprod_idx` (`idprod`),
  KEY `idutilisateur_idx` (`idutilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idprod` int(11) NOT NULL AUTO_INCREMENT,
  `nomprod` varchar(500) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `qtestock` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `categorie` varchar(50) DEFAULT NULL,
  `couleur` varchar(45) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idprod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `idutilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(500) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pwd` varchar(45) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idutilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `idprod` FOREIGN KEY (`idprod`) REFERENCES `produit` (`idprod`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `idutilisateur` FOREIGN KEY (`idutilisateur`) REFERENCES `utilisateur` (`idutilisateur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Base de données :  `sas`
--
CREATE DATABASE IF NOT EXISTS `sas` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sas`;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(160) NOT NULL,
  `promotion` varchar(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `motif` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`id`, `nom`, `promotion`, `montant`, `motif`) VALUES
(1, 'MUNUNGA KAWIKA Dieudonne', 'L3 MSI', 350, '1er tranche'),
(2, 'MUNUNGA KAWIKA Dieudonne', 'L3 MSI', 7, '1er tranche');
--
-- Base de données :  `todo_app`
--
CREATE DATABASE IF NOT EXISTS `todo_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `todo_app`;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

DROP TABLE IF EXISTS `tache`;
CREATE TABLE IF NOT EXISTS `tache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `description` text NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `datecreation` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_tache_user_idx` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tache`
--

INSERT INTO `tache` (`id`, `id_user`, `description`, `etat`, `datecreation`) VALUES
(1, 2, 'Ma premiere tache conciste à faire certaines chose, au fait je voulais juste faire en sorte que la tache que je vais soit une tache qui va consisté à realiserune tache precise.', 1, '2019-03-25 22:39:08'),
(2, 2, 'Ma deuxieme tache conciste juste à savoir si une tache est vraiment blablablablablablablaaaaaaaaaa!!!!!', 1, '2019-03-25 22:40:02'),
(3, 2, 'Ma deuxieme tache conciste juste à savoir si une tache est vraiment blablablablablablablaaaaaaaaaa!!!!!', 1, '2019-03-25 22:40:25'),
(4, 1, 'oui je cree', 0, '2019-03-25 23:19:04'),
(5, 2, 'Demain à 14heure j\'aurais rendez-vous Felix le premier consommateur de tshibelu belu connu au congo et partout dans le monde pour ses qualités', 1, '2019-03-26 01:48:40'),
(7, 2, 'creer moi  cette tache aujourd\'hui, rendez-vous avec lui...', 1, '2019-03-26 01:51:05'),
(8, 2, 'blooabloakoqkqofkqo', 1, '2019-03-27 07:30:05'),
(10, 2, '                                                        je t\'ai modifié avec succes mon gard heeeeeeeeeeeeeeeeeeeiiiiiiiiiiiiiiiiiiiiiiiiiiiiii,nnnnnnnn         merci à toi                                            ', 1, '2019-03-27 10:40:17'),
(11, 2, 'katkokombeeeeeeeee', 1, '2019-03-27 10:39:44'),
(12, 2, 'code is like', 0, '2019-09-30 08:02:34');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `pseudo_UNIQUE` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `pseudo`, `mdp`) VALUES
(1, 'paquemwamba', 'adminadmin'),
(2, 'adminadmin', '123456789');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tache`
--
ALTER TABLE `tache`
  ADD CONSTRAINT `fk_tache_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
