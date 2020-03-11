-- phpMyAdmin SQL Dump
-- version OVH
-- https://www.phpmyadmin.net/
--
-- Hôte : donboscoasafina.mysql.db
-- Généré le :  mer. 15 jan. 2020 à 07:49
-- Version du serveur :  5.6.43-log
-- Version de PHP :  7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `donboscoasafina`
--

-- --------------------------------------------------------

--
-- Structure de la table `charcuterie`
--

CREATE TABLE `charcuterie` (
  `id` bigint(20) NOT NULL,
  `commande` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cyber_cafe`
--

CREATE TABLE `cyber_cafe` (
  `id` bigint(20) NOT NULL,
  `commande` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(5);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

CREATE TABLE `membre` (
  `id` bigint(20) NOT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `solde` double NOT NULL,
  `telephone` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `mail`, `nom`, `pwd`, `solde`, `telephone`) VALUES
(21, 'elviskankola1@gmail.com', 'elvis', '1234', 1600, '0977756377'),
(22, 'text', 'text', '1234', 0, '1234'),
(20, 'gae@gmail.com', 'LWAMBA Gaetan', '87', 2400, '87');

-- --------------------------------------------------------

--
-- Structure de la table `oeufs`
--

CREATE TABLE `oeufs` (
  `id` bigint(20) NOT NULL,
  `commande` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `oeufs`
--

INSERT INTO `oeufs` (`id`, `commande`, `date`, `nom`, `prix`, `quantite`) VALUES
(1, 1, '122222', 'Oeuf', 3, 500);

-- --------------------------------------------------------

--
-- Structure de la table `pense`
--

CREATE TABLE `pense` (
  `id` bigint(20) NOT NULL,
  `contenue` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `pense`
--

INSERT INTO `pense` (`id`, `contenue`, `date`, `nom`) VALUES
(1, 'Juste un essai', '23-12-2019', 'fidele'),
(2, 'La pensÃ©e du jour est trop courante', '23-12-2019', 'Gaetan');

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE `photo` (
  `id` bigint(20) NOT NULL,
  `chemin` varchar(255) DEFAULT NULL,
  `foreign_key` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `poule`
--

CREATE TABLE `poule` (
  `id` bigint(20) NOT NULL,
  `commande` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `poule`
--

INSERT INTO `poule` (`id`, `commande`, `date`, `nom`, `prix`, `quantite`) VALUES
(1, 1, '12/12/2019', 'Poule', 12000, 23),
(2, 1, '12/12/2019', 'Poule sdfdfd', 2323, 23),
(3, 1, '12/12/2019', 'Eric', 12.3, 12),
(4, 1, '12/12/2019', 'Eric', 12.3, 12);

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id` bigint(20) NOT NULL,
  `commande` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `takeaway`
--

CREATE TABLE `takeaway` (
  `id` bigint(20) NOT NULL,
  `commande` int(11) NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tb_commande`
--

CREATE TABLE `tb_commande` (
  `id` bigint(20) NOT NULL,
  `datelivraison` varchar(255) DEFAULT NULL,
  `etat` tinyint(1) NOT NULL,
  `idmembre` bigint(20) NOT NULL,
  `prixtotal` double NOT NULL,
  `produit` varchar(255) DEFAULT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `tb_commande`
--

INSERT INTO `tb_commande` (`id`, `datelivraison`, `etat`, `idmembre`, `prixtotal`, `produit`, `quantite`) VALUES
(48, 'samedi 11 janvier 2020', 0, 21, 600, 'Oeuf', 12),
(49, 'dimanche 2 fÃ©vrier 2020', 0, 20, 1800, 'Poule', 9),
(50, 'mercredi 15 janvier 2020', 0, 21, 400, 'Poule', 2),
(46, 'lundi 7 septembre 2020', 0, 20, 600, 'Poule', 3),
(47, 'samedi 11 janvier 2020', 0, 21, 600, 'Oeuf', 12);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `charcuterie`
--
ALTER TABLE `charcuterie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cyber_cafe`
--
ALTER TABLE `cyber_cafe`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `oeufs`
--
ALTER TABLE `oeufs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pense`
--
ALTER TABLE `pense`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `photo`
--
ALTER TABLE `photo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `poule`
--
ALTER TABLE `poule`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `takeaway`
--
ALTER TABLE `takeaway`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tb_commande`
--
ALTER TABLE `tb_commande`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `charcuterie`
--
ALTER TABLE `charcuterie`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cyber_cafe`
--
ALTER TABLE `cyber_cafe`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `membre`
--
ALTER TABLE `membre`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `oeufs`
--
ALTER TABLE `oeufs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `pense`
--
ALTER TABLE `pense`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `photo`
--
ALTER TABLE `photo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `poule`
--
ALTER TABLE `poule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `takeaway`
--
ALTER TABLE `takeaway`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `tb_commande`
--
ALTER TABLE `tb_commande`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
