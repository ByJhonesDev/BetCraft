-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 20/12/2024 às 01:08
-- Versão do servidor: 8.0.40-0ubuntu0.22.04.1
-- Versão do PHP: 8.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ONDAGAMES_V4`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `inviter` int UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deposited` tinyint DEFAULT '0',
  `deposited_amount` decimal(10,2) DEFAULT '0.00',
  `losses` bigint DEFAULT '0',
  `losses_amount` decimal(10,2) DEFAULT '0.00',
  `commission_paid` decimal(10,2) DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_logs`
--

CREATE TABLE `affiliate_logs` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `commission_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `commission` decimal(20,2) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_withdraws`
--

CREATE TABLE `affiliate_withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `proof` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `pix_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pix_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cpf` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `link` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'home',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`) VALUES
(40, NULL, '01JF63CX2Z8X8CY3VGXR8MFYE0.avif', 'carousel', NULL, '2024-12-15 22:25:41', '2024-12-15 22:25:41'),
(41, NULL, '01JF63D62CG899B2E4A1FA8NDG.avif', 'carousel', NULL, '2024-12-15 22:25:50', '2024-12-15 22:25:50'),
(42, NULL, '01JF63DD58S91997Z22MS1ZVJE.avif', 'carousel', NULL, '2024-12-15 22:25:57', '2024-12-15 22:25:57'),
(43, NULL, '01JF63DMJEYFFTQ3D1NN0EEPGD.avif', 'carousel', NULL, '2024-12-15 22:26:05', '2024-12-15 22:26:05'),
(46, NULL, '01JF6GT3N3PQTC37YSYYKXNZGK.gif', 'home', NULL, '2024-12-16 02:19:14', '2024-12-16 02:20:05'),
(45, NULL, '01JF6GQW3087E86HZEHR7MZ1FE.gif', 'home', NULL, '2024-12-16 02:18:52', '2024-12-16 02:18:52'),
(44, NULL, '01JF6GTKSWJ294M8DPT8DZKH0S.gif', 'home', NULL, '2024-12-16 02:18:44', '2024-12-16 02:20:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `bs_pays`
--

CREATE TABLE `bs_pays` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `withdrawal_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `url`, `created_at`, `updated_at`) VALUES
(1, 'Jogos Favoritos', 'Jogos Favoritos', '01JF64KG5GMDH1W1EK4DQ2Q8RG.png', 'Jogos Favoritos', NULL, '2023-11-13 14:59:07', '2024-12-15 22:46:45'),
(2, 'Jogos slots', 'Jogos slots', '01JF64H7AC4DR377BSTDNHJD8X.png', 'Jogos slots', NULL, '2023-12-24 12:06:46', '2024-12-15 22:45:31'),
(3, 'Jogos Crash', 'Jogos Crash', '01JF64DSMP0Q98HRK8FP9M1KX5.png', 'Jogos Crash', NULL, '2023-12-24 12:12:36', '2024-12-15 22:43:38'),
(4, 'Cassino ao vivo', 'Cassino ao vivo', '01JF6496TYQ71595HRWE2JZBZ9.png', 'Cassino ao vivo', NULL, '2024-04-16 11:26:47', '2024-12-15 22:41:08'),
(26, 'Todos os jogos', 'Todos os jogos', '01JF64PBWGJFGFYW5FFJJFH03J.png', 'Todos os jogos', NULL, '2024-12-15 22:36:31', '2024-12-15 22:48:19'),
(28, 'Aviator', 'Aviator', '01JF641Z4T3RKHBTXJ03BRANC0.png', 'Aviator', NULL, '2024-12-15 22:37:11', '2024-12-15 22:37:11'),
(30, 'Mines', 'Mines', '01JF642ZKB39CGAR1B62W06CC9.png', 'mines', 'https://local-casa-servidor.com/games/play/451/mines', '2024-12-15 22:37:44', '2024-12-20 05:11:11'),
(31, 'Provedores', 'Provedores', '01JF643AR0CTR1YZZ94HRA1FQ9.png', 'Provedores', NULL, '2024-12-15 22:37:55', '2024-12-15 22:37:55'),
(32, 'Roleta brasileira', 'Roleta brasileira', '01JF643RQ4GJ7P0FCEWJS82CV1.png', 'Roleta brasileira', NULL, '2024-12-15 22:38:10', '2024-12-15 22:38:10'),
(33, 'Spaceman', 'Spaceman', '01JF6443N2QKGAHGGGH8JT49E9.png', 'Spaceman', NULL, '2024-12-15 22:38:21', '2024-12-15 22:38:21'),
(34, 'Fortune Tiger', 'Fortune Tiger', '01JF644D6A4XQXTZ7RQV9Q5BA9.png', 'Fortune Tiger', NULL, '2024-12-15 22:38:31', '2024-12-15 22:38:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_game`
--

CREATE TABLE `category_game` (
  `category_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `category_game`
--

INSERT INTO `category_game` (`category_id`, `game_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 28),
(2, 29),
(2, 30),
(2, 31),
(2, 32),
(2, 33),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),
(2, 40),
(2, 41),
(2, 42),
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 63),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 74),
(2, 75),
(2, 76),
(2, 77),
(2, 78),
(2, 79),
(2, 80),
(2, 81),
(2, 82),
(2, 83),
(2, 84),
(2, 85),
(2, 86),
(2, 87),
(2, 88),
(2, 89),
(2, 90),
(2, 91),
(2, 92),
(2, 93),
(2, 94),
(2, 95),
(2, 96),
(2, 97),
(2, 98),
(2, 99),
(2, 100),
(2, 101),
(2, 102),
(2, 103),
(2, 104),
(2, 105),
(2, 106),
(2, 107),
(2, 108),
(2, 109),
(2, 110),
(2, 111),
(2, 112),
(2, 113),
(2, 114),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 124),
(2, 125),
(2, 126),
(2, 127),
(2, 128),
(2, 129),
(2, 130),
(2, 131),
(2, 132),
(2, 133),
(2, 134),
(2, 135),
(2, 136),
(2, 137),
(2, 138),
(2, 139),
(2, 140),
(2, 141),
(2, 142),
(2, 143),
(2, 144),
(2, 145),
(2, 146),
(2, 147),
(2, 148),
(2, 149),
(2, 150),
(2, 151),
(2, 152),
(2, 153),
(2, 154),
(2, 155),
(2, 156),
(2, 157),
(2, 158),
(2, 159),
(2, 160),
(2, 161),
(2, 162),
(2, 163),
(2, 164),
(2, 165),
(2, 166),
(2, 167),
(2, 168),
(2, 169),
(2, 170),
(2, 171),
(2, 172),
(2, 173),
(2, 174),
(2, 175),
(2, 176),
(2, 177),
(2, 178),
(2, 179),
(2, 180),
(2, 181),
(2, 182),
(2, 183),
(2, 184),
(2, 185),
(2, 186),
(2, 187),
(2, 188),
(2, 189),
(2, 190),
(2, 191),
(2, 192),
(2, 193),
(2, 194),
(2, 195),
(2, 196),
(2, 197),
(2, 198),
(2, 199),
(2, 200),
(2, 201),
(2, 202),
(2, 203),
(2, 204),
(2, 205),
(2, 206),
(2, 207),
(2, 208),
(2, 209),
(2, 210),
(2, 211),
(2, 212),
(2, 213),
(2, 214),
(2, 215),
(2, 216),
(2, 217),
(2, 218),
(2, 219),
(2, 220),
(2, 221),
(2, 222),
(2, 223),
(2, 224),
(2, 225),
(2, 226),
(2, 227),
(2, 228),
(2, 229),
(2, 230),
(2, 231),
(2, 232),
(2, 233),
(2, 234),
(2, 235),
(2, 236),
(2, 237),
(2, 238),
(2, 239),
(2, 240),
(2, 241),
(2, 242),
(2, 243),
(2, 244),
(2, 245),
(2, 246),
(2, 247),
(2, 248),
(2, 249),
(2, 250),
(2, 251),
(2, 252),
(2, 253),
(2, 254),
(2, 255),
(2, 256),
(2, 257),
(2, 258),
(2, 259),
(2, 260),
(2, 261),
(2, 262),
(2, 263),
(2, 264),
(2, 265),
(2, 266),
(2, 267),
(2, 268),
(2, 269),
(2, 270),
(2, 271),
(2, 272),
(2, 273),
(2, 274),
(2, 275),
(2, 276),
(2, 277),
(2, 278),
(2, 279),
(2, 280),
(2, 281),
(2, 282),
(2, 283),
(2, 284),
(2, 285),
(2, 286),
(2, 287),
(2, 288),
(2, 289),
(2, 290),
(2, 291),
(2, 292),
(2, 293),
(2, 294),
(2, 295),
(2, 296),
(2, 297),
(2, 298),
(2, 299),
(2, 300),
(2, 301),
(2, 302),
(2, 303),
(2, 304),
(2, 305),
(2, 306),
(2, 307),
(2, 308),
(2, 309),
(2, 310),
(2, 311),
(2, 312),
(2, 313),
(2, 314),
(2, 315),
(2, 316),
(2, 317),
(2, 318),
(2, 319),
(2, 320),
(2, 321),
(2, 322),
(2, 323),
(2, 324),
(2, 325),
(2, 326),
(2, 327),
(2, 328),
(2, 329),
(2, 330),
(2, 331),
(2, 332),
(2, 333),
(2, 334),
(2, 335),
(2, 336),
(2, 337),
(2, 338),
(2, 339),
(2, 340),
(2, 341),
(2, 342),
(2, 343),
(2, 344),
(2, 345),
(2, 346),
(2, 347),
(2, 348),
(2, 349),
(2, 350),
(2, 351),
(2, 352),
(2, 353),
(2, 354),
(2, 355),
(2, 356),
(2, 357),
(2, 358),
(2, 359),
(2, 360),
(2, 361),
(2, 362),
(2, 363),
(2, 364),
(2, 365),
(2, 366),
(2, 367),
(2, 368),
(2, 369),
(2, 370),
(2, 371),
(2, 372),
(2, 373),
(2, 374),
(2, 375),
(2, 376),
(2, 377),
(2, 378),
(2, 379),
(2, 380),
(2, 381),
(2, 382),
(2, 383),
(2, 384),
(2, 385),
(2, 386),
(2, 387),
(2, 388),
(2, 389),
(2, 390),
(2, 391),
(2, 392),
(2, 393),
(2, 394),
(2, 395),
(2, 396),
(4, 1080),
(4, 1081),
(4, 1082),
(4, 1083),
(4, 1084),
(4, 1085),
(4, 1086),
(4, 1087),
(4, 1088),
(4, 1089),
(4, 1090),
(4, 1091),
(4, 1092),
(4, 1093),
(4, 1094),
(4, 1095),
(4, 1096),
(4, 1097),
(4, 1098),
(4, 1099),
(4, 1100),
(4, 1101),
(4, 1102),
(4, 1103),
(4, 1104),
(4, 1105),
(4, 1106),
(4, 1107),
(4, 1108),
(4, 1109),
(4, 1110),
(4, 1111),
(4, 1112),
(4, 1113),
(4, 1114),
(4, 1115),
(4, 1116),
(4, 1117),
(4, 1118),
(4, 1119),
(4, 1120),
(4, 1121),
(4, 1122),
(4, 1123),
(4, 1124),
(4, 1125),
(4, 1126),
(4, 1127),
(4, 1128),
(4, 1129),
(4, 1130),
(4, 1131),
(4, 1132),
(4, 1133),
(4, 1134),
(4, 1135),
(4, 1136),
(4, 1137),
(4, 1138),
(4, 1139),
(4, 1140),
(4, 1141),
(4, 1142),
(4, 1143),
(4, 1144),
(4, 1145),
(4, 1146),
(4, 1147),
(4, 1148),
(4, 1149),
(4, 1150),
(4, 1151),
(4, 1152),
(4, 1153),
(4, 1154),
(4, 1155),
(4, 1156),
(4, 1157),
(4, 1158),
(4, 1159),
(4, 1160),
(4, 1161),
(4, 1162),
(4, 1163),
(4, 1164),
(4, 1165),
(4, 1166),
(4, 1167),
(4, 1168),
(4, 1169),
(4, 1170),
(4, 1171),
(4, 1172),
(4, 1173),
(4, 1174),
(4, 1175),
(4, 1176),
(4, 1177),
(4, 1178),
(4, 1179),
(4, 1180),
(4, 1181),
(4, 1182),
(4, 1183),
(4, 1184),
(4, 1185),
(4, 761),
(4, 762),
(4, 763),
(4, 764),
(4, 765),
(4, 766),
(4, 767),
(4, 768),
(4, 769),
(4, 770),
(4, 771),
(4, 772),
(4, 773),
(4, 774),
(4, 775),
(4, 776),
(4, 777),
(4, 778),
(4, 779),
(4, 780),
(4, 781),
(4, 782),
(4, 783),
(4, 784),
(4, 785),
(4, 786),
(4, 787),
(4, 788),
(4, 789),
(4, 790),
(4, 791),
(4, 792),
(4, 793),
(4, 794),
(4, 795),
(4, 796),
(4, 797),
(4, 798),
(4, 799),
(4, 800),
(4, 801),
(4, 802),
(4, 803),
(4, 804),
(4, 805),
(4, 806),
(4, 807),
(4, 808),
(4, 809),
(3, 810),
(3, 811),
(2, 428),
(2, 429),
(2, 430),
(2, 431),
(2, 432),
(2, 433),
(2, 434),
(2, 435),
(2, 436),
(2, 437),
(2, 438),
(2, 439),
(2, 440),
(2, 441),
(2, 442),
(2, 443),
(2, 444),
(2, 445),
(2, 446),
(2, 447),
(2, 448),
(2, 449),
(2, 450),
(2, 451),
(2, 452),
(2, 453),
(2, 454),
(2, 455),
(2, 456),
(2, 457),
(2, 458),
(2, 459),
(2, 460),
(2, 461),
(2, 462),
(2, 463),
(2, 464),
(2, 465),
(2, 466),
(2, 467),
(2, 468),
(2, 469),
(2, 470),
(2, 471),
(2, 472),
(2, 473),
(2, 474),
(2, 475),
(2, 476),
(2, 477),
(2, 478),
(2, 479),
(2, 480),
(2, 481),
(2, 482),
(2, 483),
(2, 484),
(2, 485),
(2, 486),
(2, 487),
(2, 488),
(2, 489),
(2, 490),
(2, 491),
(2, 492),
(2, 493),
(2, 494),
(2, 495),
(2, 496),
(2, 497),
(2, 498),
(2, 499),
(2, 500),
(2, 501),
(2, 502),
(2, 503),
(2, 504),
(2, 505),
(2, 506),
(2, 507),
(2, 508),
(2, 509),
(2, 510),
(2, 511),
(2, 512),
(2, 513),
(2, 514),
(2, 515),
(2, 516),
(2, 517),
(2, 518),
(2, 519),
(2, 520),
(2, 521),
(2, 522),
(2, 523),
(2, 524),
(2, 525),
(2, 526),
(2, 527),
(2, 528),
(2, 529),
(2, 530),
(2, 531),
(2, 532),
(2, 533),
(2, 534),
(2, 535),
(2, 536),
(2, 537),
(2, 538),
(2, 539),
(2, 540),
(2, 541),
(2, 542),
(2, 543),
(2, 544),
(2, 545),
(2, 546),
(2, 547),
(2, 548),
(2, 549),
(2, 550),
(2, 551),
(2, 552),
(2, 553),
(2, 554),
(2, 555),
(2, 556),
(2, 557),
(2, 558),
(2, 559),
(2, 560),
(2, 561),
(2, 562),
(2, 563),
(2, 564),
(2, 565),
(2, 566),
(2, 567),
(2, 568),
(2, 569),
(2, 570),
(2, 571),
(2, 572),
(2, 573),
(2, 574),
(2, 575),
(2, 576),
(2, 577),
(2, 578),
(2, 579),
(2, 580),
(2, 581),
(2, 582),
(2, 583),
(2, 584),
(2, 585),
(2, 586),
(2, 587),
(2, 588),
(2, 589),
(2, 590),
(2, 591),
(2, 592),
(2, 593),
(2, 594),
(2, 595),
(2, 596),
(2, 597),
(2, 598),
(2, 599),
(2, 600),
(2, 601),
(2, 602),
(2, 603),
(2, 604),
(2, 605),
(2, 606),
(2, 607),
(2, 608),
(2, 609),
(2, 610),
(2, 611),
(2, 612),
(2, 613),
(2, 614),
(2, 615),
(2, 616),
(2, 617),
(2, 618),
(2, 619),
(2, 620),
(2, 621),
(2, 622),
(2, 623),
(2, 624),
(2, 625),
(2, 626),
(2, 627),
(2, 628),
(2, 629),
(2, 630),
(2, 631),
(2, 632),
(2, 633),
(2, 634),
(2, 635),
(2, 636),
(2, 637),
(2, 638),
(2, 639),
(2, 640),
(2, 641),
(2, 642),
(2, 643),
(2, 644),
(2, 645),
(2, 646),
(2, 647),
(2, 648),
(2, 649),
(2, 650),
(2, 651),
(2, 652),
(2, 653),
(2, 654),
(2, 655),
(2, 656),
(2, 657),
(2, 658),
(2, 659),
(2, 660),
(2, 661),
(2, 662),
(2, 663),
(2, 664),
(2, 665),
(2, 666),
(2, 667),
(2, 668),
(2, 669),
(2, 670),
(2, 671),
(2, 672),
(2, 673),
(2, 674),
(2, 675),
(2, 676),
(2, 677),
(2, 678),
(2, 679),
(2, 680),
(2, 681),
(2, 682),
(2, 683),
(2, 684),
(2, 685),
(2, 686),
(2, 687),
(2, 688),
(2, 689),
(2, 690),
(2, 691),
(2, 692),
(2, 693),
(2, 694),
(2, 695),
(2, 696),
(2, 697),
(2, 698),
(2, 699),
(2, 700),
(2, 701),
(2, 702),
(2, 703),
(2, 704),
(2, 705),
(2, 706),
(2, 707),
(2, 708),
(2, 709),
(2, 710),
(2, 711),
(2, 712),
(2, 713),
(2, 714),
(2, 715),
(2, 716),
(2, 717),
(2, 718),
(2, 719),
(2, 720),
(2, 721),
(2, 722),
(2, 723),
(2, 724),
(2, 725),
(2, 726),
(2, 727),
(2, 728),
(2, 729),
(2, 730),
(2, 731),
(2, 732),
(2, 733),
(2, 734),
(2, 735),
(2, 736),
(2, 737),
(2, 738),
(2, 739),
(2, 740),
(2, 741),
(2, 742),
(2, 743),
(2, 744),
(2, 745),
(2, 746),
(2, 747),
(2, 748),
(2, 749),
(2, 750),
(2, 751),
(2, 752),
(2, 753),
(2, 754),
(2, 755),
(2, 756),
(2, 757),
(2, 758),
(2, 759),
(3, 410),
(3, 401),
(3, 418),
(3, 1188),
(3, 1189),
(3, 416),
(3, 426),
(3, 415),
(3, 397),
(3, 403),
(2, 1197);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupons`
--

CREATE TABLE `cupons` (
  `id` int NOT NULL,
  `codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `valor_bonus` decimal(8,2) NOT NULL,
  `validade` date NOT NULL,
  `quantidade_uso` int NOT NULL,
  `usos` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cupons`
--

INSERT INTO `cupons` (`id`, `codigo`, `valor_bonus`, `validade`, `quantidade_uso`, `usos`, `created_at`, `updated_at`) VALUES
(2, 'FUIDEBONUS', 5.00, '2024-12-01', 100, 0, '2024-11-02 04:30:30', '2024-11-02 04:30:30'),
(3, 'BONUSBET82', 10.00, '2024-12-01', 20, 0, '2024-11-02 04:30:56', '2024-11-02 04:30:56'),
(4, 'NOVONABET1', 15.00, '2024-12-01', 1, 0, '2024-11-02 04:31:17', '2024-11-02 04:31:17'),
(5, 'BETVIP12322', 25.00, '2024-12-01', 1, 0, '2024-11-02 04:31:40', '2024-11-02 04:31:40'),
(6, 'TOUROSAPP ', 10.00, '2024-12-07', 100, 0, '2024-11-02 21:27:55', '2024-11-02 21:27:55');

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2023-11-07 21:01:38', NULL),
(2, 'Dollars', 'USD', '$', '2023-11-07 21:01:38', NULL),
(3, 'Afghanis', 'AFN', '؋', '2023-11-07 21:01:38', NULL),
(4, 'Pesos', 'ARS', '$', '2023-11-07 21:01:38', NULL),
(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 21:01:38', NULL),
(6, 'Dollars', 'AUD', '$', '2023-11-07 21:01:38', NULL),
(7, 'New Manats', 'AZN', 'ман', '2023-11-07 21:01:38', NULL),
(8, 'Dollars', 'BSD', '$', '2023-11-07 21:01:38', NULL),
(9, 'Dollars', 'BBD', '$', '2023-11-07 21:01:38', NULL),
(10, 'Rubles', 'BYR', 'p.', '2023-11-07 21:01:38', NULL),
(11, 'Euro', 'EUR', '€', '2023-11-07 21:01:38', NULL),
(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 21:01:38', NULL),
(13, 'Dollars', 'BMD', '$', '2023-11-07 21:01:38', NULL),
(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 21:01:38', NULL),
(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 21:01:38', NULL),
(16, 'Pula', 'BWP', 'P', '2023-11-07 21:01:38', NULL),
(17, 'Leva', 'BGN', 'лв', '2023-11-07 21:01:38', NULL),
(18, 'Reais', 'BRL', 'R$', '2023-11-07 21:01:38', NULL),
(19, 'Pounds', 'GBP', '£', '2023-11-07 21:01:38', NULL),
(20, 'Dollars', 'BND', '$', '2023-11-07 21:01:38', NULL),
(21, 'Riels', 'KHR', '៛', '2023-11-07 21:01:38', NULL),
(22, 'Dollars', 'CAD', '$', '2023-11-07 21:01:38', NULL),
(23, 'Dollars', 'KYD', '$', '2023-11-07 21:01:38', NULL),
(24, 'Pesos', 'CLP', '$', '2023-11-07 21:01:38', NULL),
(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 21:01:38', NULL),
(26, 'Pesos', 'COP', '$', '2023-11-07 21:01:38', NULL),
(27, 'Colón', 'CRC', '₡', '2023-11-07 21:01:38', NULL),
(28, 'Kuna', 'HRK', 'kn', '2023-11-07 21:01:38', NULL),
(29, 'Pesos', 'CUP', '₱', '2023-11-07 21:01:38', NULL),
(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 21:01:38', NULL),
(31, 'Kroner', 'DKK', 'kr', '2023-11-07 21:01:38', NULL),
(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 21:01:38', NULL),
(33, 'Dollars', 'XCD', '$', '2023-11-07 21:01:38', NULL),
(34, 'Pounds', 'EGP', '£', '2023-11-07 21:01:38', NULL),
(35, 'Colones', 'SVC', '$', '2023-11-07 21:01:38', NULL),
(36, 'Pounds', 'FKP', '£', '2023-11-07 21:01:38', NULL),
(37, 'Dollars', 'FJD', '$', '2023-11-07 21:01:38', NULL),
(38, 'Cedis', 'GHC', '¢', '2023-11-07 21:01:38', NULL),
(39, 'Pounds', 'GIP', '£', '2023-11-07 21:01:38', NULL),
(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 21:01:38', NULL),
(41, 'Pounds', 'GGP', '£', '2023-11-07 21:01:38', NULL),
(42, 'Dollars', 'GYD', '$', '2023-11-07 21:01:38', NULL),
(43, 'Lempiras', 'HNL', 'L', '2023-11-07 21:01:38', NULL),
(44, 'Dollars', 'HKD', '$', '2023-11-07 21:01:38', NULL),
(45, 'Forint', 'HUF', 'Ft', '2023-11-07 21:01:38', NULL),
(46, 'Kronur', 'ISK', 'kr', '2023-11-07 21:01:38', NULL),
(47, 'Rupees', 'INR', 'Rp', '2023-11-07 21:01:38', NULL),
(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 21:01:38', NULL),
(49, 'Rials', 'IRR', '﷼', '2023-11-07 21:01:38', NULL),
(50, 'Pounds', 'IMP', '£', '2023-11-07 21:01:38', NULL),
(51, 'New Shekels', 'ILS', '₪', '2023-11-07 21:01:38', NULL),
(52, 'Dollars', 'JMD', 'J$', '2023-11-07 21:01:38', NULL),
(53, 'Yen', 'JPY', '¥', '2023-11-07 21:01:38', NULL),
(54, 'Pounds', 'JEP', '£', '2023-11-07 21:01:38', NULL),
(55, 'Tenge', 'KZT', 'лв', '2023-11-07 21:01:38', NULL),
(56, 'Won', 'KPW', '₩', '2023-11-07 21:01:38', NULL),
(57, 'Won', 'KRW', '₩', '2023-11-07 21:01:38', NULL),
(58, 'Soms', 'KGS', 'лв', '2023-11-07 21:01:38', NULL),
(59, 'Kips', 'LAK', '₭', '2023-11-07 21:01:38', NULL),
(60, 'Lati', 'LVL', 'Ls', '2023-11-07 21:01:38', NULL),
(61, 'Pounds', 'LBP', '£', '2023-11-07 21:01:38', NULL),
(62, 'Dollars', 'LRD', '$', '2023-11-07 21:01:38', NULL),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 21:01:38', NULL),
(64, 'Litai', 'LTL', 'Lt', '2023-11-07 21:01:38', NULL),
(65, 'Denars', 'MKD', 'ден', '2023-11-07 21:01:38', NULL),
(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 21:01:38', NULL),
(67, 'Rupees', 'MUR', '₨', '2023-11-07 21:01:38', NULL),
(68, 'Pesos', 'MXN', '$', '2023-11-07 21:01:38', NULL),
(69, 'Tugriks', 'MNT', '₮', '2023-11-07 21:01:38', NULL),
(70, 'Meticais', 'MZN', 'MT', '2023-11-07 21:01:38', NULL),
(71, 'Dollars', 'NAD', '$', '2023-11-07 21:01:38', NULL),
(72, 'Rupees', 'NPR', '₨', '2023-11-07 21:01:38', NULL),
(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 21:01:38', NULL),
(74, 'Dollars', 'NZD', '$', '2023-11-07 21:01:38', NULL),
(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 21:01:38', NULL),
(76, 'Nairas', 'NGN', '₦', '2023-11-07 21:01:38', NULL),
(77, 'Krone', 'NOK', 'kr', '2023-11-07 21:01:38', NULL),
(78, 'Rials', 'OMR', '﷼', '2023-11-07 21:01:38', NULL),
(79, 'Rupees', 'PKR', '₨', '2023-11-07 21:01:38', NULL),
(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 21:01:38', NULL),
(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 21:01:38', NULL),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 21:01:38', NULL),
(83, 'Pesos', 'PHP', 'Php', '2023-11-07 21:01:38', NULL),
(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 21:01:38', NULL),
(85, 'Rials', 'QAR', '﷼', '2023-11-07 21:01:38', NULL),
(86, 'New Lei', 'RON', 'lei', '2023-11-07 21:01:38', NULL),
(87, 'Rubles', 'RUB', 'руб', '2023-11-07 21:01:38', NULL),
(88, 'Pounds', 'SHP', '£', '2023-11-07 21:01:38', NULL),
(89, 'Riyals', 'SAR', '﷼', '2023-11-07 21:01:38', NULL),
(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 21:01:38', NULL),
(91, 'Rupees', 'SCR', '₨', '2023-11-07 21:01:38', NULL),
(92, 'Dollars', 'SGD', '$', '2023-11-07 21:01:38', NULL),
(93, 'Dollars', 'SBD', '$', '2023-11-07 21:01:38', NULL),
(94, 'Shillings', 'SOS', 'S', '2023-11-07 21:01:38', NULL),
(95, 'Rand', 'ZAR', 'R', '2023-11-07 21:01:38', NULL),
(96, 'Rupees', 'LKR', '₨', '2023-11-07 21:01:38', NULL),
(97, 'Kronor', 'SEK', 'kr', '2023-11-07 21:01:38', NULL),
(98, 'Dollars', 'SRD', '$', '2023-11-07 21:01:38', NULL),
(99, 'Pounds', 'SYP', '£', '2023-11-07 21:01:38', NULL),
(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 21:01:38', NULL),
(101, 'Baht', 'THB', '฿', '2023-11-07 21:01:38', NULL),
(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 21:01:38', NULL),
(103, 'Lira', 'TRY', '₺', '2023-11-07 21:01:38', NULL),
(104, 'Liras', 'TRL', '£', '2023-11-07 21:01:38', NULL),
(105, 'Dollars', 'TVD', '$', '2023-11-07 21:01:38', NULL),
(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 21:01:38', NULL),
(107, 'Pesos', 'UYU', '$U', '2023-11-07 21:01:38', NULL),
(108, 'Sums', 'UZS', 'лв', '2023-11-07 21:01:38', NULL),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 21:01:38', NULL),
(110, 'Dong', 'VND', '₫', '2023-11-07 21:01:38', NULL),
(111, 'Rials', 'YER', '﷼', '2023-11-07 21:01:38', NULL),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 21:01:38', NULL),
(113, 'Rupees', 'INR', '₹', '2023-11-07 21:01:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency_alloweds`
--

CREATE TABLE `currency_alloweds` (
  `id` bigint UNSIGNED NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_layouts`
--

CREATE TABLE `custom_layouts` (
  `id` bigint UNSIGNED NOT NULL,
  `font_family_default` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#0073D2',
  `primary_opacity_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secundary_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#084375',
  `gray_dark_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#3b3b3b',
  `gray_light_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#c9c9c9',
  `gray_medium_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#676767',
  `gray_over_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#1A1C20',
  `title_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#4D565E',
  `background_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#24262B',
  `carousel_banners` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#1E2024',
  `sidebar_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_color_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navtop_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navtop_color_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `side_menu` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `side_menu_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `input_primary` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `input_primary_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_color_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `card_color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `card_color_dark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `border_radius` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '.25rem',
  `custom_css` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `custom_js` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `custom_body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `custom_header` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `image_navbar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `popup_fluatuante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_fluatuante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `popup2_fluatuante` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_fluatuante2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPixelFC` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idPixelGoogle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_suporte` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_Jackpot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_tela` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_botoes` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_navbar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_sidebar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_hot1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_hot2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_hot3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_hot4` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_hot5` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_deposito1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_deposito2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_registro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_app` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_telegram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_whatsapp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_instagram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_siderbar_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_siderbar_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_siderbar_3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link_lincenca` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_imglogin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menucell_inicio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menucell_carteira` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menucell_afiliado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menucell_saque` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menucell_sair` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_imagen1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_imagen2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_imagen3` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_telegram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_facebook` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_whatsapp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_instagram` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_mais18` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mensagem_home` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `sobre_fotter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menucell_suporte` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `custom_modal_pop` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `navebar_app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_background` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_text_color` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_links` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_background` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_border` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_icons` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_titulos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_hover_language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_color_language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_background_language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_button_border_language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_background_language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_background` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_missoes_background` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_vip_background` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_ganhe_background` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_missoes_text` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_ganhe_text` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_vip_text` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_button_hover` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_text_hover` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_text_color` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_border` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_icons` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_background` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_text` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_icon_menu` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_icon_promocoes` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_icon_casino` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_icon_sport` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_text_login` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_text_registro` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_background_login` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_background_registro` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_border_color` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_text_superior` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_background_superior` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_text_superior` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_deposito_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_deposito_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_deposito_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_deposito_píx_color_text` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_deposito_píx_background` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_deposito_píx_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_carteira_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_carteira_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_button_carteira_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_icon_promocoes_segunda_cor` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_icon_color_border` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_modal_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_modal_text_modal` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_modal_background_modal` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navbar_perfil_modal_hover_modal` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_icons_background` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_button_banner` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_icon_color_button_banner` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_categorias` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_text_color_categorias` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_text_color_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_pesquisa_aviso` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_text_color_pesquisa_aviso` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_button_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_icon_color_button_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_button_vertodos` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_text_color_button_vertodos` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_button_jogar` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_text_color_button_jogar` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_icon_color_button_jogar` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_hover_jogar` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_background_input_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_border_color_input_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `home_icon_color_input_pesquisa` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_input_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gamelist_button_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_links_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_input_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_button_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_links_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_input_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_button_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_input_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `esqueci_button_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `geral_icons_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_security_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_security_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_security_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `topo_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `topo_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `topo_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `topo_button_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_sub_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_numero_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_button_saque_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_button_saque_text` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_button_copie_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_button_copie_text` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliates_icom_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_button_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_title_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_number_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_button_deposito_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_button_saque_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_button_deposito_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_button_saque_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_contagem_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_contagem_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_contagem_number_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_contagem_quadrado_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_input_number_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_input_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_title_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_number_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_number_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_deposito_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_number_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_input_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saque_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_title_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_number_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_status_finalizado_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_status_finalizado_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_status_pedente_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_status_pedente_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_barra_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_barra_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_Texot_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_sub_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_input_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_input_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_border_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_saldo_pix_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carteira_history_barra_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_title_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_sub_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_pupup_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_pupup_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `promocoes_icon_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_title_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_description_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_progress_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_progress_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_progress_prenchimento_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_icons_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_icons_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_icons_sub_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_background_profile_vip` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vips_icon_mover_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vip_atual_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vip_atual_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vip_proximo_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `vip_proximo_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_sub_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_title_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_bonus_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_bonus_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_button_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_button_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_barraprogresso_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_barraprogresso_prenchimento_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `missoes_barraprogresso_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menu_cell_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `menu_cell_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_geral` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_geral_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carregando_background` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `carregando_text_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `custom_layouts`
--

INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `primary_opacity_color`, `secundary_color`, `gray_dark_color`, `gray_light_color`, `gray_medium_color`, `gray_over_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `input_primary`, `input_primary_dark`, `footer_color`, `footer_color_dark`, `card_color`, `card_color_dark`, `border_radius`, `custom_css`, `custom_js`, `custom_body`, `created_at`, `updated_at`, `custom_header`, `image_navbar`, `popup_fluatuante`, `link_fluatuante`, `popup2_fluatuante`, `link_fluatuante2`, `idPixelFC`, `idPixelGoogle`, `link_suporte`, `image_Jackpot`, `background_tela`, `background_botoes`, `background_navbar`, `background_sidebar`, `image_hot1`, `image_hot2`, `image_hot3`, `image_hot4`, `image_hot5`, `banner_deposito1`, `banner_deposito2`, `banner_registro`, `banner_login`, `link_app`, `link_telegram`, `link_facebook`, `link_whatsapp`, `link_instagram`, `link_siderbar_1`, `link_siderbar_2`, `link_siderbar_3`, `link_lincenca`, `navbar_imglogin`, `menucell_inicio`, `menucell_carteira`, `menucell_afiliado`, `menucell_saque`, `menucell_sair`, `footer_imagen1`, `footer_imagen2`, `footer_imagen3`, `footer_telegram`, `footer_facebook`, `footer_whatsapp`, `footer_instagram`, `footer_mais18`, `mensagem_home`, `sobre_fotter`, `menucell_suporte`, `custom_modal_pop`, `navebar_app`, `footer_background`, `footer_text_color`, `footer_links`, `footer_button_background`, `footer_button_text`, `footer_button_border`, `footer_icons`, `footer_titulos`, `footer_button_hover_language`, `footer_button_color_language`, `footer_button_background_language`, `footer_button_border_language`, `footer_background_language`, `sidebar_background`, `sidebar_button_missoes_background`, `sidebar_button_vip_background`, `sidebar_button_ganhe_background`, `sidebar_button_missoes_text`, `sidebar_button_ganhe_text`, `sidebar_button_vip_text`, `sidebar_button_hover`, `sidebar_text_hover`, `sidebar_text_color`, `sidebar_border`, `sidebar_icons`, `navbar_background`, `navbar_text`, `navbar_icon_menu`, `navbar_icon_promocoes`, `navbar_icon_casino`, `navbar_icon_sport`, `navbar_button_text_login`, `navbar_button_text_registro`, `navbar_button_background_login`, `navbar_button_background_registro`, `navbar_button_border_color`, `navbar_button_text_superior`, `navbar_button_background_superior`, `navbar_text_superior`, `navbar_button_deposito_background`, `navbar_button_deposito_text_color`, `navbar_button_deposito_border_color`, `navbar_button_deposito_píx_color_text`, `navbar_button_deposito_píx_background`, `navbar_button_deposito_píx_icon`, `navbar_button_carteira_background`, `navbar_button_carteira_text_color`, `navbar_button_carteira_border_color`, `navbar_perfil_text_color`, `navbar_perfil_background`, `navbar_perfil_icon_color`, `navbar_icon_promocoes_segunda_cor`, `navbar_perfil_icon_color_border`, `navbar_perfil_modal_icon_color`, `navbar_perfil_modal_text_modal`, `navbar_perfil_modal_background_modal`, `navbar_perfil_modal_hover_modal`, `sidebar_icons_background`, `home_background_button_banner`, `home_icon_color_button_banner`, `home_background_categorias`, `home_text_color_categorias`, `home_background_pesquisa`, `home_text_color_pesquisa`, `home_background_pesquisa_aviso`, `home_text_color_pesquisa_aviso`, `home_background_button_pesquisa`, `home_icon_color_button_pesquisa`, `home_background_button_vertodos`, `home_text_color_button_vertodos`, `home_background_button_jogar`, `home_text_color_button_jogar`, `home_icon_color_button_jogar`, `home_hover_jogar`, `home_text_color`, `home_background`, `home_background_input_pesquisa`, `home_border_color_input_pesquisa`, `home_icon_color_input_pesquisa`, `gamelist_background`, `gamelist_input_background`, `gamelist_input_text_color`, `gamelist_input_border_color`, `gamelist_text_color`, `gamelist_button_background`, `gamelist_button_text_color`, `gamelist_button_border_color`, `register_background`, `register_text_color`, `register_links_color`, `register_input_background`, `register_input_text_color`, `register_input_border_color`, `register_button_text_color`, `register_button_background`, `register_button_border_color`, `login_background`, `login_text_color`, `login_links_color`, `login_input_background`, `login_input_text_color`, `login_input_border_color`, `login_button_text_color`, `login_button_background`, `login_button_border_color`, `esqueci_background`, `esqueci_text_color`, `esqueci_input_background`, `esqueci_input_text_color`, `esqueci_input_border_color`, `esqueci_button_text_color`, `esqueci_button_background`, `esqueci_button_border_color`, `geral_icons_color`, `register_security_color`, `register_security_background`, `register_security_border_color`, `topo_icon_color`, `topo_button_text_color`, `topo_button_background`, `topo_button_border_color`, `affiliates_background`, `affiliates_sub_background`, `affiliates_text_color`, `affiliates_numero_color`, `affiliates_button_saque_background`, `affiliates_button_saque_text`, `affiliates_button_copie_background`, `affiliates_button_copie_text`, `affiliates_icom_color`, `carteira_button_background`, `carteira_button_text_color`, `carteira_button_border_color`, `carteira_icon_color`, `carteira_text_color`, `carteira_saldo_background`, `carteira_saldo_text_color`, `carteira_saldo_border_color`, `carteira_saldo_title_color`, `carteira_saldo_icon_color`, `carteira_saldo_number_color`, `carteira_saldo_button_deposito_background`, `carteira_saldo_button_saque_background`, `carteira_saldo_button_deposito_text_color`, `carteira_saldo_button_saque_text_color`, `carteira_deposito_background`, `carteira_deposito_contagem_background`, `carteira_deposito_contagem_text_color`, `carteira_deposito_contagem_number_color`, `carteira_deposito_contagem_quadrado_background`, `carteira_deposito_input_background`, `carteira_deposito_input_text_color`, `carteira_deposito_input_number_color`, `carteira_deposito_input_border_color`, `carteira_deposito_title_color`, `carteira_deposito_number_color`, `carteira_deposito_number_background`, `carteira_deposito_button_background`, `carteira_deposito_button_text_color`, `carteira_saque_background`, `carteira_saque_text_color`, `carteira_saque_number_color`, `carteira_saque_input_background`, `carteira_saque_input_text_color`, `carteira_saque_input_border_color`, `carteira_saque_button_text_color`, `carteira_saque_button_background`, `carteira_saque_icon_color`, `carteira_history_background`, `carteira_history_title_color`, `carteira_history_text_color`, `carteira_history_number_color`, `carteira_history_status_finalizado_color`, `carteira_history_status_finalizado_background`, `carteira_history_status_pedente_color`, `carteira_history_status_pedente_background`, `carteira_history_barra_color`, `carteira_history_barra_text_color`, `carteira_history_icon_color`, `carteira_background`, `carteira_saldo_pix_Texot_color`, `carteira_saldo_pix_sub_text_color`, `carteira_saldo_pix_button_background`, `carteira_saldo_pix_button_text_color`, `carteira_saldo_pix_input_background`, `carteira_saldo_pix_input_text_color`, `carteira_saldo_pix_border_color`, `carteira_saldo_pix_icon_color`, `carteira_saldo_pix_background`, `carteira_history_barra_background`, `promocoes_background`, `promocoes_title_color`, `promocoes_text_color`, `promocoes_sub_background`, `promocoes_button_background`, `promocoes_button_text_color`, `promocoes_pupup_background`, `promocoes_pupup_text_color`, `promocoes_icon_color`, `vips_background`, `vips_title_color`, `vips_text_color`, `vips_description_color`, `vips_button_background`, `vips_button_text_color`, `vips_progress_background`, `vips_progress_text_color`, `vips_progress_prenchimento_background`, `vips_icons_text_color`, `vips_icons_background`, `vips_icons_sub_text_color`, `vips_background_profile_vip`, `vips_icon_mover_color`, `vip_atual_background`, `vip_atual_text_color`, `vip_proximo_background`, `vip_proximo_text_color`, `missoes_background`, `missoes_sub_background`, `missoes_text_color`, `missoes_title_color`, `missoes_bonus_background`, `missoes_bonus_text_color`, `missoes_button_background`, `missoes_button_text_color`, `missoes_barraprogresso_background`, `missoes_barraprogresso_prenchimento_background`, `missoes_barraprogresso_text_color`, `menu_cell_background`, `menu_cell_text_color`, `background_geral`, `background_geral_text_color`, `carregando_background`, `carregando_text_color`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#ffffff00', '#ffffff00', '#ffffff00', '#ffe500 ', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff', '#ff0000', '#dbdbdb', '#004014', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '#ffffff00', '.25rem', NULL, NULL, NULL, '2024-01-01 17:36:03', '2024-12-20 04:46:37', NULL, 'uploads/90GXnUGnOtl7E6nSVlsj4IKqS6y1W3jYEGItCSlW.png', '01J9ZAM4RPSKNQW3N695GZ1DB6.avif', 'https://bulls777.app', '01J9ZAM4RR2A4E3PQ5M1A2CYH8.avif', 'https://bulls777.app', NULL, NULL, 'https://t.me/suporte', '01JA29TEJEY3BC59165XT38RQ2.png', '#e0ca00', '#ff0000', '#ff0000', '#ff0000', '01J8BASMD491WBV0X9E8DZ2NXS.png', '01J8BASMD5RF135J7NNXA1PKA8.png', '01J9Z8HDEMMZNSNMVATZ41EZDQ.png', '01J9ZA6MYNHCFFF03A3FC2FZ32.png', '01J8BDN5EFR25JQY7E0CZDXKDM.png', '01JBWQ7MDWBDR2Z4R37ZZETADV.png', NULL, '01JBWPYAV84HCBGBJAJRA6J73N.png', '01JBWPYAV84HCBGBJAJRA6J73P.png', '/storage/download/bet.apk', 'https://t.me/Telegram', 'https://t.me/Facebook', 'https://t.me/WhatsApp', 'https://t.me/Instagram', 'https://bulls777.app', 'https://bulls777.app', 'https://bulls777.app', 'https://t.me/Licença', '01JB0VP8GXSB4MHWHEABGGQF6V.png', '01JFH1BMSJR48G18RW2SSCDDFJ.png', '01JFH1BMSMEEP7W2ZVF8Y67HRA.png', '01JFH1BMSMEEP7W2ZVF8Y67HRB.png', '01JFH1BMSNXS5B5E2V3BP08A6X.png', '01JFH1BMSNXS5B5E2V3BP08A6Y.png', '01JA3RZZ2Y43HP6KSJ276F2QAX.webp', '01JA3RZZ2Y43HP6KSJ276F2QAY.webp', '01JA3RZZ2ZT66YA0X4B74K4P92.webp', '01JA3RZZ2ZT66YA0X4B74K4P93.webp', '01JA3RZZ2ZT66YA0X4B74K4P94.webp', '01JA3RZZ2ZT66YA0X4B74K4P95.webp', '01JA3RZZ2ZT66YA0X4B74K4P96.webp', '01JA3RXYJ9GJ7KP5E7J4MSFHKN.webp', '❤️Olá querido cliente! Para fornecer serviços de saque melhores e mais rápidos, certifique-se de vincular a conta PIX correta para evitar falhas de saque causadas pela incapacidade de processamento do seu sistema de informações de saque. Obrigado pela sua cooperação! ', 'Foi uma das primeiras plataformas legalizadas no                     Brasil operamos pelo número de solicitação SIGAP: 00446/2024 é autorizada e                     regulamentada pelo Governo de Coração é opera com a licença (89085669) emitido pa', '01JFH1BMSMEEP7W2ZVF8Y67HR9.png', '<div class=\"w-full relative\">\n    <div class=\"text-[var(--theme-text-color)] font-bold my-[20px] text-[22px] w-full min-h-[24px] text-center leading-[1.3]\">\n        <span class=\"w-full -mb-[2.58824px] pb-[-2.58824px] text-[22px] inline-block leading-[0] overflow-hidden\">\n            <span class=\"text-[14.9067px] sm:text-[22px] inline-block w-full\">\n                <span class=\"leading-[1.2] [overflow:initial] text-center overflow-ellipsis align-middle\" style=\"-webkit-line-clamp: 5;\">\n                    ? Seja bem-vindo a nossa plataforma ?\n                </span>\n            </span>\n        </span>\n    </div>\n    <div></div>\n    <div class=\"text-[var(--theme-text-color)] pb-[20px] sm:pb-0 sm:h-[405px] text-[14px] leading-[1.56] text-left w-full\">\n        <div class=\"w-full h-full px-[30px]\">\n            <div class=\"sm:h-full overflow-x-hidden overflow-y-scroll [scrollbar-width:none]\">\n                <div class=\"my-scrollbar-content\">\n                    <div class=\"D4IXpi08hh8lVGgzIBUz\">\n                        <div>\n                            <p class=\"mb-0\">\n                                ✈️Clique no canal:\n                                <a href=\"https://t.me/gerente_afiliadoschina\" target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Telegram</span>\n                                </a>\n                                <br>?Baixe o app e ganhe R$100:\n                                <a href=\"https://bulls777.app/storage/app/Bulls777.apk target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Baixar app<//span>\n                                </a>\n                                <br>❤️Convide amigos e ganhe até\n                                <span style=\"color: #ffeb00;\">mil</span>\n                                reais por dia.\n                                <br>?Seu Bônus em todos os depósito é\n                                <span style=\"color: #ffeb00;\">100%</span>\n                                <br>? CPA de convite:\n                                <span style=\"color: #ffeb00;\">R$ 10</span>\n                                por pessoa\n                                <br>? Convide amigos, compartilhe e ganhe dinheiro! Comissão\n                                <span style=\"color: #ffeb00;\"> até 50%</span>\n                            </p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n', '01JA5NSFNS236BMBTJMZWZW29G.png', '#08173f ', '#ffffff', '#bfbfbf', '#0073d6', '#ffffff', '#00bcd9', '#ffffff', '#ffffff', '#3b82f680', '#ffffff', '#fdffff0d', '#ffffff', '#323637', '#021c47', '#910099', '#996f00', '#249900', '#ffffff', '#ffffff', '#fffafa', '#ff0000', '#ffffff', '#ffffff', '#00c5e6', '#ffffff', '#021c47', '#ffffff', '#ffffff', '#c18620', '#ffffff', '#a8a8a8', '#ffffff', '#ffffff', '#002841', '#002841', '#03c6fc', '#000000000', '#000000000', '#000000000', '#03c6fc', '#ffffff', '#03c6fc', '#000000', '#ffe800', '#32bcad', '#fdffff1a', '#03c6fc', '#03c6fc', '#000000000', '#ffffff', '#000000000', '#000000', '#ee00ff', '#00c6ff', '#ffffff', '#000000', '#00fdff3d', '#020e23', '#03c6fc4a', '#ffffff', '#001b49', '#ffffff', '#000c20', '#ffffff', '#001841', '#ffffff', '#1e2124', '#03c6fc', '#002841', '#03c6fc', '#03c6fc', '#000c20', '#000c20', '#000000000', '#ffffff', '#000c20', '#323637', '#00ffcd00', '#ffffff', '#000c20', '#323637', '#ffffff', '#03c6fc', '#ffffff', '#03c6fc', '#000c20', '#03c6fc4a', '#000c20', '#ffffff', '#03c6fc', '#323637', '#ffffff', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#ffffff', '#03c6fc', '#323637', '#03c6fc', '#03c6fc', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#ffffff', '#323637', '#ffffff', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#03c6fc', '#03c6fc', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#000c20', '#323637', '#ffffff', '#0afffb', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#03c6fc', '#03c6fc', '#ffffff', '#ffffff', '#ffffff', '#03c6fc', '#191e23', '#ffffff', '#06bcee', '#ffffff', '#ffffff', '#06bcee', '#03c6fc', '#03c6fc', '#ffffff', '#ffffff', '#191e23', '#000000', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#000c20', '#03c6fc', '#03c6fc', '#ffffff', '#03c6fc', '#03c6fc', '#ffffff', '#191e23', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#ffffff', '#03c6fc', '#a400ff', '#191e23', '#ffffff', '#03c6fc', '#03c6fc', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#ffffff', '#03c6fc', '#021c47', '#ffffff', '#03c6fc', '#03c6fc', '#ffffff', '#ffffff', '#000c20', '#03c6fc', '#03c6fc', '#000c2e', '#000c20', '#191e23', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#ffffff', '#000c20', '#ffffff', '#ffffff', '#191e23', '#03c6fc', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#ffffff', '#ffffff', '#03c6fc', '#ffffff', '#000c20', '#03c6fc', '#545454', '#03c6fc', '#14e826', '#fcfcfc', '#07e3ed', '#ffffff', '#191e23', '#000c20', '#ffffff', '#03c6fc', '#00000000', '#ffffff', '#03c6fc', '#ffffff', '#353535ba', '#03c6fc', '#ffffff', '#021c47', '#ffffff', '#000c20', '#ffffff', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `proof` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `digito_pay`
--

CREATE TABLE `digito_pay` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `withdrawal_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ezzepay`
--

CREATE TABLE `ezzepay` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `withdrawal_id` int NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint UNSIGNED NOT NULL,
  `provider_id` int UNSIGNED NOT NULL,
  `game_server_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'inativo',
  `game_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `technology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'html5',
  `has_lobby` tinyint NOT NULL DEFAULT '0',
  `is_mobile` tinyint NOT NULL DEFAULT '0',
  `has_freespins` tinyint NOT NULL DEFAULT '0',
  `has_tables` tinyint NOT NULL DEFAULT '0',
  `only_demo` tinyint DEFAULT '0',
  `rtp` bigint NOT NULL DEFAULT '0',
  `distribution` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'play_fiver',
  `views` bigint NOT NULL DEFAULT '0',
  `is_featured` tinyint DEFAULT '0',
  `show_home` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(1, 1, 'inativo', '126', 'Fortune Tiger', '126', 'Slots', NULL, 'Games/Pgsoft/126.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 42, 1, 1, '2024-12-05 23:12:03', '2024-12-20 06:00:47'),
(2, 1, 'inativo', '98', 'Fortune Ox', '98', 'Slots', NULL, 'Games/Pgsoft/98.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2024-12-05 23:12:03', '2024-12-20 05:36:57'),
(3, 1, 'inativo', '68', 'Fortune Mouse', '68', 'Slots', NULL, 'Games/Pgsoft/68.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:03', '2024-12-20 05:37:01'),
(4, 1, 'inativo', '1543462', 'Fortune Rabbit', '1543462', 'Slots', NULL, 'Games/Pgsoft/1543462.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2024-12-05 23:12:03', '2024-12-20 05:37:07'),
(5, 16, 'inativo', '69', 'Pasaycen', '69', 'Slots', NULL, 'Games/Cq9/69.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:14'),
(6, 1, 'inativo', '40', 'Jungle Delight', '40', 'Slots', NULL, 'Games/Pgsoft/40.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:03', '2024-12-20 05:38:14'),
(7, 1, 'inativo', '1695365', 'Fortune Dragon', '1695365', 'Slots', NULL, 'Games/Pgsoft/1695365.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 1, 1, '2024-12-05 23:12:03', '2024-12-20 05:38:23'),
(8, 1, 'inativo', '1738001', 'Chicky Run', '1738001', 'Slots', NULL, 'Games/Pgsoft/1738001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:03', '2024-12-20 05:38:32'),
(9, 1, 'inativo', '42', 'Ganesha Gold', '42', 'Slots', NULL, 'Games/Pgsoft/42.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:03', '2024-12-20 05:38:37'),
(10, 1, 'inativo', '104', 'Wild Bandito', '104', 'Slots', NULL, 'Games/Pgsoft/104.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:03', '2024-12-20 05:40:32'),
(11, 1, 'inativo', 'piggy-gold', 'Piggy Gold', 'piggy-gold', 'Slots', NULL, 'Games/Pgsoft/piggy-gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(12, 1, 'inativo', 'double-fortune', 'Double Fortune', 'double-fortune', 'Slots', NULL, 'Games/Pgsoft/double-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(13, 1, 'inativo', 'the-great-icescape', 'The Great Icescape', 'the-great-icescape', 'Slots', NULL, 'Games/Pgsoft/the-great-icescape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(14, 1, 'inativo', 'captains-bounty', 'Captain\'s Bounty', 'captains-bounty', 'Slots', NULL, 'Games/Pgsoft/captains-bounty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(15, 1, 'inativo', 'dragon-hatch', 'Dragon Hatch', 'dragon-hatch', 'Slots', NULL, 'Games/Pgsoft/dragon-hatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(16, 1, 'inativo', 'vampires-charm', 'Vampire\'s Charm', 'vampires-charm', 'Slots', NULL, 'Games/Pgsoft/vampires-charm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(17, 1, 'inativo', 'gem-saviour-conquest', 'Gem Saviour Conquest', 'gem-saviour-conquest', 'Slots', NULL, 'Games/Pgsoft/gem-saviour-conquest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(18, 1, 'inativo', 'mahjong-ways', 'Mahjong Ways', 'mahjong-ways', 'Slots', NULL, 'Games/Pgsoft/mahjong-ways.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(19, 1, 'inativo', 'candy-burst', 'Candy Burst', 'candy-burst', 'Slots', NULL, 'Games/Pgsoft/candy-burst.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(20, 1, 'inativo', 'mahjong-ways2', 'Mahjong Ways 2', 'mahjong-ways2', 'Slots', NULL, 'Games/Pgsoft/mahjong-ways2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(21, 1, 'inativo', 'ganesha-fortune', 'Ganesha Fortune', 'ganesha-fortune', 'Slots', NULL, 'Games/Pgsoft/ganesha-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(22, 1, 'inativo', 'phoenix-rises', 'Phoenix Rises', 'phoenix-rises', 'Slots', NULL, 'Games/Pgsoft/phoenix-rises.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(23, 1, 'inativo', 'wild-fireworks', 'Wild Fireworks', 'wild-fireworks', 'Slots', NULL, 'Games/Pgsoft/wild-fireworks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(24, 1, 'inativo', 'galactic-gems', 'Galactic Gems', 'galactic-gems', 'Slots', NULL, 'Games/Pgsoft/galactic-gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(25, 1, 'inativo', 'treasures-aztec', 'Treasures of Aztec', 'treasures-aztec', 'Slots', NULL, 'Games/Pgsoft/treasures-aztec.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(26, 1, 'inativo', 'jewels-prosper', 'Jewels of Prosperity', 'jewels-prosper', 'Slots', NULL, 'Games/Pgsoft/jewels-prosper.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(27, 1, 'inativo', 'gdn-ice-fire', 'Guardians of Ice and Fire', 'gdn-ice-fire', 'Slots', NULL, 'Games/Pgsoft/gdn-ice-fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(28, 1, 'inativo', 'bali-vacation', 'Bali Vacation', 'bali-vacation', 'Slots', NULL, 'Games/Pgsoft/bali-vacation.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(29, 1, 'inativo', 'majestic-ts', 'Majestic Treasures', 'majestic-ts', 'Slots', NULL, 'Games/Pgsoft/majestic-ts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(30, 1, 'inativo', 'jack-frosts', 'Jack Frost\'s Winter', 'jack-frosts', 'Slots', NULL, 'Games/Pgsoft/jack-frosts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(31, 1, 'inativo', 'candy-bonanza', 'Candy Bonanza', 'candy-bonanza', 'Slots', NULL, 'Games/Pgsoft/candy-bonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(32, 1, 'inativo', 'heist-stakes', 'Heist Stakes', 'heist-stakes', 'Slots', NULL, 'Games/Pgsoft/heist-stakes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(33, 1, 'inativo', 'lgd-monkey-kg', 'Legendary Monkey King', 'lgd-monkey-kg', 'Slots', NULL, 'Games/Pgsoft/lgd-monkey-kg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(34, 1, 'inativo', 'buffalo-win', 'Buffalo Win', 'buffalo-win', 'Slots', NULL, 'Games/Pgsoft/buffalo-win.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(35, 1, 'inativo', 'crypt-fortune', 'Raider Jane\'s Crypt of Fortune', 'crypt-fortune', 'Slots', NULL, 'Games/Pgsoft/crypt-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(36, 1, 'inativo', 'emoji-riches', 'Emoji Riches', 'emoji-riches', 'Slots', NULL, 'Games/Pgsoft/emoji-riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(37, 1, 'inativo', 'sprmkt-spree', 'Supermarket Spree', 'sprmkt-spree', 'Slots', NULL, 'Games/Pgsoft/sprmkt-spree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(38, 1, 'inativo', 'spirit-wonder', 'Spirited Wonders', 'spirit-wonder', 'Slots', NULL, 'Games/Pgsoft/spirit-wonder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(39, 1, 'inativo', 'dest-sun-moon', 'Destiny of Sun & Moon', 'dest-sun-moon', 'Slots', NULL, 'Games/Pgsoft/dest-sun-moon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(40, 1, 'inativo', 'garuda-gems', 'Garuda Gems', 'garuda-gems', 'Slots', NULL, 'Games/Pgsoft/garuda-gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(41, 1, 'inativo', 'rooster-rbl', 'Rooster Rumble', 'rooster-rbl', 'Slots', NULL, 'Games/Pgsoft/rooster-rbl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(42, 1, 'inativo', 'battleground', 'Battleground Royale', 'battleground', 'Slots', NULL, 'Games/Pgsoft/battleground.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(43, 1, 'inativo', 'btrfly-blossom', 'Butterfly Blossom', 'btrfly-blossom', 'Slots', NULL, 'Games/Pgsoft/btrfly-blossom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(44, 1, 'inativo', 'prosper-ftree', 'Prosperity Fortune Tree', 'prosper-ftree', 'Slots', NULL, 'Games/Pgsoft/prosper-ftree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(45, 1, 'inativo', 'asgardian-rs', 'Asgardian Rising', 'asgardian-rs', 'Slots', NULL, 'Games/Pgsoft/asgardian-rs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(46, 1, 'inativo', 'alchemy-gold', 'Alchemy Gold', 'alchemy-gold', 'Slots', NULL, 'Games/Pgsoft/alchemy-gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(47, 1, 'inativo', 'diner-delights', 'Diner Delights', 'diner-delights', 'Slots', NULL, 'Games/Pgsoft/diner-delights.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(48, 1, 'inativo', 'midas-fortune', 'Midas Fortune', 'midas-fortune', 'Slots', NULL, 'Games/Pgsoft/midas-fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(49, 1, 'inativo', 'bakery-bonanza', 'Bakery Bonanza', 'bakery-bonanza', 'Slots', NULL, 'Games/Pgsoft/bakery-bonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(50, 1, 'inativo', 'songkran-spl', 'Songkran Splash', 'songkran-spl', 'Slots', NULL, 'Games/Pgsoft/songkran-spl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(51, 1, 'inativo', 'dragon-hatch2', 'Dragon Hatch2', 'dragon-hatch2', 'Slots', NULL, 'Games/Pgsoft/dragon-hatch2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(52, 1, 'inativo', 'cruise-royale', 'Cruise Royale', 'cruise-royale', 'Slots', NULL, 'Games/Pgsoft/cruise-royale.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(53, 1, 'inativo', '1508783', 'Wild Ape', '1508783', 'Slots', NULL, 'Games/Pgsoft/1508783.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2024-12-05 23:12:04', '2024-12-20 05:40:45'),
(54, 1, 'inativo', 'spr-golf-drive', 'Super Golf Drive', 'spr-golf-drive', 'Slots', NULL, 'Games/Pgsoft/spr-golf-drive.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(55, 1, 'inativo', 'anubis-wrath', 'Anubis Wrath', 'anubis-wrath', 'Slots', NULL, 'Games/Pgsoft/anubis-wrath.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(56, 1, 'inativo', '1635221', 'Zombie Outbreak', '1635221', 'Slots', NULL, 'Games/Pgsoft/1635221.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 1, 1, '2024-12-05 23:12:04', '2024-12-20 05:49:44'),
(57, 1, 'inativo', '1682240', 'Cash Mania', '1682240', 'Slots', NULL, 'Games/Pgsoft/1682240.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 1, 1, '2024-12-05 23:12:04', '2024-12-20 05:40:57'),
(58, 1, 'inativo', 'lucky-neko', 'Lucky Neko', 'lucky-neko', 'Slots', NULL, 'Games/Pgsoft/lucky-neko.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(59, 1, 'inativo', 'wild-bounty-sd', 'Wild Bounty Showdown', 'wild-bounty-sd', 'Slots', NULL, 'Games/Pgsoft/wild-bounty-sd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(60, 1, 'inativo', '9873', 'Hip Hop Panda', '9873', 'Slots', NULL, 'Games/Pgsoft/9873.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-12-05 23:12:04', '2024-12-13 00:29:26'),
(61, 1, 'inativo', '9875', 'Mr. Hallow-Win!', '9875', 'Slots', NULL, 'Games/Pgsoft/9875.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(62, 1, 'inativo', '9872', 'Baccarat Deluxe', '9872', 'Slots', NULL, 'Games/Pgsoft/9872.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(63, 1, 'inativo', '9947', 'Speed Winner', '9947', 'Slots', NULL, 'Games/Pgsoft/9947.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(64, 1, 'inativo', '9862', 'Fortune Gods', '9862', 'Slots', NULL, 'Games/Pgsoft/9862.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(65, 2, 'inativo', 'vswaysbook', 'Book of Golden Sands', 'vswaysbook', 'Slots', NULL, 'Games/Pragmatic/vswaysbook.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(66, 2, 'inativo', 'vs20mparty', 'Wild Hop and Drop', 'vs20mparty', 'Slots', NULL, 'Games/Pragmatic/vs20mparty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(67, 2, 'inativo', 'vs10snakeeyes', 'Snakes e Ladders - Snake Eyes', 'vs10snakeeyes', 'Slots', NULL, 'Games/Pragmatic/vs10snakeeyes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(68, 2, 'inativo', 'vs5strh', 'Striking Hot 5', 'vs5strh', 'Slots', NULL, 'Games/Pragmatic/vs5strh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(69, 2, 'inativo', 'vswayslofhero', 'Legend of Heroes', 'vswayslofhero', 'Slots', NULL, 'Games/Pragmatic/vswayslofhero.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(70, 2, 'inativo', 'vs20muertos', 'Muertos Multiplier Megaways', 'vs20muertos', 'Slots', NULL, 'Games/Pragmatic/vs20muertos.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(71, 2, 'inativo', 'vs10crownfire', 'Crown of Fire', 'vs10crownfire', 'Slots', NULL, 'Games/Pragmatic/vs10crownfire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(72, 2, 'inativo', 'vswaysstrwild', 'Candy Stars', 'vswaysstrwild', 'Slots', NULL, 'Games/Pragmatic/vswaysstrwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(73, 2, 'inativo', 'vs20trswild2', 'Black Bull', 'vs20trswild2', 'Slots', NULL, 'Games/Pragmatic/vs20trswild2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(74, 2, 'inativo', 'vswaysfltdrg', 'Floating Dragon Hold e Spin Megaways', 'vswaysfltdrg', 'Slots', NULL, 'Games/Pragmatic/vswaysfltdrg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(75, 2, 'inativo', 'vs10mmm', 'Magic Money Maze', 'vs10mmm', 'Slots', NULL, 'Games/Pragmatic/vs10mmm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(76, 2, 'inativo', 'vs20underground', 'Down the Rails', 'vs20underground', 'Slots', NULL, 'Games/Pragmatic/vs20underground.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(77, 2, 'inativo', 'vs20wolfie', 'Greedy Wolf', 'vs20wolfie', 'Slots', NULL, 'Games/Pragmatic/vs20wolfie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(78, 2, 'inativo', 'vs5firehot', 'Fire Hot 5', 'vs5firehot', 'Slots', NULL, 'Games/Pragmatic/vs5firehot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(79, 2, 'inativo', 'vs40firehot', 'Fire Hot 40', 'vs40firehot', 'Slots', NULL, 'Games/Pragmatic/vs40firehot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(80, 2, 'inativo', 'vs20fh', 'Fire Hot 20', 'vs20fh', 'Slots', NULL, 'Games/Pragmatic/vs20fh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(81, 2, 'inativo', 'vs100firehot', 'Fire Hot 100', 'vs100firehot', 'Slots', NULL, 'Games/Pragmatic/vs100firehot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(82, 2, 'inativo', 'vs10txbigbass', 'Big Bass Splash', 'vs10txbigbass', 'Slots', NULL, 'Games/Pragmatic/vs10txbigbass.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(83, 2, 'inativo', 'vs20octobeer', 'Octobeer Fortunes', 'vs20octobeer', 'Slots', NULL, 'Games/Pragmatic/vs20octobeer.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(84, 2, 'inativo', 'vs40hotburnx', 'Hot To Burn Extreme', 'vs40hotburnx', 'Slots', NULL, 'Games/Pragmatic/vs40hotburnx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(85, 2, 'inativo', 'vs243ckemp', 'Cheeky Emperor', 'vs243ckemp', 'Slots', NULL, 'Games/Pragmatic/vs243ckemp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(86, 2, 'inativo', 'vswaysjkrdrop', 'Tropical Tiki', 'vswaysjkrdrop', 'Slots', NULL, 'Games/Pragmatic/vswaysjkrdrop.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(87, 2, 'inativo', 'vs5sh', 'Shining Hot 5', 'vs5sh', 'Slots', NULL, 'Games/Pragmatic/vs5sh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(88, 2, 'inativo', 'vs40sh', 'Shining Hot 40', 'vs40sh', 'Slots', NULL, 'Games/Pragmatic/vs40sh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(89, 2, 'inativo', 'vs20sh', 'Shining Hot 20', 'vs20sh', 'Slots', NULL, 'Games/Pragmatic/vs20sh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(90, 2, 'inativo', 'vs10coffee', 'Coffee Wild', 'vs10coffee', 'Slots', NULL, 'Games/Pragmatic/vs10coffee.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(91, 2, 'inativo', 'vs100sh', 'Shining Hot 100', 'vs100sh', 'Slots', NULL, 'Games/Pragmatic/vs100sh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(92, 2, 'inativo', 'vs10egrich', 'Queen of Gods', 'vs10egrich', 'Slots', NULL, 'Games/Pragmatic/vs10egrich.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(93, 2, 'inativo', 'vs243koipond', 'Koi Pond', 'vs243koipond', 'Slots', NULL, 'Games/Pragmatic/vs243koipond.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(94, 2, 'inativo', 'vs40samurai3', 'Rise of Samurai 3', 'vs40samurai3', 'Slots', NULL, 'Games/Pragmatic/vs40samurai3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(95, 2, 'inativo', 'vs40cosmiccash', 'Cosmic Cash', 'vs40cosmiccash', 'Slots', NULL, 'Games/Pragmatic/vs40cosmiccash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(96, 2, 'inativo', 'vs25bomb', 'Bomb Bonanza', 'vs25bomb', 'Slots', NULL, 'Games/Pragmatic/vs25bomb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(97, 2, 'inativo', 'vs1024mahjpanda', 'Mahjong Panda', 'vs1024mahjpanda', 'Slots', NULL, 'Games/Pragmatic/vs1024mahjpanda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(98, 17, 'inativo', 'vs10spiritadv', 'Spirit of Adventure', 'vs10spiritadv', 'Slots', NULL, 'Games/Reelkingdom/vs10spiritadv.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:15'),
(99, 2, 'inativo', 'vs10firestrike2', 'Fire Strike 2', 'vs10firestrike2', 'Slots', NULL, 'Games/Pragmatic/vs10firestrike2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(100, 2, 'inativo', 'vs40cleoeye', 'Eye of Cleopatra', 'vs40cleoeye', 'Slots', NULL, 'Games/Pragmatic/vs40cleoeye.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(101, 2, 'inativo', 'vs20gobnudge', 'Goblin Heist Powernudge', 'vs20gobnudge', 'Slots', NULL, 'Games/Pragmatic/vs20gobnudge.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(102, 2, 'inativo', 'vs20stickysymbol', 'The Great Stick-up', 'vs20stickysymbol', 'Slots', NULL, 'Games/Pragmatic/vs20stickysymbol.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(103, 2, 'inativo', 'vswayszombcarn', 'Zombie Carnival', 'vswayszombcarn', 'Slots', NULL, 'Games/Pragmatic/vswayszombcarn.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(104, 2, 'inativo', 'vs50northgard', 'North Guardians', 'vs50northgard', 'Slots', NULL, 'Games/Pragmatic/vs50northgard.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(105, 2, 'inativo', 'vs20sugarrush', 'Sugar Rush', 'vs20sugarrush', 'Slots', NULL, 'Games/Pragmatic/vs20sugarrush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(106, 2, 'inativo', 'vs20cleocatra', 'Cleocatra', 'vs20cleocatra', 'Slots', NULL, 'Games/Pragmatic/vs20cleocatra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(107, 17, 'inativo', 'vs5littlegem', 'Little Gem Hold and Spin', 'vs5littlegem', 'Slots', NULL, 'Games/Reelkingdom/vs5littlegem.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:15'),
(108, 2, 'inativo', 'vs20drtgold', 'Drill That Gold', 'vs20drtgold', 'Slots', NULL, 'Games/Pragmatic/vs20drtgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(109, 2, 'inativo', 'vs20mustanggld2', 'Clover Gold', 'vs20mustanggld2', 'Slots', NULL, 'Games/Pragmatic/vs20mustanggld2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(110, 2, 'inativo', 'vs10chkchase', 'Chicken Chase', 'vs10chkchase', 'Slots', NULL, 'Games/Pragmatic/vs10chkchase.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(111, 2, 'inativo', 'vswayswildwest', 'Wild West Gold Megaways', 'vswayswildwest', 'Slots', NULL, 'Games/Pragmatic/vswayswildwest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(112, 2, 'inativo', 'vs10bookazteck', 'Book of Aztec King', 'vs10bookazteck', 'Slots', NULL, 'Games/Pragmatic/vs10bookazteck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(113, 2, 'inativo', 'vs50mightra', 'Might of Ra', 'vs50mightra', 'Slots', NULL, 'Games/Pragmatic/vs50mightra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:04', '2024-12-05 23:12:04'),
(114, 2, 'inativo', 'vs25bullfiesta', 'Bull Fiesta', 'vs25bullfiesta', 'Slots', NULL, 'Games/Pragmatic/vs25bullfiesta.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(115, 2, 'inativo', 'vs20rainbowg', 'Rainbow Gold', 'vs20rainbowg', 'Slots', NULL, 'Games/Pragmatic/vs20rainbowg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(116, 17, 'inativo', 'vs10tictac', 'Tic Tac Take', 'vs10tictac', 'Slots', NULL, 'Games/Reelkingdom/vs10tictac.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(117, 2, 'inativo', 'vs243discolady', 'Disco Lady', 'vs243discolady', 'Slots', NULL, 'Games/Pragmatic/vs243discolady.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(118, 17, 'inativo', 'vs243queenie', 'Queenie', 'vs243queenie', 'Slots', NULL, 'Games/Reelkingdom/vs243queenie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(119, 2, 'inativo', 'vs20farmfest', 'Barn Festival', 'vs20farmfest', 'Slots', NULL, 'Games/Pragmatic/vs20farmfest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(120, 2, 'inativo', 'vs20bchprty', 'Wild Beach Party', 'vs20bchprty', 'Slots', NULL, 'Games/Pragmatic/vs20bchprty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(121, 2, 'inativo', 'vs20ultim5', 'The Ultimate 5', 'vs20ultim5', 'Slots', NULL, 'Games/Pragmatic/vs20ultim5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(122, 2, 'inativo', 'vs25copsrobbers', 'Cash Patrol', 'vs25copsrobbers', 'Slots', NULL, 'Games/Pragmatic/vs25copsrobbers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(123, 2, 'inativo', 'vs20colcashzone', 'Colossal Cash Zone', 'vs20colcashzone', 'Slots', NULL, 'Games/Pragmatic/vs20colcashzone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(124, 17, 'inativo', 'vs20rockvegas', 'Rock Vegas Mega Hold e Spin', 'vs20rockvegas', 'Slots', NULL, 'Games/Reelkingdom/vs20rockvegas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(125, 2, 'inativo', 'vs20superx', 'Super X(tm)', 'vs20superx', 'Slots', NULL, 'Games/Pragmatic/vs20superx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(126, 2, 'inativo', 'vswayscryscav', 'Crystal Caverns Megaways(tm)', 'vswayscryscav', 'Slots', NULL, 'Games/Pragmatic/vswayscryscav.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(127, 2, 'inativo', 'vs20smugcove', 'Smugglers Cove(tm)', 'vs20smugcove', 'Slots', NULL, 'Games/Pragmatic/vs20smugcove.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(128, 2, 'inativo', 'vs4096magician', 'Magician s Secrets(tm)', 'vs4096magician', 'Slots', NULL, 'Games/Pragmatic/vs4096magician.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(129, 2, 'inativo', 'vs40wanderw', 'Wild Depths(tm)', 'vs40wanderw', 'Slots', NULL, 'Games/Pragmatic/vs40wanderw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(130, 2, 'inativo', 'vswaysxjuicy', 'Extra Juicy Megaways(tm)', 'vswaysxjuicy', 'Slots', NULL, 'Games/Pragmatic/vswaysxjuicy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(131, 17, 'inativo', 'vs25goldparty', 'Gold Party(r)', 'vs25goldparty', 'Slots', NULL, 'Games/Reelkingdom/vs25goldparty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(132, 2, 'inativo', 'vs10runes', 'Gates of Valhalla(tm)', 'vs10runes', 'Slots', NULL, 'Games/Pragmatic/vs10runes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(133, 2, 'inativo', 'vs20amuleteg', 'Fortune of Giza(tm)', 'vs20amuleteg', 'Slots', NULL, 'Games/Pragmatic/vs20amuleteg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(134, 2, 'inativo', 'vs25tigeryear', 'New Year Tiger Treasures (tm)', 'vs25tigeryear', 'Slots', NULL, 'Games/Pragmatic/vs25tigeryear.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(135, 2, 'inativo', 'vs243empcaishen', 'Emperor Caishen', 'vs243empcaishen', 'Slots', NULL, 'Games/Pragmatic/vs243empcaishen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(136, 2, 'inativo', 'vs20pbonanza', 'Pyramid Bonanza', 'vs20pbonanza', 'Slots', NULL, 'Games/Pragmatic/vs20pbonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(137, 2, 'inativo', 'vs20trsbox', 'Treasure Wild', 'vs20trsbox', 'Slots', NULL, 'Games/Pragmatic/vs20trsbox.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(138, 2, 'inativo', 'vs243chargebull', 'Raging Bull', 'vs243chargebull', 'Slots', NULL, 'Games/Pragmatic/vs243chargebull.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(139, 2, 'inativo', 'vswaysbankbonz', 'Cash Bonanza', 'vswaysbankbonz', 'Slots', NULL, 'Games/Pragmatic/vswaysbankbonz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(140, 2, 'inativo', 'vs576hokkwolf', 'Hokkaido Wolf', 'vs576hokkwolf', 'Slots', NULL, 'Games/Pragmatic/vs576hokkwolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(141, 2, 'inativo', 'vs20phoenixf', 'Phoenix Forge', 'vs20phoenixf', 'Slots', NULL, 'Games/Pragmatic/vs20phoenixf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(142, 2, 'inativo', 'vswaysaztecking', 'Aztec King Megaways', 'vswaysaztecking', 'Slots', NULL, 'Games/Pragmatic/vswaysaztecking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(143, 17, 'inativo', 'vs10luckcharm', 'Lucky Grace And Charm', 'vs10luckcharm', 'Slots', NULL, 'Games/Reelkingdom/vs10luckcharm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(144, 2, 'inativo', 'vswayselements', 'Elemental Gems Megaways', 'vswayselements', 'Slots', NULL, 'Games/Pragmatic/vswayselements.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(145, 2, 'inativo', 'vswayschilheat', 'Chilli Heat Megaways', 'vswayschilheat', 'Slots', NULL, 'Games/Pragmatic/vswayschilheat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(146, 2, 'inativo', 'vs20magicpot', 'The Magic Cauldron - Enchanted Brew', 'vs20magicpot', 'Slots', NULL, 'Games/Pragmatic/vs20magicpot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(147, 17, 'inativo', 'vs10amm', 'The Amazing Money Machine', 'vs10amm', 'Slots', NULL, 'Games/Reelkingdom/vs10amm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(148, 2, 'inativo', 'vs117649starz', 'Starz Megaways', 'vs117649starz', 'Slots', NULL, 'Games/Pragmatic/vs117649starz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(149, 2, 'inativo', 'vs10wildtut', 'Mysterious Egypt', 'vs10wildtut', 'Slots', NULL, 'Games/Pragmatic/vs10wildtut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(150, 17, 'inativo', 'vs10eyestorm', 'Eye of the Storm', 'vs10eyestorm', 'Slots', NULL, 'Games/Reelkingdom/vs10eyestorm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(151, 2, 'inativo', 'vs25gldox', 'Golden Ox', 'vs25gldox', 'Slots', NULL, 'Games/Pragmatic/vs25gldox.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(152, 2, 'inativo', 'vs40voodoo', 'Voodoo Magic', 'vs40voodoo', 'Slots', NULL, 'Games/Pragmatic/vs40voodoo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(153, 2, 'inativo', 'vs20bonzgold', 'Bonanza Gold', 'vs20bonzgold', 'Slots', NULL, 'Games/Pragmatic/vs20bonzgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(154, 2, 'inativo', 'vs10mayangods', 'John Hunter and the Mayan Gods', 'vs10mayangods', 'Slots', NULL, 'Games/Pragmatic/vs10mayangods.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(155, 2, 'inativo', 'vs1024dtiger', 'The Dragon Tiger', 'vs1024dtiger', 'Slots', NULL, 'Games/Pragmatic/vs1024dtiger.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(156, 2, 'inativo', 'vs20xmascarol', 'Christmas Carol Megaways', 'vs20xmascarol', 'Slots', NULL, 'Games/Pragmatic/vs20xmascarol.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(157, 2, 'inativo', 'vs10goldfish', 'Fishin Reels', 'vs10goldfish', 'Slots', NULL, 'Games/Pragmatic/vs10goldfish.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(158, 17, 'inativo', 'vs25bkofkngdm', 'Book of Kingdoms', 'vs25bkofkngdm', 'Slots', NULL, 'Games/Reelkingdom/vs25bkofkngdm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(159, 2, 'inativo', 'vs20goldfever', 'Gems Bonanza', 'vs20goldfever', 'Slots', NULL, 'Games/Pragmatic/vs20goldfever.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(160, 2, 'inativo', 'vs25walker', 'Wild Walker', 'vs25walker', 'Slots', NULL, 'Games/Pragmatic/vs25walker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(161, 2, 'inativo', 'vs25samurai', 'Rise of Samurai', 'vs25samurai', 'Slots', NULL, 'Games/Pragmatic/vs25samurai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(162, 2, 'inativo', 'vswayshive', 'Star Bounty', 'vswayshive', 'Slots', NULL, 'Games/Pragmatic/vswayshive.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(163, 2, 'inativo', 'vswayswerewolf', 'Curse of the Werewolf Megaways', 'vswayswerewolf', 'Slots', NULL, 'Games/Pragmatic/vswayswerewolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(164, 2, 'inativo', 'vs9aztecgemsdx', 'Aztec Gems Deluxe', 'vs9aztecgemsdx', 'Slots', NULL, 'Games/Pragmatic/vs9aztecgemsdx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(165, 2, 'inativo', 'vs20gorilla', 'Jungle Gorilla', 'vs20gorilla', 'Slots', NULL, 'Games/Pragmatic/vs20gorilla.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:05', '2024-12-20 05:43:04'),
(166, 2, 'inativo', 'vs40streetracer', 'Street Racer', 'vs40streetracer', 'Slots', NULL, 'Games/Pragmatic/vs40streetracer.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(167, 2, 'inativo', 'vs1fufufu', 'Fu Fu Fu', 'vs1fufufu', 'Slots', NULL, 'Games/Pragmatic/vs1fufufu.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(168, 2, 'inativo', 'vs1600drago', 'Drago - Jewels of Fortune', 'vs1600drago', 'Slots', NULL, 'Games/Pragmatic/vs1600drago.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(169, 2, 'inativo', 'vs1money', 'Money Money Money', 'vs1money', 'Slots', NULL, 'Games/Pragmatic/vs1money.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(170, 2, 'inativo', 'vs20bl', 'Busy Bees', 'vs20bl', 'Slots', NULL, 'Games/Pragmatic/vs20bl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(171, 2, 'inativo', 'vs40beowulf', 'Beowulf', 'vs40beowulf', 'Slots', NULL, 'Games/Pragmatic/vs40beowulf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(172, 2, 'inativo', 'vs4096jurassic', 'Jurassic Giants', 'vs4096jurassic', 'Slots', NULL, 'Games/Pragmatic/vs4096jurassic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(173, 2, 'inativo', 'vs3train', 'Gold Train', 'vs3train', 'Slots', NULL, 'Games/Pragmatic/vs3train.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(174, 2, 'inativo', 'vs9hotroll', 'Hot Chilli', 'vs9hotroll', 'Slots', NULL, 'Games/Pragmatic/vs9hotroll.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(175, 2, 'inativo', 'vs25queenofgold', 'Queen of Gold', 'vs25queenofgold', 'Slots', NULL, 'Games/Pragmatic/vs25queenofgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(176, 2, 'inativo', 'vs5spjoker', 'Super Joker', 'vs5spjoker', 'Slots', NULL, 'Games/Pragmatic/vs5spjoker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(177, 2, 'inativo', 'vs20egypttrs', 'Egyptian Fortunes', 'vs20egypttrs', 'Slots', NULL, 'Games/Pragmatic/vs20egypttrs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(178, 2, 'inativo', 'vs18mashang', 'Treasure Horse', 'vs18mashang', 'Slots', NULL, 'Games/Pragmatic/vs18mashang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(179, 2, 'inativo', 'vs50chinesecharms', 'Lucky Dragons', 'vs50chinesecharms', 'Slots', NULL, 'Games/Pragmatic/vs50chinesecharms.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:05', '2024-12-20 05:43:12'),
(180, 2, 'inativo', 'vs7monkeys', '7 Monkeys', 'vs7monkeys', 'Slots', NULL, 'Games/Pragmatic/vs7monkeys.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(181, 2, 'inativo', 'vs25sea', 'Great Reef', 'vs25sea', 'Slots', NULL, 'Games/Pragmatic/vs25sea.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(182, 2, 'inativo', 'vs20leprechaun', 'Leprechaun Song', 'vs20leprechaun', 'Slots', NULL, 'Games/Pragmatic/vs20leprechaun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(183, 2, 'inativo', 'vs25dwarves_new', 'Dwarven Gold Deluxe', 'vs25dwarves_new', 'Slots', NULL, 'Games/Pragmatic/vs25dwarves_new.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(184, 17, 'inativo', 'vs5hotburn', 'Hot to burn', 'vs5hotburn', 'Slots', NULL, 'Games/Reelkingdom/vs5hotburn.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:15'),
(185, 2, 'inativo', 'vs9chen', 'Master Chen s Fortune', 'vs9chen', 'Slots', NULL, 'Games/Pragmatic/vs9chen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(186, 2, 'inativo', 'vs1tigers', 'Triple Tigers', 'vs1tigers', 'Slots', NULL, 'Games/Pragmatic/vs1tigers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(187, 2, 'inativo', 'vs20godiva', 'Lady Godiva', 'vs20godiva', 'Slots', NULL, 'Games/Pragmatic/vs20godiva.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(188, 2, 'inativo', 'vs9madmonkey', 'Monkey Madness', 'vs9madmonkey', 'Slots', NULL, 'Games/Pragmatic/vs9madmonkey.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(189, 2, 'inativo', 'vs50kingkong', 'Mighty Kong', 'vs50kingkong', 'Slots', NULL, 'Games/Pragmatic/vs50kingkong.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(190, 2, 'inativo', 'vs40frrainbow', 'Fruit Rainbow', 'vs40frrainbow', 'Slots', NULL, 'Games/Pragmatic/vs40frrainbow.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(191, 2, 'inativo', 'vs25newyear', 'Lucky New Year', 'vs25newyear', 'Slots', NULL, 'Games/Pragmatic/vs25newyear.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(192, 2, 'inativo', 'vs40madwheel', 'The Wild Machine', 'vs40madwheel', 'Slots', NULL, 'Games/Pragmatic/vs40madwheel.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(193, 2, 'inativo', 'vs5trdragons', 'Triple Dragons', 'vs5trdragons', 'Slots', NULL, 'Games/Pragmatic/vs5trdragons.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(194, 2, 'inativo', 'vs7776aztec', 'Aztec Bonanza', 'vs7776aztec', 'Slots', NULL, 'Games/Pragmatic/vs7776aztec.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(195, 2, 'inativo', 'vs50hercules', 'Hercules Son of Zeus', 'vs50hercules', 'Slots', NULL, 'Games/Pragmatic/vs50hercules.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(196, 2, 'inativo', 'vs25journey', 'Journey to the West', 'vs25journey', 'Slots', NULL, 'Games/Pragmatic/vs25journey.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(197, 2, 'inativo', 'vs20chicken', 'The Great Chicken Escape', 'vs20chicken', 'Slots', NULL, 'Games/Pragmatic/vs20chicken.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(198, 2, 'inativo', 'vs1fortunetree', 'Tree of Riches', 'vs1fortunetree', 'Slots', NULL, 'Games/Pragmatic/vs1fortunetree.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(199, 2, 'inativo', 'vs20wildpix', 'Wild Pixies', 'vs20wildpix', 'Slots', NULL, 'Games/Pragmatic/vs20wildpix.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(200, 2, 'inativo', 'vs15fairytale', 'Fairytale Fortune', 'vs15fairytale', 'Slots', NULL, 'Games/Pragmatic/vs15fairytale.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(201, 2, 'inativo', 'vs20santa', 'Santa', 'vs20santa', 'Slots', NULL, 'Games/Pragmatic/vs20santa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(202, 2, 'inativo', 'vs10vampwolf', 'Vampires vs Wolves', 'vs10vampwolf', 'Slots', NULL, 'Games/Pragmatic/vs10vampwolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(203, 2, 'inativo', 'vs50aladdin', '3 Genie Wishes', 'vs50aladdin', 'Slots', NULL, 'Games/Pragmatic/vs50aladdin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(204, 2, 'inativo', 'vs25safari', 'Hot Safari', 'vs25safari', 'Slots', NULL, 'Games/Pragmatic/vs25safari.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(205, 2, 'inativo', 'vs20honey', 'Honey Honey Honey', 'vs20honey', 'Slots', NULL, 'Games/Pragmatic/vs20honey.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:05', '2024-12-05 23:12:05'),
(206, 2, 'inativo', 'vs20hercpeg', 'Hercules and Pegasus', 'vs20hercpeg', 'Slots', NULL, 'Games/Pragmatic/vs20hercpeg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(207, 2, 'inativo', 'vs7fire88', 'Fire 88', 'vs7fire88', 'Slots', NULL, 'Games/Pragmatic/vs7fire88.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(208, 2, 'inativo', 'vs5aztecgems', 'Aztec Gems', 'vs5aztecgems', 'Slots', NULL, 'Games/Pragmatic/vs5aztecgems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(209, 2, 'inativo', 'vs1dragon8', '888 Dragons', 'vs1dragon8', 'Slots', NULL, 'Games/Pragmatic/vs1dragon8.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(210, 2, 'inativo', 'vs25dragonkingdom', 'Dragon Kingdom', 'vs25dragonkingdom', 'Slots', NULL, 'Games/Pragmatic/vs25dragonkingdom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(211, 2, 'inativo', 'vs25goldrush', 'Gold Rush', 'vs25goldrush', 'Slots', NULL, 'Games/Pragmatic/vs25goldrush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(212, 2, 'inativo', 'vs25goldpig', 'Golden Pig', 'vs25goldpig', 'Slots', NULL, 'Games/Pragmatic/vs25goldpig.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(213, 2, 'inativo', 'vs25gladiator', 'Wild Gladiator', 'vs25gladiator', 'Slots', NULL, 'Games/Pragmatic/vs25gladiator.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(214, 2, 'inativo', 'vs5joker', 'Joker s Jewels', 'vs5joker', 'Slots', NULL, 'Games/Pragmatic/vs5joker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(215, 2, 'inativo', 'vs243caishien', 'Caishen s Cash', 'vs243caishien', 'Slots', NULL, 'Games/Pragmatic/vs243caishien.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(216, 2, 'inativo', 'vs7pigs', '7 Piggies', 'vs7pigs', 'Slots', NULL, 'Games/Pragmatic/vs7pigs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:06', '2024-12-20 05:42:52'),
(217, 2, 'inativo', 'vs20leprexmas', 'Leprechaun Carol', 'vs20leprexmas', 'Slots', NULL, 'Games/Pragmatic/vs20leprexmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(218, 2, 'inativo', 'vs8magicjourn', 'Magic Journey', 'vs8magicjourn', 'Slots', NULL, 'Games/Pragmatic/vs8magicjourn.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(219, 2, 'inativo', 'vs243fortseren', 'Greek Gods', 'vs243fortseren', 'Slots', NULL, 'Games/Pragmatic/vs243fortseren.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(220, 2, 'inativo', 'vs25chilli', 'Chilli Heat', 'vs25chilli', 'Slots', NULL, 'Games/Pragmatic/vs25chilli.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(221, 2, 'inativo', 'vs20aladdinsorc', 'Aladdin and the Sorcerrer', 'vs20aladdinsorc', 'Slots', NULL, 'Games/Pragmatic/vs20aladdinsorc.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(222, 2, 'inativo', 'vs243fortune', 'Caishen s Gold', 'vs243fortune', 'Slots', NULL, 'Games/Pragmatic/vs243fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(223, 2, 'inativo', 'vs10firestrike', 'Fire Strike', 'vs10firestrike', 'Slots', NULL, 'Games/Pragmatic/vs10firestrike.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(224, 2, 'inativo', 'vs20kraken', 'Release the Kraken', 'vs20kraken', 'Slots', NULL, 'Games/Pragmatic/vs20kraken.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(225, 2, 'inativo', 'vs1masterjoker', 'Master Joker', 'vs1masterjoker', 'Slots', NULL, 'Games/Pragmatic/vs1masterjoker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(226, 2, 'inativo', 'vs5super7', 'Super 7s', 'vs5super7', 'Slots', NULL, 'Games/Pragmatic/vs5super7.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(227, 2, 'inativo', 'vs20wildboost', 'Wild Booster', 'vs20wildboost', 'Slots', NULL, 'Games/Pragmatic/vs20wildboost.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(228, 2, 'inativo', 'vswayshammthor', 'Power of Thor Megaways', 'vswayshammthor', 'Slots', NULL, 'Games/Pragmatic/vswayshammthor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:06', '2024-12-20 05:42:40'),
(229, 2, 'inativo', 'vs243lions', '5 Lions', 'vs243lions', 'Slots', NULL, 'Games/Pragmatic/vs243lions.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(230, 2, 'inativo', 'vs243mwarrior', 'Monkey Warrior', 'vs243mwarrior', 'Slots', NULL, 'Games/Pragmatic/vs243mwarrior.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(231, 2, 'inativo', 'vs20doghouse', 'The Dog House', 'vs20doghouse', 'Slots', NULL, 'Games/Pragmatic/vs20doghouse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(232, 2, 'inativo', 'vs40pirate', 'Pirate Gold', 'vs40pirate', 'Slots', NULL, 'Games/Pragmatic/vs40pirate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(233, 2, 'inativo', 'vs20rhino', 'Great Rhino', 'vs20rhino', 'Slots', NULL, 'Games/Pragmatic/vs20rhino.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(234, 2, 'inativo', 'vs25pandagold', 'Panda Fortune', 'vs25pandagold', 'Slots', NULL, 'Games/Pragmatic/vs25pandagold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(235, 2, 'inativo', 'vs4096bufking', 'Buffalo King', 'vs4096bufking', 'Slots', NULL, 'Games/Pragmatic/vs4096bufking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(236, 2, 'inativo', 'vs25pyramid', 'Pyramid King', 'vs25pyramid', 'Slots', NULL, 'Games/Pragmatic/vs25pyramid.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(237, 17, 'inativo', 'vs5ultrab', 'Ultra Burn', 'vs5ultrab', 'Slots', NULL, 'Games/Reelkingdom/vs5ultrab.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:14'),
(238, 17, 'inativo', 'vs5ultra', 'Ultra Hold and Spin', 'vs5ultra', 'Slots', NULL, 'Games/Reelkingdom/vs5ultra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:14'),
(239, 2, 'inativo', 'vs25jokerking', 'Joker King', 'vs25jokerking', 'Slots', NULL, 'Games/Pragmatic/vs25jokerking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(240, 17, 'inativo', 'vs10returndead', 'Return of the Dead', 'vs10returndead', 'Slots', NULL, 'Games/Reelkingdom/vs10returndead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(241, 2, 'inativo', 'vs10madame', 'Madame Destiny', 'vs10madame', 'Slots', NULL, 'Games/Pragmatic/vs10madame.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(242, 2, 'inativo', 'vs15diamond', 'Diamond Strike', 'vs15diamond', 'Slots', NULL, 'Games/Pragmatic/vs15diamond.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(243, 2, 'inativo', 'vs25aztecking', 'Aztec King', 'vs25aztecking', 'Slots', NULL, 'Games/Pragmatic/vs25aztecking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(244, 2, 'inativo', 'vs25wildspells', 'Wild Spells', 'vs25wildspells', 'Slots', NULL, 'Games/Pragmatic/vs25wildspells.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(245, 17, 'inativo', 'vs10bbbonanza', 'Big Bass Bonanza', 'vs10bbbonanza', 'Slots', NULL, 'Games/Reelkingdom/vs10bbbonanza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(246, 2, 'inativo', 'vs10cowgold', 'Cowboys Gold', 'vs10cowgold', 'Slots', NULL, 'Games/Pragmatic/vs10cowgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(247, 2, 'inativo', 'vs25tigerwar', 'The Tiger Warrior', 'vs25tigerwar', 'Slots', NULL, 'Games/Pragmatic/vs25tigerwar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(248, 2, 'inativo', 'vs25mustang', 'Mustang Gold', 'vs25mustang', 'Slots', NULL, 'Games/Pragmatic/vs25mustang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(249, 2, 'inativo', 'vs25hotfiesta', 'Hotfiesta', 'vs25hotfiesta', 'Slots', NULL, 'Games/Pragmatic/vs25hotfiesta.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(250, 2, 'inativo', 'vs243dancingpar', 'Dance Party', 'vs243dancingpar', 'Slots', NULL, 'Games/Pragmatic/vs243dancingpar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(251, 2, 'inativo', 'vs576treasures', 'Wild Wild Riches', 'vs576treasures', 'Slots', NULL, 'Games/Pragmatic/vs576treasures.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:06', '2024-12-20 05:42:28'),
(252, 17, 'inativo', 'vs20hburnhs', 'Hot to Burn Hold and Spin', 'vs20hburnhs', 'Slots', NULL, 'Games/Reelkingdom/vs20hburnhs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(253, 2, 'inativo', 'vs20emptybank', 'Empty the Bank', 'vs20emptybank', 'Slots', NULL, 'Games/Pragmatic/vs20emptybank.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(254, 2, 'inativo', 'vs20midas', 'The Hand of Midas', 'vs20midas', 'Slots', NULL, 'Games/Pragmatic/vs20midas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(255, 2, 'inativo', 'vs20olympgate', 'Gates of Olympus', 'vs20olympgate', 'Slots', NULL, 'Games/Pragmatic/vs20olympgate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 3, 1, 1, '2024-12-05 23:12:06', '2024-12-20 05:41:21'),
(256, 17, 'inativo', 'vswayslight', 'Lucky Lightning', 'vswayslight', 'Slots', NULL, 'Games/Reelkingdom/vswayslight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(257, 2, 'inativo', 'vs20vegasmagic', 'Vegas Magic', 'vs20vegasmagic', 'Slots', NULL, 'Games/Pragmatic/vs20vegasmagic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(258, 2, 'inativo', 'vs20fruitparty', 'Fruit Party', 'vs20fruitparty', 'Slots', NULL, 'Games/Pragmatic/vs20fruitparty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(259, 2, 'inativo', 'vs20fparty2', 'Fruit Party 2', 'vs20fparty2', 'Slots', NULL, 'Games/Pragmatic/vs20fparty2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(260, 2, 'inativo', 'vswaysdogs', 'The Dog House Megaways', 'vswaysdogs', 'Slots', NULL, 'Games/Pragmatic/vswaysdogs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(261, 2, 'inativo', 'vs50juicyfr', 'Juicy Fruits', 'vs50juicyfr', 'Slots', NULL, 'Games/Pragmatic/vs50juicyfr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(262, 2, 'inativo', 'vs25pandatemple', 'Panda Fortune 2', 'vs25pandatemple', 'Slots', NULL, 'Games/Pragmatic/vs25pandatemple.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(263, 2, 'inativo', 'vswaysbufking', 'Buffalo King Megaways', 'vswaysbufking', 'Slots', NULL, 'Games/Pragmatic/vswaysbufking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(264, 2, 'inativo', 'vs40wildwest', 'Wild West Gold', 'vs40wildwest', 'Slots', NULL, 'Games/Pragmatic/vs40wildwest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(265, 2, 'inativo', 'vs20chickdrop', 'Chicken Drop', 'vs20chickdrop', 'Slots', NULL, 'Games/Pragmatic/vs20chickdrop.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(266, 2, 'inativo', 'vs40spartaking', 'Spartan King', 'vs40spartaking', 'Slots', NULL, 'Games/Pragmatic/vs40spartaking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(267, 2, 'inativo', 'vswaysrhino', 'Great Rhino Megaways', 'vswaysrhino', 'Slots', NULL, 'Games/Pragmatic/vswaysrhino.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(268, 2, 'inativo', 'vs20sbxmas', 'Sweet Bonanza Xmas', 'vs20sbxmas', 'Slots', NULL, 'Games/Pragmatic/vs20sbxmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(269, 2, 'inativo', 'vs10fruity2', 'Extra Juicy', 'vs10fruity2', 'Slots', NULL, 'Games/Pragmatic/vs10fruity2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(270, 2, 'inativo', 'vs10egypt', 'Ancient Egypt', 'vs10egypt', 'Slots', NULL, 'Games/Pragmatic/vs10egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(271, 2, 'inativo', 'vs5drhs', 'Dragon Hot Hold and Spin', 'vs5drhs', 'Slots', NULL, 'Games/Pragmatic/vs5drhs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(272, 17, 'inativo', 'vs12bbb', 'Bigger Bass Bonanza', 'vs12bbb', 'Slots', NULL, 'Games/Reelkingdom/vs12bbb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(273, 2, 'inativo', 'vs20tweethouse', 'The Tweety House', 'vs20tweethouse', 'Slots', NULL, 'Games/Pragmatic/vs20tweethouse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(274, 2, 'inativo', 'vswayslions', '5 Lions Megaways', 'vswayslions', 'Slots', NULL, 'Games/Pragmatic/vswayslions.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(275, 2, 'inativo', 'vswayssamurai', 'Rise of Samurai Megaways', 'vswayssamurai', 'Slots', NULL, 'Games/Pragmatic/vswayssamurai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(276, 2, 'inativo', 'vs50pixie', 'Pixie Wings', 'vs50pixie', 'Slots', NULL, 'Games/Pragmatic/vs50pixie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(277, 17, 'inativo', 'vs10floatdrg', 'Floating Dragon', 'vs10floatdrg', 'Slots', NULL, 'Games/Reelkingdom/vs10floatdrg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(278, 2, 'inativo', 'vs20fruitsw', 'Sweet Bonanza', 'vs20fruitsw', 'Slots', NULL, 'Games/Pragmatic/vs20fruitsw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(279, 2, 'inativo', 'vs20rhinoluxe', 'Great Rhino Deluxe', 'vs20rhinoluxe', 'Slots', NULL, 'Games/Pragmatic/vs20rhinoluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(280, 2, 'inativo', 'vswaysmadame', 'Madame Destiny Megaways', 'vswaysmadame', 'Slots', NULL, 'Games/Pragmatic/vswaysmadame.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(281, 17, 'inativo', 'vs1024temuj', 'Temujin Treasures', 'vs1024temuj', 'Slots', NULL, 'Games/Reelkingdom/vs1024temuj.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:15'),
(282, 2, 'inativo', 'vs40pirgold', 'Pirate Gold Deluxe', 'vs40pirgold', 'Slots', NULL, 'Games/Pragmatic/vs40pirgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(283, 2, 'inativo', 'vs25mmouse', 'Money Mouse', 'vs25mmouse', 'Slots', NULL, 'Games/Pragmatic/vs25mmouse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(284, 2, 'inativo', 'vs10threestar', 'Three Star Fortune', 'vs10threestar', 'Slots', NULL, 'Games/Pragmatic/vs10threestar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(285, 2, 'inativo', 'vs1ball', 'Lucky Dragon Ball', 'vs1ball', 'Slots', NULL, 'Games/Pragmatic/vs1ball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(286, 2, 'inativo', 'vs243lionsgold', '5 Lions', 'vs243lionsgold', 'Slots', NULL, 'Games/Pragmatic/vs243lionsgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(287, 2, 'inativo', 'vs10egyptcls', 'Ancient Egypt Classic', 'vs10egyptcls', 'Slots', NULL, 'Games/Pragmatic/vs10egyptcls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(288, 2, 'inativo', 'vs25davinci', 'Da Vinci Treasure', 'vs25davinci', 'Slots', NULL, 'Games/Pragmatic/vs25davinci.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(289, 2, 'inativo', 'vs7776secrets', 'Aztec Treasure', 'vs7776secrets', 'Slots', NULL, 'Games/Pragmatic/vs7776secrets.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(290, 2, 'inativo', 'vs25wolfgold', 'Wolf Gold', 'vs25wolfgold', 'Slots', NULL, 'Games/Pragmatic/vs25wolfgold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(291, 2, 'inativo', 'vs50safariking', 'Safari King', 'vs50safariking', 'Slots', NULL, 'Games/Pragmatic/vs50safariking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(292, 2, 'inativo', 'vs25peking', 'Peking Luck', 'vs25peking', 'Slots', NULL, 'Games/Pragmatic/vs25peking.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(293, 2, 'inativo', 'vs25asgard', 'Asgard', 'vs25asgard', 'Slots', NULL, 'Games/Pragmatic/vs25asgard.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(294, 2, 'inativo', 'vs25vegas', 'Vegas Nights', 'vs25vegas', 'Slots', NULL, 'Games/Pragmatic/vs25vegas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(295, 2, 'inativo', 'vs25scarabqueen', 'John Hunter and the Tomb of the Scarab Queen', 'vs25scarabqueen', 'Slots', NULL, 'Games/Pragmatic/vs25scarabqueen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(296, 2, 'inativo', 'vs20starlight', 'Starlight Princess', 'vs20starlight', 'Slots', NULL, 'Games/Pragmatic/vs20starlight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(297, 2, 'inativo', 'vs10bookoftut', 'John Hunter and the Book of Tut', 'vs10bookoftut', 'Slots', NULL, 'Games/Pragmatic/vs10bookoftut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:06', '2024-12-05 23:12:06'),
(298, 2, 'inativo', 'vs9piggybank', 'Piggy Bank Bills', 'vs9piggybank', 'Slots', NULL, 'Games/Pragmatic/vs9piggybank.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(299, 2, 'inativo', 'vs5drmystery', 'Dragon Kingdom Mystery', 'vs5drmystery', 'Slots', NULL, 'Games/Pragmatic/vs5drmystery.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(300, 2, 'inativo', 'vs20eightdragons', 'Eight Dragons', 'vs20eightdragons', 'Slots', NULL, 'Games/Pragmatic/vs20eightdragons.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(301, 2, 'inativo', 'vs1024lionsd', '5 Lions Dance', 'vs1024lionsd', 'Slots', NULL, 'Games/Pragmatic/vs1024lionsd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(302, 2, 'inativo', 'vs25rio', 'Heart of Rio', 'vs25rio', 'Slots', NULL, 'Games/Pragmatic/vs25rio.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(303, 2, 'inativo', 'vs10nudgeit', 'Rise of Giza PowerNudge', 'vs10nudgeit', 'Slots', NULL, 'Games/Pragmatic/vs10nudgeit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(304, 17, 'inativo', 'vs10bxmasbnza', 'Christmas Big Bass Bonanza', 'vs10bxmasbnza', 'Slots', NULL, 'Games/Reelkingdom/vs10bxmasbnza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:15'),
(305, 2, 'inativo', 'vs20santawonder', 'Santa s Wonderland', 'vs20santawonder', 'Slots', NULL, 'Games/Pragmatic/vs20santawonder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(306, 2, 'inativo', 'vs10bblpop', 'Bubble Pop', 'vs10bblpop', 'Slots', NULL, 'Games/Pragmatic/vs10bblpop.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(307, 2, 'inativo', 'vs25btygold', 'Bounty Gold', 'vs25btygold', 'Slots', NULL, 'Games/Pragmatic/vs25btygold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(308, 2, 'inativo', 'vs88hockattack', 'Hockey Attack(tm)', 'vs88hockattack', 'Slots', NULL, 'Games/Pragmatic/vs88hockattack.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(309, 17, 'inativo', 'vswaysbbb', 'Big Bass Bonanza Megaways(tm)', 'vswaysbbb', 'Slots', NULL, 'Games/Reelkingdom/vswaysbbb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:15'),
(310, 2, 'inativo', 'vs10bookfallen', 'Book of the Fallen', 'vs10bookfallen', 'Slots', NULL, 'Games/Pragmatic/vs10bookfallen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(311, 17, 'inativo', 'vs40bigjuan', 'Big Juan', 'vs40bigjuan', 'Slots', NULL, 'Games/Reelkingdom/vs40bigjuan.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:15'),
(312, 2, 'inativo', 'vs20bermuda', 'John Hunter and the Quest for Bermuda Riches', 'vs20bermuda', 'Slots', NULL, 'Games/Pragmatic/vs20bermuda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(313, 17, 'inativo', 'vs10starpirate', 'Star Pirates Code', 'vs10starpirate', 'Slots', NULL, 'Games/Reelkingdom/vs10starpirate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:15'),
(314, 2, 'inativo', 'vswayswest', 'Mystic Chief', 'vswayswest', 'Slots', NULL, 'Games/Pragmatic/vswayswest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(315, 2, 'inativo', 'vs20daydead', 'Day of Dead', 'vs20daydead', 'Slots', NULL, 'Games/Pragmatic/vs20daydead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(316, 2, 'inativo', 'vs20candvil', 'Candy Village', 'vs20candvil', 'Slots', NULL, 'Games/Pragmatic/vs20candvil.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(317, 2, 'inativo', 'vswayswwhex', 'Wild Wild Bananas', 'vswayswwhex', 'Slots', NULL, 'Games/Pragmatic/vswayswwhex.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(318, 2, 'inativo', 'vs25spgldways', 'Secret City Gold', 'vs25spgldways', 'Slots', NULL, 'Games/Pragmatic/vs25spgldways.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(319, 2, 'inativo', 'vswaysincwnd', 'Gold Oasis', 'vswaysincwnd', 'Slots', NULL, 'Games/Pragmatic/vswaysincwnd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(320, 2, 'inativo', 'vswaysftropics', 'Frozen Tropics', 'vswaysftropics', 'Slots', NULL, 'Games/Pragmatic/vswaysftropics.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(321, 2, 'inativo', 'vs20superlanche', 'Monster Superlanche', 'vs20superlanche', 'Slots', NULL, 'Games/Pragmatic/vs20superlanche.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(322, 2, 'inativo', 'vs10fisheye', 'Fish Eye', 'vs10fisheye', 'Slots', NULL, 'Games/Pragmatic/vs10fisheye.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(323, 2, 'inativo', 'vs20mochimon', 'Mochimon', 'vs20mochimon', 'Slots', NULL, 'Games/Pragmatic/vs20mochimon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(324, 2, 'inativo', 'vs20gatotfury', 'Gatot Kaca s Fury', 'vs20gatotfury', 'Slots', NULL, 'Games/Pragmatic/vs20gatotfury.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(325, 2, 'inativo', 'vs25archer', 'Fire Archer', 'vs25archer', 'Slots', NULL, 'Games/Pragmatic/vs25archer.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(326, 2, 'inativo', 'vs12tropicana', 'Club Tropicana', 'vs12tropicana', 'Slots', NULL, 'Games/Pragmatic/vs12tropicana.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(327, 2, 'inativo', 'vs10powerlines', 'Peak Power', 'vs10powerlines', 'Slots', NULL, 'Games/Pragmatic/vs10powerlines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(328, 2, 'inativo', 'vswaysmorient', 'Mystery of the Orient', 'vswaysmorient', 'Slots', NULL, 'Games/Pragmatic/vswaysmorient.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(329, 2, 'inativo', 'vs20goldclust', 'Rabbit Garden', 'vs20goldclust', 'Slots', NULL, 'Games/Pragmatic/vs20goldclust.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(330, 2, 'inativo', 'vs20sknights', 'The Knight King', 'vs20sknights', 'Slots', NULL, 'Games/Pragmatic/vs20sknights.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(331, 2, 'inativo', 'vs20framazon', 'Fruits of the Amazon', 'vs20framazon', 'Slots', NULL, 'Games/Pragmatic/vs20framazon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(332, 2, 'inativo', 'vswaysredqueen', 'The Red Queen', 'vswaysredqueen', 'Slots', NULL, 'Games/Pragmatic/vswaysredqueen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(333, 2, 'inativo', 'vs1024moonsh', 'Moonshot', 'vs1024moonsh', 'Slots', NULL, 'Games/Pragmatic/vs1024moonsh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(334, 2, 'inativo', 'vs10bbhas', 'Big Bass - Hold e Spinner', 'vs10bbhas', 'Slots', NULL, 'Games/Pragmatic/vs10bbhas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(335, 2, 'inativo', 'vs20hotzone', 'African Elephant', 'vs20hotzone', 'Slots', NULL, 'Games/Pragmatic/vs20hotzone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(336, 2, 'inativo', 'vswaysmonkey', '3 Dancing Monkeys', 'vswaysmonkey', 'Slots', NULL, 'Games/Pragmatic/vswaysmonkey.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(337, 2, 'inativo', 'vswaysrsm', 'Wild Celebrity Bus Megaways', 'vswaysrsm', 'Slots', NULL, 'Games/Pragmatic/vswaysrsm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(338, 2, 'inativo', 'vs10gizagods', 'Gods of Giza', 'vs10gizagods', 'Slots', NULL, 'Games/Pragmatic/vs10gizagods.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(339, 2, 'inativo', 'vswaysultrcoin', 'Cowboy Coins', 'vswaysultrcoin', 'Slots', NULL, 'Games/Pragmatic/vswaysultrcoin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(340, 2, 'inativo', 'vs10kingofdth', 'Kingdom of the Dead', 'vs10kingofdth', 'Slots', NULL, 'Games/Pragmatic/vs10kingofdth.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(341, 2, 'inativo', 'vs20mvwild', 'Jasmine Dreams', 'vs20mvwild', 'Slots', NULL, 'Games/Pragmatic/vs20mvwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(342, 2, 'inativo', 'vs25holiday', 'Holiday Ride', 'vs25holiday', 'Slots', NULL, 'Games/Pragmatic/vs25holiday.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(343, 2, 'inativo', 'vs20stickywild', 'Wild Bison Charge', 'vs20stickywild', 'Slots', NULL, 'Games/Pragmatic/vs20stickywild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(344, 2, 'inativo', 'vs20excalibur', 'Excalibur Unleashed', 'vs20excalibur', 'Slots', NULL, 'Games/Pragmatic/vs20excalibur.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(345, 2, 'inativo', 'vs25spotz', 'Knight Hot Spotz', 'vs25spotz', 'Slots', NULL, 'Games/Pragmatic/vs25spotz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(346, 2, 'inativo', 'vs20clustwild', 'Sticky Bees', 'vs20clustwild', 'Slots', NULL, 'Games/Pragmatic/vs20clustwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(347, 2, 'inativo', 'vs10fdrasbf', 'Floating Dragon - Dragon Boat Festival', 'vs10fdrasbf', 'Slots', NULL, 'Games/Pragmatic/vs10fdrasbf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(348, 2, 'inativo', 'vs4096robber', 'Robber Strike', 'vs4096robber', 'Slots', NULL, 'Games/Pragmatic/vs4096robber.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(349, 2, 'inativo', 'vs20lampinf', 'Lamp Of Infinity', 'vs20lampinf', 'Slots', NULL, 'Games/Pragmatic/vs20lampinf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(350, 2, 'inativo', 'vswaysfrbugs', 'Frogs e Bugs', 'vswaysfrbugs', 'Slots', NULL, 'Games/Pragmatic/vswaysfrbugs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(351, 2, 'inativo', 'vs9outlaw', 'Pirates Pub', 'vs9outlaw', 'Slots', NULL, 'Games/Pragmatic/vs9outlaw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(352, 2, 'inativo', 'vs20jewelparty', 'Jewel Rush', 'vs20jewelparty', 'Slots', NULL, 'Games/Pragmatic/vs20jewelparty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(353, 2, 'inativo', 'vs20beefed', 'Fat Panda', 'vs20beefed', 'Slots', NULL, 'Games/Pragmatic/vs20beefed.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(354, 2, 'inativo', 'vs20hstgldngt', 'Heist for the Golden Nuggets', 'vs20hstgldngt', 'Slots', NULL, 'Games/Pragmatic/vs20hstgldngt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(355, 2, 'inativo', 'vs25jokrace', 'Joker Race', 'vs25jokrace', 'Slots', NULL, 'Games/Pragmatic/vs25jokrace.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(356, 2, 'inativo', 'vs243nudge4gold', 'Hellvis Wild', 'vs243nudge4gold', 'Slots', NULL, 'Games/Pragmatic/vs243nudge4gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(357, 2, 'inativo', 'vs50jucier', 'Sky Bounty', 'vs50jucier', 'Slots', NULL, 'Games/Pragmatic/vs50jucier.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(358, 2, 'inativo', 'vs20cashmachine', 'Cash Box', 'vs20cashmachine', 'Slots', NULL, 'Games/Pragmatic/vs20cashmachine.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(359, 2, 'inativo', 'vs20splmystery', 'Spellbinding Mystery', 'vs20splmystery', 'Slots', NULL, 'Games/Pragmatic/vs20splmystery.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(360, 2, 'inativo', 'vs20doghousemh', 'The Dog House Multihold', 'vs20doghousemh', 'Slots', NULL, 'Games/Pragmatic/vs20doghousemh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(361, 2, 'inativo', 'vs20wildparty', '3 Buzzing Wilds', 'vs20wildparty', 'Slots', NULL, 'Games/Pragmatic/vs20wildparty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(362, 2, 'inativo', 'vs20lobcrab', 'Lobster Bob s Crazy Crab Shack', 'vs20lobcrab', 'Slots', NULL, 'Games/Pragmatic/vs20lobcrab.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(363, 2, 'inativo', 'vs20supermania', 'Supermania', 'vs20supermania', 'Slots', NULL, 'Games/Pragmatic/vs20supermania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(364, 2, 'inativo', 'vs10trail', 'Mustang Trail', 'vs10trail', 'Slots', NULL, 'Games/Pragmatic/vs10trail.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(365, 2, 'inativo', 'vs20lvlup', 'Pub Kings', 'vs20lvlup', 'Slots', NULL, 'Games/Pragmatic/vs20lvlup.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(366, 2, 'inativo', 'vs20saiman', 'Saiyan Mania', 'vs20saiman', 'Slots', NULL, 'Games/Pragmatic/vs20saiman.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(367, 2, 'inativo', 'vs20earthquake', 'Cyclops Smash', 'vs20earthquake', 'Slots', NULL, 'Games/Pragmatic/vs20earthquake.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(368, 2, 'inativo', 'vswaysbbhas', 'Big Bass Hold e Spinner Megaways', 'vswaysbbhas', 'Slots', NULL, 'Games/Pragmatic/vswaysbbhas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(369, 2, 'inativo', 'vs20forge', 'Forge of Olympus', 'vs20forge', 'Slots', NULL, 'Games/Pragmatic/vs20forge.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(370, 2, 'inativo', 'vs20procount', 'Wisdom of Athena', 'vs20procount', 'Slots', NULL, 'Games/Pragmatic/vs20procount.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(371, 2, 'inativo', 'vs1024mahjwins', 'Mahjong Wins', 'vs1024mahjwins', 'Slots', NULL, 'Games/Pragmatic/vs1024mahjwins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(372, 2, 'inativo', 'vs20maskgame', 'Cash Chips', 'vs20maskgame', 'Slots', NULL, 'Games/Pragmatic/vs20maskgame.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(373, 2, 'inativo', 'vswaysraghex', 'Tundra s Fortune', 'vswaysraghex', 'Slots', NULL, 'Games/Pragmatic/vswaysraghex.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(374, 2, 'inativo', 'vs10bhallbnza', 'Big Bass Halloween', 'vs10bhallbnza', 'Slots', NULL, 'Games/Pragmatic/vs10bhallbnza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(375, 2, 'inativo', 'vs40rainbowr', 'Rainbow Reels', 'vs40rainbowr', 'Slots', NULL, 'Games/Pragmatic/vs40rainbowr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(376, 2, 'inativo', 'vs20gravity', 'Gravity Bonanza', 'vs20gravity', 'Slots', NULL, 'Games/Pragmatic/vs20gravity.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(377, 2, 'inativo', 'vs40infwild', 'Infective Wild', 'vs40infwild', 'Slots', NULL, 'Games/Pragmatic/vs40infwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(378, 2, 'inativo', 'vs20swordofares', 'Sword of Ares', 'vs20swordofares', 'Slots', NULL, 'Games/Pragmatic/vs20swordofares.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(379, 2, 'inativo', 'vswaysfrywld', 'Spin e Score Megaways', 'vswaysfrywld', 'Slots', NULL, 'Games/Pragmatic/vswaysfrywld.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(380, 2, 'inativo', 'vswaysconcoll', 'Sweet PowerNudge(tm)', 'vswaysconcoll', 'Slots', NULL, 'Games/Pragmatic/vswaysconcoll.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(381, 2, 'inativo', 'vs20lcount', 'Gems of Serengeti(tm)', 'vs20lcount', 'Slots', NULL, 'Games/Pragmatic/vs20lcount.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(382, 2, 'inativo', 'vs20sparta', 'Shield of Sparta', 'vs20sparta', 'Slots', NULL, 'Games/Pragmatic/vs20sparta.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(383, 2, 'inativo', 'vs10bbkir', 'Big Bass Bonanza Keeping it Reel', 'vs10bbkir', 'Slots', NULL, 'Games/Pragmatic/vs10bbkir.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:07', '2024-12-20 05:42:45'),
(384, 2, 'inativo', 'vswayspizza', 'Pizza Pizza Pizza', 'vswayspizza', 'Slots', NULL, 'Games/Pragmatic/vswayspizza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(385, 2, 'inativo', 'vs20dugems', 'Hot Pepper(tm)', 'vs20dugems', 'Slots', NULL, 'Games/Pragmatic/vs20dugems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(386, 2, 'inativo', 'vs20clspwrndg', 'Sweet PowerNudge', 'vs20clspwrndg', 'Slots', NULL, 'Games/Pragmatic/vs20clspwrndg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(387, 2, 'inativo', 'vswaysfuryodin', 'Fury of Odin Megaways(tm)', 'vswaysfuryodin', 'Slots', NULL, 'Games/Pragmatic/vswaysfuryodin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(388, 2, 'inativo', 'vs20sugarcoins', 'Viking Forge', 'vs20sugarcoins', 'Slots', NULL, 'Games/Pragmatic/vs20sugarcoins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(389, 2, 'inativo', 'vs20olympgrace', 'Grace of Ebisu', 'vs20olympgrace', 'Slots', NULL, 'Games/Pragmatic/vs20olympgrace.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:07', '2024-12-05 23:12:07'),
(390, 2, 'inativo', 'vs20starlightx', 'Starlight Princess 1000', 'vs20starlightx', 'Slots', NULL, 'Games/Pragmatic/vs20starlightx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(391, 2, 'inativo', 'vswaysmoneyman', 'The Money Men Megaways', 'vswaysmoneyman', 'Slots', NULL, 'Games/Pragmatic/vswaysmoneyman.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(392, 2, 'inativo', 'vs40demonpots', 'Demon Pots', 'vs40demonpots', 'Slots', NULL, 'Games/Pragmatic/vs40demonpots.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(393, 2, 'inativo', 'vswaystut', 'John Hunter and the Book of Tut Megaways', 'vswaystut', 'Slots', NULL, 'Games/Pragmatic/vswaystut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(394, 2, 'inativo', 'vs10gdchalleng', '8 Golden Dragon Challenge', 'vs10gdchalleng', 'Slots', NULL, 'Games/Pragmatic/vs10gdchalleng.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(395, 2, 'inativo', 'vs20yisunshin', 'Yi Sun Shin', 'vs20yisunshin', 'Slots', NULL, 'Games/Pragmatic/vs20yisunshin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(396, 2, 'inativo', 'vs20candyblitz', 'Candy Blitz', 'vs20candyblitz', 'Slots', NULL, 'Games/Pragmatic/vs20candyblitz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(397, 2, 'inativo', 'vswaysstrlght', 'Fortunes of Aztec', 'vswaysstrlght', 'Slots', NULL, 'Games/Pragmatic/vswaysstrlght.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(398, 2, 'inativo', 'vs50dmdcascade', 'Diamond Cascade', 'vs50dmdcascade', 'Slots', NULL, 'Games/Pragmatic/vs50dmdcascade.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(399, 2, 'inativo', 'vs20piggybank', 'Piggy Bankers', 'vs20piggybank', 'Slots', NULL, 'Games/Pragmatic/vs20piggybank.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(400, 2, 'inativo', 'vs20bnnzdice', 'Sweet Bonanza Dice', 'vs20bnnzdice', 'Slots', NULL, 'Games/Pragmatic/vs20bnnzdice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(401, 2, 'inativo', 'vs5gemstone', 'Gemstone', 'vs5gemstone', 'Slots', NULL, 'Games/Pragmatic/vs5gemstone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(402, 2, 'inativo', 'vs10dyndigd', 'Dynamite Diggin Doug', 'vs10dyndigd', 'Slots', NULL, 'Games/Pragmatic/vs10dyndigd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(403, 2, 'inativo', 'vs10jokerhot', 'Joker\'s Jewels Hot', 'vs10jokerhot', 'Slots', NULL, 'Games/Pragmatic/vs10jokerhot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(404, 2, 'inativo', 'vs20jhunter', 'Jackpot Hunter', 'vs20jhunter', 'Slots', NULL, 'Games/Pragmatic/vs20jhunter.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(405, 2, 'inativo', 'vs20gembondx', 'Bow of Artemis', 'vs20gembondx', 'Slots', NULL, 'Games/Pragmatic/vs20gembondx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(406, 2, 'inativo', 'vs20bblitz', 'Money Stacks', 'vs20bblitz', 'Slots', NULL, 'Games/Pragmatic/vs20bblitz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(407, 2, 'inativo', 'vs10bbsplxmas', 'Big Bass Christmas Bash', 'vs10bbsplxmas', 'Slots', NULL, 'Games/Pragmatic/vs10bbsplxmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(408, 2, 'inativo', 'vs10dgold88', 'Dragon Gold 88', 'vs10dgold88', 'Slots', NULL, 'Games/Pragmatic/vs10dgold88.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(409, 2, 'inativo', 'vswayscashconv', 'Running Sushi', 'vswayscashconv', 'Slots', NULL, 'Games/Pragmatic/vswayscashconv.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(410, 2, 'inativo', 'vs20mesmult', 'Yeti Quest', 'vs20mesmult', 'Slots', NULL, 'Games/Pragmatic/vs20mesmult.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(411, 2, 'inativo', 'vs15godsofwar', 'Zeus vs Hades - Gods of War', 'vs15godsofwar', 'Slots', NULL, 'Games/Pragmatic/vs15godsofwar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(412, 2, 'inativo', 'vswaysjapan', 'Starlight Princess Pachi', 'vswaysjapan', 'Slots', NULL, 'Games/Pragmatic/vswaysjapan.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(413, 2, 'inativo', 'vs20riverstx', 'River of Styx', 'vs20riverstx', 'Slots', NULL, 'Games/Pragmatic/vs20riverstx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(414, 2, 'inativo', 'vs15thundunder', 'Thunder vs Underworld', 'vs15thundunder', 'Slots', NULL, 'Games/Pragmatic/vs15thundunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(415, 2, 'inativo', 'vs5luckytig', 'Tigre Sortudo', 'vs5luckytig', 'Slots', NULL, 'Games/Pragmatic/vs5luckytig.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1000, 1, 1, '2024-12-05 23:12:08', '2024-12-20 05:49:30'),
(416, 2, 'inativo', 'vswaysmahwblck', 'Mahjong Wins 3 - Black Scatter', 'vswaysmahwblck', 'Slots', NULL, 'Games/Pragmatic/vswaysmahwblck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(417, 2, 'inativo', 'vs10bbbnz', 'Big Bass Day at the Races', 'vs10bbbnz', 'Slots', NULL, 'Games/Pragmatic/vs10bbbnz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(418, 2, 'inativo', 'vs10bbextreme', 'Big Bass Amazon Xtreme', 'vs10bbextreme', 'Slots', NULL, 'Games/Pragmatic/vs10bbextreme.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(419, 2, 'inativo', 'vs10ddcbells', 'Ding Dong Christmas Bells', 'vs10ddcbells', 'Slots', NULL, 'Games/Pragmatic/vs10ddcbells.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(420, 2, 'inativo', 'vs15pvss', 'Puffers vs Sharks', 'vs15pvss', 'Slots', NULL, 'Games/Pragmatic/vs15pvss.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(421, 2, 'inativo', 'vs15samurai4', 'Rise of Samurai 4', 'vs15samurai4', 'Slots', NULL, 'Games/Pragmatic/vs15samurai4.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(422, 2, 'inativo', 'vs15seoultrain', 'Train to Seoul', 'vs15seoultrain', 'Slots', NULL, 'Games/Pragmatic/vs15seoultrain.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(423, 2, 'inativo', 'vs20cbrhst', 'Cyber Heist', 'vs20cbrhst', 'Slots', NULL, 'Games/Pragmatic/vs20cbrhst.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(424, 2, 'inativo', 'vs20ekingrr', 'Emerald King Rainbow Road', 'vs20ekingrr', 'Slots', NULL, 'Games/Pragmatic/vs20ekingrr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(425, 2, 'inativo', 'vs20fruitjpas', 'Jajanan Pasar', 'vs20fruitjpas', 'Slots', NULL, 'Games/Pragmatic/vs20fruitjpas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(426, 2, 'inativo', 'vs20leogatex', 'Gates of LeoVegas 1000', 'vs20leogatex', 'Slots', NULL, 'Games/Pragmatic/vs20leogatex.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(427, 2, 'inativo', 'vs20mahjxbnz', 'Mahjong X', 'vs20mahjxbnz', 'Slots', NULL, 'Games/Pragmatic/vs20mahjxbnz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(428, 2, 'inativo', 'vs20mammoth', 'Mammoth Gold Megaways', 'vs20mammoth', 'Slots', NULL, 'Games/Pragmatic/vs20mammoth.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(429, 2, 'inativo', 'vs20ninjapower', 'Power of Ninja', 'vs20ninjapower', 'Slots', NULL, 'Games/Pragmatic/vs20ninjapower.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(430, 2, 'inativo', 'vs20olygames', 'Games in Olympus', 'vs20olygames', 'Slots', NULL, 'Games/Pragmatic/vs20olygames.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(431, 2, 'inativo', 'vs20olympdice', 'Gates of Olympus Dice', 'vs20olympdice', 'Slots', NULL, 'Games/Pragmatic/vs20olympdice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(432, 2, 'inativo', 'vs20pquestx', 'Pirate Quest 1000', 'vs20pquestx', 'Slots', NULL, 'Games/Pragmatic/vs20pquestx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(433, 2, 'inativo', 'vs20procountx', 'Wisdom of Athena 1000', 'vs20procountx', 'Slots', NULL, 'Games/Pragmatic/vs20procountx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(434, 2, 'inativo', 'vs20rodegate', 'Devil Joker', 'vs20rodegate', 'Slots', NULL, 'Games/Pragmatic/vs20rodegate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(435, 2, 'inativo', 'vs20rujakbnz', 'Rujak Bonanza', 'vs20rujakbnz', 'Slots', NULL, 'Games/Pragmatic/vs20rujakbnz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(436, 2, 'inativo', 'vs20schristmas', 'Starlight Christmas', 'vs20schristmas', 'Slots', NULL, 'Games/Pragmatic/vs20schristmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(437, 2, 'inativo', 'vs20sungate', 'The Green Sun', 'vs20sungate', 'Slots', NULL, 'Games/Pragmatic/vs20sungate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(438, 2, 'inativo', 'vswaysmahwin2', 'Mahjong Wins 2', 'vswaysmahwin2', 'Slots', NULL, 'Games/Pragmatic/vswaysmahwin2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(439, 2, 'inativo', 'vswaysmherc', 'Mighty Hercules', 'vswaysmherc', 'Slots', NULL, 'Games/Pragmatic/vswaysmherc.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(440, 2, 'inativo', 'vs25xmasparty', 'Penguins Christmas Party Time', 'vs25xmasparty', 'Slots', NULL, 'Games/Pragmatic/vs25xmasparty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(441, 2, 'inativo', 'vs20olympxmas', 'Gates of Olympus Xmas 1000', 'vs20olympxmas', 'Slots', NULL, 'Games/Pragmatic/vs20olympxmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(442, 2, 'inativo', 'vs10bbxext', 'Big Bass Xmas Xtreme', 'vs10bbxext', 'Slots', NULL, 'Games/Pragmatic/vs10bbxext.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(443, 2, 'inativo', 'vs20rainbowrsh', 'Santa\'s Xmas Rush', 'vs20rainbowrsh', 'Slots', NULL, 'Games/Pragmatic/vs20rainbowrsh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(444, 3, 'inativo', 'aviator', 'Aviator', 'aviator', 'Crash', NULL, 'Games/Spribe/Aviator.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 25, 1, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:04'),
(445, 3, 'inativo', '11672', 'GOAL (Oficial)', '11672', 'Lotery', NULL, 'Games/Spribe/11672.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:07'),
(446, 3, 'inativo', '11678', 'HOTLINE (Oficial)', '11678', 'Lotery', NULL, 'Games/Spribe/11678.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:07'),
(447, 3, 'inativo', '11677', 'MINI ROULETTE  (Oficial)', '11677', 'Lotery', NULL, 'Games/Spribe/11677.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:08'),
(448, 3, 'inativo', '11671', 'DICE (Oficial)', '11671', 'Lotery', NULL, 'Games/Spribe/11671.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:09');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(449, 3, 'inativo', '11675', 'HILO (Oficial)', '11675', 'Lotery', NULL, 'Games/Spribe/11675.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:09'),
(450, 3, 'inativo', '11673', 'PLINKO (Oficial)', '11673', 'Lotery', NULL, 'Games/Spribe/11673.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:10'),
(451, 3, 'inativo', 'mines', 'Mines', 'mines', 'Lotery', NULL, 'Games/Spribe/mines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 12, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:36:11'),
(452, 4, 'inativo', '12547', 'Atlantis', '12547', 'Lotery', NULL, 'Games/Galaxsys/Atlantis.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(453, 4, 'inativo', '12544', 'Bingo Star', '12544', 'Lotery', NULL, 'Games/Galaxsys/Bingo-Star.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(454, 4, 'inativo', '12542', 'Maestro', '12542', 'Crash', NULL, 'Games/Galaxsys/Maestro.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(455, 4, 'inativo', '12540', 'Turbo Mines', '12540', 'Lotery', NULL, 'Games/Galaxsys/Turbo-Mines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:29'),
(456, 4, 'inativo', '12537', 'Totem', '12537', 'Crash', NULL, 'Games/Galaxsys/Totem.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(457, 4, 'inativo', '12536', 'Magic Dice', '12536', 'Lotery', NULL, 'Games/Galaxsys/Magic-Dice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(458, 4, 'inativo', '12533', 'Scratch Map', '12533', 'Lotery', NULL, 'Games/Galaxsys/Scratch-Map.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(459, 4, 'inativo', '12532', 'Coin Flip', '12532', 'Lotery', NULL, 'Games/Galaxsys/Coin-Flip.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:32'),
(460, 4, 'inativo', '12530', 'Roulette X', '12530', 'Lotery', NULL, 'Games/Galaxsys/Roulette-X.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(461, 4, 'inativo', '12528', 'Plinkoman', '12528', 'Lotery', NULL, 'Games/Galaxsys/Plinkoman.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(462, 4, 'inativo', '12526', 'Ninja Crash', '12526', 'Lotery', NULL, 'Games/Galaxsys/Ninja-Crash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:21'),
(463, 4, 'inativo', '12524', 'Mr.Thimble', '12524', 'Crash', NULL, 'Games/Galaxsys/Mr.Thimble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(464, 4, 'inativo', '12522', 'Jungle Wheel', '12522', 'Lotery', NULL, 'Games/Galaxsys/Jungle-Wheel.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:24'),
(465, 4, 'inativo', '12520', 'GoldenRA', '12520', 'Lotery', NULL, 'Games/Galaxsys/GoldenRA.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(466, 4, 'inativo', '12518', 'F Mines', '12518', 'Lotery', NULL, 'Games/Galaxsys/F-Mines.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(467, 4, 'inativo', '12516', 'Crasher', '12516', 'Crash', NULL, 'Games/Galaxsys/Crasher.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:10'),
(468, 4, 'inativo', '12515', 'Cash Show', '12515', 'Crash', NULL, 'Games/Galaxsys/Cash-Show.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:11'),
(469, 4, 'inativo', '12502', 'SicBo', '12502', 'Lotery', NULL, 'Games/Galaxsys/SicBo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(470, 4, 'inativo', '12501', 'Rocketon', '12501', 'Crash', NULL, 'Games/Galaxsys/Rocketon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:13'),
(471, 4, 'inativo', '12500', 'Penalty', '12500', 'Lotery', NULL, 'Games/Galaxsys/Penalty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(472, 4, 'inativo', '12499', 'Keno Express', '12499', 'Lotery', NULL, 'Games/Galaxsys/Keno-Express.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(473, 4, 'inativo', '12510', 'Keno 8 (2 Minute)', '12510', 'Lotery', NULL, 'Games/Galaxsys/Keno82Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(474, 4, 'inativo', '12509', 'Keno 8 (1 Minute)', '12509', 'Lotery', NULL, 'Games/Galaxsys/Keno81Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(475, 4, 'inativo', '12508', 'Keno 10 (2 Minute)', '12508', 'Lotery', NULL, 'Games/Galaxsys/Keno102Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(476, 4, 'inativo', '12507', 'Keno 10 (1 Minute)', '12507', 'Lotery', NULL, 'Games/Galaxsys/Keno101Minute.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(477, 4, 'inativo', '12494', 'Hilo', '12494', 'Lotery', NULL, 'Games/Galaxsys/Hilo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:08', '2024-12-20 05:45:15'),
(478, 4, 'inativo', '12493', 'Crash', '12493', 'Lotery', NULL, 'Games/Galaxsys/Crash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(479, 4, 'inativo', '12492', 'BlackJack', '12492', 'Lotery', NULL, 'Games/Galaxsys/BlackJack.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(480, 5, 'inativo', '30', 'Power Stars', '30', 'Slots', NULL, 'Games/Novomatic/Power-Stars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(481, 5, 'inativo', '3218', 'Queen of Hearts Deluxe', '3218', 'Slots', NULL, 'Games/Novomatic/Queen-of-Hearts-Deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(482, 5, 'inativo', '103', 'Quest for Gold', '103', 'Slots', NULL, 'Games/Novomatic/Quest-for-Gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(483, 5, 'inativo', '102', 'Ramses II', '102', 'Slots', NULL, 'Games/Novomatic/Ramses-II.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(484, 5, 'inativo', '374', 'Red Lady', '374', 'Slots', NULL, 'Games/Novomatic/Red-Lady.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:08', '2024-12-05 23:12:08'),
(485, 5, 'inativo', '114', 'Reel King', '114', 'Slots', NULL, 'Games/Novomatic/Reel-King.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(486, 5, 'inativo', '107', 'Rex', '107', 'Slots', NULL, 'Games/Novomatic/Rex.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(487, 5, 'inativo', '4571', 'River Queen', '4571', 'Slots', NULL, 'Games/Novomatic/River-Queen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(488, 5, 'inativo', '3210', 'Roaring Forties', '3210', 'Slots', NULL, 'Games/Novomatic/Roaring-Forties.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(489, 5, 'inativo', '3211', 'Roaring Wilds', '3211', 'Slots', NULL, 'Games/Novomatic/Roaring-Wilds.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(490, 5, 'inativo', '6657', 'Royal Dynasty', '6657', 'Slots', NULL, 'Games/Novomatic/Royal-Dynasty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:26'),
(491, 5, 'inativo', '475', 'Royal Treasure', '475', 'Slots', NULL, 'Games/Novomatic/Royal-Treasure.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(492, 16, 'inativo', '95', 'Football boots', '95', 'Slots', NULL, 'Games/Cq9/95.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:14'),
(493, 5, 'inativo', '6878', 'Secret Treasure', '6878', 'Slots', NULL, 'Games/Novomatic/Secret-Treasure.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:33'),
(494, 5, 'inativo', '3149', 'Sizzling 6', '3149', 'Slots', NULL, 'Games/Novomatic/Sizzling-6.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:32'),
(495, 5, 'inativo', '3158', 'Supra Hot', '3158', 'Slots', NULL, 'Games/Novomatic/Supra-Hot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:31'),
(496, 5, 'inativo', '547', 'The Money Game', '547', 'Slots', NULL, 'Games/Novomatic/The-Money-Game.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:30'),
(497, 5, 'inativo', '6872', 'Totally Wild', '6872', 'Slots', NULL, 'Games/Novomatic/Totally-Wild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:29'),
(498, 5, 'inativo', '6990', 'Ultra Hot Deluxe', '6990', 'Slots', NULL, 'Games/Novomatic/Ultra-Hot-Deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:29'),
(499, 5, 'inativo', '549', 'Unicorn Magic', '549', 'Slots', NULL, 'Games/Novomatic/Unicorn-Magic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(500, 5, 'inativo', '4628', 'Wild Country', '4628', 'Slots', NULL, 'Games/Novomatic/Wild-Country.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:09', '2024-12-20 05:44:27'),
(501, 5, 'inativo', '90', 'Xtra Hot', '90', 'Slots', NULL, 'Games/Novomatic/Xtra-Hot.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(502, 6, 'inativo', '3204', 'Silver Fang', '3204', 'Slots', NULL, 'Games/Microgaming/Silver-Fang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(503, 6, 'inativo', '3203', 'Thunder Struck', '3203', 'Slots', NULL, 'Games/Microgaming/Thunder-Struck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(504, 6, 'inativo', '3202', 'Immortal Romance', '3202', 'Slots', NULL, 'Games/Microgaming/Immortal-Romance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(505, 6, 'inativo', '3201', 'Game Of Thrones', '3201', 'Slots', NULL, 'Games/Microgaming/Game-Of-Thrones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(506, 6, 'inativo', '4210', 'Burning Desire', '4210', 'Slots', NULL, 'Games/Microgaming/Burning-Desire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(507, 6, 'inativo', '4209', 'Alaskan Fishing', '4209', 'Slots', NULL, 'Games/Microgaming/Alaskan-Fishing.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(508, 6, 'inativo', '4208', 'Agent Jane Blonde', '4208', 'Slots', NULL, 'Games/Microgaming/Agent-Jane-Blonde.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(509, 6, 'inativo', '4191', 'Tomb Raider', '4191', 'Slots', NULL, 'Games/Microgaming/Tomb-Raider.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(510, 6, 'inativo', '4190', 'Deck the Halls', '4190', 'Slots', NULL, 'Games/Microgaming/Deck-the-Halls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(511, 6, 'inativo', '4240', 'Six Acrobats', '4240', 'Slots', NULL, 'Games/Microgaming/Six-Acrobats.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(512, 6, 'inativo', '4239', 'Beautiful Bones', '4239', 'Slots', NULL, 'Games/Microgaming/Beautiful-Bones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(513, 6, 'inativo', '4218', 'Monster Wheels', '4218', 'Slots', NULL, 'Games/Microgaming/Monster-Wheels.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(514, 6, 'inativo', '4260', 'Mermaids Millions', '4260', 'Slots', NULL, 'Games/Microgaming/Mermaids-Millions.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(515, 6, 'inativo', '4264', 'King Tusk', '4264', 'Slots', NULL, 'Games/Microgaming/King-Tusk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(516, 6, 'inativo', '4263', 'Secret Romance', '4263', 'Slots', NULL, 'Games/Microgaming/Secret-Romance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(517, 6, 'inativo', '4275', 'High Lander', '4275', 'Slots', NULL, 'Games/Microgaming/High-Lander.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(518, 6, 'inativo', '4273', 'Cool Wolf', '4273', 'Slots', NULL, 'Games/Microgaming/Cool-Wolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(519, 6, 'inativo', '6712', 'Break Away', '6712', 'Slots', NULL, 'Games/Microgaming/Break-Away.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(520, 6, 'inativo', '6905', 'Ancient Fortunes Zeus', '6905', 'Slots', NULL, 'Games/Microgaming/Ancient-Fortunes-Zeus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(521, 6, 'inativo', '6904', 'Tarzan Jewels of Opar', '6904', 'Slots', NULL, 'Games/Microgaming/Tarzan-Jewels-of-Opar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(522, 6, 'inativo', '6903', 'Emperor of the Sea', '6903', 'Slots', NULL, 'Games/Microgaming/Emperor-of-the-Sea.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(523, 6, 'inativo', '6937', 'Age Of Conquest', '6937', 'Slots', NULL, 'Games/Microgaming/Age-Of-Conquest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(524, 6, 'inativo', '7000', 'Avalon', '7000', 'Slots', NULL, 'Games/Microgaming/Avalon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(525, 6, 'inativo', '6999', 'Titans of the Sun Theia', '6999', 'Slots', NULL, 'Games/Microgaming/Titans-of-the-Sun-Theia.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(526, 6, 'inativo', '7049', '9 Masks of Fire', '7049', 'Slots', NULL, 'Games/Microgaming/9-Masks-of-Fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(527, 6, 'inativo', '7057', '9 Pots of Gold', '7057', 'Slots', NULL, 'Games/Microgaming/9-Pots-of-Gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(528, 6, 'inativo', '7708', 'Assassin Moon', '7708', 'Slots', NULL, 'Games/Microgaming/Assassin-Moon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(529, 7, 'inativo', 'SGReturnToTheFeature', 'Return to the Future', 'SGReturnToTheFeature', 'Slots', NULL, 'Games/Habanero/SGReturnToTheFeature.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(530, 7, 'inativo', 'SGTabernaDeLosMuertosUltra', 'Tevena de los Muirtos Ultra', 'SGTabernaDeLosMuertosUltra', 'Slots', NULL, 'Games/Habanero/SGTabernaDeLosMuertosUltra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(531, 7, 'inativo', 'SGTotemTowers', 'Totem towers', 'SGTotemTowers', 'Slots', NULL, 'Games/Habanero/SGTotemTowers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(532, 7, 'inativo', 'SGChristmasGiftRush', 'Christmas Kipoot Rush', 'SGChristmasGiftRush', 'Slots', NULL, 'Games/Habanero/SGChristmasGiftRush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(533, 7, 'inativo', 'SGOrbsOfAtlantis', 'Overs of Atlantis', 'SGOrbsOfAtlantis', 'Slots', NULL, 'Games/Habanero/SGOrbsOfAtlantis.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(534, 7, 'inativo', 'SGBeforeTimeRunsOut', 'Before Time Runner Out', 'SGBeforeTimeRunsOut', 'Slots', NULL, 'Games/Habanero/SGBeforeTimeRunsOut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(535, 7, 'inativo', 'SGTechnoTumble', 'Techno tumble', 'SGTechnoTumble', 'Slots', NULL, 'Games/Habanero/SGTechnoTumble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(536, 7, 'inativo', 'SGHappyApe', 'Happy ape', 'SGHappyApe', 'Slots', NULL, 'Games/Habanero/SGHappyApe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(537, 7, 'inativo', 'SGTabernaDeLosMuertos', 'Tevena di los Muertos', 'SGTabernaDeLosMuertos', 'Slots', NULL, 'Games/Habanero/SGTabernaDeLosMuertos.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(538, 7, 'inativo', 'SGNaughtySanta', 'Notty Santa', 'SGNaughtySanta', 'Slots', NULL, 'Games/Habanero/SGNaughtySanta.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(539, 7, 'inativo', 'SGFaCaiShenDeluxe', 'Pakai Sen Deluxe', 'SGFaCaiShenDeluxe', 'Slots', NULL, 'Games/Habanero/SGFaCaiShenDeluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(540, 7, 'inativo', 'SGHeySushi', 'Hey sushi', 'SGHeySushi', 'Slots', NULL, 'Games/Habanero/SGHeySushi.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(541, 7, 'inativo', 'SGKnockoutFootballRush', 'Knockout football rush', 'SGKnockoutFootballRush', 'Slots', NULL, 'Games/Habanero/SGKnockoutFootballRush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(542, 7, 'inativo', 'SGColossalGems', 'Closal Gems', 'SGColossalGems', 'Slots', NULL, 'Games/Habanero/SGColossalGems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(543, 7, 'inativo', 'SGHotHotHalloween', 'hot hot halloween', 'SGHotHotHalloween', 'Slots', NULL, 'Games/Habanero/SGHotHotHalloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(544, 7, 'inativo', 'SGLuckyFortuneCat', 'Lucky fortune cat', 'SGLuckyFortuneCat', 'Slots', NULL, 'Games/Habanero/SGLuckyFortuneCat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(545, 7, 'inativo', 'SGHotHotFruit', 'hot hot fruit', 'SGHotHotFruit', 'Slots', NULL, 'Games/Habanero/SGHotHotFruit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(546, 7, 'inativo', 'SGMountMazuma', 'Mount Majuma', 'SGMountMazuma', 'Slots', NULL, 'Games/Habanero/SGMountMazuma.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(547, 7, 'inativo', 'SGWildTrucks', 'Wild Trucks', 'SGWildTrucks', 'Slots', NULL, 'Games/Habanero/SGWildTrucks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(548, 7, 'inativo', 'SGLuckyLucky', 'Lucky Lucky', 'SGLuckyLucky', 'Slots', NULL, 'Games/Habanero/SGLuckyLucky.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(549, 7, 'inativo', 'SGKnockoutFootball', 'Knockout football', 'SGKnockoutFootball', 'Slots', NULL, 'Games/Habanero/SGKnockoutFootball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(550, 7, 'inativo', 'SGJump', 'Jump!', 'SGJump', 'Slots', NULL, 'Games/Habanero/SGJump.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(551, 7, 'inativo', 'SGPumpkinPatch', 'Pumpkin patch', 'SGPumpkinPatch', 'Slots', NULL, 'Games/Habanero/SGPumpkinPatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(552, 7, 'inativo', 'SGWaysOfFortune', 'Way of Fortune', 'SGWaysOfFortune', 'Slots', NULL, 'Games/Habanero/SGWaysOfFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(553, 7, 'inativo', 'SGFourDivineBeasts', 'For Devine Beasts', 'SGFourDivineBeasts', 'Slots', NULL, 'Games/Habanero/SGFourDivineBeasts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(554, 7, 'inativo', 'SGPandaPanda', 'Panda panda', 'SGPandaPanda', 'Slots', NULL, 'Games/Habanero/SGPandaPanda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(555, 7, 'inativo', 'SGOceansCall', 'Ocean s Call', 'SGOceansCall', 'Slots', NULL, 'Games/Habanero/SGOceansCall.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(556, 7, 'inativo', 'SGScruffyScallywags', 'Scruffy Skellywex', 'SGScruffyScallywags', 'Slots', NULL, 'Games/Habanero/SGScruffyScallywags.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(557, 7, 'inativo', 'SGNuwa', 'Nuwa', 'SGNuwa', 'Slots', NULL, 'Games/Habanero/SGNuwa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(558, 7, 'inativo', 'SGTheKoiGate', 'Koi gate', 'SGTheKoiGate', 'Slots', NULL, 'Games/Habanero/SGTheKoiGate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(559, 7, 'inativo', 'SGFaCaiShen', 'Pacaishen', 'SGFaCaiShen', 'Slots', NULL, 'Games/Habanero/SGFaCaiShen.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(560, 7, 'inativo', 'SG12Zodiacs', '12 zodiacs', 'SG12Zodiacs', 'Slots', NULL, 'Games/Habanero/SG12Zodiacs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(561, 7, 'inativo', 'SGFireRooster', 'Fire rooster', 'SGFireRooster', 'Slots', NULL, 'Games/Habanero/SGFireRooster.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(562, 7, 'inativo', 'SGFenghuang', 'Phoenix', 'SGFenghuang', 'Slots', NULL, 'Games/Habanero/SGFenghuang.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(563, 7, 'inativo', 'SGBirdOfThunder', 'Bird of Thunder', 'SGBirdOfThunder', 'Slots', NULL, 'Games/Habanero/SGBirdOfThunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(564, 7, 'inativo', 'SGTheDeadEscape', 'The Dead Escape', 'SGTheDeadEscape', 'Slots', NULL, 'Games/Habanero/SGTheDeadEscape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(565, 7, 'inativo', 'SGBombsAway', 'Bombs Away', 'SGBombsAway', 'Slots', NULL, 'Games/Habanero/SGBombsAway.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(566, 7, 'inativo', 'SGGoldRush', 'Gold rush', 'SGGoldRush', 'Slots', NULL, 'Games/Habanero/SGGoldRush.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(567, 7, 'inativo', 'SGRuffledUp', 'Ruffled up', 'SGRuffledUp', 'Slots', NULL, 'Games/Habanero/SGRuffledUp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(568, 7, 'inativo', 'SGRomanEmpire', 'Roman empire', 'SGRomanEmpire', 'Slots', NULL, 'Games/Habanero/SGRomanEmpire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(569, 7, 'inativo', 'SGCoyoteCrash', 'Coyote crash', 'SGCoyoteCrash', 'Slots', NULL, 'Games/Habanero/SGCoyoteCrash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(570, 7, 'inativo', 'SGWickedWitch', 'Wickt Location', 'SGWickedWitch', 'Slots', NULL, 'Games/Habanero/SGWickedWitch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(571, 7, 'inativo', 'SGDragonsThrone', 'Dragon s Throne', 'SGDragonsThrone', 'Slots', NULL, 'Games/Habanero/SGDragonsThrone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(572, 7, 'inativo', 'SGBuggyBonus', 'Buggy bonus', 'SGBuggyBonus', 'Slots', NULL, 'Games/Habanero/SGBuggyBonus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(573, 7, 'inativo', 'SGGlamRock', 'Glam rock', 'SGGlamRock', 'Slots', NULL, 'Games/Habanero/SGGlamRock.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(574, 7, 'inativo', 'SGSuperTwister', 'Super twister', 'SGSuperTwister', 'Slots', NULL, 'Games/Habanero/SGSuperTwister.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(575, 7, 'inativo', 'SGTreasureTomb', 'Treasure Tomb', 'SGTreasureTomb', 'Slots', NULL, 'Games/Habanero/SGTreasureTomb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(576, 7, 'inativo', 'SGJugglenaut', 'Jugglenut', 'SGJugglenaut', 'Slots', NULL, 'Games/Habanero/SGJugglenaut.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(577, 7, 'inativo', 'SGGalacticCash', 'Glactic Cash', 'SGGalacticCash', 'Slots', NULL, 'Games/Habanero/SGGalacticCash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(578, 7, 'inativo', 'SGZeus2', 'Zeus 2', 'SGZeus2', 'Slots', NULL, 'Games/Habanero/SGZeus2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(579, 7, 'inativo', 'SGTheDragonCastle', 'Dragon castle', 'SGTheDragonCastle', 'Slots', NULL, 'Games/Habanero/SGTheDragonCastle.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(580, 7, 'inativo', 'SGKingTutsTomb', 'King Teeth Tomb', 'SGKingTutsTomb', 'Slots', NULL, 'Games/Habanero/SGKingTutsTomb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:09', '2024-12-05 23:12:09'),
(581, 7, 'inativo', 'SGCarnivalCash', 'Carnival cash', 'SGCarnivalCash', 'Slots', NULL, 'Games/Habanero/SGCarnivalCash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(582, 7, 'inativo', 'SGTreasureDiver', 'Treasure diver', 'SGTreasureDiver', 'Slots', NULL, 'Games/Habanero/SGTreasureDiver.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(583, 7, 'inativo', 'SGLittleGreenMoney', 'Little Green Money', 'SGLittleGreenMoney', 'Slots', NULL, 'Games/Habanero/SGLittleGreenMoney.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(584, 7, 'inativo', 'SGMonsterMashCash', 'Monster Mash Cash', 'SGMonsterMashCash', 'Slots', NULL, 'Games/Habanero/SGMonsterMashCash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(585, 7, 'inativo', 'SGShaolinFortunes100', 'Xiaolin Fortune 100', 'SGShaolinFortunes100', 'Slots', NULL, 'Games/Habanero/SGShaolinFortunes100.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(586, 7, 'inativo', 'SGShaolinFortunes243', 'Xiaolin Fortune', 'SGShaolinFortunes243', 'Slots', NULL, 'Games/Habanero/SGShaolinFortunes243.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(587, 7, 'inativo', 'SGWeirdScience', 'Weird Science', 'SGWeirdScience', 'Slots', NULL, 'Games/Habanero/SGWeirdScience.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(588, 7, 'inativo', 'SGBlackbeardsBounty', 'Blackbeards Bounty', 'SGBlackbeardsBounty', 'Slots', NULL, 'Games/Habanero/SGBlackbeardsBounty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(589, 7, 'inativo', 'SGDrFeelgood', 'Dr. Feelgood', 'SGDrFeelgood', 'Slots', NULL, 'Games/Habanero/SGDrFeelgood.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(590, 7, 'inativo', 'SGVikingsPlunder', 'Vikings plunder', 'SGVikingsPlunder', 'Slots', NULL, 'Games/Habanero/SGVikingsPlunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(591, 7, 'inativo', 'SGDoubleODollars', 'Double O Dollars', 'SGDoubleODollars', 'Slots', NULL, 'Games/Habanero/SGDoubleODollars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(592, 7, 'inativo', 'SGSpaceFortune', 'Space fortune', 'SGSpaceFortune', 'Slots', NULL, 'Games/Habanero/SGSpaceFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(593, 7, 'inativo', 'SGPamperMe', 'Pamper me', 'SGPamperMe', 'Slots', NULL, 'Games/Habanero/SGPamperMe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(594, 7, 'inativo', 'SGZeus', 'Zeus', 'SGZeus', 'Slots', NULL, 'Games/Habanero/SGZeus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(595, 7, 'inativo', 'SGEgyptianDreams', 'Egyptian Dreams', 'SGEgyptianDreams', 'Slots', NULL, 'Games/Habanero/SGEgyptianDreams.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:11'),
(596, 7, 'inativo', 'SGBarnstormerBucks', 'Barnstormer Bucks', 'SGBarnstormerBucks', 'Slots', NULL, 'Games/Habanero/SGBarnstormerBucks.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(597, 7, 'inativo', 'SGSuperStrike', 'Super strike', 'SGSuperStrike', 'Slots', NULL, 'Games/Habanero/SGSuperStrike.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:12'),
(598, 7, 'inativo', 'SGJungleRumble', 'Jungle rumble', 'SGJungleRumble', 'Slots', NULL, 'Games/Habanero/SGJungleRumble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(599, 7, 'inativo', 'SGArcticWonders', 'Arctic Wonders', 'SGArcticWonders', 'Slots', NULL, 'Games/Habanero/SGArcticWonders.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:13'),
(600, 7, 'inativo', 'SGTowerOfPizza', 'Tower of Pizza', 'SGTowerOfPizza', 'Slots', NULL, 'Games/Habanero/SGTowerOfPizza.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:17'),
(601, 7, 'inativo', 'SGMummyMoney', 'Mummy money', 'SGMummyMoney', 'Slots', NULL, 'Games/Habanero/SGMummyMoney.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:16'),
(602, 7, 'inativo', 'SGBikiniIsland', 'bikini island', 'SGBikiniIsland', 'Slots', NULL, 'Games/Habanero/SGBikiniIsland.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(603, 7, 'inativo', 'SGQueenOfQueens1024', 'Queen of Queens II', 'SGQueenOfQueens1024', 'Slots', NULL, 'Games/Habanero/SGQueenOfQueens1024.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(604, 7, 'inativo', 'SGDragonsRealm', 'Dragon s Realm', 'SGDragonsRealm', 'Slots', NULL, 'Games/Habanero/SGDragonsRealm.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(605, 7, 'inativo', 'SGAllForOne', 'All for one', 'SGAllForOne', 'Slots', NULL, 'Games/Habanero/SGAllForOne.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:14'),
(606, 7, 'inativo', 'SGFlyingHigh', 'Flying high', 'SGFlyingHigh', 'Slots', NULL, 'Games/Habanero/SGFlyingHigh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(607, 7, 'inativo', 'SGMrBling', 'Mr. Bling', 'SGMrBling', 'Slots', NULL, 'Games/Habanero/SGMrBling.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(608, 7, 'inativo', 'SGMysticFortune', 'Mystic Fortune', 'SGMysticFortune', 'Slots', NULL, 'Games/Habanero/SGMysticFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(609, 7, 'inativo', 'SGQueenOfQueens243', 'Queen of queens', 'SGQueenOfQueens243', 'Slots', NULL, 'Games/Habanero/SGQueenOfQueens243.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(610, 7, 'inativo', 'SGGrapeEscape', 'The Graph Escape', 'SGGrapeEscape', 'Slots', NULL, 'Games/Habanero/SGGrapeEscape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(611, 7, 'inativo', 'SGGoldenUnicorn', 'Golden unicorn', 'SGGoldenUnicorn', 'Slots', NULL, 'Games/Habanero/SGGoldenUnicorn.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(612, 7, 'inativo', 'SGFrontierFortunes', 'Frontier Fortune', 'SGFrontierFortunes', 'Slots', NULL, 'Games/Habanero/SGFrontierFortunes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(613, 7, 'inativo', 'SGIndianCashCatcher', 'Indian Cash Catcher', 'SGIndianCashCatcher', 'Slots', NULL, 'Games/Habanero/SGIndianCashCatcher.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(614, 7, 'inativo', 'SGSkysTheLimit', 'Skys the Limit', 'SGSkysTheLimit', 'Slots', NULL, 'Games/Habanero/SGSkysTheLimit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(615, 7, 'inativo', 'SGTheBigDeal', 'The Big Deal', 'SGTheBigDeal', 'Slots', NULL, 'Games/Habanero/SGTheBigDeal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(616, 7, 'inativo', 'SGCashosaurus', 'Cashosaurus', 'SGCashosaurus', 'Slots', NULL, 'Games/Habanero/SGCashosaurus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(617, 7, 'inativo', 'SGDiscoFunk', 'Disco funk', 'SGDiscoFunk', 'Slots', NULL, 'Games/Habanero/SGDiscoFunk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(618, 7, 'inativo', 'SGCalaverasExplosivas', 'Calaveras Explociba', 'SGCalaverasExplosivas', 'Slots', NULL, 'Games/Habanero/SGCalaverasExplosivas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(619, 7, 'inativo', 'SGNineTails', 'Nine Tales', 'SGNineTails', 'Slots', NULL, 'Games/Habanero/SGNineTails.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(620, 7, 'inativo', 'SGMysticFortuneDeluxe', 'Mystic Fortune Deluxe', 'SGMysticFortuneDeluxe', 'Slots', NULL, 'Games/Habanero/SGMysticFortuneDeluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(621, 7, 'inativo', 'SGLuckyDurian', 'Lucky durian', 'SGLuckyDurian', 'Slots', NULL, 'Games/Habanero/SGLuckyDurian.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(622, 7, 'inativo', 'SGDiscoBeats', 'Disco beat', 'SGDiscoBeats', 'Slots', NULL, 'Games/Habanero/SGDiscoBeats.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:18'),
(623, 7, 'inativo', 'SGLanternLuck', 'Lantern lucky', 'SGLanternLuck', 'Slots', NULL, 'Games/Habanero/SGLanternLuck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(624, 7, 'inativo', 'SGBombRunner', 'Boom runner', 'SGBombRunner', 'Slots', NULL, 'Games/Habanero/SGBombRunner.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:10', '2024-12-20 05:46:19'),
(625, 7, 'inativo', '6789', 'Hot Hot Fruit', '6789', 'Slots', NULL, 'Games/Habanero/Hot-Hot-Fruit.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(626, 7, 'inativo', '6811', 'Nuwa', '6811', 'Slots', NULL, 'Games/Habanero/Nuwa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(627, 7, 'inativo', '6893', 'Hot Hot Halloween', '6893', 'Slots', NULL, 'Games/Habanero/Hot-Hot-Halloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(628, 7, 'inativo', '6933', 'Happy Ape', '6933', 'Slots', NULL, 'Games/Habanero/Happy-Ape.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(629, 7, 'inativo', '6932', 'Panda Panda', '6932', 'Slots', NULL, 'Games/Habanero/Panda-Panda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(630, 7, 'inativo', '6931', 'Lucky Fortune Cat', '6931', 'Slots', NULL, 'Games/Habanero/Lucky-Fortune-Cat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(631, 8, 'inativo', '7820', 'Xmas Joker', '7820', 'Slots', NULL, 'Games/Playngo/Xmas-Joker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(632, 8, 'inativo', '7819', 'Wild Blood', '7819', 'Slots', NULL, 'Games/Playngo/Wild-Blood.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(633, 8, 'inativo', '7818', 'Sticky Joker', '7818', 'Slots', NULL, 'Games/Playngo/Sticky-Joker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-12-05 23:12:10', '2024-12-07 02:40:17'),
(634, 8, 'inativo', '7817', 'Star Joker', '7817', 'Slots', NULL, 'Games/Playngo/Star-Joker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(635, 8, 'inativo', '7816', 'Space Race', '7816', 'Slots', NULL, 'Games/Playngo/Space-Race.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(636, 8, 'inativo', '7815', 'Sizzling Spins', '7815', 'Slots', NULL, 'Games/Playngo/Sizzling-Spins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(637, 8, 'inativo', '7814', 'Scroll of Dead', '7814', 'Slots', NULL, 'Games/Playngo/Scroll-of-Dead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(638, 8, 'inativo', '7813', 'Saxon', '7813', 'Slots', NULL, 'Games/Playngo/Saxon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(639, 8, 'inativo', '7812', 'Sails of Gold', '7812', 'Slots', NULL, 'Games/Playngo/Sails-of-Gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(640, 8, 'inativo', '7811', 'Royal Masquerade', '7811', 'Slots', NULL, 'Games/Playngo/Royal-Masquerade.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(641, 8, 'inativo', '7810', 'Rise of Merlin', '7810', 'Slots', NULL, 'Games/Playngo/Rise-of-Merlin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(642, 8, 'inativo', '7809', 'Rise of Athena', '7809', 'Slots', NULL, 'Games/Playngo/Rise-of-Athena.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(643, 8, 'inativo', '7808', 'Riches of RA', '7808', 'Slots', NULL, 'Games/Playngo/Riches-of-RA.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(644, 8, 'inativo', '7807', 'Rich Wilde and the Amulet of Dead', '7807', 'Slots', NULL, 'Games/Playngo/Rich-Wilde-and-the-Amulet-of-Dead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(645, 8, 'inativo', '7806', 'Prosperity Palace', '7806', 'Slots', NULL, 'Games/Playngo/Prosperity-Palace.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(646, 8, 'inativo', '7805', 'Prism of Gems', '7805', 'Slots', NULL, 'Games/Playngo/Prism-of-Gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(647, 8, 'inativo', '7804', 'Photo Safari', '7804', 'Slots', NULL, 'Games/Playngo/Photo-Safari.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(648, 8, 'inativo', '7803', 'Pearl Lagoon', '7803', 'Slots', NULL, 'Games/Playngo/Pearl-Lagoon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(649, 8, 'inativo', '7802', 'New Year Riches', '7802', 'Slots', NULL, 'Games/Playngo/New-Year-Riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(650, 8, 'inativo', '7801', 'Mystery Joker', '7801', 'Slots', NULL, 'Games/Playngo/Mystery-Joker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(651, 8, 'inativo', '7800', 'MultiFruit 81', '7800', 'Slots', NULL, 'Games/Playngo/MultiFruit-81.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(652, 8, 'inativo', '7799', 'Miner Donkey Trouble', '7799', 'Slots', NULL, 'Games/Playngo/Miner-Donkey-Trouble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(653, 8, 'inativo', '7798', 'Lord Merlin and the Lady of the Lake', '7798', 'Slots', NULL, 'Games/Playngo/Lord-Merlin-and-the-Lady-of-the-Lake.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(654, 8, 'inativo', '7797', 'Legacy of Dead', '7797', 'Slots', NULL, 'Games/Playngo/Legacy-of-Dead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(655, 8, 'inativo', '7796', 'Irish Gold', '7796', 'Slots', NULL, 'Games/Playngo/Irish-Gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(656, 8, 'inativo', '7795', 'House of Doom', '7795', 'Slots', NULL, 'Games/Playngo/House-of-Doom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(657, 8, 'inativo', '7794', 'Happy Halloween', '7794', 'Slots', NULL, 'Games/Playngo/Happy-Halloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(658, 8, 'inativo', '7793', 'Golden Legend', '7793', 'Slots', NULL, 'Games/Playngo/Golden-Legend.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:10', '2024-12-05 23:12:10'),
(659, 8, 'inativo', '7792', 'Gold Trophy', '7792', 'Slots', NULL, 'Games/Playngo/Gold-Trophy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(660, 8, 'inativo', '7791', 'Ghost of Dead', '7791', 'Slots', NULL, 'Games/Playngo/Ghost-of-Dead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(661, 8, 'inativo', '7790', 'Fu Er Dai', '7790', 'Slots', NULL, 'Games/Playngo/Fu-Er-Dai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(662, 8, 'inativo', '7789', 'Dragonship', '7789', 'Slots', NULL, 'Games/Playngo/Dragonship.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(663, 8, 'inativo', '7788', 'Doom of Egypt', '7788', 'Slots', NULL, 'Games/Playngo/Doom-of-Egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(664, 8, 'inativo', '7787', 'Disco Diamonds', '7787', 'Slots', NULL, 'Games/Playngo/Disco-Diamonds.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(665, 8, 'inativo', '7786', 'Dawn of Egypt', '7786', 'Slots', NULL, 'Games/Playngo/Dawn-of-Egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(666, 8, 'inativo', '7785', 'Danish Flip', '7785', 'Slots', NULL, 'Games/Playngo/Danish-Flip.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(667, 8, 'inativo', '7784', 'Crystal Sun', '7784', 'Slots', NULL, 'Games/Playngo/Crystal-Sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(668, 8, 'inativo', '7783', 'CopsnRobbers', '7783', 'Slots', NULL, 'Games/Playngo/CopsnRobbers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(669, 8, 'inativo', '7782', 'Coils of Cash', '7782', 'Slots', NULL, 'Games/Playngo/Coils-of-Cash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(670, 8, 'inativo', '7781', 'Charlie Chance', '7781', 'Slots', NULL, 'Games/Playngo/Charlie-Chance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(671, 8, 'inativo', '7780', 'Cat Wilde and the Doom of Dead', '7780', 'Slots', NULL, 'Games/Playngo/Cat-Wilde-and-the-Doom-of-Dead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(672, 8, 'inativo', '7779', 'Book of Dead', '7779', 'Slots', NULL, 'Games/Playngo/Book-of-Dead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(673, 8, 'inativo', '7778', 'Blinged', '7778', 'Slots', NULL, 'Games/Playngo/Blinged.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(674, 8, 'inativo', '7777', 'Aztec Idols', '7777', 'Slots', NULL, 'Games/Playngo/Aztec-Idols.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(675, 8, 'inativo', '7776', '5xMagic', '7776', 'Slots', NULL, 'Games/Playngo/5xMagic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(676, 8, 'inativo', '7775', '3 Clown Monty', '7775', 'Slots', NULL, 'Games/Playngo/3-Clown-Monty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(677, 8, 'inativo', '8107', 'Blazin Bullfrog', '8107', 'Slots', NULL, 'Games/Playngo/Blazin-Bullfrog.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(678, 8, 'inativo', '8106', 'Big win 777', '8106', 'Slots', NULL, 'Games/Playngo/Big-win-777.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(679, 8, 'inativo', '8127', 'Leprechauns Vault', '8127', 'Slots', NULL, 'Games/Playngo/Leprechauns-Vault.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(680, 8, 'inativo', '8142', 'Athena Ascending', '8142', 'Slots', NULL, 'Games/Playngo/Athena-Ascending.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(681, 16, 'inativo', '72', 'Happy Rich Year', '72', 'Slots', NULL, 'Games/Cq9/72.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:14'),
(682, 9, 'inativo', '7194', 'Twin Spin Deluxe', '7194', 'Slots', NULL, 'Games/NetEnt/Twin-Spin-Deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(683, 9, 'inativo', '7109', 'Twin Spin MegaWays', '7109', 'Slots', NULL, 'Games/NetEnt/Twin-Spin-MegaWays.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(684, 9, 'inativo', '7108', 'Vegas Night Life', '7108', 'Slots', NULL, 'Games/NetEnt/Vegas-Night-Life.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(685, 9, 'inativo', '529', 'Victorious', '529', 'Slots', NULL, 'Games/NetEnt/Victorious.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(686, 9, 'inativo', '7160', 'Vikings', '7160', 'Slots', NULL, 'Games/NetEnt/Vikings.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(687, 9, 'inativo', '7165', 'Wild Bazaar', '7165', 'Slots', NULL, 'Games/NetEnt/Wild-Bazaar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(688, 9, 'inativo', '7107', 'Wilderland', '7107', 'Slots', NULL, 'Games/NetEnt/Wilderland.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(689, 9, 'inativo', '7154', 'Wild Turkey', '7154', 'Slots', NULL, 'Games/NetEnt/Wild-Turkey.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(690, 9, 'inativo', '523', 'Wild Watér', '523', 'Slots', NULL, 'Games/NetEnt/Wild-Watér.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(691, 9, 'inativo', '7150', 'Wild Worlds', '7150', 'Slots', NULL, 'Games/NetEnt/Wild-Worlds.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(692, 9, 'inativo', '7123', 'Wings of Riches', '7123', 'Slots', NULL, 'Games/NetEnt/Wings-of-Riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(693, 9, 'inativo', '7102', 'Wonderland Protector', '7102', 'Slots', NULL, 'Games/NetEnt/Wonderland-Protector.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(694, 9, 'inativo', '441', 'King of Slots', '441', 'Slots', NULL, 'Games/NetEnt/King-of-Slots.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(695, 9, 'inativo', '7178', 'Lost Relics', '7178', 'Slots', NULL, 'Games/NetEnt/Lost-Relics.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(696, 9, 'inativo', '7188', 'Lucky Angler', '7188', 'Slots', NULL, 'Games/NetEnt/Lucky-Angler.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(697, 9, 'inativo', '533', 'Magic Portals', '533', 'Slots', NULL, 'Games/NetEnt/Magic-Portals.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(698, 9, 'inativo', '4164', 'Motorhead', '4164', 'Slots', NULL, 'Games/NetEnt/Motorhead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(699, 9, 'inativo', '7174', 'Mr Green: Grand Tour', '7174', 'Slots', NULL, 'Games/NetEnt/Mr-Green_-Grand-Tour.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(700, 9, 'inativo', '7173', 'Mr Green: Moonlight', '7173', 'Slots', NULL, 'Games/NetEnt/Mr-Green_-Moonlight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(701, 9, 'inativo', '7125', 'Ozzy Osbourne', '7125', 'Slots', NULL, 'Games/NetEnt/Ozzy-Osbourne.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(702, 9, 'inativo', '7054', 'Piraté from the East', '7054', 'Slots', NULL, 'Games/NetEnt/Piraté-from-the-East.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(703, 9, 'inativo', '7186', 'Planet of the Apes', '7186', 'Slots', NULL, 'Games/NetEnt/Planet-of-the-Apes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(704, 9, 'inativo', '7127', 'Reel Rush 2', '7127', 'Slots', NULL, 'Games/NetEnt/Reel-Rush-2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(705, 16, 'inativo', '26', '777', '26', 'Slots', NULL, 'Games/Cq9/26.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:14'),
(706, 9, 'inativo', '7106', 'Riches of Midgard', '7106', 'Slots', NULL, 'Games/NetEnt/Riches-of-Midgard.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(707, 9, 'inativo', '7122', 'Rise of Maya', '7122', 'Slots', NULL, 'Games/NetEnt/Rise-of-Maya.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(708, 9, 'inativo', '7152', 'Robin Hood', '7152', 'Slots', NULL, 'Games/NetEnt/Robin-Hood.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(709, 9, 'inativo', '7124', 'Santa vs Rudolf', '7124', 'Slots', NULL, 'Games/NetEnt/Santa-vs-Rudolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(710, 9, 'inativo', '7197', 'Scruffy Duck', '7197', 'Slots', NULL, 'Games/NetEnt/Scruffy-Duck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(711, 9, 'inativo', '7187', 'Secret Of The Stones', '7187', 'Slots', NULL, 'Games/NetEnt/Secret-Of-The-Stones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(712, 9, 'inativo', '4163', 'Secrets of Atlantis', '4163', 'Slots', NULL, 'Games/NetEnt/Secrets-of-Atlantis.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(713, 9, 'inativo', '179', 'StarBurst', '179', 'Slots', NULL, 'Games/NetEnt/StarBurst.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(714, 9, 'inativo', '7112', 'Street Fighter II: The World Warrior', '7112', 'Slots', NULL, 'Games/NetEnt/Street-Fighter-II_-The-World-Warrior.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(715, 9, 'inativo', '7157', 'Strolling Staxx', '7157', 'Slots', NULL, 'Games/NetEnt/Strolling-Staxx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(716, 9, 'inativo', '7111', 'Super Striker', '7111', 'Slots', NULL, 'Games/NetEnt/Super-Striker.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(717, 9, 'inativo', '7053', 'Sweety Honey Fruity', '7053', 'Slots', NULL, 'Games/NetEnt/Sweety-Honey-Fruity.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(718, 9, 'inativo', '7172', 'Swipe & Roll', '7172', 'Slots', NULL, 'Games/NetEnt/SwipeRoll.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(719, 9, 'inativo', '7130', 'The Wish Master', '7130', 'Slots', NULL, 'Games/NetEnt/The-Wish-Master.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(720, 9, 'inativo', '7110', 'Trollpot 5000', '7110', 'Slots', NULL, 'Games/NetEnt/Trollpot-5000.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(721, 9, 'inativo', '7158', 'Turn Your Fortune', '7158', 'Slots', NULL, 'Games/NetEnt/Turn-Your-Fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(722, 9, 'inativo', '7055', 'Twin Happiness', '7055', 'Slots', NULL, 'Games/NetEnt/Twin-Happiness.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(723, 9, 'inativo', '7170', 'Jumanji', '7170', 'Slots', NULL, 'Games/NetEnt/Jumanji.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(724, 9, 'inativo', '7133', 'King of 3 Kingdoms', '7133', 'Slots', NULL, 'Games/NetEnt/King-of-3-Kingdoms.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(725, 9, 'inativo', '7126', 'Long Pao', '7126', 'Slots', NULL, 'Games/NetEnt/Long-Pao.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(726, 9, 'inativo', '7128', 'Magic Maid Cafe', '7128', 'Slots', NULL, 'Games/NetEnt/Magic-Maid-Cafe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(727, 9, 'inativo', '544', 'Reel Steal', '544', 'Slots', NULL, 'Games/NetEnt/Reel-Steal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(728, 9, 'inativo', '489', 'Jimi Hendrix', '489', 'Slots', NULL, 'Games/NetEnt/Jimi-Hendrix.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(729, 9, 'inativo', '7159', 'Jingle Spin', '7159', 'Slots', NULL, 'Games/NetEnt/Jingle-Spin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(730, 10, 'inativo', 'hand_of_gold', 'HAND OF GOLD', 'hand_of_gold', 'Slots', NULL, 'Games/Playson/hand_of_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:45:59'),
(731, 10, 'inativo', 'legend_of_cleopatra', 'LEGEND OF CLEOPATRA', 'legend_of_cleopatra', 'Slots', NULL, 'Games/Playson/legend_of_cleopatra.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:45:59'),
(732, 10, 'inativo', '40_joker_staxx', '40 JOKER STAXX', '40_joker_staxx', 'Slots', NULL, 'Games/Playson/40_joker_staxx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:46:00'),
(733, 10, 'inativo', 'burning_wins', 'BURNING WINS', 'burning_wins', 'Slots', NULL, 'Games/Playson/burning_wins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:46:00'),
(734, 10, 'inativo', 'book_of_gold', 'BOOK OF GOLD', 'book_of_gold', 'Slots', NULL, 'Games/Playson/book_of_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:46:01'),
(735, 10, 'inativo', '100_joker_staxx', '100 JOKER STAXX', '100_joker_staxx', 'Slots', NULL, 'Games/Playson/100_joker_staxx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:46:02'),
(736, 10, 'inativo', 'book_of_gold_classic', 'BOOK OF GOLD CLASSIC', 'book_of_gold_classic', 'Slots', NULL, 'Games/Playson/book_of_gold_classic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:46:03'),
(737, 10, 'inativo', 'buffalo_xmas', 'BUFFALO XMAS', 'buffalo_xmas', 'Slots', NULL, 'Games/Playson/buffalo_xmas.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:11', '2024-12-20 05:46:04'),
(738, 11, 'inativo', '1hl323e1lxuqdrkr', 'Auto Mega Roulette', '1hl323e1lxuqdrkr', 'Aovivo', NULL, 'Games/Pragmaticlive/1hl323e1lxuqdrkr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 2, 0, 0, '2024-12-05 23:12:11', '2024-12-20 05:31:21'),
(739, 11, 'inativo', '1hl65ce1lxuqdrkr', 'Mega Roulette', '1hl65ce1lxuqdrkr', 'Aovivo', NULL, 'Games/Pragmaticlive/1hl65ce1lxuqdrkr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(740, 11, 'inativo', '5bzl2835s5ruvweg', 'AUTO_ROULETTE', '5bzl2835s5ruvweg', 'Aovivo', NULL, 'Games/Pragmaticlive/5bzl2835s5ruvweg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(741, 11, 'inativo', 'autorwra311autor', 'SPEED_AUTO_ROULETTE', 'autorwra311autor', 'Aovivo', NULL, 'Games/Pragmaticlive/autorwra311autor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(742, 11, 'inativo', 'chroma229rwltr22', 'Roulette Ruby', 'chroma229rwltr22', 'Aovivo', NULL, 'Games/Pragmaticlive/chroma229rwltr22.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(743, 11, 'inativo', 'fl9knouu0yjez2wi', 'Speed Roulette 1', 'fl9knouu0yjez2wi', 'Aovivo', NULL, 'Games/Pragmaticlive/fl9knouu0yjez2wi.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(744, 11, 'inativo', 'g03y1t9vvuhrfytl', 'Roulette Azure', 'g03y1t9vvuhrfytl', 'Aovivo', NULL, 'Games/Pragmaticlive/g03y1t9vvuhrfytl.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(745, 11, 'inativo', 'lucky6roulettea3', 'Lucky 6 Roulette', 'lucky6roulettea3', 'Aovivo', NULL, 'Games/Pragmaticlive/lucky6roulettea3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(746, 11, 'inativo', 'p8l1j84prrmxzyic', 'TURKISH_ROULETTE', 'p8l1j84prrmxzyic', 'Aovivo', NULL, 'Games/Pragmaticlive/p8l1j84prrmxzyic.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(747, 11, 'inativo', 'r20speedrtwo201s', 'SPEED_ROULETTE_2', 'r20speedrtwo201s', 'Aovivo', NULL, 'Games/Pragmaticlive/r20speedrtwo201s.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(748, 11, 'inativo', 'rmycjoqq18k2r161', 'ROULETTE_INDIAN', 'rmycjoqq18k2r161', 'Aovivo', NULL, 'Games/Pragmaticlive/rmycjoqq18k2r161.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(749, 11, 'inativo', 'romania233rwl291', 'ROMANIAN_ROULETTE', 'romania233rwl291', 'Aovivo', NULL, 'Games/Pragmaticlive/romania233rwl291.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(750, 11, 'inativo', 'roulerw234rwl292', 'SPANISH_ROULETTE', 'roulerw234rwl292', 'Aovivo', NULL, 'Games/Pragmaticlive/roulerw234rwl292.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(751, 11, 'inativo', 's2x6b4jdeqza2ge2', 'GERMAN_ROULETTE', 's2x6b4jdeqza2ge2', 'Aovivo', NULL, 'Games/Pragmaticlive/s2x6b4jdeqza2ge2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(752, 11, 'inativo', 't4jzencinod6iqwi', 'RUSSIAN_ROULETTE', 't4jzencinod6iqwi', 'Aovivo', NULL, 'Games/Pragmaticlive/t4jzencinod6iqwi.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(753, 11, 'inativo', 'v1c52fgw7yy02upz', 'ROULETTE_ITALIA_TRICOLORE', 'v1c52fgw7yy02upz', 'Aovivo', NULL, 'Games/Pragmaticlive/v1c52fgw7yy02upz.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:11', '2024-12-05 23:12:11'),
(754, 11, 'inativo', 'yqpz3ichst2xg439', 'ROULETTE_MACAO', 'yqpz3ichst2xg439', 'Aovivo', NULL, 'Games/Pragmaticlive/yqpz3ichst2xg439.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(755, 11, 'inativo', '2q57e43m4ivqwaq3', 'SPEED_BACCARAT_6', '2q57e43m4ivqwaq3', 'Aovivo', NULL, 'Games/Pragmaticlive/2q57e43m4ivqwaq3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(756, 11, 'inativo', '886ewimul28yw14j', 'SPEED_BACCARAT_5', '886ewimul28yw14j', 'Aovivo', NULL, 'Games/Pragmaticlive/886ewimul28yw14j.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(757, 11, 'inativo', '9j3eagurfwmml7z2', 'BACCARAT_2', '9j3eagurfwmml7z2', 'Aovivo', NULL, 'Games/Pragmaticlive/9j3eagurfwmml7z2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(758, 11, 'inativo', 'b0jf7rlboleibnap', 'SPEED_BACCARAT_14', 'b0jf7rlboleibnap', 'Aovivo', NULL, 'Games/Pragmaticlive/b0jf7rlboleibnap.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(759, 11, 'inativo', 'bcapuntobanco001', 'PUNTO_BANCO_ITALIA_TRICOLORE', 'bcapuntobanco001', 'Aovivo', NULL, 'Games/Pragmaticlive/bcapuntobanco001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(760, 11, 'inativo', 'bcpirpmfpeobc191', 'BACCARAT_7', 'bcpirpmfpeobc191', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc191.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(761, 11, 'inativo', 'bcpirpmfpeobc192', 'BACCARAT_8', 'bcpirpmfpeobc192', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc192.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(762, 11, 'inativo', 'bcpirpmfpeobc193', 'SPEED_BACCARAT_15', 'bcpirpmfpeobc193', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc193.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(763, 11, 'inativo', 'bcpirpmfpeobc194', 'SPEED_BACCARAT_10', 'bcpirpmfpeobc194', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc194.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(764, 11, 'inativo', 'bcpirpmfpeobc196', 'SPEED_BACCARAT_9', 'bcpirpmfpeobc196', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc196.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(765, 11, 'inativo', 'bcpirpmfpeobc197', 'SPEED_BACCARAT_7', 'bcpirpmfpeobc197', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc197.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(766, 11, 'inativo', 'bcpirpmfpeobc198', 'SPEED_BACCARAT_8', 'bcpirpmfpeobc198', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc198.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(767, 11, 'inativo', 'bcpirpmfpeobc199', 'SUPER_8_BACCARAT', 'bcpirpmfpeobc199', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpeobc199.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(768, 11, 'inativo', 'bcpirpmfpobc1910', 'FORTUNE_6_BACCARAT', 'bcpirpmfpobc1910', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpobc1910.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(769, 11, 'inativo', 'bcpirpmfpobc1912', 'BACCARAT_9', 'bcpirpmfpobc1912', 'Aovivo', NULL, 'Games/Pragmaticlive/bcpirpmfpobc1912.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(770, 11, 'inativo', 'cbcf6qas8fscb221', 'SPEED_BACCARAT_12', 'cbcf6qas8fscb221', 'Aovivo', NULL, 'Games/Pragmaticlive/cbcf6qas8fscb221.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(771, 11, 'inativo', 'cbcf6qas8fscb222', 'BACCARAT_3', 'cbcf6qas8fscb222', 'Aovivo', NULL, 'Games/Pragmaticlive/cbcf6qas8fscb222.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(772, 11, 'inativo', 'cbcf6qas8fscb224', 'SPEED_BACCARAT_11', 'cbcf6qas8fscb224', 'Aovivo', NULL, 'Games/Pragmaticlive/cbcf6qas8fscb224.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(773, 11, 'inativo', 'h22z8qhp17sa0vkh', 'BACCARAT_1', 'h22z8qhp17sa0vkh', 'Aovivo', NULL, 'Games/Pragmaticlive/h22z8qhp17sa0vkh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(774, 11, 'inativo', 'kkqnazmd8ttq7fgd', 'SPEED_BACCARAT_2', 'kkqnazmd8ttq7fgd', 'Aovivo', NULL, 'Games/Pragmaticlive/kkqnazmd8ttq7fgd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(775, 11, 'inativo', 'm88hicogrzeod202', 'SPEED_BACCARAT_13', 'm88hicogrzeod202', 'Aovivo', NULL, 'Games/Pragmaticlive/m88hicogrzeod202.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(776, 11, 'inativo', 'mbc371rpmfmbc371', 'MEGA_BACCARAT', 'mbc371rpmfmbc371', 'Aovivo', NULL, 'Games/Pragmaticlive/mbc371rpmfmbc371.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(777, 11, 'inativo', 'ne074fgn4bd1150i', 'BACCARAT_5', 'ne074fgn4bd1150i', 'Aovivo', NULL, 'Games/Pragmaticlive/ne074fgn4bd1150i.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(778, 11, 'inativo', 'oq808ojps709qqaf', 'BACCARAT_6', 'oq808ojps709qqaf', 'Aovivo', NULL, 'Games/Pragmaticlive/oq808ojps709qqaf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(779, 11, 'inativo', 'pwnhicogrzeodk79', 'SPEED_BACCARAT_1', 'pwnhicogrzeodk79', 'Aovivo', NULL, 'Games/Pragmaticlive/pwnhicogrzeodk79.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(780, 11, 'inativo', 's8s9f0quk3ygiyb1', 'SPEED_BACCARAT_3', 's8s9f0quk3ygiyb1', 'Aovivo', NULL, 'Games/Pragmaticlive/s8s9f0quk3ygiyb1.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(781, 11, 'inativo', 'lc419kkmr2sxfpbk', 'MEGA_SIC_BO', 'lc419kkmr2sxfpbk', 'Aovivo', NULL, 'Games/Pragmaticlive/lc419kkmr2sxfpbk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(782, 11, 'inativo', 'sba71kkmr2ssba71', 'SICBO', 'sba71kkmr2ssba71', 'Aovivo', NULL, 'Games/Pragmaticlive/sba71kkmr2ssba71.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(783, 11, 'inativo', 'md500q83g7cdefw1', 'MEGA_WHEEL', 'md500q83g7cdefw1', 'Aovivo', NULL, 'Games/Pragmaticlive/md500q83g7cdefw1.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(784, 11, 'inativo', 'ge49e4os88bp4bi5', 'DRAGON_TIGER', 'ge49e4os88bp4bi5', 'Aovivo', NULL, 'Games/Pragmaticlive/ge49e4os88bp4bi5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(785, 11, 'inativo', 'pbvzrfk1fyft4dwe', 'SWEET_BONANZA_CANDYLAND', 'pbvzrfk1fyft4dwe', 'Aovivo', NULL, 'Games/Pragmaticlive/pbvzrfk1fyft4dwe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(786, 11, 'inativo', 'jzbzy021lg8xy9i2', 'ANDAR_BAHAR', 'jzbzy021lg8xy9i2', 'Aovivo', NULL, 'Games/Pragmaticlive/jzbzy021lg8xy9i2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(787, 11, 'inativo', 'bigbassnewbb1320', 'BIG_BASS_CRASH', 'bigbassnewbb1320', 'Crash', NULL, 'Games/Pragmaticlive/bigbassnewbb1320.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(788, 11, 'inativo', 'spacemanyxe123nh', 'SPACEMAN', 'spacemanyxe123nh', 'Crash', NULL, 'Games/Pragmaticlive/spacemanyxe123nh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(789, 12, 'inativo', 'WildTriads', 'WildTriads', 'WildTriads', 'Slots', NULL, 'Games/Toptrend/WildTriads.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(790, 12, 'inativo', 'GoldenDragon', 'Golden Dragon', 'GoldenDragon', 'Slots', NULL, 'Games/Toptrend/GoldenDragon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:52'),
(791, 12, 'inativo', 'ReelsOfFortune', 'Reels Of Fortune', 'ReelsOfFortune', 'Slots', NULL, 'Games/Toptrend/ReelsOfFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(792, 12, 'inativo', 'GoldenAmazon', 'Golden Amazon', 'GoldenAmazon', 'Slots', NULL, 'Games/Toptrend/GoldenAmazon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(793, 12, 'inativo', 'MonkeyLuck', 'MonkeyLuck', 'MonkeyLuck', 'Slots', NULL, 'Games/Toptrend/MonkeyLuck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:53'),
(794, 12, 'inativo', 'LeagueOfChampions', 'League Of Champions', 'LeagueOfChampions', 'Slots', NULL, 'Games/Toptrend/LeagueOfChampions.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(795, 12, 'inativo', 'MadMonkeyH5', 'MadMonkey', 'MadMonkeyH5', 'Slots', NULL, 'Games/Toptrend/MadMonkeyH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(796, 12, 'inativo', 'DynastyEmpire', 'Dynasty Empire', 'DynastyEmpire', 'Slots', NULL, 'Games/Toptrend/DynastyEmpire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(797, 12, 'inativo', 'SuperKids', 'SuperKids', 'SuperKids', 'Slots', NULL, 'Games/Toptrend/SuperKids.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(798, 12, 'inativo', 'HotVolcanoH5', 'HotVolcano', 'HotVolcanoH5', 'Slots', NULL, 'Games/Toptrend/HotVolcanoH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(799, 12, 'inativo', 'Huluwa', 'Huluwa', 'Huluwa', 'Slots', NULL, 'Games/Toptrend/Huluwa.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(800, 12, 'inativo', 'LegendOfLinkH5', 'LegendOfLink', 'LegendOfLinkH5', 'Slots', NULL, 'Games/Toptrend/LegendOfLinkH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(801, 12, 'inativo', 'DetectiveBlackCat', 'DetectiveBlackCat', 'DetectiveBlackCat', 'Slots', NULL, 'Games/Toptrend/DetectiveBlackCat.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(802, 12, 'inativo', 'ChilliGoldH5', 'Chilli Gold', 'ChilliGoldH5', 'Slots', NULL, 'Games/Toptrend/ChilliGoldH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(803, 12, 'inativo', 'SilverLionH5', 'Silver Lion', 'SilverLionH5', 'Slots', NULL, 'Games/Toptrend/SilverLionH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(804, 12, 'inativo', 'ThunderingZeus', 'ThunderingZeus', 'ThunderingZeus', 'Slots', NULL, 'Games/Toptrend/ThunderingZeus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(805, 12, 'inativo', 'DragonPalaceH5', 'Dragon Palace', 'DragonPalaceH5', 'Slots', NULL, 'Games/Toptrend/DragonPalaceH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(806, 12, 'inativo', 'MadMonkey2', 'MadMonkey', 'MadMonkey2', 'Slots', NULL, 'Games/Toptrend/MadMonkey2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(807, 12, 'inativo', 'MedusaCurse', 'Medusa Curse', 'MedusaCurse', 'Slots', NULL, 'Games/Toptrend/MedusaCurse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(808, 12, 'inativo', 'BattleHeroes', 'Battle Heroes', 'BattleHeroes', 'Slots', NULL, 'Games/Toptrend/BattleHeroes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(809, 12, 'inativo', 'NeptunesGoldH5', 'Neptunes Gold', 'NeptunesGoldH5', 'Slots', NULL, 'Games/Toptrend/NeptunesGoldH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(810, 12, 'inativo', 'HeroesNeverDie', 'Heroes Never Die', 'HeroesNeverDie', 'Slots', NULL, 'Games/Toptrend/HeroesNeverDie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:48'),
(811, 12, 'inativo', 'WildWildWitch', 'Wild Wild Witch', 'WildWildWitch', 'Slots', NULL, 'Games/Toptrend/WildWildWitch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:47'),
(812, 12, 'inativo', 'WildKartRacers', 'Wild Kart Racers', 'WildKartRacers', 'Slots', NULL, 'Games/Toptrend/WildKartRacers.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:49'),
(813, 12, 'inativo', 'KingDinosaur', 'KingDinosaur', 'KingDinosaur', 'Slots', NULL, 'Games/Toptrend/KingDinosaur.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:43'),
(814, 12, 'inativo', 'GoldenGenie', 'GoldenGenie', 'GoldenGenie', 'Slots', NULL, 'Games/Toptrend/GoldenGenie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:45'),
(815, 12, 'inativo', 'UltimateFighter', 'UltimateFighter', 'UltimateFighter', 'Slots', NULL, 'Games/Toptrend/UltimateFighter.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(816, 12, 'inativo', 'EverlastingSpins', 'EverlastingSpins', 'EverlastingSpins', 'Slots', NULL, 'Games/Toptrend/EverlastingSpins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(817, 12, 'inativo', 'Zoomania', 'Zoomania', 'Zoomania', 'Slots', NULL, 'Games/Toptrend/Zoomania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:12', '2024-12-20 05:45:44'),
(818, 12, 'inativo', 'LaserCats', 'Laser Cats', 'LaserCats', 'Slots', NULL, 'Games/Toptrend/LaserCats.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(819, 12, 'inativo', 'DiamondFortune', 'DiamondFortune', 'DiamondFortune', 'Slots', NULL, 'Games/Toptrend/DiamondFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(820, 12, 'inativo', 'GoldenClaw', 'GoldenClaw', 'GoldenClaw', 'Slots', NULL, 'Games/Toptrend/GoldenClaw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(821, 12, 'inativo', 'PandaWarrior', 'PandaWarrior', 'PandaWarrior', 'Slots', NULL, 'Games/Toptrend/PandaWarrior.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(822, 12, 'inativo', 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'Slots', NULL, 'Games/Toptrend/RoyalGoldenDragon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(823, 12, 'inativo', 'MegaMaya', 'MegaMaya', 'MegaMaya', 'Slots', NULL, 'Games/Toptrend/MegaMaya.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(824, 12, 'inativo', 'MegaPhoenix', 'MegaPhoenix', 'MegaPhoenix', 'Slots', NULL, 'Games/Toptrend/MegaPhoenix.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(825, 12, 'inativo', 'DolphinGoldH5', 'DolphinGold', 'DolphinGoldH5', 'Slots', NULL, 'Games/Toptrend/DolphinGoldH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(826, 12, 'inativo', 'DragonKingH5', 'DragonKing', 'DragonKingH5', 'Slots', NULL, 'Games/Toptrend/DragonKingH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(827, 12, 'inativo', 'LuckyPandaH5', 'LuckyPanda', 'LuckyPandaH5', 'Slots', NULL, 'Games/Toptrend/LuckyPandaH5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(828, 13, 'inativo', 'btball5x20', 'Crazy Basketball', 'btball5x20', 'Slots', NULL, 'Games/Dreamtech/btball5x20.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(829, 13, 'inativo', 'dnp', 'DragonPhoenix Prosper', 'dnp', 'Slots', NULL, 'Games/Dreamtech/dnp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(830, 13, 'inativo', 'crystal', 'Glory of Heroes', 'crystal', 'Slots', NULL, 'Games/Dreamtech/crystal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(831, 13, 'inativo', 'fls', 'FULUSHOU', 'fls', 'Slots', NULL, 'Games/Dreamtech/fls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(832, 13, 'inativo', 'fourss', 'Four Holy Beasts', 'fourss', 'Slots', NULL, 'Games/Dreamtech/fourss.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(833, 13, 'inativo', 'casino', '3D Slot', 'casino', 'Slots', NULL, 'Games/Dreamtech/casino.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(834, 13, 'inativo', 'crazy5x243', 'Crazy GO GO GO', 'crazy5x243', 'Slots', NULL, 'Games/Dreamtech/crazy5x243.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(835, 13, 'inativo', 'rocknight', 'RocknRoll Night', 'rocknight', 'Slots', NULL, 'Games/Dreamtech/rocknight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(836, 13, 'inativo', 'bluesea', 'Blue Sea', 'bluesea', 'Slots', NULL, 'Games/Dreamtech/bluesea.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(837, 13, 'inativo', 'circus', 'Crazy Circus', 'circus', 'Slots', NULL, 'Games/Dreamtech/circus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(838, 13, 'inativo', 'bikini', 'Bikini Party', 'bikini', 'Slots', NULL, 'Games/Dreamtech/bikini.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(839, 13, 'inativo', 'foryouth5x25', 'SO YOUNG', 'foryouth5x25', 'Slots', NULL, 'Games/Dreamtech/foryouth5x25.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(840, 13, 'inativo', 'fourbeauty', 'Four Beauties', 'fourbeauty', 'Slots', NULL, 'Games/Dreamtech/fourbeauty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(841, 13, 'inativo', 'sweethouse', 'Candy House', 'sweethouse', 'Slots', NULL, 'Games/Dreamtech/sweethouse.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(842, 13, 'inativo', 'legend5x25', 'Legend of the King', 'legend5x25', 'Slots', NULL, 'Games/Dreamtech/legend5x25.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(843, 13, 'inativo', 'opera', 'Beijing opera', 'opera', 'Slots', NULL, 'Games/Dreamtech/opera.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(844, 13, 'inativo', 'bigred', 'Big Red', 'bigred', 'Slots', NULL, 'Games/Dreamtech/bigred.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(845, 13, 'inativo', 'wrathofthor', 'Wrath of Thor', 'wrathofthor', 'Slots', NULL, 'Games/Dreamtech/wrathofthor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(846, 13, 'inativo', 'boxingarena', 'Boxing Arena', 'boxingarena', 'Slots', NULL, 'Games/Dreamtech/boxingarena.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(847, 13, 'inativo', 'fantasyforest', 'Elf Kingdom', 'fantasyforest', 'Slots', NULL, 'Games/Dreamtech/fantasyforest.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(848, 13, 'inativo', 'egyptian', 'Egyptian Empire', 'egyptian', 'Slots', NULL, 'Games/Dreamtech/egyptian.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(849, 13, 'inativo', 'hotpotfeast', 'Hotpot Feast', 'hotpotfeast', 'Slots', NULL, 'Games/Dreamtech/hotpotfeast.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:12', '2024-12-05 23:12:12'),
(850, 13, 'inativo', 'magician', 'Magician', 'magician', 'Slots', NULL, 'Games/Dreamtech/magician.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(851, 13, 'inativo', 'galaxywars', 'Galaxy Wars', 'galaxywars', 'Slots', NULL, 'Games/Dreamtech/galaxywars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(852, 13, 'inativo', 'easyrider', 'Easy Rider', 'easyrider', 'Slots', NULL, 'Games/Dreamtech/easyrider.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(853, 13, 'inativo', 'goldjade5x50', 'Jin Yu Man Tang', 'goldjade5x50', 'Slots', NULL, 'Games/Dreamtech/goldjade5x50.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(854, 13, 'inativo', 'shokudo', 'shokudo', 'shokudo', 'Slots', NULL, 'Games/Dreamtech/shokudo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(855, 13, 'inativo', 'train', 'Treasure Hunt Trip', 'train', 'Slots', NULL, 'Games/Dreamtech/train.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(856, 13, 'inativo', 'lovefighters', 'Love Fighters', 'lovefighters', 'Slots', NULL, 'Games/Dreamtech/lovefighters.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(857, 13, 'inativo', 'genie', 'Aladdin s Wish', 'genie', 'Slots', NULL, 'Games/Dreamtech/genie.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(858, 13, 'inativo', 'garden', 'Little Big Garden', 'garden', 'Slots', NULL, 'Games/Dreamtech/garden.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:46'),
(859, 13, 'inativo', 'alchemist', 'Crazy Alchemist', 'alchemist', 'Slots', NULL, 'Games/Dreamtech/alchemist.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:47'),
(860, 13, 'inativo', 'dinosaur5x25', 'Dinosaur World', 'dinosaur5x25', 'Slots', NULL, 'Games/Dreamtech/dinosaur5x25.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(861, 13, 'inativo', 'tombshadow', 'Tomb Shadow', 'tombshadow', 'Slots', NULL, 'Games/Dreamtech/tombshadow.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(862, 13, 'inativo', 'clash', 'Clash of Three kingdoms', 'clash', 'Slots', NULL, 'Games/Dreamtech/clash.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(863, 13, 'inativo', 'magicbean', 'Magic Bean Legend', 'magicbean', 'Slots', NULL, 'Games/Dreamtech/magicbean.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:43'),
(864, 13, 'inativo', 'secretdate', 'Secret Date', 'secretdate', 'Slots', NULL, 'Games/Dreamtech/secretdate.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(865, 13, 'inativo', 'bacteria', 'Germ Lab', 'bacteria', 'Slots', NULL, 'Games/Dreamtech/bacteria.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(866, 13, 'inativo', 'baseball', 'Baseball Frenzy', 'baseball', 'Slots', NULL, 'Games/Dreamtech/baseball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(867, 13, 'inativo', 'mysticalstones', 'Mystical Stones', 'mysticalstones', 'Slots', NULL, 'Games/Dreamtech/mysticalstones.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(868, 13, 'inativo', 'sincity', 'Sin City', 'sincity', 'Slots', NULL, 'Games/Dreamtech/sincity.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:44'),
(869, 13, 'inativo', 'wheel', 'Secrets of The Pentagram', 'wheel', 'Slots', NULL, 'Games/Dreamtech/wheel.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(870, 13, 'inativo', 'westwild', 'West Wild', 'westwild', 'Slots', NULL, 'Games/Dreamtech/westwild.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(871, 13, 'inativo', 'halloween', 'Witch Winnings', 'halloween', 'Slots', NULL, 'Games/Dreamtech/halloween.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(872, 13, 'inativo', 'bloodmoon', 'Blood Wolf legend', 'bloodmoon', 'Slots', NULL, 'Games/Dreamtech/bloodmoon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(873, 13, 'inativo', 'dragonball2', 'Heroes of the East', 'dragonball2', 'Slots', NULL, 'Games/Dreamtech/dragonball2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(874, 13, 'inativo', 'muaythai', 'Muaythai', 'muaythai', 'Slots', NULL, 'Games/Dreamtech/muaythai.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(875, 13, 'inativo', 'sailor', 'Sailor Princess', 'sailor', 'Slots', NULL, 'Games/Dreamtech/sailor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(876, 13, 'inativo', 'nightclub', 'Infinity Club', 'nightclub', 'Slots', NULL, 'Games/Dreamtech/nightclub.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(877, 13, 'inativo', 'nezha', 'Nezha Legend', 'nezha', 'Slots', NULL, 'Games/Dreamtech/nezha.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:51'),
(878, 13, 'inativo', 'bird', 'Bird Island', 'bird', 'Slots', NULL, 'Games/Dreamtech/bird.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(879, 13, 'inativo', 'honor', 'Field Of Honor', 'honor', 'Slots', NULL, 'Games/Dreamtech/honor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:52'),
(880, 13, 'inativo', 'train2', 'Treasure Hunt Trip 2', 'train2', 'Slots', NULL, 'Games/Dreamtech/train2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(881, 13, 'inativo', 'shiningstars', 'ShiningStars', 'shiningstars', 'Slots', NULL, 'Games/Dreamtech/shiningstars.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:53'),
(882, 13, 'inativo', 'tgow2plus', 'Cai Shen Dao Plus', 'tgow2plus', 'Slots', NULL, 'Games/Dreamtech/tgow2plus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(883, 13, 'inativo', 'peeping', 'Peeping', 'peeping', 'Slots', NULL, 'Games/Dreamtech/peeping.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:13', '2024-12-20 05:44:54'),
(884, 14, 'inativo', 'greatwall', 'The Great Wall Treasure', 'greatwall', 'Slots', NULL, 'Games/Evoplay/greatwall.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(885, 14, 'inativo', 'chinesenewyear', 'Chinese New Year', 'chinesenewyear', 'Slots', NULL, 'Games/Evoplay/chinesenewyear.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(886, 14, 'inativo', 'jewellerystore', 'Jewelry store', 'jewellerystore', 'Slots', NULL, 'Games/Evoplay/jewellerystore.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(887, 14, 'inativo', 'redcliff', 'Red cliff', 'redcliff', 'Slots', NULL, 'Games/Evoplay/redcliff.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(888, 14, 'inativo', 'ElvenPrincesses', 'Elven Princess', 'ElvenPrincesses', 'Slots', NULL, 'Games/Evoplay/ElvenPrincesses.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(889, 14, 'inativo', 'robinzon', 'Robinson', 'robinzon', 'Slots', NULL, 'Games/Evoplay/robinzon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(890, 14, 'inativo', 'aeronauts', 'Aeronauts', 'aeronauts', 'Slots', NULL, 'Games/Evoplay/aeronauts.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(891, 14, 'inativo', 'monsterlab', 'Monster rap', 'monsterlab', 'Slots', NULL, 'Games/Evoplay/monsterlab.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(892, 14, 'inativo', 'TriptotheFuture', 'Trip to the Future', 'TriptotheFuture', 'Slots', NULL, 'Games/Evoplay/TriptotheFuture.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(893, 14, 'inativo', 'NukeWorld', 'Nook World', 'NukeWorld', 'Slots', NULL, 'Games/Evoplay/NukeWorld.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(894, 14, 'inativo', 'legendofkaan', 'Legend of Khan', 'legendofkaan', 'Slots', NULL, 'Games/Evoplay/legendofkaan.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(895, 14, 'inativo', 'LivingTales', 'Night of the Living Tales', 'LivingTales', 'Slots', NULL, 'Games/Evoplay/LivingTales.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(896, 14, 'inativo', 'IceMania', 'Ice mania', 'IceMania', 'Slots', NULL, 'Games/Evoplay/IceMania.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(897, 14, 'inativo', 'ValleyOfDreams', 'Valley of Dreams', 'ValleyOfDreams', 'Slots', NULL, 'Games/Evoplay/ValleyOfDreams.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(898, 14, 'inativo', 'FruitNova', 'Fruit Nova', 'FruitNova', 'Slots', NULL, 'Games/Evoplay/FruitNova.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(899, 14, 'inativo', 'TreeOfLight', 'Tree of light', 'TreeOfLight', 'Slots', NULL, 'Games/Evoplay/TreeOfLight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(900, 14, 'inativo', 'TempleOfDead', 'Temple of the dead', 'TempleOfDead', 'Slots', NULL, 'Games/Evoplay/TempleOfDead.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(901, 14, 'inativo', 'RunesOfDestiny', 'Runes of Destiny', 'RunesOfDestiny', 'Slots', NULL, 'Games/Evoplay/RunesOfDestiny.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(902, 14, 'inativo', 'EllensFortune', 'Ellen Fortune', 'EllensFortune', 'Slots', NULL, 'Games/Evoplay/EllensFortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(903, 14, 'inativo', 'UnlimitedWishes', 'Unlimited Wishes', 'UnlimitedWishes', 'Slots', NULL, 'Games/Evoplay/UnlimitedWishes.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(904, 14, 'inativo', 'FoodFeast', 'Food fist', 'FoodFeast', 'Slots', NULL, 'Games/Evoplay/FoodFeast.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(905, 14, 'inativo', 'EpicLegends', 'Epic legends', 'EpicLegends', 'Slots', NULL, 'Games/Evoplay/EpicLegends.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(906, 14, 'inativo', 'SweetSugar', 'Sweet sugar', 'SweetSugar', 'Slots', NULL, 'Games/Evoplay/SweetSugar.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(907, 14, 'inativo', 'CycleofLuck', 'Cycle of Luck', 'CycleofLuck', 'Slots', NULL, 'Games/Evoplay/CycleofLuck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(908, 14, 'inativo', 'GangsterNight', 'Gangster night', 'GangsterNight', 'Slots', NULL, 'Games/Evoplay/GangsterNight.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(909, 14, 'inativo', 'GoldOfSirens', 'Gold of sirens', 'GoldOfSirens', 'Slots', NULL, 'Games/Evoplay/GoldOfSirens.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(910, 14, 'inativo', 'BloodyBrilliant', 'Bloody brilliant', 'BloodyBrilliant', 'Slots', NULL, 'Games/Evoplay/BloodyBrilliant.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(911, 14, 'inativo', 'TempleOfDeadBonusBuy', 'Temple of the Dead BB', 'TempleOfDeadBonusBuy', 'Slots', NULL, 'Games/Evoplay/TempleOfDeadBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(912, 14, 'inativo', 'ShadowOfLuxor', 'Shadow of Luxor', 'ShadowOfLuxor', 'Slots', NULL, 'Games/Evoplay/ShadowOfLuxor.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(913, 14, 'inativo', 'CycleofLuckBonusBuy', 'Cycle of Luck BB', 'CycleofLuckBonusBuy', 'Slots', NULL, 'Games/Evoplay/CycleofLuckBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(914, 14, 'inativo', 'AnubisMoon', 'Anubis moon', 'AnubisMoon', 'Slots', NULL, 'Games/Evoplay/AnubisMoon.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(915, 14, 'inativo', 'FruitDisco', 'Fruit disco', 'FruitDisco', 'Slots', NULL, 'Games/Evoplay/FruitDisco.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(916, 14, 'inativo', 'FruitSuperNova30', 'Fruit Super Nova 30', 'FruitSuperNova30', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova30.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(917, 14, 'inativo', 'CurseOfThePharaoh', 'Curse of the Pharaoh', 'CurseOfThePharaoh', 'Slots', NULL, 'Games/Evoplay/CurseOfThePharaoh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(918, 14, 'inativo', 'GoldOfSirensBonusBuy', 'Gold of Sirens BB', 'GoldOfSirensBonusBuy', 'Slots', NULL, 'Games/Evoplay/GoldOfSirensBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(919, 14, 'inativo', 'FruitSuperNova60', 'Fruit Super Nova 60', 'FruitSuperNova60', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova60.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(920, 14, 'inativo', 'CurseofthePharaohBonusBuy', 'Curse of the Pharaoh BB', 'CurseofthePharaohBonusBuy', 'Slots', NULL, 'Games/Evoplay/CurseofthePharaohBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(921, 14, 'inativo', 'FruitSuperNova100', 'Fruit Super Nova 100', 'FruitSuperNova100', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova100.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(922, 14, 'inativo', 'FruitSuperNova80', 'Whoft Super Nova 80', 'FruitSuperNova80', 'Slots', NULL, 'Games/Evoplay/FruitSuperNova80.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(923, 14, 'inativo', 'DragonsTavern', 'Dragons Tavern', 'DragonsTavern', 'Slots', NULL, 'Games/Evoplay/DragonsTavern.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(924, 14, 'inativo', 'ChristmasReachBonusBuy', 'Christmas Riti BB', 'ChristmasReachBonusBuy', 'Slots', NULL, 'Games/Evoplay/ChristmasReachBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(925, 14, 'inativo', 'WildOverlords', 'Wild overlord', 'WildOverlords', 'Slots', NULL, 'Games/Evoplay/WildOverlords.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(926, 14, 'inativo', 'DragonsTavernBonusBuy', 'Dragons Tavern BB', 'DragonsTavernBonusBuy', 'Slots', NULL, 'Games/Evoplay/DragonsTavernBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(927, 14, 'inativo', 'BudaiReels', 'Budai reels', 'BudaiReels', 'Slots', NULL, 'Games/Evoplay/BudaiReels.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(928, 14, 'inativo', 'BudaiReelsBonusBuy', 'Budai Lils BB', 'BudaiReelsBonusBuy', 'Slots', NULL, 'Games/Evoplay/BudaiReelsBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(929, 14, 'inativo', 'MoneyMinter', 'Money minter', 'MoneyMinter', 'Slots', NULL, 'Games/Evoplay/MoneyMinter.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(930, 14, 'inativo', 'TheGreatestCatch', 'The Greatest Catch', 'TheGreatestCatch', 'Slots', NULL, 'Games/Evoplay/TheGreatestCatch.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(931, 14, 'inativo', 'TreeOfLightBB', 'Tree of Light BB', 'TreeOfLightBB', 'Slots', NULL, 'Games/Evoplay/TreeOfLightBB.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(932, 14, 'inativo', 'WolfHiding', 'Wolf Hiding', 'WolfHiding', 'Slots', NULL, 'Games/Evoplay/WolfHiding.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(933, 14, 'inativo', 'CaminoDeChili', 'Camino de Chili', 'CaminoDeChili', 'Slots', NULL, 'Games/Evoplay/CaminoDeChili.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(934, 14, 'inativo', 'CandyDreamsSweetPlanet', 'candy dreams', 'CandyDreamsSweetPlanet', 'Slots', NULL, 'Games/Evoplay/CandyDreamsSweetPlanet.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(935, 14, 'inativo', 'WildOverlordsBonusBuy', 'Wild Overlord BB', 'WildOverlordsBonusBuy', 'Slots', NULL, 'Games/Evoplay/WildOverlordsBonusBuy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(936, 14, 'inativo', 'TempleOfThunder', 'Temple of Thunder', 'TempleOfThunder', 'Slots', NULL, 'Games/Evoplay/TempleOfThunder.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(937, 15, 'inativo', 'sun_of_egypt', 'SUN OF EGYPT', 'sun_of_egypt', 'Slots', NULL, 'Games/Booongo/sun_of_egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(938, 15, 'inativo', 'sun_of_egypt_2', 'SUN OF EGYPT 2', 'sun_of_egypt_2', 'Slots', NULL, 'Games/Booongo/sun_of_egypt_2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(939, 15, 'inativo', 'happy_fish', 'HAPPY FISH', 'happy_fish', 'Slots', NULL, 'Games/Booongo/happy_fish.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(940, 15, 'inativo', 'queen_of_the_sun', 'QUEEN OF THE SUN', 'queen_of_the_sun', 'Slots', NULL, 'Games/Booongo/queen_of_the_sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:13', '2024-12-05 23:12:13'),
(941, 15, 'inativo', 'tiger_jungle', 'TIGER JUNGLE', 'tiger_jungle', 'Slots', NULL, 'Games/Booongo/tiger_jungle.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(942, 15, 'inativo', 'black_wolf', 'BLACK WOLF', 'black_wolf', 'Slots', NULL, 'Games/Booongo/black_wolf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(943, 15, 'inativo', 'hit_the_gold', 'HIT THE GOLD', 'hit_the_gold', 'Slots', NULL, 'Games/Booongo/hit_the_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(944, 15, 'inativo', 'candy_boom', 'CANDY BOOM', 'candy_boom', 'Slots', NULL, 'Games/Booongo/candy_boom.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(945, 15, 'inativo', 'scarab_riches', 'SCARAB RICHES', 'scarab_riches', 'Slots', NULL, 'Games/Booongo/scarab_riches.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(946, 15, 'inativo', 'golden_dancing_lion', 'GOLDEN DANCING LION', 'golden_dancing_lion', 'Slots', NULL, 'Games/Booongo/golden_dancing_lion.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(947, 15, 'inativo', 'dragon_pearls', 'DRAGON PEARLS', 'dragon_pearls', 'Slots', NULL, 'Games/Booongo/dragon_pearls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(948, 15, 'inativo', '3_coins', '3 COINS', '3_coins', 'Slots', NULL, 'Games/Booongo/3_coins.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(949, 15, 'inativo', 'super_rich_god', 'SUPER RICH GOD', 'super_rich_god', 'Slots', NULL, 'Games/Booongo/super_rich_god.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(950, 15, 'inativo', '15_dragon_pearls', '15 DRAGON PEARLS', '15_dragon_pearls', 'Slots', NULL, 'Games/Booongo/15_dragon_pearls.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(951, 15, 'inativo', 'aztec_sun', 'AZTEC SUN', 'aztec_sun', 'Slots', NULL, 'Games/Booongo/aztec_sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(952, 15, 'inativo', 'scarab_temple', 'SCARAB TEMPLE', 'scarab_temple', 'Slots', NULL, 'Games/Booongo/scarab_temple.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(953, 15, 'inativo', 'gods_temple_deluxe', 'GODS TEMPLE DELUXE', 'gods_temple_deluxe', 'Slots', NULL, 'Games/Booongo/gods_temple_deluxe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(954, 15, 'inativo', 'book_of_sun', 'BOOK OF SUN', 'book_of_sun', 'Slots', NULL, 'Games/Booongo/book_of_sun.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(955, 15, 'inativo', '777_gems', '777 GEMS', '777_gems', 'Slots', NULL, 'Games/Booongo/777_gems.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(956, 15, 'inativo', 'book_of_sun_multichance', 'BOOK OF SUN MULTICHANCE', 'book_of_sun_multichance', 'Slots', NULL, 'Games/Booongo/book_of_sun_multichance.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(957, 15, 'inativo', 'olympian_gods', 'OLYMPIAN GODS', 'olympian_gods', 'Slots', NULL, 'Games/Booongo/olympian_gods.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(958, 15, 'inativo', '777_gems_respin', '777 GEMS RESPIN', '777_gems_respin', 'Slots', NULL, 'Games/Booongo/777_gems_respin.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(959, 15, 'inativo', 'tigers_gold', 'TIGERS GOLD', 'tigers_gold', 'Slots', NULL, 'Games/Booongo/tigers_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(960, 15, 'inativo', 'moon_sisters', 'MOON SISTERS', 'moon_sisters', 'Slots', NULL, 'Games/Booongo/moon_sisters.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(961, 15, 'inativo', 'book_of_sun_choice', 'BOOK OF SUN CHOICE', 'book_of_sun_choice', 'Slots', NULL, 'Games/Booongo/book_of_sun_choice.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(962, 15, 'inativo', 'super_marble', 'SUPER MARBLE', 'super_marble', 'Slots', NULL, 'Games/Booongo/super_marble.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(963, 15, 'inativo', 'buddha_fortune', 'BUDDHA FORTUNE', 'buddha_fortune', 'Slots', NULL, 'Games/Booongo/buddha_fortune.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(964, 15, 'inativo', 'great_panda', 'GREAT PANDA', 'great_panda', 'Slots', NULL, 'Games/Booongo/great_panda.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(965, 15, 'inativo', '15_golden_eggs', '15 GOLDEN EGGS', '15_golden_eggs', 'Slots', NULL, 'Games/Booongo/15_golden_eggs.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(966, 15, 'inativo', 'thunder_of_olympus', 'THUNDER OF OLYMPUS', 'thunder_of_olympus', 'Slots', NULL, 'Games/Booongo/thunder_of_olympus.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(967, 15, 'inativo', 'eye_of_gold', 'EYE OF GOLD', 'eye_of_gold', 'Slots', NULL, 'Games/Booongo/eye_of_gold.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(968, 15, 'inativo', 'tiger_stone', 'TIGER STONE', 'tiger_stone', 'Slots', NULL, 'Games/Booongo/tiger_stone.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(969, 15, 'inativo', 'magic_apple', 'MAGIC APPLE', 'magic_apple', 'Slots', NULL, 'Games/Booongo/magic_apple.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(970, 15, 'inativo', 'wolf_saga', 'WOLF SAGA', 'wolf_saga', 'Slots', NULL, 'Games/Booongo/wolf_saga.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(971, 15, 'inativo', 'magic_ball', 'MAGIC BALL', 'magic_ball', 'Slots', NULL, 'Games/Booongo/magic_ball.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(972, 15, 'inativo', 'scarab_boost', 'SCARAB BOOST', 'scarab_boost', 'Slots', NULL, 'Games/Booongo/scarab_boost.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(973, 15, 'inativo', 'wukong', 'WUKONG', 'wukong', 'Slots', NULL, 'Games/Booongo/wukong.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(974, 15, 'inativo', 'pearl_diver', 'PEARL DIVER', 'pearl_diver', 'Slots', NULL, 'Games/Booongo/pearl_diver.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(975, 15, 'inativo', '3_coins_egypt', '3 COINS EGYPT', '3_coins_egypt', 'Slots', NULL, 'Games/Booongo/3_coins_egypt.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(976, 15, 'inativo', 'ganesha_boost', 'GANESHA BOOST', 'ganesha_boost', 'Slots', NULL, 'Games/Booongo/ganesha_boost.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(977, 15, 'inativo', 'wolf_night', 'WOLF NIGHT', 'wolf_night', 'Slots', NULL, 'Games/Booongo/wolf_night.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(978, 15, 'inativo', 'book_of_wizard', 'BOOK OF WIZARD', 'book_of_wizard', 'Slots', NULL, 'Games/Booongo/book_of_wizard.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(979, 15, 'inativo', 'lord_fortune_2', 'LORD FORTUNE 2', 'lord_fortune_2', 'Slots', NULL, 'Games/Booongo/lord_fortune_2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(980, 15, 'inativo', 'gold_express', 'GOLD EXPRESS', 'gold_express', 'Slots', NULL, 'Games/Booongo/gold_express.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(981, 15, 'inativo', 'book_of_wizard_crystal', 'BOOK OF WIZARD CRYSTAL', 'book_of_wizard_crystal', 'Slots', NULL, 'Games/Booongo/book_of_wizard_crystal.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(982, 15, 'inativo', 'pearl_diver_2', 'PEARL DIVER 2', 'pearl_diver_2', 'Slots', NULL, 'Games/Booongo/pearl_diver_2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(983, 15, 'inativo', 'sun_of_egypt_3', 'SUN OF EGYPT 3', 'sun_of_egypt_3', 'Slots', NULL, 'Games/Booongo/sun_of_egypt_3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(984, 15, 'inativo', 'caishen_wealth', 'CAISHEN WEALTH', 'caishen_wealth', 'Slots', NULL, 'Games/Booongo/caishen_wealth.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(985, 15, 'inativo', 'aztec_fire', 'AZTEC FIRE', 'aztec_fire', 'Slots', NULL, 'Games/Booongo/aztec_fire.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(986, 16, 'inativo', '67', 'Golden eggs', '67', 'Slots', NULL, 'Games/Cq9/67.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(987, 16, 'inativo', '161', 'Hercules', '161', 'Slots', NULL, 'Games/Cq9/161.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:36'),
(988, 16, 'inativo', '16', 'Super 5', '16', 'Slots', NULL, 'Games/Cq9/16.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(989, 16, 'inativo', '1', 'Fruit King', '1', 'Slots', NULL, 'Games/Cq9/1.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(990, 16, 'inativo', '163', 'Neja Advent', '163', 'Slots', NULL, 'Games/Cq9/163.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(991, 16, 'inativo', '50', 'Good fortune', '50', 'Slots', NULL, 'Games/Cq9/50.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(992, 16, 'inativo', '31', 'God of war', '31', 'Slots', NULL, 'Games/Cq9/31.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(993, 16, 'inativo', '64', 'Zeus', '64', 'Slots', NULL, 'Games/Cq9/64.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(994, 16, 'inativo', '89', 'Thor', '89', 'Slots', NULL, 'Games/Cq9/89.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(995, 16, 'inativo', '46', 'Wolf moon', '46', 'Slots', NULL, 'Games/Cq9/46.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(996, 16, 'inativo', '139', 'Fire chibi', '139', 'Slots', NULL, 'Games/Cq9/139.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(997, 16, 'inativo', '15', 'Gu Gu Gu', '15', 'Slots', NULL, 'Games/Cq9/15.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(998, 16, 'inativo', '140', 'Fire Chibi 2', '140', 'Slots', NULL, 'Games/Cq9/140.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(999, 16, 'inativo', '8', 'So Sweet', '8', 'Slots', NULL, 'Games/Cq9/8.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1000, 16, 'inativo', '147', 'Flower fortune', '147', 'Slots', NULL, 'Games/Cq9/147.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1001, 16, 'inativo', '113', 'Flying Kai Shen', '113', 'Slots', NULL, 'Games/Cq9/113.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1002, 16, 'inativo', '58', 'Gu Gu Gu 2', '58', 'Slots', NULL, 'Games/Cq9/58.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1003, 16, 'inativo', '128', 'Wheel money', '128', 'Slots', NULL, 'Games/Cq9/128.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1004, 16, 'inativo', '5', 'Mr Rich', '5', 'Slots', NULL, 'Games/Cq9/5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1005, 16, 'inativo', '180', 'Gu Gu Gu 3', '180', 'Slots', NULL, 'Games/Cq9/180.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1006, 16, 'inativo', '118', 'SkullSkull', '118', 'Slots', NULL, 'Games/Cq9/118.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:30'),
(1007, 16, 'inativo', '148', 'Fortune totem', '148', 'Slots', NULL, 'Games/Cq9/148.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1008, 16, 'inativo', '144', 'Diamond treasure', '144', 'Slots', NULL, 'Games/Cq9/144.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1009, 16, 'inativo', '19', 'Hot spin', '19', 'Slots', NULL, 'Games/Cq9/19.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1010, 16, 'inativo', '112', 'Pyramid radar', '112', 'Slots', NULL, 'Games/Cq9/112.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1011, 16, 'inativo', '160', 'Pa Kai Shen2', '160', 'Slots', NULL, 'Games/Cq9/160.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:27'),
(1012, 16, 'inativo', '47', 'Pharaoh gold', '47', 'Slots', NULL, 'Games/Cq9/47.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:30'),
(1013, 16, 'inativo', '13', 'Sakura legend', '13', 'Slots', NULL, 'Games/Cq9/13.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1014, 16, 'inativo', '34', 'Gopher s War', '34', 'Slots', NULL, 'Games/Cq9/34.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:29'),
(1015, 16, 'inativo', '59', 'Summer mood', '59', 'Slots', NULL, 'Games/Cq9/59.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1016, 16, 'inativo', '57', 'The Beast War', '57', 'Slots', NULL, 'Games/Cq9/57.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1017, 16, 'inativo', '17', 'Great lion', '17', 'Slots', NULL, 'Games/Cq9/17.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:31'),
(1018, 16, 'inativo', '20', '888', '20', 'Slots', NULL, 'Games/Cq9/20.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1019, 16, 'inativo', '182', 'Thor 2', '182', 'Slots', NULL, 'Games/Cq9/182.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1020, 16, 'inativo', '66', 'Fire 777', '66', 'Slots', NULL, 'Games/Cq9/66.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1021, 16, 'inativo', '2', 'God of Chess', '2', 'Slots', NULL, 'Games/Cq9/2.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1022, 16, 'inativo', '21', 'Big wolf', '21', 'Slots', NULL, 'Games/Cq9/21.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1023, 16, 'inativo', '197', 'Dragon s Treasure', '197', 'Slots', NULL, 'Games/Cq9/197.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1024, 16, 'inativo', '208', 'Money tree', '208', 'Slots', NULL, 'Games/Cq9/208.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1025, 16, 'inativo', '212', 'Burning Si-Yow', '212', 'Slots', NULL, 'Games/Cq9/212.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:35'),
(1026, 16, 'inativo', '214', 'Ninja raccoon', '214', 'Slots', NULL, 'Games/Cq9/214.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:14', '2024-12-20 05:46:34'),
(1027, 16, 'inativo', '218', 'Dollar night', '218', 'Slots', NULL, 'Games/Cq9/218.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:14', '2024-12-05 23:12:14'),
(1028, 18, 'inativo', '01rb77cq1gtenhmo', 'Auto-Roulette VIP', '01rb77cq1gtenhmo', 'Aovivo', NULL, 'Games/Evolution/01rb77cq1gtenhmo.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 1, 0, 0, '2024-12-05 23:12:15', '2024-12-18 23:43:39'),
(1029, 18, 'inativo', 'qgqrucipvltnvnvq', 'Speed Baccarat W', 'qgqrucipvltnvnvq', 'Aovivo', NULL, 'Games/Evolution/qgqrucipvltnvnvq.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1030, 18, 'inativo', 'JapSpeedBac00001', 'Japanese Speed Baccarat A', 'JapSpeedBac00001', 'Aovivo', NULL, 'Games/Evolution/JapSpeedBac00001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1031, 18, 'inativo', 'NoCommBac0000001', 'No Commission Baccarat', 'NoCommBac0000001', 'Aovivo', NULL, 'Games/Evolution/NoCommBac0000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1032, 18, 'inativo', 'PTBaccarat000001', 'Prosperity Tree Baccarat', 'PTBaccarat000001', 'Aovivo', NULL, 'Games/Evolution/PTBaccarat000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1033, 18, 'inativo', 'p63cmvmwagteemoy', 'Korean Speed Baccarat A', 'p63cmvmwagteemoy', 'Aovivo', NULL, 'Games/Evolution/p63cmvmwagteemoy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1034, 18, 'inativo', 'MonBigBaller0001', 'MONOPOLY Big Baller', 'MonBigBaller0001', 'Aovivo', NULL, 'Games/Evolution/MonBigBaller0001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1035, 18, 'inativo', 'LightningTable01', 'Lightning Roulette', 'LightningTable01', 'Aovivo', NULL, 'Games/Evolution/LightningTable01.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1036, 18, 'inativo', 'ndgvz5mlhfuaad6e', 'Speed Baccarat D', 'ndgvz5mlhfuaad6e', 'Aovivo', NULL, 'Games/Evolution/ndgvz5mlhfuaad6e.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1037, 18, 'inativo', 'obj64qcnqfunjelj', 'Speed Baccarat J', 'obj64qcnqfunjelj', 'Aovivo', NULL, 'Games/Evolution/obj64qcnqfunjelj.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1038, 18, 'inativo', 'PorROULigh000001', 'Roleta Relampago Brasileira', 'PorROULigh000001', 'Aovivo', NULL, 'Games/Evolution/PorROULigh000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:15', '2024-12-20 05:43:36'),
(1039, 18, 'inativo', 'ovfzgqahvicqtiwu', 'Lightning Roulette Italia', 'ovfzgqahvicqtiwu', 'Aovivo', NULL, 'Games/Evolution/ovfzgqahvicqtiwu.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1040, 18, 'inativo', 'HSpeedBac0000002', 'Hindi Speed Baccarat B', 'HSpeedBac0000002', 'Aovivo', NULL, 'Games/Evolution/HSpeedBac0000002.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1041, 18, 'inativo', 'qgqrv4asvltnvuty', 'Speed Baccarat X', 'qgqrv4asvltnvuty', 'Aovivo', NULL, 'Games/Evolution/qgqrv4asvltnvuty.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1042, 18, 'inativo', '8clwnwrupuvf0osq', 'Ruleta en Vivo', '8clwnwrupuvf0osq', 'Aovivo', NULL, 'Games/Evolution/8clwnwrupuvf0osq.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1043, 18, 'inativo', 'xie6wodezmfwmmcb', 'Punto Banco', 'xie6wodezmfwmmcb', 'Aovivo', NULL, 'Games/Evolution/xie6wodezmfwmmcb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1044, 18, 'inativo', '48z5pjps3ntvqc1b', 'Auto-Roulette', '48z5pjps3ntvqc1b', 'Aovivo', NULL, 'Games/Evolution/48z5pjps3ntvqc1b.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1045, 18, 'inativo', 'mkvhbciosnfqhat7', 'Arabic Roulette', 'mkvhbciosnfqhat7', 'Aovivo', NULL, 'Games/Evolution/mkvhbciosnfqhat7.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1046, 18, 'inativo', 'RedDoorRoulette1', 'Red Door Roulette', 'RedDoorRoulette1', 'Aovivo', NULL, 'Games/Evolution/RedDoorRoulette1.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1047, 18, 'inativo', 'qgdk6rtpw6hax4fe', 'Korean Speed Baccarat C', 'qgdk6rtpw6hax4fe', 'Aovivo', NULL, 'Games/Evolution/qgdk6rtpw6hax4fe.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1048, 18, 'inativo', 'nmwde3fd7hvqhq43', 'Speed Baccarat F', 'nmwde3fd7hvqhq43', 'Aovivo', NULL, 'Games/Evolution/nmwde3fd7hvqhq43.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1049, 18, 'inativo', 'ocye2ju2bsoyq6vv', 'Speed Baccarat K', 'ocye2ju2bsoyq6vv', 'Aovivo', NULL, 'Games/Evolution/ocye2ju2bsoyq6vv.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1050, 18, 'inativo', 'EmperorSB0000001', 'Emperor Sic Bo', 'EmperorSB0000001', 'Aovivo', NULL, 'Games/Evolution/EmperorSB0000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1051, 18, 'inativo', 'CrazyTime0000002', 'Crazy Time A', 'CrazyTime0000002', 'Aovivo', NULL, 'Games/Evolution/CrazyTime0000002.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1052, 18, 'inativo', 'ovu5eja74ccmyoiq', 'Speed Baccarat N', 'ovu5eja74ccmyoiq', 'Aovivo', NULL, 'Games/Evolution/ovu5eja74ccmyoiq.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1053, 18, 'inativo', 'SBCTable00000001', 'Side Bet City', 'SBCTable00000001', 'Aovivo', NULL, 'Games/Evolution/SBCTable00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1054, 18, 'inativo', 'nmwdzhbg7hvqh6a7', 'Speed Baccarat G', 'nmwdzhbg7hvqh6a7', 'Aovivo', NULL, 'Games/Evolution/nmwdzhbg7hvqh6a7.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1055, 18, 'inativo', 'k37tle5hfceqacik', 'Bucharest Auto-Roulette', 'k37tle5hfceqacik', 'Aovivo', NULL, 'Games/Evolution/k37tle5hfceqacik.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1056, 18, 'inativo', 'qtkjorzrlqeb6hrd', 'Deutsches Roulette', 'qtkjorzrlqeb6hrd', 'Aovivo', NULL, 'Games/Evolution/qtkjorzrlqeb6hrd.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1057, 18, 'inativo', 'Japgwbaccarat001', 'Japanese Golden Wealth Baccarat', 'Japgwbaccarat001', 'Aovivo', NULL, 'Games/Evolution/Japgwbaccarat001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1058, 18, 'inativo', '3aidqufu9szxha2n', 'Dansk Roulette', '3aidqufu9szxha2n', 'Aovivo', NULL, 'Games/Evolution/3aidqufu9szxha2n.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1059, 18, 'inativo', 'AmericanTable001', 'American Roulette', 'AmericanTable001', 'Aovivo', NULL, 'Games/Evolution/AmericanTable001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1060, 18, 'inativo', 'PorROU0000000001', 'Roleta ao Vivo', 'PorROU0000000001', 'Aovivo', NULL, 'Games/Evolution/PorROU0000000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1061, 18, 'inativo', 'pv5q45yjhasyt46y', 'Emperor Roulette', 'pv5q45yjhasyt46y', 'Aovivo', NULL, 'Games/Evolution/pv5q45yjhasyt46y.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1062, 18, 'inativo', 'ndgv45bghfuaaebf', 'Speed Baccarat E', 'ndgv45bghfuaaebf', 'Aovivo', NULL, 'Games/Evolution/ndgv45bghfuaaebf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1063, 18, 'inativo', 'JapSpeedBac00002', 'Japanese Speed Baccarat B', 'JapSpeedBac00002', 'Aovivo', NULL, 'Games/Evolution/JapSpeedBac00002.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1064, 18, 'inativo', '7x0b1tgh7agmf6hv', 'Immersive Roulette', '7x0b1tgh7agmf6hv', 'Aovivo', NULL, 'Games/Evolution/7x0b1tgh7agmf6hv.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1065, 18, 'inativo', 'GreekLRou0000001', 'Greek Lightning Roulette', 'GreekLRou0000001', 'Aovivo', NULL, 'Games/Evolution/GreekLRou0000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1066, 18, 'inativo', 'ovu5h6b3ujb4y53w', 'No Commission Speed Baccarat C', 'ovu5h6b3ujb4y53w', 'Aovivo', NULL, 'Games/Evolution/ovu5h6b3ujb4y53w.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1067, 18, 'inativo', 'qsf63ownyvbqnz33', 'Speed Baccarat Z', 'qsf63ownyvbqnz33', 'Aovivo', NULL, 'Games/Evolution/qsf63ownyvbqnz33.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1068, 18, 'inativo', 'ndgvwvgthfuaad3q', 'Speed Baccarat C', 'ndgvwvgthfuaad3q', 'Aovivo', NULL, 'Games/Evolution/ndgvwvgthfuaad3q.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1069, 18, 'inativo', 'pezjou3ltf6hvzjk', 'Thai Speed Baccarat A', 'pezjou3ltf6hvzjk', 'Aovivo', NULL, 'Games/Evolution/pezjou3ltf6hvzjk.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1070, 18, 'inativo', 'CSPTable00000001', 'Caribbean Stud Poker', 'CSPTable00000001', 'Aovivo', NULL, 'Games/Evolution/CSPTable00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1071, 18, 'inativo', 'qgqrhfvsvltnueqf', 'Speed Baccarat U', 'qgqrhfvsvltnueqf', 'Aovivo', NULL, 'Games/Evolution/qgqrhfvsvltnueqf.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1072, 18, 'inativo', 'n4jwxsz2x4tqitvx', 'Japanese Roulette', 'n4jwxsz2x4tqitvx', 'Aovivo', NULL, 'Games/Evolution/n4jwxsz2x4tqitvx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1073, 18, 'inativo', 'f1f4rm9xgh4j3u2z', 'Auto-Roulette La Partage', 'f1f4rm9xgh4j3u2z', 'Aovivo', NULL, 'Games/Evolution/f1f4rm9xgh4j3u2z.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1074, 18, 'inativo', 'Monopoly00000001', 'MONOPOLY Live', 'Monopoly00000001', 'Aovivo', NULL, 'Games/Evolution/Monopoly00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1075, 18, 'inativo', 'o4vjrhh5rtwimgi3', 'Greek Roulette', 'o4vjrhh5rtwimgi3', 'Aovivo', NULL, 'Games/Evolution/o4vjrhh5rtwimgi3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1076, 18, 'inativo', 'puu47n7mic3rfd7y', 'Emperor Dragon Tiger', 'puu47n7mic3rfd7y', 'Aovivo', NULL, 'Games/Evolution/puu47n7mic3rfd7y.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1077, 18, 'inativo', 'leqhceumaq6qfoug', 'Speed Baccarat A', 'leqhceumaq6qfoug', 'Aovivo', NULL, 'Games/Evolution/leqhceumaq6qfoug.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1078, 18, 'inativo', 'qgonc7t4ucdiel4o', 'Speed Baccarat T', 'qgonc7t4ucdiel4o', 'Aovivo', NULL, 'Games/Evolution/qgonc7t4ucdiel4o.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1079, 18, 'inativo', '7nyiaws9tgqrzaz3', 'Football Studio Roulette', '7nyiaws9tgqrzaz3', 'Aovivo', NULL, 'Games/Evolution/7nyiaws9tgqrzaz3.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1080, 18, 'inativo', 'ETHTable00000001', 'Extreme Texas Hold em', 'ETHTable00000001', 'Aovivo', NULL, 'Games/Evolution/ETHTable00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1081, 18, 'inativo', 'ndgvs3tqhfuaadyg', 'Baccarat C', 'ndgvs3tqhfuaadyg', 'Aovivo', NULL, 'Games/Evolution/ndgvs3tqhfuaadyg.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1082, 18, 'inativo', 'lkcbrbdckjxajdol', 'Speed Roulette', 'lkcbrbdckjxajdol', 'Aovivo', NULL, 'Games/Evolution/lkcbrbdckjxajdol.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1083, 18, 'inativo', 'o4kymodby2fa2c7g', 'Speed Baccarat S', 'o4kymodby2fa2c7g', 'Aovivo', NULL, 'Games/Evolution/o4kymodby2fa2c7g.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1084, 18, 'inativo', 'nxpkul2hgclallno', 'Speed Baccarat I', 'nxpkul2hgclallno', 'Aovivo', NULL, 'Games/Evolution/nxpkul2hgclallno.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1085, 18, 'inativo', 'CrazyTime0000001', 'Crazy Time', 'CrazyTime0000001', 'Aovivo', NULL, 'Games/Evolution/CrazyTime0000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1086, 18, 'inativo', 'vctlz20yfnmp1ylr', 'Roulette', 'vctlz20yfnmp1ylr', 'Aovivo', NULL, 'Games/Evolution/vctlz20yfnmp1ylr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1087, 18, 'inativo', 'zixzea8nrf1675oh', 'Baccarat Squeeze', 'zixzea8nrf1675oh', 'Aovivo', NULL, 'Games/Evolution/zixzea8nrf1675oh.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1088, 18, 'inativo', 'TRPTable00000001', 'Triple Card Poker', 'TRPTable00000001', 'Aovivo', NULL, 'Games/Evolution/TRPTable00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1089, 18, 'inativo', 'teenpattitable01', 'Teen Patti', 'teenpattitable01', 'Aovivo', NULL, 'Games/Evolution/teenpattitable01.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1090, 18, 'inativo', 'peekbaccarat0001', 'Peek Baccarat', 'peekbaccarat0001', 'Aovivo', NULL, 'Games/Evolution/peekbaccarat0001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1091, 18, 'inativo', 'o4kyj7tgpwqqy4m4', 'Speed Baccarat Q', 'o4kyj7tgpwqqy4m4', 'Aovivo', NULL, 'Games/Evolution/o4kyj7tgpwqqy4m4.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1092, 18, 'inativo', 'FunkyTime0000001', 'Funky Time', 'FunkyTime0000001', 'Aovivo', NULL, 'Games/Evolution/FunkyTime0000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1093, 18, 'inativo', 'XxxtremeLigh0001', 'XXXtreme Lightning Roulette', 'XxxtremeLigh0001', 'Aovivo', NULL, 'Games/Evolution/XxxtremeLigh0001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:15', '2024-12-20 05:44:18'),
(1094, 18, 'inativo', 'AndarBahar000001', 'Super Andar Bahar', 'AndarBahar000001', 'Aovivo', NULL, 'Games/Evolution/AndarBahar000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1095, 18, 'inativo', 'o4kylkahpwqqy57w', 'Speed Baccarat R', 'o4kylkahpwqqy57w', 'Aovivo', NULL, 'Games/Evolution/o4kylkahpwqqy57w.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1096, 18, 'inativo', '60i0lcfx5wkkv3sy', 'Baccarat B', '60i0lcfx5wkkv3sy', 'Aovivo', NULL, 'Games/Evolution/60i0lcfx5wkkv3sy.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1097, 18, 'inativo', 'PorBacBo00000001', 'Bac Bo Ao Vivo', 'PorBacBo00000001', 'Aovivo', NULL, 'Games/Evolution/PorBacBo00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:15', '2024-12-20 05:44:14'),
(1098, 18, 'inativo', 'ocye5hmxbsoyrcii', 'No Commission Speed Baccarat B', 'ocye5hmxbsoyrcii', 'Aovivo', NULL, 'Games/Evolution/ocye5hmxbsoyrcii.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1099, 18, 'inativo', 'THBTable00000001', 'Texas Hold em Bonus Poker', 'THBTable00000001', 'Aovivo', NULL, 'Games/Evolution/THBTable00000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1100, 18, 'inativo', 'BonsaiBacc000002', 'Bonsai Speed Baccarat B', 'BonsaiBacc000002', 'Aovivo', NULL, 'Games/Evolution/BonsaiBacc000002.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1101, 18, 'inativo', 'DoubleBallRou001', 'Double Ball Roulette', 'DoubleBallRou001', 'Aovivo', NULL, 'Games/Evolution/DoubleBallRou001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:15', '2024-12-05 23:12:15'),
(1102, 18, 'inativo', 'lv2kzclunt2qnxo5', 'Speed Baccarat B', 'lv2kzclunt2qnxo5', 'Aovivo', NULL, 'Games/Evolution/lv2kzclunt2qnxo5.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1103, 18, 'inativo', 'HoldemTable00001', 'Casino Hold em', 'HoldemTable00001', 'Aovivo', NULL, 'Games/Evolution/HoldemTable00001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1104, 18, 'inativo', 'qsf7alptyvbqohva', 'Speed Baccarat 2', 'qsf7alptyvbqohva', 'Aovivo', NULL, 'Games/Evolution/qsf7alptyvbqohva.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1105, 18, 'inativo', 'pv2zgy42anvdwk3l', 'Lotus Roulette', 'pv2zgy42anvdwk3l', 'Aovivo', NULL, 'Games/Evolution/pv2zgy42anvdwk3l.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1106, 18, 'inativo', 'ovu5cwp54ccmymck', 'Speed Baccarat L', 'ovu5cwp54ccmymck', 'Aovivo', NULL, 'Games/Evolution/ovu5cwp54ccmymck.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1107, 18, 'inativo', 'FanTan0000000001', 'Fan Tan', 'FanTan0000000001', 'Aovivo', NULL, 'Games/Evolution/FanTan0000000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1108, 18, 'inativo', 'BonsaiBacc000003', 'Bonsai Speed Baccarat C', 'BonsaiBacc000003', 'Aovivo', NULL, 'Games/Evolution/BonsaiBacc000003.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1109, 18, 'inativo', 'rep5ca4ynyjl7wdw', 'Speed Baccarat 7', 'rep5ca4ynyjl7wdw', 'Aovivo', NULL, 'Games/Evolution/rep5ca4ynyjl7wdw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1110, 18, 'inativo', 'ovu5dsly4ccmynil', 'Speed Baccarat M', 'ovu5dsly4ccmynil', 'Aovivo', NULL, 'Games/Evolution/ovu5dsly4ccmynil.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1111, 18, 'inativo', 'LightningBac0001', 'Lightning Baccarat', 'LightningBac0001', 'Aovivo', NULL, 'Games/Evolution/LightningBac0001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-20 05:43:49'),
(1112, 18, 'inativo', 'oytmvb9m1zysmc44', 'Baccarat A', 'oytmvb9m1zysmc44', 'Aovivo', NULL, 'Games/Evolution/oytmvb9m1zysmc44.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1113, 18, 'inativo', 'StockMarket00001', 'Stock Market', 'StockMarket00001', 'Aovivo', NULL, 'Games/Evolution/StockMarket00001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1114, 18, 'inativo', 'TopCard000000004', 'Futebol Studio Ao Vivo', 'TopCard000000004', 'Aovivo', NULL, 'Games/Evolution/TopCard000000004.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:16', '2024-12-20 05:43:42'),
(1115, 18, 'inativo', 'qsf7bpfvyvbqolwp', 'Speed Baccarat 3', 'qsf7bpfvyvbqolwp', 'Aovivo', NULL, 'Games/Evolution/qsf7bpfvyvbqolwp.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1116, 18, 'inativo', 'TopDice000000001', 'Football Studio Dice', 'TopDice000000001', 'Aovivo', NULL, 'Games/Evolution/TopDice000000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:16', '2024-12-20 05:43:44'),
(1117, 18, 'inativo', 'k2oswnib7jjaaznw', 'Baccarat Control Squeeze', 'k2oswnib7jjaaznw', 'Aovivo', NULL, 'Games/Evolution/k2oswnib7jjaaznw.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1118, 18, 'inativo', 'qsf65xtoyvbqoaop', 'Speed Baccarat 1', 'qsf65xtoyvbqoaop', 'Aovivo', NULL, 'Games/Evolution/qsf65xtoyvbqoaop.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1119, 18, 'inativo', 'ovu5fzje4ccmyqnr', 'Speed Baccarat P', 'ovu5fzje4ccmyqnr', 'Aovivo', NULL, 'Games/Evolution/ovu5fzje4ccmyqnr.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1120, 18, 'inativo', 'qgqrrnuqvltnvejx', 'Speed Baccarat V', 'qgqrrnuqvltnvejx', 'Aovivo', NULL, 'Games/Evolution/qgqrrnuqvltnvejx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1121, 18, 'inativo', 'ImperialQuest001', 'Imperial Quest', 'ImperialQuest001', 'Aovivo', NULL, 'Games/Evolution/ImperialQuest001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1122, 18, 'inativo', 'wzg6kdkad1oe7m5k', 'VIP Roulette', 'wzg6kdkad1oe7m5k', 'Aovivo', NULL, 'Games/Evolution/wzg6kdkad1oe7m5k.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1123, 18, 'inativo', 'TopCard000000001', 'Football Studio', 'TopCard000000001', 'Aovivo', NULL, 'Games/Evolution/TopCard000000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:16', '2024-12-20 05:44:07'),
(1124, 18, 'inativo', 'SuperSicBo000001', 'Super Sic Bo', 'SuperSicBo000001', 'Aovivo', NULL, 'Games/Evolution/SuperSicBo000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1125, 18, 'inativo', 'ovu5fbxm4ccmypmb', 'Speed Baccarat O', 'ovu5fbxm4ccmypmb', 'Aovivo', NULL, 'Games/Evolution/ovu5fbxm4ccmypmb.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1126, 18, 'inativo', 'nxpj4wumgclak2lx', 'Speed Baccarat H', 'nxpj4wumgclak2lx', 'Aovivo', NULL, 'Games/Evolution/nxpj4wumgclak2lx.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16');
INSERT INTO `games` (`id`, `provider_id`, `game_server_url`, `game_id`, `game_name`, `game_code`, `game_type`, `description`, `cover`, `status`, `technology`, `has_lobby`, `is_mobile`, `has_freespins`, `has_tables`, `only_demo`, `rtp`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`) VALUES
(1127, 18, 'inativo', 'GoldVaultRo00001', 'Gold Vault Roulette', 'GoldVaultRo00001', 'Aovivo', NULL, 'Games/Evolution/GoldVaultRo00001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1128, 18, 'inativo', 'XXXtremeLB000001', 'XXXtreme Lightning Baccarat', 'XXXtremeLB000001', 'Aovivo', NULL, 'Games/Evolution/XXXtremeLB000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1129, 18, 'inativo', 'SpeedAutoRo00001', 'Speed Auto Roulette', 'SpeedAutoRo00001', 'Aovivo', NULL, 'Games/Evolution/SpeedAutoRo00001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:16', '2024-12-20 05:44:00'),
(1130, 18, 'inativo', 'BacBo00000000001', 'Bac Bo', 'BacBo00000000001', 'Aovivo', NULL, 'Games/Evolution/BacBo00000000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 1, '2024-12-05 23:12:16', '2024-12-20 05:43:59'),
(1131, 18, 'inativo', 'BonsaiBacc000001', 'Bonsai Speed Baccarat A', 'BonsaiBacc000001', 'Aovivo', NULL, 'Games/Evolution/BonsaiBacc000001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1132, 18, 'inativo', 'LightningDice001', 'Lightning Dice', 'LightningDice001', 'Aovivo', NULL, 'Games/Evolution/LightningDice001.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1133, 18, 'inativo', 'LightningSpain01', 'Ruleta Relampago en Vivo', 'LightningSpain01', 'Aovivo', NULL, 'Games/Evolution/LightningSpain01.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1134, 19, 'inativo', '8891', 'JETX', '8891', 'Crash', NULL, 'Games/JetX/8891.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16'),
(1135, 19, 'inativo', '8892', 'JETX3', '8892', 'Crash', NULL, 'Games/JetX/8892.webp', '1', 'html5', 0, 0, 0, 0, 0, 0, 'play_fiver', 0, 0, 0, '2024-12-05 23:12:16', '2024-12-05 23:12:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_keys`
--

CREATE TABLE `games_keys` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `playfiver_url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `saldo_agente` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_keys`
--

INSERT INTO `games_keys` (`id`, `created_at`, `updated_at`, `playfiver_url`, `playfiver_secret`, `playfiver_code`, `playfiver_token`, `saldo_agente`) VALUES
(1, '2023-11-30 21:03:08', '2024-12-20 06:07:24', 'https://api.playfiver.com', '', '', '', 416.59);

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_favorites`
--

CREATE TABLE `game_favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_likes`
--

CREATE TABLE `game_likes` (
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_reviews`
--

CREATE TABLE `game_reviews` (
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `suitpay_uri` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stripe_production` tinyint DEFAULT '0',
  `stripe_public_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stripe_webhook_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bspay_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bspay_cliente_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bspay_cliente_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `digito_uri` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `digito_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `digito_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ezze_uri` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ezze_client` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ezze_secret` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ezze_user` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ezze_senha` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `gateways`
--

INSERT INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `bspay_uri`, `bspay_cliente_id`, `bspay_cliente_secret`, `created_at`, `updated_at`, `digito_uri`, `digito_client`, `digito_secret`, `ezze_uri`, `ezze_client`, `ezze_secret`, `ezze_user`, `ezze_senha`) VALUES
(1, 'https://ws.suitpay.app/api/v1/', 'leandro9180_1699980968847', '483733203da84badc12d0dfd5119dc1ada81b402c311f0b2c9cb7e20a6f05989b8006a819d904c198231637ea3fe59fa', 0, 'OndaGames.com', 'OndaGames.com', 'OndaGames.com', 'https://api.pixupbr.com/v2/', '', '', '2023-12-01 00:05:51', '2024-12-20 05:52:35', 'https://api.digitopayoficial.com.br/api/', '', '', 'https://api.ezzebank.com/v2/', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_config`
--

CREATE TABLE `ggds_spin_config` (
  `id` bigint UNSIGNED NOT NULL,
  `prizes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_config`
--

INSERT INTO `ggds_spin_config` (`id`, `prizes`, `created_at`, `updated_at`) VALUES
(1, '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":6},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":13},{\"currency\":\"BRL\",\"value\":11},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2}]', '2024-01-11 23:52:59', '2024-05-31 18:19:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_runs`
--

CREATE TABLE `ggds_spin_runs` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nonce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `possibilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prize` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_runs`
--

INSERT INTO `ggds_spin_runs` (`id`, `key`, `nonce`, `possibilities`, `prize`, `created_at`, `updated_at`) VALUES
(14, '0f1ed6885a54831cbb9a86dfe499f0bf4b9a75b672eeb356c4f23eaf2f4f6e2d', 'bff87143-11da-4bfb-ba55-5796c30f7dfd', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":6},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":13},{\"currency\":\"BRL\",\"value\":11},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2}]', '{\"currency\":\"BRL\",\"value\":10}', '2024-05-31 23:06:40', '2024-05-31 23:06:40'),
(15, '90ce5042ebe58c9a8f65fab974b3b79e48066fca6ea1bf8f5024218b43918db2', 'b5950635-96be-49dd-b69e-2130d7f21e8d', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":6},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":13},{\"currency\":\"BRL\",\"value\":11},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2}]', '{\"currency\":\"BRL\",\"value\":5}', '2024-08-18 01:16:55', '2024-08-18 01:16:55'),
(16, '546d9d47ce10d01cc34b9563433664ece7ecba11543ed830ac70e853c50c54f5', '52e32236-b6ed-441b-ac3c-936d552d84ae', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":6},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":4},{\"currency\":\"BRL\",\"value\":13},{\"currency\":\"BRL\",\"value\":11},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":2}]', '{\"currency\":\"BRL\",\"value\":5}', '2024-08-21 01:15:57', '2024-08-21 01:15:57');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_fivers`
--

CREATE TABLE `ggr_games_fivers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `game` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_world_slots`
--

CREATE TABLE `ggr_games_world_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `game` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

CREATE TABLE `likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `liked_user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2023_10_30_034921_create_settings_table', 6),
(7, '2023_11_03_205251_create_sport_categories_table', 1),
(8, '2023_11_03_205252_create_sports_table', 1),
(10, '2023_11_04_001342_create_sport_events_table', 2),
(11, '2023_11_04_213841_add_fields_to_users_table', 3),
(12, '2023_11_07_202919_create_currencies_table', 4),
(13, '2023_11_07_210310_create_wallets_table', 5),
(16, '2023_11_07_214236_create_withdrawals_table', 7),
(17, '2023_11_07_214240_create_deposits_table', 7),
(18, '2023_11_07_214244_create_orders_table', 7),
(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
(20, '2023_11_07_215204_create_notifications_table', 8),
(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
(22, '2023_11_11_205824_create_casino_categories_table', 9),
(23, '2023_11_11_205834_create_casino_providers_table', 9),
(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
(26, '2023_11_12_225424_create_transactions_table', 10),
(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
(29, '2023_11_14_203632_create_likes_table', 12),
(30, '2023_09_27_214903_create_wallet_changes_table', 13),
(31, '2023_11_16_155140_create_permission_tables', 14),
(32, '2023_11_17_012533_add_language_to_users_table', 15),
(33, '2023_11_22_171616_create_football_leagues_table', 16),
(34, '2023_11_22_175530_create_football_venues_table', 17),
(35, '2023_11_22_175547_create_football_teams_table', 17),
(36, '2023_11_23_143637_create_football_events_table', 18),
(38, '2023_11_29_134520_create_sport_bets_table', 19),
(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
(40, '2023_11_30_195548_create_gateways_table', 20),
(41, '2023_11_30_195557_create_games_keys_table', 20),
(42, '2023_11_30_195609_create_setting_mails_table', 20),
(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
(44, '2023_10_07_183921_create_game_exclusives_table', 21),
(45, '2023_10_11_144956_create_system_wallets_table', 22),
(46, '2023_12_18_172721_create_banners_table', 23),
(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
(48, '2023_12_23_224032_create_fivers_providers_table', 25),
(49, '2023_12_23_224105_create_fivers_games_table', 25),
(50, '2023_12_31_121453_create_custom_layouts_table', 26),
(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
(52, '2024_01_14_155144_create_missions_table', 28),
(53, '2024_01_14_155150_create_mission_users_table', 28),
(54, '2024_01_19_120728_create_ka_gamings_table', 29),
(81, '2024_05_16_225244_create__digito_pay', 30),
(82, '2024_05_16_204842_create__ezzepay', 31);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missions`
--

CREATE TABLE `missions` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `type` enum('deposit','game_bet','total_bet','rounds_played','win_amount','loss_amount') COLLATE utf8mb4_general_ci NOT NULL,
  `game_id` bigint UNSIGNED DEFAULT NULL COMMENT 'Lógica: Referência ao campo id na tabela games',
  `target_amount` decimal(10,2) NOT NULL,
  `reward` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `missions`
--

INSERT INTO `missions` (`id`, `title`, `description`, `type`, `game_id`, `target_amount`, `reward`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Aposte vezes no Fortune Tiger', 'Aposte R$10 no Fortune Tiger e ganhe R$ 5,00 como recompensa!', 'rounds_played', 126, 20.00, 5.00, 'uploads/missoes/01JDQTEEYSMQQEV2S38GTNR31A.png', 'active', '2024-11-27 22:58:50', '2024-12-20 01:32:05'),
(2, 'Depositou R$12,00, ganhou!', 'Deposite 12 reais para ganha o bonus', 'deposit', NULL, 12.00, 2.00, 'uploads/missoes/01JDTCZDW0NQX3GSXEXF7BSJ91.png', 'active', '2024-11-28 23:06:30', '2024-11-28 23:06:30'),
(3, 'Ganhe R$5 no Gates of Olympus', 'chances de ganhar prêmios altíssimos além de pontos para avançar no Clube Donald! Você tem 5 dias para completar a missão, não perca tempo!', 'win_amount', 0, 5.00, 2.00, 'uploads/missoes/01JDTD41EYREMJZA33FWB4N2NE.png', 'active', '2024-11-28 23:09:01', '2024-11-28 23:09:01'),
(4, 'Perca 8 reais no fortune mouser', 'perca no  fortune mouser', 'loss_amount', 68, 8.00, 3.00, 'uploads/missoes/01JDTDDQTM4KFR5P1JWQC9WA4X.png', 'active', '2024-11-28 23:10:47', '2024-11-28 23:14:19'),
(5, 'Perca e ganhe um total de 200 reais', 'Perca e ganhe um total de 200 reais', 'total_bet', NULL, 200.00, 100.00, 'uploads/missoes/01JDTDB00AWGG89C5GHM92WP6W.png', 'active', '2024-11-28 23:12:49', '2024-11-28 23:12:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_users`
--

CREATE TABLE `mission_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL COMMENT 'Referência ao campo id na tabela users',
  `mission_id` bigint UNSIGNED NOT NULL COMMENT 'Referência ao campo id na tabela missions',
  `reward` decimal(10,2) DEFAULT '0.00',
  `redeemed` tinyint(1) DEFAULT '0' COMMENT '0 = Não resgatado, 1 = Resgatado',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `mission_users`
--

INSERT INTO `mission_users` (`id`, `user_id`, `mission_id`, `reward`, `redeemed`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 0.00, 1, '2024-11-28 23:03:38', '2024-12-18 00:54:22'),
(3, 1, 2, 0.00, 1, '2024-11-29 00:19:59', '2024-12-18 00:54:22'),
(4, 1, 2, 0.00, 1, '2024-11-29 04:19:59', '2024-12-18 00:54:22'),
(5, 1524, 1, 0.00, 1, '2024-11-30 20:58:52', '2024-12-18 00:54:22'),
(6, 1, 5, 0.00, 1, '2024-12-01 00:10:37', '2024-12-18 00:54:22'),
(7, 1, 1, 0.00, 1, '2024-12-19 02:03:16', '2024-12-20 01:04:24'),
(8, 1, 1, 0.00, 1, '2024-12-20 02:04:34', '2024-12-20 02:04:34'),
(9, 1, 5, 0.00, 1, '2024-12-20 02:06:37', '2024-12-20 02:06:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 1518),
(2, 'App\\Models\\User', 1523);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notifiable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `session_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `game` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `game_uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type_money` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `providers` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `refunded` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `round_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(2, 1, '672b9ca12f6b7', '1ef9c5e3-6cb9-6e14-b49e-0242ac120003', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672b9ca12f6b7', '2024-11-06 17:43:16', '2024-11-06 17:43:16'),
(3, 1, '672b9ca71d94d', '1ef9c5e3-a53f-6aea-85d8-0242ac120003', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672b9ca71d94d', '2024-11-06 17:43:22', '2024-11-06 17:43:22'),
(4, 1, '672b9ce8de749', '1ef9c5e6-18ac-604e-8571-0242ac120003', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672b9ce8de749', '2024-11-06 17:44:28', '2024-11-06 17:44:28'),
(5, 1, '672b9cf04b881', '1ef9c5e6-5f39-6a70-b743-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '672b9cf04b881', '2024-11-06 17:44:36', '2024-11-06 17:44:36'),
(6, 1, '672b9db9592c5', '1ef9c5ed-dca5-617e-afbe-0242ac120003', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672b9db9592c5', '2024-11-06 17:47:56', '2024-11-06 17:47:56'),
(7, 1, '672b9dbe76437', '1ef9c5ee-0d77-62a2-b7e1-0242ac120003', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672b9dbe76437', '2024-11-06 17:48:01', '2024-11-06 17:48:01'),
(8, 1, '672b9f089261f', '1ef9c5fa-59b0-6734-a709-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672b9f089261f', '2024-11-06 17:53:29', '2024-11-06 17:53:29'),
(9, 1, '672b9f0b4a34e', '1ef9c5fa-737a-670a-9c61-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672b9f0b4a34e', '2024-11-06 17:53:33', '2024-11-06 17:53:33'),
(10, 1, '672b9f0e6215b', '1ef9c5fa-9105-675c-9bc2-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672b9f0e6215b', '2024-11-06 17:53:36', '2024-11-06 17:53:36'),
(11, 1, '672b9f11ec244', '1ef9c5fa-b306-628e-8ed2-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672b9f11ec244', '2024-11-06 17:53:40', '2024-11-06 17:53:40'),
(12, 1, '672ba0e6e16ca', '1ef9c60c-2b56-6be2-ab0a-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672ba0e6e16ca', '2024-11-06 18:01:28', '2024-11-06 18:01:28'),
(13, 1, '672ba0e9f083c', '1ef9c60c-4889-6bd8-be3a-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672ba0e9f083c', '2024-11-06 18:01:31', '2024-11-06 18:01:31'),
(14, 1, '672ba0ed662c1', '1ef9c60c-6947-6c12-a4fe-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672ba0ed662c1', '2024-11-06 18:01:35', '2024-11-06 18:01:35'),
(15, 1, '672bfb1c01649', '1ef9c968-7422-60d8-9ff2-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672bfb1c01649', '2024-11-07 00:26:22', '2024-11-07 00:26:22'),
(16, 1, '672bfb1f60999', '1ef9c968-9476-6ff0-b3da-0242ac120003', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '672bfb1f60999', '2024-11-07 00:26:24', '2024-11-07 00:26:24'),
(17, 1, '672bfb220c6c2', '1ef9c968-adc8-6cb0-a00f-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672bfb220c6c2', '2024-11-07 00:26:28', '2024-11-07 00:26:28'),
(18, 1, '672bfb2530410', '1ef9c968-cbcb-642e-ade1-0242ac120003', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672bfb2530410', '2024-11-07 00:26:31', '2024-11-07 00:26:31'),
(19, 1, '672bfb283e245', '1ef9c968-e8f2-6552-b544-0242ac120003', '126', '126', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '672bfb283e245', '2024-11-07 00:26:34', '2024-11-07 00:26:34'),
(20, 1, '672c25a748353', '1ef9cafe-2f92-60e8-982f-0242ac120002', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '672c25a748353', '2024-11-07 03:27:52', '2024-11-07 03:27:52'),
(21, 1, '672c25b988a56', '1ef9cafe-ddbf-6e2c-85ce-0242ac120002', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '672c25b988a56', '2024-11-07 03:28:10', '2024-11-07 03:28:10'),
(22, 1, '672c25d2b3051', '1ef9caff-cdd2-69dc-96bf-0242ac120002', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '672c25d2b3051', '2024-11-07 03:28:35', '2024-11-07 03:28:35'),
(23, 1, '672c25f2d75a1', '1ef9cb01-006a-6e52-bc52-0242ac120002', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '672c25f2d75a1', '2024-11-07 03:29:07', '2024-11-07 03:29:07'),
(24, 1, '672c25f608436', '1ef9cb01-1e79-654c-82c2-0242ac120002', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '672c25f608436', '2024-11-07 03:29:10', '2024-11-07 03:29:10'),
(25, 1, '672c262cabb90', '1ef9cb03-27d8-6424-97a1-0242ac120002', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '672c262cabb90', '2024-11-07 03:30:05', '2024-11-07 03:30:05'),
(26, 1, '672c277548a48', '1ef9cb0f-6590-60c6-aef2-0242ac120002', '126', '126', 'win', 'balance', 0.88, 'play_fiver', 0, 1, '672c277548a48', '2024-11-07 03:35:34', '2024-11-07 03:35:34'),
(27, 1, '672c2777d301c', '1ef9cb0f-7e0a-6d5e-8a70-0242ac120002', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672c2777d301c', '2024-11-07 03:35:36', '2024-11-07 03:35:36'),
(28, 1, '672c27799a83d', '1ef9cb0f-8ee8-61c6-aada-0242ac120002', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672c27799a83d', '2024-11-07 03:35:38', '2024-11-07 03:35:38'),
(29, 1, '672c277b47086', '1ef9cb0f-9eb8-68a8-91bc-0242ac120002', '126', '126', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '672c277b47086', '2024-11-07 03:35:40', '2024-11-07 03:35:40'),
(30, 1, '672c277dbb5e6', '1ef9cb0f-b656-65a0-ab8c-0242ac120002', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672c277dbb5e6', '2024-11-07 03:35:42', '2024-11-07 03:35:42'),
(31, 1, '672c277f81db0', '1ef9cb0f-c729-6da0-8c40-0242ac120002', '126', '126', 'win', 'balance', 0.48, 'play_fiver', 0, 1, '672c277f81db0', '2024-11-07 03:35:44', '2024-11-07 03:35:44'),
(32, 1, '672c2781d49c1', '1ef9cb0f-dd78-661a-ad38-0242ac120002', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672c2781d49c1', '2024-11-07 03:35:46', '2024-11-07 03:35:46'),
(33, 1, '672c278368b84', '1ef9cb0f-ec54-62ba-9b8f-0242ac120002', '126', '126', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '672c278368b84', '2024-11-07 03:35:48', '2024-11-07 03:35:48'),
(34, 1, '672c2785e598d', '1ef9cb10-0447-6d5e-8039-0242ac120002', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '672c2785e598d', '2024-11-07 03:35:50', '2024-11-07 03:35:50'),
(35, 1, '672c278c45bae', '1ef9cb10-40cb-63d4-80f5-0242ac120002', '126', '126', 'win', 'balance', 12.00, 'play_fiver', 0, 1, '672c278c45bae', '2024-11-07 03:35:57', '2024-11-07 03:35:57'),
(36, 1, '672c27991b973', '1ef9cb10-bb20-6526-b600-0242ac120002', '126', '126', 'win', 'balance', 1.28, 'play_fiver', 0, 1, '672c27991b973', '2024-11-07 03:36:10', '2024-11-07 03:36:10'),
(37, 1, '672c279fa0c9e', '1ef9cb10-f98c-6490-980a-0242ac120002', '126', '126', 'win', 'balance', 0.48, 'play_fiver', 0, 1, '672c279fa0c9e', '2024-11-07 03:36:16', '2024-11-07 03:36:16'),
(38, 1, '672c27a22063e', '1ef9cb11-1124-6b02-a7e7-0242ac120002', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672c27a22063e', '2024-11-07 03:36:19', '2024-11-07 03:36:19'),
(39, 1, '672c27a3ad82a', '1ef9cb11-2030-6fe2-8203-0242ac120002', '126', '126', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '672c27a3ad82a', '2024-11-07 03:36:20', '2024-11-07 03:36:20'),
(40, 1, '672c28867b478', '1ef9cb19-9312-6468-9312-0242ac120002', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '672c28867b478', '2024-11-07 03:40:07', '2024-11-07 03:40:07'),
(41, 1, '672c28885bf1e', '1ef9cb19-a4eb-696e-b9a4-0242ac120002', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '672c28885bf1e', '2024-11-07 03:40:09', '2024-11-07 03:40:09'),
(42, 1, '672c288b0b7ba', '1ef9cb19-be63-65b8-878c-0242ac120002', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '672c288b0b7ba', '2024-11-07 03:40:11', '2024-11-07 03:40:11'),
(43, 1, '672c288d5d9bb', '1ef9cb19-d4ab-62f8-bc84-0242ac120002', '126', '126', 'win', 'balance', 0.72, 'play_fiver', 0, 1, '672c288d5d9bb', '2024-11-07 03:40:14', '2024-11-07 03:40:14'),
(44, 1, '672c288fbe81a', '1ef9cb19-eb86-6c48-bd5d-0242ac120002', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '672c288fbe81a', '2024-11-07 03:40:16', '2024-11-07 03:40:16'),
(45, 1, '672c289255bf1', '1ef9cb1a-040b-6610-aa7a-0242ac120002', '126', '126', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '672c289255bf1', '2024-11-07 03:40:19', '2024-11-07 03:40:19'),
(46, 1, '672c28facb6c3', '1ef9cb1d-e877-610c-9dc3-0242ac120002', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '672c28facb6c3', '2024-11-07 03:42:03', '2024-11-07 03:42:03'),
(47, 1, '672c29117371e', '1ef9cb1e-c05f-64f2-9a15-0242ac120002', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '672c29117371e', '2024-11-07 03:42:26', '2024-11-07 03:42:26'),
(48, 1, '672c2fb1a7daa', '1ef9cb5d-f0bc-6958-91e0-0242ac120002', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fb1a7daa', '2024-11-07 04:10:42', '2024-11-07 04:10:42'),
(49, 1, '672c2fcc34290', '1ef9cb5e-edb5-6cea-b1ee-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c2fcc34290', '2024-11-07 04:11:09', '2024-11-07 04:11:09'),
(50, 1, '672c2fcde2113', '1ef9cb5e-fe09-6c90-b4c4-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fcde2113', '2024-11-07 04:11:10', '2024-11-07 04:11:10'),
(51, 1, '672c2fcfb1d2b', '1ef9cb5f-0f3a-610e-92a1-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fcfb1d2b', '2024-11-07 04:11:12', '2024-11-07 04:11:12'),
(52, 1, '672c2fd1882ea', '1ef9cb5f-20ac-6a4a-b22e-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fd1882ea', '2024-11-07 04:11:14', '2024-11-07 04:11:14'),
(53, 1, '672c2fd34941e', '1ef9cb5f-3149-6f74-9513-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fd34941e', '2024-11-07 04:11:16', '2024-11-07 04:11:16'),
(54, 1, '672c2fd4dc01d', '1ef9cb5f-408f-60b0-983a-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fd4dc01d', '2024-11-07 04:11:17', '2024-11-07 04:11:17'),
(55, 1, '672c2fd68c5ee', '1ef9cb5f-5085-6744-b20f-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fd68c5ee', '2024-11-07 04:11:19', '2024-11-07 04:11:19'),
(56, 1, '672c2fed7abae', '1ef9cb60-2b2d-6bbc-8c5d-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fed7abae', '2024-11-07 04:11:42', '2024-11-07 04:11:42'),
(57, 1, '672c2fef2bfdc', '1ef9cb60-3b2c-6bda-82c6-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2fef2bfdc', '2024-11-07 04:11:44', '2024-11-07 04:11:44'),
(58, 1, '672c2ff0b2c32', '1ef9cb60-49fa-63e2-9a40-0242ac120002', '126', '126', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '672c2ff0b2c32', '2024-11-07 04:11:45', '2024-11-07 04:11:45'),
(59, 1, '672c2ff504b04', '1ef9cb60-72dc-604e-a168-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c2ff504b04', '2024-11-07 04:11:49', '2024-11-07 04:11:49'),
(60, 1, '672c2ff6b2891', '1ef9cb60-832f-6e1e-8d77-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c2ff6b2891', '2024-11-07 04:11:51', '2024-11-07 04:11:51'),
(61, 1, '672c2ff865a07', '1ef9cb60-9341-6d16-9fa0-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c2ff865a07', '2024-11-07 04:11:53', '2024-11-07 04:11:53'),
(62, 1, '672c2ffa13825', '1ef9cb60-a31f-6918-af9d-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c2ffa13825', '2024-11-07 04:11:54', '2024-11-07 04:11:54'),
(63, 1, '672c2ffc069f6', '1ef9cb60-b5b1-6374-9c22-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c2ffc069f6', '2024-11-07 04:11:56', '2024-11-07 04:11:56'),
(64, 1, '672c2ffdb939b', '1ef9cb60-c634-6cb4-a6e7-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '672c2ffdb939b', '2024-11-07 04:11:58', '2024-11-07 04:11:58'),
(65, 1, '672c30344bdf2', '1ef9cb62-ce74-6fda-9597-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '672c30344bdf2', '2024-11-07 04:12:53', '2024-11-07 04:12:53'),
(66, 1, '672c303782280', '1ef9cb62-ed2f-6b3c-8a2a-0242ac120002', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '672c303782280', '2024-11-07 04:12:56', '2024-11-07 04:12:56'),
(67, 1, '672c303abef7a', '1ef9cb63-0c2b-6e46-9061-0242ac120002', '126', '126', 'win', 'balance_withdrawal', 20.00, 'play_fiver', 0, 1, '672c303abef7a', '2024-11-07 04:12:59', '2024-11-07 04:12:59'),
(68, 1, '672c3040c89e1', '1ef9cb63-45c5-629c-bac7-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672c3040c89e1', '2024-11-07 04:13:05', '2024-11-07 04:13:05'),
(69, 1, '672c30441f05d', '1ef9cb63-654a-6914-807d-0242ac120002', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '672c30441f05d', '2024-11-07 04:13:09', '2024-11-07 04:13:09'),
(70, 1, '672c3048866e8', '1ef9cb63-8f7a-6810-acf8-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672c3048866e8', '2024-11-07 04:13:13', '2024-11-07 04:13:13'),
(71, 1, '672c304c23e7a', '1ef9cb63-b1c6-6dd8-88cb-0242ac120002', '126', '126', 'win', 'balance_bonus', 6.40, 'play_fiver', 0, 1, '672c304c23e7a', '2024-11-07 04:13:17', '2024-11-07 04:13:17'),
(72, 1, '672c305572415', '1ef9cb64-0aab-611a-bf28-0242ac120002', '126', '126', 'win', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '672c305572415', '2024-11-07 04:13:26', '2024-11-07 04:13:26'),
(73, 1, '672c305dbc25b', '1ef9cb64-59d8-6f9e-b97a-0242ac120002', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '672c305dbc25b', '2024-11-07 04:13:34', '2024-11-07 04:13:34'),
(74, 1, '672c3062374c0', '1ef9cb64-8457-696e-89bc-0242ac120002', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '672c3062374c0', '2024-11-07 04:13:39', '2024-11-07 04:13:39'),
(75, 1, '672c30664a7f5', '1ef9cb64-ab3d-6290-aeaf-0242ac120002', '126', '126', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672c30664a7f5', '2024-11-07 04:13:43', '2024-11-07 04:13:43'),
(76, 1, '672c306a1d11a', '1ef9cb64-cf9c-67f8-a92e-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672c306a1d11a', '2024-11-07 04:13:46', '2024-11-07 04:13:46'),
(77, 1, '672c306c49f90', '1ef9cb64-e470-64cc-928c-0242ac120002', '126', '126', 'win', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '672c306c49f90', '2024-11-07 04:13:49', '2024-11-07 04:13:49'),
(78, 1, '672c32251fc86', '1ef9cb75-507e-6fb4-86c4-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c32251fc86', '2024-11-07 04:21:09', '2024-11-07 04:21:09'),
(79, 1, '672c3226c91f9', '1ef9cb75-60a5-674e-9dc1-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c3226c91f9', '2024-11-07 04:21:11', '2024-11-07 04:21:11'),
(80, 1, '672c32286549b', '1ef9cb75-6fd1-6c40-b515-0242ac120002', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '672c32286549b', '2024-11-07 04:21:13', '2024-11-07 04:21:13'),
(81, 1, '672c322ec725e', '1ef9cb75-acdd-6b5c-9702-0242ac120002', '126', '126', 'win', 'balance_bonus', 400.00, 'play_fiver', 0, 1, '672c322ec725e', '2024-11-07 04:21:19', '2024-11-07 04:21:19'),
(82, 1, '672c3237d20ab', '1ef9cb76-031f-6204-b430-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c3237d20ab', '2024-11-07 04:21:28', '2024-11-07 04:21:28'),
(83, 1, '672c323a76208', '1ef9cb76-1c23-6e80-8a00-0242ac120002', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c323a76208', '2024-11-07 04:21:32', '2024-11-07 04:21:32'),
(84, 1, '672c323e19b56', '1ef9cb76-3ead-67e4-8dcd-0242ac120002', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c323e19b56', '2024-11-07 04:21:35', '2024-11-07 04:21:35'),
(85, 1, '672c32410ac8b', '1ef9cb76-5ab4-6398-bac9-0242ac120002', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c32410ac8b', '2024-11-07 04:21:37', '2024-11-07 04:21:37'),
(86, 1, '672c3274972ed', '1ef9cb78-4690-6446-a03c-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c3274972ed', '2024-11-07 04:22:29', '2024-11-07 04:22:29'),
(87, 1, '672c327635b20', '1ef9cb78-55d3-6bce-be92-0242ac120002', '126', '126', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '672c327635b20', '2024-11-07 04:22:31', '2024-11-07 04:22:31'),
(88, 1, '672c3278a29c0', '1ef9cb78-6d27-6b22-9cb8-0242ac120002', '126', '126', 'win', 'balance_bonus', 2.00, 'play_fiver', 0, 1, '672c3278a29c0', '2024-11-07 04:22:33', '2024-11-07 04:22:33'),
(89, 1, '672c365027c0a', '1ef9cb9d-1084-61f2-866d-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c365027c0a', '2024-11-07 04:38:57', '2024-11-07 04:38:57'),
(90, 1, '672c3652d59c0', '1ef9cb9d-2a60-62b0-a999-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672c3652d59c0', '2024-11-07 04:38:59', '2024-11-07 04:38:59'),
(91, 1, '672d05cae8e82', '1ef9d357-bea2-6c40-929e-0242ac120002', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '672d05cae8e82', '2024-11-07 19:24:12', '2024-11-07 19:24:12'),
(92, 1, '672d05d08aee9', '1ef9d357-f42f-6c46-bb4d-0242ac120002', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672d05d08aee9', '2024-11-07 19:24:18', '2024-11-07 19:24:18'),
(93, 1, '672d05d3e9464', '1ef9d358-147a-64ba-a568-0242ac120002', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '672d05d3e9464', '2024-11-07 19:24:22', '2024-11-07 19:24:22'),
(94, 1, '672d0665e1c6c', '1ef9d35d-848d-6680-b1bf-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672d0665e1c6c', '2024-11-07 19:26:48', '2024-11-07 19:26:48'),
(95, 1, '672d066c2eb05', '1ef9d35d-c04f-6ab0-a4b8-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672d066c2eb05', '2024-11-07 19:26:53', '2024-11-07 19:26:53'),
(96, 1, '672d06734ccd4', '1ef9d35e-043e-67da-ba42-0242ac120002', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '672d06734ccd4', '2024-11-07 19:27:00', '2024-11-07 19:27:00'),
(97, 1, '672d06793a753', '1ef9d35e-3cbf-6992-a158-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672d06793a753', '2024-11-07 19:27:06', '2024-11-07 19:27:06'),
(98, 1, '672d067dccedb', '1ef9d35e-689d-6c30-828c-0242ac120002', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '672d067dccedb', '2024-11-07 19:27:11', '2024-11-07 19:27:11'),
(99, 1, '672d7bd752d21', '1ef9d7bd-8aaf-66bc-8a9d-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672d7bd752d21', '2024-11-08 03:47:52', '2024-11-08 03:47:52'),
(100, 1, '672d7bd949e14', '1ef9d7bd-9d68-6ca4-ad31-0242ac120003', '126', '126', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '672d7bd949e14', '2024-11-08 03:47:54', '2024-11-08 03:47:54'),
(101, 1, '672e207ee2b2d', '1ef9dddf-cf90-6a7e-877e-0242ac120003', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672e207ee2b2d', '2024-11-08 15:30:24', '2024-11-08 15:30:24'),
(102, 1, '672e208090329', '1ef9dddf-df6b-602a-8421-0242ac120003', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672e208090329', '2024-11-08 15:30:25', '2024-11-08 15:30:25'),
(103, 1, '672e39bc268d4', '1ef9ded0-82a6-6dca-b74d-0242ac120003', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '672e39bc268d4', '2024-11-08 17:18:05', '2024-11-08 17:18:05'),
(104, 1, '672e39be7aa9e', '1ef9ded0-9902-67a4-8ef3-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672e39be7aa9e', '2024-11-08 17:18:07', '2024-11-08 17:18:07'),
(105, 1, '672e39bff392b', '1ef9ded0-a745-64c4-af1b-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672e39bff392b', '2024-11-08 17:18:08', '2024-11-08 17:18:08'),
(106, 1, '672e39c198b99', '1ef9ded0-b6cb-622c-ab6a-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '672e39c198b99', '2024-11-08 17:18:11', '2024-11-08 17:18:11'),
(107, 1, '672e39c459312', '1ef9ded0-d0ec-6228-b96a-0242ac120003', '126', '126', 'win', 'balance_bonus', 2.00, 'play_fiver', 0, 1, '672e39c459312', '2024-11-08 17:18:13', '2024-11-08 17:18:13'),
(108, 1, '67340d538187e', '1efa1661-6ef9-62e6-9a92-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67340d538187e', '2024-11-13 03:22:14', '2024-11-13 03:22:14'),
(109, 1, '67340d5756da3', '1efa1661-9373-6c8e-895e-0242ac120003', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '67340d5756da3', '2024-11-13 03:22:16', '2024-11-13 03:22:16'),
(110, 1, '67340d5c86fec', '1efa1661-c504-63fc-882c-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67340d5c86fec', '2024-11-13 03:22:21', '2024-11-13 03:22:21'),
(111, 1, '67340d5e7e0b5', '1efa1661-d7bd-65de-a585-0242ac120003', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67340d5e7e0b5', '2024-11-13 03:22:23', '2024-11-13 03:22:23'),
(112, 1, '6734d8132aa7d', '1efa1dee-feb2-6b1e-9573-0242ac120003', '98', '98', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6734d8132aa7d', '2024-11-13 17:47:16', '2024-11-13 17:47:16'),
(113, 1, '6734d815bf292', '1efa1def-1792-6562-b555-0242ac120003', '98', '98', 'win', 'balance_bonus', 2.50, 'play_fiver', 0, 1, '6734d815bf292', '2024-11-13 17:47:19', '2024-11-13 17:47:19'),
(114, 1, '6734d81d4e905', '1efa1def-5f77-6508-a03e-0242ac120003', '98', '98', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6734d81d4e905', '2024-11-13 17:47:26', '2024-11-13 17:47:26'),
(115, 1, '6734d81f9e781', '1efa1def-75a9-675e-8bca-0242ac120003', '98', '98', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '6734d81f9e781', '2024-11-13 17:47:28', '2024-11-13 17:47:28'),
(116, 1, '67369b606eeed', '1efa2ebe-f1e9-6802-9ee5-0a9047c5c291', '1695365', '1695365', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '67369b606eeed', '2024-11-15 01:52:51', '2024-11-15 01:52:51'),
(117, 1, '67369b622f111', '1efa2ebf-027d-6c2c-9696-0a9047c5c291', '1695365', '1695365', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '67369b622f111', '2024-11-15 01:52:52', '2024-11-15 01:52:52'),
(118, 1, '67369b6cc9383', '1efa2ebf-67e1-67da-b175-0a9047c5c291', '1695365', '1695365', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '67369b6cc9383', '2024-11-15 01:53:04', '2024-11-15 01:53:04'),
(119, 1, '67369b73b2b60', '1efa2ebf-a9c1-6fc4-9f64-da5d9a4168c2', '1695365', '1695365', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '67369b73b2b60', '2024-11-15 01:53:11', '2024-11-15 01:53:11'),
(120, 1, '67369b809278a', '1efa2ec0-2479-6ab4-adf5-da5d9a4168c2', '1695365', '1695365', 'win', 'balance', 8.64, 'play_fiver', 0, 1, '67369b809278a', '2024-11-15 01:53:23', '2024-11-15 01:53:23'),
(121, 1, '67369be187e3c', '1efa2ec3-c121-6e22-894b-0a9047c5c291', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369be187e3c', '2024-11-15 01:55:01', '2024-11-15 01:55:01'),
(122, 1, '67369be339c24', '1efa2ec3-d125-6c4c-baf7-da5d9a4168c2', '126', '126', 'win', 'balance_bonus', 0.96, 'play_fiver', 0, 1, '67369be339c24', '2024-11-15 01:55:02', '2024-11-15 01:55:02'),
(123, 1, '67369f1cae09a', '1efa2ee2-9180-6e74-9cba-0a9047c5c291', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67369f1cae09a', '2024-11-15 02:08:48', '2024-11-15 02:08:48'),
(124, 1, '67369f1eee547', '1efa2ee2-a716-6798-bc4b-0a9047c5c291', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '67369f1eee547', '2024-11-15 02:08:49', '2024-11-15 02:08:49'),
(125, 1, '67369f2096ac9', '1efa2ee2-b6bc-6e2c-ba49-da5d9a4168c2', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369f2096ac9', '2024-11-15 02:08:51', '2024-11-15 02:08:51'),
(126, 1, '67369f2f93eae', '1efa2ee3-45af-6c74-9547-da5d9a4168c2', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369f2f93eae', '2024-11-15 02:09:06', '2024-11-15 02:09:06'),
(127, 1, '67369f3170b14', '1efa2ee3-5760-6cf2-b061-da5d9a4168c2', '1695365', '1695365', 'win', 'balance_bonus', 2.00, 'play_fiver', 0, 1, '67369f3170b14', '2024-11-15 02:09:07', '2024-11-15 02:09:07'),
(128, 1, '67369f3595384', '1efa2ee3-7ef3-6c38-9eb1-0a9047c5c291', '1695365', '1695365', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '67369f3595384', '2024-11-15 02:09:10', '2024-11-15 02:09:10'),
(129, 1, '67369f374cfa9', '1efa2ee3-8f34-6430-a219-0a9047c5c291', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369f374cfa9', '2024-11-15 02:09:15', '2024-11-15 02:09:15'),
(130, 1, '67369f380c45e', '1efa2ee3-9636-683c-88ed-da5d9a4168c2', '1695365', '1695365', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '67369f380c45e', '2024-11-15 02:09:15', '2024-11-15 02:09:15'),
(131, 1, NULL, '1efa2ee6-86cf-6cb0-9d62-e280ef851ab3', 'aviator', 'aviator', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-15 02:10:32', '2024-11-15 02:10:32'),
(132, 1, NULL, '1efa2ee6-8761-6bce-b24d-0a9047c5c291', 'aviator', 'aviator', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-15 02:10:32', '2024-11-15 02:10:32'),
(133, 1, NULL, '1efa2ee6-ca92-69f2-b22f-0a9047c5c291', 'aviator', 'aviator', 'win', 'balance', 1.09, 'play_fiver', 0, 1, NULL, '2024-11-15 02:10:39', '2024-11-15 02:10:39'),
(134, 1, NULL, '1efa2ee6-d78c-6c02-bf7e-0a9047c5c291', 'aviator', 'aviator', 'win', 'balance', 1.23, 'play_fiver', 0, 1, NULL, '2024-11-15 02:10:41', '2024-11-15 02:10:41'),
(135, 1, '1efa2ee7-79a0-67be-9682-0a9047c5c291', '1efa2ee7-79aa-6192-9085-0a9047c5c291', 'mines', 'mines', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '1efa2ee7-79a0-67be-9682-0a9047c5c291', '2024-11-15 02:10:59', '2024-11-15 02:10:59'),
(136, 1, '67369fb8645ba', '1efa2ee8-5e69-6ef4-80e9-da5d9a4168c2', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369fb8645ba', '2024-11-15 02:11:22', '2024-11-15 02:11:22'),
(137, 1, '67369fb992b57', '1efa2ee8-69c1-650e-8d19-0a9047c5c291', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369fb992b57', '2024-11-15 02:11:23', '2024-11-15 02:11:23'),
(138, 1, '67369fbac15ea', '1efa2ee8-7523-6802-baff-e280ef851ab3', 'wild-ape-3258', 'wild-ape-3258', 'win', 'balance_bonus', 0.04, 'play_fiver', 0, 1, '67369fbac15ea', '2024-11-15 02:11:25', '2024-11-15 02:11:25'),
(139, 1, '67369fc03edf6', '1efa2ee8-a93e-6966-81d7-0a9047c5c291', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369fc03edf6', '2024-11-15 02:11:31', '2024-11-15 02:11:31'),
(140, 1, '67369fc169744', '1efa2ee8-b471-69fa-b9c6-0a9047c5c291', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67369fc169744', '2024-11-15 02:11:31', '2024-11-15 02:11:31'),
(141, 1, '67369fdd6d823', '1efa2ee9-bf8a-6584-b6b3-da5d9a4168c2', '12560', '12560', 'win', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '67369fdd6d823', '2024-11-15 02:12:00', '2024-11-15 02:12:00'),
(142, 1, '67369fe2d2b36', '1efa2ee9-f32e-6994-8175-0a9047c5c291', '12560', '12560', 'win', 'balance_bonus', 0.70, 'play_fiver', 0, 1, '67369fe2d2b36', '2024-11-15 02:12:04', '2024-11-15 02:12:04'),
(143, 1, '67369fe9b8ebf', '1efa2eea-34ef-67e8-b1cc-0a9047c5c291', '12560', '12560', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67369fe9b8ebf', '2024-11-15 02:12:11', '2024-11-15 02:12:11'),
(144, 1, '67369feed6449', '1efa2eea-65c3-6c52-bf89-da5d9a4168c2', '12560', '12560', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67369feed6449', '2024-11-15 02:12:17', '2024-11-15 02:12:17'),
(145, 1, '67369ff3cc25a', '1efa2eea-950d-6846-b5e7-e280ef851ab3', '12560', '12560', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67369ff3cc25a', '2024-11-15 02:12:21', '2024-11-15 02:12:21'),
(146, 1, '67369ffd07a0c', '1efa2eea-ecbe-6860-86ee-0a9047c5c291', '12560', '12560', 'win', 'balance_bonus', 10.00, 'play_fiver', 0, 1, '67369ffd07a0c', '2024-11-15 02:12:30', '2024-11-15 02:12:30'),
(147, 1, '6736a00169feb', '1efa2eeb-16bb-6a5a-9654-da5d9a4168c2', '12560', '12560', 'win', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '6736a00169feb', '2024-11-15 02:12:35', '2024-11-15 02:12:35'),
(148, 1, '6736a005b0592', '1efa2eeb-3fa0-6fba-b6c1-da5d9a4168c2', '12560', '12560', 'win', 'balance_bonus', 22.00, 'play_fiver', 0, 1, '6736a005b0592', '2024-11-15 02:12:39', '2024-11-15 02:12:39'),
(149, 1, '6736ac30ccdb5', '1efa2f5f-4bb9-6120-a409-522fbe3ddf0d', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6736ac30ccdb5', '2024-11-15 03:04:37', '2024-11-15 03:04:37'),
(150, 1, '6736ac31ab201', '1efa2f5f-53f1-69d2-95fd-ca8eed8bd28d', '126', '126', 'win', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '6736ac31ab201', '2024-11-15 03:04:37', '2024-11-15 03:04:37'),
(151, 1, '6736b9866467e', '1efa2fde-7615-6b7e-85df-465e01ee813b', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6736b9866467e', '2024-11-15 04:01:27', '2024-11-15 04:01:27'),
(152, 1, '6736b9874d49b', '1efa2fde-7eb7-6f20-a166-ca8eed8bd28d', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6736b9874d49b', '2024-11-15 04:01:28', '2024-11-15 04:01:28'),
(153, 1, '6736b9881fed4', '1efa2fde-867b-6eb4-b515-7a30d6c8a2c5', '126', '126', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '6736b9881fed4', '2024-11-15 04:01:28', '2024-11-15 04:01:28'),
(154, 1, '6736b989a5123', '1efa2fde-9538-68e4-868b-6209c3f68ac0', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '6736b989a5123', '2024-11-15 04:01:31', '2024-11-15 04:01:31'),
(155, 1, '6736b98b61c8a', '1efa2fde-a5aa-647a-95f5-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '6736b98b61c8a', '2024-11-15 04:01:32', '2024-11-15 04:01:32'),
(156, 1, '6736b98ce4248', '1efa2fde-b44b-66e6-b6ec-ca8eed8bd28d', '126', '126', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '6736b98ce4248', '2024-11-15 04:01:34', '2024-11-15 04:01:34'),
(157, 1, '6736b98e6a988', '1efa2fde-c29e-6b12-888d-465e01ee813b', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6736b98e6a988', '2024-11-15 04:01:35', '2024-11-15 04:01:35'),
(158, 1, '6736b9e89aecb', '1efa2fe2-1ed0-69be-9f2f-faf7dc68505c', '98', '98', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6736b9e89aecb', '2024-11-15 04:03:06', '2024-11-15 04:03:06'),
(159, 1, '6736ba113fe95', '1efa2fe3-a244-6038-8027-d6369503704a', '98', '98', 'win', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '6736ba113fe95', '2024-11-15 04:03:47', '2024-11-15 04:03:47'),
(160, 1, '6736ba12e3ecc', '1efa2fe3-b235-694c-9514-faf7dc68505c', '98', '98', 'win', 'balance_bonus', 2.30, 'play_fiver', 0, 1, '6736ba12e3ecc', '2024-11-15 04:03:48', '2024-11-15 04:03:48'),
(161, 1, '6736ba35c2e16', '1efa2fe4-feb4-68b2-af14-465e01ee813b', '126', '126', 'win', 'balance_bonus', 1.04, 'play_fiver', 0, 1, '6736ba35c2e16', '2024-11-15 04:04:23', '2024-11-15 04:04:23'),
(162, 1, '67383a539e083', '1efa3e34-375e-6070-93db-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383a539e083', '2024-11-16 07:48:50', '2024-11-16 07:48:50'),
(163, 1, '67383a548bea3', '1efa3e34-4032-6b42-98b0-d6369503704a', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '67383a548bea3', '2024-11-16 07:48:51', '2024-11-16 07:48:51'),
(164, 1, '67383ace91bb8', '1efa3e38-cbe7-6f94-be79-d6369503704a', '126', '126', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383ace91bb8', '2024-11-16 07:49:21', '2024-11-16 07:49:21'),
(165, 1, '67383ad0482dd', '1efa3e38-dc1b-6abe-b04a-d6369503704a', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383ad0482dd', '2024-11-16 07:49:21', '2024-11-16 07:49:21'),
(166, 1, '67383ad1afa33', '1efa3e38-e9af-648c-837a-32c151810222', '126', '126', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383ad1afa33', '2024-11-16 07:49:22', '2024-11-16 07:49:22'),
(167, 1, '67383ad3ee340', '1efa3e38-ff33-6b8c-bfa0-32c151810222', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383ad3ee340', '2024-11-16 07:49:23', '2024-11-16 07:49:23'),
(168, 1, '67383ad6e3fcd', '1efa3e39-1b69-6cde-aaa4-32c151810222', '126', '126', 'win', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '67383ad6e3fcd', '2024-11-16 07:49:24', '2024-11-16 07:49:24'),
(169, 1, '67383add0a303', '1efa3e39-55a9-6b4c-9d53-32c151810222', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383add0a303', '2024-11-16 07:49:26', '2024-11-16 07:49:26'),
(170, 1, '67383ae0797d6', '1efa3e39-769e-6e56-a5c0-32c151810222', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383ae0797d6', '2024-11-16 07:49:26', '2024-11-16 07:49:26'),
(171, 1, '67383ae3cb9fd', '1efa3e39-9670-693c-93de-32c151810222', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383ae3cb9fd', '2024-11-16 07:49:27', '2024-11-16 07:49:27'),
(172, 1, '67383aeb2d34a', '1efa3e39-dc8b-67d2-a33c-d6369503704a', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383aeb2d34a', '2024-11-16 07:49:29', '2024-11-16 07:49:29'),
(173, 1, '67383aee24df2', '1efa3e39-f8d4-66a0-b305-32c151810222', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383aee24df2', '2024-11-16 07:49:30', '2024-11-16 07:49:30'),
(174, 1, '67383af12e461', '1efa3e3a-15d0-6100-b1a8-d6369503704a', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383af12e461', '2024-11-16 07:49:31', '2024-11-16 07:49:31'),
(175, 1, '67383af382753', '1efa3e3a-2c2b-6972-ad94-32c151810222', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383af382753', '2024-11-16 07:49:31', '2024-11-16 07:49:31'),
(176, 1, '67383af6f4106', '1efa3e3a-4d37-68aa-aa8b-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383af6f4106', '2024-11-16 07:49:32', '2024-11-16 07:49:32'),
(177, 1, '67383afa99462', '1efa3e3a-6fd1-694c-82db-d6369503704a', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383afa99462', '2024-11-16 07:49:33', '2024-11-16 07:49:33'),
(178, 1, '67383afe8a2af', '1efa3e3a-9560-6140-b5da-d6369503704a', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383afe8a2af', '2024-11-16 07:49:34', '2024-11-16 07:49:34'),
(179, 1, '67383b0186acf', '1efa3e3a-b1d9-65ce-baff-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '67383b0186acf', '2024-11-16 07:49:35', '2024-11-16 07:49:35'),
(180, 1, '67383b0506bb5', '1efa3e3a-d2ff-649c-84c6-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '67383b0506bb5', '2024-11-16 07:49:35', '2024-11-16 07:49:35'),
(181, 1, '67383ce3d8b65', '1efa3e4c-a9c3-6e0e-955f-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383ce3d8b65', '2024-11-16 07:51:03', '2024-11-16 07:51:03'),
(182, 1, '67383ce4ab5c8', '1efa3e4c-b187-669a-a456-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '67383ce4ab5c8', '2024-11-16 07:51:03', '2024-11-16 07:51:03'),
(183, 1, '67383ce615cfd', '1efa3e4c-bec2-683c-8897-d6369503704a', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383ce615cfd', '2024-11-16 07:51:04', '2024-11-16 07:51:04'),
(184, 1, '67383ce6f2847', '1efa3e4c-c761-6948-981e-d6369503704a', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383ce6f2847', '2024-11-16 07:51:05', '2024-11-16 07:51:05'),
(185, 1, '67383ce7c5314', '1efa3e4c-cf25-6f30-b9c7-d6369503704a', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383ce7c5314', '2024-11-16 07:51:05', '2024-11-16 07:51:05'),
(186, 1, '67383ce891088', '1efa3e4c-d6a5-68fa-9819-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '67383ce891088', '2024-11-16 07:51:06', '2024-11-16 07:51:06'),
(187, 1, '67383ce9ec7e3', '1efa3e4c-e3c1-6ac0-9b3a-d6369503704a', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383ce9ec7e3', '2024-11-16 07:51:06', '2024-11-16 07:51:06'),
(188, 1, '67383ceab8612', '1efa3e4c-eb41-6fd4-804d-d6369503704a', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '67383ceab8612', '2024-11-16 07:51:07', '2024-11-16 07:51:07'),
(189, 1, '67383cec1bb90', '1efa3e4c-f836-624e-93aa-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383cec1bb90', '2024-11-16 07:51:08', '2024-11-16 07:51:08'),
(190, 1, '67383cecbe49e', '1efa3e4c-fe8f-6d02-a614-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383cecbe49e', '2024-11-16 07:51:08', '2024-11-16 07:51:08'),
(191, 1, '67383ced8c120', '1efa3e4d-0623-673a-8b43-d6369503704a', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '67383ced8c120', '2024-11-16 07:51:10', '2024-11-16 07:51:10'),
(192, 1, '67383ceeed9b3', '1efa3e4d-137b-6d10-8f6b-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 0.72, 'play_fiver', 0, 1, '67383ceeed9b3', '2024-11-16 07:51:10', '2024-11-16 07:51:10'),
(193, 1, '67383d19f202a', '1efa3e4e-adbc-69a0-8dd6-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383d19f202a', '2024-11-16 07:51:24', '2024-11-16 07:51:24'),
(194, 1, '67383d1ac7fd1', '1efa3e4e-b5a1-668e-a9d8-d6369503704a', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383d1ac7fd1', '2024-11-16 07:51:25', '2024-11-16 07:51:25'),
(195, 1, '67383d1b89008', '1efa3e4e-bcb4-6ebc-a0fb-d6369503704a', '126', '126', 'win', 'balance_bonus', 2.00, 'play_fiver', 0, 1, '67383d1b89008', '2024-11-16 07:51:25', '2024-11-16 07:51:25'),
(196, 1, '67383d2c620e7', '1efa3e4f-5d4f-6b9c-a2e3-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383d2c620e7', '2024-11-16 07:51:30', '2024-11-16 07:51:30'),
(197, 1, '67383d2d1cad6', '1efa3e4f-6423-645a-b71f-1a75ef2a678c', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383d2d1cad6', '2024-11-16 07:51:31', '2024-11-16 07:51:31'),
(198, 1, '67383d2dd84c6', '1efa3e4f-6b77-65f8-a53b-d6369503704a', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67383d2dd84c6', '2024-11-16 07:51:31', '2024-11-16 07:51:31'),
(199, 1, '67383d31a6ae7', '1efa3e4f-8fac-6c70-ada3-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 50.00, 'play_fiver', 0, 1, '67383d31a6ae7', '2024-11-16 07:51:32', '2024-11-16 07:51:32'),
(200, 1, '67383d7f14ed0', '1efa3e52-71d9-6038-9af8-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 50.00, 'play_fiver', 0, 1, '67383d7f14ed0', '2024-11-16 07:51:41', '2024-11-16 07:51:41'),
(201, 1, '67383d95a3a92', '1efa3e53-493b-6350-a528-d6369503704a', '126', '126', 'win', 'balance_bonus', 18.00, 'play_fiver', 0, 1, '67383d95a3a92', '2024-11-16 07:51:47', '2024-11-16 07:51:47'),
(202, 1, '67383d9709b80', '1efa3e53-564a-6b4a-bb46-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 9.00, 'play_fiver', 0, 1, '67383d9709b80', '2024-11-16 07:51:47', '2024-11-16 07:51:47'),
(203, 1, '67383dafb4fc3', '1efa3e54-41dd-610c-a601-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 9.00, 'play_fiver', 0, 1, '67383dafb4fc3', '2024-11-16 07:51:53', '2024-11-16 07:51:53'),
(204, 1, '67383db1161e5', '1efa3e54-4ebb-6356-8503-faf7dc68505c', '126', '126', 'win', 'balance_bonus', 39.00, 'play_fiver', 0, 1, '67383db1161e5', '2024-11-16 07:51:53', '2024-11-16 07:51:53'),
(205, 1, '67383db285242', '1efa3e54-5c9a-6b48-aa24-1a75ef2a678c', '126', '126', 'win', 'balance_bonus', 15.00, 'play_fiver', 0, 1, '67383db285242', '2024-11-16 07:51:54', '2024-11-16 07:51:54'),
(206, 1, '67383db4aedc2', '1efa3e54-714e-6c9c-b744-1a75ef2a678c', '126', '126', 'win', 'balance_bonus', 60.00, 'play_fiver', 0, 1, '67383db4aedc2', '2024-11-16 07:51:55', '2024-11-16 07:51:55'),
(207, 1, '67383db63a948', '1efa3e54-7fd6-6b2a-909e-1a75ef2a678c', '126', '126', 'bet', 'balance_bonus', 15.00, 'play_fiver', 0, 1, '67383db63a948', '2024-11-16 07:51:55', '2024-11-16 07:51:55'),
(208, 1, '67383db6e3935', '1efa3e54-8670-6b3e-bb36-faf7dc68505c', '126', '126', 'bet', 'balance_bonus', 15.00, 'play_fiver', 0, 1, '67383db6e3935', '2024-11-16 07:51:56', '2024-11-16 07:51:56'),
(209, 1, '67383db7a8b97', '1efa3e54-8dad-6906-b20a-d6369503704a', '126', '126', 'bet', 'balance_bonus', 15.00, 'play_fiver', 0, 1, '67383db7a8b97', '2024-11-16 07:51:56', '2024-11-16 07:51:56'),
(210, 1, '67383db87b6e8', '1efa3e54-9572-622c-b931-d6369503704a', '126', '126', 'bet', 'balance_bonus', 15.00, 'play_fiver', 0, 1, '67383db87b6e8', '2024-11-16 07:51:57', '2024-11-16 07:51:57'),
(211, 1, '67383db954db8', '1efa3e54-9d79-6b78-a43b-d6369503704a', '126', '126', 'win', 'balance_bonus', 9.00, 'play_fiver', 0, 1, '67383db954db8', '2024-11-16 07:51:57', '2024-11-16 07:51:57'),
(212, 1, '67383eddec8ef', '1efa3e5f-8421-6850-ab97-d6369503704a', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383eddec8ef', '2024-11-16 07:52:28', '2024-11-16 07:52:28'),
(213, 1, '67383edeea162', '1efa3e5f-8d92-62b8-b890-1a75ef2a678c', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383edeea162', '2024-11-16 07:52:29', '2024-11-16 07:52:29'),
(214, 1, '67383edfe33b5', '1efa3e5f-96d6-6edc-b039-1a75ef2a678c', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '67383edfe33b5', '2024-11-16 07:52:29', '2024-11-16 07:52:29'),
(215, 1, '673900192f43d', '1efa4592-5059-64de-87ad-b2be3a3df99b', '1738001', '1738001', 'bet', 'balance_bonus', 0.75, 'play_fiver', 0, 1, '673900192f43d', '2024-11-16 21:27:07', '2024-11-16 21:27:07'),
(216, 1, '673900219faf5', '1efa4592-a108-63e4-bc43-b2be3a3df99b', '1738001', '1738001', 'bet', 'balance_bonus', 0.75, 'play_fiver', 0, 1, '673900219faf5', '2024-11-16 21:27:14', '2024-11-16 21:27:14'),
(217, 1, '6739009a7cbe7', '1efa4597-219c-6dc6-a462-86157252eb59', '1738001', '1738001', 'bet', 'balance_bonus', 0.75, 'play_fiver', 0, 1, '6739009a7cbe7', '2024-11-16 21:29:15', '2024-11-16 21:29:15'),
(218, 1, '673900ad2cb77', '1efa4597-d3af-6720-adae-86157252eb59', '1738001', '1738001', 'bet', 'balance_bonus', 3.00, 'play_fiver', 0, 1, '673900ad2cb77', '2024-11-16 21:29:33', '2024-11-16 21:29:33'),
(219, 1, '673902a919077', '1efa45aa-bf94-6f0c-8446-b2be3a3df99b', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673902a919077', '2024-11-16 21:38:01', '2024-11-16 21:38:01'),
(220, 1, '673902a9c5e54', '1efa45aa-c655-6f8a-8838-86157252eb59', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '673902a9c5e54', '2024-11-16 21:38:02', '2024-11-16 21:38:02'),
(221, 1, '67392889b29df', '1efa4713-f9d8-6118-a4db-3225faafb9e3', '126', '126', 'win', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '67392889b29df', '2024-11-17 00:19:39', '2024-11-17 00:19:39'),
(222, 1, '6739288d74ecc', '1efa4714-1d94-673c-b23e-86157252eb59', '126', '126', 'bet', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '6739288d74ecc', '2024-11-17 00:19:43', '2024-11-17 00:19:43'),
(223, 1, '673a67acd329a', '1efa52f7-817e-6c4a-aa63-2227be814509', '126', '126', 'win', 'balance_bonus', 24.00, 'play_fiver', 0, 1, '673a67acd329a', '2024-11-17 23:01:17', '2024-11-17 23:01:17'),
(224, 1, '673b953c257d6', '1efa5e33-6748-679e-98cc-b2be3a3df99b', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '673b953c257d6', '2024-11-18 20:27:57', '2024-11-18 20:27:57'),
(225, 1, '673b953f2404a', '1efa5e33-83d5-6eb6-8bb2-267f206dc917', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '673b953f2404a', '2024-11-18 20:28:01', '2024-11-18 20:28:01'),
(226, 1, '673b95421309a', '1efa5e33-9fc8-64e8-abb7-267f206dc917', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '673b95421309a', '2024-11-18 20:28:05', '2024-11-18 20:28:05'),
(227, 1, '673b9545855f2', '1efa5e33-c0dc-6832-b39b-ea06250ec7b9', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '673b9545855f2', '2024-11-18 20:28:07', '2024-11-18 20:28:07'),
(228, 1, '673b954871687', '1efa5e33-dcb0-64e6-a082-ea06250ec7b9', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '673b954871687', '2024-11-18 20:28:09', '2024-11-18 20:28:09'),
(229, 1, '673bc0b3b7e1d', '1efa5fd1-f058-626a-b8e6-ea1da4f35daa', '126', '126', 'win', 'balance_bonus', 20.00, 'play_fiver', 0, 1, '673bc0b3b7e1d', '2024-11-18 23:33:26', '2024-11-18 23:33:26'),
(230, 1, '673bc0e841580', '1efa5fd3-e529-63ba-b968-2ad1cea5902f', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '673bc0e841580', '2024-11-18 23:34:18', '2024-11-18 23:34:18'),
(231, 1, '673bc3ec9988e', '1efa5ff0-aaf8-648a-a277-ea1da4f35daa', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '673bc3ec9988e', '2024-11-18 23:47:11', '2024-11-18 23:47:11'),
(232, 1, '673bc52f741b4', '1efa5ffc-b1e0-61c4-a3f5-12f9a70be285', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673bc52f741b4', '2024-11-18 23:52:33', '2024-11-18 23:52:33'),
(233, 1, '673bc5e58c369', '1efa6003-7a81-6348-9bef-12f9a70be285', '1738001', '1738001', 'bet', 'balance_bonus', 3.00, 'play_fiver', 0, 1, '673bc5e58c369', '2024-11-18 23:55:35', '2024-11-18 23:55:35'),
(234, 1, '673bd8a934cfe', '1efa60b6-6d9a-6fcc-98f1-7272afddf287', '1543462', '1543462', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '673bd8a934cfe', '2024-11-19 01:15:40', '2024-11-19 01:15:40'),
(235, 1, '673bd8a9ecf27', '1efa60b6-74cc-643a-9276-2ad1cea5902f', '1543462', '1543462', 'win', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '673bd8a9ecf27', '2024-11-19 01:15:40', '2024-11-19 01:15:40'),
(236, 1, '673bd8ac6c4b5', '1efa60b6-8c61-6ff0-b365-7272afddf287', '1543462', '1543462', 'win', 'balance_bonus', 0.30, 'play_fiver', 0, 1, '673bd8ac6c4b5', '2024-11-19 01:15:42', '2024-11-19 01:15:42'),
(237, 1, '673bd8aeba45e', '1efa60b6-a280-667e-ac6c-7272afddf287', '1543462', '1543462', 'win', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '673bd8aeba45e', '2024-11-19 01:15:46', '2024-11-19 01:15:46'),
(238, 1, '673bd8b120a2e', '1efa60b6-b91c-65d6-8681-2ad1cea5902f', '1543462', '1543462', 'win', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '673bd8b120a2e', '2024-11-19 01:15:47', '2024-11-19 01:15:47'),
(239, 1, '673bf8c85b4e0', '1efa61e8-c3d0-6bac-8b58-7272afddf287', 'wild-ape-3258', 'wild-ape-3258', 'win', 'balance_bonus', 0.02, 'play_fiver', 0, 1, '673bf8c85b4e0', '2024-11-19 03:33:28', '2024-11-19 03:33:28'),
(240, 1, '673d02942e780', '1efa6bcf-9825-6e58-8219-166b57e6c204', '1695365', '1695365', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '673d02942e780', '2024-11-19 22:26:46', '2024-11-19 22:26:46'),
(241, 1, '673d0295ddf4f', '1efa6bcf-a88a-6280-be93-6e8e4ee2fe77', '1695365', '1695365', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673d0295ddf4f', '2024-11-19 22:26:47', '2024-11-19 22:26:47'),
(242, 1, '673d11469e2ae', '1efa6c5b-c1bd-6568-8d22-d23eed38fac8', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673d11469e2ae', '2024-11-19 23:29:53', '2024-11-19 23:29:53'),
(243, 1, '673d114738af6', '1efa6c5b-c74f-6df0-aaa1-9e9749e03474', '1695365', '1695365', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673d114738af6', '2024-11-19 23:29:53', '2024-11-19 23:29:53'),
(244, 1, '673d1148cedae', '1efa6c5b-d6b6-6e88-bdb7-6e8e4ee2fe77', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673d1148cedae', '2024-11-19 23:29:55', '2024-11-19 23:29:55'),
(245, 1, '673d11496c1ee', '1efa6c5b-dc64-6d6c-949c-9e9749e03474', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673d11496c1ee', '2024-11-19 23:29:56', '2024-11-19 23:29:56'),
(246, 1, '673d114a1afed', '1efa6c5b-e2c3-60aa-a587-6e8e4ee2fe77', '1695365', '1695365', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '673d114a1afed', '2024-11-19 23:29:57', '2024-11-19 23:29:57'),
(247, 1, NULL, '1efa740b-06f7-64e2-b4a5-be645ed62535', 'aviator', 'aviator', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-20 14:09:38', '2024-11-20 14:09:38'),
(248, 1, NULL, '1efa740b-46f6-6750-b428-96e597c9836d', 'aviator', 'aviator', 'win', 'balance', 1.09, 'play_fiver', 0, 1, NULL, '2024-11-20 14:09:42', '2024-11-20 14:09:42'),
(249, 1, '1efa740c-08fa-67e8-8fda-be645ed62535', '1efa740c-0907-6bf0-a392-be645ed62535', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efa740c-08fa-67e8-8fda-be645ed62535', '2024-11-20 14:10:04', '2024-11-20 14:10:04'),
(250, 1, '673e1e606ee8d', '1efa7662-1a21-64c4-9fc3-ca4301ba2d79', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '673e1e606ee8d', '2024-11-20 18:37:38', '2024-11-20 18:37:38'),
(251, 1, '673e1e686a607', '1efa7662-663f-600e-ab18-ca4301ba2d79', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '673e1e686a607', '2024-11-20 18:37:45', '2024-11-20 18:37:45'),
(252, 1, '673e1e88e03b5', '1efa7663-9c06-6c0e-b8e1-36e3d114d752', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '673e1e88e03b5', '2024-11-20 18:38:17', '2024-11-20 18:38:17'),
(253, 1, '673e290474781', '1efa76c7-946f-64b4-92c6-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e290474781', '2024-11-20 19:23:01', '2024-11-20 19:23:01'),
(254, 1, '673e2a7181e27', '1efa76d5-2dde-6e9e-9ac5-da3dd43b9a0e', '126', '126', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, '673e2a7181e27', '2024-11-20 19:29:06', '2024-11-20 19:29:06'),
(255, 1, '673e2a794daf4', '1efa76d5-7820-62dc-bfa1-8ee454f76d0f', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e2a794daf4', '2024-11-20 19:29:14', '2024-11-20 19:29:14'),
(256, 1, '673e2c8258604', '1efa76e8-e12f-686e-aed1-e2c21559404b', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e2c8258604', '2024-11-20 19:37:57', '2024-11-20 19:37:57'),
(257, 1, '673e445809da2', '1efa77cc-2f53-64da-8f2a-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e445809da2', '2024-11-20 21:19:39', '2024-11-20 21:19:39'),
(258, 1, '673e445f26fbd', '1efa77cc-7338-66be-94a8-86ae9d6bd303', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e445f26fbd', '2024-11-20 21:19:46', '2024-11-20 21:19:46'),
(259, 1, '673e44677506e', '1efa77cc-c290-6284-893c-e2c21559404b', '126', '126', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '673e44677506e', '2024-11-20 21:19:53', '2024-11-20 21:19:53');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(260, 1, '673e6b8348136', '1efa7941-baad-6f6e-b89d-3e125c4e8f7c', '126', '126', 'bet', 'balance_bonus', 2.00, 'play_fiver', 0, 1, '673e6b8348136', '2024-11-21 00:06:46', '2024-11-21 00:06:46'),
(261, 1, '673e6b86e4608', '1efa7941-dd65-6318-a496-baa167130a4d', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '673e6b86e4608', '2024-11-21 00:06:49', '2024-11-21 00:06:49'),
(262, 1, '673e6b89e57bf', '1efa7941-fa0c-6a5c-bfa8-82d488226860', '126', '126', 'win', 'balance_withdrawal', 3.20, 'play_fiver', 0, 1, '673e6b89e57bf', '2024-11-21 00:06:51', '2024-11-21 00:06:51'),
(263, 1, '673e6b8d61261', '1efa7942-1b06-6c8a-9b45-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '673e6b8d61261', '2024-11-21 00:06:55', '2024-11-21 00:06:55'),
(264, 1, '673e6b90e688e', '1efa7942-3cd8-6cc8-8bb2-baa167130a4d', '126', '126', 'win', 'balance_withdrawal', 3.20, 'play_fiver', 0, 1, '673e6b90e688e', '2024-11-21 00:06:58', '2024-11-21 00:06:58'),
(265, 1, '673e6b9905cf5', '1efa7942-89e6-65c4-91dd-baa167130a4d', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '673e6b9905cf5', '2024-11-21 00:07:08', '2024-11-21 00:07:08'),
(266, 1, '673e6b9cd0827', '1efa7942-ae6d-682a-9c05-82d488226860', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '673e6b9cd0827', '2024-11-21 00:07:11', '2024-11-21 00:07:11'),
(267, 1, '673e6b9fd491a', '1efa7942-cb32-656e-ac4e-82d488226860', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '673e6b9fd491a', '2024-11-21 00:07:14', '2024-11-21 00:07:14'),
(268, 1, '673e6ba2c9c54', '1efa7942-e762-6acc-b296-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6ba2c9c54', '2024-11-21 00:07:16', '2024-11-21 00:07:16'),
(269, 1, '673e6be323f01', '1efa7945-4ccb-68f8-9139-82d488226860', '126', '126', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '673e6be323f01', '2024-11-21 00:08:20', '2024-11-21 00:08:20'),
(270, 1, '673e6be9d4ccf', '1efa7945-8cec-6914-bb95-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 120.00, 'play_fiver', 0, 1, '673e6be9d4ccf', '2024-11-21 00:08:28', '2024-11-21 00:08:28'),
(271, 1, '673e6bf43ef36', '1efa7945-eff9-6a2a-9084-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6bf43ef36', '2024-11-21 00:08:38', '2024-11-21 00:08:38'),
(272, 1, '673e6bf6e7551', '1efa7946-09a0-665e-a8c4-baa167130a4d', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6bf6e7551', '2024-11-21 00:08:42', '2024-11-21 00:08:42'),
(273, 1, '673e6bf992987', '1efa7946-22ed-6062-9b33-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 40.00, 'play_fiver', 0, 1, '673e6bf992987', '2024-11-21 00:08:48', '2024-11-21 00:08:48'),
(274, 1, '673e6c00553ba', '1efa7946-6349-6b88-a939-82d488226860', '126', '126', 'win', 'balance_withdrawal', 1000.00, 'play_fiver', 0, 1, '673e6c00553ba', '2024-11-21 00:08:56', '2024-11-21 00:08:56'),
(275, 1, '673e6c0b2b1c3', '1efa7946-ca8b-6990-8502-baa167130a4d', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6c0b2b1c3', '2024-11-21 00:09:01', '2024-11-21 00:09:01'),
(276, 1, '673e6c0e8edec', '1efa7946-eb0d-672c-82a9-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 6.40, 'play_fiver', 0, 1, '673e6c0e8edec', '2024-11-21 00:09:04', '2024-11-21 00:09:04'),
(277, 1, '673e6c2d7a26d', '1efa7948-11e1-6c44-8606-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 320.00, 'play_fiver', 0, 1, '673e6c2d7a26d', '2024-11-21 00:09:34', '2024-11-21 00:09:34'),
(278, 1, '673e6c3807366', '1efa7948-764b-6d42-92de-82d488226860', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6c3807366', '2024-11-21 00:09:46', '2024-11-21 00:09:46'),
(279, 1, '673e6c3aae2e9', '1efa7948-8fe4-6952-9d3a-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6c3aae2e9', '2024-11-21 00:09:47', '2024-11-21 00:09:47'),
(280, 1, '673e6c3d59053', '1efa7948-a92d-610c-b461-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6c3d59053', '2024-11-21 00:09:51', '2024-11-21 00:09:51'),
(281, 1, '673e6c401b321', '1efa7948-c35e-6f1c-98a8-82d488226860', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6c401b321', '2024-11-21 00:09:54', '2024-11-21 00:09:54'),
(282, 1, '673e6c42e5c3f', '1efa7948-de5c-62b0-ad25-e294f472777d', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e6c42e5c3f', '2024-11-21 00:09:56', '2024-11-21 00:09:56'),
(283, 1, '673e7aafad3e6', '1efa79d2-6f57-6c40-b414-3e125c4e8f7c', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e7aafad3e6', '2024-11-21 01:11:30', '2024-11-21 01:11:30'),
(284, 1, '673e93c055cc7', '1efa7ac1-7934-6f0c-866c-3aab79a5171a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e93c055cc7', '2024-11-21 02:58:26', '2024-11-21 02:58:26'),
(285, 1, '673e93c360de9', '1efa7ac1-9640-61e6-8ab6-4a8eec00b1ee', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e93c360de9', '2024-11-21 02:58:28', '2024-11-21 02:58:28'),
(286, 1, '673e93d14f35d', '1efa7ac2-1b13-64ea-a180-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '673e93d14f35d', '2024-11-21 02:58:42', '2024-11-21 02:58:42'),
(287, 1, '67414b037c734', '1efa94a8-0305-6a7e-866a-b65b16122d0e', '1695365', '1695365', 'win', 'balance_bonus', 2.24, 'play_fiver', 0, 1, '67414b037c734', '2024-11-23 04:24:52', '2024-11-23 04:24:52'),
(288, 1, '67414b4e1d844', '1efa94aa-ca92-6090-b216-e2c21559404b', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '67414b4e1d844', '2024-11-23 04:26:07', '2024-11-23 04:26:07'),
(289, 1, '67414b50946f7', '1efa94aa-e249-6dd2-8c8b-3e125c4e8f7c', '1695365', '1695365', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '67414b50946f7', '2024-11-23 04:26:10', '2024-11-23 04:26:10'),
(290, 1, '67414b53b2746', '1efa94ab-0012-67d8-8798-3e125c4e8f7c', '1695365', '1695365', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '67414b53b2746', '2024-11-23 04:26:12', '2024-11-23 04:26:12'),
(291, 1, '67414b55661b6', '1efa94ab-1029-6996-a81a-3e125c4e8f7c', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b55661b6', '2024-11-23 04:26:14', '2024-11-23 04:26:14'),
(292, 1, '67414b563c46f', '1efa94ab-1810-6dc6-ba42-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '67414b563c46f', '2024-11-23 04:26:15', '2024-11-23 04:26:15'),
(293, 1, '67414b5813868', '1efa94ab-298b-6fe2-989e-b65b16122d0e', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '67414b5813868', '2024-11-23 04:26:17', '2024-11-23 04:26:17'),
(294, 1, '67414b59b0be6', '1efa94ab-3939-6b10-a1e0-3e125c4e8f7c', '1695365', '1695365', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '67414b59b0be6', '2024-11-23 04:26:19', '2024-11-23 04:26:19'),
(295, 1, '67414b5b6b1d8', '1efa94ab-4994-6212-9e78-e2c21559404b', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b5b6b1d8', '2024-11-23 04:26:21', '2024-11-23 04:26:21'),
(296, 1, '67414b5c1e552', '1efa94ab-501d-6b42-8425-3e125c4e8f7c', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '67414b5c1e552', '2024-11-23 04:26:21', '2024-11-23 04:26:21'),
(297, 1, '67414b5dd3b95', '1efa94ab-60bd-60d8-9b77-3e125c4e8f7c', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '67414b5dd3b95', '2024-11-23 04:26:23', '2024-11-23 04:26:23'),
(298, 1, '67414b5f8cca1', '1efa94ab-710a-6918-b1e2-b65b16122d0e', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b5f8cca1', '2024-11-23 04:26:25', '2024-11-23 04:26:25'),
(299, 1, '67414b60656e0', '1efa94ab-790a-6bcc-ac84-e2c21559404b', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b60656e0', '2024-11-23 04:26:26', '2024-11-23 04:26:26'),
(300, 1, '67414b61191bd', '1efa94ab-7f98-6908-8010-b65b16122d0e', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '67414b61191bd', '2024-11-23 04:26:26', '2024-11-23 04:26:26'),
(301, 1, '67414b63274bb', '1efa94ab-9339-63c2-a518-b65b16122d0e', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b63274bb', '2024-11-23 04:26:27', '2024-11-23 04:26:27'),
(302, 1, '67414b63cc342', '1efa94ab-99aa-6378-9527-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '67414b63cc342', '2024-11-23 04:26:30', '2024-11-23 04:26:30'),
(303, 1, '67414b65a2f20', '1efa94ab-ab20-66d4-a4e7-b65b16122d0e', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b65a2f20', '2024-11-23 04:26:31', '2024-11-23 04:26:31'),
(304, 1, '67414b6657c06', '1efa94ab-b1ba-6094-923d-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '67414b6657c06', '2024-11-23 04:26:32', '2024-11-23 04:26:32'),
(305, 1, '67414b6846087', '1efa94ab-c41b-6b7a-908f-e2c21559404b', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b6846087', '2024-11-23 04:26:34', '2024-11-23 04:26:34'),
(306, 1, '67414b698105e', '1efa94ab-cff2-6c50-b25c-b65b16122d0e', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b698105e', '2024-11-23 04:26:35', '2024-11-23 04:26:35'),
(307, 1, '67414b6bcf669', '1efa94ab-e615-67e4-b751-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '67414b6bcf669', '2024-11-23 04:26:37', '2024-11-23 04:26:37'),
(308, 1, '67414b6f16658', '1efa94ac-0501-60d6-96e8-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '67414b6f16658', '2024-11-23 04:26:41', '2024-11-23 04:26:41'),
(309, 1, '67414b720afe9', '1efa94ac-212b-6662-a7a1-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '67414b720afe9', '2024-11-23 04:26:43', '2024-11-23 04:26:43'),
(310, 1, '67414b7437402', '1efa94ac-35f8-6ab8-b9c5-7e3308d341c1', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '67414b7437402', '2024-11-23 04:26:47', '2024-11-23 04:26:47'),
(311, 1, '67414b774f592', '1efa94ac-5385-6fe0-a09f-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '67414b774f592', '2024-11-23 04:26:49', '2024-11-23 04:26:49'),
(312, 1, '67414b792587a', '1efa94ac-64f7-6076-84b3-3e125c4e8f7c', '1695365', '1695365', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b792587a', '2024-11-23 04:26:50', '2024-11-23 04:26:50'),
(313, 1, '67414b7aee8e2', '1efa94ac-765a-6836-9212-7e3308d341c1', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '67414b7aee8e2', '2024-11-23 04:26:52', '2024-11-23 04:26:52'),
(314, 1, '67414b7dc6e9f', '1efa94ac-916a-60fe-a784-7e3308d341c1', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '67414b7dc6e9f', '2024-11-23 04:26:54', '2024-11-23 04:26:54'),
(315, 1, '67414b7cb9d89', '1efa94ac-875e-60a6-8d43-3e125c4e8f7c', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b7cb9d89', '2024-11-23 04:26:54', '2024-11-23 04:26:54'),
(316, 1, '67414b8106894', '1efa94ac-b00c-602a-a1d5-e2c21559404b', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67414b8106894', '2024-11-23 04:26:58', '2024-11-23 04:26:58'),
(317, 1, '67414b8248a17', '1efa94ac-bc2a-60dc-a946-e2c21559404b', '1695365', '1695365', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '67414b8248a17', '2024-11-23 04:27:00', '2024-11-23 04:27:00'),
(318, 1, NULL, '1efa94ad-a60a-6a94-a0da-3e125c4e8f7c', 'aviator', 'aviator', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-23 04:27:24', '2024-11-23 04:27:24'),
(319, 1, NULL, '1efa94ad-bcb6-62b6-83aa-3e125c4e8f7c', 'aviator', 'aviator', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-23 04:27:26', '2024-11-23 04:27:26'),
(320, 1, NULL, '1efa94ad-ebad-6ae2-98c4-b65b16122d0e', 'aviator', 'aviator', 'win', 'balance', 1.11, 'play_fiver', 0, 1, NULL, '2024-11-23 04:27:33', '2024-11-23 04:27:33'),
(321, 1, NULL, '1efa94ad-f8bc-63a0-85ac-e2c21559404b', 'aviator', 'aviator', 'win', 'balance', 1.25, 'play_fiver', 0, 1, NULL, '2024-11-23 04:27:34', '2024-11-23 04:27:34'),
(322, 1, NULL, '1efa94af-ff1e-6aca-b38d-b65b16122d0e', 'aviator', 'aviator', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-23 04:28:27', '2024-11-23 04:28:27'),
(323, 1, NULL, '1efa94af-ff73-6174-985b-3e125c4e8f7c', 'aviator', 'aviator', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, NULL, '2024-11-23 04:28:28', '2024-11-23 04:28:28'),
(324, 1, '6741f1716eeba', '1efa9adb-350f-6126-9823-3e125c4e8f7c', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6741f1716eeba', '2024-11-23 16:14:58', '2024-11-23 16:14:58'),
(325, 1, '6741f17522c05', '1efa9adb-5832-6766-9cfd-3e125c4e8f7c', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6741f17522c05', '2024-11-23 16:15:02', '2024-11-23 16:15:02'),
(326, 1, '67449e513e627', '1efab45e-ad2f-6452-bd7c-3e125c4e8f7c', '126', '126', 'bet', 'balance_withdrawal', 50.00, 'play_fiver', 0, 1, '67449e513e627', '2024-11-25 16:57:07', '2024-11-25 16:57:07'),
(327, 1, '6747539ae82f4', '1eface32-6294-6a44-8960-3e125c4e8f7c', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6747539ae82f4', '2024-11-27 18:15:09', '2024-11-27 18:15:09'),
(328, 1, '674753a1ef70d', '1eface32-a59f-67ee-8b2b-e2c21559404b', 'wild-ape-3258', 'wild-ape-3258', 'win', 'balance_withdrawal', 0.08, 'play_fiver', 0, 1, '674753a1ef70d', '2024-11-27 18:15:15', '2024-11-27 18:15:15'),
(329, 1, '674753ae32d8f', '1eface33-1a3a-6fc2-b30e-4a1c94f360c9', 'wild-ape-3258', 'wild-ape-3258', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '674753ae32d8f', '2024-11-27 18:15:28', '2024-11-27 18:15:28'),
(330, 1, '6747ac5d1f7b0', '1efad180-da28-6050-ad9c-e2c21559404b', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6747ac5d1f7b0', '2024-11-28 00:33:50', '2024-11-28 00:33:50'),
(331, 1, '6747ae02118c4', '1efad190-8896-60b0-90f3-f22ed0bdb7d9', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6747ae02118c4', '2024-11-28 00:40:52', '2024-11-28 00:40:52'),
(332, 1, '6747b42c741ee', '1efad1cb-5569-6f26-8e42-3ece342319b2', 'wild-ape-3258', 'wild-ape-3258', 'win', 'balance_withdrawal', 0.04, 'play_fiver', 0, 1, '6747b42c741ee', '2024-11-28 01:07:11', '2024-11-28 01:07:11'),
(333, 1, '6747b4d28c7c1', '1efad1d1-8576-66fa-95c9-e2c21559404b', 'wild-ape-3258', 'wild-ape-3258', 'win', 'balance_withdrawal', 0.06, 'play_fiver', 0, 1, '6747b4d28c7c1', '2024-11-28 01:09:55', '2024-11-28 01:09:55'),
(334, 1, '6747b97b9cb14', '1efad1fd-f76d-684a-8b2c-e2c21559404b', 'wild-ape-3258', 'wild-ape-3258', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6747b97b9cb14', '2024-11-28 01:29:49', '2024-11-28 01:29:49'),
(335, 1, '6747d91de37b7', '1efad32b-a6b0-6b62-a9c8-66de7f440ef1', '126', '126', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, '6747d91de37b7', '2024-11-28 03:44:46', '2024-11-28 03:44:46'),
(336, 1, '6747d923ca819', '1efad32b-deef-64ce-a1ec-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 120.00, 'play_fiver', 0, 1, '6747d923ca819', '2024-11-28 03:44:52', '2024-11-28 03:44:52'),
(337, 1, '6747d983ab371', '1efad32f-713d-68be-bab6-66de7f440ef1', '126', '126', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '6747d983ab371', '2024-11-28 03:46:28', '2024-11-28 03:46:28'),
(338, 1, '6747f52054b0b', '1efad436-c518-6f62-b94b-ee079c685091', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6747f52054b0b', '2024-11-28 05:44:17', '2024-11-28 05:44:17'),
(339, 1, '6747f52168351', '1efad436-cf66-696a-be11-ee079c685091', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6747f52168351', '2024-11-28 05:44:17', '2024-11-28 05:44:17'),
(340, 1, '6747f52279802', '1efad436-d99c-6196-8490-ee079c685091', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6747f52279802', '2024-11-28 05:44:21', '2024-11-28 05:44:21'),
(341, 1, '6747f52388a56', '1efad436-e3bc-6aea-9995-7e4aa836cac2', '126', '126', 'win', 'balance_withdrawal', 1.28, 'play_fiver', 0, 1, '6747f52388a56', '2024-11-28 05:44:21', '2024-11-28 05:44:21'),
(342, 1, '6748ae1d231c4', '1efadb1a-f2b5-6372-a3f4-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae1d231c4', '2024-11-28 18:53:34', '2024-11-28 18:53:34'),
(343, 1, '6748ae1e536cf', '1efadb1a-fe21-686e-840a-d2a756686bc5', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '6748ae1e536cf', '2024-11-28 18:53:35', '2024-11-28 18:53:35'),
(344, 1, '6748ae202b387', '1efadb1b-0fa2-635e-bdb5-3e125c4e8f7c', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae202b387', '2024-11-28 18:53:37', '2024-11-28 18:53:37'),
(345, 1, '6748ae28d6235', '1efadb1b-629b-6182-b532-e2c21559404b', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae28d6235', '2024-11-28 18:53:45', '2024-11-28 18:53:45'),
(346, 1, '6748ae2aa58ce', '1efadb1b-73c7-68de-9485-be2365b08c93', '126', '126', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '6748ae2aa58ce', '2024-11-28 18:53:48', '2024-11-28 18:53:48'),
(347, 1, '6748ae2e36a2e', '1efadb1b-9598-60b2-b5b4-4e88e0ef7f09', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '6748ae2e36a2e', '2024-11-28 18:53:51', '2024-11-28 18:53:51'),
(348, 1, '6748ae3008829', '1efadb1b-a6dd-6ade-aeb8-3e125c4e8f7c', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '6748ae3008829', '2024-11-28 18:53:54', '2024-11-28 18:53:54'),
(349, 1, '6748ae31a4f53', '1efadb1b-b683-6c2c-93c5-0e6645be8284', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae31a4f53', '2024-11-28 18:53:55', '2024-11-28 18:53:55'),
(350, 1, '6748ae39ddfd9', '1efadb1c-0509-62de-89eb-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae39ddfd9', '2024-11-28 18:54:02', '2024-11-28 18:54:02'),
(351, 1, '6748ae3a9f320', '1efadb1c-0c1e-6876-8e91-4e88e0ef7f09', '126', '126', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '6748ae3a9f320', '2024-11-28 18:54:03', '2024-11-28 18:54:03'),
(352, 1, '6748ae4008c12', '1efadb1c-3f76-6976-b14f-0e6645be8284', '126', '126', 'win', 'balance_withdrawal', 40.00, 'play_fiver', 0, 1, '6748ae4008c12', '2024-11-28 18:54:10', '2024-11-28 18:54:10'),
(353, 1, '6748ae4a2dae2', '1efadb1c-a045-6ec8-9b6e-4e88e0ef7f09', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae4a2dae2', '2024-11-28 18:54:19', '2024-11-28 18:54:19'),
(354, 1, '6748ae4aed2ef', '1efadb1c-a7c0-6e3c-b7d0-be2365b08c93', '126', '126', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6748ae4aed2ef', '2024-11-28 18:54:19', '2024-11-28 18:54:19'),
(355, 1, '6748ae51412ac', '1efadb1c-e3ca-67a2-808c-d2a756686bc5', '126', '126', 'win', 'balance_withdrawal', 40.00, 'play_fiver', 0, 1, '6748ae51412ac', '2024-11-28 18:54:31', '2024-11-28 18:54:31'),
(356, 1, '6748ae5b97e34', '1efadb1d-468b-6d00-afbc-e2c21559404b', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae5b97e34', '2024-11-28 18:54:38', '2024-11-28 18:54:38'),
(357, 1, '6748ae63abb4c', '1efadb1d-939d-674c-824c-4e88e0ef7f09', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6748ae63abb4c', '2024-11-28 18:54:46', '2024-11-28 18:54:46'),
(358, 1, '6748ed8526b8c', '1efadd77-a343-674e-b21c-e2c21559404b', '68', '68', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6748ed8526b8c', '2024-11-28 23:24:06', '2024-11-28 23:24:06'),
(359, 1, '6748faf2d2f53', '1efaddf7-b3d3-6c3c-82f4-a694cc3bef6d', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '6748faf2d2f53', '2024-11-29 00:21:23', '2024-11-29 00:21:23'),
(360, 1, '6748faf470781', '1efaddf7-c30d-6c8e-8b64-3e125c4e8f7c', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '6748faf470781', '2024-11-29 00:21:26', '2024-11-29 00:21:26'),
(361, 1, '6748faf644606', '1efaddf7-d467-6b6a-9de0-3e915b0bbbdf', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 1.40, 'play_fiver', 0, 1, '6748faf644606', '2024-11-29 00:21:27', '2024-11-29 00:21:27'),
(362, 1, '6748faf90308e', '1efaddf7-ee76-6a60-817f-a694cc3bef6d', 'vs20olympgate', 'vs20olympgate', 'win', 'balance', 1.05, 'play_fiver', 0, 1, '6748faf90308e', '2024-11-29 00:21:32', '2024-11-29 00:21:32'),
(363, 1, '6748fafcabc91', '1efaddf8-11a9-6d0c-9651-e2c21559404b', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 1.40, 'play_fiver', 0, 1, '6748fafcabc91', '2024-11-29 00:21:34', '2024-11-29 00:21:34'),
(364, 1, '6748fb0575bfa', '1efaddf8-6563-6e2a-84f0-3e915b0bbbdf', 'vs20olympgate', 'vs20olympgate', 'win', 'balance', 9.17, 'play_fiver', 0, 1, '6748fb0575bfa', '2024-11-29 00:21:43', '2024-11-29 00:21:43'),
(365, 1, '6748fb08c0163', '1efaddf8-84e6-6b08-8b2d-a694cc3bef6d', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_bonus', 1.40, 'play_fiver', 0, 1, '6748fb08c0163', '2024-11-29 00:21:47', '2024-11-29 00:21:47'),
(366, 1, '674a2b24ecb8e', '1efae94c-bd1e-6e12-9081-e2c21559404b', '126', '126', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674a2b24ecb8e', '2024-11-29 22:03:13', '2024-11-29 22:03:13'),
(367, 1, '674a2ef8e2225', '1efae971-3eb7-61d0-af06-caefee246394', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a2ef8e2225', '2024-11-29 22:16:16', '2024-11-29 22:16:16'),
(368, 1, '674a2ef99e4da', '1efae971-459a-636c-8811-36ee87612beb', '1695365', '1695365', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674a2ef99e4da', '2024-11-29 22:16:22', '2024-11-29 22:16:22'),
(369, 1, '674a2efb5c10c', '1efae971-5616-69de-adb2-3e125c4e8f7c', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a2efb5c10c', '2024-11-29 22:16:26', '2024-11-29 22:16:26'),
(370, 1, '674a326f8dc2c', '1efae992-4682-6af6-a5f3-e2c21559404b', '126', '126', 'bet', 'balance', 20.00, 'play_fiver', 0, 1, '674a326f8dc2c', '2024-11-29 22:33:23', '2024-11-29 22:33:23'),
(371, 1, '674a327217a06', '1efae992-5e81-6936-aa6d-3e125c4e8f7c', '126', '126', 'bet', 'balance', 20.00, 'play_fiver', 0, 1, '674a327217a06', '2024-11-29 22:33:27', '2024-11-29 22:33:27'),
(372, 1, '674a32fd97886', '1efae997-911c-62ba-89af-064baadf74e1', '126', '126', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674a32fd97886', '2024-11-29 22:34:29', '2024-11-29 22:34:29'),
(373, 1, '674a335e6e713', '1efae99b-2c91-6a30-a9cf-f2348ff04445', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '674a335e6e713', '2024-11-29 22:34:48', '2024-11-29 22:34:48'),
(374, 1, '674a336d80d84', '1efae99b-bc56-6b0c-90cc-5a4745cde8e9', '126', '126', 'bet', 'balance', 2.00, 'play_fiver', 0, 1, '674a336d80d84', '2024-11-29 22:34:54', '2024-11-29 22:34:54'),
(375, 1, '674a337b9cad6', '1efae99c-42f0-6bfe-a08c-22549e551582', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a337b9cad6', '2024-11-29 22:34:56', '2024-11-29 22:34:56'),
(376, 1, '674a338a7cadf', '1efae99c-d0bd-6dd8-9606-befd1f13326a', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a338a7cadf', '2024-11-29 22:35:07', '2024-11-29 22:35:07'),
(377, 1, '674a339289254', '1efae99d-1d85-6c9c-9f3f-f2348ff04445', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '674a339289254', '2024-11-29 22:35:15', '2024-11-29 22:35:15'),
(378, 1, '674a365763ca2', '1efae9b7-85aa-661e-ba11-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a365763ca2', '2024-11-29 22:47:04', '2024-11-29 22:47:04'),
(379, 1, '674a56720cd62', '1efaeae9-b0c2-6f08-ab45-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674a56720cd62', '2024-11-30 01:08:09', '2024-11-30 01:08:09'),
(380, 1, '674a62c1cb680', '1efaeb5f-1a7c-66cc-b7d3-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.72, 'play_fiver', 0, 1, '674a62c1cb680', '2024-11-30 01:56:35', '2024-11-30 01:56:35'),
(381, 1, '674a62cc07a7c', '1efaeb5f-7bc1-6d56-930a-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a62cc07a7c', '2024-11-30 01:56:44', '2024-11-30 01:56:44'),
(382, 1, '674a62cf4c16a', '1efaeb5f-9b0a-66f4-a694-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674a62cf4c16a', '2024-11-30 01:56:48', '2024-11-30 01:56:48'),
(383, 1, '674a62d4b9a73', '1efaeb5f-cefc-6cd2-9c36-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674a62d4b9a73', '2024-11-30 01:56:53', '2024-11-30 01:56:53'),
(384, 1, '674a62d9c8828', '1efaeb5f-ff41-6208-a7e6-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a62d9c8828', '2024-11-30 01:56:58', '2024-11-30 01:56:58'),
(385, 1, '674a62e4d337a', '1efaeb60-6892-6ec8-bfd4-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674a62e4d337a', '2024-11-30 01:57:11', '2024-11-30 01:57:11'),
(386, 1, '674a62ee6b460', '1efaeb60-c3e2-608a-b9f6-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.02, 'play_fiver', 0, 1, '674a62ee6b460', '2024-11-30 01:57:19', '2024-11-30 01:57:19'),
(387, 1, '674a62f1a9686', '1efaeb60-e2eb-6490-9933-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.02, 'play_fiver', 0, 1, '674a62f1a9686', '2024-11-30 01:57:22', '2024-11-30 01:57:22'),
(388, 1, '674a62f543cf7', '1efaeb61-0518-62e8-87b9-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.16, 'play_fiver', 0, 1, '674a62f543cf7', '2024-11-30 01:57:26', '2024-11-30 01:57:26'),
(389, 1, '674a62fc5beba', '1efaeb61-48cc-693a-9624-deb0e8c4a655', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.10, 'play_fiver', 0, 1, '674a62fc5beba', '2024-11-30 01:57:33', '2024-11-30 01:57:33'),
(390, 1, '674a630a3712b', '1efaeb61-cce8-66a6-8a99-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.30, 'play_fiver', 0, 1, '674a630a3712b', '2024-11-30 01:57:47', '2024-11-30 01:57:47'),
(391, 1, '674a630d6f69b', '1efaeb61-ebb4-608a-b99f-f2b1ac7d781e', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.30, 'play_fiver', 0, 1, '674a630d6f69b', '2024-11-30 01:57:50', '2024-11-30 01:57:50'),
(392, 1, '674a631a64788', '1efaeb62-673c-6784-9944-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674a631a64788', '2024-11-30 01:58:04', '2024-11-30 01:58:04'),
(393, 1, '674a631d9ae09', '1efaeb62-85f7-6bb0-96c1-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674a631d9ae09', '2024-11-30 01:58:07', '2024-11-30 01:58:07'),
(394, 1, '674a63218b049', '1efaeb62-ab7e-6ee2-afed-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.42, 'play_fiver', 0, 1, '674a63218b049', '2024-11-30 01:58:10', '2024-11-30 01:58:10'),
(395, 1, '674a632a27b93', '1efaeb62-fd72-6a96-ad5b-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674a632a27b93', '2024-11-30 01:58:19', '2024-11-30 01:58:19'),
(396, 1, '674a632e6a836', '1efaeb63-2635-678a-8755-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.20, 'play_fiver', 0, 1, '674a632e6a836', '2024-11-30 01:58:24', '2024-11-30 01:58:24'),
(397, 1, '674a6335053cb', '1efaeb63-6501-6ee6-87c0-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.68, 'play_fiver', 0, 1, '674a6335053cb', '2024-11-30 01:58:30', '2024-11-30 01:58:30'),
(398, 1, '674a633da9ce6', '1efaeb63-b7ba-6728-85e2-762755d1f7b7', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '674a633da9ce6', '2024-11-30 01:58:38', '2024-11-30 01:58:38'),
(399, 1, '674a634cc208a', '1efaeb64-47bd-644c-ae46-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.88, 'play_fiver', 0, 1, '674a634cc208a', '2024-11-30 01:58:54', '2024-11-30 01:58:54'),
(400, 1, '674a635788275', '1efaeb64-ae5e-64e4-8a46-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 2.30, 'play_fiver', 0, 1, '674a635788275', '2024-11-30 01:59:04', '2024-11-30 01:59:04'),
(401, 1, '674a636c9a10a', '1efaeb65-7756-6d4c-91b9-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.48, 'play_fiver', 0, 1, '674a636c9a10a', '2024-11-30 01:59:27', '2024-11-30 01:59:27'),
(402, 1, '674a63844baa5', '1efaeb66-5927-6f14-8be0-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a63844baa5', '2024-11-30 01:59:49', '2024-11-30 01:59:49'),
(403, 1, '674a6385b814e', '1efaeb66-66ed-68a6-a0c5-f2b1ac7d781e', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674a6385b814e', '2024-11-30 01:59:50', '2024-11-30 01:59:50'),
(404, 1, '674a63873d80e', '1efaeb66-7536-6ffc-aeda-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.02, 'play_fiver', 0, 1, '674a63873d80e', '2024-11-30 01:59:53', '2024-11-30 01:59:53'),
(405, 1, '674a6394c5736', '1efaeb66-f680-67d4-8758-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a6394c5736', '2024-11-30 02:00:05', '2024-11-30 02:00:05'),
(406, 1, '674a639608921', '1efaeb67-0232-6d48-b0e5-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a639608921', '2024-11-30 02:00:06', '2024-11-30 02:00:06'),
(407, 1, '674a63a0c4524', '1efaeb67-68e5-6f54-b6b6-7aa2c9a4041c', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.12, 'play_fiver', 0, 1, '674a63a0c4524', '2024-11-30 02:00:18', '2024-11-30 02:00:18'),
(408, 1, '674a63a5eb28d', '1efaeb67-9a19-683c-b295-7aa2c9a4041c', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674a63a5eb28d', '2024-11-30 02:00:22', '2024-11-30 02:00:22'),
(409, 1, '674a63ad0fc96', '1efaeb67-ddd3-691a-a0fc-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674a63ad0fc96', '2024-11-30 02:00:30', '2024-11-30 02:00:30'),
(410, 1, '674a63b542814', '1efaeb68-2c19-655c-b0b9-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.60, 'play_fiver', 0, 1, '674a63b542814', '2024-11-30 02:00:38', '2024-11-30 02:00:38'),
(411, 1, '674a63cc3c7fa', '1efaeb69-0735-6514-a95b-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 5.20, 'play_fiver', 0, 1, '674a63cc3c7fa', '2024-11-30 02:01:01', '2024-11-30 02:01:01'),
(412, 1, '674a63d51aa34', '1efaeb69-5bc3-66e4-bda9-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.36, 'play_fiver', 0, 1, '674a63d51aa34', '2024-11-30 02:01:10', '2024-11-30 02:01:10'),
(413, 1, '674a63dd41007', '1efaeb69-a983-6172-a491-7aa2c9a4041c', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.72, 'play_fiver', 0, 1, '674a63dd41007', '2024-11-30 02:01:18', '2024-11-30 02:01:18'),
(414, 1, '674a63e0a8a0d', '1efaeb69-ca2b-67f8-9f12-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.72, 'play_fiver', 0, 1, '674a63e0a8a0d', '2024-11-30 02:01:21', '2024-11-30 02:01:21'),
(415, 1, '674a63e458339', '1efaeb69-ed2c-6bb2-9d5b-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.14, 'play_fiver', 0, 1, '674a63e458339', '2024-11-30 02:01:25', '2024-11-30 02:01:25'),
(416, 1, '674a63eb95c8a', '1efaeb6a-3256-6882-9fc8-d2480a94bfa9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.42, 'play_fiver', 0, 1, '674a63eb95c8a', '2024-11-30 02:01:32', '2024-11-30 02:01:32'),
(417, 1, '674a63efc708d', '1efaeb6a-5a68-6e38-8b13-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.48, 'play_fiver', 0, 1, '674a63efc708d', '2024-11-30 02:01:37', '2024-11-30 02:01:37'),
(418, 1, '674a63f79dcf7', '1efaeb6a-a51c-69ca-8d00-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 23.92, 'play_fiver', 0, 1, '674a63f79dcf7', '2024-11-30 02:01:44', '2024-11-30 02:01:44'),
(419, 1, '674a64004f4ab', '1efaeb6a-f7da-6676-80ea-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 4.64, 'play_fiver', 0, 1, '674a64004f4ab', '2024-11-30 02:01:54', '2024-11-30 02:01:54'),
(420, 1, '674a640b6df42', '1efaeb6b-61f4-68c2-8d4e-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 12.60, 'play_fiver', 0, 1, '674a640b6df42', '2024-11-30 02:02:04', '2024-11-30 02:02:04'),
(421, 1, '674a6414bf353', '1efaeb6b-baf5-6e8a-9492-bef12eb691dc', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 12.80, 'play_fiver', 0, 1, '674a6414bf353', '2024-11-30 02:02:14', '2024-11-30 02:02:14'),
(422, 1, '674a641fde68e', '1efaeb6c-2516-6152-b24f-7aa2c9a4041c', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 6.80, 'play_fiver', 0, 1, '674a641fde68e', '2024-11-30 02:02:25', '2024-11-30 02:02:25'),
(423, 1, '674a64285f02f', '1efaeb6c-75f1-6bbc-888a-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 14.80, 'play_fiver', 0, 1, '674a64285f02f', '2024-11-30 02:02:33', '2024-11-30 02:02:33'),
(424, 1, '674a642c9cb00', '1efaeb6c-9e7e-6af8-8e28-f2b1ac7d781e', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 8.40, 'play_fiver', 0, 1, '674a642c9cb00', '2024-11-30 02:02:37', '2024-11-30 02:02:37'),
(425, 1, '674a643ba4126', '1efaeb6d-2dd6-6430-8b94-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 5.04, 'play_fiver', 0, 1, '674a643ba4126', '2024-11-30 02:02:52', '2024-11-30 02:02:52'),
(426, 1, '674a6449dac85', '1efaeb6d-b57e-627a-a6fb-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.88, 'play_fiver', 0, 1, '674a6449dac85', '2024-11-30 02:03:06', '2024-11-30 02:03:06'),
(427, 1, '674a64527f196', '1efaeb6e-07bc-6960-9801-f2b1ac7d781e', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.88, 'play_fiver', 0, 1, '674a64527f196', '2024-11-30 02:03:15', '2024-11-30 02:03:15'),
(428, 1, '674a6470923c1', '1efaeb6f-2697-632a-8ea0-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a6470923c1', '2024-11-30 02:03:51', '2024-11-30 02:03:51'),
(429, 1, '674a647332468', '1efaeb6f-3f72-6c32-b2a3-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674a647332468', '2024-11-30 02:03:52', '2024-11-30 02:03:52'),
(430, 1, '674a648356e96', '1efaeb6f-d977-651c-873a-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674a648356e96', '2024-11-30 02:04:04', '2024-11-30 02:04:04'),
(431, 1, '674a64cb28690', '1efaeb72-864c-65f6-8b63-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '674a64cb28690', '2024-11-30 02:05:16', '2024-11-30 02:05:16'),
(432, 1, '674a64cc9ee84', '1efaeb72-9475-6eac-b886-bef12eb691dc', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.12, 'play_fiver', 0, 1, '674a64cc9ee84', '2024-11-30 02:05:17', '2024-11-30 02:05:17'),
(433, 1, '674a64d84c738', '1efaeb73-03ae-6062-a20c-bef12eb691dc', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a64d84c738', '2024-11-30 02:05:30', '2024-11-30 02:05:30'),
(434, 1, '674a64d9c8be2', '1efaeb73-1213-6ada-b219-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.78, 'play_fiver', 0, 1, '674a64d9c8be2', '2024-11-30 02:05:31', '2024-11-30 02:05:31'),
(435, 1, '674a64df738b4', '1efaeb73-47f8-6114-9e4d-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 3.36, 'play_fiver', 0, 1, '674a64df738b4', '2024-11-30 02:05:37', '2024-11-30 02:05:37'),
(436, 1, '674a64e435734', '1efaeb73-753a-6b4a-8d94-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 3.20, 'play_fiver', 0, 1, '674a64e435734', '2024-11-30 02:05:42', '2024-11-30 02:05:42'),
(437, 1, '674a64ee94596', '1efaeb73-d84c-6922-9972-762755d1f7b7', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.12, 'play_fiver', 0, 1, '674a64ee94596', '2024-11-30 02:05:51', '2024-11-30 02:05:51'),
(438, 1, '674a64f433634', '1efaeb74-0dbb-69d2-b383-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '674a64f433634', '2024-11-30 02:05:57', '2024-11-30 02:05:57'),
(439, 1, '674a64f9055d3', '1efaeb74-3b9e-619c-9e34-bef12eb691dc', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674a64f9055d3', '2024-11-30 02:06:02', '2024-11-30 02:06:02'),
(440, 1, '674a6503e9e81', '1efaeb74-a3e9-676a-a702-762755d1f7b7', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '674a6503e9e81', '2024-11-30 02:06:14', '2024-11-30 02:06:14'),
(441, 1, '674a650bbeeea', '1efaeb74-ee87-66dc-80d5-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 3.28, 'play_fiver', 0, 1, '674a650bbeeea', '2024-11-30 02:06:21', '2024-11-30 02:06:21'),
(442, 1, '674a6511316b4', '1efaeb75-2238-6bc0-a3f7-f2b1ac7d781e', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674a6511316b4', '2024-11-30 02:06:26', '2024-11-30 02:06:26'),
(443, 1, '674a65196a9e3', '1efaeb75-70bf-6a6e-b8ca-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a65196a9e3', '2024-11-30 02:06:34', '2024-11-30 02:06:34'),
(444, 1, '674a651b92420', '1efaeb75-855f-6488-9c65-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.10, 'play_fiver', 0, 1, '674a651b92420', '2024-11-30 02:06:36', '2024-11-30 02:06:36'),
(445, 1, '674a6524b5d6e', '1efaeb75-dc97-63c2-a01e-762755d1f7b7', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a6524b5d6e', '2024-11-30 02:06:45', '2024-11-30 02:06:45'),
(446, 1, '674a6526e6de1', '1efaeb75-f194-634c-b857-762755d1f7b7', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674a6526e6de1', '2024-11-30 02:06:47', '2024-11-30 02:06:47'),
(447, 1, '674a652f5cf43', '1efaeb76-4209-652a-b25c-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674a652f5cf43', '2024-11-30 02:06:56', '2024-11-30 02:06:56'),
(448, 1, '674a653519c7c', '1efaeb76-789f-629c-8416-762755d1f7b7', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674a653519c7c', '2024-11-30 02:07:02', '2024-11-30 02:07:02'),
(449, 1, '674a653e7f133', '1efaeb76-d268-6256-9ba7-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674a653e7f133', '2024-11-30 02:07:11', '2024-11-30 02:07:11'),
(450, 1, '674a65427416f', '1efaeb76-f820-6502-8b62-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674a65427416f', '2024-11-30 02:07:16', '2024-11-30 02:07:16'),
(451, 1, '674a6546f26c7', '1efaeb77-2334-6be4-a0f6-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '674a6546f26c7', '2024-11-30 02:07:19', '2024-11-30 02:07:19'),
(452, 1, '674a654b3f0dc', '1efaeb77-4be2-6794-b6d7-f2348ff04445', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 6.00, 'play_fiver', 0, 1, '674a654b3f0dc', '2024-11-30 02:07:23', '2024-11-30 02:07:23'),
(453, 1, '674a655683548', '1efaeb77-b77c-6a86-bcae-7aa2c9a4041c', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 3.20, 'play_fiver', 0, 1, '674a655683548', '2024-11-30 02:07:35', '2024-11-30 02:07:35'),
(454, 1, '674a6561271ee', '1efaeb78-1cc1-65ea-b234-7aa2c9a4041c', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.80, 'play_fiver', 0, 1, '674a6561271ee', '2024-11-30 02:07:46', '2024-11-30 02:07:46'),
(455, 1, '674a656a59228', '1efaeb78-748b-60be-b0ee-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '674a656a59228', '2024-11-30 02:07:56', '2024-11-30 02:07:56'),
(456, 1, '674a65707d7cd', '1efaeb78-af2e-6586-9e75-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674a65707d7cd', '2024-11-30 02:08:03', '2024-11-30 02:08:03'),
(457, 1, '674a658fe3fbf', '1efaeb79-dad4-60ae-886b-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674a658fe3fbf', '2024-11-30 02:08:33', '2024-11-30 02:08:33'),
(458, 1, '674a659332baa', '1efaeb79-fa0b-6eae-8cdf-a2b93a0d4ba9', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.02, 'play_fiver', 0, 1, '674a659332baa', '2024-11-30 02:08:36', '2024-11-30 02:08:36'),
(459, 1, '674a65aa6fb32', '1efaeb7a-d7c7-61f8-9ba0-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.16, 'play_fiver', 0, 1, '674a65aa6fb32', '2024-11-30 02:08:59', '2024-11-30 02:08:59'),
(460, 1, '674a65b19d0bf', '1efaeb7b-1c4d-60c0-b607-3e470708c26a', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674a65b19d0bf', '2024-11-30 02:09:07', '2024-11-30 02:09:07'),
(461, 1, '674a65bd594c5', '1efaeb7b-8c1b-6e9c-a4c9-f2b1ac7d781e', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 4.20, 'play_fiver', 0, 1, '674a65bd594c5', '2024-11-30 02:09:18', '2024-11-30 02:09:18'),
(462, 1, '674a65c611d7a', '1efaeb7b-df23-60b8-b637-3ee2b28ceec6', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 6.00, 'play_fiver', 0, 1, '674a65c611d7a', '2024-11-30 02:09:28', '2024-11-30 02:09:28'),
(463, 1, '674a65ec35347', '1efaeb7d-4aea-67b4-ad54-ba401d7fed60', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 2.20, 'play_fiver', 0, 1, '674a65ec35347', '2024-11-30 02:10:05', '2024-11-30 02:10:05'),
(464, 1, '674a7611afcb1', '1efaec17-4711-6472-80b8-ba401d7fed60', 'double-fortune', 'double-fortune', 'bet', 'balance', 0.60, 'play_fiver', 0, 1, '674a7611afcb1', '2024-11-30 03:18:59', '2024-11-30 03:18:59'),
(465, 1, '674a761336395', '1efaec17-5562-6d5a-bab6-5ad90d358a4f', 'double-fortune', 'double-fortune', 'win', 'balance', 0.60, 'play_fiver', 0, 1, '674a761336395', '2024-11-30 03:19:01', '2024-11-30 03:19:01'),
(466, 1, '674a7615a44f4', '1efaec17-6cc3-6468-a947-ba401d7fed60', 'double-fortune', 'double-fortune', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '674a7615a44f4', '2024-11-30 03:19:02', '2024-11-30 03:19:02'),
(467, 1, '674a761a83fd0', '1efaec17-9b2e-628a-988c-ba401d7fed60', 'double-fortune', 'double-fortune', 'bet', 'balance', 1.80, 'play_fiver', 0, 1, '674a761a83fd0', '2024-11-30 03:19:09', '2024-11-30 03:19:09'),
(468, 1, '674a761c7010b', '1efaec17-ad79-6f70-8b73-badb367b8889', 'double-fortune', 'double-fortune', 'win', 'balance', 33.60, 'play_fiver', 0, 1, '674a761c7010b', '2024-11-30 03:19:10', '2024-11-30 03:19:10'),
(469, 1, '674a7622c5c36', '1efaec17-ea0b-6f7e-98c0-a2b93a0d4ba9', 'double-fortune', 'double-fortune', 'win', 'balance', 30.60, 'play_fiver', 0, 1, '674a7622c5c36', '2024-11-30 03:19:15', '2024-11-30 03:19:15'),
(470, 1, '674a7625b5a7a', '1efaec18-0607-6aca-a901-3e470708c26a', 'double-fortune', 'double-fortune', 'win', 'balance', 14.00, 'play_fiver', 0, 1, '674a7625b5a7a', '2024-11-30 03:19:18', '2024-11-30 03:19:18'),
(471, 1, '674a7627c2af3', '1efaec18-199c-6392-a121-3ee2b28ceec6', 'double-fortune', 'double-fortune', 'bet', 'balance', 6.00, 'play_fiver', 0, 1, '674a7627c2af3', '2024-11-30 03:19:21', '2024-11-30 03:19:21'),
(472, 1, '674a76292dab1', '1efaec18-26dc-67c8-b8e1-a6c4b4b1eeda', 'double-fortune', 'double-fortune', 'bet', 'balance', 6.00, 'play_fiver', 0, 1, '674a76292dab1', '2024-11-30 03:19:22', '2024-11-30 03:19:22'),
(473, 1, '674a762a49b7e', '1efaec18-3180-65f8-bd5b-3e470708c26a', 'double-fortune', 'double-fortune', 'win', 'balance', 26.00, 'play_fiver', 0, 1, '674a762a49b7e', '2024-11-30 03:19:23', '2024-11-30 03:19:23'),
(474, 1, '674a762c3bca8', '1efaec18-4405-68fe-b8e6-dabfeae9dcee', 'double-fortune', 'double-fortune', 'bet', 'balance_bonus', 6.00, 'play_fiver', 0, 1, '674a762c3bca8', '2024-11-30 03:19:24', '2024-11-30 03:19:24'),
(475, 1, '674a762d57e51', '1efaec18-4ea9-67e2-a29f-3e470708c26a', 'double-fortune', 'double-fortune', 'win', 'balance_bonus', 12.00, 'play_fiver', 0, 1, '674a762d57e51', '2024-11-30 03:19:25', '2024-11-30 03:19:25'),
(476, 1, '674a762f48842', '1efaec18-6121-6104-a0d9-3ee2b28ceec6', 'double-fortune', 'double-fortune', 'win', 'balance_bonus', 56.00, 'play_fiver', 0, 1, '674a762f48842', '2024-11-30 03:19:28', '2024-11-30 03:19:28'),
(477, 1, '674a90cc83f8c', '1efaed16-313b-6d28-bc79-ba401d7fed60', '104', '104', 'win', 'balance_bonus', 0.60, 'play_fiver', 0, 1, '674a90cc83f8c', '2024-11-30 05:13:03', '2024-11-30 05:13:03'),
(478, 1, '674a90f9f3c32', '1efaed17-e2c1-60ec-a1a8-3e470708c26a', '104', '104', 'win', 'balance_bonus', 9.60, 'play_fiver', 0, 1, '674a90f9f3c32', '2024-11-30 05:13:49', '2024-11-30 05:13:49'),
(479, 1, '674a910257849', '1efaed18-327b-6344-b7e1-3e470708c26a', '104', '104', 'win', 'balance_bonus', 9.60, 'play_fiver', 0, 1, '674a910257849', '2024-11-30 05:13:56', '2024-11-30 05:13:56'),
(480, 1, '674a910a30115', '1efaed18-7d3c-6054-b173-3e470708c26a', '104', '104', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674a910a30115', '2024-11-30 05:14:05', '2024-11-30 05:14:05'),
(481, 1, '674a911444fb6', '1efaed18-dd6b-62f4-8183-3e470708c26a', '104', '104', 'win', 'balance_bonus', 1.44, 'play_fiver', 0, 1, '674a911444fb6', '2024-11-30 05:14:15', '2024-11-30 05:14:15'),
(482, 1, '674a9456a1db3', '1efaed37-f2b1-622a-a5d5-ce93f998fb3f', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9456a1db3', '2024-11-30 05:28:09', '2024-11-30 05:28:09'),
(483, 1, '674a94595556c', '1efaed38-0c50-6046-92a9-ce93f998fb3f', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a94595556c', '2024-11-30 05:28:11', '2024-11-30 05:28:11'),
(484, 1, '674a945c2a2cf', '1efaed38-273c-6c42-b33f-72a27b7637b3', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a945c2a2cf', '2024-11-30 05:28:14', '2024-11-30 05:28:14'),
(485, 1, '674a945ed7922', '1efaed38-4115-674a-9a9c-de0243015667', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a945ed7922', '2024-11-30 05:28:17', '2024-11-30 05:28:17'),
(486, 1, '674a94ae1c4e9', '1efaed3b-34b5-67cc-b0c1-72a27b7637b3', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a94ae1c4e9', '2024-11-30 05:29:36', '2024-11-30 05:29:36'),
(487, 1, '674a94b068159', '1efaed3b-4abd-6c9a-a69a-de0243015667', '104', '104', 'win', 'balance_bonus', 0.02, 'play_fiver', 0, 1, '674a94b068159', '2024-11-30 05:29:39', '2024-11-30 05:29:39'),
(488, 1, '674a94b562721', '1efaed3b-7a36-64fe-8b23-de0243015667', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a94b562721', '2024-11-30 05:29:43', '2024-11-30 05:29:43'),
(489, 1, '674a94be5ad47', '1efaed3b-cfbc-6950-9615-de0243015667', '104', '104', 'win', 'balance', 0.06, 'play_fiver', 0, 1, '674a94be5ad47', '2024-11-30 05:29:52', '2024-11-30 05:29:52'),
(490, 1, '674a94c4a4376', '1efaed3c-0bd2-6e26-b531-72a27b7637b3', '104', '104', 'win', 'balance', 1.92, 'play_fiver', 0, 1, '674a94c4a4376', '2024-11-30 05:29:59', '2024-11-30 05:29:59'),
(491, 1, '674a94c6ec0ed', '1efaed3c-21b4-6190-9de7-de0243015667', '104', '104', 'win', 'balance', 1.92, 'play_fiver', 0, 1, '674a94c6ec0ed', '2024-11-30 05:30:01', '2024-11-30 05:30:01'),
(492, 1, '674a94cdd0516', '1efaed3c-6360-6e90-8366-72a27b7637b3', '104', '104', 'win', 'balance', 0.56, 'play_fiver', 0, 1, '674a94cdd0516', '2024-11-30 05:30:08', '2024-11-30 05:30:08'),
(493, 1, '674a94d025c97', '1efaed3c-7953-6aea-9ca4-de0243015667', '104', '104', 'win', 'balance', 8.70, 'play_fiver', 0, 1, '674a94d025c97', '2024-11-30 05:30:10', '2024-11-30 05:30:10'),
(494, 1, '674a94d237ef9', '1efaed3c-8d1b-6bcc-8860-72a27b7637b3', '104', '104', 'win', 'balance', 1.08, 'play_fiver', 0, 1, '674a94d237ef9', '2024-11-30 05:30:12', '2024-11-30 05:30:12'),
(495, 1, '674a94da6ca10', '1efaed3c-db76-613c-b60d-ce93f998fb3f', '104', '104', 'win', 'balance', 0.56, 'play_fiver', 0, 1, '674a94da6ca10', '2024-11-30 05:30:20', '2024-11-30 05:30:20'),
(496, 1, '674a94dd332bb', '1efaed3c-f5d3-6890-abc8-72a27b7637b3', '104', '104', 'win', 'balance', 8.64, 'play_fiver', 0, 1, '674a94dd332bb', '2024-11-30 05:30:23', '2024-11-30 05:30:23'),
(497, 1, '674a94e3a8009', '1efaed3d-339c-642e-9b26-de0243015667', '104', '104', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674a94e3a8009', '2024-11-30 05:30:30', '2024-11-30 05:30:30'),
(498, 1, '674a9509c5054', '1efaed3e-9f23-6e76-97d2-ce93f998fb3f', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9509c5054', '2024-11-30 05:31:08', '2024-11-30 05:31:08'),
(499, 1, '674a950bed0ac', '1efaed3e-b3c8-6d0e-aa86-de0243015667', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a950bed0ac', '2024-11-30 05:31:10', '2024-11-30 05:31:10'),
(500, 1, '674a950e3409f', '1efaed3e-c929-636a-9274-de0243015667', '104', '104', 'win', 'balance_bonus', 0.12, 'play_fiver', 0, 1, '674a950e3409f', '2024-11-30 05:31:12', '2024-11-30 05:31:12'),
(501, 1, '674a95110aed5', '1efaed3e-e42a-6326-a39b-72a27b7637b3', '104', '104', 'win', 'balance', 0.12, 'play_fiver', 0, 1, '674a95110aed5', '2024-11-30 05:31:15', '2024-11-30 05:31:15'),
(502, 1, '674a951334226', '1efaed3e-f8d9-67a4-a9eb-72a27b7637b3', '104', '104', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '674a951334226', '2024-11-30 05:31:17', '2024-11-30 05:31:17'),
(503, 1, '674a952594426', '1efaed3f-a844-6298-9f57-ce93f998fb3f', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a952594426', '2024-11-30 05:31:36', '2024-11-30 05:31:36'),
(504, 1, '674a9557a120e', '1efaed41-859a-6c2c-9bbe-ce93f998fb3f', '104', '104', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '674a9557a120e', '2024-11-30 05:32:26', '2024-11-30 05:32:26'),
(505, 1, '674a955a82142', '1efaed41-a100-6a70-9f26-72a27b7637b3', '104', '104', 'win', 'balance', 0.44, 'play_fiver', 0, 1, '674a955a82142', '2024-11-30 05:32:29', '2024-11-30 05:32:29'),
(506, 1, '674a955cb4624', '1efaed41-b60a-631c-8e14-de0243015667', '104', '104', 'win', 'balance', 1.92, 'play_fiver', 0, 1, '674a955cb4624', '2024-11-30 05:32:31', '2024-11-30 05:32:31');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(507, 1, '674a955ef28dc', '1efaed41-cb8a-6dae-a542-ce93f998fb3f', '104', '104', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674a955ef28dc', '2024-11-30 05:32:33', '2024-11-30 05:32:33'),
(508, 1, '674a9567f25b7', '1efaed42-215d-6b32-8a04-72a27b7637b3', '104', '104', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674a9567f25b7', '2024-11-30 05:32:42', '2024-11-30 05:32:42'),
(509, 1, '674a956ac35bb', '1efaed42-3c23-6a20-9574-ce93f998fb3f', '104', '104', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '674a956ac35bb', '2024-11-30 05:32:45', '2024-11-30 05:32:45'),
(510, 1, '674a956fb70b3', '1efaed42-6b57-6918-9707-72a27b7637b3', '104', '104', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '674a956fb70b3', '2024-11-30 05:32:50', '2024-11-30 05:32:50'),
(511, 1, '674a96855baad', '1efaed4c-c2fc-6e7a-955f-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a96855baad', '2024-11-30 05:37:27', '2024-11-30 05:37:27'),
(512, 1, '674a96ca87778', '1efaed4f-56bb-6e3e-be44-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.02, 'play_fiver', 0, 1, '674a96ca87778', '2024-11-30 05:38:37', '2024-11-30 05:38:37'),
(513, 1, '674a98956811e', '1efaed60-6edf-69d2-9a25-de0243015667', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a98956811e', '2024-11-30 05:46:15', '2024-11-30 05:46:15'),
(514, 1, '674a98968e954', '1efaed60-79ea-603e-9d2e-de0243015667', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a98968e954', '2024-11-30 05:46:17', '2024-11-30 05:46:17'),
(515, 1, '674a98978345c', '1efaed60-8302-693c-9148-ce93f998fb3f', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a98978345c', '2024-11-30 05:46:18', '2024-11-30 05:46:18'),
(516, 1, '674a989892847', '1efaed60-8d26-62ce-a3ab-ce93f998fb3f', '104', '104', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '674a989892847', '2024-11-30 05:46:19', '2024-11-30 05:46:19'),
(517, 1, '674a989a6b9c4', '1efaed60-9eb1-6d7c-ba3d-de0243015667', '104', '104', 'win', 'balance', 2.12, 'play_fiver', 0, 1, '674a989a6b9c4', '2024-11-30 05:46:20', '2024-11-30 05:46:20'),
(518, 1, '674a989c84c38', '1efaed60-b2c0-61f6-997a-ce93f998fb3f', '104', '104', 'win', 'balance', 0.66, 'play_fiver', 0, 1, '674a989c84c38', '2024-11-30 05:46:23', '2024-11-30 05:46:23'),
(519, 1, '674a98a2df4a0', '1efaed60-ef81-6d9c-991b-ce93f998fb3f', '104', '104', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '674a98a2df4a0', '2024-11-30 05:46:29', '2024-11-30 05:46:29'),
(520, 1, '674a98a4b4e68', '1efaed61-00ec-6b72-8843-ce93f998fb3f', '104', '104', 'win', 'balance', 0.44, 'play_fiver', 0, 1, '674a98a4b4e68', '2024-11-30 05:46:31', '2024-11-30 05:46:31'),
(521, 1, '674a98a6daeb6', '1efaed61-157b-6af2-9ee6-de0243015667', '104', '104', 'win', 'balance', 1.92, 'play_fiver', 0, 1, '674a98a6daeb6', '2024-11-30 05:46:33', '2024-11-30 05:46:33'),
(522, 1, '674a98a92fdfd', '1efaed61-2b69-671a-a695-de0243015667', '104', '104', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674a98a92fdfd', '2024-11-30 05:46:35', '2024-11-30 05:46:35'),
(523, 1, '674a98af780c0', '1efaed61-6773-68aa-9711-de0243015667', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a98af780c0', '2024-11-30 05:46:41', '2024-11-30 05:46:41'),
(524, 1, '674a98b215d25', '1efaed61-8039-6ede-a303-ce93f998fb3f', '104', '104', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a98b215d25', '2024-11-30 05:46:44', '2024-11-30 05:46:44'),
(525, 1, '674a98b385051', '1efaed61-8e1a-6fbc-8b27-de0243015667', '104', '104', 'win', 'balance_bonus', 0.02, 'play_fiver', 0, 1, '674a98b385051', '2024-11-30 05:46:46', '2024-11-30 05:46:46'),
(526, 1, '674a98b554f0c', '1efaed61-9f4c-6ede-b6ea-ce93f998fb3f', '104', '104', 'win', 'balance', 0.60, 'play_fiver', 0, 1, '674a98b554f0c', '2024-11-30 05:46:48', '2024-11-30 05:46:48'),
(527, 1, '674a98b748c15', '1efaed61-b1e5-6dd4-8501-ce93f998fb3f', '104', '104', 'win', 'balance', 0.36, 'play_fiver', 0, 1, '674a98b748c15', '2024-11-30 05:46:49', '2024-11-30 05:46:49'),
(528, 1, '674a98b968e2a', '1efaed61-c639-6fec-8cbe-de0243015667', '104', '104', 'win', 'balance', 1.44, 'play_fiver', 0, 1, '674a98b968e2a', '2024-11-30 05:46:51', '2024-11-30 05:46:51'),
(529, 1, '674a98c04e9fc', '1efaed62-07f5-63b4-bdc7-de0243015667', '104', '104', 'win', 'balance_bonus', 0.06, 'play_fiver', 0, 1, '674a98c04e9fc', '2024-11-30 05:46:58', '2024-11-30 05:46:58'),
(530, 1, '674a98c7b8cad', '1efaed62-4edc-6dea-bfb8-ce93f998fb3f', '104', '104', 'bet', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '674a98c7b8cad', '2024-11-30 05:47:06', '2024-11-30 05:47:06'),
(531, 1, '674a98c8baeba', '1efaed62-587b-66e4-bb10-de0243015667', '104', '104', 'bet', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '674a98c8baeba', '2024-11-30 05:47:07', '2024-11-30 05:47:07'),
(532, 1, '674a98c9e343f', '1efaed62-6398-641e-aff8-de0243015667', '104', '104', 'bet', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '674a98c9e343f', '2024-11-30 05:47:08', '2024-11-30 05:47:08'),
(533, 1, '674a9981b2832', '1efaed69-3c73-6b8e-8e5d-ce93f998fb3f', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9981b2832', '2024-11-30 05:50:12', '2024-11-30 05:50:12'),
(534, 1, '674a9982ebe98', '1efaed69-483b-626e-afbd-ce93f998fb3f', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9982ebe98', '2024-11-30 05:50:13', '2024-11-30 05:50:13'),
(535, 1, '674a9983c1320', '1efaed69-5019-6972-806b-de0243015667', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9983c1320', '2024-11-30 05:50:14', '2024-11-30 05:50:14'),
(536, 1, '674a998480dae', '1efaed69-571f-662c-baa7-de0243015667', '1635221', '1635221', 'win', 'balance_bonus', 0.20, 'play_fiver', 0, 1, '674a998480dae', '2024-11-30 05:50:15', '2024-11-30 05:50:15'),
(537, 1, '674a998c845cb', '1efaed69-a38d-689c-9558-de0243015667', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a998c845cb', '2024-11-30 05:50:23', '2024-11-30 05:50:23'),
(538, 1, '674a998e8c34e', '1efaed69-b6ef-6868-8505-ce93f998fb3f', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a998e8c34e', '2024-11-30 05:50:25', '2024-11-30 05:50:25'),
(539, 1, '674a998fafe41', '1efaed69-c1dd-62fc-a4a2-ce93f998fb3f', '1635221', '1635221', 'win', 'balance_bonus', 1.60, 'play_fiver', 0, 1, '674a998fafe41', '2024-11-30 05:50:26', '2024-11-30 05:50:26'),
(540, 1, '674a9997ed349', '1efaed6a-108d-6aa0-bbec-de0243015667', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9997ed349', '2024-11-30 05:50:34', '2024-11-30 05:50:34'),
(541, 1, '674a9998b3b59', '1efaed6a-17d7-6d2e-b75b-ce93f998fb3f', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9998b3b59', '2024-11-30 05:50:35', '2024-11-30 05:50:35'),
(542, 1, '674a999a38834', '1efaed6a-261b-6174-b858-de0243015667', '1635221', '1635221', 'win', 'balance_bonus', 1.60, 'play_fiver', 0, 1, '674a999a38834', '2024-11-30 05:50:36', '2024-11-30 05:50:36'),
(543, 1, '674a999977097', '1efaed6a-1f02-6874-833c-de0243015667', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a999977097', '2024-11-30 05:50:36', '2024-11-30 05:50:36'),
(544, 1, '674a9fbf8c6e7', '1efaeda4-c2ae-61f0-ac0c-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9fbf8c6e7', '2024-11-30 06:16:50', '2024-11-30 06:16:50'),
(545, 1, '674a9fc0d73b7', '1efaeda4-cf23-687c-8ccc-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9fc0d73b7', '2024-11-30 06:16:51', '2024-11-30 06:16:51'),
(546, 1, '674a9fc2253e4', '1efaeda4-db42-66bc-a8fd-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9fc2253e4', '2024-11-30 06:16:52', '2024-11-30 06:16:52'),
(547, 1, '674a9fc360b17', '1efaeda4-e71e-64b8-a5e6-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9fc360b17', '2024-11-30 06:16:53', '2024-11-30 06:16:53'),
(548, 1, '674a9fc49f363', '1efaeda4-f318-6ba6-afb2-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674a9fc49f363', '2024-11-30 06:16:55', '2024-11-30 06:16:55'),
(549, 1, '674a9fc5ce1c2', '1efaeda4-fe77-6560-9a43-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.04, 'play_fiver', 0, 1, '674a9fc5ce1c2', '2024-11-30 06:16:56', '2024-11-30 06:16:56'),
(550, 1, '674a9fcb9f9eb', '1efaeda5-35de-6eae-82d3-de0243015667', '1508783', '1508783', 'win', 'balance_bonus', 0.18, 'play_fiver', 0, 1, '674a9fcb9f9eb', '2024-11-30 06:17:02', '2024-11-30 06:17:02'),
(551, 1, '674aa429b6eac', '1efaedce-dcdb-6fb2-a8d1-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa429b6eac', '2024-11-30 06:35:40', '2024-11-30 06:35:40'),
(552, 1, '674aa42acd7a1', '1efaedce-e746-6f2e-8b4a-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa42acd7a1', '2024-11-30 06:35:41', '2024-11-30 06:35:41'),
(553, 1, '674aa5560bbbf', '1efaedda-0cbb-648e-a63c-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa5560bbbf', '2024-11-30 06:40:40', '2024-11-30 06:40:40'),
(554, 1, '674aa571014a1', '1efaeddb-0dd0-6d5a-a657-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa571014a1', '2024-11-30 06:41:07', '2024-11-30 06:41:07'),
(555, 1, '674aa57235259', '1efaeddb-1960-6c7e-ae5e-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa57235259', '2024-11-30 06:41:08', '2024-11-30 06:41:08'),
(556, 1, '674aa57367253', '1efaeddb-24de-6362-b345-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa57367253', '2024-11-30 06:41:10', '2024-11-30 06:41:10'),
(557, 1, '674aa5749b122', '1efaeddb-306e-6cf4-8e43-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa5749b122', '2024-11-30 06:41:11', '2024-11-30 06:41:11'),
(558, 1, '674aa575cc597', '1efaeddb-3be5-6812-81af-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa575cc597', '2024-11-30 06:41:12', '2024-11-30 06:41:12'),
(559, 1, '674aa576e07a4', '1efaeddb-4637-6dec-9c95-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa576e07a4', '2024-11-30 06:41:13', '2024-11-30 06:41:13'),
(560, 1, '674aa5781aa2b', '1efaeddb-5190-68f6-b7c5-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa5781aa2b', '2024-11-30 06:41:14', '2024-11-30 06:41:14'),
(561, 1, '674aa57950db0', '1efaeddb-5d37-6b82-880d-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa57950db0', '2024-11-30 06:41:15', '2024-11-30 06:41:15'),
(562, 1, '674aa57b08026', '1efaeddb-6d72-615a-a430-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aa57b08026', '2024-11-30 06:41:17', '2024-11-30 06:41:17'),
(563, 1, '674aa57c3f3ee', '1efaeddb-7923-6d82-8151-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aa57c3f3ee', '2024-11-30 06:41:19', '2024-11-30 06:41:19'),
(564, 1, '674aa57e323b0', '1efaeddb-8bb4-67c6-8e0a-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa57e323b0', '2024-11-30 06:41:20', '2024-11-30 06:41:20'),
(565, 1, '674aa57f5fdaf', '1efaeddb-9706-621e-9ebe-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa57f5fdaf', '2024-11-30 06:41:21', '2024-11-30 06:41:21'),
(566, 1, '674aa5807e35c', '1efaeddb-a1bf-6142-b202-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa5807e35c', '2024-11-30 06:41:22', '2024-11-30 06:41:22'),
(567, 1, '674aa581baaef', '1efaeddb-ada5-631c-b6e1-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa581baaef', '2024-11-30 06:41:24', '2024-11-30 06:41:24'),
(568, 1, '674aa582ecba6', '1efaeddb-b923-620c-9cd4-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa582ecba6', '2024-11-30 06:41:25', '2024-11-30 06:41:25'),
(569, 1, '674aa58438443', '1efaeddb-c529-6498-b5f6-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58438443', '2024-11-30 06:41:27', '2024-11-30 06:41:27'),
(570, 1, '674aa5855ad08', '1efaeddb-d00c-628e-8b1e-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa5855ad08', '2024-11-30 06:41:27', '2024-11-30 06:41:27'),
(571, 1, '674aa58675ed4', '1efaeddb-daa4-6afc-8202-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58675ed4', '2024-11-30 06:41:28', '2024-11-30 06:41:28'),
(572, 1, '674aa58798032', '1efaeddb-e582-6ece-9a57-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58798032', '2024-11-30 06:41:30', '2024-11-30 06:41:30'),
(573, 1, '674aa588b9193', '1efaeddb-f057-6372-a899-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa588b9193', '2024-11-30 06:41:31', '2024-11-30 06:41:31'),
(574, 1, '674aa58a0227e', '1efaeddb-fc44-69aa-81fa-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58a0227e', '2024-11-30 06:41:32', '2024-11-30 06:41:32'),
(575, 1, '674aa58b25401', '1efaeddc-072d-6056-b2ca-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58b25401', '2024-11-30 06:41:33', '2024-11-30 06:41:33'),
(576, 1, '674aa58c5d53d', '1efaeddc-12e7-6838-af25-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58c5d53d', '2024-11-30 06:41:34', '2024-11-30 06:41:34'),
(577, 1, '674aa58de652f', '1efaeddc-21ca-68aa-ab00-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58de652f', '2024-11-30 06:41:36', '2024-11-30 06:41:36'),
(578, 1, '674aa58f22757', '1efaeddc-2d37-61ca-810f-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa58f22757', '2024-11-30 06:41:37', '2024-11-30 06:41:37'),
(579, 1, '674aa59044ca2', '1efaeddc-3817-65fe-bb15-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa59044ca2', '2024-11-30 06:41:38', '2024-11-30 06:41:38'),
(580, 1, '674aa60bc4f28', '1efaede0-d21e-62ca-b6d6-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa60bc4f28', '2024-11-30 06:43:42', '2024-11-30 06:43:42'),
(581, 1, '674aa60cdff78', '1efaede0-dcb5-68e6-9f00-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa60cdff78', '2024-11-30 06:43:43', '2024-11-30 06:43:43'),
(582, 1, '674aa60e17942', '1efaede0-e7f4-6734-8fed-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa60e17942', '2024-11-30 06:43:44', '2024-11-30 06:43:44'),
(583, 1, '674aa60f4158e', '1efaede0-f320-6054-9a59-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa60f4158e', '2024-11-30 06:43:45', '2024-11-30 06:43:45'),
(584, 1, '674aa61138ce2', '1efaede1-05dd-6732-b5d3-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa61138ce2', '2024-11-30 06:43:47', '2024-11-30 06:43:47'),
(585, 1, '674aa611dd2ee', '1efaede1-0c48-6bc6-bbb3-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa611dd2ee', '2024-11-30 06:43:48', '2024-11-30 06:43:48'),
(586, 1, '674aa6139aac4', '1efaede1-1cc2-6754-bb25-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.36, 'play_fiver', 0, 1, '674aa6139aac4', '2024-11-30 06:43:50', '2024-11-30 06:43:50'),
(587, 1, '674aa61923fc1', '1efaede1-5157-6ffa-9428-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa61923fc1', '2024-11-30 06:43:55', '2024-11-30 06:43:55'),
(588, 1, '674aa61a6a554', '1efaede1-5da0-6dc0-8385-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa61a6a554', '2024-11-30 06:43:56', '2024-11-30 06:43:56'),
(589, 1, '674aa61baf70d', '1efaede1-69dd-669c-9cd4-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.08, 'play_fiver', 0, 1, '674aa61baf70d', '2024-11-30 06:43:58', '2024-11-30 06:43:58'),
(590, 1, '674aa620f2396', '1efaede1-9c28-639a-8b60-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa620f2396', '2024-11-30 06:44:03', '2024-11-30 06:44:03'),
(591, 1, '674aa6226d79f', '1efaede1-aa0b-6fe8-b3b6-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa6226d79f', '2024-11-30 06:44:04', '2024-11-30 06:44:04'),
(592, 1, '674aa623b4352', '1efaede1-b658-6a3a-ad3b-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa623b4352', '2024-11-30 06:44:06', '2024-11-30 06:44:06'),
(593, 1, '674aa62865fbd', '1efaede1-e2f9-63fa-bdd2-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa62865fbd', '2024-11-30 06:44:10', '2024-11-30 06:44:10'),
(594, 1, '674aa6299ce0e', '1efaede1-eea7-67ba-b8a4-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa6299ce0e', '2024-11-30 06:44:12', '2024-11-30 06:44:12'),
(595, 1, '674aa62ad302e', '1efaede1-fa4e-6a82-b7f2-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa62ad302e', '2024-11-30 06:44:13', '2024-11-30 06:44:13'),
(596, 1, '674aa62bda1ae', '1efaede2-041e-68e6-ae62-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa62bda1ae', '2024-11-30 06:44:14', '2024-11-30 06:44:14'),
(597, 1, '674aa62d0b47e', '1efaede2-0f1d-61de-a2dc-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa62d0b47e', '2024-11-30 06:44:16', '2024-11-30 06:44:16'),
(598, 1, '674aa62e3c3a9', '1efaede2-1a8f-6f8a-a35b-de0243015667', '1508783', '1508783', 'win', 'balance_bonus', 0.18, 'play_fiver', 0, 1, '674aa62e3c3a9', '2024-11-30 06:44:17', '2024-11-30 06:44:17'),
(599, 1, '674aa635e3945', '1efaede2-63db-643c-9b7a-2e36ce73de4e', '1508783', '1508783', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa635e3945', '2024-11-30 06:44:24', '2024-11-30 06:44:24'),
(600, 1, '674aa63b4d257', '1efaede2-9733-6dfc-86a3-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa63b4d257', '2024-11-30 06:44:29', '2024-11-30 06:44:29'),
(601, 1, '674aa63c8d19a', '1efaede2-a33c-65ea-8836-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa63c8d19a', '2024-11-30 06:44:31', '2024-11-30 06:44:31'),
(602, 1, '674aa63dd191a', '1efaede2-af72-683c-8648-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa63dd191a', '2024-11-30 06:44:32', '2024-11-30 06:44:32'),
(603, 1, '674aa63f1dcb5', '1efaede2-bb7f-6ff8-bcc9-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa63f1dcb5', '2024-11-30 06:44:34', '2024-11-30 06:44:34'),
(604, 1, '674aa6405a039', '1efaede2-c763-61e4-bcbb-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa6405a039', '2024-11-30 06:44:34', '2024-11-30 06:44:34'),
(605, 1, '674aa6459f866', '1efaede2-f9c9-6b60-89b2-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa6459f866', '2024-11-30 06:44:40', '2024-11-30 06:44:40'),
(606, 1, '674aa646dca18', '1efaede3-05b5-6c30-a9c7-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa646dca18', '2024-11-30 06:44:41', '2024-11-30 06:44:41'),
(607, 1, '674aa64823f64', '1efaede3-1192-6594-aade-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa64823f64', '2024-11-30 06:44:42', '2024-11-30 06:44:42'),
(608, 1, '674aa64955156', '1efaede3-1d06-6718-926c-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa64955156', '2024-11-30 06:44:43', '2024-11-30 06:44:43'),
(609, 1, '674aa64b3bcfc', '1efaede3-2f1c-68e4-9dd7-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aa64b3bcfc', '2024-11-30 06:44:45', '2024-11-30 06:44:45'),
(610, 1, '674aa64c7ae39', '1efaede3-3b1c-6bf8-8db1-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aa64c7ae39', '2024-11-30 06:44:46', '2024-11-30 06:44:46'),
(611, 1, '674aa64d9340e', '1efaede3-4599-6cfc-835b-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.12, 'play_fiver', 0, 1, '674aa64d9340e', '2024-11-30 06:44:48', '2024-11-30 06:44:48'),
(612, 1, '674aa64fb9d06', '1efaede3-5a2e-63a2-91f3-9a4dca826793', '1508783', '1508783', 'win', 'balance', 0.60, 'play_fiver', 0, 1, '674aa64fb9d06', '2024-11-30 06:44:50', '2024-11-30 06:44:50'),
(613, 1, '674aa656edc3b', '1efaede3-9ef7-692a-8835-de0243015667', '1508783', '1508783', 'win', 'balance_bonus', 0.04, 'play_fiver', 0, 1, '674aa656edc3b', '2024-11-30 06:44:57', '2024-11-30 06:44:57'),
(614, 1, '674aa6591d1c6', '1efaede3-b36d-63f0-8396-9a4dca826793', '1508783', '1508783', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674aa6591d1c6', '2024-11-30 06:44:59', '2024-11-30 06:44:59'),
(615, 1, '674aa69833562', '1efaede6-0d1c-6cf0-be9e-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa69833562', '2024-11-30 06:46:03', '2024-11-30 06:46:03'),
(616, 1, '674aa69946bda', '1efaede6-1767-6944-841e-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa69946bda', '2024-11-30 06:46:03', '2024-11-30 06:46:03'),
(617, 1, '674aa69a6a466', '1efaede6-2254-6dc0-85ec-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa69a6a466', '2024-11-30 06:46:04', '2024-11-30 06:46:04'),
(618, 1, '674aa69b96334', '1efaede6-2d94-6f32-a7b6-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa69b96334', '2024-11-30 06:46:06', '2024-11-30 06:46:06'),
(619, 1, '674aa6c873c7f', '1efaede7-d964-61e0-bd9a-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa6c873c7f', '2024-11-30 06:46:50', '2024-11-30 06:46:50'),
(620, 1, '674aa6da11a10', '1efaede8-8137-6e76-be45-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa6da11a10', '2024-11-30 06:47:08', '2024-11-30 06:47:08'),
(621, 1, '674aa6f1cceda', '1efaede9-63e1-62b8-938e-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa6f1cceda', '2024-11-30 06:47:32', '2024-11-30 06:47:32'),
(622, 1, '674aa6f2e9beb', '1efaede9-6e8a-6bec-aa6e-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa6f2e9beb', '2024-11-30 06:47:33', '2024-11-30 06:47:33'),
(623, 1, '674aa6f410b26', '1efaede9-7923-6158-9429-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.04, 'play_fiver', 0, 1, '674aa6f410b26', '2024-11-30 06:47:34', '2024-11-30 06:47:34'),
(624, 1, '674aa6f63b1d8', '1efaede9-8dde-6994-9829-2e36ce73de4e', '1508783', '1508783', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674aa6f63b1d8', '2024-11-30 06:47:36', '2024-11-30 06:47:36'),
(625, 1, '674aa70e452df', '1efaedea-7324-67f6-bb66-de0243015667', '1508783', '1508783', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa70e452df', '2024-11-30 06:48:00', '2024-11-30 06:48:00'),
(626, 1, '674aa7105ebb9', '1efaedea-8736-6cf8-83d7-7a80e9290541', '1508783', '1508783', 'win', 'balance', 0.54, 'play_fiver', 0, 1, '674aa7105ebb9', '2024-11-30 06:48:03', '2024-11-30 06:48:03'),
(627, 1, '674aa7130aadb', '1efaedea-a08a-6984-96cb-2e36ce73de4e', '1508783', '1508783', 'win', 'balance', 1.68, 'play_fiver', 0, 1, '674aa7130aadb', '2024-11-30 06:48:05', '2024-11-30 06:48:05'),
(628, 1, '674aa71bb70d5', '1efaedea-f391-6772-bd21-ce93f998fb3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa71bb70d5', '2024-11-30 06:48:14', '2024-11-30 06:48:14'),
(629, 1, '674aa71d3ea9b', '1efaedeb-01f0-6f8e-9593-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa71d3ea9b', '2024-11-30 06:48:15', '2024-11-30 06:48:15'),
(630, 1, '674aa71e76edd', '1efaedeb-0dac-67b0-b638-de0243015667', '1508783', '1508783', 'win', 'balance_bonus', 0.06, 'play_fiver', 0, 1, '674aa71e76edd', '2024-11-30 06:48:16', '2024-11-30 06:48:16'),
(631, 1, '674aa720998a7', '1efaedeb-2219-6694-805c-ce93f998fb3f', '1508783', '1508783', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674aa720998a7', '2024-11-30 06:48:19', '2024-11-30 06:48:19'),
(632, 1, '674aa7233f671', '1efaedeb-3b30-639e-8c4f-7a80e9290541', '1508783', '1508783', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674aa7233f671', '2024-11-30 06:48:21', '2024-11-30 06:48:21'),
(633, 1, '674aa73fb602d', '1efaedec-4ad9-6b5a-9f14-7a80e9290541', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa73fb602d', '2024-11-30 06:48:50', '2024-11-30 06:48:50'),
(634, 1, '674aa740cf3d9', '1efaedec-555f-669c-a86c-3e5e74a77e6e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa740cf3d9', '2024-11-30 06:48:51', '2024-11-30 06:48:51'),
(635, 1, '674aa7420e99b', '1efaedec-60eb-6dda-81d9-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7420e99b', '2024-11-30 06:48:52', '2024-11-30 06:48:52'),
(636, 1, '674aa7434ab59', '1efaedec-6cce-6512-ac89-ce93f998fb3f', '1508783', '1508783', 'win', 'balance_bonus', 0.08, 'play_fiver', 0, 1, '674aa7434ab59', '2024-11-30 06:48:53', '2024-11-30 06:48:53'),
(637, 1, '674aa748735cf', '1efaedec-9e14-678e-847b-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa748735cf', '2024-11-30 06:48:59', '2024-11-30 06:48:59'),
(638, 1, '674aa7499589f', '1efaedec-a8f3-6736-9bc2-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7499589f', '2024-11-30 06:49:00', '2024-11-30 06:49:00'),
(639, 1, '674aa74b0c0fa', '1efaedec-b6a7-6936-bc45-3e5e74a77e6e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa74b0c0fa', '2024-11-30 06:49:01', '2024-11-30 06:49:01'),
(640, 1, '674aa74be03a0', '1efaedec-bef0-6c64-95dd-2e36ce73de4e', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa74be03a0', '2024-11-30 06:49:02', '2024-11-30 06:49:02'),
(641, 1, '674aa74d17599', '1efaedec-ca2a-6cb0-a21e-de0243015667', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa74d17599', '2024-11-30 06:49:03', '2024-11-30 06:49:03'),
(642, 1, '674aa74e3d836', '1efaedec-d531-6e4c-a139-5a4cd8a5bef8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa74e3d836', '2024-11-30 06:49:04', '2024-11-30 06:49:04'),
(643, 1, '674aa74f6f365', '1efaedec-e0ac-64de-ac4a-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa74f6f365', '2024-11-30 06:49:06', '2024-11-30 06:49:06'),
(644, 1, '674aa750b019c', '1efaedec-ecbe-681c-aa62-9a4dca826793', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa750b019c', '2024-11-30 06:49:07', '2024-11-30 06:49:07'),
(645, 1, '674aa751e3674', '1efaedec-f848-6fd4-a78b-7a80e9290541', '1508783', '1508783', 'win', 'balance_bonus', 0.08, 'play_fiver', 0, 1, '674aa751e3674', '2024-11-30 06:49:09', '2024-11-30 06:49:09'),
(646, 1, '674aa756ed1a8', '1efaeded-2859-605c-9630-5a4cd8a5bef8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa756ed1a8', '2024-11-30 06:49:13', '2024-11-30 06:49:13'),
(647, 1, '674aa7582dad0', '1efaeded-33f1-6df6-bf7a-5a4cd8a5bef8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7582dad0', '2024-11-30 06:49:14', '2024-11-30 06:49:14'),
(648, 1, '674aa780127d9', '1efaedee-b059-6d2a-8481-de0243015667', '1508783', '1508783', 'win', 'balance_bonus', 0.08, 'play_fiver', 0, 1, '674aa780127d9', '2024-11-30 06:49:54', '2024-11-30 06:49:54'),
(649, 1, '674aa782c43eb', '1efaedee-ca5e-6bf8-a5bb-9a4dca826793', '1508783', '1508783', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674aa782c43eb', '2024-11-30 06:49:57', '2024-11-30 06:49:57'),
(650, 1, '674aa7953bc96', '1efaedef-7a3c-6674-aa4c-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7953bc96', '2024-11-30 06:50:15', '2024-11-30 06:50:15'),
(651, 1, '674aa7967a4f8', '1efaedef-8637-68c0-80e2-4ebf11973920', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7967a4f8', '2024-11-30 06:50:16', '2024-11-30 06:50:16'),
(652, 1, '674aa797b6e52', '1efaedef-921e-653a-93a4-4ebf11973920', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa797b6e52', '2024-11-30 06:50:18', '2024-11-30 06:50:18'),
(653, 1, '674aa7990f03b', '1efaedef-9ea2-6dba-888a-16d7e5167dd9', '1508783', '1508783', 'win', 'balance_bonus', 0.06, 'play_fiver', 0, 1, '674aa7990f03b', '2024-11-30 06:50:19', '2024-11-30 06:50:19'),
(654, 1, '674aa79b2e6eb', '1efaedef-b2ef-6476-bcbd-7eaa73477af8', '1508783', '1508783', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674aa79b2e6eb', '2024-11-30 06:50:21', '2024-11-30 06:50:21'),
(655, 1, '674aa79de01a1', '1efaedef-ccf3-60ac-a326-16d7e5167dd9', '1508783', '1508783', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674aa79de01a1', '2024-11-30 06:50:24', '2024-11-30 06:50:24'),
(656, 1, '674aa7a36ce54', '1efaedf0-01ab-6286-9572-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7a36ce54', '2024-11-30 06:50:29', '2024-11-30 06:50:29'),
(657, 1, '674aa7a4e6adc', '1efaedf0-0ff6-675a-b163-16d7e5167dd9', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7a4e6adc', '2024-11-30 06:50:31', '2024-11-30 06:50:31'),
(658, 1, '674aa7a81acc6', '1efaedf0-2e25-6474-a5bd-16d7e5167dd9', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7a81acc6', '2024-11-30 06:50:34', '2024-11-30 06:50:34'),
(659, 1, '674aa7ab2b2c7', '1efaedf0-4b65-63cc-976b-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7ab2b2c7', '2024-11-30 06:50:37', '2024-11-30 06:50:37'),
(660, 1, '674aa7ac50883', '1efaedf0-5664-637c-a263-4ebf11973920', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7ac50883', '2024-11-30 06:50:38', '2024-11-30 06:50:38'),
(661, 1, '674aa7ad8c10d', '1efaedf0-6240-6ee8-b083-7eaa73477af8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7ad8c10d', '2024-11-30 06:50:40', '2024-11-30 06:50:40'),
(662, 1, '674aa7aeb29b5', '1efaedf0-6d4b-6cfc-b58c-0ed3fa63cf91', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7aeb29b5', '2024-11-30 06:50:41', '2024-11-30 06:50:41'),
(663, 1, '674aa7afe01c6', '1efaedf0-789c-6372-b9a3-66a750d10041', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7afe01c6', '2024-11-30 06:50:42', '2024-11-30 06:50:42'),
(664, 1, '674aa7b11f57b', '1efaedf0-8427-65fc-af3b-66a750d10041', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7b11f57b', '2024-11-30 06:50:43', '2024-11-30 06:50:43'),
(665, 1, '674aa7b244d30', '1efaedf0-8f27-68b2-b567-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7b244d30', '2024-11-30 06:50:44', '2024-11-30 06:50:44'),
(666, 1, '674aa7b380cbd', '1efaedf0-9b08-6b22-89fb-7eaa73477af8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7b380cbd', '2024-11-30 06:50:45', '2024-11-30 06:50:45'),
(667, 1, '674aa7b560332', '1efaedf0-acd5-68e6-8d70-92c769b5bf49', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7b560332', '2024-11-30 06:50:47', '2024-11-30 06:50:47'),
(668, 1, '674aa7b8791e9', '1efaedf0-ca6b-6536-b61f-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7b8791e9', '2024-11-30 06:50:50', '2024-11-30 06:50:50'),
(669, 1, '674aa7b9af29e', '1efaedf0-d610-6c92-b85f-0ed3fa63cf91', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7b9af29e', '2024-11-30 06:50:52', '2024-11-30 06:50:52'),
(670, 1, '674aa7baced64', '1efaedf0-e0d6-6f0a-a2c5-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7baced64', '2024-11-30 06:50:53', '2024-11-30 06:50:53'),
(671, 1, '674aa7bc92a24', '1efaedf0-f18f-6b62-b468-16d7e5167dd9', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa7bc92a24', '2024-11-30 06:50:55', '2024-11-30 06:50:55'),
(672, 1, '674aa835b4965', '1efaedf5-74d5-66da-acee-92c769b5bf49', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa835b4965', '2024-11-30 06:52:56', '2024-11-30 06:52:56'),
(673, 1, '674aa836d5ef6', '1efaedf5-7fac-646e-818f-ae9eb9188ca0', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa836d5ef6', '2024-11-30 06:52:57', '2024-11-30 06:52:57'),
(674, 1, '674aa8380ff56', '1efaedf5-8b03-636c-9fa9-ae9eb9188ca0', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8380ff56', '2024-11-30 06:52:58', '2024-11-30 06:52:58'),
(675, 1, '674aa8391b1a5', '1efaedf5-94fc-6620-8eb1-ae9eb9188ca0', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8391b1a5', '2024-11-30 06:52:59', '2024-11-30 06:52:59'),
(676, 1, '674aa83a21c29', '1efaedf5-9ec8-63ca-8f82-6250bc99000c', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa83a21c29', '2024-11-30 06:53:00', '2024-11-30 06:53:00'),
(677, 1, '674aa83b46d3e', '1efaedf5-a9c4-6cd8-bba8-4ebf11973920', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa83b46d3e', '2024-11-30 06:53:01', '2024-11-30 06:53:01'),
(678, 1, '674aa83c49e2a', '1efaedf5-b36c-645c-80f0-0ed3fa63cf91', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa83c49e2a', '2024-11-30 06:53:02', '2024-11-30 06:53:02'),
(679, 1, '674aa83d77b5b', '1efaedf5-bebf-6e58-af37-4ebf11973920', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa83d77b5b', '2024-11-30 06:53:03', '2024-11-30 06:53:03'),
(680, 1, '674aa83e97a7a', '1efaedf5-c988-6b78-992a-7eaa73477af8', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa83e97a7a', '2024-11-30 06:53:05', '2024-11-30 06:53:05'),
(681, 1, '674aa884ec721', '1efaedf8-686b-6126-a4fb-7eaa73477af8', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa884ec721', '2024-11-30 06:54:15', '2024-11-30 06:54:15'),
(682, 1, '674aa888261d6', '1efaedf8-86d1-64ee-9d18-4ebf11973920', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa888261d6', '2024-11-30 06:54:18', '2024-11-30 06:54:18'),
(683, 1, '674aa88caa08c', '1efaedf8-b21e-643a-afec-6250bc99000c', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa88caa08c', '2024-11-30 06:54:23', '2024-11-30 06:54:23'),
(684, 1, '674aa88d9c1b5', '1efaedf8-bb1c-65d2-959d-6250bc99000c', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa88d9c1b5', '2024-11-30 06:54:24', '2024-11-30 06:54:24'),
(685, 1, '674aa88e83578', '1efaedf8-c3ae-61aa-957f-6250bc99000c', '1508783', '1508783', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674aa88e83578', '2024-11-30 06:54:24', '2024-11-30 06:54:24'),
(686, 1, '674aa8906268b', '1efaedf8-d577-6922-93b1-0ed3fa63cf91', '1508783', '1508783', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674aa8906268b', '2024-11-30 06:54:26', '2024-11-30 06:54:26'),
(687, 1, '674aa892946af', '1efaedf8-ea7e-6cda-917e-ae9eb9188ca0', '1508783', '1508783', 'win', 'balance', 0.16, 'play_fiver', 0, 1, '674aa892946af', '2024-11-30 06:54:29', '2024-11-30 06:54:29'),
(688, 1, '674aa89838f89', '1efaedf9-2024-6f9c-9bdd-6250bc99000c', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa89838f89', '2024-11-30 06:54:34', '2024-11-30 06:54:34'),
(689, 1, '674aa89955a84', '1efaedf9-2acc-6bac-8b64-7eaa73477af8', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa89955a84', '2024-11-30 06:54:35', '2024-11-30 06:54:35'),
(690, 1, '674aa89a4537a', '1efaedf9-33b1-6c40-880d-16d7e5167dd9', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa89a4537a', '2024-11-30 06:54:37', '2024-11-30 06:54:37'),
(691, 1, '674aa89b3547c', '1efaedf9-3c9b-6db0-aa13-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa89b3547c', '2024-11-30 06:54:37', '2024-11-30 06:54:37'),
(692, 1, '674aa89c0dd65', '1efaedf9-449a-6c00-ae9e-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa89c0dd65', '2024-11-30 06:54:38', '2024-11-30 06:54:38'),
(693, 1, '674aa89cdfed7', '1efaedf9-4cd0-62d0-99d7-66a750d10041', '1508783', '1508783', 'win', 'balance', 0.06, 'play_fiver', 0, 1, '674aa89cdfed7', '2024-11-30 06:54:39', '2024-11-30 06:54:39'),
(694, 1, '674aa89eb531e', '1efaedf9-5e37-623a-9785-6250bc99000c', '1508783', '1508783', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674aa89eb531e', '2024-11-30 06:54:41', '2024-11-30 06:54:41'),
(695, 1, '674aa8a12625d', '1efaedf9-753c-6e9e-bc86-4ebf11973920', '1508783', '1508783', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674aa8a12625d', '2024-11-30 06:54:44', '2024-11-30 06:54:44'),
(696, 1, '674aa8a80b1ab', '1efaedf9-b6f0-6354-8b33-92c769b5bf49', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8a80b1ab', '2024-11-30 06:54:51', '2024-11-30 06:54:51'),
(697, 1, '674aa8a91ec37', '1efaedf9-c13e-68d8-8cc1-7eaa73477af8', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8a91ec37', '2024-11-30 06:54:51', '2024-11-30 06:54:51'),
(698, 1, '674aa8aa3dd43', '1efaedf9-cbfe-658e-97c4-6250bc99000c', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8aa3dd43', '2024-11-30 06:54:53', '2024-11-30 06:54:53'),
(699, 1, '674aa8ab5da6c', '1efaedf9-d6c5-6e36-acd6-4ebf11973920', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8ab5da6c', '2024-11-30 06:54:54', '2024-11-30 06:54:54'),
(700, 1, '674aa8ac7bdbc', '1efaedf9-e17d-677a-89bc-0ed3fa63cf91', '1508783', '1508783', 'win', 'balance', 0.02, 'play_fiver', 0, 1, '674aa8ac7bdbc', '2024-11-30 06:54:54', '2024-11-30 06:54:54'),
(701, 1, '674aa8acc0c17', '1efaedf9-e42e-6c30-a08b-0ed3fa63cf91', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8acc0c17', '2024-11-30 06:54:55', '2024-11-30 06:54:55'),
(702, 1, '674aa8adc5592', '1efaedf9-ede5-6e04-940d-16d7e5167dd9', '1635221', '1635221', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674aa8adc5592', '2024-11-30 06:54:56', '2024-11-30 06:54:56'),
(703, 1, '674aa8b2106c1', '1efaedfa-1683-696a-9673-7eaa73477af8', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8b2106c1', '2024-11-30 06:55:00', '2024-11-30 06:55:00'),
(704, 1, '674aa8b232b46', '1efaedfa-17da-65d4-a5e7-92c769b5bf49', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8b232b46', '2024-11-30 06:55:00', '2024-11-30 06:55:00'),
(705, 1, '674aa8b337f07', '1efaedfa-2197-6f5e-80a2-16d7e5167dd9', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8b337f07', '2024-11-30 06:55:01', '2024-11-30 06:55:01'),
(706, 1, '674aa8b31995e', '1efaedfa-2068-67d2-a0b9-16d7e5167dd9', '1635221', '1635221', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674aa8b31995e', '2024-11-30 06:55:01', '2024-11-30 06:55:01'),
(707, 1, '674aa8b428c2e', '1efaedfa-2a8a-63b4-8f09-92c769b5bf49', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8b428c2e', '2024-11-30 06:55:02', '2024-11-30 06:55:02'),
(708, 1, '674aa8b516edf', '1efaedfa-3361-6e60-a0fd-7eaa73477af8', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8b516edf', '2024-11-30 06:55:03', '2024-11-30 06:55:03'),
(709, 1, '674aa8b61afa7', '1efaedfa-3d12-6ce8-96f9-0ed3fa63cf91', '1508783', '1508783', 'win', 'balance', 0.06, 'play_fiver', 0, 1, '674aa8b61afa7', '2024-11-30 06:55:04', '2024-11-30 06:55:04'),
(710, 1, '674aa8b7e3ba7', '1efaedfa-4e73-6a1e-a465-0ed3fa63cf91', '1508783', '1508783', 'win', 'balance', 0.04, 'play_fiver', 0, 1, '674aa8b7e3ba7', '2024-11-30 06:55:06', '2024-11-30 06:55:06'),
(711, 1, '674aa8ba56003', '1efaedfa-6586-6792-ab5c-0ed3fa63cf91', '1508783', '1508783', 'win', 'balance', 1.60, 'play_fiver', 0, 1, '674aa8ba56003', '2024-11-30 06:55:08', '2024-11-30 06:55:08'),
(712, 1, '674aa8bb863ab', '1efaedfa-70f2-643c-8be6-7eaa73477af8', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8bb863ab', '2024-11-30 06:55:10', '2024-11-30 06:55:10'),
(713, 1, '674aa8bc5700f', '1efaedfa-78a3-6866-90bd-ae9eb9188ca0', '1635221', '1635221', 'win', 'balance_bonus', 3.20, 'play_fiver', 0, 1, '674aa8bc5700f', '2024-11-30 06:55:11', '2024-11-30 06:55:11'),
(714, 1, '674aa8bfd8ad6', '1efaedfa-9a50-6e0a-a18d-4ebf11973920', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8bfd8ad6', '2024-11-30 06:55:14', '2024-11-30 06:55:14'),
(715, 1, '674aa8c0bbc52', '1efaedfa-a2b8-6b1a-a3c4-7eaa73477af8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c0bbc52', '2024-11-30 06:55:15', '2024-11-30 06:55:15'),
(716, 1, '674aa8c19348f', '1efaedfa-aaad-6460-8d72-6250bc99000c', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c19348f', '2024-11-30 06:55:16', '2024-11-30 06:55:16'),
(717, 1, '674aa8c269e4e', '1efaedfa-b298-6da0-82f1-7eaa73477af8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c269e4e', '2024-11-30 06:55:17', '2024-11-30 06:55:17'),
(718, 1, '674aa8c40665b', '1efaedfa-c1c9-604a-940b-ae9eb9188ca0', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c40665b', '2024-11-30 06:55:18', '2024-11-30 06:55:18'),
(719, 1, '674aa8c50b796', '1efaedfa-cb84-6d32-a3eb-66a750d10041', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c50b796', '2024-11-30 06:55:19', '2024-11-30 06:55:19'),
(720, 1, '674aa8c5e59ba', '1efaedfa-d40a-61dc-a99d-6250bc99000c', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c5e59ba', '2024-11-30 06:55:20', '2024-11-30 06:55:20'),
(721, 1, '674aa8c661dea', '1efaedfa-d86e-623c-bc2c-4ebf11973920', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c661dea', '2024-11-30 06:55:20', '2024-11-30 06:55:20'),
(722, 1, '674aa8c6d6c09', '1efaedfa-dcff-6184-8f09-4ebf11973920', '1508783', '1508783', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa8c6d6c09', '2024-11-30 06:55:21', '2024-11-30 06:55:21'),
(723, 1, '674aa8c78eb29', '1efaedfa-e3b8-6494-ada8-16d7e5167dd9', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c78eb29', '2024-11-30 06:55:22', '2024-11-30 06:55:22'),
(724, 1, '674aa8c9462b9', '1efaedfa-f3f5-6596-b54e-4ebf11973920', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8c9462b9', '2024-11-30 06:55:23', '2024-11-30 06:55:23'),
(725, 1, '674aa8cb486b2', '1efaedfb-071e-6a32-a522-7eaa73477af8', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa8cb486b2', '2024-11-30 06:55:25', '2024-11-30 06:55:25'),
(726, 1, '674aa8cf4b671', '1efaedfb-2d62-63b0-899f-7eaa73477af8', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8cf4b671', '2024-11-30 06:55:29', '2024-11-30 06:55:29'),
(727, 1, '674aa8d20e200', '1efaedfb-4799-6954-b237-7eaa73477af8', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8d20e200', '2024-11-30 06:55:32', '2024-11-30 06:55:32'),
(728, 1, '674aa8d4cf9c3', '1efaedfb-623b-64f6-9ffa-92c769b5bf49', '1635221', '1635221', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674aa8d4cf9c3', '2024-11-30 06:55:35', '2024-11-30 06:55:35'),
(729, 1, '674aa95be7bcf', '1efaee00-6aa2-65e0-ad93-0ed3fa63cf91', '126', '126', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '674aa95be7bcf', '2024-11-30 06:57:50', '2024-11-30 06:57:50'),
(730, 1, '674aa95d7f83c', '1efaee00-79a3-60ee-8aac-4ebf11973920', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa95d7f83c', '2024-11-30 06:57:52', '2024-11-30 06:57:52'),
(731, 1, '674aa95e7bc57', '1efaee00-8307-6c16-8b8d-4ebf11973920', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa95e7bc57', '2024-11-30 06:57:53', '2024-11-30 06:57:53'),
(732, 1, '674aa96048805', '1efaee00-9419-66da-b6f4-4ebf11973920', '126', '126', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674aa96048805', '2024-11-30 06:57:55', '2024-11-30 06:57:55'),
(733, 1, '674aa9620e124', '1efaee00-a4e3-6b64-892b-92c769b5bf49', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa9620e124', '2024-11-30 06:57:56', '2024-11-30 06:57:56'),
(734, 1, '674aa9632b7c7', '1efaee00-af93-6122-bf9d-16d7e5167dd9', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa9632b7c7', '2024-11-30 06:57:57', '2024-11-30 06:57:57'),
(735, 1, '674aa9642e233', '1efaee00-b936-6fbc-9302-66a750d10041', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa9642e233', '2024-11-30 06:57:58', '2024-11-30 06:57:58'),
(736, 1, '674aa965d4c0a', '1efaee00-c942-68de-959c-92c769b5bf49', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa965d4c0a', '2024-11-30 06:58:00', '2024-11-30 06:58:00'),
(737, 1, '674aa966df6d1', '1efaee00-d337-604c-8b4c-66a750d10041', '126', '126', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aa966df6d1', '2024-11-30 06:58:01', '2024-11-30 06:58:01'),
(738, 1, '674aa96895ef8', '1efaee00-e36a-695a-ac60-7eaa73477af8', '126', '126', 'win', 'balance_bonus', 1.04, 'play_fiver', 0, 1, '674aa96895ef8', '2024-11-30 06:58:02', '2024-11-30 06:58:02'),
(739, 1, '674aa96a6bc33', '1efaee00-f4d7-6bc0-86bf-16d7e5167dd9', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '674aa96a6bc33', '2024-11-30 06:58:04', '2024-11-30 06:58:04'),
(740, 1, '674aa96c4d4d1', '1efaee01-06ba-6108-bf97-6250bc99000c', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '674aa96c4d4d1', '2024-11-30 06:58:06', '2024-11-30 06:58:06'),
(741, 1, '674aa96c11f38', '1efaee01-0468-6652-a223-92c769b5bf49', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aa96c11f38', '2024-11-30 06:58:07', '2024-11-30 06:58:07'),
(742, 1, '674aa96d23f33', '1efaee01-0ea5-6dfe-b929-66a750d10041', '126', '126', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '674aa96d23f33', '2024-11-30 06:58:08', '2024-11-30 06:58:08'),
(743, 1, '674aa96f9fd24', '1efaee01-268f-64e2-a859-7eaa73477af8', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '674aa96f9fd24', '2024-11-30 06:58:10', '2024-11-30 06:58:10'),
(744, 1, '674aa97088feb', '1efaee01-2f34-6db8-b7d0-7eaa73477af8', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '674aa97088feb', '2024-11-30 06:58:10', '2024-11-30 06:58:10'),
(745, 1, '674aa97155794', '1efaee01-36ba-6a06-9ab7-6250bc99000c', '126', '126', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '674aa97155794', '2024-11-30 06:58:11', '2024-11-30 06:58:11'),
(746, 1, '674aa97302fe1', '1efaee01-4694-6760-b654-ae9eb9188ca0', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '674aa97302fe1', '2024-11-30 06:58:13', '2024-11-30 06:58:13'),
(747, 1, '674aa973e1407', '1efaee01-4f43-642e-a4c3-16d7e5167dd9', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '674aa973e1407', '2024-11-30 06:58:14', '2024-11-30 06:58:14'),
(748, 1, '674aa9759fd81', '1efaee01-5fc8-60e2-be7c-16d7e5167dd9', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '674aa9759fd81', '2024-11-30 06:58:16', '2024-11-30 06:58:16'),
(749, 1, '674aa976c256a', '1efaee01-6aaa-653c-85e6-ae9eb9188ca0', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '674aa976c256a', '2024-11-30 06:58:17', '2024-11-30 06:58:17'),
(750, 1, '674aa97891514', '1efaee01-7bd3-605c-bf8e-92c769b5bf49', '126', '126', 'win', 'balance_bonus', 6.40, 'play_fiver', 0, 1, '674aa97891514', '2024-11-30 06:58:19', '2024-11-30 06:58:19'),
(751, 1, '674aa97a6753f', '1efaee01-8d42-6068-8416-ae9eb9188ca0', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '674aa97a6753f', '2024-11-30 06:58:20', '2024-11-30 06:58:20'),
(752, 1, '674aa97b4da6c', '1efaee01-95ca-687a-8c85-16d7e5167dd9', '126', '126', 'bet', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '674aa97b4da6c', '2024-11-30 06:58:21', '2024-11-30 06:58:21'),
(753, 1, '674aa97c1c354', '1efaee01-9d65-69f4-9060-16d7e5167dd9', '126', '126', 'win', 'balance_bonus', 4.00, 'play_fiver', 0, 1, '674aa97c1c354', '2024-11-30 06:58:22', '2024-11-30 06:58:22'),
(754, 1, '674aaa2f963bf', '1efaee08-4d3d-6eac-aae5-ae9eb9188ca0', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaa2f963bf', '2024-11-30 07:01:22', '2024-11-30 07:01:22'),
(755, 1, '674aaa5109115', '1efaee09-8bf9-69ba-8305-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaa5109115', '2024-11-30 07:01:55', '2024-11-30 07:01:55'),
(756, 1, '674aaa51bf779', '1efaee09-9319-695c-862a-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaa51bf779', '2024-11-30 07:01:56', '2024-11-30 07:01:56'),
(757, 1, '674aaa52b472e', '1efaee09-9c34-6dfc-a43b-0ed3fa63cf91', '1682240', '1682240', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674aaa52b472e', '2024-11-30 07:01:57', '2024-11-30 07:01:57'),
(758, 1, '674aaa56bff2d', '1efaee09-c2cd-691e-86e8-16d7e5167dd9', '1682240', '1682240', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '674aaa56bff2d', '2024-11-30 07:02:01', '2024-11-30 07:02:01');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(759, 1, '674aaa613c921', '1efaee0a-2693-62be-8f33-4ebf11973920', '1682240', '1682240', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '674aaa613c921', '2024-11-30 07:02:11', '2024-11-30 07:02:11'),
(760, 1, '674aaa6b77559', '1efaee0a-883c-6dd0-9bbd-ae9eb9188ca0', '1682240', '1682240', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '674aaa6b77559', '2024-11-30 07:02:22', '2024-11-30 07:02:22'),
(761, 1, '674aaa74e3ea9', '1efaee0a-e24f-655c-86d4-16d7e5167dd9', '1682240', '1682240', 'win', 'balance', 20.00, 'play_fiver', 0, 1, '674aaa74e3ea9', '2024-11-30 07:02:31', '2024-11-30 07:02:31'),
(762, 1, '674aaa952cb0b', '1efaee0c-15dd-6968-8662-7eaa73477af8', '1682240', '1682240', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674aaa952cb0b', '2024-11-30 07:03:03', '2024-11-30 07:03:03'),
(763, 1, '674aaa9dd6cae', '1efaee0c-68cd-6bdc-b672-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaa9dd6cae', '2024-11-30 07:03:12', '2024-11-30 07:03:12'),
(764, 1, '674aaa9f0b8b5', '1efaee0c-73f0-6104-a161-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaa9f0b8b5', '2024-11-30 07:03:13', '2024-11-30 07:03:13'),
(765, 1, '674aaa9fced01', '1efaee0c-7b90-6b8e-a03f-ae9eb9188ca0', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaa9fced01', '2024-11-30 07:03:14', '2024-11-30 07:03:14'),
(766, 1, '674aaaa0cdd13', '1efaee0c-8510-634e-9879-ae9eb9188ca0', '1682240', '1682240', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaa0cdd13', '2024-11-30 07:03:15', '2024-11-30 07:03:15'),
(767, 1, '674aaaa60b677', '1efaee0c-b6b0-6908-b8d1-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaa60b677', '2024-11-30 07:03:20', '2024-11-30 07:03:20'),
(768, 1, '674aaaa70d456', '1efaee0c-c04c-6c50-ba77-0ed3fa63cf91', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaa70d456', '2024-11-30 07:03:21', '2024-11-30 07:03:21'),
(769, 1, '674aaaa7d1836', '1efaee0c-c7f6-6f78-9d19-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaa7d1836', '2024-11-30 07:03:22', '2024-11-30 07:03:22'),
(770, 1, '674aaaa8b9055', '1efaee0c-d08b-674c-9cdf-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaa8b9055', '2024-11-30 07:03:23', '2024-11-30 07:03:23'),
(771, 1, '674aaaa9a3797', '1efaee0c-d93d-664c-93ef-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaa9a3797', '2024-11-30 07:03:24', '2024-11-30 07:03:24'),
(772, 1, '674aaaaa7161d', '1efaee0c-e0d1-6da4-a0d8-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaaa7161d', '2024-11-30 07:03:24', '2024-11-30 07:03:24'),
(773, 1, '674aaaab4afd2', '1efaee0c-e8db-6658-9b41-4ebf11973920', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaab4afd2', '2024-11-30 07:03:25', '2024-11-30 07:03:25'),
(774, 1, '674aaaac1a721', '1efaee0c-f07f-654e-bda9-0ed3fa63cf91', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaac1a721', '2024-11-30 07:03:27', '2024-11-30 07:03:27'),
(775, 1, '674aaaacd7bd5', '1efaee0c-f7e4-6726-9cb7-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaacd7bd5', '2024-11-30 07:03:27', '2024-11-30 07:03:27'),
(776, 1, '674aaaadb23bf', '1efaee0c-fff6-6a2c-8c3b-ae9eb9188ca0', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaadb23bf', '2024-11-30 07:03:28', '2024-11-30 07:03:28'),
(777, 1, '674aaaae8a002', '1efaee0d-07ed-6b0e-9b92-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaae8a002', '2024-11-30 07:03:29', '2024-11-30 07:03:29'),
(778, 1, '674aaaaf60f97', '1efaee0d-0fdc-6ed2-a2d4-ae9eb9188ca0', '1682240', '1682240', 'win', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aaaaf60f97', '2024-11-30 07:03:29', '2024-11-30 07:03:29'),
(779, 1, '674aaab30967b', '1efaee0d-3296-6e1e-ab36-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaab30967b', '2024-11-30 07:03:33', '2024-11-30 07:03:33'),
(780, 1, '674aaab410e9e', '1efaee0d-3c6b-641c-bca8-0ed3fa63cf91', '1682240', '1682240', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaab410e9e', '2024-11-30 07:03:34', '2024-11-30 07:03:34'),
(781, 1, '674aaab6d6dbb', '1efaee0d-5739-6aa0-83f6-4ebf11973920', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaab6d6dbb', '2024-11-30 07:03:37', '2024-11-30 07:03:37'),
(782, 1, '674aaab7e9a94', '1efaee0d-617f-632a-b683-16d7e5167dd9', '1682240', '1682240', 'win', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '674aaab7e9a94', '2024-11-30 07:03:38', '2024-11-30 07:03:38'),
(783, 1, '674aaabb0f5af', '1efaee0d-7f1d-6b20-b12c-7eaa73477af8', '1682240', '1682240', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aaabb0f5af', '2024-11-30 07:03:41', '2024-11-30 07:03:41'),
(784, 1, '674aaabf0be06', '1efaee0d-a520-69b2-b244-0ed3fa63cf91', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaabf0be06', '2024-11-30 07:03:45', '2024-11-30 07:03:45'),
(785, 1, '674aaac00ab89', '1efaee0d-ae9e-66b0-a5d7-4ebf11973920', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac00ab89', '2024-11-30 07:03:47', '2024-11-30 07:03:47'),
(786, 1, '674aaac0c95b6', '1efaee0d-b610-6e98-9d34-0ed3fa63cf91', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac0c95b6', '2024-11-30 07:03:47', '2024-11-30 07:03:47'),
(787, 1, '674aaac19d9ef', '1efaee0d-bde4-6d4a-a37d-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac19d9ef', '2024-11-30 07:03:48', '2024-11-30 07:03:48'),
(788, 1, '674aaac27cb87', '1efaee0d-c625-645a-a841-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac27cb87', '2024-11-30 07:03:49', '2024-11-30 07:03:49'),
(789, 1, '674aaac381913', '1efaee0d-cfdf-607c-a49b-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac381913', '2024-11-30 07:03:50', '2024-11-30 07:03:50'),
(790, 1, '674aaac4c27a6', '1efaee0d-dbf1-68c4-b88b-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac4c27a6', '2024-11-30 07:03:51', '2024-11-30 07:03:51'),
(791, 1, '674aaac66d39c', '1efaee0d-ebaf-6b1c-88a3-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaac66d39c', '2024-11-30 07:03:52', '2024-11-30 07:03:52'),
(792, 1, '674aaac7ebc15', '1efaee0d-fa2a-6dc2-a93a-7eaa73477af8', '1682240', '1682240', 'win', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aaac7ebc15', '2024-11-30 07:03:54', '2024-11-30 07:03:54'),
(793, 1, '674aaacb5b5f2', '1efaee0e-1aac-67bc-a6c5-4ebf11973920', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaacb5b5f2', '2024-11-30 07:03:58', '2024-11-30 07:03:58'),
(794, 1, '674aaacc557a4', '1efaee0e-23fa-6a08-94cd-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaacc557a4', '2024-11-30 07:03:58', '2024-11-30 07:03:58'),
(795, 1, '674aaacd19d30', '1efaee0e-2b2f-6814-a914-4ebf11973920', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaacd19d30', '2024-11-30 07:03:59', '2024-11-30 07:03:59'),
(796, 1, '674aaacde5582', '1efaee0e-3322-6c88-a7e0-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaacde5582', '2024-11-30 07:04:00', '2024-11-30 07:04:00'),
(797, 1, '674aaace9bc19', '1efaee0e-39cc-63fe-861e-0ed3fa63cf91', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaace9bc19', '2024-11-30 07:04:01', '2024-11-30 07:04:01'),
(798, 1, '674aaacf5c442', '1efaee0e-40da-6e2a-a64c-ae9eb9188ca0', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaacf5c442', '2024-11-30 07:04:01', '2024-11-30 07:04:01'),
(799, 1, '674aaad04865f', '1efaee0e-499d-672e-9bcb-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaad04865f', '2024-11-30 07:04:02', '2024-11-30 07:04:02'),
(800, 1, '674aaadc81078', '1efaee0e-be45-65e0-8f85-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaadc81078', '2024-11-30 07:04:15', '2024-11-30 07:04:15'),
(801, 1, '674aaadd42eca', '1efaee0e-c561-6338-81aa-7eaa73477af8', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaadd42eca', '2024-11-30 07:04:15', '2024-11-30 07:04:15'),
(802, 1, '674aaade12d91', '1efaee0e-cd09-6a5e-a7d6-92c769b5bf49', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaade12d91', '2024-11-30 07:04:17', '2024-11-30 07:04:17'),
(803, 1, '674aaadecf988', '1efaee0e-d469-6664-bfed-4ebf11973920', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaadecf988', '2024-11-30 07:04:17', '2024-11-30 07:04:17'),
(804, 1, '674aaae93b11c', '1efaee0f-3783-6786-af66-0ed3fa63cf91', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaae93b11c', '2024-11-30 07:04:27', '2024-11-30 07:04:27'),
(805, 1, '674aaaea05085', '1efaee0f-3ef0-65dc-896c-16d7e5167dd9', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaea05085', '2024-11-30 07:04:28', '2024-11-30 07:04:28'),
(806, 1, '674aaaeb0b649', '1efaee0f-48b9-6744-b107-ae9eb9188ca0', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaaeb0b649', '2024-11-30 07:04:29', '2024-11-30 07:04:29'),
(807, 1, '674aaaecb08d1', '1efaee0f-58b6-6714-bfda-7eaa73477af8', '1682240', '1682240', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674aaaecb08d1', '2024-11-30 07:04:31', '2024-11-30 07:04:31'),
(808, 1, '674aaaf147e96', '1efaee0f-844f-6358-ab5e-92c769b5bf49', '1682240', '1682240', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '674aaaf147e96', '2024-11-30 07:04:35', '2024-11-30 07:04:35'),
(809, 1, '674aaafeab942', '1efaee10-042e-60e2-8f4c-16d7e5167dd9', '1682240', '1682240', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '674aaafeab942', '2024-11-30 07:04:49', '2024-11-30 07:04:49'),
(810, 1, '674aab0680048', '1efaee10-4ec5-6a9c-9eae-16d7e5167dd9', '1682240', '1682240', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '674aab0680048', '2024-11-30 07:04:57', '2024-11-30 07:04:57'),
(811, 1, '674aab1101647', '1efaee10-b2ba-6e8a-974d-92c769b5bf49', '1682240', '1682240', 'win', 'balance', 20.00, 'play_fiver', 0, 1, '674aab1101647', '2024-11-30 07:05:07', '2024-11-30 07:05:07'),
(812, 1, '674aab32101c3', '1efaee11-ee04-69a4-b9c2-4ebf11973920', '1682240', '1682240', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '674aab32101c3', '2024-11-30 07:05:40', '2024-11-30 07:05:40'),
(813, 1, '674aab9a3e160', '1efaee15-cfa3-63da-9aae-7628779ffd60', '1635221', '1635221', 'win', 'balance_bonus', 3.20, 'play_fiver', 0, 1, '674aab9a3e160', '2024-11-30 07:07:24', '2024-11-30 07:07:24'),
(814, 1, '674aaba3ec3c5', '1efaee16-2c44-697c-9902-7628779ffd60', '1635221', '1635221', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaba3ec3c5', '2024-11-30 07:07:35', '2024-11-30 07:07:35'),
(815, 1, '674aaba4c36f3', '1efaee16-3436-687e-899c-c602522cff26', '1635221', '1635221', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '674aaba4c36f3', '2024-11-30 07:07:35', '2024-11-30 07:07:35'),
(816, 1, '674aabae2bb67', '1efaee16-8da6-6e9a-ac92-7628779ffd60', '1635221', '1635221', 'win', 'balance_bonus', 1.60, 'play_fiver', 0, 1, '674aabae2bb67', '2024-11-30 07:07:44', '2024-11-30 07:07:44'),
(817, 1, '674aabbe4ef70', '1efaee17-279e-603e-9a61-7628779ffd60', '1635221', '1635221', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aabbe4ef70', '2024-11-30 07:08:00', '2024-11-30 07:08:00'),
(818, 1, '674aabc253a5e', '1efaee17-4df2-688e-a746-7628779ffd60', '1635221', '1635221', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aabc253a5e', '2024-11-30 07:08:04', '2024-11-30 07:08:04'),
(819, 1, '674aabd59f4fd', '1efaee18-0619-6bb0-9c58-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance_bonus', 0.02, 'play_fiver', 0, 1, '674aabd59f4fd', '2024-11-30 07:08:24', '2024-11-30 07:08:24'),
(820, 1, '674aabdadc3b3', '1efaee18-382a-600a-822e-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance_bonus', 0.04, 'play_fiver', 0, 1, '674aabdadc3b3', '2024-11-30 07:08:29', '2024-11-30 07:08:29'),
(821, 1, '674aabe04d238', '1efaee18-6bcb-66ac-b7d6-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance_bonus', 0.04, 'play_fiver', 0, 1, '674aabe04d238', '2024-11-30 07:08:34', '2024-11-30 07:08:34'),
(822, 1, '674aabe26c4cb', '1efaee18-8015-6e46-b03c-c602522cff26', '1508783', '1508783', 'win', 'balance', 0.40, 'play_fiver', 0, 1, '674aabe26c4cb', '2024-11-30 07:08:36', '2024-11-30 07:08:36'),
(823, 1, '674aabe4e0d9f', '1efaee18-97b6-6280-a0f6-7628779ffd60', '1508783', '1508783', 'win', 'balance', 0.32, 'play_fiver', 0, 1, '674aabe4e0d9f', '2024-11-30 07:08:39', '2024-11-30 07:08:39'),
(824, 1, '674aabeac5807', '1efaee18-cfdd-6104-8433-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aabeac5807', '2024-11-30 07:08:45', '2024-11-30 07:08:45'),
(825, 1, '674aabec8c2de', '1efaee18-e0b2-6a88-a4c8-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance_bonus', 0.32, 'play_fiver', 0, 1, '674aabec8c2de', '2024-11-30 07:08:47', '2024-11-30 07:08:47'),
(826, 1, '674aabf052c3c', '1efaee19-049a-62f2-a542-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674aabf052c3c', '2024-11-30 07:08:50', '2024-11-30 07:08:50'),
(827, 1, '674aabf3080f4', '1efaee19-1e4b-671e-a63f-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance', 2.16, 'play_fiver', 0, 1, '674aabf3080f4', '2024-11-30 07:08:53', '2024-11-30 07:08:53'),
(828, 1, '674aac8d97a69', '1efaee1e-e090-62b6-8203-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac8d97a69', '2024-11-30 07:11:28', '2024-11-30 07:11:28'),
(829, 1, '674aac8ed5840', '1efaee1e-ec84-61da-91fb-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac8ed5840', '2024-11-30 07:11:29', '2024-11-30 07:11:29'),
(830, 1, '674aac8fe759e', '1efaee1e-f6bf-6c30-9148-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac8fe759e', '2024-11-30 07:11:30', '2024-11-30 07:11:30'),
(831, 1, '674aac915424b', '1efaee1f-0412-6cb6-911a-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac915424b', '2024-11-30 07:11:31', '2024-11-30 07:11:31'),
(832, 1, '674aac9287709', '1efaee1f-0f9d-62fc-bd03-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9287709', '2024-11-30 07:11:33', '2024-11-30 07:11:33'),
(833, 1, '674aac93a07c8', '1efaee1f-1a20-69ea-ba9d-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac93a07c8', '2024-11-30 07:11:34', '2024-11-30 07:11:34'),
(834, 1, '674aac94e7739', '1efaee1f-266f-6ad4-b0e9-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac94e7739', '2024-11-30 07:11:35', '2024-11-30 07:11:35'),
(835, 1, '674aac963c7a8', '1efaee1f-32d4-6c7a-be36-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac963c7a8', '2024-11-30 07:11:36', '2024-11-30 07:11:36'),
(836, 1, '674aac9772314', '1efaee1f-3e77-6730-8eba-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9772314', '2024-11-30 07:11:37', '2024-11-30 07:11:37'),
(837, 1, '674aac98b1d8f', '1efaee1f-4a7d-63fe-866e-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac98b1d8f', '2024-11-30 07:11:39', '2024-11-30 07:11:39'),
(838, 1, '674aac9a0cc45', '1efaee1f-571d-63c0-8600-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9a0cc45', '2024-11-30 07:11:40', '2024-11-30 07:11:40'),
(839, 1, '674aac9b3af59', '1efaee1f-6274-69bc-a23e-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9b3af59', '2024-11-30 07:11:41', '2024-11-30 07:11:41'),
(840, 1, '674aac9c4e8a5', '1efaee1f-6cc1-6f82-ad8c-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9c4e8a5', '2024-11-30 07:11:42', '2024-11-30 07:11:42'),
(841, 1, '674aac9d9469d', '1efaee1f-7906-60ae-9514-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9d9469d', '2024-11-30 07:11:44', '2024-11-30 07:11:44'),
(842, 1, '674aac9eb1432', '1efaee1f-83b0-61f8-a0aa-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aac9eb1432', '2024-11-30 07:11:45', '2024-11-30 07:11:45'),
(843, 1, '674aaca00537e', '1efaee1f-900a-687c-b62b-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca00537e', '2024-11-30 07:11:46', '2024-11-30 07:11:46'),
(844, 1, '674aaca14632f', '1efaee1f-9c1d-6ca4-8e2a-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca14632f', '2024-11-30 07:11:47', '2024-11-30 07:11:47'),
(845, 1, '674aaca27deaf', '1efaee1f-a7d4-600c-a68f-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca27deaf', '2024-11-30 07:11:48', '2024-11-30 07:11:48'),
(846, 1, '674aaca3943bb', '1efaee1f-b23c-6936-8354-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca3943bb', '2024-11-30 07:11:50', '2024-11-30 07:11:50'),
(847, 1, '674aaca49f8ff', '1efaee1f-bc37-667a-9e65-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca49f8ff', '2024-11-30 07:11:51', '2024-11-30 07:11:51'),
(848, 1, '674aaca5b277e', '1efaee1f-c67d-6ec2-a5a6-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca5b277e', '2024-11-30 07:11:52', '2024-11-30 07:11:52'),
(849, 1, '674aaca6e588d', '1efaee1f-d205-6c9a-9d19-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca6e588d', '2024-11-30 07:11:53', '2024-11-30 07:11:53'),
(850, 1, '674aaca7cfc78', '1efaee1f-dab5-6976-a9e1-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca7cfc78', '2024-11-30 07:11:54', '2024-11-30 07:11:54'),
(851, 1, '674aaca8e623b', '1efaee1f-e51e-6a52-b9e6-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca8e623b', '2024-11-30 07:11:55', '2024-11-30 07:11:55'),
(852, 1, '674aaca9f0068', '1efaee1f-ef0a-6ea8-8410-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaca9f0068', '2024-11-30 07:11:56', '2024-11-30 07:11:56'),
(853, 1, '674aacab0c48c', '1efaee1f-f938-645c-bd43-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacab0c48c', '2024-11-30 07:11:57', '2024-11-30 07:11:57'),
(854, 1, '674aacac19ad1', '1efaee20-0347-6998-8245-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacac19ad1', '2024-11-30 07:11:58', '2024-11-30 07:11:58'),
(855, 1, '674aacad2b919', '1efaee20-0d84-6302-b527-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacad2b919', '2024-11-30 07:11:59', '2024-11-30 07:11:59'),
(856, 1, '674aacb455f6e', '1efaee20-51ed-6fa2-b8be-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb455f6e', '2024-11-30 07:12:06', '2024-11-30 07:12:06'),
(857, 1, '674aacb532389', '1efaee20-5a11-6b5c-857c-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb532389', '2024-11-30 07:12:07', '2024-11-30 07:12:07'),
(858, 1, '674aacb61e089', '1efaee20-62d1-6436-8660-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb61e089', '2024-11-30 07:12:08', '2024-11-30 07:12:08'),
(859, 1, '674aacb6ea451', '1efaee20-6acc-61c2-9690-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb6ea451', '2024-11-30 07:12:10', '2024-11-30 07:12:10'),
(860, 1, '674aacb7c8da0', '1efaee20-7306-6eb4-874a-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb7c8da0', '2024-11-30 07:12:11', '2024-11-30 07:12:11'),
(861, 1, '674aacb8bbe82', '1efaee20-7c0e-6c96-a337-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb8bbe82', '2024-11-30 07:12:11', '2024-11-30 07:12:11'),
(862, 1, '674aacb99e59a', '1efaee20-8471-6122-9a44-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacb99e59a', '2024-11-30 07:12:12', '2024-11-30 07:12:12'),
(863, 1, '674aacba7ae74', '1efaee20-8c97-691e-9c18-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacba7ae74', '2024-11-30 07:12:12', '2024-11-30 07:12:12'),
(864, 1, '674aacbb5c9af', '1efaee20-94f1-6f7e-8d44-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacbb5c9af', '2024-11-30 07:12:13', '2024-11-30 07:12:13'),
(865, 1, '674aacbc3da51', '1efaee20-9d45-6ef0-867a-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacbc3da51', '2024-11-30 07:12:14', '2024-11-30 07:12:14'),
(866, 1, '674aacbd19367', '1efaee20-a563-683a-a05c-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacbd19367', '2024-11-30 07:12:15', '2024-11-30 07:12:15'),
(867, 1, '674aacbde7a61', '1efaee20-ad73-641c-8c13-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacbde7a61', '2024-11-30 07:12:16', '2024-11-30 07:12:16'),
(868, 1, '674aacbecba88', '1efaee20-b5e5-6064-b545-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacbecba88', '2024-11-30 07:12:17', '2024-11-30 07:12:17'),
(869, 1, '674aacbfaa342', '1efaee20-be1f-6a9a-b6e0-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacbfaa342', '2024-11-30 07:12:18', '2024-11-30 07:12:18'),
(870, 1, '674aacc0841dc', '1efaee20-c62c-62a6-a723-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc0841dc', '2024-11-30 07:12:19', '2024-11-30 07:12:19'),
(871, 1, '674aacc167fe4', '1efaee20-ce9c-68fa-bd0a-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc167fe4', '2024-11-30 07:12:19', '2024-11-30 07:12:19'),
(872, 1, '674aacc247cae', '1efaee20-d6e3-6fae-a61a-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc247cae', '2024-11-30 07:12:20', '2024-11-30 07:12:20'),
(873, 1, '674aacc32ae60', '1efaee20-df4c-6a1a-8bdd-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc32ae60', '2024-11-30 07:12:21', '2024-11-30 07:12:21'),
(874, 1, '674aacc41c9f8', '1efaee20-e846-6d82-b63b-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc41c9f8', '2024-11-30 07:12:22', '2024-11-30 07:12:22'),
(875, 1, '674aacc4eba46', '1efaee20-f05d-603e-9b14-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc4eba46', '2024-11-30 07:12:24', '2024-11-30 07:12:24'),
(876, 1, '674aacc5cab74', '1efaee20-f89d-62b2-b40e-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc5cab74', '2024-11-30 07:12:24', '2024-11-30 07:12:24'),
(877, 1, '674aacc6af079', '1efaee21-0111-6b00-9e14-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc6af079', '2024-11-30 07:12:25', '2024-11-30 07:12:25'),
(878, 1, '674aacc78ae38', '1efaee21-0931-6b82-8d5b-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc78ae38', '2024-11-30 07:12:26', '2024-11-30 07:12:26'),
(879, 1, '674aacc868203', '1efaee21-115f-6872-9a37-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc868203', '2024-11-30 07:12:26', '2024-11-30 07:12:26'),
(880, 1, '674aacc946086', '1efaee21-1993-6f98-a0d8-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacc946086', '2024-11-30 07:12:27', '2024-11-30 07:12:27'),
(881, 1, '674aacca251eb', '1efaee21-21d4-63b0-baa7-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacca251eb', '2024-11-30 07:12:28', '2024-11-30 07:12:28'),
(882, 1, '674aaccb07f3a', '1efaee21-2a39-6f0a-a61c-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaccb07f3a', '2024-11-30 07:12:29', '2024-11-30 07:12:29'),
(883, 1, '674aaccbe4a3f', '1efaee21-32d8-6de6-b3cf-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaccbe4a3f', '2024-11-30 07:12:30', '2024-11-30 07:12:30'),
(884, 1, '674aacccc162f', '1efaee21-3b01-6afe-9a82-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacccc162f', '2024-11-30 07:12:31', '2024-11-30 07:12:31'),
(885, 1, '674aaccda0807', '1efaee21-4342-640c-baf3-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaccda0807', '2024-11-30 07:12:32', '2024-11-30 07:12:32'),
(886, 1, '674aacce81650', '1efaee21-4b94-6970-a4fe-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacce81650', '2024-11-30 07:12:33', '2024-11-30 07:12:33'),
(887, 1, '674aaccf5c95c', '1efaee21-53ad-6ed6-9534-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aaccf5c95c', '2024-11-30 07:12:33', '2024-11-30 07:12:33'),
(888, 1, '674aacd03e87b', '1efaee21-5c0a-6c78-9137-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd03e87b', '2024-11-30 07:12:34', '2024-11-30 07:12:34'),
(889, 1, '674aacd12430c', '1efaee21-648d-6756-9d3d-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd12430c', '2024-11-30 07:12:35', '2024-11-30 07:12:35'),
(890, 1, '674aacd200c90', '1efaee21-6cb4-6236-97b3-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd200c90', '2024-11-30 07:12:36', '2024-11-30 07:12:36'),
(891, 1, '674aacd2d4ecc', '1efaee21-74fd-6820-b947-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd2d4ecc', '2024-11-30 07:12:37', '2024-11-30 07:12:37'),
(892, 1, '674aacd3b02a1', '1efaee21-7d17-660a-ba56-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd3b02a1', '2024-11-30 07:12:38', '2024-11-30 07:12:38'),
(893, 1, '674aacd48c730', '1efaee21-853b-69e4-886e-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd48c730', '2024-11-30 07:12:39', '2024-11-30 07:12:39'),
(894, 1, '674aacd56c1d2', '1efaee21-8d81-6a0e-80ce-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd56c1d2', '2024-11-30 07:12:40', '2024-11-30 07:12:40'),
(895, 1, '674aacd64d46e', '1efaee21-95d6-6db2-93e3-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd64d46e', '2024-11-30 07:12:40', '2024-11-30 07:12:40'),
(896, 1, '674aacd726621', '1efaee21-9ddb-630a-ba3e-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd726621', '2024-11-30 07:12:41', '2024-11-30 07:12:41'),
(897, 1, '674aacd808c26', '1efaee21-a63c-68f0-b45e-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd808c26', '2024-11-30 07:12:42', '2024-11-30 07:12:42'),
(898, 1, '674aacd8d8fc6', '1efaee21-ae5e-6966-9dc7-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd8d8fc6', '2024-11-30 07:12:44', '2024-11-30 07:12:44'),
(899, 1, '674aacd9b767e', '1efaee21-b698-62f8-bc7a-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacd9b767e', '2024-11-30 07:12:44', '2024-11-30 07:12:44'),
(900, 1, '674aacda96dcb', '1efaee21-bedc-632e-a2b5-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacda96dcb', '2024-11-30 07:12:45', '2024-11-30 07:12:45'),
(901, 1, '674aacdb76c65', '1efaee21-c724-6cb6-8eed-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacdb76c65', '2024-11-30 07:12:46', '2024-11-30 07:12:46'),
(902, 1, '674aacdc5afe6', '1efaee21-cf98-650a-8965-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacdc5afe6', '2024-11-30 07:12:46', '2024-11-30 07:12:46'),
(903, 1, '674aacdd30f95', '1efaee21-d77d-67f2-969c-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacdd30f95', '2024-11-30 07:12:47', '2024-11-30 07:12:47'),
(904, 1, '674aacde12fa0', '1efaee21-dfda-6efe-945b-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacde12fa0', '2024-11-30 07:12:49', '2024-11-30 07:12:49'),
(905, 1, '674aacdee659d', '1efaee21-e81c-6ab8-a972-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacdee659d', '2024-11-30 07:12:49', '2024-11-30 07:12:49'),
(906, 1, '674aacdfc5ede', '1efaee21-f062-60f6-9340-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacdfc5ede', '2024-11-30 07:12:50', '2024-11-30 07:12:50'),
(907, 1, '674aace0ae760', '1efaee21-f900-6dac-83de-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aace0ae760', '2024-11-30 07:12:51', '2024-11-30 07:12:51'),
(908, 1, '674aace19248e', '1efaee22-0170-6a0a-93b0-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aace19248e', '2024-11-30 07:12:52', '2024-11-30 07:12:52'),
(909, 1, '674aace26eba0', '1efaee22-0996-65ea-9117-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aace26eba0', '2024-11-30 07:12:52', '2024-11-30 07:12:52'),
(910, 1, '674aace34ec56', '1efaee22-11e0-6048-b061-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aace34ec56', '2024-11-30 07:12:53', '2024-11-30 07:12:53'),
(911, 1, '674aace42adc6', '1efaee22-1a02-62e4-bb1f-7628779ffd60', '1508783', '1508783', 'win', 'balance_bonus', 0.32, 'play_fiver', 0, 1, '674aace42adc6', '2024-11-30 07:12:55', '2024-11-30 07:12:55'),
(912, 1, '674aace5e3246', '1efaee22-2abe-675e-af42-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance', 0.08, 'play_fiver', 0, 1, '674aace5e3246', '2024-11-30 07:12:56', '2024-11-30 07:12:56'),
(913, 1, '674aace83e8bd', '1efaee22-40ec-6df0-a555-ba6f009bcaf8', '1508783', '1508783', 'win', 'balance', 2.16, 'play_fiver', 0, 1, '674aace83e8bd', '2024-11-30 07:12:58', '2024-11-30 07:12:58'),
(914, 1, '674aacef0ca23', '1efaee22-81bb-687c-84c4-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacef0ca23', '2024-11-30 07:13:05', '2024-11-30 07:13:05'),
(915, 1, '674aacefdab44', '1efaee22-89c8-62f4-ac4f-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacefdab44', '2024-11-30 07:13:06', '2024-11-30 07:13:06'),
(916, 1, '674aacf0ba721', '1efaee22-920e-6f3a-9c7b-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf0ba721', '2024-11-30 07:13:07', '2024-11-30 07:13:07'),
(917, 1, '674aacf198b3b', '1efaee22-9a46-6f22-8f17-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf198b3b', '2024-11-30 07:13:08', '2024-11-30 07:13:08'),
(918, 1, '674aacf274345', '1efaee22-a263-6552-a719-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf274345', '2024-11-30 07:13:08', '2024-11-30 07:13:08'),
(919, 1, '674aacf353b05', '1efaee22-aaa7-6a2e-aee6-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf353b05', '2024-11-30 07:13:09', '2024-11-30 07:13:09'),
(920, 1, '674aacf434800', '1efaee22-b2f9-68c6-ad24-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf434800', '2024-11-30 07:13:10', '2024-11-30 07:13:10'),
(921, 1, '674aacf512a40', '1efaee22-bb30-67a6-852d-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf512a40', '2024-11-30 07:13:11', '2024-11-30 07:13:11'),
(922, 1, '674aacf5e7169', '1efaee22-c37c-66d0-bca1-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf5e7169', '2024-11-30 07:13:12', '2024-11-30 07:13:12'),
(923, 1, '674aacf6c68f4', '1efaee22-cbc0-6dc8-963b-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf6c68f4', '2024-11-30 07:13:13', '2024-11-30 07:13:13'),
(924, 1, '674aacf7a0509', '1efaee22-d3cb-67c0-be93-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf7a0509', '2024-11-30 07:13:14', '2024-11-30 07:13:14'),
(925, 1, '674aacf87f273', '1efaee22-dc09-63d8-8d72-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf87f273', '2024-11-30 07:13:15', '2024-11-30 07:13:15'),
(926, 1, '674aacf9652ea', '1efaee22-e48f-630e-8dde-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacf9652ea', '2024-11-30 07:13:15', '2024-11-30 07:13:15'),
(927, 1, '674aacfa402e1', '1efaee22-eca6-657e-b33f-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacfa402e1', '2024-11-30 07:13:16', '2024-11-30 07:13:16'),
(928, 1, '674aacfb1e05c', '1efaee22-f4da-63f8-9d82-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacfb1e05c', '2024-11-30 07:13:18', '2024-11-30 07:13:18'),
(929, 1, '674aacfbf2d98', '1efaee22-fd2a-6918-944d-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacfbf2d98', '2024-11-30 07:13:18', '2024-11-30 07:13:18'),
(930, 1, '674aacfcd139a', '1efaee23-0563-6b52-a0ce-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacfcd139a', '2024-11-30 07:13:19', '2024-11-30 07:13:19'),
(931, 1, '674aacfdaf116', '1efaee23-0d97-66c0-b5f8-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacfdaf116', '2024-11-30 07:13:20', '2024-11-30 07:13:20'),
(932, 1, '674aacfe923ea', '1efaee23-1600-69b0-afb7-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacfe923ea', '2024-11-30 07:13:21', '2024-11-30 07:13:21'),
(933, 1, '674aacff702b1', '1efaee23-1e35-640a-a4e4-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aacff702b1', '2024-11-30 07:13:21', '2024-11-30 07:13:21'),
(934, 1, '674aad004e957', '1efaee23-266e-6d6a-adfc-ba6f009bcaf8', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad004e957', '2024-11-30 07:13:22', '2024-11-30 07:13:22'),
(935, 1, '674aad012c12d', '1efaee23-2e9f-628c-a68c-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad012c12d', '2024-11-30 07:13:23', '2024-11-30 07:13:23'),
(936, 1, '674aad020aff2', '1efaee23-36dd-6cdc-9647-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad020aff2', '2024-11-30 07:13:24', '2024-11-30 07:13:24'),
(937, 1, '674aad02e5457', '1efaee23-3f64-689c-8b45-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad02e5457', '2024-11-30 07:13:25', '2024-11-30 07:13:25'),
(938, 1, '674aad03c4bb6', '1efaee23-47a8-6922-ab97-7628779ffd60', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad03c4bb6', '2024-11-30 07:13:26', '2024-11-30 07:13:26'),
(939, 1, '674aad04c4c55', '1efaee23-5133-6276-81b0-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad04c4c55', '2024-11-30 07:13:27', '2024-11-30 07:13:27'),
(940, 1, '674aad088a66b', '1efaee23-7510-6ee6-8a86-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad088a66b', '2024-11-30 07:13:31', '2024-11-30 07:13:31'),
(941, 1, '674aad096554f', '1efaee23-7d27-66fc-b5ec-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad096554f', '2024-11-30 07:13:31', '2024-11-30 07:13:31'),
(942, 1, '674aad0a4345b', '1efaee23-855c-62aa-822f-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0a4345b', '2024-11-30 07:13:32', '2024-11-30 07:13:32'),
(943, 1, '674aad0b2810b', '1efaee23-8dd5-6972-ade0-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0b2810b', '2024-11-30 07:13:33', '2024-11-30 07:13:33'),
(944, 1, '674aad0c0829f', '1efaee23-9620-608c-b744-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0c0829f', '2024-11-30 07:13:34', '2024-11-30 07:13:34'),
(945, 1, '674aad0cd6ae4', '1efaee23-9e30-6bd2-86ab-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0cd6ae4', '2024-11-30 07:13:35', '2024-11-30 07:13:35'),
(946, 1, '674aad0dc164e', '1efaee23-a6e5-6372-9f9d-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0dc164e', '2024-11-30 07:13:36', '2024-11-30 07:13:36'),
(947, 1, '674aad0ea6699', '1efaee23-af60-6cc2-a07b-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0ea6699', '2024-11-30 07:13:37', '2024-11-30 07:13:37'),
(948, 1, '674aad0f8448c', '1efaee23-b795-6618-934f-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad0f8448c', '2024-11-30 07:13:38', '2024-11-30 07:13:38'),
(949, 1, '674aad1067e52', '1efaee23-c003-60de-967a-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad1067e52', '2024-11-30 07:13:39', '2024-11-30 07:13:39'),
(950, 1, '674aad1142d98', '1efaee23-c819-6c78-8e1a-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad1142d98', '2024-11-30 07:13:39', '2024-11-30 07:13:39'),
(951, 1, '674aad1220bdc', '1efaee23-d04d-6c1e-9d22-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad1220bdc', '2024-11-30 07:13:41', '2024-11-30 07:13:41'),
(952, 1, '674aad12f2c08', '1efaee23-d882-606a-9059-a6ab07260d41', '1508783', '1508783', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad12f2c08', '2024-11-30 07:13:42', '2024-11-30 07:13:42'),
(953, 1, '674aad2113de2', '1efaee24-5eda-6158-b3d1-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad2113de2', '2024-11-30 07:13:55', '2024-11-30 07:13:55'),
(954, 1, '674aad21d135b', '1efaee24-663f-6718-8ede-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad21d135b', '2024-11-30 07:13:56', '2024-11-30 07:13:56'),
(955, 1, '674aad22b0b69', '1efaee24-6e83-6f50-9fa3-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad22b0b69', '2024-11-30 07:13:57', '2024-11-30 07:13:57'),
(956, 1, '674aad238b10e', '1efaee24-7694-6ec4-967b-a6ab07260d41', '1682240', '1682240', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '674aad238b10e', '2024-11-30 07:13:57', '2024-11-30 07:13:57'),
(957, 1, '674aad2927065', '1efaee24-abe4-6f0c-95bd-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad2927065', '2024-11-30 07:14:03', '2024-11-30 07:14:03'),
(958, 1, '674aad2a224ca', '1efaee24-b53f-60c0-8dcc-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad2a224ca', '2024-11-30 07:14:05', '2024-11-30 07:14:05'),
(959, 1, '674aad2b1536d', '1efaee24-be45-69da-892d-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad2b1536d', '2024-11-30 07:14:06', '2024-11-30 07:14:06'),
(960, 1, '674aad2bf31ec', '1efaee24-c6f0-69fe-a65a-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad2bf31ec', '2024-11-30 07:14:07', '2024-11-30 07:14:07'),
(961, 1, '674aad2cdb9e8', '1efaee24-cf8f-6772-99bd-06b84fb30b3f', '1682240', '1682240', 'win', 'balance_bonus', 0.60, 'play_fiver', 0, 1, '674aad2cdb9e8', '2024-11-30 07:14:07', '2024-11-30 07:14:07'),
(962, 1, '674aad2f8e60e', '1efaee24-e927-62e8-b950-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad2f8e60e', '2024-11-30 07:14:10', '2024-11-30 07:14:10'),
(963, 1, '674aad30a7bd8', '1efaee24-f3ae-6306-9283-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad30a7bd8', '2024-11-30 07:14:11', '2024-11-30 07:14:11'),
(964, 1, '674aad318449d', '1efaee24-fbd4-6cc4-aa83-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad318449d', '2024-11-30 07:14:12', '2024-11-30 07:14:12'),
(965, 1, '674aad3259e95', '1efaee25-03b6-673a-b26b-a6ab07260d41', '1682240', '1682240', 'win', 'balance_bonus', 0.60, 'play_fiver', 0, 1, '674aad3259e95', '2024-11-30 07:14:12', '2024-11-30 07:14:12'),
(966, 1, '674aad35a9e60', '1efaee25-2373-6410-a041-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad35a9e60', '2024-11-30 07:14:16', '2024-11-30 07:14:16'),
(967, 1, '674aad36c0ed1', '1efaee25-2de2-63c4-a84a-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad36c0ed1', '2024-11-30 07:14:17', '2024-11-30 07:14:17'),
(968, 1, '674aad379e75d', '1efaee25-3612-6fa8-a56d-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad379e75d', '2024-11-30 07:14:18', '2024-11-30 07:14:18'),
(969, 1, '674aad388dd7c', '1efaee25-3ef6-69c6-b6e5-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad388dd7c', '2024-11-30 07:14:19', '2024-11-30 07:14:19'),
(970, 1, '674aad3959272', '1efaee25-4671-6048-afc1-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad3959272', '2024-11-30 07:14:19', '2024-11-30 07:14:19'),
(971, 1, '674aad3a35e6d', '1efaee25-4e9a-6210-97ec-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad3a35e6d', '2024-11-30 07:14:20', '2024-11-30 07:14:20'),
(972, 1, '674aad3b09d79', '1efaee25-566a-660c-a695-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad3b09d79', '2024-11-30 07:14:21', '2024-11-30 07:14:21'),
(973, 1, '674aad3be0909', '1efaee25-5ecd-69ac-90e4-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad3be0909', '2024-11-30 07:14:22', '2024-11-30 07:14:22'),
(974, 1, '674aad3cc3ea7', '1efaee25-6738-6fc4-87ce-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad3cc3ea7', '2024-11-30 07:14:23', '2024-11-30 07:14:23'),
(975, 1, '674aad3da9365', '1efaee25-6fb6-6dfe-b2f4-a6ab07260d41', '1682240', '1682240', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, '674aad3da9365', '2024-11-30 07:14:24', '2024-11-30 07:14:24'),
(976, 1, '674aad40788e5', '1efaee25-8a6c-6e0a-ab8b-a6ab07260d41', '1682240', '1682240', 'win', 'balance_bonus', 0.08, 'play_fiver', 0, 1, '674aad40788e5', '2024-11-30 07:14:27', '2024-11-30 07:14:27'),
(977, 1, '674aad437b3d7', '1efaee25-a723-6a62-8762-06b84fb30b3f', '1682240', '1682240', 'win', 'balance_bonus', 0.60, 'play_fiver', 0, 1, '674aad437b3d7', '2024-11-30 07:14:30', '2024-11-30 07:14:30'),
(978, 1, '674aad468d4b1', '1efaee25-c474-6562-b65b-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad468d4b1', '2024-11-30 07:14:33', '2024-11-30 07:14:33'),
(979, 1, '674aad47c8c73', '1efaee25-d050-6cf0-9ed4-a6ab07260d41', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad47c8c73', '2024-11-30 07:14:34', '2024-11-30 07:14:34'),
(980, 1, '674aad4aa606f', '1efaee25-eb91-6a82-b05a-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad4aa606f', '2024-11-30 07:14:37', '2024-11-30 07:14:37'),
(981, 1, '674aad4b75a5f', '1efaee25-f337-6250-a3b5-06b84fb30b3f', '1682240', '1682240', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674aad4b75a5f', '2024-11-30 07:14:37', '2024-11-30 07:14:37'),
(982, 1, '674aad4c47bc9', '1efaee25-faf5-638e-9fa0-06b84fb30b3f', '1682240', '1682240', 'win', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '674aad4c47bc9', '2024-11-30 07:14:38', '2024-11-30 07:14:38'),
(983, 1, '674ab31daaeca', '1efaee5d-770b-60f4-bb30-723eba7647ac', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab31daaeca', '2024-11-30 07:39:28', '2024-11-30 07:39:28'),
(984, 1, '674ab31e85606', '1efaee5d-7f1c-6ffe-bf47-a6ab07260d41', '1695365', '1695365', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab31e85606', '2024-11-30 07:39:29', '2024-11-30 07:39:29'),
(985, 1, '674ab3516ffb4', '1efaee5f-64a6-6b5a-b276-a6ab07260d41', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab3516ffb4', '2024-11-30 07:40:19', '2024-11-30 07:40:19'),
(986, 1, '674ab3522cb82', '1efaee5f-6b8f-6d4a-af4c-723eba7647ac', '1695365', '1695365', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '674ab3522cb82', '2024-11-30 07:40:20', '2024-11-30 07:40:20'),
(987, 1, '674ab353d4275', '1efaee5f-7ba3-6344-883f-06b84fb30b3f', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab353d4275', '2024-11-30 07:40:22', '2024-11-30 07:40:22'),
(988, 1, '674ab3564b8b6', '1efaee5f-92e9-6814-9734-723eba7647ac', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab3564b8b6', '2024-11-30 07:40:24', '2024-11-30 07:40:24'),
(989, 1, '674ab35716a2c', '1efaee5f-9a61-6ad8-a074-a6ab07260d41', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab35716a2c', '2024-11-30 07:40:25', '2024-11-30 07:40:25'),
(990, 1, '674ab357dd429', '1efaee5f-a224-600e-8ad2-42df794da1b4', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674ab357dd429', '2024-11-30 07:40:26', '2024-11-30 07:40:26'),
(991, 1, '674ab358abe5d', '1efaee5f-a9bf-6be2-9bf4-723eba7647ac', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab358abe5d', '2024-11-30 07:40:27', '2024-11-30 07:40:27'),
(992, 1, '674ab3598556c', '1efaee5f-b1c7-6844-b42e-a6ab07260d41', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3598556c', '2024-11-30 07:40:27', '2024-11-30 07:40:27'),
(993, 1, '674ab35a78e83', '1efaee5f-bad5-6350-96de-4ad628118a37', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab35a78e83', '2024-11-30 07:40:28', '2024-11-30 07:40:28'),
(994, 1, '674ab35b3cb29', '1efaee5f-c204-611c-ae6f-4ad628118a37', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab35b3cb29', '2024-11-30 07:40:29', '2024-11-30 07:40:29'),
(995, 1, '674ab35d6077f', '1efaee5f-d67c-67e8-875a-4ad628118a37', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab35d6077f', '2024-11-30 07:40:31', '2024-11-30 07:40:31'),
(996, 1, '674ab35e39952', '1efaee5f-de81-6010-b85d-a6ab07260d41', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab35e39952', '2024-11-30 07:40:32', '2024-11-30 07:40:32'),
(997, 1, '674ab35f22958', '1efaee5f-e724-6744-a176-4ad628118a37', '1695365', '1695365', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '674ab35f22958', '2024-11-30 07:40:34', '2024-11-30 07:40:34'),
(998, 1, '674ab3a6691fc', '1efaee62-8f01-6d2a-b360-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3a6691fc', '2024-11-30 07:41:45', '2024-11-30 07:41:45'),
(999, 1, '674ab3a78f46f', '1efaee62-9a09-60e2-aedc-42df794da1b4', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3a78f46f', '2024-11-30 07:41:46', '2024-11-30 07:41:46'),
(1000, 1, '674ab3a8c515e', '1efaee62-a5ac-6142-aad4-723eba7647ac', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3a8c515e', '2024-11-30 07:41:47', '2024-11-30 07:41:47'),
(1001, 1, '674ab3aa014df', '1efaee62-b119-6160-adc9-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3aa014df', '2024-11-30 07:41:49', '2024-11-30 07:41:49'),
(1002, 1, '674ab3ab19af5', '1efaee62-bb96-64a8-801a-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3ab19af5', '2024-11-30 07:41:49', '2024-11-30 07:41:49'),
(1003, 1, '674ab3ac545b5', '1efaee62-c76a-6f22-b238-723eba7647ac', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3ac545b5', '2024-11-30 07:41:50', '2024-11-30 07:41:50'),
(1004, 1, '674ab3adf01d6', '1efaee62-d709-66a4-ae63-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3adf01d6', '2024-11-30 07:41:52', '2024-11-30 07:41:52'),
(1005, 1, '674ab3aeab287', '1efaee62-dde1-63c8-8e04-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3aeab287', '2024-11-30 07:41:53', '2024-11-30 07:41:53'),
(1006, 1, '674ab3afea468', '1efaee62-e9e1-6f24-9fcc-723eba7647ac', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3afea468', '2024-11-30 07:41:54', '2024-11-30 07:41:54'),
(1007, 1, '674ab3b1a28aa', '1efaee62-fa27-6d7a-817e-723eba7647ac', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b1a28aa', '2024-11-30 07:41:56', '2024-11-30 07:41:56');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(1008, 1, '674ab3b258f9e', '1efaee63-00d1-6a9a-be21-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b258f9e', '2024-11-30 07:41:56', '2024-11-30 07:41:56'),
(1009, 1, '674ab3b39dad8', '1efaee63-0d09-6f88-86b5-a6ab07260d41', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b39dad8', '2024-11-30 07:41:58', '2024-11-30 07:41:58'),
(1010, 1, '674ab3b4d80aa', '1efaee63-18da-6ea2-a3d8-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b4d80aa', '2024-11-30 07:41:59', '2024-11-30 07:41:59'),
(1011, 1, '674ab3b5edd20', '1efaee63-233d-6b88-a255-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b5edd20', '2024-11-30 07:42:00', '2024-11-30 07:42:00'),
(1012, 1, '674ab3b70b5e2', '1efaee63-2d78-6094-a260-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b70b5e2', '2024-11-30 07:42:02', '2024-11-30 07:42:02'),
(1013, 1, '674ab3b81bc07', '1efaee63-37a5-6558-ac3f-06b84fb30b3f', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b81bc07', '2024-11-30 07:42:02', '2024-11-30 07:42:02'),
(1014, 1, '674ab3b9295d9', '1efaee63-41b6-6e8e-aca4-42df794da1b4', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3b9295d9', '2024-11-30 07:42:03', '2024-11-30 07:42:03'),
(1015, 1, '674ab3ba3929a', '1efaee63-4bde-6326-b1a9-a6ab07260d41', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3ba3929a', '2024-11-30 07:42:04', '2024-11-30 07:42:04'),
(1016, 1, '674ab3bb48ade', '1efaee63-5603-6482-b0a9-42df794da1b4', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3bb48ade', '2024-11-30 07:42:05', '2024-11-30 07:42:05'),
(1017, 1, '674ab3bc58c31', '1efaee63-602d-6002-be0d-42df794da1b4', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3bc58c31', '2024-11-30 07:42:06', '2024-11-30 07:42:06'),
(1018, 1, '674ab3bd68c52', '1efaee63-6a56-6754-a3db-a6ab07260d41', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3bd68c52', '2024-11-30 07:42:07', '2024-11-30 07:42:07'),
(1019, 1, '674ab3be78628', '1efaee63-747c-604e-b0a2-a6ab07260d41', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3be78628', '2024-11-30 07:42:09', '2024-11-30 07:42:09'),
(1020, 1, '674ab3bf87249', '1efaee63-7e99-605e-96e8-723eba7647ac', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3bf87249', '2024-11-30 07:42:10', '2024-11-30 07:42:10'),
(1021, 1, '674ab3c0bd68a', '1efaee63-8a41-6190-b0aa-4ad628118a37', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3c0bd68a', '2024-11-30 07:42:11', '2024-11-30 07:42:11'),
(1022, 1, '674ab3c1a8bf4', '1efaee63-92fb-6e5c-9dfb-42df794da1b4', '1508783', '1508783', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '674ab3c1a8bf4', '2024-11-30 07:42:12', '2024-11-30 07:42:12'),
(1023, 1524, '674b6c0199e6b', '1efaf540-b781-677a-b7ee-fe7a72468cbe', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '674b6c0199e6b', '2024-11-30 20:48:20', '2024-11-30 20:48:20'),
(1024, 1524, '674b6c0684e7f', '1efaf540-e65e-67be-b47f-8287c7bb45bf', '126', '126', 'win', 'balance_bonus', 1.60, 'play_fiver', 0, 1, '674b6c0684e7f', '2024-11-30 20:48:25', '2024-11-30 20:48:25'),
(1025, 1524, '674b6c0a9e6d4', '1efaf541-0d83-6470-880e-3eb457cb0fe7', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '674b6c0a9e6d4', '2024-11-30 20:48:29', '2024-11-30 20:48:29'),
(1026, 1524, '674b6c0e3ec32', '1efaf541-2fec-649e-abf9-fe7a72468cbe', '126', '126', 'win', 'balance_withdrawal', 6.40, 'play_fiver', 0, 1, '674b6c0e3ec32', '2024-11-30 20:48:33', '2024-11-30 20:48:33'),
(1027, 1524, '674b6c12411d2', '1efaf541-5629-6698-92f5-cef0a16e406e', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '674b6c12411d2', '2024-11-30 20:48:36', '2024-11-30 20:48:36'),
(1028, 1524, '674b6c162f4b5', '1efaf541-7b9c-6d76-be6a-06b84fb30b3f', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674b6c162f4b5', '2024-11-30 20:48:40', '2024-11-30 20:48:40'),
(1029, 1524, '674b6c178a85e', '1efaf541-88b6-6a2a-8201-fe7a72468cbe', '126', '126', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '674b6c178a85e', '2024-11-30 20:48:42', '2024-11-30 20:48:42'),
(1030, 1524, '674b6e276cb89', '1efaf555-32f3-6142-8942-06b84fb30b3f', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '674b6e276cb89', '2024-11-30 20:57:30', '2024-11-30 20:57:30'),
(1031, 1524, '674b6e2b0eb48', '1efaf555-556c-6d9a-b2fb-06b84fb30b3f', '126', '126', 'win', 'balance_withdrawal', 6.40, 'play_fiver', 0, 1, '674b6e2b0eb48', '2024-11-30 20:57:33', '2024-11-30 20:57:33'),
(1032, 1524, '674b6e2df2f1b', '1efaf555-7169-6b56-a60f-8287c7bb45bf', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674b6e2df2f1b', '2024-11-30 20:57:36', '2024-11-30 20:57:36'),
(1033, 1524, '674b6e3898f97', '1efaf555-d6cd-67e0-aae4-fe7a72468cbe', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674b6e3898f97', '2024-11-30 20:57:47', '2024-11-30 20:57:47'),
(1034, 1524, '674b6e3b0050c', '1efaf555-ed73-6184-b197-8287c7bb45bf', '126', '126', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '674b6e3b0050c', '2024-11-30 20:57:49', '2024-11-30 20:57:49'),
(1035, 1524, '674b6e3cb9767', '1efaf555-fe38-662c-a535-cef0a16e406e', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '674b6e3cb9767', '2024-11-30 20:57:51', '2024-11-30 20:57:51'),
(1036, 1524, '674b6e3dbb4cb', '1efaf556-07d3-6baa-b5bd-cef0a16e406e', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '674b6e3dbb4cb', '2024-11-30 20:57:52', '2024-11-30 20:57:52'),
(1037, 1524, '674b6e471f404', '1efaf556-6119-6566-8f4b-4ad628118a37', '126', '126', 'win', 'balance_withdrawal', 0.88, 'play_fiver', 0, 1, '674b6e471f404', '2024-11-30 20:58:01', '2024-11-30 20:58:01'),
(1038, 1524, '674b6e48c7b53', '1efaf556-7137-65ba-a734-fe7a72468cbe', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674b6e48c7b53', '2024-11-30 20:58:03', '2024-11-30 20:58:03'),
(1039, 1524, '674b6e4b3c158', '1efaf556-885f-6c6a-b787-cef0a16e406e', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674b6e4b3c158', '2024-11-30 20:58:06', '2024-11-30 20:58:06'),
(1040, 1524, '674b6e4d2cc89', '1efaf556-9ad9-680a-9c1f-06b84fb30b3f', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674b6e4d2cc89', '2024-11-30 20:58:07', '2024-11-30 20:58:07'),
(1041, 1524, '674b6e4dd29d8', '1efaf556-a153-6690-9585-8287c7bb45bf', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '674b6e4dd29d8', '2024-11-30 20:58:08', '2024-11-30 20:58:08'),
(1042, 1524, '674b6e52833a1', '1efaf556-cde8-6926-aadf-fe7a72468cbe', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '674b6e52833a1', '2024-11-30 20:58:13', '2024-11-30 20:58:13'),
(1043, 1524, '674b6e5397c7c', '1efaf556-d83f-6848-87c7-06b84fb30b3f', '126', '126', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '674b6e5397c7c', '2024-11-30 20:58:14', '2024-11-30 20:58:14'),
(1044, 1524, '674b6e5a91737', '1efaf557-1ac2-610c-ac09-cef0a16e406e', '126', '126', 'win', 'balance_withdrawal', 60.00, 'play_fiver', 0, 1, '674b6e5a91737', '2024-11-30 20:58:21', '2024-11-30 20:58:21'),
(1045, 1524, '674b6e64edbe4', '1efaf557-7dba-6eda-9cc9-4ad628118a37', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '674b6e64edbe4', '2024-11-30 20:58:31', '2024-11-30 20:58:31'),
(1046, 1524, '674b6e6621b1f', '1efaf557-88d5-65ea-8aa6-8287c7bb45bf', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '674b6e6621b1f', '2024-11-30 20:58:32', '2024-11-30 20:58:32'),
(1047, 1, '674e28189cacb', '1efb0f55-4b55-6bf8-a1b5-06b84fb30b3f', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674e28189cacb', '2024-12-02 22:35:23', '2024-12-02 22:35:23'),
(1048, 1, '674e281c8cc77', '1efb0f55-70dc-67be-a58b-06b84fb30b3f', '1695365', '1695365', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674e281c8cc77', '2024-12-02 22:35:27', '2024-12-02 22:35:27'),
(1049, 1, '674e281f20d4d', '1efb0f55-8941-641c-bb3b-4ad628118a37', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674e281f20d4d', '2024-12-02 22:35:29', '2024-12-02 22:35:29'),
(1050, 1, '674e28236cd3e', '1efb0f55-b25f-6402-b3df-4ad628118a37', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674e28236cd3e', '2024-12-02 22:35:34', '2024-12-02 22:35:34'),
(1051, 1, '674e282869f82', '1efb0f55-e1f1-636e-9e7e-06b84fb30b3f', '1695365', '1695365', 'win', 'balance_bonus', 0.64, 'play_fiver', 0, 1, '674e282869f82', '2024-12-02 22:35:39', '2024-12-02 22:35:39'),
(1052, 1, '674e296ed084f', '1efb0f62-0aed-6446-927a-2a857e615a97', '126', '126', 'win', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '674e296ed084f', '2024-12-02 22:41:06', '2024-12-02 22:41:06'),
(1053, 1, '674e2970439c1', '1efb0f62-187f-6280-9eb7-3a9d7c79d17b', '126', '126', 'win', 'balance_bonus', 1.52, 'play_fiver', 0, 1, '674e2970439c1', '2024-12-02 22:41:07', '2024-12-02 22:41:07'),
(1054, 1, '674e29ecad542', '1efb0f66-bb2e-66e4-bd4c-3a9d7c79d17b', '126', '126', 'win', 'balance_bonus', 6.40, 'play_fiver', 0, 1, '674e29ecad542', '2024-12-02 22:43:11', '2024-12-02 22:43:11'),
(1055, 1, '674e29efcb85f', '1efb0f66-d8f8-6a9e-87b4-5626fc93ecac', '126', '126', 'win', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '674e29efcb85f', '2024-12-02 22:43:14', '2024-12-02 22:43:14'),
(1056, 1, '674e2a11054cb', '1efb0f68-157a-696c-8d3e-3a9d7c79d17b', '126', '126', 'win', 'balance_bonus', 2.40, 'play_fiver', 0, 1, '674e2a11054cb', '2024-12-02 22:43:48', '2024-12-02 22:43:48'),
(1057, 1, '674e2ad37247c', '1efb0f6f-53dc-6f32-b9c8-de2a28ff6f9f', '42', '42', 'win', 'balance_bonus', 162.00, 'play_fiver', 0, 1, '674e2ad37247c', '2024-12-02 22:47:02', '2024-12-02 22:47:02'),
(1058, 1, '674e3e6e38971', '1efb102a-4a7e-6682-9282-3a9d7c79d17b', '11675', '11675', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '674e3e6e38971', '2024-12-03 00:10:40', '2024-12-03 00:10:40'),
(1059, 1, '674e3ea7e45bc', '1efb102c-70cb-6ebe-9275-8635efed9000', '11677', '11677', 'bet', 'balance_bonus', 8.00, 'play_fiver', 0, 1, '674e3ea7e45bc', '2024-12-03 00:11:38', '2024-12-03 00:11:38'),
(1060, 1, '674e3eb95c8bf', '1efb102d-1726-6d04-bfd2-5ee588d0105e', '11677', '11677', 'bet', 'balance_bonus', 30.00, 'play_fiver', 0, 1, '674e3eb95c8bf', '2024-12-03 00:11:56', '2024-12-03 00:11:56'),
(1061, 1, '674e3eba3c7a4', '1efb102d-1f70-673a-8490-4ef3a9e1cc49', '11677', '11677', 'win', 'balance', 58.20, 'play_fiver', 0, 1, '674e3eba3c7a4', '2024-12-03 00:11:57', '2024-12-03 00:11:57'),
(1062, 1, '674e5876c59eb', '1efb1122-90e3-619c-92c3-4ef3a9e1cc49', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, '674e5876c59eb', '2024-12-03 02:01:45', '2024-12-03 02:01:45'),
(1063, 1, '674fb27551347', '1efb1e06-396f-646a-bbd5-96280de35f60', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_bonus', 0.05, 'play_fiver', 0, 1, '674fb27551347', '2024-12-04 02:38:01', '2024-12-04 02:38:01'),
(1064, 1, '674fb8dd1cdbc', '1efb1e43-4fa9-6590-b1b5-7284a98059a1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_bonus', 0.05, 'play_fiver', 0, 1, '674fb8dd1cdbc', '2024-12-04 03:05:20', '2024-12-04 03:05:20'),
(1065, 1, '674fb8de311f7', '1efb1e43-59fc-688a-8599-02eed91d5cd6', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_bonus', 0.05, 'play_fiver', 0, 1, '674fb8de311f7', '2024-12-04 03:05:21', '2024-12-04 03:05:21'),
(1066, 1, '674fb8df728e6', '1efb1e43-6613-6be6-9940-02eed91d5cd6', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_bonus', 0.05, 'play_fiver', 0, 1, '674fb8df728e6', '2024-12-04 03:05:22', '2024-12-04 03:05:22'),
(1067, 1, '674fb8dfd57aa', '1efb1e43-69ef-6be8-92fe-b2ff8dc35bea', 'vs5luckytig', 'vs5luckytig', 'win', 'balance', 0.03, 'play_fiver', 0, 1, '674fb8dfd57aa', '2024-12-04 03:05:23', '2024-12-04 03:05:23'),
(1068, 1, '674fb958f35bd', '1efb1e47-ed07-62ac-8f3f-aad92c2ab617', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '674fb958f35bd', '2024-12-04 03:07:23', '2024-12-04 03:07:23'),
(1069, 1, '1efb2605-4242-6e82-87a6-3a9d7c79d17b', '1efb2605-424d-6b66-b57b-3a9d7c79d17b', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2605-4242-6e82-87a6-3a9d7c79d17b', '2024-12-04 17:53:49', '2024-12-04 17:53:49'),
(1070, 1, '1efb2605-8f44-6d84-aea8-6a7c876e615a', '1efb2605-8f50-6e04-a21c-6a7c876e615a', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2605-8f44-6d84-aea8-6a7c876e615a', '2024-12-04 17:53:57', '2024-12-04 17:53:57'),
(1071, 1, '1efb2605-ce55-6ba4-b9ce-8e72ccf1542d', '1efb2605-ce5f-641a-86d8-8e72ccf1542d', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2605-ce55-6ba4-b9ce-8e72ccf1542d', '2024-12-04 17:54:04', '2024-12-04 17:54:04'),
(1072, 1, '1efb2606-323c-6b7c-b961-566736d8f8e6', '1efb2606-3248-6f76-95c9-566736d8f8e6', 'mines', 'mines', 'win', 'balance_bonus', 12.85, 'play_fiver', 0, 1, '1efb2606-323c-6b7c-b961-566736d8f8e6', '2024-12-04 17:54:14', '2024-12-04 17:54:14'),
(1073, 1, '1efb2606-402c-6106-a99c-6a7c876e615a', '1efb2606-4035-6666-93fa-6a7c876e615a', 'mines', 'mines', 'win', 'balance_bonus', 12.85, 'play_fiver', 0, 1, '1efb2606-402c-6106-a99c-6a7c876e615a', '2024-12-04 17:54:16', '2024-12-04 17:54:16'),
(1074, 1, '1efb2606-4df1-62b4-91d6-ca85e9facc1e', '1efb2606-4dfc-6da8-a591-ca85e9facc1e', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2606-4df1-62b4-91d6-ca85e9facc1e', '2024-12-04 17:54:17', '2024-12-04 17:54:17'),
(1075, 1, '1efb2606-5bda-6876-bdb6-7218fe3878c1', '1efb2606-5be4-61a0-8340-7218fe3878c1', 'mines', 'mines', 'win', 'balance_bonus', 12.85, 'play_fiver', 0, 1, '1efb2606-5bda-6876-bdb6-7218fe3878c1', '2024-12-04 17:54:19', '2024-12-04 17:54:19'),
(1076, 1, '1efb2606-6997-6e8c-a889-8e72ccf1542d', '1efb2606-69a1-6220-80fc-8e72ccf1542d', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2606-6997-6e8c-a889-8e72ccf1542d', '2024-12-04 17:54:20', '2024-12-04 17:54:20'),
(1077, 1, '1efb2606-775a-6556-9610-0adb8cd3ba8c', '1efb2606-7763-6480-b296-0adb8cd3ba8c', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2606-775a-6556-9610-0adb8cd3ba8c', '2024-12-04 17:54:22', '2024-12-04 17:54:22'),
(1078, 1, '1efb2606-8512-620c-baf5-3a9d7c79d17b', '1efb2606-8521-6068-9c02-3a9d7c79d17b', 'mines', 'mines', 'win', 'balance_bonus', 12.85, 'play_fiver', 0, 1, '1efb2606-8512-620c-baf5-3a9d7c79d17b', '2024-12-04 17:54:23', '2024-12-04 17:54:23'),
(1079, 1, '1efb2606-92db-67f8-bef4-36d9989a1bb7', '1efb2606-92e5-6a28-b43f-36d9989a1bb7', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2606-92db-67f8-bef4-36d9989a1bb7', '2024-12-04 17:54:25', '2024-12-04 17:54:25'),
(1080, 1, '1efb2606-a0a4-6f10-887b-8a9607b9c319', '1efb2606-a0af-6118-88c4-8a9607b9c319', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2606-a0a4-6f10-887b-8a9607b9c319', '2024-12-04 17:54:26', '2024-12-04 17:54:26'),
(1081, 1, '1efb2606-ae9a-6778-879c-8e72ccf1542d', '1efb2606-aea3-6f12-8960-8e72ccf1542d', 'mines', 'mines', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '1efb2606-ae9a-6778-879c-8e72ccf1542d', '2024-12-04 17:54:27', '2024-12-04 17:54:27'),
(1082, 1, '6751c54336b47', '1efb31cc-5e43-6afa-8915-9a48afa1fcf6', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54336b47', '2024-12-05 16:22:46', '2024-12-05 16:22:46'),
(1083, 1, '6751c5445f7a2', '1efb31cc-6964-6df8-91e9-9a48afa1fcf6', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c5445f7a2', '2024-12-05 16:22:47', '2024-12-05 16:22:47'),
(1084, 1, '6751c54815e33', '1efb31cc-8caa-64b6-bc6d-f2dc2d6dc4b5', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54815e33', '2024-12-05 16:22:51', '2024-12-05 16:22:51'),
(1085, 1, '6751c548c8a6a', '1efb31cc-93a5-6e64-bbed-9a48afa1fcf6', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c548c8a6a', '2024-12-05 16:22:51', '2024-12-05 16:22:51'),
(1086, 1, '6751c54993f33', '1efb31cc-9b20-648c-a306-5244489fa1b0', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54993f33', '2024-12-05 16:22:52', '2024-12-05 16:22:52'),
(1087, 1, '6751c54a6ab86', '1efb31cc-a30d-614a-a3aa-ee299f937ca8', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54a6ab86', '2024-12-05 16:22:53', '2024-12-05 16:22:53'),
(1088, 1, '6751c54b31306', '1efb31cc-aa5a-6f88-878c-4ebca5043714', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54b31306', '2024-12-05 16:22:54', '2024-12-05 16:22:54'),
(1089, 1, '6751c54c196a7', '1efb31cc-b2f3-6c62-93b8-fa42b8638b83', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54c196a7', '2024-12-05 16:22:55', '2024-12-05 16:22:55'),
(1090, 1, '6751c54ce4ae0', '1efb31cc-bae4-6534-8d38-f2dc2d6dc4b5', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c54ce4ae0', '2024-12-05 16:22:56', '2024-12-05 16:22:56'),
(1091, 1, '6751c54dbb6fd', '1efb31cc-c2d2-6c78-bca2-9a48afa1fcf6', 'lucky-neko', 'lucky-neko', 'win', 'balance_bonus', 1.92, 'play_fiver', 0, 1, '6751c54dbb6fd', '2024-12-05 16:22:56', '2024-12-05 16:22:56'),
(1092, 1, '6751c554b60bc', '1efb31cd-055d-61a6-8a26-f6382e942dfc', 'lucky-neko', 'lucky-neko', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6751c554b60bc', '2024-12-05 16:23:04', '2024-12-05 16:23:04'),
(1093, 1, '6753454e57c38', '1efb401a-e468-6570-88e7-b6d2b01ed606', '1543462', '1543462', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '6753454e57c38', '2024-12-06 19:41:21', '2024-12-06 19:41:21'),
(1094, 1, '67534552366f1', '1efb401b-0941-691e-8727-b6d2b01ed606', '1543462', '1543462', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '67534552366f1', '2024-12-06 19:41:25', '2024-12-06 19:41:25'),
(1095, 1, '675345546fa2e', '1efb401b-1e8f-6870-a0ff-c66688b2dfa6', '1543462', '1543462', 'win', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '675345546fa2e', '2024-12-06 19:41:27', '2024-12-06 19:41:27'),
(1096, 1, '6753455698363', '1efb401b-3338-6236-8a42-022e034bb8b0', '1543462', '1543462', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '6753455698363', '2024-12-06 19:41:29', '2024-12-06 19:41:29'),
(1097, 1, '6753455951906', '1efb401b-4d11-6d10-bff2-da182322df93', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6753455951906', '2024-12-06 19:41:32', '2024-12-06 19:41:32'),
(1098, 1, '6753455af1a78', '1efb401b-5cdc-6196-9189-c66688b2dfa6', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6753455af1a78', '2024-12-06 19:41:34', '2024-12-06 19:41:34'),
(1099, 1, '6753455c84373', '1efb401b-6ba8-6aee-a133-da182322df93', '1543462', '1543462', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '6753455c84373', '2024-12-06 19:41:35', '2024-12-06 19:41:35'),
(1100, 1, '6753455e7bfb6', '1efb401b-7e68-6e90-8b5b-760b47891a67', '1543462', '1543462', 'win', 'balance_bonus', 0.15, 'play_fiver', 0, 1, '6753455e7bfb6', '2024-12-06 19:41:37', '2024-12-06 19:41:37'),
(1101, 1, '6753456075bb3', '1efb401b-913d-6f0c-b297-760b47891a67', '1543462', '1543462', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '6753456075bb3', '2024-12-06 19:41:39', '2024-12-06 19:41:39'),
(1102, 1, '67534562852f5', '1efb401b-a4ea-68b6-987a-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '67534562852f5', '2024-12-06 19:41:41', '2024-12-06 19:41:41'),
(1103, 1, '675345637a2d3', '1efb401b-ae06-61b6-9031-ce7ceabc0ec7', '1543462', '1543462', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '675345637a2d3', '2024-12-06 19:41:42', '2024-12-06 19:41:42'),
(1104, 1, '675345658f643', '1efb401b-c1ed-67a6-8f3c-c66688b2dfa6', '1543462', '1543462', 'win', 'balance_bonus', 0.15, 'play_fiver', 0, 1, '675345658f643', '2024-12-06 19:41:44', '2024-12-06 19:41:44'),
(1105, 1, '67534567af368', '1efb401b-d63e-6070-9e18-92dcde6e0983', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '67534567af368', '2024-12-06 19:41:46', '2024-12-06 19:41:46'),
(1106, 1, '6753456924c9b', '1efb401b-e3e8-67fc-8bc8-ce7ceabc0ec7', '1543462', '1543462', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '6753456924c9b', '2024-12-06 19:41:48', '2024-12-06 19:41:48'),
(1107, 1, '6753456b09c60', '1efb401b-f5ed-636c-9607-c66688b2dfa6', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '6753456b09c60', '2024-12-06 19:41:50', '2024-12-06 19:41:50'),
(1108, 1, '6753456c112d3', '1efb401b-ffc0-6b3c-ae56-d295a5e329b8', '1543462', '1543462', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '6753456c112d3', '2024-12-06 19:41:51', '2024-12-06 19:41:51'),
(1109, 1, '675345aa98d0e', '1efb401e-5454-6322-8000-d295a5e329b8', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '675345aa98d0e', '2024-12-06 19:42:53', '2024-12-06 19:42:53'),
(1110, 1, '675345acca9d6', '1efb401e-6959-6114-8d52-d295a5e329b8', '1543462', '1543462', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '675345acca9d6', '2024-12-06 19:42:56', '2024-12-06 19:42:56'),
(1111, 1, '675345ae98589', '1efb401e-7a75-6222-8e78-760b47891a67', '1543462', '1543462', 'win', 'balance_bonus', 0.25, 'play_fiver', 0, 1, '675345ae98589', '2024-12-06 19:42:57', '2024-12-06 19:42:57'),
(1112, 1, '675345b0792ba', '1efb401e-8c50-635c-9e87-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '675345b0792ba', '2024-12-06 19:42:59', '2024-12-06 19:42:59'),
(1113, 1, '675345b16a49f', '1efb401e-9545-602a-a63e-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '675345b16a49f', '2024-12-06 19:43:00', '2024-12-06 19:43:00'),
(1114, 1, '675345b269f53', '1efb401e-9eca-6d70-bcc9-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '675345b269f53', '2024-12-06 19:43:01', '2024-12-06 19:43:01'),
(1115, 1, '675345b356b72', '1efb401e-a793-6e48-ac82-da182322df93', '1543462', '1543462', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '675345b356b72', '2024-12-06 19:43:02', '2024-12-06 19:43:02'),
(1116, 1, '675345b57c686', '1efb401e-bc1f-69f2-a02d-c66688b2dfa6', '1543462', '1543462', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '675345b57c686', '2024-12-06 19:43:04', '2024-12-06 19:43:04'),
(1117, 1, '675345b66f15b', '1efb401e-c523-6cc4-9e64-d295a5e329b8', '1543462', '1543462', 'win', 'balance_bonus', 0.10, 'play_fiver', 0, 1, '675345b66f15b', '2024-12-06 19:43:05', '2024-12-06 19:43:05'),
(1118, 1, '675345b88222f', '1efb401e-d8f5-622a-a34e-760b47891a67', '1543462', '1543462', 'win', 'balance_bonus', 0.15, 'play_fiver', 0, 1, '675345b88222f', '2024-12-06 19:43:07', '2024-12-06 19:43:07'),
(1119, 1, '675345baa26ca', '1efb401e-ed4b-629c-a853-92dcde6e0983', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345baa26ca', '2024-12-06 19:43:09', '2024-12-06 19:43:09'),
(1120, 1, '675345bb8fe29', '1efb401e-f61a-6d0a-b444-da182322df93', '1543462', '1543462', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '675345bb8fe29', '2024-12-06 19:43:10', '2024-12-06 19:43:10'),
(1121, 1, '675345bd707c6', '1efb401f-07f3-6af4-bc6e-d295a5e329b8', '1543462', '1543462', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '675345bd707c6', '2024-12-06 19:43:13', '2024-12-06 19:43:13'),
(1122, 1, '675345bf6109c', '1efb401f-1a6b-6fce-8da4-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345bf6109c', '2024-12-06 19:43:14', '2024-12-06 19:43:14'),
(1123, 1, '675345c061dc0', '1efb401f-23fd-6e52-a918-da182322df93', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345c061dc0', '2024-12-06 19:43:15', '2024-12-06 19:43:15'),
(1124, 1, '675345c14c303', '1efb401f-2cae-6574-aff8-022e034bb8b0', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345c14c303', '2024-12-06 19:43:16', '2024-12-06 19:43:16'),
(1125, 1, '675345c2404f2', '1efb401f-35c0-6efa-9694-d295a5e329b8', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345c2404f2', '2024-12-06 19:43:17', '2024-12-06 19:43:17'),
(1126, 1, '675345c3273aa', '1efb401f-3e4f-6fb2-915e-d295a5e329b8', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345c3273aa', '2024-12-06 19:43:18', '2024-12-06 19:43:18'),
(1127, 1, '675345c408946', '1efb401f-46a6-6738-a19a-da182322df93', '1543462', '1543462', 'win', 'balance_withdrawal', 0.25, 'play_fiver', 0, 1, '675345c408946', '2024-12-06 19:43:19', '2024-12-06 19:43:19'),
(1128, 1, '675345c6141ea', '1efb401f-5a2c-6abe-8336-760b47891a67', '1543462', '1543462', 'win', 'balance_withdrawal', 0.15, 'play_fiver', 0, 1, '675345c6141ea', '2024-12-06 19:43:21', '2024-12-06 19:43:21'),
(1129, 1, '675345c84030f', '1efb401f-6ef8-62ae-8e0d-760b47891a67', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345c84030f', '2024-12-06 19:43:23', '2024-12-06 19:43:23'),
(1130, 1, '675345c9495b7', '1efb401f-78dd-649a-9a41-b6d2b01ed606', '1543462', '1543462', 'win', 'balance_withdrawal', 0.15, 'play_fiver', 0, 1, '675345c9495b7', '2024-12-06 19:43:24', '2024-12-06 19:43:24'),
(1131, 1, '675345cb4ea5e', '1efb401f-8c25-6070-b9da-760b47891a67', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345cb4ea5e', '2024-12-06 19:43:26', '2024-12-06 19:43:26'),
(1132, 1, '675345cc3ac7d', '1efb401f-94e7-6b68-b142-022e034bb8b0', '1543462', '1543462', 'win', 'balance_withdrawal', 0.15, 'play_fiver', 0, 1, '675345cc3ac7d', '2024-12-06 19:43:27', '2024-12-06 19:43:27'),
(1133, 1, '675345ce4cf42', '1efb401f-a8b0-6bd6-9d5f-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345ce4cf42', '2024-12-06 19:43:29', '2024-12-06 19:43:29'),
(1134, 1, '675345cf3b556', '1efb401f-b189-6762-b761-022e034bb8b0', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345cf3b556', '2024-12-06 19:43:30', '2024-12-06 19:43:30'),
(1135, 1, '675345d039b86', '1efb401f-bb02-6bcc-8b00-c66688b2dfa6', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345d039b86', '2024-12-06 19:43:31', '2024-12-06 19:43:31'),
(1136, 1, '675345d12454b', '1efb401f-c3b6-658e-99b4-d295a5e329b8', '1543462', '1543462', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '675345d12454b', '2024-12-06 19:43:32', '2024-12-06 19:43:32'),
(1137, 1, '675345d363c45', '1efb401f-d943-6f96-97b3-760b47891a67', '1543462', '1543462', 'win', 'balance_withdrawal', 0.25, 'play_fiver', 0, 1, '675345d363c45', '2024-12-06 19:43:35', '2024-12-06 19:43:35'),
(1138, 1, '675345d585a05', '1efb401f-eda8-6d74-b9a1-92dcde6e0983', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345d585a05', '2024-12-06 19:43:36', '2024-12-06 19:43:36'),
(1139, 1, '675345d68104a', '1efb401f-f704-6288-a9aa-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345d68104a', '2024-12-06 19:43:38', '2024-12-06 19:43:38'),
(1140, 1, '675345d79135f', '1efb4020-012f-6762-bf27-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345d79135f', '2024-12-06 19:43:38', '2024-12-06 19:43:38'),
(1141, 1, '675345d87f02c', '1efb4020-0a02-6e70-b565-022e034bb8b0', '1543462', '1543462', 'win', 'balance_withdrawal', 0.25, 'play_fiver', 0, 1, '675345d87f02c', '2024-12-06 19:43:39', '2024-12-06 19:43:39'),
(1142, 1, '675345e420396', '1efb4020-78bf-6e3a-a2ee-b6d2b01ed606', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345e420396', '2024-12-06 19:43:51', '2024-12-06 19:43:51'),
(1143, 1, '675345e6dfbc7', '1efb4020-934d-6cac-87c9-da182322df93', '1543462', '1543462', 'win', 'balance_withdrawal', 0.15, 'play_fiver', 0, 1, '675345e6dfbc7', '2024-12-06 19:43:54', '2024-12-06 19:43:54'),
(1144, 1, '675345e8eb1d9', '1efb4020-a6d2-66ce-91d5-022e034bb8b0', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345e8eb1d9', '2024-12-06 19:43:56', '2024-12-06 19:43:56'),
(1145, 1, '675345e9c8698', '1efb4020-af00-6cb0-8320-ce7ceabc0ec7', '1543462', '1543462', 'win', 'balance_withdrawal', 0.25, 'play_fiver', 0, 1, '675345e9c8698', '2024-12-06 19:43:56', '2024-12-06 19:43:56'),
(1146, 1, '675345f7e8fa1', '1efb4021-35ca-637c-a2ea-ce7ceabc0ec7', '1543462', '1543462', 'win', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345f7e8fa1', '2024-12-06 19:44:11', '2024-12-06 19:44:11'),
(1147, 1, '675345fb1ad2f', '1efb4021-53e2-6c7e-a546-b6d2b01ed606', '1543462', '1543462', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '675345fb1ad2f', '2024-12-06 19:44:14', '2024-12-06 19:44:14'),
(1148, 1, '675345fd21120', '1efb4021-6733-697c-a1ed-92dcde6e0983', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345fd21120', '2024-12-06 19:44:16', '2024-12-06 19:44:16'),
(1149, 1, '675345fe19d39', '1efb4021-7074-6f7c-a442-92dcde6e0983', '1543462', '1543462', 'win', 'balance_withdrawal', 0.15, 'play_fiver', 0, 1, '675345fe19d39', '2024-12-06 19:44:17', '2024-12-06 19:44:17'),
(1150, 1, '675345ffef4a8', '1efb4021-8255-6098-8e5b-92dcde6e0983', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '675345ffef4a8', '2024-12-06 19:44:19', '2024-12-06 19:44:19'),
(1151, 1, '67534600bbddb', '1efb4021-89db-6b14-b5d2-da182322df93', '1543462', '1543462', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '67534600bbddb', '2024-12-06 19:44:19', '2024-12-06 19:44:19'),
(1152, 1, '67534651282ec', '1efb4024-8890-6ea0-8e3c-c66688b2dfa6', '1543462', '1543462', 'win', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '67534651282ec', '2024-12-06 19:45:40', '2024-12-06 19:45:40'),
(1153, 1, '6753465354827', '1efb4024-9d5e-6e0e-897f-ce7ceabc0ec7', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '6753465354827', '2024-12-06 19:45:42', '2024-12-06 19:45:42'),
(1154, 1, '67536f54b79e5', '1efb41ab-ac68-67f0-8105-92dcde6e0983', '9873', '9873', 'bet', 'balance_withdrawal', 0.30, 'play_fiver', 0, 1, '67536f54b79e5', '2024-12-06 22:40:39', '2024-12-06 22:40:39'),
(1155, 1, '67536f573ecd9', '1efb41ab-c44b-67a0-9c3e-b6d2b01ed606', '9873', '9873', 'bet', 'balance_withdrawal', 0.30, 'play_fiver', 0, 1, '67536f573ecd9', '2024-12-06 22:40:42', '2024-12-06 22:40:42'),
(1156, 1, '67536f5815a26', '1efb41ab-cc3a-636c-b9ab-5e3a43492142', '9873', '9873', 'win', 'balance', 0.30, 'play_fiver', 0, 1, '67536f5815a26', '2024-12-06 22:40:43', '2024-12-06 22:40:43'),
(1157, 1, '6758b40cecef5', '1efb73ea-10e7-64e0-a5c5-b2bb3ed56d66', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6758b40cecef5', '2024-12-10 22:35:12', '2024-12-10 22:35:12'),
(1158, 1, '6758b40de8134', '1efb73ea-1a40-62b2-bd4d-eae674edc9db', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '6758b40de8134', '2024-12-10 22:35:13', '2024-12-10 22:35:13'),
(1159, 1, '6758b40fbbb82', '1efb73ea-2b97-6628-ae27-fafef05399d6', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6758b40fbbb82', '2024-12-10 22:35:15', '2024-12-10 22:35:15'),
(1160, 1, '6758b4111ebd2', '1efb73ea-3888-645e-8cf2-fa89f36cf9e1', '126', '126', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758b4111ebd2', '2024-12-10 22:35:17', '2024-12-10 22:35:17'),
(1161, 1, '6758b412bc7cb', '1efb73ea-483b-637e-a587-7275c1852956', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6758b412bc7cb', '2024-12-10 22:35:18', '2024-12-10 22:35:18'),
(1162, 1, '6758b4143b3cf', '1efb73ea-5641-68f6-a4ee-fa89f36cf9e1', '126', '126', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, '6758b4143b3cf', '2024-12-10 22:35:20', '2024-12-10 22:35:20'),
(1163, 1, '6758b41665d4a', '1efb73ea-6afe-635c-8203-eae674edc9db', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '6758b41665d4a', '2024-12-10 22:35:22', '2024-12-10 22:35:22'),
(1164, 1, '6758b4176262f', '1efb73ea-7465-69e0-b8a7-922188687c61', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '6758b4176262f', '2024-12-10 22:35:23', '2024-12-10 22:35:23'),
(1165, 1, '6758b41860cd4', '1efb73ea-7dde-6c42-9380-0aea72ecdc4a', '126', '126', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, '6758b41860cd4', '2024-12-10 22:35:24', '2024-12-10 22:35:24'),
(1166, 1, '6758b41ac1e22', '1efb73ea-94bc-666c-bccb-be93a0ea2c6a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b41ac1e22', '2024-12-10 22:35:27', '2024-12-10 22:35:27'),
(1167, 1, '6758b41bc7bad', '1efb73ea-9e80-6d92-aa3d-0aea72ecdc4a', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b41bc7bad', '2024-12-10 22:35:28', '2024-12-10 22:35:28'),
(1168, 1, '6758b41f4cf07', '1efb73ea-bfda-6858-b173-0aea72ecdc4a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b41f4cf07', '2024-12-10 22:35:31', '2024-12-10 22:35:31'),
(1169, 1, '6758b421dee3d', '1efb73ea-d8a0-6b8a-a93c-be93a0ea2c6a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b421dee3d', '2024-12-10 22:35:35', '2024-12-10 22:35:35'),
(1170, 1, '6758b426b8aa1', '1efb73eb-06d1-60a4-9646-922188687c61', '126', '126', 'win', 'balance_withdrawal', 6.40, 'play_fiver', 0, 1, '6758b426b8aa1', '2024-12-10 22:35:39', '2024-12-10 22:35:39'),
(1171, 1, '6758b4286ca36', '1efb73eb-16eb-699e-a117-eae674edc9db', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b4286ca36', '2024-12-10 22:35:41', '2024-12-10 22:35:41'),
(1172, 1, '6758b42a83a97', '1efb73eb-2ae4-6c16-b53c-7275c1852956', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b42a83a97', '2024-12-10 22:35:43', '2024-12-10 22:35:43'),
(1173, 1, '6758b42c3ab93', '1efb73eb-3b1e-61cc-a694-7275c1852956', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b42c3ab93', '2024-12-10 22:35:44', '2024-12-10 22:35:44'),
(1174, 1, '6758b42fdd284', '1efb73eb-5e12-6ae8-8b9c-3a2653238177', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b42fdd284', '2024-12-10 22:35:48', '2024-12-10 22:35:48'),
(1175, 1, '6758b43326bb2', '1efb73eb-7d18-610e-ba53-fa89f36cf9e1', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b43326bb2', '2024-12-10 22:35:51', '2024-12-10 22:35:51'),
(1176, 1, '6758b435965a5', '1efb73eb-9487-6132-9fd6-eae674edc9db', '126', '126', 'win', 'balance_withdrawal', 9.60, 'play_fiver', 0, 1, '6758b435965a5', '2024-12-10 22:35:53', '2024-12-10 22:35:53'),
(1177, 1, '6758b44fb47d2', '1efb73ec-8da8-6fd6-ad4b-3a2653238177', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b44fb47d2', '2024-12-10 22:36:19', '2024-12-10 22:36:19'),
(1178, 1, '6758b4520a622', '1efb73ec-a3a0-6276-93f2-d638298ebc9e', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b4520a622', '2024-12-10 22:36:22', '2024-12-10 22:36:22'),
(1179, 1, '6758b453a6b4b', '1efb73ec-b344-6ef2-aaa3-be93a0ea2c6a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758b453a6b4b', '2024-12-10 22:36:23', '2024-12-10 22:36:23'),
(1180, 1, '6758b454b59cb', '1efb73ec-bd63-6334-9ca8-fafef05399d6', '126', '126', 'win', 'balance_withdrawal', 20.00, 'play_fiver', 0, 1, '6758b454b59cb', '2024-12-10 22:36:25', '2024-12-10 22:36:25'),
(1181, 1, '1efb7418-6163-633c-aa47-6af27077bab1', '1efb7418-616e-669c-9337-6af27077bab1', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7418-6163-633c-aa47-6af27077bab1', '2024-12-10 22:55:56', '2024-12-10 22:55:56'),
(1182, 1, '1efb7418-7d26-63a8-a069-2e6678921cd3', '1efb7418-7d30-692a-832b-2e6678921cd3', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7418-7d26-63a8-a069-2e6678921cd3', '2024-12-10 22:55:59', '2024-12-10 22:55:59'),
(1183, 1, '1efb7418-a639-6966-a6a0-725bfeab23df', '1efb7418-a643-6542-b482-725bfeab23df', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7418-a639-6966-a6a0-725bfeab23df', '2024-12-10 22:56:04', '2024-12-10 22:56:04'),
(1184, 1, '1efb7418-bf08-6744-bf82-36cd4963c2ad', '1efb7418-bf13-69a0-911d-36cd4963c2ad', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7418-bf08-6744-bf82-36cd4963c2ad', '2024-12-10 22:56:05', '2024-12-10 22:56:05'),
(1185, 1, '1efb741a-9cf0-643e-9ee4-eae674edc9db', '1efb741a-9cfa-6222-ac73-eae674edc9db', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb741a-9cf0-643e-9ee4-eae674edc9db', '2024-12-10 22:56:57', '2024-12-10 22:56:57'),
(1186, 1, '1efb741a-b6a5-6ec4-a1e4-725bfeab23df', '1efb741a-b6b0-60b8-889f-725bfeab23df', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 100.00, 'play_fiver', 0, 1, '1efb741a-b6a5-6ec4-a1e4-725bfeab23df', '2024-12-10 22:56:58', '2024-12-10 22:56:58'),
(1187, 1, '1efb741c-6133-6732-bd50-06b07e10cc8f', '1efb741c-613d-6962-936e-06b07e10cc8f', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb741c-6133-6732-bd50-06b07e10cc8f', '2024-12-10 22:57:44', '2024-12-10 22:57:44'),
(1188, 1, '1efb741c-7f84-689e-9de3-725bfeab23df', '1efb741c-7f8f-6bcc-8299-725bfeab23df', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb741c-7f84-689e-9de3-725bfeab23df', '2024-12-10 22:57:46', '2024-12-10 22:57:46'),
(1189, 1, '1efb741d-91bd-6302-8c58-2e6678921cd3', '1efb741d-91c8-60f4-98c8-2e6678921cd3', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741d-91bd-6302-8c58-2e6678921cd3', '2024-12-10 22:58:16', '2024-12-10 22:58:16'),
(1190, 1, '1efb741d-a9d5-6cfa-95f0-6af27077bab1', '1efb741d-a9e0-68bc-b54d-6af27077bab1', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741d-a9d5-6cfa-95f0-6af27077bab1', '2024-12-10 22:58:19', '2024-12-10 22:58:19'),
(1191, 1, '1efb741d-f125-62e0-bc6c-7275c1852956', '1efb741d-f130-62c6-9e25-7275c1852956', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741d-f125-62e0-bc6c-7275c1852956', '2024-12-10 22:58:26', '2024-12-10 22:58:26'),
(1192, 1, '1efb741e-0396-68fc-9be8-eae674edc9db', '1efb741e-03a2-6ba2-b7ee-eae674edc9db', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741e-0396-68fc-9be8-eae674edc9db', '2024-12-10 22:58:27', '2024-12-10 22:58:27'),
(1193, 1, '1efb741e-0e6b-6a16-84cd-922188687c61', '1efb741e-0e76-6948-8c9d-922188687c61', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741e-0e6b-6a16-84cd-922188687c61', '2024-12-10 22:58:28', '2024-12-10 22:58:28'),
(1194, 1, '1efb741e-3ed8-60b4-a732-fafef05399d6', '1efb741e-3ee5-68b8-ae69-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741e-3ed8-60b4-a732-fafef05399d6', '2024-12-10 22:58:34', '2024-12-10 22:58:34'),
(1195, 1, '1efb741e-4a41-6e5a-91a1-eae674edc9db', '1efb741e-4a4c-6936-8a82-eae674edc9db', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb741e-4a41-6e5a-91a1-eae674edc9db', '2024-12-10 22:58:34', '2024-12-10 22:58:34'),
(1196, 1, '1efb7420-c61c-6fb4-96f6-36cd4963c2ad', '1efb7420-c627-66da-b16e-36cd4963c2ad', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7420-c61c-6fb4-96f6-36cd4963c2ad', '2024-12-10 22:59:41', '2024-12-10 22:59:41'),
(1197, 1, '1efb7420-edc5-655c-aa66-eae674edc9db', '1efb7420-edd0-6cea-b6f4-eae674edc9db', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7420-edc5-655c-aa66-eae674edc9db', '2024-12-10 22:59:47', '2024-12-10 22:59:47'),
(1198, 1, '1efb7420-fc89-6af2-a817-2e6678921cd3', '1efb7420-fc94-6e0c-9401-2e6678921cd3', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7420-fc89-6af2-a817-2e6678921cd3', '2024-12-10 22:59:47', '2024-12-10 22:59:47'),
(1199, 1, '1efb7421-1803-6a76-a289-6af27077bab1', '1efb7421-180d-6bde-92a2-6af27077bab1', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7421-1803-6a76-a289-6af27077bab1', '2024-12-10 22:59:50', '2024-12-10 22:59:50'),
(1200, 1, '1efb7421-2423-6e00-b129-0aea72ecdc4a', '1efb7421-242e-656c-b829-0aea72ecdc4a', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7421-2423-6e00-b129-0aea72ecdc4a', '2024-12-10 22:59:52', '2024-12-10 22:59:52'),
(1201, 1, '1efb7425-4725-6e18-9fb3-fafef05399d6', '1efb7425-4731-6038-9e5f-fafef05399d6', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 0.20, 'play_fiver', 0, 1, '1efb7425-4725-6e18-9fb3-fafef05399d6', '2024-12-10 23:01:42', '2024-12-10 23:01:42'),
(1202, 1, '1efb7425-540a-6840-8c03-0aea72ecdc4a', '1efb7425-5414-67b4-bb9e-0aea72ecdc4a', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 0.20, 'play_fiver', 0, 1, '1efb7425-540a-6840-8c03-0aea72ecdc4a', '2024-12-10 23:01:43', '2024-12-10 23:01:43'),
(1203, 1, '1efb7425-62ed-6254-81ee-2e6678921cd3', '1efb7425-62f6-6dc2-b567-2e6678921cd3', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 0.20, 'play_fiver', 0, 1, '1efb7425-62ed-6254-81ee-2e6678921cd3', '2024-12-10 23:01:45', '2024-12-10 23:01:45'),
(1204, 1, '1efb7425-75dc-6c20-93ed-2e6678921cd3', '1efb7425-75e6-6bb2-ad59-2e6678921cd3', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 0.20, 'play_fiver', 0, 1, '1efb7425-75dc-6c20-93ed-2e6678921cd3', '2024-12-10 23:01:47', '2024-12-10 23:01:47'),
(1205, 1, '1efb7425-88f7-6440-ad47-6af27077bab1', '1efb7425-8902-69ee-b94c-6af27077bab1', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 0.20, 'play_fiver', 0, 1, '1efb7425-88f7-6440-ad47-6af27077bab1', '2024-12-10 23:01:49', '2024-12-10 23:01:49'),
(1206, 1, '1efb7426-67cd-65ac-b540-2e6678921cd3', '1efb7426-67d8-66be-b310-2e6678921cd3', 'vs20olympgate', 'vs20olympgate', 'bet', 'balance_withdrawal', 0.20, 'play_fiver', 0, 1, '1efb7426-67cd-65ac-b540-2e6678921cd3', '2024-12-10 23:02:13', '2024-12-10 23:02:13'),
(1207, 1, '1efb7432-6f9a-6666-bce0-0aea72ecdc4a', '1efb7432-6fa4-69f4-ada8-0aea72ecdc4a', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-6f9a-6666-bce0-0aea72ecdc4a', '2024-12-10 23:07:35', '2024-12-10 23:07:35'),
(1208, 1, '1efb7432-7b2b-6c82-92bb-ca626f10c887', '1efb7432-7b36-651a-9bd9-ca626f10c887', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-7b2b-6c82-92bb-ca626f10c887', '2024-12-10 23:07:36', '2024-12-10 23:07:36'),
(1209, 1, '1efb7432-8c69-6ff8-9d73-ca626f10c887', '1efb7432-8c73-6bfc-9314-ca626f10c887', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-8c69-6ff8-9d73-ca626f10c887', '2024-12-10 23:07:38', '2024-12-10 23:07:38'),
(1210, 1, '1efb7432-97ff-61ec-8bd6-7275c1852956', '1efb7432-980a-6376-a729-7275c1852956', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-97ff-61ec-8bd6-7275c1852956', '2024-12-10 23:07:39', '2024-12-10 23:07:39'),
(1211, 1, '1efb7432-a384-6436-9e25-a6b8f31139d4', '1efb7432-a38f-6110-ad77-a6b8f31139d4', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-a384-6436-9e25-a6b8f31139d4', '2024-12-10 23:07:41', '2024-12-10 23:07:41'),
(1212, 1, '1efb7432-c150-6bcc-9db3-76519a732c87', '1efb7432-c15b-6374-bbfc-76519a732c87', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-c150-6bcc-9db3-76519a732c87', '2024-12-10 23:07:44', '2024-12-10 23:07:44'),
(1213, 1, '1efb7432-d9f1-6cc6-b210-ca626f10c887', '1efb7432-d9fc-6630-aa9f-ca626f10c887', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-d9f1-6cc6-b210-ca626f10c887', '2024-12-10 23:07:46', '2024-12-10 23:07:46'),
(1214, 1, '1efb7432-ec1e-6444-8e0d-76519a732c87', '1efb7432-ec28-65de-b9fd-76519a732c87', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7432-ec1e-6444-8e0d-76519a732c87', '2024-12-10 23:07:48', '2024-12-10 23:07:48'),
(1215, 1, '1efb7434-2fd4-68b8-94a7-ca626f10c887', '1efb7434-2fde-6c28-81f1-ca626f10c887', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.06, 'play_fiver', 0, 1, '1efb7434-2fd4-68b8-94a7-ca626f10c887', '2024-12-10 23:08:22', '2024-12-10 23:08:22'),
(1216, 1, '1efb7434-3f67-68a2-ab78-0aea72ecdc4a', '1efb7434-3f73-63d2-aef7-0aea72ecdc4a', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb7434-3f67-68a2-ab78-0aea72ecdc4a', '2024-12-10 23:08:24', '2024-12-10 23:08:24'),
(1217, 1, '1efb7434-4b6a-66a4-8281-7275c1852956', '1efb7434-4b75-61d0-ba3f-7275c1852956', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 1.56, 'play_fiver', 0, 1, '1efb7434-4b6a-66a4-8281-7275c1852956', '2024-12-10 23:08:25', '2024-12-10 23:08:25'),
(1218, 1, '1efb7434-9a84-656e-8ea1-fafef05399d6', '1efb7434-9a8e-6a96-b4a7-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7434-9a84-656e-8ea1-fafef05399d6', '2024-12-10 23:08:33', '2024-12-10 23:08:33'),
(1219, 1, '1efb7434-b81c-6ce8-97f0-0aea72ecdc4a', '1efb7434-b826-6a90-9624-0aea72ecdc4a', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '1efb7434-b81c-6ce8-97f0-0aea72ecdc4a', '2024-12-10 23:08:36', '2024-12-10 23:08:36'),
(1220, 1, '1efb7434-e275-6f9e-8959-a6b8f31139d4', '1efb7434-e27f-6e36-8432-a6b8f31139d4', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7434-e275-6f9e-8959-a6b8f31139d4', '2024-12-10 23:08:41', '2024-12-10 23:08:41'),
(1221, 1, '1efb7435-02e5-65c2-8ba9-ca626f10c887', '1efb7435-02ef-6efa-8670-ca626f10c887', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7435-02e5-65c2-8ba9-ca626f10c887', '2024-12-10 23:08:44', '2024-12-10 23:08:44'),
(1222, 1, '1efb7435-0f1c-6502-b909-922188687c61', '1efb7435-0f26-685e-9ed6-922188687c61', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7435-0f1c-6502-b909-922188687c61', '2024-12-10 23:08:46', '2024-12-10 23:08:46'),
(1223, 1, '1efb7435-20be-6aee-a844-de446cbc30ed', '1efb7435-20c9-63fe-b205-de446cbc30ed', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7435-20be-6aee-a844-de446cbc30ed', '2024-12-10 23:08:47', '2024-12-10 23:08:47'),
(1224, 1, '1efb7435-2bd5-6978-b959-922188687c61', '1efb7435-2be0-635a-84e0-922188687c61', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7435-2bd5-6978-b959-922188687c61', '2024-12-10 23:08:49', '2024-12-10 23:08:49'),
(1225, 1, '1efb7435-36cf-69d2-92b2-fafef05399d6', '1efb7435-36dc-6704-a0fc-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7435-36cf-69d2-92b2-fafef05399d6', '2024-12-10 23:08:50', '2024-12-10 23:08:50'),
(1226, 1, '1efb7435-4742-6cf6-9fb3-a6b8f31139d4', '1efb7435-474d-6b38-bbe6-a6b8f31139d4', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-4742-6cf6-9fb3-a6b8f31139d4', '2024-12-10 23:08:51', '2024-12-10 23:08:51'),
(1227, 1, '1efb7435-59be-63ee-8acc-ca626f10c887', '1efb7435-59c9-6230-8f74-ca626f10c887', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-59be-63ee-8acc-ca626f10c887', '2024-12-10 23:08:53', '2024-12-10 23:08:53'),
(1228, 1, '1efb7435-65a4-6a1e-ba54-922188687c61', '1efb7435-65af-6054-a9e7-922188687c61', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-65a4-6a1e-ba54-922188687c61', '2024-12-10 23:08:56', '2024-12-10 23:08:56'),
(1229, 1, '1efb7435-8c0e-67fe-ade7-fafef05399d6', '1efb7435-8c19-6960-a278-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 11.20, 'play_fiver', 0, 1, '1efb7435-8c0e-67fe-ade7-fafef05399d6', '2024-12-10 23:08:59', '2024-12-10 23:08:59'),
(1230, 1, '1efb7435-af79-63e2-a45c-7275c1852956', '1efb7435-af83-62fc-88e0-7275c1852956', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-af79-63e2-a45c-7275c1852956', '2024-12-10 23:09:02', '2024-12-10 23:09:02'),
(1231, 1, '1efb7435-bae7-6026-8f20-0aea72ecdc4a', '1efb7435-baf5-655e-b5b8-0aea72ecdc4a', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-bae7-6026-8f20-0aea72ecdc4a', '2024-12-10 23:09:04', '2024-12-10 23:09:04'),
(1232, 1, '1efb7435-d30c-6d68-af4c-0aea72ecdc4a', '1efb7435-d31a-65da-99b2-0aea72ecdc4a', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-d30c-6d68-af4c-0aea72ecdc4a', '2024-12-10 23:09:06', '2024-12-10 23:09:06'),
(1233, 1, '1efb7435-de67-6730-9b52-eae674edc9db', '1efb7435-de73-6eae-86b3-eae674edc9db', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-de67-6730-9b52-eae674edc9db', '2024-12-10 23:09:08', '2024-12-10 23:09:08'),
(1234, 1, '1efb7435-eff1-6fdc-a58e-de446cbc30ed', '1efb7435-effc-69f0-8a4b-de446cbc30ed', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7435-eff1-6fdc-a58e-de446cbc30ed', '2024-12-10 23:09:09', '2024-12-10 23:09:09'),
(1235, 1, '1efb7436-3073-6880-9064-922188687c61', '1efb7436-307d-6b14-a76a-922188687c61', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7436-3073-6880-9064-922188687c61', '2024-12-10 23:09:16', '2024-12-10 23:09:16');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(1236, 1, '1efb7436-5389-6d2e-bd7a-fafef05399d6', '1efb7436-5394-6012-8f57-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1efb7436-5389-6d2e-bd7a-fafef05399d6', '2024-12-10 23:09:20', '2024-12-10 23:09:20'),
(1237, 1, '1efb7436-66be-61ce-93ed-fafef05399d6', '1efb7436-66c8-6cb4-abab-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 80.00, 'play_fiver', 0, 1, '1efb7436-66be-61ce-93ed-fafef05399d6', '2024-12-10 23:09:21', '2024-12-10 23:09:21'),
(1238, 1, '1efb7442-bd47-6b56-9b23-eae674edc9db', '1efb7442-bd53-63ac-bf66-eae674edc9db', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb7442-bd47-6b56-9b23-eae674edc9db', '2024-12-10 23:14:53', '2024-12-10 23:14:53'),
(1239, 1, '1efb7442-d7b1-623a-9a53-922188687c61', '1efb7442-d7bb-6a96-9e43-922188687c61', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efb7442-d7b1-623a-9a53-922188687c61', '2024-12-10 23:14:56', '2024-12-10 23:14:56'),
(1240, 1, '1efb7443-12f7-6db2-8e42-fafef05399d6', '1efb7443-1303-616c-9b5e-fafef05399d6', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 7.50, 'play_fiver', 0, 1, '1efb7443-12f7-6db2-8e42-fafef05399d6', '2024-12-10 23:15:02', '2024-12-10 23:15:02'),
(1241, 1, '6758efda3d98b', '1efb7624-6198-65b0-8e46-4e56cf415e22', '126', '126', 'win', 'balance_withdrawal', 8.00, 'play_fiver', 0, 1, '6758efda3d98b', '2024-12-11 02:50:24', '2024-12-11 02:50:24'),
(1242, 1, '6758efeca90e9', '1efb7625-1173-6980-9230-a61807786fb5', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758efeca90e9', '2024-12-11 02:50:42', '2024-12-11 02:50:42'),
(1243, 1, '6758efedc480f', '1efb7625-1c0f-652e-96a0-0aea72ecdc4a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758efedc480f', '2024-12-11 02:50:42', '2024-12-11 02:50:42'),
(1244, 1, '6758efeeebe91', '1efb7625-2722-6a6a-bd1e-5621b9131826', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758efeeebe91', '2024-12-11 02:50:44', '2024-12-11 02:50:44'),
(1245, 1, '6758eff032e1a', '1efb7625-32fb-6526-8d01-0adbc2b90c0f', '126', '126', 'win', 'balance_withdrawal', 80.00, 'play_fiver', 0, 1, '6758eff032e1a', '2024-12-11 02:50:45', '2024-12-11 02:50:45'),
(1246, 1, '6758eff4c434f', '1efb7625-5ece-67e8-a13b-a61807786fb5', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758eff4c434f', '2024-12-11 02:50:49', '2024-12-11 02:50:49'),
(1247, 1, '6758eff5ec885', '1efb7625-69eb-6c52-b654-0adbc2b90c0f', '126', '126', 'win', 'balance_withdrawal', 80.00, 'play_fiver', 0, 1, '6758eff5ec885', '2024-12-11 02:50:50', '2024-12-11 02:50:50'),
(1248, 1, '6758effc7a35f', '1efb7625-a836-68ae-ba24-fafef05399d6', '126', '126', 'win', 'balance_withdrawal', 4000.00, 'play_fiver', 0, 1, '6758effc7a35f', '2024-12-11 02:50:57', '2024-12-11 02:50:57'),
(1249, 1, '6758f03682a74', '1efb7627-d1ab-6c28-9299-6a05a8f4004d', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f03682a74', '2024-12-11 02:51:54', '2024-12-11 02:51:54'),
(1250, 1, '6758f0395db50', '1efb7627-ecd6-6b42-bd79-0adbc2b90c0f', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f0395db50', '2024-12-11 02:51:57', '2024-12-11 02:51:57'),
(1251, 1, '6758f03c2cf25', '1efb7628-078a-6e5c-9575-7275c1852956', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f03c2cf25', '2024-12-11 02:52:01', '2024-12-11 02:52:01'),
(1252, 1, '6758f03d6aa2f', '1efb7628-137d-61e2-8c46-4e56cf415e22', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f03d6aa2f', '2024-12-11 02:52:01', '2024-12-11 02:52:01'),
(1253, 1, '6758f03ea2746', '1efb7628-1f35-607a-8ba2-fafef05399d6', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f03ea2746', '2024-12-11 02:52:03', '2024-12-11 02:52:03'),
(1254, 1, '6758f03fd17f9', '1efb7628-2a94-6e16-8635-76e104a44ae9', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f03fd17f9', '2024-12-11 02:52:04', '2024-12-11 02:52:04'),
(1255, 1, '6758f04109648', '1efb7628-35d6-6b6c-9187-e26902eeb194', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6758f04109648', '2024-12-11 02:52:05', '2024-12-11 02:52:05'),
(1256, 1, '6758f04368dd6', '1efb7628-4ca3-6dea-a4e7-5621b9131826', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04368dd6', '2024-12-11 02:52:08', '2024-12-11 02:52:08'),
(1257, 1, '6758f04479fa8', '1efb7628-56d8-6f18-b4a1-9e8296b3b2a3', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04479fa8', '2024-12-11 02:52:09', '2024-12-11 02:52:09'),
(1258, 1, '6758f0459f4d8', '1efb7628-61d7-63d8-aeaf-364cb06428da', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0459f4d8', '2024-12-11 02:52:09', '2024-12-11 02:52:09'),
(1259, 1, '6758f0469d24c', '1efb7628-6b4a-6df2-9345-eae674edc9db', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0469d24c', '2024-12-11 02:52:10', '2024-12-11 02:52:10'),
(1260, 1, '6758f047e58b7', '1efb7628-77a8-6400-9857-560d7287af69', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f047e58b7', '2024-12-11 02:52:11', '2024-12-11 02:52:11'),
(1261, 1, '6758f049b78f8', '1efb7628-88ef-6bd2-afb5-560d7287af69', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f049b78f8', '2024-12-11 02:52:14', '2024-12-11 02:52:14'),
(1262, 1, '6758f04ad87c9', '1efb7628-93c1-6ea2-9339-fafef05399d6', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04ad87c9', '2024-12-11 02:52:15', '2024-12-11 02:52:15'),
(1263, 1, '6758f04c01799', '1efb7628-9e6f-63cc-8b0c-922188687c61', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04c01799', '2024-12-11 02:52:16', '2024-12-11 02:52:16'),
(1264, 1, '6758f04d0aeb5', '1efb7628-a856-67d2-b411-a61807786fb5', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04d0aeb5', '2024-12-11 02:52:17', '2024-12-11 02:52:17'),
(1265, 1, '6758f04e3e25d', '1efb7628-b3e0-6738-b593-7e3f4cc91855', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04e3e25d', '2024-12-11 02:52:18', '2024-12-11 02:52:18'),
(1266, 1, '6758f04f6445d', '1efb7628-bee6-6e0c-890e-5621b9131826', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f04f6445d', '2024-12-11 02:52:20', '2024-12-11 02:52:20'),
(1267, 1, '6758f0508acbb', '1efb7628-c9f1-6cb6-b748-560d7287af69', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0508acbb', '2024-12-11 02:52:22', '2024-12-11 02:52:22'),
(1268, 1, '6758f051b64c0', '1efb7628-d52e-6048-ae6d-76e104a44ae9', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f051b64c0', '2024-12-11 02:52:22', '2024-12-11 02:52:22'),
(1269, 1, '6758f053e3265', '1efb7628-ea01-69e8-978e-9e8296b3b2a3', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f053e3265', '2024-12-11 02:52:24', '2024-12-11 02:52:24'),
(1270, 1, '6758f052d4244', '1efb7628-dfe2-6034-8b56-7e3f4cc91855', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f052d4244', '2024-12-11 02:52:24', '2024-12-11 02:52:24'),
(1271, 1, '6758f054e624b', '1efb7628-f3a8-6e10-b5f5-364cb06428da', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f054e624b', '2024-12-11 02:52:25', '2024-12-11 02:52:25'),
(1272, 1, '6758f05613fdb', '1efb7628-fe86-660c-a2b7-364cb06428da', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05613fdb', '2024-12-11 02:52:26', '2024-12-11 02:52:26'),
(1273, 1, '6758f0582cb3b', '1efb7629-128f-6cc0-8e84-76e104a44ae9', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0582cb3b', '2024-12-11 02:52:28', '2024-12-11 02:52:28'),
(1274, 1, '6758f0570f483', '1efb7629-07e0-6c34-bbdf-4e56cf415e22', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0570f483', '2024-12-11 02:52:30', '2024-12-11 02:52:30'),
(1275, 1, '6758f05947a50', '1efb7629-1d26-6774-a955-0adbc2b90c0f', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05947a50', '2024-12-11 02:52:30', '2024-12-11 02:52:30'),
(1276, 1, '6758f05b71ceb', '1efb7629-31df-615c-80fd-6a05a8f4004d', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05b71ceb', '2024-12-11 02:52:32', '2024-12-11 02:52:32'),
(1277, 1, '6758f05c8490e', '1efb7629-3c24-6536-876d-364cb06428da', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05c8490e', '2024-12-11 02:52:34', '2024-12-11 02:52:34'),
(1278, 1, '6758f05d91348', '1efb7629-462c-6236-95f4-a61807786fb5', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05d91348', '2024-12-11 02:52:35', '2024-12-11 02:52:35'),
(1279, 1, '6758f05e80c56', '1efb7629-4f11-6446-879e-e26902eeb194', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05e80c56', '2024-12-11 02:52:37', '2024-12-11 02:52:37'),
(1280, 1, '6758f05f8b82a', '1efb7629-5906-61ea-9dce-5621b9131826', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f05f8b82a', '2024-12-11 02:52:37', '2024-12-11 02:52:37'),
(1281, 1, '6758f0609484e', '1efb7629-62ea-610c-a607-7e3f4cc91855', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0609484e', '2024-12-11 02:52:39', '2024-12-11 02:52:39'),
(1282, 1, '6758f0619b62d', '1efb7629-6cb7-6b4e-bc55-be0e94f3c4b4', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f0619b62d', '2024-12-11 02:52:40', '2024-12-11 02:52:40'),
(1283, 1, '6758f062d134c', '1efb7629-785b-62f2-86da-96922361111a', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f062d134c', '2024-12-11 02:52:41', '2024-12-11 02:52:41'),
(1284, 1, '6758f4bee2df2', '1efb7653-0c0d-6e72-a2bf-bef6bf31119d', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4bee2df2', '2024-12-11 03:11:15', '2024-12-11 03:11:15'),
(1285, 1, '6758f4bfd8c98', '1efb7653-1531-6e68-ba2f-06cbfb82757f', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4bfd8c98', '2024-12-11 03:11:16', '2024-12-11 03:11:16'),
(1286, 1, '6758f4c127a62', '1efb7653-2159-6ede-aecf-b2f2da451c82', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c127a62', '2024-12-11 03:11:17', '2024-12-11 03:11:17'),
(1287, 1, '6758f4c2350bc', '1efb7653-2b68-642a-9eeb-62f2dda5bf80', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c2350bc', '2024-12-11 03:11:18', '2024-12-11 03:11:18'),
(1288, 1, '6758f4c3500d8', '1efb7653-3600-6446-aa27-12f676b7fe46', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c3500d8', '2024-12-11 03:11:19', '2024-12-11 03:11:19'),
(1289, 1, '6758f4c460997', '1efb7653-402f-6200-8cb5-1620d1cc01f0', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c460997', '2024-12-11 03:11:20', '2024-12-11 03:11:20'),
(1290, 1, '6758f4c566da0', '1efb7653-49f7-6864-bf93-12f676b7fe46', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c566da0', '2024-12-11 03:11:21', '2024-12-11 03:11:21'),
(1291, 1, '6758f4c66f3da', '1efb7653-53d4-6634-ba39-a2464f12e4b2', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c66f3da', '2024-12-11 03:11:22', '2024-12-11 03:11:22'),
(1292, 1, '6758f4c88a924', '1efb7653-67f8-66e2-b80d-12f676b7fe46', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c88a924', '2024-12-11 03:11:24', '2024-12-11 03:11:24'),
(1293, 1, '6758f4c77ce44', '1efb7653-5de6-635c-979a-b2f2da451c82', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c77ce44', '2024-12-11 03:11:25', '2024-12-11 03:11:25'),
(1294, 1, '6758f4c997433', '1efb7653-7200-6554-9106-52eff4042821', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4c997433', '2024-12-11 03:11:25', '2024-12-11 03:11:25'),
(1295, 1, '6758f4cabe20f', '1efb7653-7d0e-6702-8ba9-86e61cd851d6', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4cabe20f', '2024-12-11 03:11:27', '2024-12-11 03:11:27'),
(1296, 1, '6758f4ccde27d', '1efb7653-9161-6632-9fb5-86e61cd851d6', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4ccde27d', '2024-12-11 03:11:29', '2024-12-11 03:11:29'),
(1297, 1, '6758f4cbc53e6', '1efb7653-86df-6dee-9edc-62f2dda5bf80', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4cbc53e6', '2024-12-11 03:11:29', '2024-12-11 03:11:29'),
(1298, 1, '6758f4ce061f9', '1efb7653-9c04-6026-bb3f-22541a454610', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4ce061f9', '2024-12-11 03:11:30', '2024-12-11 03:11:30'),
(1299, 1, '6758f4e11c352', '1efb7654-5214-6050-9492-86e61cd851d6', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e11c352', '2024-12-11 03:11:49', '2024-12-11 03:11:49'),
(1300, 1, '6758f4e234a39', '1efb7654-5c91-69f6-82cd-62f2dda5bf80', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e234a39', '2024-12-11 03:11:51', '2024-12-11 03:11:51'),
(1301, 1, '6758f4e35731e', '1efb7654-6774-6f76-9ca1-824e28d90a7b', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e35731e', '2024-12-11 03:11:51', '2024-12-11 03:11:51'),
(1302, 1, '6758f4e47f2eb', '1efb7654-728d-6dfe-8f8a-02c6628eece5', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e47f2eb', '2024-12-11 03:11:52', '2024-12-11 03:11:52'),
(1303, 1, '6758f4e582d02', '1efb7654-7c3b-627a-8e98-12f676b7fe46', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e582d02', '2024-12-11 03:11:53', '2024-12-11 03:11:53'),
(1304, 1, '6758f4e69cf80', '1efb7654-86ca-6b0a-9c9b-b6a9149b3cd9', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e69cf80', '2024-12-11 03:11:54', '2024-12-11 03:11:54'),
(1305, 1, '6758f4e7be457', '1efb7654-91a0-699e-859d-52eff4042821', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e7be457', '2024-12-11 03:11:55', '2024-12-11 03:11:55'),
(1306, 1, '6758f4e8c3965', '1efb7654-9b5f-620a-bcee-06cbfb82757f', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e8c3965', '2024-12-11 03:11:57', '2024-12-11 03:11:57'),
(1307, 1, '6758f4ead9a5d', '1efb7654-af4e-6a4a-9a29-62f2dda5bf80', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4ead9a5d', '2024-12-11 03:11:58', '2024-12-11 03:11:58'),
(1308, 1, '6758f4e9ca272', '1efb7654-a52b-6144-821f-b6a9149b3cd9', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f4e9ca272', '2024-12-11 03:11:59', '2024-12-11 03:11:59'),
(1309, 1, '6758f523a0db6', '1efb7656-ccae-6f16-b575-02c6628eece5', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f523a0db6', '2024-12-11 03:12:55', '2024-12-11 03:12:55'),
(1310, 1, '6758f524af982', '1efb7656-d6cb-6986-b6bc-a2464f12e4b2', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f524af982', '2024-12-11 03:12:56', '2024-12-11 03:12:56'),
(1311, 1, '6758f525b9486', '1efb7656-e0b5-6dc0-a11d-86e61cd851d6', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f525b9486', '2024-12-11 03:12:57', '2024-12-11 03:12:57'),
(1312, 1, '6758f526b657d', '1efb7656-ea21-6d3c-b2d9-12f676b7fe46', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f526b657d', '2024-12-11 03:12:58', '2024-12-11 03:12:58'),
(1313, 1, '6758f527d2dde', '1efb7656-f4c8-6830-8732-da2dadcba620', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f527d2dde', '2024-12-11 03:12:59', '2024-12-11 03:12:59'),
(1314, 1, '6758f528df168', '1efb7656-fecc-65fc-890f-52eff4042821', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f528df168', '2024-12-11 03:13:00', '2024-12-11 03:13:00'),
(1315, 1, '6758f52a23438', '1efb7657-0a89-6282-9373-06cbfb82757f', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f52a23438', '2024-12-11 03:13:02', '2024-12-11 03:13:02'),
(1316, 1, '6758f52c1989c', '1efb7657-1d3a-6976-9761-da2dadcba620', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f52c1989c', '2024-12-11 03:13:04', '2024-12-11 03:13:04'),
(1317, 1, '6758f52b03e3f', '1efb7657-12d8-662c-998b-22541a454610', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f52b03e3f', '2024-12-11 03:13:05', '2024-12-11 03:13:05'),
(1318, 1, '6758f52d097c9', '1efb7657-2623-63da-9db4-824e28d90a7b', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f52d097c9', '2024-12-11 03:13:06', '2024-12-11 03:13:06'),
(1319, 1, '6758f52e15d78', '1efb7657-3028-6b5a-8b97-52eff4042821', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f52e15d78', '2024-12-11 03:13:06', '2024-12-11 03:13:06'),
(1320, 1, '6758f52f1a0ac', '1efb7657-39db-68dc-8e82-62f2dda5bf80', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f52f1a0ac', '2024-12-11 03:13:08', '2024-12-11 03:13:08'),
(1321, 1, '6758f5312677d', '1efb7657-4d6a-6e8e-aa0a-62f2dda5bf80', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f5312677d', '2024-12-11 03:13:09', '2024-12-11 03:13:09'),
(1322, 1, '6758f5301edaa', '1efb7657-4395-68be-96f3-a2464f12e4b2', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f5301edaa', '2024-12-11 03:13:10', '2024-12-11 03:13:10'),
(1323, 1, '6758f53234b7f', '1efb7657-5782-6e26-b269-02c6628eece5', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f53234b7f', '2024-12-11 03:13:10', '2024-12-11 03:13:10'),
(1324, 1, '6758f53329bf5', '1efb7657-609e-69c4-9406-d2f7f5da2f30', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f53329bf5', '2024-12-11 03:13:11', '2024-12-11 03:13:11'),
(1325, 1, '6758f5343a011', '1efb7657-6aca-6772-bfb0-824e28d90a7b', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6758f5343a011', '2024-12-11 03:13:12', '2024-12-11 03:13:12'),
(1326, 1, '675901cdc58c9', '1efb76cf-943d-6078-bc04-02c6628eece5', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '675901cdc58c9', '2024-12-11 04:06:58', '2024-12-11 04:06:58'),
(1327, 1, '675901d1c384c', '1efb76cf-ba4e-6474-a5c7-12da95e6e621', '126', '126', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, '675901d1c384c', '2024-12-11 04:07:01', '2024-12-11 04:07:01'),
(1328, 1, '675901dd04ec5', '1efb76d0-254c-6fa0-8657-a2464f12e4b2', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '675901dd04ec5', '2024-12-11 04:07:12', '2024-12-11 04:07:12'),
(1329, 1, '6759025240feb', '1efb76d4-8372-6f7c-8d0e-12da95e6e621', '126', '126', 'win', 'balance_withdrawal', 6.40, 'play_fiver', 0, 1, '6759025240feb', '2024-12-11 04:09:10', '2024-12-11 04:09:10'),
(1330, 1, '1efb76d6-0916-6e0c-8fed-d2f7f5da2f30', '1efb76d6-0921-68de-976c-d2f7f5da2f30', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 3.00, 'play_fiver', 0, 1, '1efb76d6-0916-6e0c-8fed-d2f7f5da2f30', '2024-12-11 04:09:51', '2024-12-11 04:09:51'),
(1331, 1, '1efb76d6-17a5-6bee-a6c0-12c7134d93b9', '1efb76d6-17b1-64da-b3a9-12c7134d93b9', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 3.00, 'play_fiver', 0, 1, '1efb76d6-17a5-6bee-a6c0-12c7134d93b9', '2024-12-11 04:09:54', '2024-12-11 04:09:54'),
(1332, 1, '1efb76d6-2468-6642-9808-da2dadcba620', '1efb76d6-2473-6c2c-a477-da2dadcba620', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 45.00, 'play_fiver', 0, 1, '1efb76d6-2468-6642-9808-da2dadcba620', '2024-12-11 04:09:54', '2024-12-11 04:09:54'),
(1333, 1, '1efb7fb8-3c37-6bf2-a270-9eb4c70cdfef', '1efb7fb8-3c41-6a8a-a479-9eb4c70cdfef', 'mines', 'mines', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7fb8-3c37-6bf2-a270-9eb4c70cdfef', '2024-12-11 21:07:18', '2024-12-11 21:07:18'),
(1334, 1, '1efb7fb8-6f20-6bcc-853c-9eb4c70cdfef', '1efb7fb8-6f29-6e52-93cb-9eb4c70cdfef', 'mines', 'mines', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '1efb7fb8-6f20-6bcc-853c-9eb4c70cdfef', '2024-12-11 21:07:25', '2024-12-11 21:07:25'),
(1335, 1, '1efb7fb9-e1a3-6d7e-bd5f-d2f7f5da2f30', '1efb7fb9-e1ae-6b3e-ab2e-d2f7f5da2f30', 'mines', 'mines', 'win', 'balance_withdrawal', 2230.00, 'play_fiver', 0, 1, '1efb7fb9-e1a3-6d7e-bd5f-d2f7f5da2f30', '2024-12-11 21:08:02', '2024-12-11 21:08:02'),
(1336, 1, '1efb7fba-b2c8-6d6e-942f-9eb4c70cdfef', '1efb7fba-b2d4-607e-951a-9eb4c70cdfef', 'mines', 'mines', 'bet', 'balance_withdrawal', 20.00, 'play_fiver', 0, 1, '1efb7fba-b2c8-6d6e-942f-9eb4c70cdfef', '2024-12-11 21:08:25', '2024-12-11 21:08:25'),
(1337, 1, '1efb7fbb-2918-66d6-9e2c-ae0d35fccb9f', '1efb7fbb-2922-6898-9428-ae0d35fccb9f', 'mines', 'mines', 'bet', 'balance_withdrawal', 20.00, 'play_fiver', 0, 1, '1efb7fbb-2918-66d6-9e2c-ae0d35fccb9f', '2024-12-11 21:08:38', '2024-12-11 21:08:38'),
(1338, 1, '1efb7fbb-e17d-67f8-874d-3ad5b3dd05e8', '1efb7fbb-e188-6fd6-b2d5-3ad5b3dd05e8', 'mines', 'mines', 'win', 'balance_withdrawal', 44600.00, 'play_fiver', 0, 1, '1efb7fbb-e17d-67f8-874d-3ad5b3dd05e8', '2024-12-11 21:08:56', '2024-12-11 21:08:56'),
(1339, 1, '1efb7fbc-da21-61de-9f12-2e56ab48048f', '1efb7fbc-da2b-6dd2-a916-2e56ab48048f', 'mines', 'mines', 'win', 'balance_withdrawal', 2.98, 'play_fiver', 0, 1, '1efb7fbc-da21-61de-9f12-2e56ab48048f', '2024-12-11 21:09:23', '2024-12-11 21:09:23'),
(1340, 1, '675b4d647dd3e', '1efb8cb3-42f4-606e-910a-3aa1afa54675', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '675b4d647dd3e', '2024-12-12 21:54:00', '2024-12-12 21:54:00'),
(1341, 1, '675b4d6fd31c6', '1efb8cb3-af30-63cc-88fd-d2f7f5da2f30', '1695365', '1695365', 'win', 'balance', 9.60, 'play_fiver', 0, 1, '675b4d6fd31c6', '2024-12-12 21:54:12', '2024-12-12 21:54:12'),
(1342, 1, '675b4d96af1d3', '1efb8cb5-21b7-6246-8671-12da95e6e621', '1695365', '1695365', 'win', 'balance', 3.84, 'play_fiver', 0, 1, '675b4d96af1d3', '2024-12-12 21:54:51', '2024-12-12 21:54:51'),
(1343, 1, '675b4da639aed', '1efb8cb5-b5b7-646e-b48c-cea2b20af8d2', '1695365', '1695365', 'win', 'balance', 10.56, 'play_fiver', 0, 1, '675b4da639aed', '2024-12-12 21:55:06', '2024-12-12 21:55:06'),
(1344, 1, '675b4dc2cdb3b', '1efb8cb6-c687-66d0-9a29-cea2b20af8d2', '1695365', '1695365', 'bet', 'balance_withdrawal', 20.00, 'play_fiver', 0, 1, '675b4dc2cdb3b', '2024-12-12 21:55:35', '2024-12-12 21:55:35'),
(1345, 1, '675b72730daf3', '1efb8e14-a9a7-693e-a7dd-7ab0f05560e1', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '675b72730daf3', '2024-12-13 00:32:07', '2024-12-13 00:32:07'),
(1346, 1, '675b727407954', '1efb8e14-b2f4-6546-8444-161d41288f57', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '675b727407954', '2024-12-13 00:32:08', '2024-12-13 00:32:08'),
(1347, 1, '675df1e164b87', '1efba5e6-c0b1-6bd6-8b67-c238c3114a8d', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '675df1e164b87', '2024-12-14 22:00:22', '2024-12-14 22:00:22'),
(1348, 1, '675df1e266a39', '1efba5e6-ca4d-6d34-9ba7-6272d1b24b91', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '675df1e266a39', '2024-12-14 22:00:23', '2024-12-14 22:00:23'),
(1349, 1, '675fa337c50e5', '1efbb60b-6184-6f20-8648-a2fa5f43c49d', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '675fa337c50e5', '2024-12-16 04:49:16', '2024-12-16 04:49:16'),
(1350, 1, '1efbbbf5-55ed-6e56-9632-6272d1b24b91', '1efbbbf5-55f8-65f4-aeeb-6272d1b24b91', 'mines', 'mines', 'win', 'balance_withdrawal', 0.25, 'play_fiver', 0, 1, '1efbbbf5-55ed-6e56-9632-6272d1b24b91', '2024-12-16 16:06:37', '2024-12-16 16:06:37'),
(1351, 1, '6760d35ea9ddf', '1efbc15f-ffe4-633c-bb71-623648bf83d9', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6760d35ea9ddf', '2024-12-17 02:27:10', '2024-12-17 02:27:10'),
(1352, 1, '6760d361de73a', '1efbc160-1e8e-63a0-893a-7e38c8397950', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6760d361de73a', '2024-12-17 02:27:17', '2024-12-17 02:27:17'),
(1353, 1, '6760d36b25188', '1efbc160-76ae-6e22-9824-9634bb8aca80', '126', '126', 'win', 'balance_withdrawal', 0.88, 'play_fiver', 0, 1, '6760d36b25188', '2024-12-17 02:27:24', '2024-12-17 02:27:24'),
(1354, 1, '1efbc16f-2c25-6978-82ce-9ee9ebb36420', '1efbc16f-2c36-612e-b20f-9ee9ebb36420', 'vs5luckytig', 'vs5luckytig', 'bet', 'balance_withdrawal', 0.10, 'play_fiver', 0, 1, '1efbc16f-2c25-6978-82ce-9ee9ebb36420', '2024-12-17 02:34:00', '2024-12-17 02:34:00'),
(1355, 1, '1efbc16f-48cf-6902-a9cc-829a5316f659', '1efbc16f-48df-66b8-a29d-829a5316f659', 'vs5luckytig', 'vs5luckytig', 'win', 'balance_withdrawal', 0.12, 'play_fiver', 0, 1, '1efbc16f-48cf-6902-a9cc-829a5316f659', '2024-12-17 02:34:02', '2024-12-17 02:34:02'),
(1356, 1, '6761007781189', '1efbc30e-1400-605a-ac2e-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '6761007781189', '2024-12-17 05:39:24', '2024-12-17 05:39:24'),
(1357, 1, '6761007cd7fe9', '1efbc30e-4713-66ea-9cbf-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '6761007cd7fe9', '2024-12-17 05:39:29', '2024-12-17 05:39:29'),
(1358, 1, '67610093337d4', '1efbc30f-1bfe-6bb6-9de8-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67610093337d4', '2024-12-17 05:39:51', '2024-12-17 05:39:51'),
(1359, 1, '676100995c1da', '1efbc30f-56ce-6d0e-b479-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100995c1da', '2024-12-17 05:40:11', '2024-12-17 05:40:11'),
(1360, 1, '6761009a762c8', '1efbc30f-615b-6966-a5a2-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761009a762c8', '2024-12-17 05:40:16', '2024-12-17 05:40:16'),
(1361, 1, '6761009b9eca4', '1efbc30f-6c7b-6594-bb8e-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761009b9eca4', '2024-12-17 05:40:18', '2024-12-17 05:40:18'),
(1362, 1, '6761009ccbb15', '1efbc30f-77c5-6ab2-ab61-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761009ccbb15', '2024-12-17 05:40:19', '2024-12-17 05:40:19'),
(1363, 1, '6761009e84baa', '1efbc30f-8813-67ca-ab4d-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761009e84baa', '2024-12-17 05:40:21', '2024-12-17 05:40:21'),
(1364, 1, '676100ab6b0b0', '1efbc310-030b-6e64-abf8-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100ab6b0b0', '2024-12-17 05:40:23', '2024-12-17 05:40:23'),
(1365, 1, '676100ba66c45', '1efbc310-91ee-6532-85e8-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100ba66c45', '2024-12-17 05:40:38', '2024-12-17 05:40:38'),
(1366, 1, '676100bb1f9cf', '1efbc310-98b0-60fa-9008-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '676100bb1f9cf', '2024-12-17 05:40:39', '2024-12-17 05:40:39'),
(1367, 1, '676100bd077ac', '1efbc310-aad1-6932-90d0-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100bd077ac', '2024-12-17 05:40:41', '2024-12-17 05:40:41'),
(1368, 1, '676100d3efa30', '1efbc311-85b2-6740-bebe-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100d3efa30', '2024-12-17 05:41:11', '2024-12-17 05:41:11'),
(1369, 1, '676100d56bbc6', '1efbc311-939e-632c-af23-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100d56bbc6', '2024-12-17 05:41:27', '2024-12-17 05:41:27'),
(1370, 1, '676100d62172b', '1efbc311-9a41-6cd8-805b-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100d62172b', '2024-12-17 05:41:35', '2024-12-17 05:41:35'),
(1371, 1, '676100d70963c', '1efbc311-a2d9-6364-906d-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100d70963c', '2024-12-17 05:41:38', '2024-12-17 05:41:38'),
(1372, 1, '676100da67f05', '1efbc311-c327-6cd8-ba9b-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '676100da67f05', '2024-12-17 05:41:39', '2024-12-17 05:41:39'),
(1373, 1, '676100d882048', '1efbc311-b118-6e8e-b47b-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '676100d882048', '2024-12-17 05:41:42', '2024-12-17 05:41:42'),
(1374, 1, '676100dc4ed24', '1efbc311-d53f-679a-bcff-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100dc4ed24', '2024-12-17 05:41:42', '2024-12-17 05:41:42'),
(1375, 1, '676100ee8160d', '1efbc312-82e1-6e3e-bcae-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100ee8160d', '2024-12-17 05:41:52', '2024-12-17 05:41:52'),
(1376, 1, '676100f1e29a6', '1efbc312-a34b-60ee-b593-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100f1e29a6', '2024-12-17 05:41:54', '2024-12-17 05:41:54'),
(1377, 1, '676100f06b28e', '1efbc312-9517-607c-931d-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676100f06b28e', '2024-12-17 05:41:54', '2024-12-17 05:41:54'),
(1378, 1, '676100f4074c0', '1efbc312-b755-6be8-9f27-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '676100f4074c0', '2024-12-17 05:41:55', '2024-12-17 05:41:55'),
(1379, 1, '6761018d834f2', '1efbc318-6f4c-6864-b6d1-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '6761018d834f2', '2024-12-17 05:44:02', '2024-12-17 05:44:02'),
(1380, 1, '676102e2bdb24', '1efbc325-259c-61c6-834c-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102e2bdb24', '2024-12-17 05:50:01', '2024-12-17 05:50:01'),
(1381, 1, '676102e423750', '1efbc325-32a8-655e-bba9-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '676102e423750', '2024-12-17 05:50:15', '2024-12-17 05:50:15'),
(1382, 1, '676102e706acf', '1efbc325-4e24-6d46-927a-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102e706acf', '2024-12-17 05:50:29', '2024-12-17 05:50:29'),
(1383, 1, '676102e5ca619', '1efbc325-42b7-6184-9bc8-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102e5ca619', '2024-12-17 05:50:34', '2024-12-17 05:50:34'),
(1384, 1, '676102e806336', '1efbc325-57a9-6754-96a6-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102e806336', '2024-12-17 05:50:35', '2024-12-17 05:50:35'),
(1385, 1, '676102e8cc49b', '1efbc325-5f67-61a8-8726-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 2.24, 'play_fiver', 0, 1, '676102e8cc49b', '2024-12-17 05:50:45', '2024-12-17 05:50:45'),
(1386, 1, '676102ec69d22', '1efbc325-81b3-68f6-89da-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '676102ec69d22', '2024-12-17 05:50:45', '2024-12-17 05:50:45'),
(1387, 1, '676102f23763c', '1efbc325-b8f4-6be4-b76f-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102f23763c', '2024-12-17 05:50:45', '2024-12-17 05:50:45'),
(1388, 1, '676102ee9963f', '1efbc325-96a3-6234-a8a8-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102ee9963f', '2024-12-17 05:50:45', '2024-12-17 05:50:45'),
(1389, 1, '676102f081bec', '1efbc325-a8c8-6784-bf69-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102f081bec', '2024-12-17 05:50:48', '2024-12-17 05:50:48'),
(1390, 1, '676102fb214ce', '1efbc326-0dec-6462-aab3-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676102fb214ce', '2024-12-17 05:50:49', '2024-12-17 05:50:49'),
(1391, 1, '6761031c3684b', '1efbc327-4975-6ed8-b88b-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761031c3684b', '2024-12-17 05:50:51', '2024-12-17 05:50:51'),
(1392, 1, '6761042133a70', '1efbc331-0270-6236-9f27-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6761042133a70', '2024-12-17 05:55:02', '2024-12-17 05:55:02'),
(1393, 1, '6761042aef93f', '1efbc331-5f9b-6f5a-9ccf-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761042aef93f', '2024-12-17 05:55:44', '2024-12-17 05:55:44'),
(1394, 1, '6761042bb3045', '1efbc331-66c7-6dba-a9b5-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761042bb3045', '2024-12-17 05:55:46', '2024-12-17 05:55:46'),
(1395, 1, '6761042c85afc', '1efbc331-6e8b-6e7a-bed2-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761042c85afc', '2024-12-17 05:55:51', '2024-12-17 05:55:51'),
(1396, 1, '6761042ee5af9', '1efbc331-855f-644e-99d0-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761042ee5af9', '2024-12-17 05:55:57', '2024-12-17 05:55:57'),
(1397, 1, '6761042dca1c7', '1efbc331-7ac1-6b0e-b26c-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761042dca1c7', '2024-12-17 05:56:00', '2024-12-17 05:56:00'),
(1398, 1, '6761043180f30', '1efbc331-9e0b-6952-8e8c-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761043180f30', '2024-12-17 05:56:02', '2024-12-17 05:56:02'),
(1399, 1, '6761043037935', '1efbc331-91a4-6b46-aa90-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6761043037935', '2024-12-17 05:56:03', '2024-12-17 05:56:03'),
(1400, 1, '676104363877d', '1efbc331-cae6-6206-9b0d-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104363877d', '2024-12-17 05:56:05', '2024-12-17 05:56:05'),
(1401, 1, '67610432e25c3', '1efbc331-ab64-682e-934b-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67610432e25c3', '2024-12-17 05:56:07', '2024-12-17 05:56:07'),
(1402, 1, '676104534ed90', '1efbc332-e056-67ca-bfb1-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104534ed90', '2024-12-17 05:56:10', '2024-12-17 05:56:10'),
(1403, 1, '67610460e2673', '1efbc333-6214-612c-864b-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '67610460e2673', '2024-12-17 05:56:11', '2024-12-17 05:56:11'),
(1404, 1, '676104d9b74c4', '1efbc337-e257-64e8-b1d3-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104d9b74c4', '2024-12-17 05:58:10', '2024-12-17 05:58:10'),
(1405, 1, '676104de03082', '1efbc338-0afb-6c46-a734-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104de03082', '2024-12-17 05:58:11', '2024-12-17 05:58:11'),
(1406, 1, '676104dede480', '1efbc338-138c-623e-b4fa-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104dede480', '2024-12-17 05:58:11', '2024-12-17 05:58:11'),
(1407, 1, '676104dfe66b7', '1efbc338-1d67-6088-b0a6-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '676104dfe66b7', '2024-12-17 05:58:13', '2024-12-17 05:58:13'),
(1408, 1, '676104e1b3a23', '1efbc338-2e7e-6bd2-b2a7-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104e1b3a23', '2024-12-17 05:58:15', '2024-12-17 05:58:15'),
(1409, 1, '676104e34c6a5', '1efbc338-3d88-6d6c-ac9a-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104e34c6a5', '2024-12-17 05:58:16', '2024-12-17 05:58:16'),
(1410, 1, '676104e438d74', '1efbc338-464e-624e-ae04-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '676104e438d74', '2024-12-17 05:58:16', '2024-12-17 05:58:16'),
(1411, 1, '676104e64a16d', '1efbc338-5a0d-6460-9083-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104e64a16d', '2024-12-17 05:58:18', '2024-12-17 05:58:18'),
(1412, 1, '676104e737052', '1efbc338-62d8-65e0-a7db-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '676104e737052', '2024-12-17 05:58:19', '2024-12-17 05:58:19'),
(1413, 1, '676104e8f06ad', '1efbc338-739f-6d24-bf07-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104e8f06ad', '2024-12-17 05:58:21', '2024-12-17 05:58:21'),
(1414, 1, '676104e9dbbd6', '1efbc338-7c5a-673e-b5c6-7669fc1b8db3', '126', '126', 'win', 'balance_withdrawal', 0.64, 'play_fiver', 0, 1, '676104e9dbbd6', '2024-12-17 05:58:22', '2024-12-17 05:58:22'),
(1415, 1, '676104eb74347', '1efbc338-8b61-67c8-aefb-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104eb74347', '2024-12-17 05:58:24', '2024-12-17 05:58:24'),
(1416, 1, '676104ec5b56c', '1efbc338-93f2-6a54-85a9-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104ec5b56c', '2024-12-17 05:58:25', '2024-12-17 05:58:25'),
(1417, 1, '676104ed369fc', '1efbc338-9c0c-68b6-a13a-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104ed369fc', '2024-12-17 05:58:25', '2024-12-17 05:58:25'),
(1418, 1, '676104ee0c6b3', '1efbc338-a3f0-6460-928e-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104ee0c6b3', '2024-12-17 05:58:26', '2024-12-17 05:58:26'),
(1419, 1, '676104eed48bf', '1efbc338-abc1-61a8-8bc8-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '676104eed48bf', '2024-12-17 05:58:27', '2024-12-17 05:58:27'),
(1420, 1, '6761056b56de3', '1efbc33d-4ef0-6672-bcf5-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761056b56de3', '2024-12-17 06:00:32', '2024-12-17 06:00:32'),
(1421, 1, '6761056dd6216', '1efbc33d-66fb-6c44-bb1b-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761056dd6216', '2024-12-17 06:00:34', '2024-12-17 06:00:34'),
(1422, 1, '6761056e9c226', '1efbc33d-6e41-6396-bad9-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761056e9c226', '2024-12-17 06:00:35', '2024-12-17 06:00:35'),
(1423, 1, '6761056fedfa0', '1efbc33d-7afc-6d7e-b1eb-3e5a6c037834', '126', '126', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '6761056fedfa0', '2024-12-17 06:00:38', '2024-12-17 06:00:38'),
(1424, 1, '6761057652836', '1efbc33d-b7ac-636e-b6ee-3e5a6c037834', '126', '126', 'win', 'balance', 120.00, 'play_fiver', 0, 1, '6761057652836', '2024-12-17 06:00:43', '2024-12-17 06:00:43'),
(1425, 1, '6761058157012', '1efbc33e-20c0-697c-bb66-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058157012', '2024-12-17 06:00:54', '2024-12-17 06:00:54'),
(1426, 1, '6761058224d9f', '1efbc33e-2854-649a-88f6-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058224d9f', '2024-12-17 06:00:54', '2024-12-17 06:00:54'),
(1427, 1, '67610582e3b32', '1efbc33e-2fc8-6d98-9f5a-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610582e3b32', '2024-12-17 06:00:56', '2024-12-17 06:00:56'),
(1428, 1, '6761058440196', '1efbc33e-3c77-69ae-a589-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058440196', '2024-12-17 06:00:56', '2024-12-17 06:00:56'),
(1429, 1, '6761058579979', '1efbc33e-483f-6eee-a491-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058579979', '2024-12-17 06:00:58', '2024-12-17 06:00:58'),
(1430, 1, '67610587d3ff3', '1efbc33e-5eda-6cda-91be-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610587d3ff3', '2024-12-17 06:01:00', '2024-12-17 06:01:00'),
(1431, 1, '67610586aaeb5', '1efbc33e-53b7-601a-a71e-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610586aaeb5', '2024-12-17 06:01:00', '2024-12-17 06:01:00'),
(1432, 1, '676105889c1b2', '1efbc33e-6635-6714-b740-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105889c1b2', '2024-12-17 06:01:01', '2024-12-17 06:01:01'),
(1433, 1, '67610589660ab', '1efbc33e-6da2-6786-ba00-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610589660ab', '2024-12-17 06:01:01', '2024-12-17 06:01:01'),
(1434, 1, '6761058a41057', '1efbc33e-75b9-6abe-add6-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058a41057', '2024-12-17 06:01:02', '2024-12-17 06:01:02'),
(1435, 1, '6761058bd8716', '1efbc33e-852c-6d8e-919d-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058bd8716', '2024-12-17 06:01:04', '2024-12-17 06:01:04'),
(1436, 1, '6761058b20bfc', '1efbc33e-7dff-6d72-a3e2-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058b20bfc', '2024-12-17 06:01:04', '2024-12-17 06:01:04'),
(1437, 1, '6761058cbfda5', '1efbc33e-8dc0-6590-9ca2-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058cbfda5', '2024-12-17 06:01:05', '2024-12-17 06:01:05'),
(1438, 1, '6761058d9b3f7', '1efbc33e-95db-6a2c-ba94-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058d9b3f7', '2024-12-17 06:01:05', '2024-12-17 06:01:05'),
(1439, 1, '6761058e682b3', '1efbc33e-9d66-65bc-b0e8-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058e682b3', '2024-12-17 06:01:06', '2024-12-17 06:01:06'),
(1440, 1, '6761058f1ec76', '1efbc33e-a411-6bdc-9bb1-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058f1ec76', '2024-12-17 06:01:07', '2024-12-17 06:01:07'),
(1441, 1, '6761058fde769', '1efbc33e-ab8e-6946-8d1c-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761058fde769', '2024-12-17 06:01:08', '2024-12-17 06:01:08'),
(1442, 1, '676105917146f', '1efbc33e-ba5d-6a94-96c2-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105917146f', '2024-12-17 06:01:09', '2024-12-17 06:01:09'),
(1443, 1, '67610590a7e1b', '1efbc33e-b2f6-6328-b55c-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610590a7e1b', '2024-12-17 06:01:09', '2024-12-17 06:01:09'),
(1444, 1, '6761059232c49', '1efbc33e-c175-6e62-8f1a-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059232c49', '2024-12-17 06:01:10', '2024-12-17 06:01:10'),
(1445, 1, '67610592ec90b', '1efbc33e-c8b7-6e14-8531-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610592ec90b', '2024-12-17 06:01:11', '2024-12-17 06:01:11'),
(1446, 1, '67610593d29eb', '1efbc33e-d13e-6222-a68a-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610593d29eb', '2024-12-17 06:01:11', '2024-12-17 06:01:11'),
(1447, 1, '6761059494b6b', '1efbc33e-d85c-639c-8b25-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059494b6b', '2024-12-17 06:01:13', '2024-12-17 06:01:13'),
(1448, 1, '6761059581637', '1efbc33e-e124-6498-b554-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059581637', '2024-12-17 06:01:13', '2024-12-17 06:01:13'),
(1449, 1, '676105995d25b', '1efbc33f-05df-6c4c-b599-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105995d25b', '2024-12-17 06:01:18', '2024-12-17 06:01:18'),
(1450, 1, '6761059a513a0', '1efbc33f-0ef1-6d08-8e3b-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059a513a0', '2024-12-17 06:01:19', '2024-12-17 06:01:19'),
(1451, 1, '6761059b4364f', '1efbc33f-17f0-6db4-aa7d-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059b4364f', '2024-12-17 06:01:20', '2024-12-17 06:01:20'),
(1452, 1, '6761059c27f58', '1efbc33f-2067-6f38-b291-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059c27f58', '2024-12-17 06:01:20', '2024-12-17 06:01:20'),
(1453, 1, '6761059ceb851', '1efbc33f-280b-6910-b146-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059ceb851', '2024-12-17 06:01:21', '2024-12-17 06:01:21'),
(1454, 1, '6761059da9743', '1efbc33f-2f00-6b1c-bd03-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059da9743', '2024-12-17 06:01:21', '2024-12-17 06:01:21'),
(1455, 1, '6761059ea199c', '1efbc33f-383b-61fa-90a2-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059ea199c', '2024-12-17 06:01:22', '2024-12-17 06:01:22'),
(1456, 1, '6761059f5d8f6', '1efbc33f-3f1c-67b2-9d42-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761059f5d8f6', '2024-12-17 06:01:23', '2024-12-17 06:01:23'),
(1457, 1, '676105a01b536', '1efbc33f-460f-618c-92cc-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a01b536', '2024-12-17 06:01:24', '2024-12-17 06:01:24'),
(1458, 1, '676105a0ca07e', '1efbc33f-4ce2-64aa-a5ae-7669fc1b8db3', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '676105a0ca07e', '2024-12-17 06:01:25', '2024-12-17 06:01:25'),
(1459, 1, '676105a26c604', '1efbc33f-5c4c-6670-98c0-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a26c604', '2024-12-17 06:01:26', '2024-12-17 06:01:26'),
(1460, 1, '676105a33ed2e', '1efbc33f-640e-6642-a438-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a33ed2e', '2024-12-17 06:01:27', '2024-12-17 06:01:27'),
(1461, 1, '676105a40b38a', '1efbc33f-6b93-6a5c-8396-3e5a6c037834', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '676105a40b38a', '2024-12-17 06:01:28', '2024-12-17 06:01:28'),
(1462, 1, '676105a58a0cc', '1efbc33f-7a11-669c-927d-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a58a0cc', '2024-12-17 06:01:29', '2024-12-17 06:01:29'),
(1463, 1, '676105a65a4d2', '1efbc33f-81bd-642c-8b5d-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a65a4d2', '2024-12-17 06:01:30', '2024-12-17 06:01:30'),
(1464, 1, '676105a805d87', '1efbc33f-9183-696a-b1a5-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a805d87', '2024-12-17 06:01:32', '2024-12-17 06:01:32'),
(1465, 1, '676105a719ce5', '1efbc33f-88c1-6c96-b01b-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105a719ce5', '2024-12-17 06:01:32', '2024-12-17 06:01:32'),
(1466, 1, '676105a8eabbc', '1efbc33f-9a74-67e0-91ff-7669fc1b8db3', '126', '126', 'win', 'balance', 16.00, 'play_fiver', 0, 1, '676105a8eabbc', '2024-12-17 06:01:32', '2024-12-17 06:01:32'),
(1467, 1, '676105aabd0fa', '1efbc33f-abbe-67b2-b399-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105aabd0fa', '2024-12-17 06:01:34', '2024-12-17 06:01:34'),
(1468, 1, '676105ab8092b', '1efbc33f-b2eb-61de-b8e7-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105ab8092b', '2024-12-17 06:01:35', '2024-12-17 06:01:35'),
(1469, 1, '676105ac38caf', '1efbc33f-b9a6-6afa-a8e6-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105ac38caf', '2024-12-17 06:01:36', '2024-12-17 06:01:36'),
(1470, 1, '676105ad240dc', '1efbc33f-c261-60d2-ace6-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105ad240dc', '2024-12-17 06:01:37', '2024-12-17 06:01:37'),
(1471, 1, '676105add4d60', '1efbc33f-c948-6832-b5c5-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105add4d60', '2024-12-17 06:01:38', '2024-12-17 06:01:38'),
(1472, 1, '676105ae90d62', '1efbc33f-d02a-6006-9255-3e5a6c037834', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '676105ae90d62', '2024-12-17 06:01:38', '2024-12-17 06:01:38'),
(1473, 1, '676105b03e0c5', '1efbc33f-e000-6c96-b9c7-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b03e0c5', '2024-12-17 06:01:40', '2024-12-17 06:01:40'),
(1474, 1, '676105b12f6ae', '1efbc33f-e8f7-6e4e-a9a0-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b12f6ae', '2024-12-17 06:01:41', '2024-12-17 06:01:41'),
(1475, 1, '676105b207184', '1efbc33f-f0ee-6472-8452-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b207184', '2024-12-17 06:01:42', '2024-12-17 06:01:42'),
(1476, 1, '676105b2c4dd1', '1efbc33f-f857-6cf4-bcd1-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b2c4dd1', '2024-12-17 06:01:43', '2024-12-17 06:01:43'),
(1477, 1, '676105b38f3f8', '1efbc33f-ffc9-60b4-b444-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b38f3f8', '2024-12-17 06:01:43', '2024-12-17 06:01:43'),
(1478, 1, '676105b44b1cf', '1efbc340-06a9-6a00-8102-3e5a6c037834', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '676105b44b1cf', '2024-12-17 06:01:44', '2024-12-17 06:01:44'),
(1479, 1, '676105b6a9bb1', '1efbc340-1d6e-6290-994e-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b6a9bb1', '2024-12-17 06:01:46', '2024-12-17 06:01:46'),
(1480, 1, '676105b7842e1', '1efbc340-2580-6794-be3f-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b7842e1', '2024-12-17 06:01:47', '2024-12-17 06:01:47'),
(1481, 1, '676105b5dc0f5', '1efbc340-15dc-604a-9da5-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b5dc0f5', '2024-12-17 06:01:47', '2024-12-17 06:01:47'),
(1482, 1, '676105b852a36', '1efbc340-2d1a-61d0-b97d-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105b852a36', '2024-12-17 06:01:48', '2024-12-17 06:01:48'),
(1483, 1, '676105b921fba', '1efbc340-34bc-6cee-be6b-3e5a6c037834', '126', '126', 'win', 'balance', 7.20, 'play_fiver', 0, 1, '676105b921fba', '2024-12-17 06:01:49', '2024-12-17 06:01:49'),
(1484, 1, '676105bead62a', '1efbc340-69de-63e6-89af-3e5a6c037834', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '676105bead62a', '2024-12-17 06:01:55', '2024-12-17 06:01:55');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(1485, 1, '676105c1027cd', '1efbc340-7fcd-6440-8224-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105c1027cd', '2024-12-17 06:01:57', '2024-12-17 06:01:57'),
(1486, 1, '676105c03b4f2', '1efbc340-787c-6150-af16-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105c03b4f2', '2024-12-17 06:01:58', '2024-12-17 06:01:58'),
(1487, 1, '676105c1d4ed0', '1efbc340-8805-6a18-ad91-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105c1d4ed0', '2024-12-17 06:01:58', '2024-12-17 06:01:58'),
(1488, 1, '676105c2add82', '1efbc340-9008-6a62-b8bd-3e5a6c037834', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '676105c2add82', '2024-12-17 06:01:59', '2024-12-17 06:01:59'),
(1489, 1, '676105c465561', '1efbc340-a045-6f92-8d4b-7669fc1b8db3', '126', '126', 'win', 'balance', 7.20, 'play_fiver', 0, 1, '676105c465561', '2024-12-17 06:02:01', '2024-12-17 06:02:01'),
(1490, 1, '676105c5f208f', '1efbc340-af4e-653e-b181-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105c5f208f', '2024-12-17 06:02:04', '2024-12-17 06:02:04'),
(1491, 1, '676105c6f12ae', '1efbc340-b8cf-675c-af60-7669fc1b8db3', '126', '126', 'win', 'balance', 6.40, 'play_fiver', 0, 1, '676105c6f12ae', '2024-12-17 06:02:04', '2024-12-17 06:02:04'),
(1492, 1, '676105c8aa1fd', '1efbc340-c91b-6e26-bce1-3e5a6c037834', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '676105c8aa1fd', '2024-12-17 06:02:05', '2024-12-17 06:02:05'),
(1493, 1, '676105ca18487', '1efbc340-d67b-6e0e-8329-3e5a6c037834', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '676105ca18487', '2024-12-17 06:02:06', '2024-12-17 06:02:06'),
(1494, 1, '676105cbc8316', '1efbc340-e6e4-671e-ae92-7669fc1b8db3', '126', '126', 'win', 'balance', 9.60, 'play_fiver', 0, 1, '676105cbc8316', '2024-12-17 06:02:08', '2024-12-17 06:02:08'),
(1495, 1, '676105cd46314', '1efbc340-f4e3-6298-a8dc-3e5a6c037834', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '676105cd46314', '2024-12-17 06:02:09', '2024-12-17 06:02:09'),
(1496, 1, '676105ceda9d2', '1efbc341-0439-63aa-9a0b-3e5a6c037834', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '676105ceda9d2', '2024-12-17 06:02:11', '2024-12-17 06:02:11'),
(1497, 1, '676105d07c447', '1efbc341-139c-6608-b2ea-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105d07c447', '2024-12-17 06:02:13', '2024-12-17 06:02:13'),
(1498, 1, '676105d7d14c0', '1efbc341-59b0-64c8-8a89-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105d7d14c0', '2024-12-17 06:02:20', '2024-12-17 06:02:20'),
(1499, 1, '676105d88b0fb', '1efbc341-607b-6550-b85c-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676105d88b0fb', '2024-12-17 06:02:22', '2024-12-17 06:02:22'),
(1500, 1, '676106355d034', '1efbc344-d599-6b22-9c0d-3e5a6c037834', '126', '126', 'win', 'balance', 6.40, 'play_fiver', 0, 1, '676106355d034', '2024-12-17 06:03:55', '2024-12-17 06:03:55'),
(1501, 1, '676106381da20', '1efbc344-efbc-60f4-a8d2-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676106381da20', '2024-12-17 06:03:56', '2024-12-17 06:03:56'),
(1502, 1, '6761063a22e1d', '1efbc345-0303-65c2-808b-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761063a22e1d', '2024-12-17 06:03:58', '2024-12-17 06:03:58'),
(1503, 1, '676106440fbee', '1efbc345-61a2-6560-8cec-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676106440fbee', '2024-12-17 06:04:08', '2024-12-17 06:04:08'),
(1504, 1, '6761064e03fbc', '1efbc345-c08a-6e2e-b416-3e5a6c037834', '126', '126', 'win', 'balance', 6.40, 'play_fiver', 0, 1, '6761064e03fbc', '2024-12-17 06:04:18', '2024-12-17 06:04:18'),
(1505, 1, '6761065039091', '1efbc345-d5af-6cfa-be1f-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065039091', '2024-12-17 06:04:20', '2024-12-17 06:04:20'),
(1506, 1, '67610650b9c6a', '1efbc345-dab7-6c2a-89f9-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610650b9c6a', '2024-12-17 06:04:21', '2024-12-17 06:04:21'),
(1507, 1, '6761065203c22', '1efbc345-e6ae-64e8-9d8d-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065203c22', '2024-12-17 06:04:22', '2024-12-17 06:04:22'),
(1508, 1, '67610650ecc4d', '1efbc345-dcb5-65ea-97ea-7669fc1b8db3', '126', '126', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '67610650ecc4d', '2024-12-17 06:04:22', '2024-12-17 06:04:22'),
(1509, 1, '6761065273922', '1efbc345-eb0c-6742-8256-7669fc1b8db3', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '6761065273922', '2024-12-17 06:04:22', '2024-12-17 06:04:22'),
(1510, 1, '6761065544de0', '1efbc346-05d5-6b64-a887-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065544de0', '2024-12-17 06:04:25', '2024-12-17 06:04:25'),
(1511, 1, '67610653df15f', '1efbc345-f8c8-68cc-9b11-3e5a6c037834', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '67610653df15f', '2024-12-17 06:04:25', '2024-12-17 06:04:25'),
(1512, 1, '6761065618d29', '1efbc346-0da6-6050-a639-3e5a6c037834', '126', '126', 'win', 'balance', 7.20, 'play_fiver', 0, 1, '6761065618d29', '2024-12-17 06:04:26', '2024-12-17 06:04:26'),
(1513, 1, '676106575c4b9', '1efbc346-19d2-61f8-924b-7669fc1b8db3', '126', '126', 'win', 'balance', 6.40, 'play_fiver', 0, 1, '676106575c4b9', '2024-12-17 06:04:28', '2024-12-17 06:04:28'),
(1514, 1, '67610658ca0d1', '1efbc346-27a5-6168-817f-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610658ca0d1', '2024-12-17 06:04:29', '2024-12-17 06:04:29'),
(1515, 1, '67610659d54f1', '1efbc346-319f-68da-89e9-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610659d54f1', '2024-12-17 06:04:29', '2024-12-17 06:04:29'),
(1516, 1, '6761065a874c3', '1efbc346-381c-6b18-b095-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065a874c3', '2024-12-17 06:04:30', '2024-12-17 06:04:30'),
(1517, 1, '6761065bd33ea', '1efbc346-449d-6b94-b8f2-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065bd33ea', '2024-12-17 06:04:32', '2024-12-17 06:04:32'),
(1518, 1, '6761065b37856', '1efbc346-3e88-651a-bc3c-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065b37856', '2024-12-17 06:04:32', '2024-12-17 06:04:32'),
(1519, 1, '6761065d2064a', '1efbc346-50b4-6234-947f-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065d2064a', '2024-12-17 06:04:33', '2024-12-17 06:04:33'),
(1520, 1, '6761065dc093c', '1efbc346-56f5-6e54-b31c-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065dc093c', '2024-12-17 06:04:34', '2024-12-17 06:04:34'),
(1521, 1, '6761065e7079b', '1efbc346-5d5d-6d0a-9627-7669fc1b8db3', '126', '126', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '6761065e7079b', '2024-12-17 06:04:34', '2024-12-17 06:04:34'),
(1522, 1, '6761065c78c10', '1efbc346-4a9d-6c4c-94fa-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065c78c10', '2024-12-17 06:04:34', '2024-12-17 06:04:34'),
(1523, 1, '6761065feb6a3', '1efbc346-6bb4-69bc-857b-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761065feb6a3', '2024-12-17 06:04:36', '2024-12-17 06:04:36'),
(1524, 1, '6761066088e08', '1efbc346-7164-69c0-811f-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761066088e08', '2024-12-17 06:04:36', '2024-12-17 06:04:36'),
(1525, 1, '6761066131f4c', '1efbc346-7788-6f4a-b439-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '6761066131f4c', '2024-12-17 06:04:37', '2024-12-17 06:04:37'),
(1526, 1, '67610661de2b6', '1efbc346-7e43-6010-9a90-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610661de2b6', '2024-12-17 06:04:38', '2024-12-17 06:04:38'),
(1527, 1, '676106629316d', '1efbc346-84dd-6916-9dd2-3e5a6c037834', '126', '126', 'win', 'balance', 6.40, 'play_fiver', 0, 1, '676106629316d', '2024-12-17 06:04:38', '2024-12-17 06:04:38'),
(1528, 1, '67610663eec76', '1efbc346-91fc-641c-bdb4-3e5a6c037834', '126', '126', 'win', 'balance', 8.00, 'play_fiver', 0, 1, '67610663eec76', '2024-12-17 06:04:40', '2024-12-17 06:04:40'),
(1529, 1, '676106660e6fc', '1efbc346-a5d4-69da-bbb8-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676106660e6fc', '2024-12-17 06:04:42', '2024-12-17 06:04:42'),
(1530, 1, '67610666edeb9', '1efbc346-ae8f-689a-a140-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610666edeb9', '2024-12-17 06:04:43', '2024-12-17 06:04:43'),
(1531, 1, '676106656b213', '1efbc346-9fea-6998-a1a6-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676106656b213', '2024-12-17 06:04:43', '2024-12-17 06:04:43'),
(1532, 1, '676106679f4f4', '1efbc346-b506-6c32-8897-7669fc1b8db3', '126', '126', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '676106679f4f4', '2024-12-17 06:04:43', '2024-12-17 06:04:43'),
(1533, 1, '6761066dedba9', '1efbc346-f14f-6888-bd6a-3e5a6c037834', '126', '126', 'win', 'balance', 120.00, 'play_fiver', 0, 1, '6761066dedba9', '2024-12-17 06:04:50', '2024-12-17 06:04:50'),
(1534, 1, '6761069b2c989', '1efbc348-a075-61ea-9738-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6761069b2c989', '2024-12-17 06:05:35', '2024-12-17 06:05:35'),
(1535, 1, '6761069c47b4b', '1efbc348-ab0d-6756-a39a-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6761069c47b4b', '2024-12-17 06:05:38', '2024-12-17 06:05:38'),
(1536, 1, '6761069e239fc', '1efbc348-bcb7-66aa-932f-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6761069e239fc', '2024-12-17 06:05:40', '2024-12-17 06:05:40'),
(1537, 1, '6761069ee8cdd', '1efbc348-c46b-6342-a65f-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6761069ee8cdd', '2024-12-17 06:05:40', '2024-12-17 06:05:40'),
(1538, 1, '676106a05727d', '1efbc348-d1cd-68b4-9481-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106a05727d', '2024-12-17 06:05:41', '2024-12-17 06:05:41'),
(1539, 1, '6761069f9e642', '1efbc348-cb0c-6de0-b342-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6761069f9e642', '2024-12-17 06:05:41', '2024-12-17 06:05:41'),
(1540, 1, '676106c1a3b25', '1efbc34a-0f81-69e8-80d5-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c1a3b25', '2024-12-17 06:06:14', '2024-12-17 06:06:14'),
(1541, 1, '676106c25f73a', '1efbc34a-1660-64b2-89c7-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c25f73a', '2024-12-17 06:06:14', '2024-12-17 06:06:14'),
(1542, 1, '676106c325381', '1efbc34a-1da3-660c-b1d6-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c325381', '2024-12-17 06:06:15', '2024-12-17 06:06:15'),
(1543, 1, '676106c3d8ff1', '1efbc34a-24a9-62c6-8a5b-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c3d8ff1', '2024-12-17 06:06:16', '2024-12-17 06:06:16'),
(1544, 1, '676106c5a3b2f', '1efbc34a-35a6-6dee-a3be-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c5a3b2f', '2024-12-17 06:06:18', '2024-12-17 06:06:18'),
(1545, 1, '676106c506cfd', '1efbc34a-2f86-6360-adec-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c506cfd', '2024-12-17 06:06:18', '2024-12-17 06:06:18'),
(1546, 1, '676106c6ebf8e', '1efbc34a-4203-66dc-ab95-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c6ebf8e', '2024-12-17 06:06:19', '2024-12-17 06:06:19'),
(1547, 1, '676106c6501c9', '1efbc34a-3bec-6762-8075-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c6501c9', '2024-12-17 06:06:19', '2024-12-17 06:06:19'),
(1548, 1, '676106c7c7c0f', '1efbc34a-4a22-6a8e-a9f1-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c7c7c0f', '2024-12-17 06:06:19', '2024-12-17 06:06:19'),
(1549, 1, '676106c84ec74', '1efbc34a-4ef1-6eac-8d43-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c84ec74', '2024-12-17 06:06:20', '2024-12-17 06:06:20'),
(1550, 1, '676106c918d77', '1efbc34a-565f-6f4a-83a8-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c918d77', '2024-12-17 06:06:21', '2024-12-17 06:06:21'),
(1551, 1, '676106c99a0f5', '1efbc34a-5b6c-61d2-a6c2-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106c99a0f5', '2024-12-17 06:06:21', '2024-12-17 06:06:21'),
(1552, 1, '676106ca49144', '1efbc34a-61cc-62c0-87ca-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ca49144', '2024-12-17 06:06:22', '2024-12-17 06:06:22'),
(1553, 1, '676106cb81bfe', '1efbc34a-6d8b-6ef8-b044-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106cb81bfe', '2024-12-17 06:06:23', '2024-12-17 06:06:23'),
(1554, 1, '676106cadf894', '1efbc34a-67ac-655a-86e1-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106cadf894', '2024-12-17 06:06:23', '2024-12-17 06:06:23'),
(1555, 1, '676106ccdd781', '1efbc34a-7aaa-674c-bb6e-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ccdd781', '2024-12-17 06:06:25', '2024-12-17 06:06:25'),
(1556, 1, '676106cd6efd9', '1efbc34a-7fe3-60f6-8732-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106cd6efd9', '2024-12-17 06:06:25', '2024-12-17 06:06:25'),
(1557, 1, '676106ce13741', '1efbc34a-85d9-6938-85d5-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ce13741', '2024-12-17 06:06:26', '2024-12-17 06:06:26'),
(1558, 1, '676106cf51d98', '1efbc34a-91d3-6608-8f38-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106cf51d98', '2024-12-17 06:06:28', '2024-12-17 06:06:28'),
(1559, 1, '676106d01f78e', '1efbc34a-9964-6214-b0d6-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d01f78e', '2024-12-17 06:06:28', '2024-12-17 06:06:28'),
(1560, 1, '676106ceaac96', '1efbc34a-8bc2-6700-a169-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ceaac96', '2024-12-17 06:06:28', '2024-12-17 06:06:28'),
(1561, 1, '676106d20f881', '1efbc34a-abd7-675c-b41f-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d20f881', '2024-12-17 06:06:30', '2024-12-17 06:06:30'),
(1562, 1, '676106d2a65fb', '1efbc34a-b1bc-6046-9a54-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d2a65fb', '2024-12-17 06:06:30', '2024-12-17 06:06:30'),
(1563, 1, '676106d345abd', '1efbc34a-b77e-6556-8c40-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d345abd', '2024-12-17 06:06:31', '2024-12-17 06:06:31'),
(1564, 1, '676106d3dfcfa', '1efbc34a-bd84-616c-894d-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d3dfcfa', '2024-12-17 06:06:32', '2024-12-17 06:06:32'),
(1565, 1, '676106d4834e2', '1efbc34a-c370-612a-9173-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d4834e2', '2024-12-17 06:06:32', '2024-12-17 06:06:32'),
(1566, 1, '676106d5b8f2e', '1efbc34a-cf11-6ee8-bc8b-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d5b8f2e', '2024-12-17 06:06:34', '2024-12-17 06:06:34'),
(1567, 1, '676106d666817', '1efbc34a-d563-6c38-b02d-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d666817', '2024-12-17 06:06:34', '2024-12-17 06:06:34'),
(1568, 1, '676106d530312', '1efbc34a-c9ba-6ca6-97af-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d530312', '2024-12-17 06:06:34', '2024-12-17 06:06:34'),
(1569, 1, '676106d84ef79', '1efbc34a-e78a-64f2-ba1b-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d84ef79', '2024-12-17 06:06:36', '2024-12-17 06:06:36'),
(1570, 1, '676106d8d0149', '1efbc34a-ec95-6870-9902-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d8d0149', '2024-12-17 06:06:37', '2024-12-17 06:06:37'),
(1571, 1, '676106d96dd40', '1efbc34a-f248-6682-bdfc-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106d96dd40', '2024-12-17 06:06:37', '2024-12-17 06:06:37'),
(1572, 1, '676106da0b2fb', '1efbc34a-f7f7-6538-9a9c-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106da0b2fb', '2024-12-17 06:06:38', '2024-12-17 06:06:38'),
(1573, 1, '676106da9ddfa', '1efbc34a-fdb2-6356-8d94-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106da9ddfa', '2024-12-17 06:06:39', '2024-12-17 06:06:39'),
(1574, 1, '676106db3bf5a', '1efbc34b-0368-673c-8c45-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106db3bf5a', '2024-12-17 06:06:39', '2024-12-17 06:06:39'),
(1575, 1, '676106dbd35a6', '1efbc34b-0952-6dc8-9b0a-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106dbd35a6', '2024-12-17 06:06:40', '2024-12-17 06:06:40'),
(1576, 1, '676106dea6ce3', '1efbc34b-2431-66f8-81e5-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106dea6ce3', '2024-12-17 06:06:43', '2024-12-17 06:06:43'),
(1577, 1, '676106df7cc0f', '1efbc34b-2c16-6062-8a49-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106df7cc0f', '2024-12-17 06:06:43', '2024-12-17 06:06:43'),
(1578, 1, '676106e0162ef', '1efbc34b-319d-6d82-a112-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e0162ef', '2024-12-17 06:06:44', '2024-12-17 06:06:44'),
(1579, 1, '676106e0c7718', '1efbc34b-388a-665e-a4b9-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e0c7718', '2024-12-17 06:06:45', '2024-12-17 06:06:45'),
(1580, 1, '676106e15dd3d', '1efbc34b-3df4-6068-ae98-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e15dd3d', '2024-12-17 06:06:45', '2024-12-17 06:06:45'),
(1581, 1, '676106e202943', '1efbc34b-43ec-68d0-afcb-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e202943', '2024-12-17 06:06:46', '2024-12-17 06:06:46'),
(1582, 1, '676106e293232', '1efbc34b-4992-6168-aed1-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e293232', '2024-12-17 06:06:46', '2024-12-17 06:06:46'),
(1583, 1, '676106e35ddb0', '1efbc34b-5106-6aa2-9e7e-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e35ddb0', '2024-12-17 06:06:47', '2024-12-17 06:06:47'),
(1584, 1, '676106e3de2bb', '1efbc34b-5609-6ee6-b6d7-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e3de2bb', '2024-12-17 06:06:48', '2024-12-17 06:06:48'),
(1585, 1, '676106e521dfa', '1efbc34b-61c1-6b62-8e39-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e521dfa', '2024-12-17 06:06:49', '2024-12-17 06:06:49'),
(1586, 1, '676106e479f21', '1efbc34b-5ba8-6f28-99eb-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e479f21', '2024-12-17 06:06:49', '2024-12-17 06:06:49'),
(1587, 1, '676106e5b7212', '1efbc34b-6796-6bfa-9395-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e5b7212', '2024-12-17 06:06:49', '2024-12-17 06:06:49'),
(1588, 1, '676106e669dab', '1efbc34b-6e1a-6daa-ba74-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e669dab', '2024-12-17 06:06:52', '2024-12-17 06:06:52'),
(1589, 1, '676106e840804', '1efbc34b-7f90-672e-99ca-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e840804', '2024-12-17 06:06:52', '2024-12-17 06:06:52'),
(1590, 1, '676106e708af9', '1efbc34b-73d8-697c-8032-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e708af9', '2024-12-17 06:06:52', '2024-12-17 06:06:52'),
(1591, 1, '676106e8e44e7', '1efbc34b-85f6-69d8-908f-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e8e44e7', '2024-12-17 06:06:53', '2024-12-17 06:06:53'),
(1592, 1, '676106e7a3e6a', '1efbc34b-79e9-6316-ad4a-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e7a3e6a', '2024-12-17 06:06:53', '2024-12-17 06:06:53'),
(1593, 1, '676106e97c2a2', '1efbc34b-8b6e-63de-87a2-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106e97c2a2', '2024-12-17 06:06:53', '2024-12-17 06:06:53'),
(1594, 1, '676106ea70ea0', '1efbc34b-9487-6fec-8d78-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ea70ea0', '2024-12-17 06:06:55', '2024-12-17 06:06:55'),
(1595, 1, '676106eb15bcf', '1efbc34b-9a81-6308-bae8-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106eb15bcf', '2024-12-17 06:06:56', '2024-12-17 06:06:56'),
(1596, 1, '676106ec67af8', '1efbc34b-a73d-6ab0-a278-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ec67af8', '2024-12-17 06:06:56', '2024-12-17 06:06:56'),
(1597, 1, '676106ed60aab', '1efbc34b-b080-6df2-ba81-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ed60aab', '2024-12-17 06:06:57', '2024-12-17 06:06:57'),
(1598, 1, '676106ee22766', '1efbc34b-b79c-6348-b21c-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ee22766', '2024-12-17 06:06:59', '2024-12-17 06:06:59'),
(1599, 1, '676106ef502fb', '1efbc34b-c2ef-6272-804b-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106ef502fb', '2024-12-17 06:07:00', '2024-12-17 06:07:00'),
(1600, 1, '676106f08ff94', '1efbc34b-cef6-685e-b370-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f08ff94', '2024-12-17 06:07:01', '2024-12-17 06:07:01'),
(1601, 1, '676106efe0995', '1efbc34b-c892-6fb2-b15e-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106efe0995', '2024-12-17 06:07:01', '2024-12-17 06:07:01'),
(1602, 1, '676106f13bc2a', '1efbc34b-d535-6724-87e8-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f13bc2a', '2024-12-17 06:07:01', '2024-12-17 06:07:01'),
(1603, 1, '676106f1e5bd9', '1efbc34b-dbd9-64d6-acc9-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f1e5bd9', '2024-12-17 06:07:02', '2024-12-17 06:07:02'),
(1604, 1, '676106f2840e5', '1efbc34b-e191-6dba-b34e-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f2840e5', '2024-12-17 06:07:03', '2024-12-17 06:07:03'),
(1605, 1, '676106f342c90', '1efbc34b-e88e-6ba4-93f7-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f342c90', '2024-12-17 06:07:03', '2024-12-17 06:07:03'),
(1606, 1, '676106f48b5cc', '1efbc34b-f4ed-6f3a-9d5b-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f48b5cc', '2024-12-17 06:07:04', '2024-12-17 06:07:04'),
(1607, 1, '676106f53625b', '1efbc34b-fb23-6454-899a-aec99828be41', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f53625b', '2024-12-17 06:07:05', '2024-12-17 06:07:05'),
(1608, 1, '676106f3e32fa', '1efbc34b-eed2-6ca4-a9f9-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f3e32fa', '2024-12-17 06:07:05', '2024-12-17 06:07:05'),
(1609, 1, '676106f6f2505', '1efbc34c-0c06-64ba-acf7-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f6f2505', '2024-12-17 06:07:07', '2024-12-17 06:07:07'),
(1610, 1, '676106f6175a8', '1efbc34c-0378-673a-9f7b-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106f6175a8', '2024-12-17 06:07:07', '2024-12-17 06:07:07'),
(1611, 1, '676106fa3d151', '1efbc34c-2b17-64bc-863a-ea04169e5411', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '676106fa3d151', '2024-12-17 06:07:10', '2024-12-17 06:07:10'),
(1612, 1, '67610702ed364', '1efbc34c-7e44-637e-8144-82f652fb7e1f', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610702ed364', '2024-12-17 06:07:19', '2024-12-17 06:07:19'),
(1613, 1, '676107043042a', '1efbc34c-89f5-625e-88d0-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676107043042a', '2024-12-17 06:07:21', '2024-12-17 06:07:21'),
(1614, 1, '67610705b3042', '1efbc34c-989a-69e4-ad7c-aec99828be41', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '67610705b3042', '2024-12-17 06:07:22', '2024-12-17 06:07:22'),
(1615, 1, '676199c9bf423', '1efbc8c4-4398-641e-af3b-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199c9bf423', '2024-12-17 16:33:34', '2024-12-17 16:33:34'),
(1616, 1, '676199c905831', '1efbc8c4-3c57-63f8-a2ac-3e5a6c037834', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199c905831', '2024-12-17 16:33:36', '2024-12-17 16:33:36'),
(1617, 1, '676199ca7e051', '1efbc8c4-4a95-67c6-b3e1-82fd3fb1cbf5', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199ca7e051', '2024-12-17 16:33:37', '2024-12-17 16:33:37'),
(1618, 1, '676199cbf2e73', '1efbc8c4-58b0-6464-babd-0688136fe4ef', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199cbf2e73', '2024-12-17 16:33:39', '2024-12-17 16:33:39'),
(1619, 1, '676199cc8a957', '1efbc8c4-5e25-6c96-9801-92a94f9d8c6a', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199cc8a957', '2024-12-17 16:33:39', '2024-12-17 16:33:39'),
(1620, 1, '676199d099173', '1efbc8c4-84dc-6af6-b39e-0688136fe4ef', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199d099173', '2024-12-17 16:33:41', '2024-12-17 16:33:41'),
(1621, 1, '676199d987b7d', '1efbc8c4-da03-657a-b93c-0688136fe4ef', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199d987b7d', '2024-12-17 16:33:50', '2024-12-17 16:33:50'),
(1622, 1, '676199da28d38', '1efbc8c4-dfd8-60a4-9a3f-5ea91d18b3ce', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199da28d38', '2024-12-17 16:33:50', '2024-12-17 16:33:50'),
(1623, 1, '676199db2f086', '1efbc8c4-e9a0-61ae-aaf9-aa5790e724cb', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199db2f086', '2024-12-17 16:33:52', '2024-12-17 16:33:52'),
(1624, 1, '676199dc3c2b2', '1efbc8c4-f3ac-6076-aba1-5ea91d18b3ce', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199dc3c2b2', '2024-12-17 16:33:53', '2024-12-17 16:33:53'),
(1625, 1, '676199dd3bf5d', '1efbc8c4-fd33-6fae-9544-92a94f9d8c6a', '126', '126', 'win', 'balance', 6.40, 'play_fiver', 0, 1, '676199dd3bf5d', '2024-12-17 16:33:55', '2024-12-17 16:33:55'),
(1626, 1, '676199e0e2537', '1efbc8c5-204f-638a-900c-92a94f9d8c6a', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199e0e2537', '2024-12-17 16:33:57', '2024-12-17 16:33:57'),
(1627, 1, '676199e1c1b97', '1efbc8c5-2892-697a-bf3b-aa5790e724cb', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676199e1c1b97', '2024-12-17 16:34:00', '2024-12-17 16:34:00'),
(1628, 1, '676199e28d081', '1efbc8c5-300d-60ec-92e1-82fd3fb1cbf5', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '676199e28d081', '2024-12-17 16:34:02', '2024-12-17 16:34:02'),
(1629, 1, '67619aa9c22b3', '1efbc8cc-9bf0-6956-b014-c244d2d12e22', '126', '126', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '67619aa9c22b3', '2024-12-17 16:37:19', '2024-12-17 16:37:19'),
(1630, 1, '67619aaeaa0fc', '1efbc8cc-caae-682e-b7dd-5ea91d18b3ce', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67619aaeaa0fc', '2024-12-17 16:37:23', '2024-12-17 16:37:23'),
(1631, 1, '67619ab1d8932', '1efbc8cc-e91b-6820-854c-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67619ab1d8932', '2024-12-17 16:37:29', '2024-12-17 16:37:29'),
(1632, 1, '67619ab58e6dd', '1efbc8cd-0c5c-606e-9ff1-9e0f23e31225', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67619ab58e6dd', '2024-12-17 16:37:30', '2024-12-17 16:37:30'),
(1633, 1, '67619ab497872', '1efbc8cd-032d-6a74-8596-aa5790e724cb', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67619ab497872', '2024-12-17 16:37:31', '2024-12-17 16:37:31'),
(1634, 1, '67619ab2a9ab2', '1efbc8cc-f0d1-60ba-b5ea-82fd3fb1cbf5', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67619ab2a9ab2', '2024-12-17 16:37:31', '2024-12-17 16:37:31'),
(1635, 1, '67619ab66a285', '1efbc8cd-147a-6c0a-9018-1269aba38ca5', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67619ab66a285', '2024-12-17 16:37:34', '2024-12-17 16:37:34'),
(1636, 1, '67624ecd71e88', '1efbcf82-8d40-63f4-ac2d-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ecd71e88', '2024-12-18 05:25:54', '2024-12-18 05:25:54'),
(1637, 1, '67624ece965d5', '1efbcf82-9836-6380-a8ad-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ece965d5', '2024-12-18 05:25:55', '2024-12-18 05:25:55'),
(1638, 1, '67624ecfa3a22', '1efbcf82-a244-6534-9c7c-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ecfa3a22', '2024-12-18 05:25:56', '2024-12-18 05:25:56'),
(1639, 1, '67624ed0c5de3', '1efbcf82-ad24-6152-9581-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ed0c5de3', '2024-12-18 05:25:57', '2024-12-18 05:25:57'),
(1640, 1, '67624ed1d1e25', '1efbcf82-b725-6b24-a0fd-7669fc1b8db3', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ed1d1e25', '2024-12-18 05:25:58', '2024-12-18 05:25:58'),
(1641, 1, '67624ed324f40', '1efbcf82-c377-6940-8476-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ed324f40', '2024-12-18 05:25:59', '2024-12-18 05:25:59'),
(1642, 1, '67624ed41051a', '1efbcf82-cc32-6a76-bf05-22d901cff1b8', '126', '126', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '67624ed41051a', '2024-12-18 05:26:02', '2024-12-18 05:26:02'),
(1643, 1, '67624ed63e5c7', '1efbcf82-e111-68b6-80f4-3e5a6c037834', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ed63e5c7', '2024-12-18 05:26:02', '2024-12-18 05:26:02'),
(1644, 1, '67624ed742acd', '1efbcf82-eac6-614a-843b-22d901cff1b8', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ed742acd', '2024-12-18 05:26:03', '2024-12-18 05:26:03'),
(1645, 1, '67624ed9265aa', '1efbcf82-fcbd-6b3c-8a24-7669fc1b8db3', '126', '126', 'win', 'balance', 0.24, 'play_fiver', 0, 1, '67624ed9265aa', '2024-12-18 05:26:05', '2024-12-18 05:26:05'),
(1646, 1, '67624ed807d71', '1efbcf82-f203-6318-be6e-22d901cff1b8', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '67624ed807d71', '2024-12-18 05:26:06', '2024-12-18 05:26:06'),
(1647, 1, '67624ede9de12', '1efbcf83-3118-6044-8b27-7669fc1b8db3', '126', '126', 'win', 'balance', 12.00, 'play_fiver', 0, 1, '67624ede9de12', '2024-12-18 05:26:11', '2024-12-18 05:26:11'),
(1648, 1, '676459382ef50', '1efbe2f8-b521-6b96-b274-7669fc1b8db3', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '676459382ef50', '2024-12-19 18:34:52', '2024-12-19 18:34:52'),
(1649, 1, '6764bac64392f', '1efbe69b-108f-6208-85b1-baafbf61cbdf', '126', '126', 'bet', 'balance', 500.00, 'play_fiver', 0, 1, '6764bac64392f', '2024-12-20 01:31:06', '2024-12-20 01:31:06'),
(1650, 1, '6764bb2316ab8', '1efbe69e-85b8-6e3c-97ab-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6764bb2316ab8', '2024-12-20 01:32:39', '2024-12-20 01:32:39'),
(1651, 1, '6764bb241729c', '1efbe69e-8f47-6818-8fc7-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '6764bb241729c', '2024-12-20 01:32:40', '2024-12-20 01:32:40'),
(1652, 1, '6764bb25bcb94', '1efbe69e-9f48-635c-a0ee-eee43060e03a', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6764bb25bcb94', '2024-12-20 01:32:42', '2024-12-20 01:32:42'),
(1653, 1, '6764bb27cabf5', '1efbe69e-b2e7-63cc-82ac-3a22b44d6d15', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6764bb27cabf5', '2024-12-20 01:32:44', '2024-12-20 01:32:44'),
(1654, 1, '6764bb286c776', '1efbe69e-b8c1-6d10-9cb7-baafbf61cbdf', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6764bb286c776', '2024-12-20 01:32:45', '2024-12-20 01:32:45'),
(1655, 1, '6764bb2a6e155', '1efbe69e-cbe4-6cc6-a8a8-3a22b44d6d15', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '6764bb2a6e155', '2024-12-20 01:32:47', '2024-12-20 01:32:47'),
(1656, 1, '6764bb2bd6553', '1efbe69e-d981-6294-bf06-baafbf61cbdf', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '6764bb2bd6553', '2024-12-20 01:32:48', '2024-12-20 01:32:48'),
(1657, 1, '6764bb2da26ae', '1efbe69e-ea8c-65b6-9c53-eee43060e03a', '126', '126', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '6764bb2da26ae', '2024-12-20 01:32:50', '2024-12-20 01:32:50'),
(1658, 1, '6764bb33071de', '1efbe69f-1db3-6d72-ac00-baafbf61cbdf', '126', '126', 'win', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '6764bb33071de', '2024-12-20 01:32:55', '2024-12-20 01:32:55'),
(1659, 1, '6764bb3d31ca0', '1efbe69f-7ebc-69c0-8a11-522b0eab7734', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6764bb3d31ca0', '2024-12-20 01:33:06', '2024-12-20 01:33:06'),
(1660, 1, '6764bb3e222f4', '1efbe69f-87a9-6eca-891c-eee43060e03a', '126', '126', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '6764bb3e222f4', '2024-12-20 01:33:06', '2024-12-20 01:33:06'),
(1661, 1, '6764bb687cb97', '1efbe6a1-1bbe-6682-af3d-3e5a6c037834', '126', '126', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '6764bb687cb97', '2024-12-20 01:33:49', '2024-12-20 01:33:49'),
(1662, 1, '6764bb69ea1f5', '1efbe6a1-298d-6cea-a2ee-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb69ea1f5', '2024-12-20 01:33:50', '2024-12-20 01:33:50'),
(1663, 1, '6764bb6aad3e1', '1efbe6a1-30b6-6904-ab45-ae90ba446eb9', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb6aad3e1', '2024-12-20 01:33:51', '2024-12-20 01:33:51'),
(1664, 1, '6764bb6b6549c', '1efbe6a1-3770-6b3c-bfaf-eee43060e03a', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb6b6549c', '2024-12-20 01:33:52', '2024-12-20 01:33:52'),
(1665, 1, '6764bb6c1cf1e', '1efbe6a1-3e26-6bd4-a017-baafbf61cbdf', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb6c1cf1e', '2024-12-20 01:33:52', '2024-12-20 01:33:52'),
(1666, 1, '6764bb6cd2729', '1efbe6a1-453d-6dc8-8d79-ae90ba446eb9', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb6cd2729', '2024-12-20 01:33:53', '2024-12-20 01:33:53'),
(1667, 1, '6764bb6d998ac', '1efbe6a1-4c8d-6ae2-b68a-baafbf61cbdf', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb6d998ac', '2024-12-20 01:33:54', '2024-12-20 01:33:54'),
(1668, 1, '6764bb6e60762', '1efbe6a1-53dc-6352-915c-baafbf61cbdf', '126', '126', 'win', 'balance_withdrawal', 6.40, 'play_fiver', 0, 1, '6764bb6e60762', '2024-12-20 01:33:55', '2024-12-20 01:33:55'),
(1669, 1, '6764bb6fd4396', '1efbe6a1-61eb-645c-959d-ae90ba446eb9', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb6fd4396', '2024-12-20 01:33:56', '2024-12-20 01:33:56'),
(1670, 1, '6764bb708d221', '1efbe6a1-68ad-6ab0-ad32-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb708d221', '2024-12-20 01:33:57', '2024-12-20 01:33:57'),
(1671, 1, '6764bb7160a2c', '1efbe6a1-707a-6360-bdb5-7669fc1b8db3', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb7160a2c', '2024-12-20 01:33:58', '2024-12-20 01:33:58'),
(1672, 1, '6764bb722bdd1', '1efbe6a1-77f3-6d6c-b746-baafbf61cbdf', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb722bdd1', '2024-12-20 01:33:58', '2024-12-20 01:33:58'),
(1673, 1, '6764bb7305673', '1efbe6a1-7ffc-6f9a-b4c2-3e5a6c037834', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb7305673', '2024-12-20 01:33:59', '2024-12-20 01:33:59'),
(1674, 1, '6764bb73bb4d6', '1efbe6a1-8717-6b22-b145-ae90ba446eb9', '126', '126', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '6764bb73bb4d6', '2024-12-20 01:34:00', '2024-12-20 01:34:00'),
(1675, 1, '6764f37da7e0c', '1efbe8b7-f47e-6ffe-872d-eee43060e03a', '1hl323e1lxuqdrkr', '1hl323e1lxuqdrkr', 'bet', 'balance_bonus', 12.50, 'play_fiver', 0, 1, '6764f37da7e0c', '2024-12-20 05:33:06', '2024-12-20 05:33:06');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 19:23:45', '2023-10-12 21:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 19:23:56', '2023-10-12 21:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 19:25:06', '2023-10-12 21:11:10'),
(4, 'admin-view', 'web', '2023-10-12 20:56:35', '2023-10-12 20:56:35'),
(5, 'admin-create', 'web', '2023-10-12 21:56:02', '2023-10-12 21:56:02'),
(6, 'admin-edit', 'web', '2023-10-12 21:56:27', '2023-10-12 21:56:27'),
(7, 'admin-delete', 'web', '2023-10-12 21:56:55', '2023-10-12 21:56:55'),
(8, 'category-view', 'web', '2023-10-12 22:01:31', '2023-10-12 22:01:31'),
(9, 'category-create', 'web', '2023-10-12 22:01:46', '2023-10-12 22:01:46'),
(10, 'category-edit', 'web', '2023-10-12 22:01:59', '2023-10-12 22:01:59'),
(11, 'category-delete', 'web', '2023-10-12 22:02:09', '2023-10-12 22:02:09'),
(12, 'game-view', 'web', '2023-10-12 22:02:27', '2023-10-12 22:02:27'),
(13, 'game-create', 'web', '2023-10-12 22:02:36', '2023-10-12 22:02:36'),
(14, 'game-edit', 'web', '2023-10-12 22:02:44', '2023-10-12 22:02:44'),
(15, 'game-delete', 'web', '2023-10-12 22:02:54', '2023-10-12 22:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 22:05:49', '2023-10-12 22:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 22:06:01', '2023-10-12 22:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 22:06:11', '2023-10-12 22:06:11'),
(19, 'wallet-delete', 'web', '2023-10-12 22:06:18', '2023-10-12 22:06:18'),
(20, 'deposit-view', 'web', '2023-10-12 22:06:44', '2023-10-12 22:06:44'),
(21, 'deposit-create', 'web', '2023-10-12 22:06:56', '2023-10-12 22:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 22:07:05', '2023-10-12 22:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 22:08:00', '2023-10-12 22:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 22:08:11', '2023-10-12 22:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 22:09:31', '2023-10-12 22:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 22:09:40', '2023-10-12 22:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 22:09:51', '2023-10-12 22:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 22:10:00', '2023-10-12 22:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 22:10:09', '2023-10-12 22:10:09'),
(30, 'order-view', 'web', '2023-10-12 22:12:36', '2023-10-12 22:12:36'),
(31, 'order-create', 'web', '2023-10-12 22:12:47', '2023-10-12 22:12:47'),
(32, 'order-edit', 'web', '2023-10-12 22:12:56', '2023-10-12 22:12:56'),
(33, 'order-update', 'web', '2023-10-12 22:13:06', '2023-10-12 22:13:06'),
(34, 'order-delete', 'web', '2023-10-12 22:13:19', '2023-10-12 22:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 23:26:06', '2023-10-12 23:26:06'),
(36, 'setting-view', 'web', '2023-10-13 00:25:46', '2023-10-13 00:25:46'),
(37, 'setting-create', 'web', '2023-10-13 00:25:57', '2023-10-13 00:25:57'),
(38, 'setting-edit', 'web', '2023-10-13 00:26:06', '2023-10-13 00:26:06'),
(39, 'setting-update', 'web', '2023-10-13 00:26:19', '2023-10-13 00:26:19'),
(40, 'setting-delete', 'web', '2023-10-13 00:26:33', '2023-10-13 00:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `promocoes`
--

CREATE TABLE `promocoes` (
  `id` int NOT NULL,
  `imagem` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `titulo` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `regras_html` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `promocoes`
--

INSERT INTO `promocoes` (`id`, `imagem`, `titulo`, `link`, `regras_html`, `created_at`, `updated_at`) VALUES
(1, 'uploads/promocoes/01JCV660TMWP4F8NSVT91HHZ0C.png', 'Saque Diário de Até R$ 30.000 na Donaldbet: Como Funciona e Benefícios para os Jogadores', 'https://servidor.com/', '<p>&lt;div style=\"font-size: 10px;\"&gt;<br>&nbsp; &nbsp; &lt;h2 style=\"font-size: 15px; font-weight: bold; text-align: center;\"&gt;Regras de Depósito&lt;/h2&gt;<br>&nbsp; &nbsp; &lt;ul&gt;<br>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;strong&gt;1. Valor Mínimo:&lt;/strong&gt; O valor mínimo para depósitos é de R$ 10,00.&lt;/li&gt;<br>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;strong&gt;2. Métodos de Pagamento:&lt;/strong&gt; Aceitamos pagamentos via Pix, transferência bancária, cartões de crédito e carteiras digitais.&lt;/li&gt;<br>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;strong&gt;3. Confirmação do Depósito:&lt;/strong&gt; O processamento do depósito pode levar até 15 minutos em horário comercial.&lt;/li&gt;<br>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;strong&gt;4. Taxas:&lt;/strong&gt; Não cobramos taxas sobre depósitos. No entanto, seu banco ou operadora pode aplicar encargos.&lt;/li&gt;<br>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;strong&gt;5. Bônus:&lt;/strong&gt; Para receber bônus promocionais, o depósito deve ser realizado seguindo os critérios da promoção vigente.&lt;/li&gt;<br>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li&gt;&lt;strong&gt;6. Limite Diário:&lt;/strong&gt; O limite máximo de depósitos por dia é de R$ 30.000,00.&lt;/li&gt;<br>&nbsp; &nbsp; &lt;/ul&gt;<br>&nbsp; &nbsp; &lt;p&gt;&lt;strong&gt;Observação:&lt;/strong&gt; Em caso de problemas ou dúvidas sobre depósitos, entre em contato com o suporte através do nosso &lt;a href=\"/suporte\"&gt;canal oficial de atendimento&lt;/a&gt;.&lt;/p&gt;<br>&nbsp; &nbsp; &lt;p&gt;&lt;a href=\"/\"&gt;Voltar à Página Inicial&lt;/a&gt;&lt;/p&gt;<br>&lt;/div&gt;<br><br></p>', '2024-11-16 19:51:31', '2024-11-27 21:22:53'),
(2, 'uploads/promocoes/01JCV6R92G8SJR6FE4R2T84Z7K.png', 'DonaldBet oficialmente autorizada a operar no Brasil. Entenda o que isso significa para você!', 'https://local-servidor.com/', NULL, '2024-11-16 20:21:17', '2024-11-16 20:21:17'),
(3, 'uploads/promocoes/01JCV6SBQZCB74KXBDWD229XHC.png', 'Ganhe dinheiro indicando um amigo', 'https://local-servidor.com/', NULL, '2024-11-16 20:21:52', '2024-11-16 20:21:52'),
(4, 'uploads/promocoes/01JCV6T2X62JV0G4EYMENS573T.png', 'TORNEIO DONALD – PG SOFT – R$10 MIL EM DINHEIRO', 'https://local-servidor.com/', NULL, '2024-11-16 20:22:16', '2024-11-16 20:22:16');

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` bigint UNSIGNED NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `rtp` bigint DEFAULT '90',
  `views` bigint DEFAULT '1',
  `distribution` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'play_fiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `rtp`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
(1, 'Provedores/PGSOFT.webp', 'PGSOFT', 'PGSOFT', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(2, 'Provedores/PRAGMATIC.webp', 'PRAGMATIC', 'PRAGMATIC', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(3, 'Provedores/SPRIBE.webp', 'SPRIBE', 'SPRIBE', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(4, 'Provedores/GALAXSYS.webp', 'GALAXSYS', 'GALAXSYS', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(5, 'Provedores/NOVAMATIC.webp', 'NOVAMATIC', 'NOVAMATIC', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(6, 'Provedores/MICROGAMING.webp', 'MICROGAMING', 'MICROGAMING', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(7, 'Provedores/HABANERO.webp', 'HABANERO', 'HABANERO', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(8, 'Provedores/PLAYNGO.webp', 'PLAYNGO', 'PLAYNGO', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(9, 'Provedores/NETENT.webp', 'NETENT', 'NETENT', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(10, 'Provedores/PLAYSON.webp', 'PLAYSON', 'PLAYSON', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(11, 'Provedores/PRAGMATICLIVE.webp', 'PRAGMATICLIVE', 'PRAGMATICLIVE', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(12, 'Provedores/TOPTREND.webp', 'TOPTREND', 'TOPTREND', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(13, 'Provedores/DREAMTECH.webp', 'DREAMTECH', 'DREAMTECH', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(14, 'Provedores/EVOPLAY.webp', 'EVOPLAY', 'EVOPLAY', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(15, 'Provedores/BOOONGO.webp', 'BOOONGO', 'BOOONGO', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(16, 'Provedores/CQ9.webp', 'CQ9', 'CQ9', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(17, 'Provedores/REELKINGDOM.webp', 'REELKINGDOM', 'REELKINGDOM', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(18, 'Provedores/EVOLUTION.webp', 'EVOLUTION', 'EVOLUTION', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03'),
(19, 'Provedores/JETX.webp', 'JETX', 'JETX', 1, 0, 0, 'play_fiver', '2024-12-05 23:12:03', '2024-12-05 23:12:03');

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 19:20:41', '2023-10-12 19:20:41'),
(2, 'afiliado', 'web', '2023-10-12 19:21:08', '2023-10-12 19:21:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `software_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_favicon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_logo_white` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_logo_black` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint DEFAULT '20',
  `ngr_percent` bigint DEFAULT '20',
  `soccer_percentage` bigint DEFAULT '30',
  `prefix` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'R$',
  `storage` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local',
  `initial_bonus` bigint DEFAULT '0',
  `min_deposit` decimal(10,2) DEFAULT '20.00',
  `max_deposit` decimal(10,2) DEFAULT '0.00',
  `min_withdrawal` decimal(10,2) DEFAULT '20.00',
  `max_withdrawal` decimal(10,2) DEFAULT '0.00',
  `rollover` bigint DEFAULT '10',
  `rollover_deposit` bigint DEFAULT '1',
  `suitpay_is_enable` tinyint DEFAULT '1',
  `stripe_is_enable` tinyint DEFAULT '1',
  `bspay_is_enable` tinyint DEFAULT '0',
  `turn_on_football` tinyint DEFAULT '1',
  `revshare_reverse` tinyint(1) DEFAULT '1',
  `bonus_vip` bigint DEFAULT '100',
  `activate_vip_bonus` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint DEFAULT '0',
  `withdrawal_limit` bigint DEFAULT NULL,
  `withdrawal_period` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT '0',
  `perc_sub_lv1` bigint NOT NULL DEFAULT '4',
  `perc_sub_lv2` bigint NOT NULL DEFAULT '2',
  `perc_sub_lv3` bigint NOT NULL DEFAULT '3',
  `sharkpay_is_enable` tinyint(1) DEFAULT '0',
  `digito_is_enable` tinyint(1) NOT NULL DEFAULT '0',
  `ezzepay_is_enable` tinyint(1) NOT NULL DEFAULT '0',
  `saque` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'ezzepay',
  `cpa_baseline` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cpa_value` decimal(10,2) NOT NULL DEFAULT '0.00',
  `disable_rollover` tinyint(1) DEFAULT '0',
  `rollover_protection` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `sharkpay_is_enable`, `digito_is_enable`, `ezzepay_is_enable`, `saque`, `cpa_baseline`, `cpa_value`, `disable_rollover`, `rollover_protection`) VALUES
(1, 'Sua bet', 'Sua bet: Experimente o saque mais rápido do Brasil, com bônus de boas-vindas e ofertas de até R$1500 para você apostar com confiança e ganhar mais!', 'uploads/Y63buDDuprP0CqKsPGtjvKaJFRG8gLiUUnKMqndp.png', 'uploads/t2o0frwgw38Z2hZ6uC8YbtIpiX4yMLQxa5W5ly4d.png', 'uploads/aD4SirREmyd2G8wvzSKzuSZndprW6xspYupC5Xoj.png', '[]', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 100, 15.00, 2000.00, 40.00, 10000.00, 20, 2, 0, 0, 0, 0, 0, 100, 0, '2024-11-28 23:20:06', 0, 10000, 'daily', 0, 0, 0, 0, 0, 1, 0, 'bspay', 15.00, 10.00, 0, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting_mails`
--

CREATE TABLE `setting_mails` (
  `id` bigint UNSIGNED NOT NULL,
  `software_smtp_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `setting_mails`
--

INSERT INTO `setting_mails` (`id`, `software_smtp_type`, `software_smtp_mail_host`, `software_smtp_mail_port`, `software_smtp_mail_username`, `software_smtp_mail_password`, `software_smtp_mail_encryption`, `software_smtp_mail_from_address`, `software_smtp_mail_from_name`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'smtp.titan.email', '465', '', '', 'ssl', '', '', '2024-03-12 18:34:31', '2024-08-26 17:28:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_affiliates`
--

CREATE TABLE `sub_affiliates` (
  `id` bigint UNSIGNED NOT NULL,
  `affiliate_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `withdrawal_id` bigint UNSIGNED NOT NULL,
  `pix_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pix_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `label` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT '0.000000000000',
  `balance_min` decimal(27,12) NOT NULL DEFAULT '10000.100000000000',
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT '45.00',
  `mode` enum('balance_min','percentage') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'usd',
  `status` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idUnico` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oauth_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'uploads/avatar/padrao.webp',
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cpf` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logged_in` tinyint NOT NULL DEFAULT '0',
  `banned` tinyint NOT NULL DEFAULT '0',
  `inviter` int DEFAULT NULL,
  `inviter_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliate_revenue_share` bigint NOT NULL DEFAULT '0',
  `affiliate_revenue_share_fake` bigint DEFAULT '0',
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT '0.00',
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT '0.00',
  `is_demo_agent` tinyint NOT NULL DEFAULT '0',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `language` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pt_BR',
  `role_id` int DEFAULT '3'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`) VALUES
(1, 'Admin', 'ondagames@hotmail.com', NULL, '$2y$10$RFxOKraPFys5rgfBzpjPzuPGKLlByoRWcr5EB7yWxwEFvrkIBtOL6', 'OFMR3nONGO8bMNcRfSLBwPn9eHINbf9XoLDjUnC6iwpAsWwCc0QSHJI4xCci', '2024-04-20 19:00:12', '2024-11-01 20:42:09', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, '123.123.123-12', '(12) 34567-8910', 0, 0, NULL, 'VT1YGWERSA', 0, 0, 15.00, 5.00, 0, 'active', 'pt-BR', 3),
(1525, 'TEST@GMAIL.COM', 'TEST@GMAIL.COM', NULL, '$2y$10$RFxOKraPFys5rgfBzpjPzuPGKLlByoRWcr5EB7yWxwEFvrkIBtOL6', NULL, '2024-12-18 04:00:02', '2024-12-18 04:00:02', NULL, NULL, 'uploads/avatar/padrao.webp', NULL, NULL, '(43) 43434-3434', 0, 0, NULL, NULL, 0, 0, 10.00, 15.00, 0, 'active', 'pt_BR', 3),
(1524, 'testevip', 'testevip@gmail.com', NULL, '$2y$10$RFxOKraPFys5rgfBzpjPzuPGKLlByoRWcr5EB7yWxwEFvrkIBtOL6', NULL, '2024-11-30 20:46:43', '2024-11-30 20:46:43', NULL, NULL, NULL, NULL, NULL, '(65) 65656-565', 0, 0, NULL, NULL, 0, 0, 10.00, 15.00, 0, 'active', 'pt_BR', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_vips`
--

CREATE TABLE `user_vips` (
  `id` bigint UNSIGNED NOT NULL COMMENT 'Identificador único',
  `user_id` bigint UNSIGNED NOT NULL COMMENT 'ID do usuário',
  `vip_id` bigint UNSIGNED NOT NULL COMMENT 'ID do VIP alcançado',
  `last_reward_claimed_at` timestamp NULL DEFAULT NULL COMMENT 'Data do último resgate semanal',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data de atualização'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabela que relaciona usuários aos níveis VIP';

--
-- Despejando dados para a tabela `user_vips`
--

INSERT INTO `user_vips` (`id`, `user_id`, `vip_id`, `last_reward_claimed_at`, `created_at`, `updated_at`) VALUES
(4, 1524, 1, '2024-11-30 20:46:54', '2024-11-30 20:46:54', '2024-11-30 20:46:54'),
(3, 1, 2, '2024-11-30 20:45:46', '2024-11-30 20:45:46', '2024-11-30 20:45:46'),
(5, 1, 4, '2024-12-20 03:01:56', '2024-12-20 03:01:56', '2024-12-20 03:01:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vips`
--

CREATE TABLE `vips` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Título do VIP',
  `description` text COLLATE utf8mb4_unicode_ci,
  `required_missions` int UNSIGNED NOT NULL COMMENT 'Quantidade de missões necessárias',
  `weekly_reward` decimal(10,2) NOT NULL COMMENT 'Valor da recompensa semanal',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Imagem do VIP',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data de criação',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data de atualização'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Tabela de níveis VIP';

--
-- Despejando dados para a tabela `vips`
--

INSERT INTO `vips` (`id`, `title`, `description`, `required_missions`, `weekly_reward`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Bronze 1', 'Você está no nivel 1, sua jornada inicia aqui. Complete as missões e passe para o próximo nível.', 0, 2.00, 'uploads/vips/01JDWD2JRP6GCYZ8QK4E1ZQ98Q.png', '2024-11-29 17:46:42', '2024-11-29 17:46:42'),
(2, 'Bronze 2', 'Parabéns você está no nível 2. Agora para cumprir as missões você precisará fazer depósitos um pouco mais altos. Além disso, você terá a opção de indicar um amigo para ganhar pontos! Boa sorte jogador(a)!', 2, 3.00, 'uploads/vips/01JDWDBF4D38K5VNTAE0HWGNFN.png', '2024-11-29 17:51:33', '2024-11-29 17:51:33'),
(3, 'Bronze 3', 'Você chegou a nível 3! Agora, as missões pedem por depósitos maiores, mas ó, vem coisa boa por aí. E ó, chama aquele amigo pro game e ganha pontos extras. Bora lá, campeão!', 4, 4.00, 'uploads/vips/01JDWDC58VHXQSCY362XY2A2DB.png', '2024-11-29 17:51:56', '2024-11-29 17:51:56'),
(4, 'Prata 1', 'Parabéns por alcançar o Nível 6! Agora, as missões estão mais complexas e desafiadoras. Prepare-se para testar suas habilidades ao máximo. E lembre-se: trazer um amigo para jogar pode render pontos bônus para ambos!', 7, 5.00, 'uploads/vips/01JDWDEFT8TA5DKX190CBYJ5ZX.png', '2024-11-29 17:53:12', '2024-11-29 17:53:12'),
(5, 'Prata 2', 'As tarefas aqui exigem precisão e estratégia. Mostre que você tem o que é preciso para dominar este estágio. Convide um amigo para se juntar e compartilhe a jornada para ganhar ainda mais pontos!', 9, 6.00, 'uploads/vips/01JDWDH1NC2SMSXJES2XERC5G3.png', '2024-11-29 17:54:36', '2024-11-29 17:54:36'),
(6, 'Prata 3', 'Bem-vindo, você onde apenas os verdadeiros mestres prevalecem! As missões são intensas, mas as recompensas são ainda maiores. Não se esqueça de que jogar com amigos aumenta suas chances de sucesso e pontos!', 12, 7.00, 'uploads/vips/01JDWDK9K7Q9EZMBC2M0CWY2C3.png', '2024-11-29 17:55:50', '2024-11-29 17:55:50'),
(7, 'Ouro 1', 'Você é agora uma Lenda!, prepare-se para missões lendárias que poucos conseguem completar. Chame seus amigos mais confiáveis e juntos, façam história nos jogos da Donald.', 15, 10.00, 'uploads/vips/01JDWDNR01Q6KRCGZ4WAP1FEHF.png', '2024-11-29 17:57:10', '2024-11-29 17:57:10'),
(8, 'Ouro 2', 'Bem-vindo, onde só os Titãs caminham. Sua jornada até aqui foi impressionante. Agora, cada missão é uma batalha épica que exige força e inteligência. Traga amigos e elevem uns aos outros à grandeza.', 18, 13.00, 'uploads/vips/01JDWDQJ33PTYEM7VC8FBX52YS.png', '2024-11-29 17:58:09', '2024-11-29 17:58:09'),
(9, 'Ouro 3', 'Você chegou ao Nível, o domínio dos Conquistadores. Aqui, cada desafio é uma chance de provar seu valor. Convide um amigo para essa jornada épica e juntos, conquistem vitórias memoráveis!', 23, 15.00, 'uploads/vips/01JDWDRXA8DMHQFC23M6RTWN53.png', '2024-11-29 17:58:54', '2024-11-29 17:58:54'),
(10, 'Platina 1', 'Bem-vindo ao Platina 1! Você chegou até aqui e sem dúvidas merece recompensas incríveis. É por isso que durante a sua jornada nesse novo nível, você vai encontrar missões mais emocionantes e prêmios igualmente incríveis. Agora é com você, te esperamos no Platina 2!', 30, 20.00, 'uploads/vips/01JDWDTNAJR3G2BWQFNFC9H2P2.png', '2024-11-29 17:59:51', '2024-11-29 17:59:51'),
(11, 'Platina 2', 'Bem-vindo ao Platina 2! Você realmente é um jogador nato. E como forma de reconhecimento do seu esforço até aqui, garantimos mais missões e prêmios de alto nível. Mostre seu empenho, conquiste novas recompensas e prepare-se para o Platina 3!', 40, 30.00, 'uploads/vips/01JDWDW1B4BZHZGFG8K7ZYSAG0.png', '2024-11-29 18:00:36', '2024-11-29 18:00:36'),
(12, 'Platina 3', 'Bem-vindo ao Platina 3! Você é nosso orgulho! Aqui, os desafios são mais intensos e as recompensas ainda maiores. Continue se esforçando e desafie suas habilidades – você está no caminho!', 58, 40.00, 'uploads/vips/01JDWDXGJKSVK1706NCGB7C6CJ.png', '2024-11-29 18:01:24', '2024-11-29 18:01:24'),
(13, 'Diamante 1', 'Bem-vindo ao Diamante 1! Estamos muito impressionados com o seu potencial. Neste nível, você começa a enfrentar desafios de nível superior e ganhar recompensas ainda mais valiosas. Prepare-se para um nível de jogo mais emocionante e mostre que está pronto para o Diamante 2!', 70, 50.00, 'uploads/vips/01JDWDYMNPXP2ECQK33VBBEPX4.png', '2024-11-29 18:02:01', '2024-11-29 18:02:01'),
(14, 'Diamante 2', 'Bem-vindo ao Diamante 2! Você está se destacando cada vez mais, os desafios ficam ainda mais intensos e as recompensas mais impressionantes. Continue se empenhando, complete as tarefas e prepare-se para alcançar o Diamante 3!', 85, 65.00, 'uploads/vips/01JDWE40KYF3H8S541EGBEWCKS.png', '2024-11-29 18:04:57', '2024-11-29 18:04:57'),
(15, 'Diamante 3', 'Bem-vindo ao Diamante 3! Esse é só para os que não tem medo da grandeza. Com desafios de alta dificuldade e recompensas de prestígio, você está se consolidando como um verdadeiro mestre. Mostre sua maestria e conquiste novos feitos – você está quase no topo!', 100, 70.00, 'uploads/vips/01JDWE5QFA2RC7P40CZ36WFV2S.png', '2024-11-29 18:05:54', '2024-11-29 18:05:54'),
(16, 'Black I', 'Bem-vindo ao Black 1! Você está entrando na elite com os desafios mais exclusivos e recompensas extraordinárias. Neste nível, cada conquista é um marco e cada desafio, uma prova de sua habilidade. Mostre seu valor e prepare-se para o próximo nível de prestígio!', 150, 100.00, 'uploads/vips/01JDWE745DRM8MRBPSR7GXMHYZ.png', '2024-11-29 18:06:39', '2024-11-29 18:06:39'),
(17, 'Black II', 'No Black 2, você está solidificando sua posição na elite. Os desafios são mais complexos e as recompensas, ainda mais impressionantes. Continue sua jornada com determinação e prove que você é um verdadeiro mestre entre os melhores.', 200, 150.00, 'uploads/vips/01JDWE7YVH9WTR5Z7SB3AH0XYJ.png', '2024-11-29 18:07:07', '2024-11-29 18:07:07'),
(18, 'Black III', 'Chegou o Black 3, onde você enfrenta os desafios mais exigentes e mostra um domínio impressionante. Este é um nível de alta performance, onde cada tarefa completada e cada meta alcançada refletem sua excelência e dedicação.', 500, 400.00, 'uploads/vips/01JDWE98F2CGMJEH35QKTRJN9A.png', '2024-11-29 18:07:49', '2024-11-29 18:07:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_bonus_rollover` decimal(10,2) DEFAULT '0.00',
  `balance_deposit_rollover` decimal(10,2) DEFAULT '0.00',
  `balance_withdrawal` decimal(10,2) DEFAULT '0.00',
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `balance_demo` decimal(20,8) DEFAULT '1000.00000000',
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hide_balance` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_won` bigint NOT NULL DEFAULT '0',
  `total_lose` bigint NOT NULL DEFAULT '0',
  `last_won` bigint NOT NULL DEFAULT '0',
  `last_lose` bigint NOT NULL DEFAULT '0',
  `vip_level` bigint DEFAULT '0',
  `vip_points` bigint DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`) VALUES
(1, 1, 'BRL', 'R$', 0.00, 142.50, 0.00, 235.77, 142.50, 0.00000000, 1000.00000000, 0.00, 0, 1, '2024-04-20 19:00:12', '2024-12-20 05:33:06', 0.00, 0, 0, 0, 0, 0, 0),
(1409, 1525, 'BRL', 'R$', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2024-12-18 04:00:02', '2024-12-18 04:00:02', 0.00, 0, 0, 0, 0, 0, 0),
(1408, 1524, 'BRL', 'R$', 0.00, 5.00, 0.00, 58.16, 5.00, 0.00000000, 1000.00000000, 0.00, 0, 1, '2024-11-30 20:46:43', '2024-11-30 20:58:52', 0.00, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint UNSIGNED NOT NULL,
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `change` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_roi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_entry` decimal(20,2) NOT NULL DEFAULT '0.00',
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT '0.00',
  `game` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int UNSIGNED NOT NULL,
  `app_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proof` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `pix_key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pix_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cpf` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `affiliate_logs_user_id` (`user_id`);

--
-- Índices de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `bs_pays`
--
ALTER TABLE `bs_pays`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE;

--
-- Índices de tabela `category_game`
--
ALTER TABLE `category_game`
  ADD KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `category_games_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `cupons`
--
ALTER TABLE `cupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE;

--
-- Índices de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `digito_pay`
--
ALTER TABLE `digito_pay`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `ezzepay`
--
ALTER TABLE `ezzepay`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_provider_id_index` (`provider_id`),
  ADD KEY `games_game_code_index` (`game_code`);

--
-- Índices de tabela `games_keys`
--
ALTER TABLE `games_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_likes`
--
ALTER TABLE `game_likes`
  ADD UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggr_games_fivers`
--
ALTER TABLE `ggr_games_fivers`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mission_users`
--
ALTER TABLE `mission_users`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `promocoes`
--
ALTER TABLE `promocoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  ADD KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `user_vips`
--
ALTER TABLE `user_vips`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `affiliate_logs`
--
ALTER TABLE `affiliate_logs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de tabela `bs_pays`
--
ALTER TABLE `bs_pays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de tabela `cupons`
--
ALTER TABLE `cupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de tabela `digito_pay`
--
ALTER TABLE `digito_pay`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ezzepay`
--
ALTER TABLE `ezzepay`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1136;

--
-- AUTO_INCREMENT de tabela `games_keys`
--
ALTER TABLE `games_keys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `ggr_games_fivers`
--
ALTER TABLE `ggr_games_fivers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `mission_users`
--
ALTER TABLE `mission_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1676;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `promocoes`
--
ALTER TABLE `promocoes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1526;

--
-- AUTO_INCREMENT de tabela `user_vips`
--
ALTER TABLE `user_vips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador único', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `vips`
--
ALTER TABLE `vips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1410;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
