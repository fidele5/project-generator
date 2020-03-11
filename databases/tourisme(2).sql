-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 10 Janvier 2020 à 11:48
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tourisme`
--

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `id_site` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `created_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_picture`
--

CREATE TABLE `post_picture` (
  `id` int(11) NOT NULL,
  `id_post` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `province`
--

CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `province`
--

INSERT INTO `province` (`id`, `nom`) VALUES
(1, 'Bas-Uele'),
(2, 'Équateur'),
(3, 'Haut-Katanga'),
(4, ' Haut-Lomami'),
(5, 'Haut-Uele'),
(6, 'Ituri'),
(7, 'Kasaï'),
(8, 'Kasaï-Central'),
(9, 'Kasaï-Oriental'),
(11, 'Kinshasa'),
(12, 'Kongo-Central'),
(13, 'Kwango'),
(14, 'Kwilu'),
(15, 'Lomami'),
(16, 'Lualaba'),
(17, 'Mai-Ndombe'),
(18, 'Maniema'),
(19, 'Mongala'),
(20, 'Nord-Kivu'),
(21, 'Nord-Ubangi'),
(22, 'Sankuru'),
(23, 'Sud-Kivu'),
(24, 'Sud-Ubangi'),
(25, 'Tanganyika'),
(26, 'Tshopo'),
(27, 'Tshuapa');

-- --------------------------------------------------------

--
-- Structure de la table `ranking`
--

CREATE TABLE `ranking` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_site` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `update_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `country` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_point` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_1` text COLLATE utf8mb4_unicode_ci,
  `text_2` text COLLATE utf8mb4_unicode_ci,
  `text_3` text COLLATE utf8mb4_unicode_ci,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `sites`
--

INSERT INTO `sites` (`id`, `name`, `province`, `country`, `city`, `address`, `map_point`, `text_1`, `text_2`, `text_3`, `created_at`) VALUES
(1, 'Parc national de Kahuzi-Biega', 1, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(2, 'Parc national de la Garamba', 2, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(3, 'Parc national de Kundelungu', 3, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(4, 'Parc national de la Maiko', 4, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(5, 'Parc marin des Mangroves', 5, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(6, 'Parc national de la Lomami', 6, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(7, 'Parc national de la Salonga', 7, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(8, 'Parc national de l\'Upemba', 8, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(9, 'Parc national des Virunga', 9, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(10, 'Parc national de Kahuzi-Biega', 11, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(11, 'Parc national de Kahuzi-Biega', 12, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(12, 'Parc national de Kahuzi-Biega', 13, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(13, 'Parc national de Kahuzi-Biega', 14, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(14, 'Parc national de Kahuzi-Biega', 15, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(15, 'Parc national de Kahuzi-Biega', 16, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(16, 'Parc national de Kahuzi-Biega', 17, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(18, 'Parc national de Kahuzi-Biega', 19, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(19, 'Parc national de Kahuzi-Biega', 20, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(20, 'Parc national de Kahuzi-Biega', 21, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(21, 'Parc national de Kahuzi-Biega', 22, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(22, 'Parc national de Kahuzi-Biega', 23, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(23, 'Parc national de Kahuzi-Biega', 24, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(24, 'Parc national de Kahuzi-Biega', 25, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(25, 'Parc national de Kahuzi-Biega', 26, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(26, 'Parc national de Kahuzi-Biega', 27, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(27, 'Parc national de Kahuzi-Biega', 1, 'DRC', 'Lubumbashi', NULL, NULL, 'Le Parc national de Kahuzi-Biega est un parc national de la République démocratique du Congo, situé à l\'ouest du lac Kivu près de Bukavu, principalement dans la province du Sud-Kivu mais aussi au Nord-Kivu et au Maniema avec sa partie septentrionale. Le parc est couvert d\'une vaste étendue de forêt tropicale primaire et est dominé par deux volcans éteints, le Kahuzi et le Biega. Entre 2 100 et 2 400 m d\'altitude, vit l\'une des dernières populations de gorilles de montagne. Le parc a été créé en 1970. Le site fait partie de la liste du patrimoine mondial de l\'UNESCO depuis 1980. Très accessible car traversé par la route Bukavu-Kisangani, ce parc a une faune et une flore très riches, très diversifiées et très exceptionnelles. Il est caractérisé par diverses zones végétales variables selon l\'altitude dont la forêt de montagne, la forêt de bambous, les zones sub-alpine et alpine, des marais, des tourbières, des rivières, ... On y trouve très particulièrement plusieurs espèces des mammifères dont les gorilles de plaines de l\'Est en avant plan, et les éléphants. Après la deuxième guerre du Congo, le parc a été inscrit sur la liste du patrimoine mondial en péril en 1997.', NULL, NULL, NULL),
(28, 'Sabyinyo', 20, 'DRC', 'Lubumbashi', NULL, '0', 'Le Sabyinyo (dont le nom provient du kinyarwanda iryinyo qui signifie « dent ») est un volcan éteint d\'Afrique de l\'Est qui se situe dans les montagnes des Virunga. Il est d\'ailleurs le plus vieux volcan de ce massif. Son sommet, qui culmine à 3 645 mètres d\'altitude, marque la frontière entre la République démocratique du Congo, le Rwanda et l\'Ouganda.\r\n\r\nTrois aires protégées s\'étendent à proximité de la montagne : le parc national des Virunga, le parc national des Volcans et le parc national des gorilles de Mgahinga.\r\n\r\nLes versants du Sabyinyo sont riches en plantes endémiques et représentent un des derniers habitats du gorille des montagnes. Aussi la constitution de sa lave est-elle unique car elle est composée de latite.', 'Le Sabyinyo (dont le nom provient du kinyarwanda iryinyo qui signifie « dent ») est un volcan éteint d\'Afrique de l\'Est qui se situe dans les montagnes des Virunga. Il est d\'ailleurs le plus vieux volcan de ce massif. Son sommet, qui culmine à 3 645 mètres d\'altitude, marque la frontière entre la République démocratique du Congo, le Rwanda et l\'Ouganda.\r\n\r\nTrois aires protégées s\'étendent à proximité de la montagne : le parc national des Virunga, le parc national des Volcans et le parc national des gorilles de Mgahinga.\r\n\r\nLes versants du Sabyinyo sont riches en plantes endémiques et représentent un des derniers habitats du gorille des montagnes. Aussi la constitution de sa lave est-elle unique car elle est composée de latite.', 'Le Sabyinyo (dont le nom provient du kinyarwanda iryinyo qui signifie « dent ») est un volcan éteint d\'Afrique de l\'Est qui se situe dans les montagnes des Virunga. Il est d\'ailleurs le plus vieux volcan de ce massif. Son sommet, qui culmine à 3 645 mètres d\'altitude, marque la frontière entre la République démocratique du Congo, le Rwanda et l\'Ouganda.\r\n\r\nTrois aires protégées s\'étendent à proximité de la montagne : le parc national des Virunga, le parc national des Volcans et le parc national des gorilles de Mgahinga.\r\n\r\nLes versants du Sabyinyo sont riches en plantes endémiques et représentent un des derniers habitats du gorille des montagnes. Aussi la constitution de sa lave est-elle unique car elle est composée de latite.', NULL),
(29, 'Henock', 4, NULL, NULL, NULL, '00', 'Henock Tshibanda Mulaji', 'Henock Tshibanda Mulaji', 'Henock Tshibanda Mulaji', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `site_Pictures`
--

CREATE TABLE `site_Pictures` (
  `id` int(11) NOT NULL,
  `id_site` int(11) DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `isAdmin` tinyint(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `isAdmin`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'henock', 'multshibanda@gmail.com', NULL, '$2y$10$QaJdFXLm5XM3xSu3C/eMxeRqKMEQ3DFx2vHpRG62AMa0Bm9sFnka2', NULL, '2019-12-27 21:09:43', '2019-12-27 21:09:43'),
(2, 0, 'test52', 'super@gmail.com', NULL, '$2y$10$kV.i2V9Bbj2N03P5oDizyuTPoR/MyXvxF0arZnounJRuJr8QoH08W', NULL, '2019-12-27 21:53:00', '2019-12-27 21:53:00'),
(3, 0, 'test33', 'superrr@gmail.com', NULL, '$2y$10$ma5BIYTV2OjjtKxVE0yi.eVDMylMHEM3iArfu9NdCOB7q.2V7mNde', NULL, '2019-12-27 22:09:56', '2019-12-27 22:09:56'),
(4, 0, 'hit', 'hit@gmail.com', NULL, '$2y$10$v5yE0MNXJE1SzsPaaNvuCOZTMDodRuuA469/FixjnXFbiT.UeVPpS', NULL, '2019-12-27 22:25:05', '2019-12-27 22:25:05');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Partages_1_idx` (`id_site`),
  ADD KEY `fk_Partages_2_idx` (`id_user`);

