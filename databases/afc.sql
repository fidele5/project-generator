-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 05 sep. 2019 à 10:43
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
-- Base de données :  `afc`
--

-- --------------------------------------------------------

--
-- Structure de la table `actualite`
--

DROP TABLE IF EXISTS `actualite`;
CREATE TABLE IF NOT EXISTS `actualite` (
  `idActualite` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `Contenu` text NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `date_post` varchar(15) NOT NULL,
  `idCommunaute` int(11) NOT NULL,
  PRIMARY KEY (`idActualite`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `actualite`
--

INSERT INTO `actualite` (`idActualite`, `titre`, `Contenu`, `idCategorie`, `date_post`, `idCommunaute`) VALUES
(1, 'Les actualites de la semaine', '<p>At vero eos et accusamus et iusto odio dignissimos ducimus qui praesentium voluptatum deleniti atque\r\n            corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique\r\n            sunt in culpa nemo enim ipsam voluptatem quia voluptas sit qui officia deserunt mollitia animi, id\r\n            est laborum et dolorum fuga quidem rerum facilis est distinctio.\r\n        </p>\r\n        <p>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod\r\n            maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Quis autem vel\r\n            eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur. Temporibus\r\n            autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates\r\n            repudiandae sint et molestiae non recusandae itaque earum rerum.</p>', 2, '1567670847', 1),
(2, 'Anniversaire', 'Nous annoncons anniversaire de fidele plk qui se tiendra ce 30 septembre 2019 pour ce, il vous est demande de lui apporter des beaux cadeaux meme si c est le cadet de ses soucis.', 4, '1567570947', 1),
(3, 'Retraite', 'Organisation de la retraite spirituelle a Likasi avec comme theme <em>Aujourd hui montons sur la montagne</em> a l\'intention de tous les jeunes de la chapelle de Salama.', 3, '1567671947', 1),
(5, 'mon aventure', 'Je crois en Dieu le PÃ¨re tout puissant,<div>crÃ©ateur du ciel et de la terre,</div><div>Et en JÃ©sus Christ son fils unique notre Seigneur,</div><div>Qui a Ã©tÃ© conÃ§u du Saint Esprit</div>', 4, '1567660947', 1),
(6, 'l\'avenir de la jeunesse', 'Tous les jeunes ont tendance Ã  viser la lune or, <i>viser la lune revient Ã  viser l\'impossible!</i>&nbsp;c\'est pourquoi moi, Aujourd\'hui je m\'auto proclame <b>l\'El maestro del mundo</b><div>Enfin la tendance n\'est pas du tout mauvaise car elle reflete la reflection qui est reflet d\'un reve pour un meilleur avenir</div><div><b><i>Fidele Plk</i></b></div>', 4, '1567670947', 1),
(7, 'mon aventure', 'Ces beaux paysages me rappellent de vieux et bons souvenirs', 4, '1567670957', 1),
(8, 'monster', '<div style=\"text-align: left;\">tour<i>&nbsp;ijklm<b>hghhk<u>souk</u></b></i></div>', 4, '1567650947', 1),
(9, 'la technique de visionnage ', 'c\'est vraiment tragique de voir tout ce qui se passe dans cette vie&nbsp;', 4, '1567670946', 1),
(10, 'jadis', 'les captures de code debian', 4, '1567672947', 1),
(11, 'mon aventure', 'c\'es pas cool', 4, '1567670947', 1);

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idMembre` int(11) NOT NULL,
  `mdp` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`id`, `idMembre`, `mdp`) VALUES
(1, 1, '188085296@Plk'),
(2, 2, '188085296@LG');

-- --------------------------------------------------------

--
-- Structure de la table `avatars`
--

DROP TABLE IF EXISTS `avatars`;
CREATE TABLE IF NOT EXISTS `avatars` (
  `idAvatar` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `id_membre` int(11) NOT NULL,
  `date_post` varchar(15) NOT NULL,
  PRIMARY KEY (`idAvatar`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `avatars`
--

INSERT INTO `avatars` (`idAvatar`, `titre`, `id_membre`, `date_post`) VALUES
(1, 'maestro.png', 1, '05-09-2019'),
(2, 'images (2).jpeg', 2, '03-09-2019'),
(3, 'gloi.jpg', 3, '03-09-2019'),
(4, 'lÃ©a.jpg', 4, '03-09-2019'),
(5, 'images (4).jpeg', 5, '03-09-2019'),
(6, 'picture.jpg', 6, '03-09-2019'),
(7, 'IMG-20180914-WA0004.jpg', 7, '03-09-2019'),
(8, 'fideleground.jpg', 8, '05-09-2019');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NomCat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `NomCat`) VALUES
(1, 'Culture'),
(2, 'Education'),
(3, 'Spiritualite'),
(4, 'Divers');

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `idCommentaire` int(11) NOT NULL AUTO_INCREMENT,
  `idPublication` int(11) NOT NULL,
  `Contenu` text NOT NULL,
  `Etat` enum('1','2') NOT NULL,
  `datePost` varchar(15) NOT NULL,
  `id_posteur` int(11) NOT NULL,
  PRIMARY KEY (`idCommentaire`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commentaires`
--

INSERT INTO `commentaires` (`idCommentaire`, `idPublication`, `Contenu`, `Etat`, `datePost`, `id_posteur`) VALUES
(1, 2, 'Je vois que tout fonctionne comme prévu...', '1', '1566205742', 0),
(2, 2, 'commenter', '1', '1566205742', 1),
(3, 2, 'ca marche', '1', '1566205915', 1),
(4, 1, 'ca me parait interressant', '1', '1566207378', 1),
(5, 1, 'voi la ca commence Ã  fonctionner', '1', '1566207409', 1),
(6, 1, 'ca commence Ã  bien faire', '1', '1566207691', 1),
(7, 2, 'wow\r\nca marche', '1', '1566207884', 1),
(8, 2, 'tu auras tes cadeaux', '1', '1566231894', 1),
(9, 2, 'je commente', '1', '1566374372', 1),
(10, 1, 'autre', '1', '1566374469', 1),
(11, 2, 'je connais ca !', '1', '1566387028', 1),
(12, 2, 'je vois ce que vous voulez faire', '1', '1566387167', 2),
(13, 1, 'Amen', '1', '1566387377', 2),
(14, 2, 'c\'est bon\r\n', '1', '1566388437', 2),
(15, 2, 'dÃ©peche', '1', '1566388452', 2),
(16, 2, 'ca vient\r\n', '1', '1566388465', 2),
(17, 2, 'oups', '1', '1566388476', 2),
(18, 2, 'je ne comprends pas ce qui se passe ici Ã  la fin', '1', '1566393280', 2),
(19, 1, 'je suis ravis de faire votre connaissance', '1', '1566752394', 4),
(20, 1, 'bienvenu tres cher bruno', '1', '1566752744', 2),
(21, 6, 'n\'importe quoi', '1', '1566914137', 4),
(22, 6, 'Ce n\'est pas du tout ce que je croyais', '1', '1567098085', 5),
(23, 7, 'effectivement c\'est un beau paysage', '1', '1567223125', 1),
(24, 7, 'je commente', '1', '1567237900', 1),
(25, 5, 'ce n\'est pas votre aventure mais le credo\r\n', '1', '1567445216', 1),
(26, 8, 'c\'est vraiment tragique', '1', '1567502648', 1),
(27, 9, 'comment ca .', '1', '1567522282', 3),
(28, 8, 'je suis bien d\'accord', '1', '1567522314', 3),
(29, 2, 'c\'est deja bon', '1', '1567522766', 3),
(30, 9, 'c\'est tres comprÃ©hensive', '1', '1567523239', 5),
(31, 9, 'visionnage!!! danger!', '1', '1567613257', 7),
(32, 9, 'echec et mat', '1', '1567670787', 1),
(33, 11, 'je vois que la fonction des dates fonctionne tres bien\r\n', '1', '1567671552', 1);

-- --------------------------------------------------------

--
-- Structure de la table `communaute`
--

DROP TABLE IF EXISTS `communaute`;
CREATE TABLE IF NOT EXISTS `communaute` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Denomination` varchar(50) NOT NULL,
  `Adresse` varchar(150) NOT NULL,
  `Mission` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `communaute`
--

INSERT INTO `communaute` (`ID`, `Denomination`, `Adresse`, `Mission`) VALUES
(1, 'Salama', 'Av. Femmes congolaises N 5 B.P.  2846/Lubumbashi', 'La communaute salesienne de salama se trouve sur l\'Av. Femmes congolaises N 5 B.P.  2846/Lubumbashi. Elle a a son sein une Ã©cole technique, une Ã©cole supÃ©rieure  d\'informatique, des ateliers, une chapelle publique, une maison de formation chrÃ©tienne et culturelle et un oratoire'),
(2, 'Cite des jeunes', 'Lubumbashi B.P. 4852, au N 1 Av. des sports, C/ Kampemba, N 47', 'La Communaute salesienne de la cite des jeunes  est situee dans la ville de Lubumbashi B.P. 4852, au N 1 Av. des sports, C/ Kampemba, N 47. Cette communaute a un centre de formation professionnelle dans differents domaines : soudure, menuiserie, tournage, mecanique auto et agriculture. '),
(3, 'Ngangi', 'avenue Ngangi II, Loc. Karisimbi,  B.P. 154/Goma', 'La communaute salÃ©sienne de Goma-Ngangi se situe dans la ville de GOMA sur l\'avenue Ngangi II, Loc. Karisimbi,  B.P. 154/Goma.  Elle est constituÃ©e d une 	Ã©cole primaire et secondaire, d\'un centre professionnel, d\'une chapelle publique, 		quelques ateliers et une ferme agricole Shasha et Nyangoma'),
(4, 'Sakania', 'Sakania', 'La communautÃ© salÃ©sienne de salama se trouve sur lâ€™Av. Femmes congolaises   		NÂ° 5 B.P.  2846/Lubumbashi. Elle a Ã  son sein une Ã©cole technique, une Ã©cole supÃ©rieure  		dâ€™informatique, des ateliers, une chapelle publique,  		une maison de formation chrÃ©tienne et culturelle et un oratoire.'),
(5, 'Imara', 'Lubumbashi, Q salama', 'La CommunautÃ© salÃ©sienne dâ€™Imara  est situÃ©e au centre de ville de Lubumbashi et  		regorge Ã  son sein une Ã©cole primaire,  		une Ã©cole secondaire, une Ã©cole supÃ©rieure de lâ€™Ã©conomie, une chapelle et une radio. '),
(6, 'Imara', 'Lubumbashi, Q salama', 'ecoles');

-- --------------------------------------------------------

--
-- Structure de la table `connected`
--

DROP TABLE IF EXISTS `connected`;
CREATE TABLE IF NOT EXISTS `connected` (
  `connectes_id` int(11) NOT NULL,
  `connectes_ip` varchar(16) NOT NULL,
  `connectes_membre` varchar(16) NOT NULL,
  `connectes_actualisation` int(11) NOT NULL,
  UNIQUE KEY `membre_id` (`connectes_id`,`connectes_membre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `connected`
--

INSERT INTO `connected` (`connectes_id`, `connectes_ip`, `connectes_membre`, `connectes_actualisation`) VALUES
(1, '::1', '1', 1567679676);

-- --------------------------------------------------------

--
-- Structure de la table `connectes`
--

DROP TABLE IF EXISTS `connectes`;
CREATE TABLE IF NOT EXISTS `connectes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `duree` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `connectes`
--

INSERT INTO `connectes` (`id`, `ip`, `duree`) VALUES
(3, '::1', 1567679601);

-- --------------------------------------------------------

--
-- Structure de la table `externes`
--

DROP TABLE IF EXISTS `externes`;
CREATE TABLE IF NOT EXISTS `externes` (
  `membre_id` int(11) NOT NULL AUTO_INCREMENT,
  `membre_pseudo` varchar(70) NOT NULL,
  `membre_tel` varchar(12) NOT NULL,
  `membre_mdp` varchar(20) NOT NULL,
  `date_inscrit` varchar(15) NOT NULL,
  `membre_banni` enum('0','1') NOT NULL DEFAULT '0',
  `membre_visite` varchar(20) NOT NULL,
  PRIMARY KEY (`membre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `externes`
--

INSERT INTO `externes` (`membre_id`, `membre_pseudo`, `membre_tel`, `membre_mdp`, `date_inscrit`, `membre_banni`, `membre_visite`) VALUES
(1, 'fidele41', '0974217408', '1880852963', '01/09/2019', '0', '1567679676'),
(2, 'Gaetan', '0974217490', '1880852', '01/09/2019', '0', '1567611247'),
(3, 'Bruno', '0850974217', '123456', '02/09/2019', '0', '1567611247'),
(4, 'fidele plk', '0850762370', '1478963', '03/09/2019', '0', '1567611247'),
(5, 'Corneille Mg', '0970559675', '188085297@Mg', '03/09/2019', '0', '1567611247'),
(6, 'Divin', '0974217408', '12369874', '03/09/2019', '0', '1567611247'),
(7, 'Maestro', '0974217490', '12589', '03-09-2019', '0', '1567678687'),
(8, 'Maest', '0974217408', '125874', '1567678243', '0', '1567678284');

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `idMembre` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(70) NOT NULL,
  `PostNom` varchar(70) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `idCommunaute` int(11) NOT NULL,
  `Fonction` varchar(255) NOT NULL,
  PRIMARY KEY (`idMembre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`idMembre`, `Nom`, `PostNom`, `Telephone`, `Email`, `idCommunaute`, `Fonction`) VALUES
(1, 'fidele', 'Bruno', '0974217408', 'fideleplk@gmail.com', 2, 'Directeur'),
(2, 'Gaetan', 'Lwamba', '0850762370', 'gaetanlwb@gmail.com', 1, 'Directeur'),
(3, 'Kornelius', 'Morgan', '0970559675', 'corneillemg@gmail.com', 3, 'Directeur'),
(4, 'fidele', 'plk', '0974217408', 'fideleplk@yahoo.com', 1, 'Vice Directeur'),
(5, 'Bruno', 'Plk', '0974217408', 'fideleplk@facebook.com', 5, 'RAS');

-- --------------------------------------------------------

--
-- Structure de la table `photos`
--

DROP TABLE IF EXISTS `photos`;
CREATE TABLE IF NOT EXISTS `photos` (
  `idPhoto` int(11) NOT NULL AUTO_INCREMENT,
  `idPublication` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  `Etat` enum('1','2') NOT NULL,
  PRIMARY KEY (`idPhoto`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `photos`
--

INSERT INTO `photos` (`idPhoto`, `idPublication`, `Titre`, `Etat`) VALUES
(3, 1, 'img%20(130).jpg', '1'),
(4, 1, 'img%20(129).jpg', '1'),
(5, 1, 'img%20(70).jpg', '1'),
(6, 5, 'service3.png', '1'),
(7, 3, 'concept-resurrection-crucifixion-jesus-christ-croix-au-coucher-du-soleil_1150-7202.jpg', '1'),
(20, 2, 'images (47).jpeg', '1'),
(21, 6, 'occulus-web.png', '1'),
(22, 1, '366c01b9d3653d33d84719b8d19b4314.jpg', '2'),
(23, 2, '33708eb979c5a4be0cb26baf6d048ca8.jpg', '2'),
(24, 5, 'images (5).png', '2'),
(28, 7, '1 (1).jpg', '1'),
(29, 7, '1.jpg', '1'),
(30, 8, '849efe76.png', '1'),
(31, 8, '1554-large_default.jpg', '1'),
(32, 8, '1576.jpg', '1'),
(33, 9, 'binarian cat.jpg', '1'),
(34, 9, 'Binary.jpg', '1'),
(35, 10, 'Capture du 2019-05-12 13-50-24.png', '1'),
(36, 10, 'Capture du 2019-05-12 13-50-27.png', '1'),
(37, 10, 'Capture du 2019-05-12 13-51-47.png', '1'),
(38, 11, 'Capture du 2019-05-04 08-58-18 - 1.png', '1'),
(39, 11, 'Capture du 2019-05-04 08-58-18.png', '1');

-- --------------------------------------------------------

--
-- Structure de la table `publications`
--

DROP TABLE IF EXISTS `publications`;
CREATE TABLE IF NOT EXISTS `publications` (
  `idPublication` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) NOT NULL,
  `Contenu` text NOT NULL,
  `idMemebre` int(11) NOT NULL,
  `date_post` varchar(15) NOT NULL,
  PRIMARY KEY (`idPublication`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `publications`
--

INSERT INTO `publications` (`idPublication`, `Titre`, `Contenu`, `idMemebre`, `date_post`) VALUES
(1, 'La vie des hommes sur la terre', '<h4 style=\"text-align: center;\">Le Rikudo</h4><div>Le <b><i>Rikudo</i></b> est un personnage imaginaire considerÃ© comme le pÃ¨re de tous les ninjas de <b>Konoha</b>&nbsp;(K<i>onoha est un village Ninja qui, avait des ninjas:::</i>)</div>		        \r\n            ', 2, '27/08/2019'),
(2, 'les essais sont toujours nÃ©cessaires', 'ces deux photos sont un vrai oeuvre d\'art qui a Ã©tÃ© dessinÃ© Ã  la main&nbsp;', 2, '28/08/2019'),
(3, 'la musique dans la ville de lubumbashi', 'la musique est tres sacrÃ©e c\'est pourquoi moi je me demande si les louchois font de la musique', 1, '31/08/2019'),
(7, 'titre', '<h1 style=\"text-align: center;\">le titre</h1><div>jklopiiyfuyfuf</div>		        \r\n            ', 1, '31/08/2019');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `idVideo` int(11) NOT NULL AUTO_INCREMENT,
  `idPublication` int(11) NOT NULL,
  `Titre` varchar(255) NOT NULL,
  PRIMARY KEY (`idVideo`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`idVideo`, `idPublication`, `Titre`) VALUES
(1, 2, 'Gloria Messe de Saint Jean.mp4'),
(2, 2, 'vlc-record-2018-06-20-15h28m38s-20180620_131452.mp4'),
(3, 1, 'Coeur de pirate - Ne m\'appelle pas [vidÃ©oclip officiel]_Full-HD.mp4'),
(4, 1, 'LP - Lost On You [Official Video].mp4'),
(5, 1, 'IMG_0344.mp4');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
