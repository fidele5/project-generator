/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: annonces
# ------------------------------------------------------------

DROP TABLE IF EXISTS `annonces`;
CREATE TABLE `annonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(80) NOT NULL,
  `texte` text NOT NULL,
  `categorie` varchar(50) NOT NULL,
  `photo` varchar(80) NOT NULL,
  `datePublication` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT = 4;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: client
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(70) NOT NULL,
  `telClient` varchar(12) NOT NULL,
  PRIMARY KEY (`idClient`)
) AUTO_INCREMENT = 12;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: infos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `infos`;
CREATE TABLE `infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_reservation` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT = 11;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: membre
# ------------------------------------------------------------

DROP TABLE IF EXISTS `membre`;
CREATE TABLE `membre` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(70) NOT NULL,
  `PostNom` varchar(70) NOT NULL,
  `Email` varchar(70) NOT NULL,
  `Mdp` varchar(64) NOT NULL,
  `Adresse` varchar(180) NOT NULL,
  `Nationalite` varchar(255) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Genre` varchar(8) NOT NULL,
  `Avatar` varchar(80) NOT NULL,
  PRIMARY KEY (`id_membre`)
) AUTO_INCREMENT = 7;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: messages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `MessageId` int(11) NOT NULL AUTO_INCREMENT,
  `Expediteur` varchar(80) NOT NULL,
  `Objet` varchar(255) NOT NULL,
  `DateReception` varchar(15) NOT NULL,
  `Messages` text NOT NULL,
  `Etat` tinyint(4) DEFAULT NULL,
  `Actions` varchar(10) NOT NULL,
  PRIMARY KEY (`MessageId`)
);

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: operations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations` (
  `id_operation` int(11) NOT NULL AUTO_INCREMENT,
  `id_reservation` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  PRIMARY KEY (`id_operation`)
) AUTO_INCREMENT = 24;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: reservations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE `reservations` (
  `idReservation` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `Evenement` text NOT NULL,
  `personnes` int(11) NOT NULL,
  `date_debut` varchar(12) NOT NULL,
  `date_fin` varchar(12) NOT NULL,
  PRIMARY KEY (`idReservation`)
) AUTO_INCREMENT = 11;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: salles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `salles`;
CREATE TABLE `salles` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(50) NOT NULL,
  `prix` int(11) NOT NULL,
  `capacite` int(3) NOT NULL,
  PRIMARY KEY (`idSalle`)
) AUTO_INCREMENT = 3;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: services
# ------------------------------------------------------------

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(250) NOT NULL,
  `prix` int(11) NOT NULL,
  `categorie` varchar(80) NOT NULL,
  PRIMARY KEY (`id_service`)
) AUTO_INCREMENT = 10;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: annonces
# ------------------------------------------------------------

INSERT INTO
  `annonces` (
    `id`,
    `titre`,
    `texte`,
    `categorie`,
    `photo`,
    `datePublication`
  )
VALUES
  (1, '', '', '1', '(10).jpg', '1575874115');
INSERT INTO
  `annonces` (
    `id`,
    `titre`,
    `texte`,
    `categorie`,
    `photo`,
    `datePublication`
  )
VALUES
  (2, '', '', '1', '(16) - Copie.jpg', '1575959642');
INSERT INTO
  `annonces` (
    `id`,
    `titre`,
    `texte`,
    `categorie`,
    `photo`,
    `datePublication`
  )
VALUES
  (3, '', '', '1', 'C.jpg', '1575959682');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: client
# ------------------------------------------------------------

INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (1, 'Maestoso', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (2, 'Maestoso', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (3, 'Corneille morgan', '097559675');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (4, 'Fidele Paluku', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (5, 'Bruno', '0974217490');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (6, 'Fidele', '0970559675');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (7, 'fideleplk', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (8, 'Bruno', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (9, 'Bruno', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (10, 'fidele paluku', '0974217408');
INSERT INTO
  `client` (`idClient`, `nomClient`, `telClient`)
VALUES
  (11, 'Fidele', '0974218409');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: infos
# ------------------------------------------------------------

INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (1, 1, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (2, 2, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (3, 3, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (4, 4, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (5, 5, 2);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (6, 6, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (7, 7, 2);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (8, 8, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (9, 9, 1);
INSERT INTO
  `infos` (`id`, `id_reservation`, `id_salle`)
VALUES
  (10, 10, 2);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: membre
# ------------------------------------------------------------

INSERT INTO
  `membre` (
    `id_membre`,
    `Nom`,
    `PostNom`,
    `Email`,
    `Mdp`,
    `Adresse`,
    `Nationalite`,
    `Telephone`,
    `Genre`,
    `Avatar`
  )
VALUES
  (
    1,
    'FIdele',
    'kahumba',
    'fideleplk@yahoo.fr',
    '',
    'Lubumbashi Salama',
    'congolaise ',
    '0974217408',
    'Homme',
    'img(10).jpg'
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: messages
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: operations
# ------------------------------------------------------------

INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (1, 1, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (2, 1, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (3, 1, 3);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (4, 3, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (5, 3, 3);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (6, 3, 4);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (7, 4, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (8, 4, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (9, 4, 4);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (10, 5, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (11, 5, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (12, 6, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (13, 6, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (14, 6, 4);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (15, 7, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (16, 7, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (17, 9, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (18, 9, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (19, 10, 1);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (20, 10, 2);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (21, 10, 3);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (22, 10, 4);
INSERT INTO
  `operations` (`id_operation`, `id_reservation`, `id_service`)
VALUES
  (23, 10, 5);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: reservations
# ------------------------------------------------------------

INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (1, 2, 'rien', 112, '2019-11-25', '2019-11-24');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (
    2,
    3,
    'Manger dans toute ma vie',
    12,
    '2019-11-11',
    '10-11-2019'
  );
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (
    3,
    4,
    'Fete de mariage',
    52,
    '2019-11-12',
    '2019-11-12'
  );
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (4, 5, 'fete inutile', 14, '2019-11-21', '2019-11-21');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (5, 6, 'Retraite', 6, '2019-12-08', '2019-12-10');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (6, 7, 'mariage', 25, '2019-12-10', '2019-12-18');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (7, 8, 'Messe', 85, '2019-12-11', '2019-12-12');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (8, 9, 'fete inutile', 25, '2019-12-18', '2019-12-25');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (9, 10, 'recolection', 20, '2019-12-12', '2019-12-18');
INSERT INTO
  `reservations` (
    `idReservation`,
    `id_client`,
    `Evenement`,
    `personnes`,
    `date_debut`,
    `date_fin`
  )
VALUES
  (10, 11, 'Madagascar', 15, '2019-12-13', '2019-12-20');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: salles
# ------------------------------------------------------------

INSERT INTO
  `salles` (`idSalle`, `designation`, `prix`, `capacite`)
VALUES
  (1, 'Saint Vincent de salles', 250, 100);
INSERT INTO
  `salles` (`idSalle`, `designation`, `prix`, `capacite`)
VALUES
  (2, 'Maria Asunta', 100, 80);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: services
# ------------------------------------------------------------

INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (1, 'Cocktail', 5, 'Hotelerie');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (2, 'Pause Cafe', 2, 'Hotelerie');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (3, 'Projecteur', 20, 'Autres');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (4, 'Sonorisation', 150, 'Autres');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (5, 'Decoration', 25, 'Autres');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (6, 'Bierre', 1500, 'Hotelerie');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (7, 'CafÃ©teria', 23, 'Hotelerie');
INSERT INTO
  `services` (`id_service`, `designation`, `prix`, `categorie`)
VALUES
  (9, 'Mayonnaise', 50, 'Hotelerie');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