--
-- Index pour la table `post_picture`
--
ALTER TABLE `post_picture`
  ADD KEY `fk_Partage_picture_1_idx` (`id_post`);

--
-- Index pour la table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ranking`
--
ALTER TABLE `ranking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ranking_1_idx` (`id_site`),
  ADD KEY `fk_ranking_2_idx` (`id_user`);

--
-- Index pour la table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province` (`province`);

--
-- Index pour la table `site_Pictures`
--
ALTER TABLE `site_Pictures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Site_Pictures_1_idx` (`id_site`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `province`
--
ALTER TABLE `province`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_Partages_1` FOREIGN KEY (`id_site`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `fk_Partages_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `post_picture`
--
ALTER TABLE `post_picture`
  ADD CONSTRAINT `fk_Partage_picture_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ranking`
--
ALTER TABLE `ranking`
  ADD CONSTRAINT `fk_ranking_1` FOREIGN KEY (`id_site`) REFERENCES `sites` (`id`),
  ADD CONSTRAINT `fk_ranking_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `province` FOREIGN KEY (`province`) REFERENCES `province` (`id`);

--
-- Contraintes pour la table `site_Pictures`
--
ALTER TABLE `site_Pictures`
  ADD CONSTRAINT `site_fk` FOREIGN KEY (`id_site`) REFERENCES `sites` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
