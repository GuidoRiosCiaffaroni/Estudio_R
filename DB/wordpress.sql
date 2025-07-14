-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 14-07-2025 a las 02:42:26
-- Versión del servidor: 8.0.37
-- Versión de PHP: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wordpress`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_commentmeta`
--

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `comment_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_comments`
--

CREATE TABLE `wp_comments` (
  `comment_ID` bigint UNSIGNED NOT NULL,
  `comment_post_ID` bigint UNSIGNED NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `comment_karma` int NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2025-07-12 04:17:51', '2025-07-12 04:17:51', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com/\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_db_upload`
--

CREATE TABLE `wp_db_upload` (
  `ID` int DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Comuna` int DEFAULT NULL,
  `Genero_Victima` int DEFAULT NULL,
  `Edad` int DEFAULT NULL,
  `si_no` int DEFAULT NULL,
  `Genero_Agresor` double DEFAULT NULL,
  `Comuna_1` text COLLATE utf8mb4_unicode_520_ci,
  `Tipo` int DEFAULT NULL,
  `Nombre_Genero_Victima_Texto` text COLLATE utf8mb4_unicode_520_ci,
  `Nombre_Genero_Agresor_Texto` text COLLATE utf8mb4_unicode_520_ci,
  `Nombre_Comuna` text COLLATE utf8mb4_unicode_520_ci,
  `Nombre_Violencia` text COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_db_upload`
--

INSERT INTO `wp_db_upload` (`ID`, `Fecha`, `Comuna`, `Genero_Victima`, `Edad`, `si_no`, `Genero_Agresor`, `Comuna_1`, `Tipo`, `Nombre_Genero_Victima_Texto`, `Nombre_Genero_Agresor_Texto`, `Nombre_Comuna`, `Nombre_Violencia`) VALUES
(1, '2021-09-09 14:09:00', 13201, 1, 25, 0, NULL, 'Puente Alto', 50, 'Mujer', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(2, '2021-09-21 14:01:00', 13401, 0, 28, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(3, '2021-09-28 12:40:00', 13122, 0, 27, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(4, '2021-09-28 13:16:00', 13114, 0, 31, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(5, '2021-09-28 15:08:00', 13104, 0, 23, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(6, '2021-09-30 13:24:00', 13501, 1, 31, 1, 0, 'Melipilla', 9, 'Mujer', 'Hombre', 'Melipilla', 'Descalificacion constante o humillacion verbal'),
(7, '2021-10-01 12:40:00', 13501, 1, 33, 1, 0, 'Melipilla', 42, 'Mujer', 'Hombre', 'Melipilla', 'Persecucion o acoso persistente (stalking)'),
(8, '2021-10-05 13:14:00', 13105, 0, 22, 1, 0, 'El Bosque', 35, 'Hombre', 'Hombre', 'El Bosque', 'Golpes con objetos, punetazos, patadas'),
(9, '2021-10-06 12:31:00', 13105, 0, 30, 0, NULL, 'El Bosque', 50, 'Hombre', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(10, '2021-10-06 13:27:00', 13125, 1, 39, 1, 0, 'Quilicura', 4, 'Mujer', 'Hombre', 'Quilicura', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(11, '2021-10-07 14:27:00', 13101, 1, 31, 0, NULL, 'Santiago', 50, 'Mujer', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(12, '2021-10-12 13:49:00', 13110, 1, 30, 1, 0, 'La Florida', 24, 'Mujer', 'Hombre', 'La Florida', 'Miradas o gestos lascivos'),
(13, '2021-10-13 13:05:00', 13501, 1, 27, 1, 1, 'Melipilla', 6, 'Mujer', 'Mujer', 'Melipilla', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(14, '2021-10-13 13:34:00', 13128, 0, 22, 0, NULL, 'Renca', 50, 'Hombre', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(15, '2021-10-13 13:46:00', 13115, 0, 28, 0, NULL, 'Lo Barnechea', 50, 'Hombre', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(16, '2021-10-14 12:49:00', 13101, 1, 30, 0, NULL, 'Santiago', 50, 'Mujer', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(17, '2021-10-14 14:25:00', 13102, 0, 27, 0, NULL, 'Cerrillos', 50, 'Hombre', NULL, 'Cerrillos', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(18, '2021-10-14 14:46:00', 13111, 0, 26, 0, NULL, 'La Granja', 50, 'Hombre', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(19, '2021-10-14 16:04:00', 13110, 1, 27, 1, 1, 'La Florida', 30, 'Mujer', 'Mujer', 'La Florida', 'Acoso sexual en el trabajo o espacios educativos'),
(20, '2021-10-19 12:17:00', 13115, 1, 25, 1, 1, 'Lo Barnechea', 6, 'Mujer', 'Mujer', 'Lo Barnechea', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(21, '2021-10-19 13:41:00', 13121, 0, 28, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Hombre', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(22, '2021-10-20 11:30:00', 13104, 1, 21, 1, 0, 'Conchali', 9, 'Mujer', 'Hombre', 'Conchali', 'Descalificacion constante o humillacion verbal'),
(23, '2021-10-20 13:07:00', 13101, 0, 31, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(24, '2021-10-21 12:13:00', 13501, 1, 35, 1, 0, 'Melipilla', 42, 'Mujer', 'Hombre', 'Melipilla', 'Persecucion o acoso persistente (stalking)'),
(25, '2021-10-21 16:34:00', 13104, 0, 29, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(26, '2021-10-22 13:04:00', 13114, 0, 21, 1, 0, 'Las Condes', 24, 'Hombre', 'Hombre', 'Las Condes', 'Miradas o gestos lascivos'),
(27, '2021-10-25 16:09:00', 13401, 0, 27, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(28, '2021-10-29 13:18:00', 13601, 0, 29, 0, NULL, 'Talagante', 50, 'Hombre', NULL, 'Talagante', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(29, '2021-10-30 13:48:00', 13402, 0, 24, 0, NULL, 'Buin', 50, 'Hombre', NULL, 'Buin', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(30, '2021-11-02 12:26:00', 13120, 1, 36, 1, 0, 'Nunoa', 9, 'Mujer', 'Hombre', 'Nunoa', 'Descalificacion constante o humillacion verbal'),
(31, '2021-11-02 13:46:00', 13122, 1, 38, 0, NULL, 'Penalolen', 50, 'Mujer', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(32, '2021-11-02 14:56:00', 13109, 0, 23, 0, NULL, 'La Cisterna', 50, 'Hombre', NULL, 'La Cisterna', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(33, '2021-11-02 15:20:00', 13125, 0, 20, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(34, '2021-11-02 16:50:00', 13119, 0, 34, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(35, '2021-11-02 18:23:00', 13119, 1, 33, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(36, '2021-11-03 10:56:00', 13201, 0, 20, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(37, '2021-11-03 13:16:00', 13201, 1, 24, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(38, '2021-11-03 14:21:00', 13114, 0, 26, 1, 0, 'Las Condes', 35, 'Hombre', 'Hombre', 'Las Condes', 'Golpes con objetos, punetazos, patadas'),
(39, '2021-11-04 13:25:00', 13601, 0, 22, 1, 0, 'Talagante', 23, 'Hombre', 'Hombre', 'Talagante', 'Comentarios sexuales no deseados'),
(40, '2021-11-04 15:06:00', 13401, 1, 34, 1, 0, 'San Bernardo', 9, 'Mujer', 'Hombre', 'San Bernardo', 'Descalificacion constante o humillacion verbal'),
(41, '2021-11-04 16:03:00', 13119, 1, 26, 1, 1, 'Maipu', 35, 'Mujer', 'Mujer', 'Maipu', 'Golpes con objetos, punetazos, patadas'),
(42, '2021-11-05 13:40:00', 13118, 1, 29, 0, NULL, 'Macul', 50, 'Mujer', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(43, '2021-11-08 12:49:00', 13123, 0, 20, 1, 0, 'Providencia', 8, 'Hombre', 'Hombre', 'Providencia', 'Apropiacion de ideas u opiniones en entornos profesionales'),
(44, '2021-11-09 10:53:00', 13301, 1, 20, 1, 0, 'Colina', 10, 'Mujer', 'Hombre', 'Colina', 'Manipulacion emocional o gaslighting'),
(45, '2021-11-09 12:58:00', 13401, 1, 33, 1, 0, 'San Bernardo', 9, 'Mujer', 'Hombre', 'San Bernardo', 'Descalificacion constante o humillacion verbal'),
(46, '2021-11-10 11:58:00', 13119, 1, 22, 1, 0, 'Maipu', 23, 'Mujer', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(47, '2021-11-10 12:11:00', 13123, 1, 19, 1, 1, 'Providencia', 27, 'Mujer', 'Mujer', 'Providencia', 'Relaciones sexuales sin consentimiento pleno'),
(48, '2021-11-10 13:39:00', 13101, 0, 26, 1, 1, 'Santiago', 16, 'Hombre', 'Mujer', 'Santiago', 'Uso de hijos/as u otras personas como chantaje emocional'),
(49, '2021-11-10 13:54:00', 13201, 0, 30, 1, 0, 'Puente Alto', 35, 'Hombre', 'Hombre', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(50, '2021-11-10 15:19:00', 13122, 0, 36, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(51, '2021-11-10 15:21:00', 13601, 0, 24, 0, NULL, 'Talagante', 50, 'Hombre', NULL, 'Talagante', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(52, '2021-11-10 16:18:00', 13401, 0, 22, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(53, '2021-11-11 12:39:00', 13605, 1, 21, 1, 1, 'Penaflor', 36, 'Mujer', 'Mujer', 'Penaflor', 'Lesiones fisicas moderadas o graves'),
(54, '2021-11-11 12:40:00', 13130, 1, 30, 1, 0, 'San Miguel', 9, 'Mujer', 'Hombre', 'San Miguel', 'Descalificacion constante o humillacion verbal'),
(55, '2021-11-11 13:35:00', 13122, 1, 22, 1, 0, 'Penalolen', 23, 'Mujer', 'Hombre', 'Penalolen', 'Comentarios sexuales no deseados'),
(56, '2021-11-11 14:20:00', 13110, 1, 30, 0, NULL, 'La Florida', 50, 'Mujer', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(57, '2021-11-12 14:26:00', 13115, 1, 21, 1, 0, 'Lo Barnechea', 10, 'Mujer', 'Hombre', 'Lo Barnechea', 'Manipulacion emocional o gaslighting'),
(58, '2021-11-15 13:50:00', 13128, 1, 32, 1, 0, 'Renca', 15, 'Mujer', 'Hombre', 'Renca', 'Fomento de inseguridades o dependencia emocional'),
(59, '2021-11-16 13:54:00', 13101, 1, 36, 1, 1, 'Santiago', 27, 'Mujer', 'Mujer', 'Santiago', 'Relaciones sexuales sin consentimiento pleno'),
(60, '2021-11-16 14:37:00', 13107, 0, 28, 0, NULL, 'Huechuraba', 50, 'Hombre', NULL, 'Huechuraba', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(61, '2021-11-16 15:17:00', 13126, 1, 28, 1, 0, 'Quinta Normal', 19, 'Mujer', 'Hombre', 'Quinta Normal', 'Retencion o robo de bienes personales o dinero'),
(62, '2021-11-16 16:11:00', 13124, 1, 40, 1, 0, 'Pudahuel', 4, 'Mujer', 'Hombre', 'Pudahuel', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(63, '2021-11-17 11:03:00', 13302, 1, 32, 1, 0, 'Lampa', 9, 'Mujer', 'Hombre', 'Lampa', 'Descalificacion constante o humillacion verbal'),
(64, '2021-11-17 13:03:00', 13121, 1, 23, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Mujer', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(65, '2021-11-17 13:06:00', 13128, 0, 27, 0, NULL, 'Renca', 50, 'Hombre', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(66, '2021-11-17 14:25:00', 13126, 0, 26, 0, NULL, 'Quinta Normal', 50, 'Hombre', NULL, 'Quinta Normal', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(67, '2021-11-18 12:20:00', 13106, 1, 24, 1, 0, 'Estacion Central', 23, 'Mujer', 'Hombre', 'Estacion Central', 'Comentarios sexuales no deseados'),
(68, '2021-11-18 12:43:00', 13403, 0, 24, 1, 0, 'Calera de Tango', 35, 'Hombre', 'Hombre', 'Calera de Tango', 'Golpes con objetos, punetazos, patadas'),
(69, '2021-11-18 14:09:00', 13111, 0, 29, 0, NULL, 'La Granja', 50, 'Hombre', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(70, '2021-11-18 16:02:00', 13131, 1, 29, 0, NULL, 'San Ramon', 50, 'Mujer', NULL, 'San Ramon', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(71, '2021-11-19 12:47:00', 13111, 0, 18, 0, NULL, 'La Granja', 50, 'Hombre', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(72, '2021-11-19 14:37:00', 13501, 0, 30, 1, 0, 'Melipilla', 35, 'Hombre', 'Hombre', 'Melipilla', 'Golpes con objetos, punetazos, patadas'),
(73, '2021-11-19 15:17:00', 13201, 1, 25, 1, 0, 'Puente Alto', 23, 'Mujer', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(74, '2021-11-22 11:46:00', 13116, 1, 26, 1, 1, 'Lo Espejo', 30, 'Mujer', 'Mujer', 'Lo Espejo', 'Acoso sexual en el trabajo o espacios educativos'),
(75, '2021-11-22 13:01:00', 13114, 1, 21, 1, 0, 'Las Condes', 24, 'Mujer', 'Hombre', 'Las Condes', 'Miradas o gestos lascivos'),
(76, '2021-11-22 14:57:00', 13101, 1, 22, 1, 0, 'Santiago', 23, 'Mujer', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(77, '2021-11-23 13:28:00', 13109, 1, 29, 1, 0, 'La Cisterna', 33, 'Mujer', 'Hombre', 'La Cisterna', 'Empujones o sacudidas leves'),
(78, '2021-11-23 13:35:00', 13121, 1, 32, 1, 0, 'Pedro Aguirre Cerda', 19, 'Mujer', 'Hombre', 'Pedro Aguirre Cerda', 'Retencion o robo de bienes personales o dinero'),
(79, '2021-11-23 13:40:00', 13302, 1, 29, 0, NULL, 'Lampa', 50, 'Mujer', NULL, 'Lampa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(80, '2021-11-23 13:55:00', 13117, 0, 21, 0, NULL, 'Lo Prado', 50, 'Hombre', NULL, 'Lo Prado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(81, '2021-11-23 15:21:00', 13120, 0, 29, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(82, '2021-11-24 13:04:00', 13604, 0, 19, 0, NULL, 'Padre Hurtado', 50, 'Hombre', NULL, 'Padre Hurtado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(83, '2021-11-24 13:13:00', 13107, 0, 27, 1, 0, 'Huechuraba', 9, 'Hombre', 'Hombre', 'Huechuraba', 'Descalificacion constante o humillacion verbal'),
(84, '2021-11-24 13:20:00', 13117, 1, 33, 1, 0, 'Lo Prado', 42, 'Mujer', 'Hombre', 'Lo Prado', 'Persecucion o acoso persistente (stalking)'),
(85, '2021-11-24 13:49:00', 13604, 1, 21, 1, 0, 'Padre Hurtado', 9, 'Mujer', 'Hombre', 'Padre Hurtado', 'Descalificacion constante o humillacion verbal'),
(86, '2021-11-24 14:11:00', 13112, 1, 23, 1, 0, 'La Pintana', 23, 'Mujer', 'Hombre', 'La Pintana', 'Comentarios sexuales no deseados'),
(87, '2021-11-24 14:50:00', 13103, 1, 28, 1, 0, 'Cerro Navia', 19, 'Mujer', 'Hombre', 'Cerro Navia', 'Retencion o robo de bienes personales o dinero'),
(88, '2021-11-24 15:15:00', 13201, 0, 34, 0, NULL, 'Puente Alto', 47, 'Hombre', NULL, 'Puente Alto', 'Trato deshumanizante en servicios publicos o de salud'),
(89, '2021-11-25 14:32:00', 13118, 1, 24, 1, 0, 'Macul', 23, 'Mujer', 'Hombre', 'Macul', 'Comentarios sexuales no deseados'),
(90, '2021-11-25 14:33:00', 13121, 1, 31, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Mujer', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(91, '2021-11-25 14:43:00', 13110, 0, 25, 1, 0, 'La Florida', 23, 'Hombre', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(92, '2021-11-26 12:56:00', 13201, 1, 24, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(93, '2021-11-26 14:09:00', 13110, 1, 28, 0, NULL, 'La Florida', 50, 'Mujer', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(94, '2021-11-26 14:10:00', 13110, 1, 19, 1, 0, 'La Florida', 23, 'Mujer', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(95, '2021-11-26 14:29:00', 13112, 0, 32, 0, NULL, 'La Pintana', 47, 'Hombre', NULL, 'La Pintana', 'Trato deshumanizante en servicios publicos o de salud'),
(96, '2021-11-29 11:08:00', 13124, 0, 20, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(97, '2021-11-29 11:37:00', 13301, 1, 23, 1, 1, 'Colina', 35, 'Mujer', 'Mujer', 'Colina', 'Golpes con objetos, punetazos, patadas'),
(98, '2021-11-30 13:00:00', 13110, 1, 27, 1, 0, 'La Florida', 2, 'Mujer', 'Hombre', 'La Florida', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(99, '2021-11-30 13:14:00', 13103, 1, 31, 1, 0, 'Cerro Navia', 19, 'Mujer', 'Hombre', 'Cerro Navia', 'Retencion o robo de bienes personales o dinero'),
(100, '2021-12-01 12:47:00', 13122, 1, 19, 0, NULL, 'Penalolen', 50, 'Mujer', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(101, '2021-12-01 14:08:00', 13123, 0, 21, 1, 2, 'Providencia', 9, 'Hombre', 'Otro', 'Providencia', 'Descalificacion constante o humillacion verbal'),
(102, '2021-12-01 14:58:00', 13108, 0, 27, 0, NULL, 'Independencia', 50, 'Hombre', NULL, 'Independencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(103, '2021-12-01 17:34:00', 13401, 1, 25, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(104, '2021-12-02 11:58:00', 13123, 1, 32, 1, 0, 'Providencia', 14, 'Mujer', 'Hombre', 'Providencia', 'Desvalorizacion de logros o capacidades personales'),
(105, '2021-12-02 14:08:00', 13130, 0, 20, 0, NULL, 'San Miguel', 50, 'Hombre', NULL, 'San Miguel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(106, '2021-12-02 14:26:00', 13401, 0, 26, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(107, '2021-12-02 14:41:00', 13120, 1, 25, 1, 0, 'Nunoa', 23, 'Mujer', 'Hombre', 'Nunoa', 'Comentarios sexuales no deseados'),
(108, '2021-12-05 13:14:00', 13101, 0, 40, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(109, '2021-12-06 10:40:00', 13107, 1, 25, 1, 0, 'Huechuraba', 23, 'Mujer', 'Hombre', 'Huechuraba', 'Comentarios sexuales no deseados'),
(110, '2021-12-06 13:41:00', 13402, 0, 31, 0, NULL, 'Buin', 50, 'Hombre', NULL, 'Buin', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(111, '2021-12-06 13:42:00', 13102, 0, 26, 0, NULL, 'Cerrillos', 50, 'Hombre', NULL, 'Cerrillos', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(112, '2021-12-06 14:06:00', 13114, 1, 18, 1, 0, 'Las Condes', 23, 'Mujer', 'Hombre', 'Las Condes', 'Comentarios sexuales no deseados'),
(113, '2021-12-06 16:20:00', 13126, 0, 28, 0, NULL, 'Quinta Normal', 50, 'Hombre', NULL, 'Quinta Normal', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(114, '2021-12-06 16:22:00', 13125, 1, 24, 1, 0, 'Quilicura', 23, 'Mujer', 'Hombre', 'Quilicura', 'Comentarios sexuales no deseados'),
(115, '2021-12-06 16:39:00', 13114, 1, 30, 1, 0, 'Las Condes', 24, 'Mujer', 'Hombre', 'Las Condes', 'Miradas o gestos lascivos'),
(116, '2021-12-07 12:22:00', 13123, 1, 30, 1, 0, 'Providencia', 14, 'Mujer', 'Hombre', 'Providencia', 'Desvalorizacion de logros o capacidades personales'),
(117, '2021-12-07 12:28:00', 13115, 0, 37, 1, 0, 'Lo Barnechea', 9, 'Hombre', 'Hombre', 'Lo Barnechea', 'Descalificacion constante o humillacion verbal'),
(118, '2021-12-07 13:03:00', 13104, 0, 20, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(119, '2021-12-07 14:04:00', 13120, 0, 25, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(120, '2021-12-07 14:06:00', 13101, 1, 29, 1, 0, 'Santiago', 9, 'Mujer', 'Hombre', 'Santiago', 'Descalificacion constante o humillacion verbal'),
(121, '2021-12-07 14:41:00', 13401, 0, 33, 1, 0, 'San Bernardo', 35, 'Hombre', 'Hombre', 'San Bernardo', 'Golpes con objetos, punetazos, patadas'),
(122, '2021-12-08 13:08:00', 13101, 0, 28, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(123, '2021-12-08 13:25:00', 13127, 1, 37, 1, 0, 'Recoleta', 42, 'Mujer', 'Hombre', 'Recoleta', 'Persecucion o acoso persistente (stalking)'),
(124, '2021-12-08 14:38:00', 13104, 1, 19, 1, 0, 'Conchali', 23, 'Mujer', 'Hombre', 'Conchali', 'Comentarios sexuales no deseados'),
(125, '2021-12-08 15:08:00', 13201, 1, 36, 1, 0, 'Puente Alto', 42, 'Mujer', 'Hombre', 'Puente Alto', 'Persecucion o acoso persistente (stalking)'),
(126, '2021-12-08 15:15:00', 13112, 1, 25, 1, 0, 'La Pintana', 23, 'Mujer', 'Hombre', 'La Pintana', 'Comentarios sexuales no deseados'),
(127, '2021-12-08 15:32:00', 13112, 1, 28, 1, 0, 'La Pintana', 9, 'Mujer', 'Hombre', 'La Pintana', 'Descalificacion constante o humillacion verbal'),
(128, '2021-12-08 15:37:00', 13110, 1, 19, 1, 1, 'La Florida', 27, 'Mujer', 'Mujer', 'La Florida', 'Relaciones sexuales sin consentimiento pleno'),
(129, '2021-12-10 13:27:00', 13503, 0, 33, 1, 1, 'Curacavi', 16, 'Hombre', 'Mujer', 'Curacavi', 'Uso de hijos/as u otras personas como chantaje emocional'),
(130, '2021-12-10 13:33:00', 13108, 0, 25, 0, NULL, 'Independencia', 50, 'Hombre', NULL, 'Independencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(131, '2021-12-13 11:21:00', 13201, 0, 25, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(132, '2021-12-14 10:43:00', 13119, 1, 27, 1, 0, 'Maipu', 9, 'Mujer', 'Hombre', 'Maipu', 'Descalificacion constante o humillacion verbal'),
(133, '2021-12-14 13:15:00', 13501, 0, 30, 1, 0, 'Melipilla', 9, 'Hombre', 'Hombre', 'Melipilla', 'Descalificacion constante o humillacion verbal'),
(134, '2021-12-14 13:45:00', 13110, 0, 32, 1, 1, 'La Florida', 16, 'Hombre', 'Mujer', 'La Florida', 'Uso de hijos/as u otras personas como chantaje emocional'),
(135, '2021-12-14 17:03:00', 13603, 1, 25, 1, 0, 'Isla de Maipo', 23, 'Mujer', 'Hombre', 'Isla de Maipo', 'Comentarios sexuales no deseados'),
(136, '2021-12-15 11:40:00', 13130, 0, 31, 1, 0, 'San Miguel', 35, 'Hombre', 'Hombre', 'San Miguel', 'Golpes con objetos, punetazos, patadas'),
(137, '2021-12-15 13:16:00', 13120, 0, 22, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(138, '2021-12-15 14:12:00', 13114, 0, 29, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(139, '2021-12-15 14:12:00', 13116, 1, 28, 1, 1, 'Lo Espejo', 30, 'Mujer', 'Mujer', 'Lo Espejo', 'Acoso sexual en el trabajo o espacios educativos'),
(140, '2021-12-15 14:19:00', 13202, 1, 26, 0, NULL, 'Pirque', 50, 'Mujer', NULL, 'Pirque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(141, '2021-12-15 15:21:00', 13201, 1, 24, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(142, '2021-12-15 15:21:00', 13110, 0, 31, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(143, '2021-12-15 15:30:00', 13202, 1, 35, 1, 0, 'Pirque', 9, 'Mujer', 'Hombre', 'Pirque', 'Descalificacion constante o humillacion verbal'),
(144, '2021-12-16 13:10:00', 13112, 1, 21, 0, NULL, 'La Pintana', 50, 'Mujer', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(145, '2021-12-16 14:22:00', 13201, 1, 29, 0, NULL, 'Puente Alto', 50, 'Mujer', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(146, '2021-12-16 16:25:00', 13128, 1, 29, 1, 0, 'Renca', 13, 'Mujer', 'Hombre', 'Renca', 'Culpar a la victima por el conflicto o por la violencia sufrida'),
(147, '2021-12-16 16:38:00', 13401, 0, 29, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(148, '2021-12-17 12:02:00', 13110, 1, 19, 0, NULL, 'La Florida', 50, 'Mujer', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(149, '2021-12-20 14:54:00', 13101, 1, 31, 1, 1, 'Santiago', 30, 'Mujer', 'Mujer', 'Santiago', 'Acoso sexual en el trabajo o espacios educativos'),
(150, '2021-12-20 15:09:00', 13201, 1, 20, 0, NULL, 'Puente Alto', 50, 'Mujer', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(151, '2021-12-20 15:40:00', 13114, 1, 26, 1, 0, 'Las Condes', 9, 'Mujer', 'Hombre', 'Las Condes', 'Descalificacion constante o humillacion verbal'),
(152, '2021-12-21 11:54:00', 13128, 1, 29, 1, 1, 'Renca', 35, 'Mujer', 'Mujer', 'Renca', 'Golpes con objetos, punetazos, patadas'),
(153, '2021-12-21 13:15:00', 13101, 1, 27, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(154, '2021-12-21 14:37:00', 13101, 1, 33, 1, 0, 'Santiago', 9, 'Mujer', 'Hombre', 'Santiago', 'Descalificacion constante o humillacion verbal'),
(155, '2021-12-21 15:30:00', 13106, 0, 25, 1, 0, 'Estacion Central', 23, 'Hombre', 'Hombre', 'Estacion Central', 'Comentarios sexuales no deseados'),
(156, '2021-12-21 16:55:00', 13128, 0, 32, 1, 1, 'Renca', 16, 'Hombre', 'Mujer', 'Renca', 'Uso de hijos/as u otras personas como chantaje emocional'),
(157, '2021-12-22 11:55:00', 13401, 1, 25, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(158, '2021-12-22 12:03:00', 13118, 1, 21, 1, 0, 'Macul', 10, 'Mujer', 'Hombre', 'Macul', 'Manipulacion emocional o gaslighting'),
(159, '2021-12-22 12:36:00', 13401, 0, 27, 1, 0, 'San Bernardo', 35, 'Hombre', 'Hombre', 'San Bernardo', 'Golpes con objetos, punetazos, patadas'),
(160, '2021-12-22 12:38:00', 13124, 0, 28, 1, 0, 'Pudahuel', 35, 'Hombre', 'Hombre', 'Pudahuel', 'Golpes con objetos, punetazos, patadas'),
(161, '2021-12-22 13:07:00', 13201, 0, 26, 1, 0, 'Puente Alto', 9, 'Hombre', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(162, '2021-12-22 13:10:00', 13201, 1, 33, 1, 0, 'Puente Alto', 42, 'Mujer', 'Hombre', 'Puente Alto', 'Persecucion o acoso persistente (stalking)'),
(163, '2021-12-22 13:20:00', 13101, 0, 18, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(164, '2021-12-22 13:39:00', 13201, 0, 24, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(165, '2021-12-22 13:45:00', 13101, 1, 30, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(166, '2021-12-22 14:10:00', 13108, 1, 38, 1, 0, 'Independencia', 4, 'Mujer', 'Hombre', 'Independencia', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(167, '2021-12-22 14:50:00', 13114, 1, 31, 1, 0, 'Las Condes', 14, 'Mujer', 'Hombre', 'Las Condes', 'Desvalorizacion de logros o capacidades personales'),
(168, '2021-12-22 15:22:00', 13201, 1, 19, 1, 0, 'Puente Alto', 23, 'Mujer', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(169, '2021-12-22 15:51:00', 13112, 0, 37, 1, 0, 'La Pintana', 36, 'Hombre', 'Hombre', 'La Pintana', 'Lesiones fisicas moderadas o graves'),
(170, '2021-12-22 15:55:00', 13124, 1, 23, 1, 0, 'Pudahuel', 23, 'Mujer', 'Hombre', 'Pudahuel', 'Comentarios sexuales no deseados'),
(171, '2021-12-22 16:33:00', 13604, 0, 18, 0, NULL, 'Padre Hurtado', 50, 'Hombre', NULL, 'Padre Hurtado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(172, '2021-12-22 18:51:00', 13401, 0, 36, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(173, '2021-12-23 11:27:00', 13104, 0, 26, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(174, '2021-12-23 12:58:00', 13501, 0, 27, 0, NULL, 'Melipilla', 50, 'Hombre', NULL, 'Melipilla', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(175, '2021-12-23 13:03:00', 13601, 0, 29, 0, NULL, 'Talagante', 50, 'Hombre', NULL, 'Talagante', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(176, '2021-12-23 13:05:00', 13201, 1, 24, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(177, '2021-12-23 13:36:00', 13115, 0, 25, 0, NULL, 'Lo Barnechea', 50, 'Hombre', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(178, '2021-12-23 14:07:00', 13126, 0, 24, 1, 0, 'Quinta Normal', 23, 'Hombre', 'Hombre', 'Quinta Normal', 'Comentarios sexuales no deseados'),
(179, '2021-12-23 14:29:00', 13123, 1, 26, 1, 0, 'Providencia', 14, 'Mujer', 'Hombre', 'Providencia', 'Desvalorizacion de logros o capacidades personales'),
(180, '2021-12-23 14:58:00', 13120, 0, 34, 1, 0, 'Nunoa', 35, 'Hombre', 'Hombre', 'Nunoa', 'Golpes con objetos, punetazos, patadas'),
(181, '2021-12-23 15:24:00', 13114, 1, 31, 1, 1, 'Las Condes', 25, 'Mujer', 'Mujer', 'Las Condes', 'Tocamientos sin consentimiento'),
(182, '2021-12-23 17:17:00', 13132, 0, 31, 1, 0, 'Vitacura', 35, 'Hombre', 'Hombre', 'Vitacura', 'Golpes con objetos, punetazos, patadas'),
(183, '2021-12-23 17:23:00', 13401, 0, 31, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(184, '2021-12-23 17:26:00', 13201, 1, 24, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(185, '2021-12-26 14:05:00', 13123, 0, 32, 1, 0, 'Providencia', 35, 'Hombre', 'Hombre', 'Providencia', 'Golpes con objetos, punetazos, patadas'),
(186, '2021-12-27 13:01:00', 13404, 1, 38, 1, 0, 'Paine', 4, 'Mujer', 'Hombre', 'Paine', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(187, '2021-12-27 14:24:00', 13119, 1, 27, 1, 0, 'Maipu', 4, 'Mujer', 'Hombre', 'Maipu', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(188, '2021-12-27 15:41:00', 13105, 1, 24, 1, 0, 'El Bosque', 23, 'Mujer', 'Hombre', 'El Bosque', 'Comentarios sexuales no deseados'),
(189, '2021-12-28 13:32:00', 13201, 0, 29, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(190, '2021-12-28 14:36:00', 13301, 1, 26, 1, 1, 'Colina', 35, 'Mujer', 'Mujer', 'Colina', 'Golpes con objetos, punetazos, patadas'),
(191, '2021-12-28 14:44:00', 13109, 1, 27, 1, 0, 'La Cisterna', 5, 'Mujer', 'Hombre', 'La Cisterna', 'Expectativas sociales rigidas sobre como debe ser un hombre/mujer/persona'),
(192, '2021-12-28 15:09:00', 13119, 1, 20, 1, 0, 'Maipu', 10, 'Mujer', 'Hombre', 'Maipu', 'Manipulacion emocional o gaslighting'),
(193, '2021-12-29 11:46:00', 13401, 1, 24, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(194, '2021-12-29 12:39:00', 13108, 1, 26, 1, 0, 'Independencia', 14, 'Mujer', 'Hombre', 'Independencia', 'Desvalorizacion de logros o capacidades personales'),
(195, '2021-12-29 12:50:00', 13201, 1, 36, 1, 1, 'Puente Alto', 36, 'Mujer', 'Mujer', 'Puente Alto', 'Lesiones fisicas moderadas o graves'),
(196, '2021-12-29 12:57:00', 13105, 0, 31, 0, NULL, 'El Bosque', 50, 'Hombre', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(197, '2021-12-29 13:16:00', 13401, 1, 29, 1, 0, 'San Bernardo', 2, 'Mujer', 'Hombre', 'San Bernardo', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(198, '2021-12-29 13:28:00', 13604, 1, 24, 1, 1, 'Padre Hurtado', 35, 'Mujer', 'Mujer', 'Padre Hurtado', 'Golpes con objetos, punetazos, patadas'),
(199, '2021-12-29 13:50:00', 13125, 0, 30, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(200, '2021-12-29 14:03:00', 13128, 1, 24, 0, NULL, 'Renca', 50, 'Mujer', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(201, '2021-12-29 14:10:00', 13122, 1, 32, 1, 1, 'Penalolen', 36, 'Mujer', 'Mujer', 'Penalolen', 'Lesiones fisicas moderadas o graves'),
(202, '2021-12-29 15:02:00', 13106, 1, 30, 1, 0, 'Estacion Central', 24, 'Mujer', 'Hombre', 'Estacion Central', 'Miradas o gestos lascivos'),
(203, '2021-12-29 15:19:00', 13127, 1, 26, 0, NULL, 'Recoleta', 50, 'Mujer', NULL, 'Recoleta', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(204, '2021-12-29 16:37:00', 13124, 1, 23, 1, 1, 'Pudahuel', 35, 'Mujer', 'Mujer', 'Pudahuel', 'Golpes con objetos, punetazos, patadas'),
(205, '2021-12-30 11:19:00', 13119, 0, 20, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(206, '2021-12-30 13:29:00', 13130, 1, 26, 1, 0, 'San Miguel', 15, 'Mujer', 'Hombre', 'San Miguel', 'Fomento de inseguridades o dependencia emocional'),
(207, '2021-12-30 14:53:00', 13605, 1, 25, 1, 0, 'Penaflor', 23, 'Mujer', 'Hombre', 'Penaflor', 'Comentarios sexuales no deseados'),
(208, '2021-12-30 15:01:00', 13107, 0, 21, 0, NULL, 'Huechuraba', 50, 'Hombre', NULL, 'Huechuraba', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(209, '2021-12-30 15:18:00', 13112, 0, 23, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(210, '2021-12-30 15:53:00', 13125, 1, 24, 0, NULL, 'Quilicura', 50, 'Mujer', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(211, '2022-01-03 15:22:00', 13114, 0, 22, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(217, '2022-01-03 15:41:00', 13201, 1, 30, 1, 0, 'Puente Alto', 19, 'Mujer', 'Hombre', 'Puente Alto', 'Retencion o robo de bienes personales o dinero'),
(218, '2022-01-03 15:53:00', 13116, 0, 24, 1, 1, 'Lo Espejo', 21, 'Hombre', 'Mujer', 'Lo Espejo', 'Destruccion de objetos personales o simbolicos'),
(212, '2022-01-04 11:34:00', 13106, 1, 20, 1, 0, 'Estacion Central', 10, 'Mujer', 'Hombre', 'Estacion Central', 'Manipulacion emocional o gaslighting'),
(219, '2022-01-04 13:32:00', 13302, 1, 20, 1, 1, 'Lampa', 28, 'Mujer', 'Mujer', 'Lampa', 'Envio o difusion de imágenes sexuales sin consentimiento'),
(220, '2022-01-04 13:46:00', 13114, 0, 32, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(221, '2022-01-04 13:46:00', 13121, 1, 27, 1, 1, 'Pedro Aguirre Cerda', 4, 'Mujer', 'Mujer', 'Pedro Aguirre Cerda', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(222, '2022-01-04 14:15:00', 13114, 0, 28, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(223, '2022-01-04 14:32:00', 13201, 0, 31, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(224, '2022-01-04 15:05:00', 13105, 1, 26, 1, 0, 'El Bosque', 25, 'Mujer', 'Hombre', 'El Bosque', 'Tocamientos sin consentimiento'),
(225, '2022-01-04 16:56:00', 13201, 0, 23, 1, 0, 'Puente Alto', 35, 'Hombre', 'Hombre', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(213, '2022-01-05 11:03:00', 13108, 1, 33, 1, 0, 'Independencia', 42, 'Mujer', 'Hombre', 'Independencia', 'Persecucion o acoso persistente (stalking)'),
(226, '2022-01-05 11:32:00', 13105, 0, 24, 1, 1, 'El Bosque', 21, 'Hombre', 'Mujer', 'El Bosque', 'Destruccion de objetos personales o simbolicos'),
(227, '2022-01-05 12:48:00', 13127, 1, 21, 1, 0, 'Recoleta', 10, 'Mujer', 'Hombre', 'Recoleta', 'Manipulacion emocional o gaslighting'),
(228, '2022-01-05 13:46:00', 13301, 0, 24, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(229, '2022-01-05 13:57:00', 13404, 1, 23, 0, NULL, 'Paine', 50, 'Mujer', NULL, 'Paine', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(230, '2022-01-05 14:22:00', 13109, 0, 35, 1, 0, 'La Cisterna', 33, 'Hombre', 'Hombre', 'La Cisterna', 'Empujones o sacudidas leves'),
(231, '2022-01-05 14:25:00', 13102, 1, 29, 1, 0, 'Cerrillos', 21, 'Mujer', 'Hombre', 'Cerrillos', 'Destruccion de objetos personales o simbolicos'),
(232, '2022-01-05 14:31:00', 13402, 1, 27, 0, NULL, 'Buin', 50, 'Mujer', NULL, 'Buin', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(233, '2022-01-05 14:33:00', 13119, 0, 23, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(234, '2022-01-05 14:56:00', 13124, 0, 28, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(235, '2022-01-05 15:30:00', 13110, 1, 22, 1, 1, 'La Florida', 6, 'Mujer', 'Mujer', 'La Florida', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(236, '2022-01-05 17:28:00', 13106, 1, 25, 1, 1, 'Estacion Central', 6, 'Mujer', 'Mujer', 'Estacion Central', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(237, '2022-01-06 12:23:00', 13602, 1, 30, 1, 0, 'El Monte', 6, 'Mujer', 'Hombre', 'El Monte', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(238, '2022-01-06 12:40:00', 13104, 1, 22, 1, 0, 'Conchali', 23, 'Mujer', 'Hombre', 'Conchali', 'Comentarios sexuales no deseados'),
(239, '2022-01-06 13:04:00', 13119, 1, 24, 1, 0, 'Maipu', 23, 'Mujer', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(240, '2022-01-06 13:05:00', 13131, 1, 22, 1, 0, 'San Ramon', 23, 'Mujer', 'Hombre', 'San Ramon', 'Comentarios sexuales no deseados'),
(241, '2022-01-06 13:10:00', 13106, 0, 23, 1, 1, 'Estacion Central', 34, 'Hombre', 'Mujer', 'Estacion Central', 'Bofetadas, tirones de cabello o rasgunos'),
(242, '2022-01-06 13:29:00', 13302, 0, 23, 1, 0, 'Lampa', 23, 'Hombre', 'Hombre', 'Lampa', 'Comentarios sexuales no deseados'),
(243, '2022-01-06 14:15:00', 13116, 0, 19, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(244, '2022-01-06 14:32:00', 13201, 0, 33, 0, NULL, 'Puente Alto', 47, 'Hombre', NULL, 'Puente Alto', 'Trato deshumanizante en servicios publicos o de salud'),
(245, '2022-01-06 15:07:00', 13122, 0, 23, 1, 1, 'Penalolen', 34, 'Hombre', 'Mujer', 'Penalolen', 'Bofetadas, tirones de cabello o rasgunos'),
(246, '2022-01-06 15:15:00', 13117, 0, 28, 0, NULL, 'Lo Prado', 50, 'Hombre', NULL, 'Lo Prado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(247, '2022-01-06 15:37:00', 13401, 0, 25, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(248, '2022-01-07 11:40:00', 13131, 1, 26, 0, NULL, 'San Ramon', 50, 'Mujer', NULL, 'San Ramon', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(249, '2022-01-07 14:30:00', 13119, 1, 19, 1, 0, 'Maipu', 23, 'Mujer', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(250, '2022-01-07 16:18:00', 13119, 1, 35, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(215, '2022-01-08 13:43:00', 13119, 0, 32, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(216, '2022-01-09 12:46:00', 13130, 0, 24, 0, NULL, 'San Miguel', 50, 'Hombre', NULL, 'San Miguel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(251, '2022-01-10 11:40:00', 13118, 1, 20, 0, NULL, 'Macul', 50, 'Mujer', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(252, '2022-01-10 13:21:00', 13113, 0, 29, 0, NULL, 'La Reina', 50, 'Hombre', NULL, 'La Reina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(253, '2022-01-10 13:30:00', 13401, 1, 23, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(254, '2022-01-10 15:27:00', 13122, 0, 26, 1, 0, 'Penalolen', 35, 'Hombre', 'Hombre', 'Penalolen', 'Golpes con objetos, punetazos, patadas'),
(255, '2022-01-11 13:05:00', 13124, 1, 25, 1, 0, 'Pudahuel', 23, 'Mujer', 'Hombre', 'Pudahuel', 'Comentarios sexuales no deseados'),
(256, '2022-01-11 13:15:00', 13103, 0, 18, 1, 0, 'Cerro Navia', 23, 'Hombre', 'Hombre', 'Cerro Navia', 'Comentarios sexuales no deseados'),
(257, '2022-01-11 14:48:00', 13401, 0, 34, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(258, '2022-01-12 12:38:00', 13125, 1, 26, 0, NULL, 'Quilicura', 50, 'Mujer', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(259, '2022-01-12 12:52:00', 13122, 0, 39, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(260, '2022-01-12 13:08:00', 13107, 1, 28, 1, 0, 'Huechuraba', 14, 'Mujer', 'Hombre', 'Huechuraba', 'Desvalorizacion de logros o capacidades personales'),
(261, '2022-01-12 13:39:00', 13105, 1, 38, 1, 1, 'El Bosque', 36, 'Mujer', 'Mujer', 'El Bosque', 'Lesiones fisicas moderadas o graves'),
(262, '2022-01-12 13:42:00', 13501, 1, 25, 1, 0, 'Melipilla', 23, 'Mujer', 'Hombre', 'Melipilla', 'Comentarios sexuales no deseados'),
(263, '2022-01-12 13:43:00', 13124, 1, 32, 1, 1, 'Pudahuel', 36, 'Mujer', 'Mujer', 'Pudahuel', 'Lesiones fisicas moderadas o graves'),
(264, '2022-01-12 13:56:00', 13401, 0, 31, 1, 0, 'San Bernardo', 35, 'Hombre', 'Hombre', 'San Bernardo', 'Golpes con objetos, punetazos, patadas'),
(265, '2022-01-12 14:58:00', 13404, 1, 37, 1, 0, 'Paine', 42, 'Mujer', 'Hombre', 'Paine', 'Persecucion o acoso persistente (stalking)'),
(266, '2022-01-12 15:18:00', 13604, 1, 33, 1, 0, 'Padre Hurtado', 42, 'Mujer', 'Hombre', 'Padre Hurtado', 'Persecucion o acoso persistente (stalking)'),
(267, '2022-01-12 15:25:00', 13119, 0, 28, 1, 0, 'Maipu', 9, 'Hombre', 'Hombre', 'Maipu', 'Descalificacion constante o humillacion verbal'),
(268, '2022-01-12 15:25:00', 13110, 1, 31, 1, 1, 'La Florida', 6, 'Mujer', 'Mujer', 'La Florida', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(269, '2022-01-12 15:39:00', 13110, 0, 28, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(270, '2022-01-12 15:46:00', 13106, 1, 26, 1, 0, 'Estacion Central', 19, 'Mujer', 'Hombre', 'Estacion Central', 'Retencion o robo de bienes personales o dinero'),
(271, '2022-01-12 15:52:00', 13404, 1, 25, 1, 0, 'Paine', 23, 'Mujer', 'Hombre', 'Paine', 'Comentarios sexuales no deseados'),
(272, '2022-01-12 15:53:00', 13201, 0, 26, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(273, '2022-01-12 16:13:00', 13103, 0, 26, 0, NULL, 'Cerro Navia', 50, 'Hombre', NULL, 'Cerro Navia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(274, '2022-01-12 16:34:00', 13503, 0, 26, 0, NULL, 'Curacavi', 50, 'Hombre', NULL, 'Curacavi', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(275, '2022-01-12 17:03:00', 13203, 0, 36, 0, NULL, 'San Jose de Maipo', 50, 'Hombre', NULL, 'San Jose de Maipo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(276, '2022-01-13 13:03:00', 13110, 1, 29, 1, 0, 'La Florida', 33, 'Mujer', 'Hombre', 'La Florida', 'Empujones o sacudidas leves'),
(277, '2022-01-13 13:21:00', 13118, 0, 24, 0, NULL, 'Macul', 50, 'Hombre', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(278, '2022-01-13 13:38:00', 13132, 0, 29, 0, NULL, 'Vitacura', 50, 'Hombre', NULL, 'Vitacura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(279, '2022-01-13 13:40:00', 13131, 1, 36, 1, 0, 'San Ramon', 42, 'Mujer', 'Hombre', 'San Ramon', 'Persecucion o acoso persistente (stalking)'),
(280, '2022-01-13 14:16:00', 13106, 0, 29, 0, NULL, 'Estacion Central', 50, 'Hombre', NULL, 'Estacion Central', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(281, '2022-01-13 14:29:00', 13301, 1, 25, 1, 1, 'Colina', 35, 'Mujer', 'Mujer', 'Colina', 'Golpes con objetos, punetazos, patadas'),
(282, '2022-01-13 14:37:00', 13115, 1, 26, 1, 0, 'Lo Barnechea', 14, 'Mujer', 'Hombre', 'Lo Barnechea', 'Desvalorizacion de logros o capacidades personales'),
(283, '2022-01-13 15:34:00', 13128, 1, 37, 1, 0, 'Renca', 42, 'Mujer', 'Hombre', 'Renca', 'Persecucion o acoso persistente (stalking)'),
(284, '2022-01-13 15:54:00', 13124, 0, 21, 1, 1, 'Pudahuel', 21, 'Hombre', 'Mujer', 'Pudahuel', 'Destruccion de objetos personales o simbolicos'),
(285, '2022-01-13 16:00:00', 13110, 0, 33, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(286, '2022-01-13 16:00:00', 13101, 1, 34, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(287, '2022-01-13 16:09:00', 13202, 0, 22, 1, 0, 'Pirque', 23, 'Hombre', 'Hombre', 'Pirque', 'Comentarios sexuales no deseados'),
(288, '2022-01-13 16:14:00', 13127, 0, 38, 1, 1, 'Recoleta', 16, 'Hombre', 'Mujer', 'Recoleta', 'Uso de hijos/as u otras personas como chantaje emocional'),
(289, '2022-01-14 14:50:00', 13602, 1, 19, 1, 0, 'El Monte', 23, 'Mujer', 'Hombre', 'El Monte', 'Comentarios sexuales no deseados'),
(290, '2022-01-15 11:32:00', 13401, 0, 26, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(291, '2022-01-17 13:39:00', 13403, 1, 26, 1, 1, 'Calera de Tango', 35, 'Mujer', 'Mujer', 'Calera de Tango', 'Golpes con objetos, punetazos, patadas'),
(292, '2022-01-17 15:13:00', 13108, 0, 33, 1, 0, 'Independencia', 9, 'Hombre', 'Hombre', 'Independencia', 'Descalificacion constante o humillacion verbal'),
(293, '2022-01-17 15:29:00', 13124, 0, 29, 1, 1, 'Pudahuel', 16, 'Hombre', 'Mujer', 'Pudahuel', 'Uso de hijos/as u otras personas como chantaje emocional'),
(294, '2022-01-18 12:37:00', 13125, 0, 22, 1, 0, 'Quilicura', 26, 'Hombre', 'Hombre', 'Quilicura', 'Presion o chantaje para relaciones sexuales'),
(295, '2022-01-18 13:22:00', 13122, 0, 24, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(296, '2022-01-18 13:22:00', 13402, 0, 24, 1, 0, 'Buin', 33, 'Hombre', 'Hombre', 'Buin', 'Empujones o sacudidas leves'),
(297, '2022-01-18 13:43:00', 13114, 0, 26, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(298, '2022-01-18 14:29:00', 13118, 1, 26, 1, 0, 'Macul', 27, 'Mujer', 'Hombre', 'Macul', 'Relaciones sexuales sin consentimiento pleno'),
(299, '2022-01-18 15:07:00', 13126, 1, 36, 1, 0, 'Quinta Normal', 42, 'Mujer', 'Hombre', 'Quinta Normal', 'Persecucion o acoso persistente (stalking)'),
(300, '2022-01-18 16:11:00', 13119, 0, 38, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(301, '2022-01-18 19:28:00', 13110, 0, 22, 1, 0, 'La Florida', 23, 'Hombre', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(302, '2022-01-19 11:16:00', 13130, 0, 26, 0, NULL, 'San Miguel', 50, 'Hombre', NULL, 'San Miguel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(303, '2022-01-19 11:49:00', 13116, 1, 27, 1, 0, 'Lo Espejo', 9, 'Mujer', 'Hombre', 'Lo Espejo', 'Descalificacion constante o humillacion verbal'),
(304, '2022-01-19 12:07:00', 13132, 1, 23, 1, 0, 'Vitacura', 26, 'Mujer', 'Hombre', 'Vitacura', 'Presion o chantaje para relaciones sexuales'),
(305, '2022-01-19 12:16:00', 13116, 0, 23, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(306, '2022-01-19 12:20:00', 13103, 0, 30, 0, NULL, 'Cerro Navia', 50, 'Hombre', NULL, 'Cerro Navia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(307, '2022-01-19 12:35:00', 13201, 1, 21, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(308, '2022-01-19 12:42:00', 13111, 0, 27, 1, 0, 'La Granja', 33, 'Hombre', 'Hombre', 'La Granja', 'Empujones o sacudidas leves'),
(309, '2022-01-19 12:50:00', 13112, 0, 21, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(310, '2022-01-19 13:15:00', 13201, 1, 31, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(311, '2022-01-19 13:21:00', 13110, 0, 25, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(312, '2022-01-19 13:50:00', 13125, 0, 20, 1, 0, 'Quilicura', 25, 'Hombre', 'Hombre', 'Quilicura', 'Tocamientos sin consentimiento'),
(313, '2022-01-19 13:54:00', 13116, 0, 24, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(314, '2022-01-19 13:55:00', 13110, 1, 19, 0, NULL, 'La Florida', 50, 'Mujer', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(315, '2022-01-19 14:02:00', 13101, 0, 23, 1, 0, 'Santiago', 23, 'Hombre', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(316, '2022-01-19 14:12:00', 13122, 1, 22, 1, 1, 'Penalolen', 36, 'Mujer', 'Mujer', 'Penalolen', 'Lesiones fisicas moderadas o graves'),
(317, '2022-01-19 14:18:00', 13119, 1, 22, 0, NULL, 'Maipu', 50, 'Mujer', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(318, '2022-01-19 14:40:00', 13201, 0, 28, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(319, '2022-01-19 14:41:00', 13113, 0, 18, 1, 1, 'La Reina', 21, 'Hombre', 'Mujer', 'La Reina', 'Destruccion de objetos personales o simbolicos'),
(320, '2022-01-19 14:55:00', 13112, 0, 26, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(321, '2022-01-19 15:41:00', 13110, 0, 26, 1, 0, 'La Florida', 9, 'Hombre', 'Hombre', 'La Florida', 'Descalificacion constante o humillacion verbal'),
(322, '2022-01-19 16:26:00', 13110, 1, 23, 0, NULL, 'La Florida', 50, 'Mujer', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(323, '2022-01-19 16:54:00', 13103, 0, 25, 0, NULL, 'Cerro Navia', 50, 'Hombre', NULL, 'Cerro Navia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(324, '2022-01-19 17:55:00', 13119, 0, 20, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(325, '2022-01-20 11:08:00', 13126, 0, 30, 0, NULL, 'Quinta Normal', 50, 'Hombre', NULL, 'Quinta Normal', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(326, '2022-01-20 12:24:00', 13119, 0, 24, 1, 1, 'Maipu', 21, 'Hombre', 'Mujer', 'Maipu', 'Destruccion de objetos personales o simbolicos'),
(327, '2022-01-20 12:50:00', 13119, 1, 22, 1, 0, 'Maipu', 23, 'Mujer', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(328, '2022-01-20 12:57:00', 13124, 1, 38, 1, 0, 'Pudahuel', 4, 'Mujer', 'Hombre', 'Pudahuel', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(329, '2022-01-20 13:30:00', 13105, 0, 24, 1, 0, 'El Bosque', 33, 'Hombre', 'Hombre', 'El Bosque', 'Empujones o sacudidas leves'),
(330, '2022-01-20 13:34:00', 13501, 0, 29, 0, NULL, 'Melipilla', 50, 'Hombre', NULL, 'Melipilla', 'Falta de politicas o proteccion efectiva frente a la violencia');
INSERT INTO `wp_db_upload` (`ID`, `Fecha`, `Comuna`, `Genero_Victima`, `Edad`, `si_no`, `Genero_Agresor`, `Comuna_1`, `Tipo`, `Nombre_Genero_Victima_Texto`, `Nombre_Genero_Agresor_Texto`, `Nombre_Comuna`, `Nombre_Violencia`) VALUES
(331, '2022-01-20 14:03:00', 13119, 1, 33, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(332, '2022-01-20 14:54:00', 13115, 1, 25, 1, 0, 'Lo Barnechea', 23, 'Mujer', 'Hombre', 'Lo Barnechea', 'Comentarios sexuales no deseados'),
(333, '2022-01-20 15:19:00', 13117, 0, 36, 0, NULL, 'Lo Prado', 50, 'Hombre', NULL, 'Lo Prado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(334, '2022-01-20 15:22:00', 13120, 1, 29, 1, 0, 'Nunoa', 9, 'Mujer', 'Hombre', 'Nunoa', 'Descalificacion constante o humillacion verbal'),
(335, '2022-01-20 15:38:00', 13104, 1, 28, 0, NULL, 'Conchali', 50, 'Mujer', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(336, '2022-01-20 15:43:00', 13201, 0, 29, 1, 0, 'Puente Alto', 9, 'Hombre', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(337, '2022-01-21 11:43:00', 13201, 0, 19, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(338, '2022-01-21 12:31:00', 13130, 1, 22, 1, 0, 'San Miguel', 23, 'Mujer', 'Hombre', 'San Miguel', 'Comentarios sexuales no deseados'),
(339, '2022-01-21 13:38:00', 13118, 0, 21, 1, 1, 'Macul', 34, 'Hombre', 'Mujer', 'Macul', 'Bofetadas, tirones de cabello o rasgunos'),
(340, '2022-01-21 13:54:00', 13201, 1, 20, 1, 1, 'Puente Alto', 36, 'Mujer', 'Mujer', 'Puente Alto', 'Lesiones fisicas moderadas o graves'),
(341, '2022-01-21 14:00:00', 13123, 1, 29, 1, 0, 'Providencia', 9, 'Mujer', 'Hombre', 'Providencia', 'Descalificacion constante o humillacion verbal'),
(342, '2022-01-21 14:05:00', 13102, 1, 35, 1, 0, 'Cerrillos', 42, 'Mujer', 'Hombre', 'Cerrillos', 'Persecucion o acoso persistente (stalking)'),
(343, '2022-01-21 15:02:00', 13103, 1, 24, 1, 0, 'Cerro Navia', 23, 'Mujer', 'Hombre', 'Cerro Navia', 'Comentarios sexuales no deseados'),
(344, '2022-01-21 15:40:00', 13122, 0, 21, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(345, '2022-01-22 16:45:00', 13127, 1, 26, 1, 0, 'Recoleta', 27, 'Mujer', 'Hombre', 'Recoleta', 'Relaciones sexuales sin consentimiento pleno'),
(346, '2022-01-24 15:09:00', 13605, 1, 28, 0, NULL, 'Penaflor', 50, 'Mujer', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(347, '2022-01-24 15:52:00', 13127, 1, 27, 1, 0, 'Recoleta', 9, 'Mujer', 'Hombre', 'Recoleta', 'Descalificacion constante o humillacion verbal'),
(348, '2022-01-25 11:19:00', 13109, 0, 27, 0, NULL, 'La Cisterna', 50, 'Hombre', NULL, 'La Cisterna', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(349, '2022-01-25 12:05:00', 13201, 0, 20, 1, 0, 'Puente Alto', 9, 'Hombre', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(350, '2022-01-25 12:49:00', 13110, 0, 20, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(351, '2022-01-25 13:38:00', 13103, 1, 41, 1, 0, 'Cerro Navia', 12, 'Mujer', 'Hombre', 'Cerro Navia', 'Amenazas verbales (directas o indirectas)'),
(352, '2022-01-25 15:25:00', 13112, 1, 30, 1, 0, 'La Pintana', 33, 'Mujer', 'Hombre', 'La Pintana', 'Empujones o sacudidas leves'),
(353, '2022-01-25 15:48:00', 13201, 1, 24, 1, 0, 'Puente Alto', 23, 'Mujer', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(354, '2022-01-25 15:50:00', 13116, 1, 35, 1, 0, 'Lo Espejo', 42, 'Mujer', 'Hombre', 'Lo Espejo', 'Persecucion o acoso persistente (stalking)'),
(355, '2022-01-26 12:13:00', 13110, 1, 28, 1, 0, 'La Florida', 23, 'Mujer', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(356, '2022-01-26 12:51:00', 13122, 0, 26, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(357, '2022-01-26 12:52:00', 13111, 0, 19, 0, NULL, 'La Granja', 50, 'Hombre', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(358, '2022-01-26 13:27:00', 13117, 1, 24, 1, 0, 'Lo Prado', 23, 'Mujer', 'Hombre', 'Lo Prado', 'Comentarios sexuales no deseados'),
(359, '2022-01-26 13:30:00', 13120, 1, 20, 0, NULL, 'Nunoa', 50, 'Mujer', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(360, '2022-01-26 13:38:00', 13119, 1, 27, 1, 0, 'Maipu', 1, 'Mujer', 'Hombre', 'Maipu', 'Lenguaje discriminatorio (sexista, racista, homofobico, etc.)'),
(361, '2022-01-26 13:41:00', 13201, 1, 25, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(362, '2022-01-26 14:10:00', 13119, 0, 26, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(363, '2022-01-26 14:23:00', 13113, 1, 26, 1, 0, 'La Reina', 9, 'Mujer', 'Hombre', 'La Reina', 'Descalificacion constante o humillacion verbal'),
(364, '2022-01-26 17:07:00', 13101, 0, 21, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(365, '2022-01-27 12:17:00', 13104, 0, 25, 1, 0, 'Conchali', 33, 'Hombre', 'Hombre', 'Conchali', 'Empujones o sacudidas leves'),
(366, '2022-01-27 13:18:00', 13301, 1, 21, 1, 1, 'Colina', 36, 'Mujer', 'Mujer', 'Colina', 'Lesiones fisicas moderadas o graves'),
(367, '2022-01-27 13:28:00', 13120, 0, 26, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(368, '2022-01-27 14:12:00', 13119, 0, 36, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(369, '2022-01-27 15:20:00', 13301, 0, 22, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(370, '2022-01-27 15:24:00', 13125, 1, 21, 1, 0, 'Quilicura', 25, 'Mujer', 'Hombre', 'Quilicura', 'Tocamientos sin consentimiento'),
(371, '2022-01-27 15:29:00', 13105, 0, 30, 0, NULL, 'El Bosque', 50, 'Hombre', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(372, '2022-01-28 12:33:00', 13101, 2, 25, 1, 0, 'Santiago', 2, 'Otro', 'Hombre', 'Santiago', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(373, '2022-01-28 14:10:00', 13118, 0, 19, 0, NULL, 'Macul', 50, 'Hombre', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(374, '2022-01-28 15:41:00', 13605, 0, 34, 0, NULL, 'Penaflor', 50, 'Hombre', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(375, '2022-01-31 13:31:00', 13105, 1, 23, 1, 0, 'El Bosque', 23, 'Mujer', 'Hombre', 'El Bosque', 'Comentarios sexuales no deseados'),
(376, '2022-01-31 14:32:00', 13132, 0, 29, 0, NULL, 'Vitacura', 50, 'Hombre', NULL, 'Vitacura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(377, '2022-01-31 17:52:00', 13104, 0, 23, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(378, '2022-02-01 12:51:00', 13113, 1, 21, 0, NULL, 'La Reina', 50, 'Mujer', NULL, 'La Reina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(379, '2022-02-01 13:08:00', 13132, 0, 31, 1, 0, 'Vitacura', 35, 'Hombre', 'Hombre', 'Vitacura', 'Golpes con objetos, punetazos, patadas'),
(380, '2022-02-01 13:25:00', 13125, 1, 30, 1, 0, 'Quilicura', 19, 'Mujer', 'Hombre', 'Quilicura', 'Retencion o robo de bienes personales o dinero'),
(381, '2022-02-01 14:49:00', 13114, 1, 32, 1, 0, 'Las Condes', 9, 'Mujer', 'Hombre', 'Las Condes', 'Descalificacion constante o humillacion verbal'),
(382, '2022-02-01 14:50:00', 13120, 0, 37, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(383, '2022-02-01 15:17:00', 13126, 1, 21, 1, 0, 'Quinta Normal', 25, 'Mujer', 'Hombre', 'Quinta Normal', 'Tocamientos sin consentimiento'),
(384, '2022-02-02 11:49:00', 13119, 0, 24, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(385, '2022-02-02 12:01:00', 13119, 1, 24, 0, NULL, 'Maipu', 50, 'Mujer', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(386, '2022-02-02 12:09:00', 13127, 0, 25, 0, NULL, 'Recoleta', 50, 'Hombre', NULL, 'Recoleta', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(387, '2022-02-02 12:49:00', 13111, 1, 23, 0, NULL, 'La Granja', 50, 'Mujer', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(388, '2022-02-02 12:56:00', 13101, 1, 24, 1, 0, 'Santiago', 23, 'Mujer', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(389, '2022-02-02 13:01:00', 13604, 1, 30, 0, NULL, 'Padre Hurtado', 50, 'Mujer', NULL, 'Padre Hurtado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(390, '2022-02-02 13:01:00', 13120, 1, 29, 0, NULL, 'Nunoa', 50, 'Mujer', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(391, '2022-02-02 13:20:00', 13105, 1, 30, 1, 0, 'El Bosque', 20, 'Mujer', 'Hombre', 'El Bosque', 'Endeudamiento forzoso a nombre de la victima'),
(392, '2022-02-02 13:29:00', 13119, 0, 30, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(393, '2022-02-02 14:08:00', 13126, 1, 28, 1, 0, 'Quinta Normal', 9, 'Mujer', 'Hombre', 'Quinta Normal', 'Descalificacion constante o humillacion verbal'),
(394, '2022-02-02 14:10:00', 13301, 0, 36, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(395, '2022-02-02 14:20:00', 13302, 0, 24, 0, NULL, 'Lampa', 50, 'Hombre', NULL, 'Lampa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(396, '2022-02-02 14:33:00', 13401, 1, 35, 0, NULL, 'San Bernardo', 50, 'Mujer', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(397, '2022-02-02 14:33:00', 13201, 0, 22, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(398, '2022-02-02 14:40:00', 13119, 0, 31, 1, 0, 'Maipu', 33, 'Hombre', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(399, '2022-02-02 15:10:00', 13101, 1, 26, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(400, '2022-02-02 15:41:00', 13301, 0, 28, 1, 0, 'Colina', 9, 'Hombre', 'Hombre', 'Colina', 'Descalificacion constante o humillacion verbal'),
(401, '2022-02-03 11:54:00', 13103, 1, 31, 1, 0, 'Cerro Navia', 9, 'Mujer', 'Hombre', 'Cerro Navia', 'Descalificacion constante o humillacion verbal'),
(402, '2022-02-03 12:03:00', 13112, 0, 33, 1, 0, 'La Pintana', 33, 'Hombre', 'Hombre', 'La Pintana', 'Empujones o sacudidas leves'),
(403, '2022-02-03 13:10:00', 13117, 0, 22, 1, 0, 'Lo Prado', 23, 'Hombre', 'Hombre', 'Lo Prado', 'Comentarios sexuales no deseados'),
(404, '2022-02-03 13:23:00', 13201, 0, 30, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(405, '2022-02-03 13:56:00', 13201, 0, 21, 1, 0, 'Puente Alto', 33, 'Hombre', 'Hombre', 'Puente Alto', 'Empujones o sacudidas leves'),
(406, '2022-02-03 14:26:00', 13119, 1, 32, 0, NULL, 'Maipu', 50, 'Mujer', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(407, '2022-02-03 14:40:00', 13201, 1, 29, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(408, '2022-02-03 14:45:00', 13124, 0, 28, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(409, '2022-02-03 15:02:00', 13201, 1, 33, 1, 1, 'Puente Alto', 36, 'Mujer', 'Mujer', 'Puente Alto', 'Lesiones fisicas moderadas o graves'),
(410, '2022-02-03 17:17:00', 13110, 0, 33, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(411, '2022-02-04 12:20:00', 13121, 1, 25, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Mujer', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(412, '2022-02-04 13:53:00', 13126, 1, 29, 1, 1, 'Quinta Normal', 4, 'Mujer', 'Mujer', 'Quinta Normal', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(413, '2022-02-04 15:43:00', 13101, 0, 27, 1, 0, 'Santiago', 35, 'Hombre', 'Hombre', 'Santiago', 'Golpes con objetos, punetazos, patadas'),
(414, '2022-02-05 15:00:00', 13301, 0, 20, 1, 1, 'Colina', 21, 'Hombre', 'Mujer', 'Colina', 'Destruccion de objetos personales o simbolicos'),
(415, '2022-02-07 12:30:00', 13201, 0, 30, 1, 0, 'Puente Alto', 9, 'Hombre', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(416, '2022-02-08 11:11:00', 13114, 0, 27, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(417, '2022-02-08 12:56:00', 13110, 0, 26, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(418, '2022-02-08 13:19:00', 13605, 0, 27, 1, 0, 'Penaflor', 9, 'Hombre', 'Hombre', 'Penaflor', 'Descalificacion constante o humillacion verbal'),
(419, '2022-02-08 13:37:00', 13113, 2, 24, 0, 0, 'La Reina', 25, 'Otro', 'Hombre', 'La Reina', 'Tocamientos sin consentimiento'),
(420, '2022-02-08 14:34:00', 13109, 0, 22, 0, NULL, 'La Cisterna', 50, 'Hombre', NULL, 'La Cisterna', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(421, '2022-02-08 14:53:00', 13114, 1, 30, 0, NULL, 'Las Condes', 50, 'Mujer', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(422, '2022-02-08 15:15:00', 13128, 0, 28, 0, NULL, 'Renca', 50, 'Hombre', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(423, '2022-02-08 17:18:00', 13301, 0, 24, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(424, '2022-02-09 11:13:00', 13107, 1, 24, 1, 0, 'Huechuraba', 23, 'Mujer', 'Hombre', 'Huechuraba', 'Comentarios sexuales no deseados'),
(425, '2022-02-09 12:23:00', 13120, 1, 24, 1, 0, 'Nunoa', 23, 'Mujer', 'Hombre', 'Nunoa', 'Comentarios sexuales no deseados'),
(426, '2022-02-09 12:31:00', 13201, 1, 23, 1, 0, 'Puente Alto', 23, 'Mujer', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(427, '2022-02-09 12:53:00', 13201, 1, 27, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(428, '2022-02-09 13:14:00', 13130, 1, 30, 0, NULL, 'San Miguel', 50, 'Mujer', NULL, 'San Miguel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(429, '2022-02-09 13:14:00', 13114, 1, 25, 1, 1, 'Las Condes', 26, 'Mujer', 'Mujer', 'Las Condes', 'Presion o chantaje para relaciones sexuales'),
(430, '2022-02-09 13:32:00', 13119, 0, 24, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(431, '2022-02-09 13:49:00', 13112, 1, 27, 1, 0, 'La Pintana', 9, 'Mujer', 'Hombre', 'La Pintana', 'Descalificacion constante o humillacion verbal'),
(432, '2022-02-09 13:52:00', 13605, 1, 34, 1, 0, 'Penaflor', 9, 'Mujer', 'Hombre', 'Penaflor', 'Descalificacion constante o humillacion verbal'),
(433, '2022-02-09 14:00:00', 13301, 0, 30, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(434, '2022-02-09 14:44:00', 13104, 1, 30, 1, 0, 'Conchali', 9, 'Mujer', 'Hombre', 'Conchali', 'Descalificacion constante o humillacion verbal'),
(435, '2022-02-09 14:49:00', 13120, 1, 24, 1, 0, 'Nunoa', 23, 'Mujer', 'Hombre', 'Nunoa', 'Comentarios sexuales no deseados'),
(436, '2022-02-09 15:00:00', 13111, 1, 30, 1, 0, 'La Granja', 9, 'Mujer', 'Hombre', 'La Granja', 'Descalificacion constante o humillacion verbal'),
(437, '2022-02-09 15:08:00', 13117, 0, 22, 1, 1, 'Lo Prado', 21, 'Hombre', 'Mujer', 'Lo Prado', 'Destruccion de objetos personales o simbolicos'),
(438, '2022-02-09 15:12:00', 13201, 0, 20, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(439, '2022-02-09 16:44:00', 13123, 1, 25, 1, 0, 'Providencia', 23, 'Mujer', 'Hombre', 'Providencia', 'Comentarios sexuales no deseados'),
(440, '2022-02-10 12:25:00', 13401, 1, 34, 1, 1, 'San Bernardo', 4, 'Mujer', 'Mujer', 'San Bernardo', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(441, '2022-02-10 12:52:00', 13124, 0, 34, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(442, '2022-02-10 13:13:00', 13122, 0, 34, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(443, '2022-02-10 13:40:00', 13132, 0, 18, 0, NULL, 'Vitacura', 50, 'Hombre', NULL, 'Vitacura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(444, '2022-02-10 13:51:00', 13127, 0, 31, 1, 0, 'Recoleta', 35, 'Hombre', 'Hombre', 'Recoleta', 'Golpes con objetos, punetazos, patadas'),
(445, '2022-02-10 14:04:00', 13124, 1, 19, 1, 1, 'Pudahuel', 28, 'Mujer', 'Mujer', 'Pudahuel', 'Envio o difusion de imágenes sexuales sin consentimiento'),
(446, '2022-02-10 14:35:00', 13110, 1, 29, 1, 0, 'La Florida', 33, 'Mujer', 'Hombre', 'La Florida', 'Empujones o sacudidas leves'),
(447, '2022-02-11 10:51:00', 13117, 1, 30, 1, 1, 'Lo Prado', 30, 'Mujer', 'Mujer', 'Lo Prado', 'Acoso sexual en el trabajo o espacios educativos'),
(448, '2022-02-11 13:02:00', 13102, 1, 29, 1, 0, 'Cerrillos', 9, 'Mujer', 'Hombre', 'Cerrillos', 'Descalificacion constante o humillacion verbal'),
(449, '2022-02-11 13:27:00', 13504, 1, 23, 0, NULL, 'Maria Pinto', 50, 'Mujer', NULL, 'Maria Pinto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(450, '2022-02-11 13:44:00', 13105, 0, 23, 0, NULL, 'El Bosque', 50, 'Hombre', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(451, '2022-02-11 15:34:00', 13122, 1, 22, 1, 0, 'Penalolen', 23, 'Mujer', 'Hombre', 'Penalolen', 'Comentarios sexuales no deseados'),
(452, '2022-02-11 16:03:00', 13113, 1, 28, 1, 0, 'La Reina', 9, 'Mujer', 'Hombre', 'La Reina', 'Descalificacion constante o humillacion verbal'),
(453, '2022-02-14 14:15:00', 13117, 1, 35, 1, 0, 'Lo Prado', 9, 'Mujer', 'Hombre', 'Lo Prado', 'Descalificacion constante o humillacion verbal'),
(454, '2022-02-14 14:19:00', 13201, 1, 34, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(455, '2022-02-14 16:28:00', 13501, 1, 33, 1, 0, 'Melipilla', 9, 'Mujer', 'Hombre', 'Melipilla', 'Descalificacion constante o humillacion verbal'),
(456, '2022-02-14 16:30:00', 13201, 0, 19, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(457, '2022-02-15 12:28:00', 13106, 1, 32, 1, 0, 'Estacion Central', 9, 'Mujer', 'Hombre', 'Estacion Central', 'Descalificacion constante o humillacion verbal'),
(458, '2022-02-15 12:32:00', 13124, 1, 26, 1, 1, 'Pudahuel', 35, 'Mujer', 'Mujer', 'Pudahuel', 'Golpes con objetos, punetazos, patadas'),
(459, '2022-02-15 12:32:00', 13114, 1, 24, 1, 0, 'Las Condes', 23, 'Mujer', 'Hombre', 'Las Condes', 'Comentarios sexuales no deseados'),
(460, '2022-02-15 13:40:00', 13202, 0, 26, 1, 0, 'Pirque', 9, 'Hombre', 'Hombre', 'Pirque', 'Descalificacion constante o humillacion verbal'),
(461, '2022-02-15 13:52:00', 13122, 0, 36, 1, 0, 'Penalolen', 33, 'Hombre', 'Hombre', 'Penalolen', 'Empujones o sacudidas leves'),
(462, '2022-02-15 14:21:00', 13404, 0, 19, 1, 0, 'Paine', 33, 'Hombre', 'Hombre', 'Paine', 'Empujones o sacudidas leves'),
(463, '2022-02-15 14:22:00', 13101, 1, 28, 0, NULL, 'Santiago', 50, 'Mujer', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(464, '2022-02-15 14:47:00', 13102, 1, 18, 1, 0, 'Cerrillos', 23, 'Mujer', 'Hombre', 'Cerrillos', 'Comentarios sexuales no deseados'),
(465, '2022-02-15 15:25:00', 13119, 1, 20, 1, 0, 'Maipu', 9, 'Mujer', 'Hombre', 'Maipu', 'Descalificacion constante o humillacion verbal'),
(466, '2022-02-15 15:59:00', 13106, 0, 29, 0, NULL, 'Estacion Central', 50, 'Hombre', NULL, 'Estacion Central', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(467, '2022-02-15 18:29:00', 13119, 1, 28, 1, 1, 'Maipu', 35, 'Mujer', 'Mujer', 'Maipu', 'Golpes con objetos, punetazos, patadas'),
(468, '2022-02-16 11:17:00', 13201, 0, 19, 1, 0, 'Puente Alto', 23, 'Hombre', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(469, '2022-02-16 11:44:00', 13120, 2, 30, 1, 1, 'Nunoa', 2, 'Otro', 'Mujer', 'Nunoa', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(470, '2022-02-16 11:45:00', 13401, 0, 32, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(471, '2022-02-16 12:07:00', 13605, 0, 28, 0, NULL, 'Penaflor', 50, 'Hombre', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(472, '2022-02-16 12:30:00', 13105, 1, 28, 1, 0, 'El Bosque', 9, 'Mujer', 'Hombre', 'El Bosque', 'Descalificacion constante o humillacion verbal'),
(473, '2022-02-16 12:57:00', 13201, 1, 31, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(474, '2022-02-16 13:06:00', 13201, 1, 25, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(475, '2022-02-16 13:17:00', 13401, 0, 21, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(476, '2022-02-16 13:29:00', 13402, 0, 24, 0, NULL, 'Buin', 50, 'Hombre', NULL, 'Buin', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(477, '2022-02-16 13:33:00', 13124, 0, 26, 1, 0, 'Pudahuel', 35, 'Hombre', 'Hombre', 'Pudahuel', 'Golpes con objetos, punetazos, patadas'),
(478, '2022-02-16 13:33:00', 13111, 1, 19, 1, 0, 'La Granja', 23, 'Mujer', 'Hombre', 'La Granja', 'Comentarios sexuales no deseados'),
(479, '2022-02-16 13:41:00', 13127, 1, 22, 1, 0, 'Recoleta', 23, 'Mujer', 'Hombre', 'Recoleta', 'Comentarios sexuales no deseados'),
(480, '2022-02-16 13:46:00', 13127, 0, 24, 1, 0, 'Recoleta', 23, 'Hombre', 'Hombre', 'Recoleta', 'Comentarios sexuales no deseados'),
(481, '2022-02-16 13:47:00', 13124, 1, 26, 1, 0, 'Pudahuel', 9, 'Mujer', 'Hombre', 'Pudahuel', 'Descalificacion constante o humillacion verbal'),
(482, '2022-02-16 13:55:00', 13401, 1, 27, 1, 1, 'San Bernardo', 4, 'Mujer', 'Mujer', 'San Bernardo', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(483, '2022-02-16 14:15:00', 13301, 1, 30, 1, 0, 'Colina', 9, 'Mujer', 'Hombre', 'Colina', 'Descalificacion constante o humillacion verbal'),
(484, '2022-02-16 14:18:00', 13110, 0, 29, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(485, '2022-02-16 14:54:00', 13401, 0, 28, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(486, '2022-02-16 15:28:00', 13401, 1, 25, 0, NULL, 'San Bernardo', 50, 'Mujer', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(487, '2022-02-16 15:56:00', 13119, 1, 31, 0, NULL, 'Maipu', 50, 'Mujer', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(488, '2022-02-16 16:25:00', 13101, 0, 22, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(489, '2022-02-17 12:14:00', 13131, 1, 23, 1, 0, 'San Ramon', 23, 'Mujer', 'Hombre', 'San Ramon', 'Comentarios sexuales no deseados'),
(490, '2022-02-17 12:32:00', 13130, 0, 24, 0, NULL, 'San Miguel', 50, 'Hombre', NULL, 'San Miguel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(491, '2022-02-17 12:58:00', 13104, 1, 34, 1, 1, 'Conchali', 36, 'Mujer', 'Mujer', 'Conchali', 'Lesiones fisicas moderadas o graves'),
(492, '2022-02-17 13:33:00', 13105, 1, 21, 1, 0, 'El Bosque', 9, 'Mujer', 'Hombre', 'El Bosque', 'Descalificacion constante o humillacion verbal'),
(493, '2022-02-17 14:24:00', 13119, 0, 28, 1, 1, 'Maipu', 16, 'Hombre', 'Mujer', 'Maipu', 'Uso de hijos/as u otras personas como chantaje emocional'),
(494, '2022-02-17 15:10:00', 13201, 1, 24, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(495, '2022-02-17 15:16:00', 13127, 1, 24, 1, 1, 'Recoleta', 35, 'Mujer', 'Mujer', 'Recoleta', 'Golpes con objetos, punetazos, patadas'),
(496, '2022-02-17 15:18:00', 13117, 1, 25, 1, 0, 'Lo Prado', 23, 'Mujer', 'Hombre', 'Lo Prado', 'Comentarios sexuales no deseados'),
(497, '2022-02-17 15:49:00', 13119, 0, 25, 1, 0, 'Maipu', 23, 'Hombre', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(498, '2022-02-17 17:27:00', 13112, 0, 27, 1, 0, 'La Pintana', 36, 'Hombre', 'Hombre', 'La Pintana', 'Lesiones fisicas moderadas o graves'),
(499, '2022-02-18 11:28:00', 13201, 1, 36, 1, 0, 'Puente Alto', 42, 'Mujer', 'Hombre', 'Puente Alto', 'Persecucion o acoso persistente (stalking)'),
(500, '2022-02-18 13:35:00', 13605, 1, 24, 1, 0, 'Penaflor', 23, 'Mujer', 'Hombre', 'Penaflor', 'Comentarios sexuales no deseados'),
(501, '2022-02-18 13:43:00', 13104, 0, 28, 1, 0, 'Conchali', 35, 'Hombre', 'Hombre', 'Conchali', 'Golpes con objetos, punetazos, patadas'),
(502, '2022-02-18 13:58:00', 13121, 1, 31, 1, 1, 'Pedro Aguirre Cerda', 4, 'Mujer', 'Mujer', 'Pedro Aguirre Cerda', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(503, '2022-02-18 14:35:00', 13122, 1, 26, 1, 0, 'Penalolen', 28, 'Mujer', 'Hombre', 'Penalolen', 'Envio o difusion de imágenes sexuales sin consentimiento'),
(504, '2022-02-18 14:57:00', 13403, 1, 32, 0, NULL, 'Calera de Tango', 50, 'Mujer', NULL, 'Calera de Tango', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(505, '2022-02-21 11:06:00', 13116, 1, 22, 1, 0, 'Lo Espejo', 23, 'Mujer', 'Hombre', 'Lo Espejo', 'Comentarios sexuales no deseados'),
(506, '2022-02-21 12:22:00', 13116, 1, 28, 1, 0, 'Lo Espejo', 3, 'Mujer', 'Hombre', 'Lo Espejo', 'Estereotipos de genero o roles impuestos'),
(507, '2022-02-21 12:35:00', 13109, 0, 20, 0, NULL, 'La Cisterna', 50, 'Hombre', NULL, 'La Cisterna', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(508, '2022-02-21 13:35:00', 13117, 0, 41, 1, 0, 'Lo Prado', 12, 'Hombre', 'Hombre', 'Lo Prado', 'Amenazas verbales (directas o indirectas)'),
(509, '2022-02-21 14:34:00', 13401, 0, 28, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(510, '2022-02-21 16:16:00', 13601, 1, 27, 1, 0, 'Talagante', 19, 'Mujer', 'Hombre', 'Talagante', 'Retencion o robo de bienes personales o dinero'),
(511, '2022-02-22 13:06:00', 13120, 0, 35, 1, 0, 'Nunoa', 35, 'Hombre', 'Hombre', 'Nunoa', 'Golpes con objetos, punetazos, patadas'),
(512, '2022-02-22 13:24:00', 13106, 1, 25, 1, 0, 'Estacion Central', 23, 'Mujer', 'Hombre', 'Estacion Central', 'Comentarios sexuales no deseados'),
(513, '2022-02-22 13:54:00', 13107, 0, 23, 0, NULL, 'Huechuraba', 50, 'Hombre', NULL, 'Huechuraba', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(514, '2022-02-22 14:52:00', 13116, 1, 20, 1, 0, 'Lo Espejo', 10, 'Mujer', 'Hombre', 'Lo Espejo', 'Manipulacion emocional o gaslighting'),
(515, '2022-02-22 15:18:00', 13122, 1, 35, 1, 1, 'Penalolen', 36, 'Mujer', 'Mujer', 'Penalolen', 'Lesiones fisicas moderadas o graves'),
(516, '2022-02-22 15:21:00', 13110, 0, 25, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(517, '2022-02-22 16:03:00', 13402, 1, 31, 1, 0, 'Buin', 19, 'Mujer', 'Hombre', 'Buin', 'Retencion o robo de bienes personales o dinero'),
(518, '2022-02-23 10:58:00', 13113, 0, 22, 1, 0, 'La Reina', 23, 'Hombre', 'Hombre', 'La Reina', 'Comentarios sexuales no deseados'),
(519, '2022-02-23 12:24:00', 13101, 1, 42, 1, 0, 'Santiago', 12, 'Mujer', 'Hombre', 'Santiago', 'Amenazas verbales (directas o indirectas)'),
(520, '2022-02-23 12:25:00', 13301, 1, 23, 1, 0, 'Colina', 23, 'Mujer', 'Hombre', 'Colina', 'Comentarios sexuales no deseados'),
(521, '2022-02-23 12:29:00', 13114, 1, 24, 1, 0, 'Las Condes', 23, 'Mujer', 'Hombre', 'Las Condes', 'Comentarios sexuales no deseados'),
(522, '2022-02-23 12:50:00', 13107, 0, 30, 1, 0, 'Huechuraba', 9, 'Hombre', 'Hombre', 'Huechuraba', 'Descalificacion constante o humillacion verbal'),
(523, '2022-02-23 13:10:00', 13118, 0, 21, 1, 0, 'Macul', 9, 'Hombre', 'Hombre', 'Macul', 'Descalificacion constante o humillacion verbal'),
(524, '2022-02-23 13:26:00', 13121, 0, 24, 1, 0, 'Pedro Aguirre Cerda', 23, 'Hombre', 'Hombre', 'Pedro Aguirre Cerda', 'Comentarios sexuales no deseados'),
(525, '2022-02-23 13:27:00', 13201, 1, 20, 1, 0, 'Puente Alto', 10, 'Mujer', 'Hombre', 'Puente Alto', 'Manipulacion emocional o gaslighting'),
(526, '2022-02-23 14:19:00', 13103, 1, 26, 1, 0, 'Cerro Navia', 19, 'Mujer', 'Hombre', 'Cerro Navia', 'Retencion o robo de bienes personales o dinero'),
(527, '2022-02-23 14:56:00', 13101, 0, 30, 1, 0, 'Santiago', 35, 'Hombre', 'Hombre', 'Santiago', 'Golpes con objetos, punetazos, patadas'),
(528, '2022-02-23 15:19:00', 13107, 1, 27, 1, 1, 'Huechuraba', 30, 'Mujer', 'Mujer', 'Huechuraba', 'Acoso sexual en el trabajo o espacios educativos'),
(529, '2022-02-23 17:06:00', 13302, 0, 20, 0, NULL, 'Lampa', 50, 'Hombre', NULL, 'Lampa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(530, '2022-02-24 13:07:00', 13114, 0, 20, 1, 1, 'Las Condes', 21, 'Hombre', 'Mujer', 'Las Condes', 'Destruccion de objetos personales o simbolicos'),
(531, '2022-02-24 13:50:00', 13401, 1, 40, 0, NULL, 'San Bernardo', 50, 'Mujer', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(532, '2022-02-24 14:07:00', 13121, 0, 18, 1, 1, 'Pedro Aguirre Cerda', 35, 'Hombre', 'Mujer', 'Pedro Aguirre Cerda', 'Golpes con objetos, punetazos, patadas'),
(533, '2022-02-24 14:10:00', 13101, 1, 26, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(534, '2022-02-24 14:16:00', 13501, 1, 31, 1, 0, 'Melipilla', 5, 'Mujer', 'Hombre', 'Melipilla', 'Expectativas sociales rigidas sobre como debe ser un hombre/mujer/persona'),
(535, '2022-02-24 15:21:00', 13110, 0, 31, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(536, '2022-02-24 15:30:00', 13114, 1, 34, 0, NULL, 'Las Condes', 50, 'Mujer', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(537, '2022-02-24 15:50:00', 13604, 0, 28, 1, 0, 'Padre Hurtado', 9, 'Hombre', 'Hombre', 'Padre Hurtado', 'Descalificacion constante o humillacion verbal'),
(538, '2022-02-25 12:32:00', 13201, 1, 26, 1, 0, 'Puente Alto', 15, 'Mujer', 'Hombre', 'Puente Alto', 'Fomento de inseguridades o dependencia emocional'),
(539, '2022-02-26 13:47:00', 13104, 1, 29, 1, 1, 'Conchali', 35, 'Mujer', 'Mujer', 'Conchali', 'Golpes con objetos, punetazos, patadas'),
(540, '2022-02-28 13:40:00', 13122, 1, 30, 1, 0, 'Penalolen', 15, 'Mujer', 'Hombre', 'Penalolen', 'Fomento de inseguridades o dependencia emocional'),
(541, '2022-02-28 13:43:00', 13119, 1, 26, 1, 1, 'Maipu', 35, 'Mujer', 'Mujer', 'Maipu', 'Golpes con objetos, punetazos, patadas'),
(542, '2022-02-28 15:07:00', 13130, 0, 31, 1, 1, 'San Miguel', 16, 'Hombre', 'Mujer', 'San Miguel', 'Uso de hijos/as u otras personas como chantaje emocional'),
(543, '2022-02-28 15:53:00', 13201, 1, 31, 1, 0, 'Puente Alto', 15, 'Mujer', 'Hombre', 'Puente Alto', 'Fomento de inseguridades o dependencia emocional'),
(544, '2022-02-28 16:14:00', 13124, 1, 21, 1, 0, 'Pudahuel', 10, 'Mujer', 'Hombre', 'Pudahuel', 'Manipulacion emocional o gaslighting'),
(545, '2022-03-01 12:57:00', 13124, 0, 30, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(546, '2022-03-01 13:11:00', 13120, 1, 31, 1, 0, 'Nunoa', 14, 'Mujer', 'Hombre', 'Nunoa', 'Desvalorizacion de logros o capacidades personales'),
(547, '2022-03-01 13:18:00', 13401, 0, 23, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(548, '2022-03-01 15:22:00', 13119, 1, 26, 1, 1, 'Maipu', 35, 'Mujer', 'Mujer', 'Maipu', 'Golpes con objetos, punetazos, patadas'),
(549, '2022-03-01 15:38:00', 13110, 0, 19, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(550, '2022-03-02 12:18:00', 13103, 0, 35, 1, 1, 'Cerro Navia', 16, 'Hombre', 'Mujer', 'Cerro Navia', 'Uso de hijos/as u otras personas como chantaje emocional'),
(551, '2022-03-02 12:39:00', 13119, 0, 31, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(552, '2022-03-02 12:41:00', 13125, 1, 23, 1, 0, 'Quilicura', 25, 'Mujer', 'Hombre', 'Quilicura', 'Tocamientos sin consentimiento'),
(553, '2022-03-02 13:02:00', 13103, 1, 37, 1, 0, 'Cerro Navia', 9, 'Mujer', 'Hombre', 'Cerro Navia', 'Descalificacion constante o humillacion verbal'),
(554, '2022-03-02 13:32:00', 13132, 1, 24, 1, 0, 'Vitacura', 23, 'Mujer', 'Hombre', 'Vitacura', 'Comentarios sexuales no deseados'),
(555, '2022-03-02 13:38:00', 13105, 1, 20, 1, 0, 'El Bosque', 9, 'Mujer', 'Hombre', 'El Bosque', 'Descalificacion constante o humillacion verbal'),
(556, '2022-03-02 13:59:00', 13101, 1, 24, 1, 0, 'Santiago', 23, 'Mujer', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(557, '2022-03-02 14:21:00', 13125, 0, 28, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(558, '2022-03-02 14:33:00', 13121, 0, 38, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Hombre', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(559, '2022-03-02 15:30:00', 13116, 0, 23, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(560, '2022-03-02 15:32:00', 13123, 1, 19, 1, 0, 'Providencia', 23, 'Mujer', 'Hombre', 'Providencia', 'Comentarios sexuales no deseados'),
(561, '2022-03-02 15:56:00', 13110, 0, 24, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(562, '2022-03-02 16:36:00', 13110, 1, 23, 1, 0, 'La Florida', 23, 'Mujer', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(563, '2022-03-02 16:40:00', 13103, 0, 33, 0, NULL, 'Cerro Navia', 47, 'Hombre', NULL, 'Cerro Navia', 'Trato deshumanizante en servicios publicos o de salud'),
(564, '2022-03-02 18:07:00', 13110, 0, 22, 1, 1, 'La Florida', 13, 'Hombre', 'Mujer', 'La Florida', 'Culpar a la victima por el conflicto o por la violencia sufrida'),
(565, '2022-03-03 12:15:00', 13109, 0, 23, 0, NULL, 'La Cisterna', 50, 'Hombre', NULL, 'La Cisterna', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(566, '2022-03-03 12:27:00', 13127, 1, 30, 1, 1, 'Recoleta', 35, 'Mujer', 'Mujer', 'Recoleta', 'Golpes con objetos, punetazos, patadas'),
(567, '2022-03-03 12:45:00', 13108, 1, 19, 1, 0, 'Independencia', 23, 'Mujer', 'Hombre', 'Independencia', 'Comentarios sexuales no deseados'),
(568, '2022-03-03 13:11:00', 13114, 1, 27, 1, 0, 'Las Condes', 9, 'Mujer', 'Hombre', 'Las Condes', 'Descalificacion constante o humillacion verbal'),
(569, '2022-03-03 13:41:00', 13111, 1, 28, 1, 0, 'La Granja', 9, 'Mujer', 'Hombre', 'La Granja', 'Descalificacion constante o humillacion verbal'),
(570, '2022-03-03 14:21:00', 13105, 1, 35, 1, 0, 'El Bosque', 42, 'Mujer', 'Hombre', 'El Bosque', 'Persecucion o acoso persistente (stalking)'),
(571, '2022-03-03 14:21:00', 13404, 1, 25, 1, 0, 'Paine', 23, 'Mujer', 'Hombre', 'Paine', 'Comentarios sexuales no deseados'),
(572, '2022-03-03 15:58:00', 13102, 1, 36, 1, 0, 'Cerrillos', 42, 'Mujer', 'Hombre', 'Cerrillos', 'Persecucion o acoso persistente (stalking)'),
(573, '2022-03-04 12:18:00', 13115, 0, 28, 0, NULL, 'Lo Barnechea', 50, 'Hombre', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(574, '2022-03-04 12:20:00', 13128, 1, 19, 1, 1, 'Renca', 26, 'Mujer', 'Mujer', 'Renca', 'Presion o chantaje para relaciones sexuales'),
(575, '2022-03-04 16:36:00', 13124, 1, 20, 1, 1, 'Pudahuel', 36, 'Mujer', 'Mujer', 'Pudahuel', 'Lesiones fisicas moderadas o graves'),
(576, '2022-03-07 11:52:00', 13126, 1, 27, 1, 0, 'Quinta Normal', 15, 'Mujer', 'Hombre', 'Quinta Normal', 'Fomento de inseguridades o dependencia emocional'),
(577, '2022-03-07 14:46:00', 13101, 0, 35, 1, 0, 'Santiago', 35, 'Hombre', 'Hombre', 'Santiago', 'Golpes con objetos, punetazos, patadas'),
(578, '2022-03-07 14:48:00', 13101, 0, 36, 1, 0, 'Santiago', 35, 'Hombre', 'Hombre', 'Santiago', 'Golpes con objetos, punetazos, patadas'),
(579, '2022-03-07 15:04:00', 13114, 0, 21, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(580, '2022-03-07 15:15:00', 13124, 0, 36, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(581, '2022-03-08 12:49:00', 13116, 0, 24, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(582, '2022-03-08 12:50:00', 13601, 1, 21, 0, NULL, 'Talagante', 50, 'Mujer', NULL, 'Talagante', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(583, '2022-03-08 12:53:00', 13303, 1, 26, 1, 0, 'Tiltil', 15, 'Mujer', 'Hombre', 'Tiltil', 'Fomento de inseguridades o dependencia emocional'),
(584, '2022-03-08 12:58:00', 13604, 0, 31, 1, 0, 'Padre Hurtado', 9, 'Hombre', 'Hombre', 'Padre Hurtado', 'Descalificacion constante o humillacion verbal'),
(585, '2022-03-08 13:42:00', 13301, 1, 23, 1, 1, 'Colina', 35, 'Mujer', 'Mujer', 'Colina', 'Golpes con objetos, punetazos, patadas'),
(586, '2022-03-08 13:45:00', 13128, 0, 25, 1, 0, 'Renca', 23, 'Hombre', 'Hombre', 'Renca', 'Comentarios sexuales no deseados'),
(587, '2022-03-08 14:20:00', 13101, 0, 33, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(588, '2022-03-08 14:31:00', 13401, 1, 40, 1, 0, 'San Bernardo', 4, 'Mujer', 'Hombre', 'San Bernardo', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(589, '2022-03-08 14:32:00', 13101, 2, 26, 1, 1, 'Santiago', 1, 'Otro', 'Mujer', 'Santiago', 'Lenguaje discriminatorio (sexista, racista, homofobico, etc.)'),
(590, '2022-03-08 14:35:00', 13402, 1, 31, 1, 0, 'Buin', 9, 'Mujer', 'Hombre', 'Buin', 'Descalificacion constante o humillacion verbal'),
(591, '2022-03-08 14:56:00', 13401, 1, 20, 1, 0, 'San Bernardo', 10, 'Mujer', 'Hombre', 'San Bernardo', 'Manipulacion emocional o gaslighting'),
(592, '2022-03-08 15:03:00', 13301, 1, 32, 1, 0, 'Colina', 9, 'Mujer', 'Hombre', 'Colina', 'Descalificacion constante o humillacion verbal'),
(593, '2022-03-08 15:15:00', 13113, 0, 23, 1, 0, 'La Reina', 23, 'Hombre', 'Hombre', 'La Reina', 'Comentarios sexuales no deseados'),
(594, '2022-03-08 15:20:00', 13114, 1, 19, 1, 0, 'Las Condes', 23, 'Mujer', 'Hombre', 'Las Condes', 'Comentarios sexuales no deseados'),
(595, '2022-03-08 15:39:00', 13201, 1, 27, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(596, '2022-03-08 16:20:00', 13302, 0, 29, 0, NULL, 'Lampa', 50, 'Hombre', NULL, 'Lampa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(597, '2022-03-09 10:58:00', 13201, 0, 21, 1, 0, 'Puente Alto', 9, 'Hombre', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(598, '2022-03-09 12:15:00', 13605, 1, 24, 0, NULL, 'Penaflor', 50, 'Mujer', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(599, '2022-03-09 13:17:00', 13404, 0, 19, 0, NULL, 'Paine', 50, 'Hombre', NULL, 'Paine', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(600, '2022-03-09 13:57:00', 13113, 1, 39, 1, 0, 'La Reina', 4, 'Mujer', 'Hombre', 'La Reina', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(601, '2022-03-09 14:02:00', 13118, 1, 29, 1, 0, 'Macul', 9, 'Mujer', 'Hombre', 'Macul', 'Descalificacion constante o humillacion verbal'),
(602, '2022-03-09 14:10:00', 13504, 0, 24, 0, NULL, 'Maria Pinto', 50, 'Hombre', NULL, 'Maria Pinto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(603, '2022-03-09 14:12:00', 13110, 0, 32, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(604, '2022-03-09 14:41:00', 13130, 0, 29, 0, NULL, 'San Miguel', 50, 'Hombre', NULL, 'San Miguel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(605, '2022-03-09 14:41:00', 13128, 1, 29, 0, NULL, 'Renca', 50, 'Mujer', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(606, '2022-03-09 15:04:00', 13113, 1, 23, 0, NULL, 'La Reina', 50, 'Mujer', NULL, 'La Reina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(607, '2022-03-09 15:16:00', 13121, 0, 23, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Hombre', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(608, '2022-03-09 15:38:00', 13122, 1, 20, 1, 1, 'Penalolen', 28, 'Mujer', 'Mujer', 'Penalolen', 'Envio o difusion de imágenes sexuales sin consentimiento'),
(609, '2022-03-09 16:18:00', 13302, 0, 21, 1, 0, 'Lampa', 9, 'Hombre', 'Hombre', 'Lampa', 'Descalificacion constante o humillacion verbal'),
(610, '2022-03-09 18:13:00', 13605, 0, 21, 1, 0, 'Penaflor', 9, 'Hombre', 'Hombre', 'Penaflor', 'Descalificacion constante o humillacion verbal'),
(611, '2022-03-10 11:14:00', 13201, 1, 22, 1, 0, 'Puente Alto', 23, 'Mujer', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(612, '2022-03-10 12:22:00', 13402, 1, 35, 1, 0, 'Buin', 42, 'Mujer', 'Hombre', 'Buin', 'Persecucion o acoso persistente (stalking)'),
(613, '2022-03-10 12:29:00', 13119, 1, 32, 0, NULL, 'Maipu', 50, 'Mujer', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(614, '2022-03-10 12:45:00', 13119, 0, 33, 1, 0, 'Maipu', 33, 'Hombre', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(615, '2022-03-10 13:02:00', 13121, 0, 35, 0, NULL, 'Pedro Aguirre Cerda', 50, 'Hombre', NULL, 'Pedro Aguirre Cerda', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(616, '2022-03-10 14:01:00', 13401, 1, 21, 0, NULL, 'San Bernardo', 50, 'Mujer', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(617, '2022-03-10 14:14:00', 13128, 0, 33, 0, NULL, 'Renca', 47, 'Hombre', NULL, 'Renca', 'Trato deshumanizante en servicios publicos o de salud'),
(618, '2022-03-10 14:28:00', 13401, 1, 23, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(619, '2022-03-10 14:32:00', 13127, 0, 29, 1, 1, 'Recoleta', 16, 'Hombre', 'Mujer', 'Recoleta', 'Uso de hijos/as u otras personas como chantaje emocional'),
(620, '2022-03-10 15:11:00', 13119, 0, 22, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(621, '2022-03-10 15:25:00', 13110, 0, 33, 1, 0, 'La Florida', 33, 'Hombre', 'Hombre', 'La Florida', 'Empujones o sacudidas leves'),
(622, '2022-03-10 15:26:00', 13106, 0, 30, 1, 0, 'Estacion Central', 9, 'Hombre', 'Hombre', 'Estacion Central', 'Descalificacion constante o humillacion verbal'),
(623, '2022-03-11 12:08:00', 13112, 1, 32, 1, 1, 'La Pintana', 36, 'Mujer', 'Mujer', 'La Pintana', 'Lesiones fisicas moderadas o graves'),
(624, '2022-03-11 14:02:00', 13301, 0, 27, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(625, '2022-03-12 13:13:00', 13101, 1, 24, 1, 0, 'Santiago', 23, 'Mujer', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(626, '2022-03-14 14:05:00', 13116, 0, 28, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(627, '2022-03-14 15:18:00', 13201, 0, 26, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(628, '2022-03-14 15:19:00', 13201, 0, 28, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(629, '2022-03-15 12:22:00', 13120, 1, 38, 0, NULL, 'Nunoa', 50, 'Mujer', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(630, '2022-03-15 12:43:00', 13130, 1, 26, 1, 0, 'San Miguel', 15, 'Mujer', 'Hombre', 'San Miguel', 'Fomento de inseguridades o dependencia emocional'),
(631, '2022-03-15 13:20:00', 13113, 0, 20, 1, 0, 'La Reina', 8, 'Hombre', 'Hombre', 'La Reina', 'Apropiacion de ideas u opiniones en entornos profesionales'),
(632, '2022-03-15 14:19:00', 13127, 1, 23, 1, 0, 'Recoleta', 23, 'Mujer', 'Hombre', 'Recoleta', 'Comentarios sexuales no deseados'),
(633, '2022-03-15 14:37:00', 13119, 0, 32, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(634, '2022-03-15 15:04:00', 13124, 0, 24, 1, 1, 'Pudahuel', 21, 'Hombre', 'Mujer', 'Pudahuel', 'Destruccion de objetos personales o simbolicos'),
(635, '2022-03-15 18:12:00', 13102, 0, 28, 1, 0, 'Cerrillos', 9, 'Hombre', 'Hombre', 'Cerrillos', 'Descalificacion constante o humillacion verbal'),
(636, '2022-03-16 12:00:00', 13121, 1, 27, 1, 0, 'Pedro Aguirre Cerda', 15, 'Mujer', 'Hombre', 'Pedro Aguirre Cerda', 'Fomento de inseguridades o dependencia emocional'),
(637, '2022-03-16 12:33:00', 13401, 0, 26, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(638, '2022-03-16 13:13:00', 13119, 0, 29, 1, 0, 'Maipu', 33, 'Hombre', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(639, '2022-03-16 13:15:00', 13128, 0, 34, 1, 0, 'Renca', 35, 'Hombre', 'Hombre', 'Renca', 'Golpes con objetos, punetazos, patadas'),
(640, '2022-03-16 13:18:00', 13125, 1, 26, 1, 0, 'Quilicura', 15, 'Mujer', 'Hombre', 'Quilicura', 'Fomento de inseguridades o dependencia emocional'),
(641, '2022-03-16 13:42:00', 13112, 1, 27, 1, 0, 'La Pintana', 9, 'Mujer', 'Hombre', 'La Pintana', 'Descalificacion constante o humillacion verbal'),
(642, '2022-03-16 13:46:00', 13101, 0, 27, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(643, '2022-03-16 14:45:00', 13101, 1, 35, 1, 0, 'Santiago', 42, 'Mujer', 'Hombre', 'Santiago', 'Persecucion o acoso persistente (stalking)'),
(644, '2022-03-16 15:25:00', 13302, 0, 33, 1, 0, 'Lampa', 9, 'Hombre', 'Hombre', 'Lampa', 'Descalificacion constante o humillacion verbal'),
(645, '2022-03-17 12:09:00', 13503, 1, 26, 1, 0, 'Curacavi', 33, 'Mujer', 'Hombre', 'Curacavi', 'Empujones o sacudidas leves'),
(646, '2022-03-17 12:21:00', 13125, 1, 29, 1, 0, 'Quilicura', 19, 'Mujer', 'Hombre', 'Quilicura', 'Retencion o robo de bienes personales o dinero'),
(647, '2022-03-17 13:03:00', 13125, 1, 41, 1, 1, 'Quilicura', 36, 'Mujer', 'Mujer', 'Quilicura', 'Lesiones fisicas moderadas o graves'),
(648, '2022-03-17 13:09:00', 13603, 0, 35, 0, NULL, 'Isla de Maipo', 50, 'Hombre', NULL, 'Isla de Maipo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(649, '2022-03-17 13:10:00', 13101, 1, 38, 1, 0, 'Santiago', 4, 'Mujer', 'Hombre', 'Santiago', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(650, '2022-03-17 13:11:00', 13125, 0, 29, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(651, '2022-03-17 13:42:00', 13119, 1, 27, 1, 0, 'Maipu', 6, 'Mujer', 'Hombre', 'Maipu', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(652, '2022-03-17 14:30:00', 13602, 0, 26, 0, NULL, 'El Monte', 50, 'Hombre', NULL, 'El Monte', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(653, '2022-03-17 15:45:00', 13108, 1, 25, 1, 1, 'Independencia', 30, 'Mujer', 'Mujer', 'Independencia', 'Acoso sexual en el trabajo o espacios educativos'),
(654, '2022-03-17 16:08:00', 13123, 1, 25, 1, 0, 'Providencia', 23, 'Mujer', 'Hombre', 'Providencia', 'Comentarios sexuales no deseados'),
(655, '2022-03-17 16:52:00', 13401, 1, 34, 1, 0, 'San Bernardo', 19, 'Mujer', 'Hombre', 'San Bernardo', 'Retencion o robo de bienes personales o dinero'),
(656, '2022-03-18 15:07:00', 13501, 0, 23, 0, NULL, 'Melipilla', 50, 'Hombre', NULL, 'Melipilla', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(657, '2022-03-21 12:26:00', 13201, 0, 29, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(658, '2022-03-21 12:37:00', 13119, 1, 20, 1, 1, 'Maipu', 27, 'Mujer', 'Mujer', 'Maipu', 'Relaciones sexuales sin consentimiento pleno'),
(659, '2022-03-21 13:27:00', 13201, 0, 31, 1, 0, 'Puente Alto', 9, 'Hombre', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(660, '2022-03-21 16:03:00', 13603, 0, 33, 0, NULL, 'Isla de Maipo', 50, 'Hombre', NULL, 'Isla de Maipo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(661, '2022-03-22 10:44:00', 13122, 0, 35, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(662, '2022-03-22 13:03:00', 13402, 1, 33, 1, 0, 'Buin', 42, 'Mujer', 'Hombre', 'Buin', 'Persecucion o acoso persistente (stalking)');
INSERT INTO `wp_db_upload` (`ID`, `Fecha`, `Comuna`, `Genero_Victima`, `Edad`, `si_no`, `Genero_Agresor`, `Comuna_1`, `Tipo`, `Nombre_Genero_Victima_Texto`, `Nombre_Genero_Agresor_Texto`, `Nombre_Comuna`, `Nombre_Violencia`) VALUES
(663, '2022-03-22 13:26:00', 13122, 0, 26, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(664, '2022-03-22 13:59:00', 13125, 0, 26, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(665, '2022-03-22 14:10:00', 13404, 0, 26, 0, NULL, 'Paine', 50, 'Hombre', NULL, 'Paine', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(666, '2022-03-22 14:24:00', 13110, 0, 24, 1, 0, 'La Florida', 23, 'Hombre', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(667, '2022-03-22 14:58:00', 13131, 0, 19, 0, NULL, 'San Ramon', 50, 'Hombre', NULL, 'San Ramon', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(668, '2022-03-22 15:08:00', 13108, 0, 27, 1, 0, 'Independencia', 9, 'Hombre', 'Hombre', 'Independencia', 'Descalificacion constante o humillacion verbal'),
(669, '2022-03-22 15:21:00', 13110, 0, 22, 1, 1, 'La Florida', 35, 'Hombre', 'Mujer', 'La Florida', 'Golpes con objetos, punetazos, patadas'),
(670, '2022-03-23 10:53:00', 13108, 0, 24, 0, NULL, 'Independencia', 50, 'Hombre', NULL, 'Independencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(671, '2022-03-23 12:05:00', 13103, 1, 25, 1, 1, 'Cerro Navia', 35, 'Mujer', 'Mujer', 'Cerro Navia', 'Golpes con objetos, punetazos, patadas'),
(672, '2022-03-23 12:35:00', 13115, 0, 27, 0, NULL, 'Lo Barnechea', 50, 'Hombre', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(673, '2022-03-23 12:44:00', 13404, 0, 39, 0, NULL, 'Paine', 50, 'Hombre', NULL, 'Paine', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(674, '2022-03-23 13:11:00', 13120, 1, 33, 1, 1, 'Nunoa', 27, 'Mujer', 'Mujer', 'Nunoa', 'Relaciones sexuales sin consentimiento pleno'),
(675, '2022-03-23 13:16:00', 13114, 1, 25, 1, 0, 'Las Condes', 23, 'Mujer', 'Hombre', 'Las Condes', 'Comentarios sexuales no deseados'),
(676, '2022-03-23 14:03:00', 13401, 1, 32, 1, 1, 'San Bernardo', 4, 'Mujer', 'Mujer', 'San Bernardo', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(677, '2022-03-23 14:34:00', 13122, 1, 24, 1, 1, 'Penalolen', 35, 'Mujer', 'Mujer', 'Penalolen', 'Golpes con objetos, punetazos, patadas'),
(678, '2022-03-23 14:53:00', 13501, 0, 21, 1, 0, 'Melipilla', 9, 'Hombre', 'Hombre', 'Melipilla', 'Descalificacion constante o humillacion verbal'),
(679, '2022-03-23 14:55:00', 13105, 1, 27, 1, 0, 'El Bosque', 1, 'Mujer', 'Hombre', 'El Bosque', 'Lenguaje discriminatorio (sexista, racista, homofobico, etc.)'),
(680, '2022-03-23 15:05:00', 13401, 1, 24, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(681, '2022-03-23 15:10:00', 13113, 1, 27, 1, 0, 'La Reina', 14, 'Mujer', 'Hombre', 'La Reina', 'Desvalorizacion de logros o capacidades personales'),
(682, '2022-03-23 15:38:00', 13101, 0, 22, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(683, '2022-03-23 16:09:00', 13102, 1, 29, 1, 1, 'Cerrillos', 35, 'Mujer', 'Mujer', 'Cerrillos', 'Golpes con objetos, punetazos, patadas'),
(684, '2022-03-23 16:21:00', 13115, 1, 21, 1, 0, 'Lo Barnechea', 10, 'Mujer', 'Hombre', 'Lo Barnechea', 'Manipulacion emocional o gaslighting'),
(685, '2022-03-23 16:22:00', 13107, 1, 31, 1, 0, 'Huechuraba', 14, 'Mujer', 'Hombre', 'Huechuraba', 'Desvalorizacion de logros o capacidades personales'),
(686, '2022-03-24 12:19:00', 13119, 0, 31, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(687, '2022-03-24 13:32:00', 13105, 0, 33, 0, NULL, 'El Bosque', 50, 'Hombre', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(688, '2022-03-24 13:34:00', 13106, 1, 26, 1, 0, 'Estacion Central', 19, 'Mujer', 'Hombre', 'Estacion Central', 'Retencion o robo de bienes personales o dinero'),
(689, '2022-03-24 13:57:00', 13605, 1, 23, 0, NULL, 'Penaflor', 50, 'Mujer', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(690, '2022-03-24 14:29:00', 13109, 1, 26, 1, 0, 'La Cisterna', 34, 'Mujer', 'Hombre', 'La Cisterna', 'Bofetadas, tirones de cabello o rasgunos'),
(691, '2022-03-24 14:39:00', 13105, 0, 19, 0, NULL, 'El Bosque', 50, 'Hombre', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(692, '2022-03-24 15:39:00', 13104, 1, 25, 1, 1, 'Conchali', 35, 'Mujer', 'Mujer', 'Conchali', 'Golpes con objetos, punetazos, patadas'),
(693, '2022-03-25 11:12:00', 13303, 0, 33, 0, NULL, 'Tiltil', 50, 'Hombre', NULL, 'Tiltil', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(694, '2022-03-25 14:37:00', 13601, 0, 28, 1, 0, 'Talagante', 33, 'Hombre', 'Hombre', 'Talagante', 'Empujones o sacudidas leves'),
(695, '2022-03-25 18:40:00', 13125, 0, 20, 1, 0, 'Quilicura', 26, 'Hombre', 'Hombre', 'Quilicura', 'Presion o chantaje para relaciones sexuales'),
(696, '2022-03-28 13:44:00', 13401, 1, 20, 1, 1, 'San Bernardo', 27, 'Mujer', 'Mujer', 'San Bernardo', 'Relaciones sexuales sin consentimiento pleno'),
(697, '2022-03-28 14:21:00', 13112, 1, 23, 1, 0, 'La Pintana', 23, 'Mujer', 'Hombre', 'La Pintana', 'Comentarios sexuales no deseados'),
(698, '2022-03-28 16:11:00', 13131, 0, 25, 0, NULL, 'San Ramon', 50, 'Hombre', NULL, 'San Ramon', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(699, '2022-03-28 16:30:00', 13119, 1, 25, 1, 0, 'Maipu', 23, 'Mujer', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(700, '2022-03-29 11:46:00', 13105, 0, 23, 1, 0, 'El Bosque', 23, 'Hombre', 'Hombre', 'El Bosque', 'Comentarios sexuales no deseados'),
(701, '2022-03-29 12:21:00', 13120, 0, 21, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(702, '2022-03-29 13:10:00', 13106, 0, 29, 0, NULL, 'Estacion Central', 50, 'Hombre', NULL, 'Estacion Central', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(703, '2022-03-29 13:18:00', 13402, 0, 27, 0, NULL, 'Buin', 50, 'Hombre', NULL, 'Buin', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(704, '2022-03-29 14:16:00', 13402, 1, 24, 1, 1, 'Buin', 30, 'Mujer', 'Mujer', 'Buin', 'Acoso sexual en el trabajo o espacios educativos'),
(705, '2022-03-29 14:16:00', 13201, 1, 20, 1, 0, 'Puente Alto', 10, 'Mujer', 'Hombre', 'Puente Alto', 'Manipulacion emocional o gaslighting'),
(706, '2022-03-29 14:50:00', 13122, 1, 37, 1, 0, 'Penalolen', 42, 'Mujer', 'Hombre', 'Penalolen', 'Persecucion o acoso persistente (stalking)'),
(707, '2022-03-29 14:59:00', 13112, 1, 34, 1, 0, 'La Pintana', 33, 'Mujer', 'Hombre', 'La Pintana', 'Empujones o sacudidas leves'),
(708, '2022-03-29 15:56:00', 13120, 1, 19, 1, 0, 'Nunoa', 23, 'Mujer', 'Hombre', 'Nunoa', 'Comentarios sexuales no deseados'),
(709, '2022-03-30 10:56:00', 13127, 0, 24, 1, 1, 'Recoleta', 21, 'Hombre', 'Mujer', 'Recoleta', 'Destruccion de objetos personales o simbolicos'),
(710, '2022-03-30 11:06:00', 13118, 0, 24, 0, NULL, 'Macul', 50, 'Hombre', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(711, '2022-03-30 11:12:00', 13302, 1, 25, 0, NULL, 'Lampa', 50, 'Mujer', NULL, 'Lampa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(712, '2022-03-30 12:32:00', 13119, 1, 26, 1, 0, 'Maipu', 14, 'Mujer', 'Hombre', 'Maipu', 'Desvalorizacion de logros o capacidades personales'),
(713, '2022-03-30 13:50:00', 13119, 0, 22, 1, 1, 'Maipu', 21, 'Hombre', 'Mujer', 'Maipu', 'Destruccion de objetos personales o simbolicos'),
(714, '2022-03-30 14:16:00', 13109, 1, 28, 1, 0, 'La Cisterna', 2, 'Mujer', 'Hombre', 'La Cisterna', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(715, '2022-03-30 14:17:00', 13102, 0, 32, 0, NULL, 'Cerrillos', 47, 'Hombre', NULL, 'Cerrillos', 'Trato deshumanizante en servicios publicos o de salud'),
(716, '2022-03-30 15:12:00', 13110, 1, 21, 1, 0, 'La Florida', 10, 'Mujer', 'Hombre', 'La Florida', 'Manipulacion emocional o gaslighting'),
(717, '2022-03-30 15:50:00', 13103, 0, 24, 0, NULL, 'Cerro Navia', 50, 'Hombre', NULL, 'Cerro Navia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(718, '2022-03-30 17:19:00', 13119, 1, 19, 1, 0, 'Maipu', 23, 'Mujer', 'Hombre', 'Maipu', 'Comentarios sexuales no deseados'),
(719, '2022-03-31 12:13:00', 13124, 0, 28, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(720, '2022-03-31 13:44:00', 13116, 0, 18, 0, NULL, 'Lo Espejo', 50, 'Hombre', NULL, 'Lo Espejo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(721, '2022-03-31 13:51:00', 13125, 1, 23, 1, 1, 'Quilicura', 35, 'Mujer', 'Mujer', 'Quilicura', 'Golpes con objetos, punetazos, patadas'),
(722, '2022-03-31 13:51:00', 13128, 0, 31, 0, NULL, 'Renca', 50, 'Hombre', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(723, '2022-03-31 14:20:00', 13110, 1, 28, 1, 0, 'La Florida', 2, 'Mujer', 'Hombre', 'La Florida', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(724, '2022-03-31 14:54:00', 13122, 0, 29, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(725, '2022-03-31 16:33:00', 13101, 0, 39, 1, 0, 'Santiago', 4, 'Hombre', 'Hombre', 'Santiago', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(726, '2022-04-01 15:08:00', 13114, 2, 26, 0, NULL, 'Las Condes', 14, 'Otro', NULL, 'Las Condes', 'Desvalorizacion de logros o capacidades personales'),
(727, '2022-04-01 15:29:00', 13101, 1, 21, 0, NULL, 'Santiago', 50, 'Mujer', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(728, '2022-04-03 12:29:00', 13302, 1, 27, 0, NULL, 'Lampa', 50, 'Mujer', NULL, 'Lampa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(729, '2022-04-04 14:14:00', 13119, 1, 19, 1, 1, 'Maipu', 27, 'Mujer', 'Mujer', 'Maipu', 'Relaciones sexuales sin consentimiento pleno'),
(730, '2022-04-04 14:35:00', 13109, 1, 21, 1, 0, 'La Cisterna', 10, 'Mujer', 'Hombre', 'La Cisterna', 'Manipulacion emocional o gaslighting'),
(731, '2022-04-04 15:35:00', 13124, 0, 27, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(732, '2022-04-05 12:25:00', 13601, 1, 28, 1, 0, 'Talagante', 14, 'Mujer', 'Hombre', 'Talagante', 'Desvalorizacion de logros o capacidades personales'),
(733, '2022-04-05 12:33:00', 13201, 0, 32, 0, NULL, 'Puente Alto', 47, 'Hombre', NULL, 'Puente Alto', 'Trato deshumanizante en servicios publicos o de salud'),
(734, '2022-04-05 12:58:00', 13117, 1, 20, 1, 0, 'Lo Prado', 10, 'Mujer', 'Hombre', 'Lo Prado', 'Manipulacion emocional o gaslighting'),
(735, '2022-04-05 13:09:00', 13127, 1, 25, 1, 1, 'Recoleta', 35, 'Mujer', 'Mujer', 'Recoleta', 'Golpes con objetos, punetazos, patadas'),
(736, '2022-04-05 14:01:00', 13201, 0, 26, 1, 0, 'Puente Alto', 33, 'Hombre', 'Hombre', 'Puente Alto', 'Empujones o sacudidas leves'),
(737, '2022-04-05 14:12:00', 13112, 0, 20, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(738, '2022-04-05 15:11:00', 13130, 1, 22, 1, 0, 'San Miguel', 23, 'Mujer', 'Hombre', 'San Miguel', 'Comentarios sexuales no deseados'),
(739, '2022-04-05 15:22:00', 13126, 1, 33, 1, 0, 'Quinta Normal', 42, 'Mujer', 'Hombre', 'Quinta Normal', 'Persecucion o acoso persistente (stalking)'),
(740, '2022-04-06 13:26:00', 13501, 1, 23, 1, 1, 'Melipilla', 6, 'Mujer', 'Mujer', 'Melipilla', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(741, '2022-04-06 13:31:00', 13124, 1, 24, 0, NULL, 'Pudahuel', 50, 'Mujer', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(742, '2022-04-06 14:34:00', 13301, 1, 31, 1, 1, 'Colina', 35, 'Mujer', 'Mujer', 'Colina', 'Golpes con objetos, punetazos, patadas'),
(743, '2022-04-06 14:35:00', 13605, 0, 34, 0, NULL, 'Penaflor', 50, 'Hombre', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(744, '2022-04-06 15:06:00', 13119, 0, 24, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(745, '2022-04-06 16:52:00', 13109, 1, 30, 1, 1, 'La Cisterna', 6, 'Mujer', 'Mujer', 'La Cisterna', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(746, '2022-04-07 11:51:00', 13201, 1, 28, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(747, '2022-04-07 12:47:00', 13112, 0, 27, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(748, '2022-04-07 13:14:00', 13132, 1, 24, 1, 0, 'Vitacura', 23, 'Mujer', 'Hombre', 'Vitacura', 'Comentarios sexuales no deseados'),
(749, '2022-04-07 13:25:00', 13101, 0, 30, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(750, '2022-04-07 13:47:00', 13301, 0, 31, 0, NULL, 'Colina', 50, 'Hombre', NULL, 'Colina', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(751, '2022-04-07 14:14:00', 13101, 0, 22, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(752, '2022-04-07 14:40:00', 13112, 0, 27, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(753, '2022-04-07 14:41:00', 13114, 1, 32, 0, NULL, 'Las Condes', 50, 'Mujer', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(754, '2022-04-07 14:41:00', 13401, 0, 21, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(755, '2022-04-07 15:08:00', 13120, 0, 28, 1, 0, 'Nunoa', 35, 'Hombre', 'Hombre', 'Nunoa', 'Golpes con objetos, punetazos, patadas'),
(756, '2022-04-07 15:31:00', 13117, 0, 26, 0, NULL, 'Lo Prado', 50, 'Hombre', NULL, 'Lo Prado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(757, '2022-04-07 15:42:00', 13126, 0, 22, 1, 0, 'Quinta Normal', 26, 'Hombre', 'Hombre', 'Quinta Normal', 'Presion o chantaje para relaciones sexuales'),
(758, '2022-04-07 16:33:00', 13119, 1, 32, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(759, '2022-04-07 17:09:00', 13106, 1, 20, 1, 0, 'Estacion Central', 10, 'Mujer', 'Hombre', 'Estacion Central', 'Manipulacion emocional o gaslighting'),
(760, '2022-04-07 19:38:00', 13201, 0, 26, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(761, '2022-04-08 11:53:00', 13603, 1, 32, 1, 0, 'Isla de Maipo', 2, 'Mujer', 'Hombre', 'Isla de Maipo', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(762, '2022-04-09 16:08:00', 13104, 0, 22, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(763, '2022-04-10 15:06:00', 13116, 1, 18, 1, 0, 'Lo Espejo', 23, 'Mujer', 'Hombre', 'Lo Espejo', 'Comentarios sexuales no deseados'),
(764, '2022-04-12 12:30:00', 13501, 0, 27, 0, NULL, 'Melipilla', 50, 'Hombre', NULL, 'Melipilla', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(765, '2022-04-12 13:22:00', 13101, 1, 27, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(766, '2022-04-12 15:15:00', 13114, 0, 24, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(767, '2022-04-12 15:16:00', 13123, 0, 28, 0, NULL, 'Providencia', 50, 'Hombre', NULL, 'Providencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(768, '2022-04-12 16:40:00', 13118, 0, 21, 1, 0, 'Macul', 9, 'Hombre', 'Hombre', 'Macul', 'Descalificacion constante o humillacion verbal'),
(769, '2022-04-12 17:08:00', 13106, 2, 31, 0, 0, 'Estacion Central', 35, 'Otro', 'Hombre', 'Estacion Central', 'Golpes con objetos, punetazos, patadas'),
(770, '2022-04-13 11:52:00', 13120, 0, 35, 1, 0, 'Nunoa', 35, 'Hombre', 'Hombre', 'Nunoa', 'Golpes con objetos, punetazos, patadas'),
(771, '2022-04-13 12:17:00', 13605, 0, 25, 0, NULL, 'Penaflor', 50, 'Hombre', NULL, 'Penaflor', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(772, '2022-04-13 12:28:00', 13120, 0, 23, 1, 0, 'Nunoa', 26, 'Hombre', 'Hombre', 'Nunoa', 'Presion o chantaje para relaciones sexuales'),
(773, '2022-04-13 12:49:00', 13123, 0, 22, 0, NULL, 'Providencia', 50, 'Hombre', NULL, 'Providencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(774, '2022-04-13 13:16:00', 13119, 1, 30, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(775, '2022-04-13 13:29:00', 13602, 0, 21, 1, 0, 'El Monte', 9, 'Hombre', 'Hombre', 'El Monte', 'Descalificacion constante o humillacion verbal'),
(776, '2022-04-13 13:45:00', 13131, 1, 36, 1, 0, 'San Ramon', 42, 'Mujer', 'Hombre', 'San Ramon', 'Persecucion o acoso persistente (stalking)'),
(777, '2022-04-13 13:53:00', 13401, 0, 26, 1, 0, 'San Bernardo', 35, 'Hombre', 'Hombre', 'San Bernardo', 'Golpes con objetos, punetazos, patadas'),
(778, '2022-04-13 14:01:00', 13125, 0, 31, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(779, '2022-04-13 14:39:00', 13111, 0, 19, 0, NULL, 'La Granja', 50, 'Hombre', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(780, '2022-04-13 14:53:00', 13125, 1, 35, 0, NULL, 'Quilicura', 50, 'Mujer', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(781, '2022-04-13 14:57:00', 13401, 0, 23, 1, 0, 'San Bernardo', 23, 'Hombre', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(782, '2022-04-13 15:46:00', 13119, 0, 21, 1, 0, 'Maipu', 9, 'Hombre', 'Hombre', 'Maipu', 'Descalificacion constante o humillacion verbal'),
(783, '2022-04-14 11:47:00', 13201, 0, 41, 0, NULL, 'Puente Alto', 47, 'Hombre', NULL, 'Puente Alto', 'Trato deshumanizante en servicios publicos o de salud'),
(784, '2022-04-14 13:04:00', 13106, 1, 28, 1, 1, 'Estacion Central', 30, 'Mujer', 'Mujer', 'Estacion Central', 'Acoso sexual en el trabajo o espacios educativos'),
(785, '2022-04-14 13:20:00', 13125, 0, 32, 0, NULL, 'Quilicura', 47, 'Hombre', NULL, 'Quilicura', 'Trato deshumanizante en servicios publicos o de salud'),
(786, '2022-04-14 13:45:00', 13128, 1, 34, 1, 0, 'Renca', 15, 'Mujer', 'Hombre', 'Renca', 'Fomento de inseguridades o dependencia emocional'),
(787, '2022-04-14 14:34:00', 13503, 1, 28, 1, 0, 'Curacavi', 3, 'Mujer', 'Hombre', 'Curacavi', 'Estereotipos de genero o roles impuestos'),
(788, '2022-04-14 15:37:00', 13122, 0, 22, 0, NULL, 'Penalolen', 50, 'Hombre', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(789, '2022-04-14 16:12:00', 13105, 0, 36, 1, 0, 'El Bosque', 9, 'Hombre', 'Hombre', 'El Bosque', 'Descalificacion constante o humillacion verbal'),
(790, '2022-04-15 15:38:00', 13114, 1, 23, 1, 0, 'Las Condes', 23, 'Mujer', 'Hombre', 'Las Condes', 'Comentarios sexuales no deseados'),
(791, '2022-04-15 15:44:00', 13110, 1, 33, 1, 0, 'La Florida', 33, 'Mujer', 'Hombre', 'La Florida', 'Empujones o sacudidas leves'),
(792, '2022-04-18 12:06:00', 13125, 1, 31, 1, 1, 'Quilicura', 35, 'Mujer', 'Mujer', 'Quilicura', 'Golpes con objetos, punetazos, patadas'),
(793, '2022-04-18 13:57:00', 13101, 1, 30, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(794, '2022-04-18 14:44:00', 13119, 0, 29, 1, 0, 'Maipu', 33, 'Hombre', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(795, '2022-04-19 11:37:00', 13110, 1, 34, 0, NULL, 'La Florida', 50, 'Mujer', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(796, '2022-04-19 13:07:00', 13101, 0, 22, 1, 0, 'Santiago', 23, 'Hombre', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(797, '2022-04-19 13:08:00', 13115, 0, 39, 0, NULL, 'Lo Barnechea', 50, 'Hombre', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(798, '2022-04-19 13:49:00', 13119, 1, 28, 1, 1, 'Maipu', 35, 'Mujer', 'Mujer', 'Maipu', 'Golpes con objetos, punetazos, patadas'),
(799, '2022-04-19 13:50:00', 13401, 1, 21, 1, 0, 'San Bernardo', 10, 'Mujer', 'Hombre', 'San Bernardo', 'Manipulacion emocional o gaslighting'),
(800, '2022-04-19 14:36:00', 13119, 0, 29, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(801, '2022-04-19 15:51:00', 13123, 0, 31, 1, 1, 'Providencia', 16, 'Hombre', 'Mujer', 'Providencia', 'Uso de hijos/as u otras personas como chantaje emocional'),
(802, '2022-04-20 10:49:00', 13108, 1, 24, 1, 0, 'Independencia', 23, 'Mujer', 'Hombre', 'Independencia', 'Comentarios sexuales no deseados'),
(803, '2022-04-20 13:20:00', 13101, 0, 27, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(804, '2022-04-20 13:56:00', 13110, 1, 21, 1, 0, 'La Florida', 10, 'Mujer', 'Hombre', 'La Florida', 'Manipulacion emocional o gaslighting'),
(805, '2022-04-20 13:59:00', 13127, 1, 29, 1, 1, 'Recoleta', 35, 'Mujer', 'Mujer', 'Recoleta', 'Golpes con objetos, punetazos, patadas'),
(806, '2022-04-20 14:10:00', 13101, 1, 27, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(807, '2022-04-20 14:27:00', 13110, 1, 32, 1, 0, 'La Florida', 33, 'Mujer', 'Hombre', 'La Florida', 'Empujones o sacudidas leves'),
(808, '2022-04-20 14:29:00', 13124, 1, 25, 1, 0, 'Pudahuel', 23, 'Mujer', 'Hombre', 'Pudahuel', 'Comentarios sexuales no deseados'),
(809, '2022-04-20 14:34:00', 13101, 0, 23, 0, NULL, 'Santiago', 50, 'Hombre', NULL, 'Santiago', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(810, '2022-04-20 15:23:00', 13131, 0, 27, 0, NULL, 'San Ramon', 50, 'Hombre', NULL, 'San Ramon', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(811, '2022-04-20 15:24:00', 13111, 1, 27, 1, 0, 'La Granja', 19, 'Mujer', 'Hombre', 'La Granja', 'Retencion o robo de bienes personales o dinero'),
(812, '2022-04-21 13:57:00', 13201, 1, 28, 1, 0, 'Puente Alto', 19, 'Mujer', 'Hombre', 'Puente Alto', 'Retencion o robo de bienes personales o dinero'),
(813, '2022-04-21 15:05:00', 13101, 1, 22, 1, 0, 'Santiago', 23, 'Mujer', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(814, '2022-04-21 15:24:00', 13105, 1, 30, 1, 0, 'El Bosque', 9, 'Mujer', 'Hombre', 'El Bosque', 'Descalificacion constante o humillacion verbal'),
(815, '2022-04-21 16:03:00', 13604, 0, 34, 0, NULL, 'Padre Hurtado', 50, 'Hombre', NULL, 'Padre Hurtado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(816, '2022-04-22 12:20:00', 13401, 1, 19, 1, 1, 'San Bernardo', 27, 'Mujer', 'Mujer', 'San Bernardo', 'Relaciones sexuales sin consentimiento pleno'),
(817, '2022-04-22 13:21:00', 13120, 0, 26, 0, NULL, 'Nunoa', 50, 'Hombre', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(818, '2022-04-22 15:09:00', 13108, 1, 29, 1, 0, 'Independencia', 14, 'Mujer', 'Hombre', 'Independencia', 'Desvalorizacion de logros o capacidades personales'),
(819, '2022-04-22 15:40:00', 13201, 0, 20, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(820, '2022-04-23 13:06:00', 13110, 1, 23, 1, 1, 'La Florida', 6, 'Mujer', 'Mujer', 'La Florida', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(821, '2022-04-25 11:56:00', 13501, 0, 22, 0, NULL, 'Melipilla', 50, 'Hombre', NULL, 'Melipilla', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(822, '2022-04-25 12:24:00', 13119, 0, 32, 1, 0, 'Maipu', 33, 'Hombre', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(823, '2022-04-25 12:24:00', 13401, 0, 33, 1, 0, 'San Bernardo', 35, 'Hombre', 'Hombre', 'San Bernardo', 'Golpes con objetos, punetazos, patadas'),
(824, '2022-04-25 14:30:00', 13111, 0, 31, 1, 1, 'La Granja', 16, 'Hombre', 'Mujer', 'La Granja', 'Uso de hijos/as u otras personas como chantaje emocional'),
(825, '2022-04-26 12:13:00', 13126, 0, 22, 0, NULL, 'Quinta Normal', 50, 'Hombre', NULL, 'Quinta Normal', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(826, '2022-04-26 13:33:00', 13106, 0, 31, 0, NULL, 'Estacion Central', 50, 'Hombre', NULL, 'Estacion Central', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(827, '2022-04-26 13:43:00', 13104, 0, 26, 0, NULL, 'Conchali', 50, 'Hombre', NULL, 'Conchali', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(828, '2022-04-26 14:18:00', 13402, 1, 24, 1, 1, 'Buin', 30, 'Mujer', 'Mujer', 'Buin', 'Acoso sexual en el trabajo o espacios educativos'),
(829, '2022-04-26 14:18:00', 13123, 1, 20, 0, NULL, 'Providencia', 50, 'Mujer', NULL, 'Providencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(830, '2022-04-26 14:31:00', 13125, 1, 24, 1, 0, 'Quilicura', 23, 'Mujer', 'Hombre', 'Quilicura', 'Comentarios sexuales no deseados'),
(831, '2022-04-26 15:17:00', 13401, 1, 35, 1, 0, 'San Bernardo', 9, 'Mujer', 'Hombre', 'San Bernardo', 'Descalificacion constante o humillacion verbal'),
(832, '2022-04-26 17:59:00', 13102, 0, 23, 1, 0, 'Cerrillos', 23, 'Hombre', 'Hombre', 'Cerrillos', 'Comentarios sexuales no deseados'),
(833, '2022-04-27 12:53:00', 13112, 1, 19, 1, 0, 'La Pintana', 23, 'Mujer', 'Hombre', 'La Pintana', 'Comentarios sexuales no deseados'),
(834, '2022-04-27 12:54:00', 13201, 0, 25, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(835, '2022-04-27 13:00:00', 13401, 1, 19, 1, 0, 'San Bernardo', 23, 'Mujer', 'Hombre', 'San Bernardo', 'Comentarios sexuales no deseados'),
(836, '2022-04-27 13:02:00', 13114, 0, 31, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(837, '2022-04-27 13:11:00', 13114, 0, 26, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(838, '2022-04-27 14:11:00', 13127, 0, 27, 0, NULL, 'Recoleta', 50, 'Hombre', NULL, 'Recoleta', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(839, '2022-04-27 14:36:00', 13108, 0, 31, 0, NULL, 'Independencia', 50, 'Hombre', NULL, 'Independencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(840, '2022-04-27 14:38:00', 13124, 0, 45, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(841, '2022-04-27 16:07:00', 13401, 0, 28, 0, NULL, 'San Bernardo', 50, 'Hombre', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(842, '2022-04-28 11:09:00', 13122, 1, 30, 1, 1, 'Penalolen', 35, 'Mujer', 'Mujer', 'Penalolen', 'Golpes con objetos, punetazos, patadas'),
(843, '2022-04-28 13:57:00', 13117, 1, 22, 0, NULL, 'Lo Prado', 50, 'Mujer', NULL, 'Lo Prado', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(844, '2022-04-28 15:55:00', 13119, 0, 29, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(845, '2022-04-29 12:52:00', 13124, 1, 20, 1, 0, 'Pudahuel', 9, 'Mujer', 'Hombre', 'Pudahuel', 'Descalificacion constante o humillacion verbal'),
(846, '2022-04-29 12:52:00', 13203, 1, 29, 1, 1, 'San Jose de Maipo', 35, 'Mujer', 'Mujer', 'San Jose de Maipo', 'Golpes con objetos, punetazos, patadas'),
(847, '2022-05-02 14:38:00', 13107, 1, 28, 1, 0, 'Huechuraba', 14, 'Mujer', 'Hombre', 'Huechuraba', 'Desvalorizacion de logros o capacidades personales'),
(848, '2022-05-03 13:16:00', 13101, 0, 29, 1, 1, 'Santiago', 16, 'Hombre', 'Mujer', 'Santiago', 'Uso de hijos/as u otras personas como chantaje emocional'),
(849, '2022-05-03 13:29:00', 13112, 1, 44, 1, 0, 'La Pintana', 12, 'Mujer', 'Hombre', 'La Pintana', 'Amenazas verbales (directas o indirectas)'),
(850, '2022-05-03 17:06:00', 13126, 0, 32, 0, NULL, 'Quinta Normal', 50, 'Hombre', NULL, 'Quinta Normal', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(851, '2022-05-03 18:12:00', 13115, 0, 33, 0, NULL, 'Lo Barnechea', 50, 'Hombre', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(852, '2022-05-04 12:37:00', 13201, 0, 27, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(853, '2022-05-04 13:10:00', 13110, 0, 38, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(854, '2022-05-04 13:44:00', 13110, 1, 22, 1, 0, 'La Florida', 23, 'Mujer', 'Hombre', 'La Florida', 'Comentarios sexuales no deseados'),
(855, '2022-05-04 13:44:00', 13114, 1, 31, 1, 1, 'Las Condes', 25, 'Mujer', 'Mujer', 'Las Condes', 'Tocamientos sin consentimiento'),
(856, '2022-05-04 14:13:00', 13114, 1, 31, 1, 0, 'Las Condes', 14, 'Mujer', 'Hombre', 'Las Condes', 'Desvalorizacion de logros o capacidades personales'),
(857, '2022-05-04 14:58:00', 13114, 0, 28, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(858, '2022-05-04 15:57:00', 13124, 0, 24, 0, NULL, 'Pudahuel', 50, 'Hombre', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(859, '2022-05-05 14:21:00', 13111, 1, 21, 0, NULL, 'La Granja', 50, 'Mujer', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(860, '2022-05-05 15:30:00', 13110, 0, 26, 0, NULL, 'La Florida', 50, 'Hombre', NULL, 'La Florida', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(861, '2022-05-05 16:12:00', 13101, 1, 34, 1, 0, 'Santiago', 14, 'Mujer', 'Hombre', 'Santiago', 'Desvalorizacion de logros o capacidades personales'),
(862, '2022-05-06 14:53:00', 13201, 1, 23, 0, NULL, 'Puente Alto', 50, 'Mujer', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(863, '2022-05-06 15:11:00', 13401, 1, 27, 1, 0, 'San Bernardo', 19, 'Mujer', 'Hombre', 'San Bernardo', 'Retencion o robo de bienes personales o dinero'),
(864, '2022-05-10 13:06:00', 13119, 1, 31, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(865, '2022-05-10 13:50:00', 13119, 1, 31, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(866, '2022-05-10 14:58:00', 13302, 1, 24, 1, 0, 'Lampa', 23, 'Mujer', 'Hombre', 'Lampa', 'Comentarios sexuales no deseados'),
(867, '2022-05-10 15:25:00', 13119, 1, 39, 1, 0, 'Maipu', 33, 'Mujer', 'Hombre', 'Maipu', 'Empujones o sacudidas leves'),
(868, '2022-05-11 12:32:00', 13604, 1, 38, 1, 0, 'Padre Hurtado', 4, 'Mujer', 'Hombre', 'Padre Hurtado', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(869, '2022-05-11 14:40:00', 13123, 0, 27, 0, NULL, 'Providencia', 50, 'Hombre', NULL, 'Providencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(870, '2022-05-11 14:47:00', 13128, 1, 33, 1, 0, 'Renca', 42, 'Mujer', 'Hombre', 'Renca', 'Persecucion o acoso persistente (stalking)'),
(871, '2022-05-12 12:41:00', 13201, 0, 25, 1, 0, 'Puente Alto', 23, 'Hombre', 'Hombre', 'Puente Alto', 'Comentarios sexuales no deseados'),
(872, '2022-05-12 16:00:00', 13123, 0, 26, 0, NULL, 'Providencia', 50, 'Hombre', NULL, 'Providencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(873, '2022-05-14 14:26:00', 13130, 1, 29, 1, 0, 'San Miguel', 35, 'Mujer', 'Hombre', 'San Miguel', 'Golpes con objetos, punetazos, patadas'),
(874, '2022-05-16 17:09:00', 13101, 0, 36, 1, 0, 'Santiago', 35, 'Hombre', 'Hombre', 'Santiago', 'Golpes con objetos, punetazos, patadas'),
(875, '2022-05-17 12:32:00', 13125, 0, 20, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(876, '2022-05-17 13:39:00', 13108, 1, 20, 0, NULL, 'Independencia', 50, 'Mujer', NULL, 'Independencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(877, '2022-05-17 14:19:00', 13201, 0, 24, 0, NULL, 'Puente Alto', 50, 'Hombre', NULL, 'Puente Alto', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(878, '2022-05-17 15:12:00', 13110, 1, 25, 1, 1, 'La Florida', 6, 'Mujer', 'Mujer', 'La Florida', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(879, '2022-05-18 12:57:00', 13111, 0, 24, 0, NULL, 'La Granja', 50, 'Hombre', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(880, '2022-05-18 15:22:00', 13101, 1, 25, 1, 0, 'Santiago', 23, 'Mujer', 'Hombre', 'Santiago', 'Comentarios sexuales no deseados'),
(881, '2022-05-18 15:27:00', 13118, 1, 26, 1, 0, 'Macul', 13, 'Mujer', 'Hombre', 'Macul', 'Culpar a la victima por el conflicto o por la violencia sufrida'),
(882, '2022-05-18 16:17:00', 13119, 1, 30, 0, NULL, 'Maipu', 50, 'Mujer', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(883, '2022-05-19 14:54:00', 13131, 0, 25, 0, NULL, 'San Ramon', 50, 'Hombre', NULL, 'San Ramon', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(884, '2022-05-19 16:16:00', 13122, 1, 28, 0, NULL, 'Penalolen', 50, 'Mujer', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(885, '2022-05-20 11:44:00', 13124, 1, 20, 1, 0, 'Pudahuel', 9, 'Mujer', 'Hombre', 'Pudahuel', 'Descalificacion constante o humillacion verbal'),
(886, '2022-05-23 11:42:00', 13127, 0, 31, 1, 0, 'Recoleta', 35, 'Hombre', 'Hombre', 'Recoleta', 'Golpes con objetos, punetazos, patadas'),
(887, '2022-05-23 14:13:00', 13201, 1, 30, 1, 1, 'Puente Alto', 35, 'Mujer', 'Mujer', 'Puente Alto', 'Golpes con objetos, punetazos, patadas'),
(888, '2022-05-24 13:03:00', 13114, 1, 30, 1, 1, 'Las Condes', 26, 'Mujer', 'Mujer', 'Las Condes', 'Presion o chantaje para relaciones sexuales'),
(889, '2022-05-24 13:46:00', 13112, 0, 27, 0, NULL, 'La Pintana', 50, 'Hombre', NULL, 'La Pintana', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(890, '2022-05-24 13:46:00', 13131, 0, 27, 1, 1, 'San Ramon', 16, 'Hombre', 'Mujer', 'San Ramon', 'Uso de hijos/as u otras personas como chantaje emocional'),
(891, '2022-05-24 14:45:00', 13132, 1, 30, 0, NULL, 'Vitacura', 50, 'Mujer', NULL, 'Vitacura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(892, '2022-05-25 13:28:00', 13122, 1, 22, 0, NULL, 'Penalolen', 50, 'Mujer', NULL, 'Penalolen', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(893, '2022-05-25 13:34:00', 13402, 0, 24, 0, NULL, 'Buin', 50, 'Hombre', NULL, 'Buin', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(894, '2022-05-25 17:19:00', 13128, 0, 29, 0, NULL, 'Renca', 50, 'Hombre', NULL, 'Renca', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(895, '2022-05-30 12:53:00', 13122, 0, 25, 1, 0, 'Penalolen', 23, 'Hombre', 'Hombre', 'Penalolen', 'Comentarios sexuales no deseados'),
(896, '2022-05-30 13:46:00', 13123, 0, 24, 0, NULL, 'Providencia', 50, 'Hombre', NULL, 'Providencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(897, '2022-06-01 12:17:00', 13115, 1, 25, 1, 0, 'Lo Barnechea', 23, 'Mujer', 'Hombre', 'Lo Barnechea', 'Comentarios sexuales no deseados'),
(898, '2022-06-01 14:12:00', 13102, 0, 24, 1, 0, 'Cerrillos', 33, 'Hombre', 'Hombre', 'Cerrillos', 'Empujones o sacudidas leves'),
(899, '2022-06-01 16:32:00', 13119, 0, 23, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(900, '2022-06-02 11:22:00', 13302, 1, 32, 1, 0, 'Lampa', 20, 'Mujer', 'Hombre', 'Lampa', 'Endeudamiento forzoso a nombre de la victima'),
(901, '2022-06-02 12:29:00', 13122, 1, 22, 1, 0, 'Penalolen', 23, 'Mujer', 'Hombre', 'Penalolen', 'Comentarios sexuales no deseados'),
(902, '2022-06-02 12:34:00', 13123, 1, 30, 1, 1, 'Providencia', 27, 'Mujer', 'Mujer', 'Providencia', 'Relaciones sexuales sin consentimiento pleno'),
(903, '2022-06-02 15:00:00', 13201, 1, 26, 1, 0, 'Puente Alto', 9, 'Mujer', 'Hombre', 'Puente Alto', 'Descalificacion constante o humillacion verbal'),
(904, '2022-06-03 12:06:00', 13114, 0, 20, 1, 1, 'Las Condes', 35, 'Hombre', 'Mujer', 'Las Condes', 'Golpes con objetos, punetazos, patadas'),
(905, '2022-06-06 14:47:00', 13125, 0, 22, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(906, '2022-06-08 11:30:00', 13103, 1, 23, 1, 1, 'Cerro Navia', 35, 'Mujer', 'Mujer', 'Cerro Navia', 'Golpes con objetos, punetazos, patadas'),
(907, '2022-06-08 13:24:00', 13112, 1, 22, 1, 1, 'La Pintana', 30, 'Mujer', 'Mujer', 'La Pintana', 'Acoso sexual en el trabajo o espacios educativos'),
(908, '2022-06-08 15:55:00', 13119, 0, 21, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(909, '2022-06-08 16:04:00', 13125, 0, 30, 0, NULL, 'Quilicura', 50, 'Hombre', NULL, 'Quilicura', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(910, '2022-06-09 11:00:00', 13107, 1, 34, 1, 0, 'Huechuraba', 14, 'Mujer', 'Hombre', 'Huechuraba', 'Desvalorizacion de logros o capacidades personales'),
(911, '2022-06-09 15:04:00', 13401, 1, 26, 0, NULL, 'San Bernardo', 50, 'Mujer', NULL, 'San Bernardo', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(912, '2022-06-10 12:26:00', 13111, 1, 22, 1, 0, 'La Granja', 23, 'Mujer', 'Hombre', 'La Granja', 'Comentarios sexuales no deseados'),
(913, '2022-06-14 12:36:00', 13118, 0, 21, 0, NULL, 'Macul', 50, 'Hombre', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(914, '2022-06-14 13:17:00', 13111, 1, 24, 1, 0, 'La Granja', 23, 'Mujer', 'Hombre', 'La Granja', 'Comentarios sexuales no deseados'),
(915, '2022-06-15 13:42:00', 13119, 0, 22, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(916, '2022-06-15 14:08:00', 13111, 1, 19, 0, NULL, 'La Granja', 50, 'Mujer', NULL, 'La Granja', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(917, '2022-06-15 16:51:00', 13115, 1, 18, 0, NULL, 'Lo Barnechea', 50, 'Mujer', NULL, 'Lo Barnechea', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(918, '2022-06-16 13:09:00', 13404, 0, 23, 0, NULL, 'Paine', 50, 'Hombre', NULL, 'Paine', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(919, '2022-06-16 13:21:00', 13118, 1, 34, 0, NULL, 'Macul', 50, 'Mujer', NULL, 'Macul', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(920, '2022-06-16 14:52:00', 13101, 2, 30, 1, 1, 'Santiago', 2, 'Otro', 'Mujer', 'Santiago', 'Chistes, burlas o memes ofensivos sobre genero o identidad'),
(921, '2022-06-20 14:28:00', 13120, 1, 27, 1, 0, 'Nunoa', 14, 'Mujer', 'Hombre', 'Nunoa', 'Desvalorizacion de logros o capacidades personales'),
(922, '2022-06-20 15:36:00', 13104, 1, 23, 1, 0, 'Conchali', 23, 'Mujer', 'Hombre', 'Conchali', 'Comentarios sexuales no deseados'),
(923, '2022-06-21 14:34:00', 13114, 0, 18, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(924, '2022-06-21 15:01:00', 13132, 1, 27, 1, 1, 'Vitacura', 6, 'Mujer', 'Mujer', 'Vitacura', 'Cosificacion o reduccion de una persona a su apariencia fisica'),
(925, '2022-06-22 14:25:00', 13119, 1, 21, 1, 0, 'Maipu', 10, 'Mujer', 'Hombre', 'Maipu', 'Manipulacion emocional o gaslighting'),
(926, '2022-06-22 15:12:00', 13110, 1, 35, 1, 1, 'La Florida', 4, 'Mujer', 'Mujer', 'La Florida', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(927, '2022-06-22 16:03:00', 13103, 0, 18, 0, NULL, 'Cerro Navia', 50, 'Hombre', NULL, 'Cerro Navia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(928, '2022-06-22 16:14:00', 13123, 2, 28, 0, 1, 'Providencia', 1, 'Otro', 'Mujer', 'Providencia', 'Lenguaje discriminatorio (sexista, racista, homofobico, etc.)'),
(929, '2022-06-23 12:24:00', 13112, 0, 30, 1, 0, 'La Pintana', 33, 'Hombre', 'Hombre', 'La Pintana', 'Empujones o sacudidas leves'),
(930, '2022-06-23 14:42:00', 13132, 1, 27, 1, 0, 'Vitacura', 35, 'Mujer', 'Hombre', 'Vitacura', 'Golpes con objetos, punetazos, patadas'),
(931, '2022-06-24 14:32:00', 13601, 1, 32, 1, 0, 'Talagante', 9, 'Mujer', 'Hombre', 'Talagante', 'Descalificacion constante o humillacion verbal'),
(932, '2022-06-28 13:30:00', 13601, 1, 25, 1, 0, 'Talagante', 23, 'Mujer', 'Hombre', 'Talagante', 'Comentarios sexuales no deseados'),
(933, '2022-06-28 16:04:00', 13107, 0, 20, 1, 0, 'Huechuraba', 9, 'Hombre', 'Hombre', 'Huechuraba', 'Descalificacion constante o humillacion verbal'),
(934, '2022-06-29 13:51:00', 13108, 0, 37, 0, NULL, 'Independencia', 50, 'Hombre', NULL, 'Independencia', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(935, '2022-06-30 16:03:00', 13101, 1, 22, 1, 1, 'Santiago', 27, 'Mujer', 'Mujer', 'Santiago', 'Relaciones sexuales sin consentimiento pleno'),
(936, '2022-06-30 16:05:00', 13120, 1, 32, 1, 1, 'Nunoa', 25, 'Mujer', 'Mujer', 'Nunoa', 'Tocamientos sin consentimiento'),
(937, '2022-07-05 12:57:00', 13103, 1, 25, 1, 1, 'Cerro Navia', 35, 'Mujer', 'Mujer', 'Cerro Navia', 'Golpes con objetos, punetazos, patadas'),
(938, '2022-07-06 12:25:00', 13105, 1, 27, 0, NULL, 'El Bosque', 50, 'Mujer', NULL, 'El Bosque', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(939, '2022-07-07 13:33:00', 13114, 0, 27, 0, NULL, 'Las Condes', 50, 'Hombre', NULL, 'Las Condes', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(940, '2022-07-08 13:07:00', 13103, 0, 39, 0, NULL, 'Cerro Navia', 47, 'Hombre', NULL, 'Cerro Navia', 'Trato deshumanizante en servicios publicos o de salud'),
(941, '2022-07-12 13:21:00', 13127, 0, 31, 0, NULL, 'Recoleta', 50, 'Hombre', NULL, 'Recoleta', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(942, '2022-07-14 13:50:00', 13124, 1, 22, 0, NULL, 'Pudahuel', 50, 'Mujer', NULL, 'Pudahuel', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(943, '2022-07-18 14:05:00', 13401, 1, 32, 1, 1, 'San Bernardo', 4, 'Mujer', 'Mujer', 'San Bernardo', 'Interrupciones o invisibilizacion en espacios publicos o laborales'),
(944, '2022-07-19 13:58:00', 13131, 0, 33, 1, 0, 'San Ramon', 33, 'Hombre', 'Hombre', 'San Ramon', 'Empujones o sacudidas leves'),
(945, '2022-07-26 12:44:00', 13110, 0, 32, 1, 0, 'La Florida', 33, 'Hombre', 'Hombre', 'La Florida', 'Empujones o sacudidas leves'),
(946, '2022-07-27 12:47:00', 13120, 1, 19, 0, NULL, 'Nunoa', 50, 'Mujer', NULL, 'Nunoa', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(947, '2022-07-28 14:18:00', 13106, 0, 31, 0, NULL, 'Estacion Central', 50, 'Hombre', NULL, 'Estacion Central', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(948, '2022-07-28 16:30:00', 13113, 1, 35, 1, 0, 'La Reina', 9, 'Mujer', 'Hombre', 'La Reina', 'Descalificacion constante o humillacion verbal'),
(949, '2022-08-03 13:26:00', 13127, 0, 30, 1, 0, 'Recoleta', 33, 'Hombre', 'Hombre', 'Recoleta', 'Empujones o sacudidas leves'),
(950, '2022-08-03 14:44:00', 13119, 0, 25, 0, NULL, 'Maipu', 50, 'Hombre', NULL, 'Maipu', 'Falta de politicas o proteccion efectiva frente a la violencia'),
(214, '2022-12-06 12:26:00', 13401, 0, 29, 1, 0, 'San Bernardo', 35, 'Hombre', 'Hombre', 'San Bernardo', 'Golpes con objetos, punetazos, patadas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_links`
--

CREATE TABLE `wp_links` (
  `link_id` bigint UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint UNSIGNED NOT NULL DEFAULT '1',
  `link_rating` int NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_options`
--

CREATE TABLE `wp_options` (
  `option_id` bigint UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'cron', 'a:10:{i:1752463071;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1752466671;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1752467332;a:3:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:21:\"wp_update_user_counts\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1752467333;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1752470269;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1752472069;a:1:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1752473869;a:1:{s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1752903117;a:1:{s:30:\"wp_delete_temp_updater_backups\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1752985071;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}', 'on'),
(2, 'siteurl', 'http://34.66.246.141', 'on'),
(3, 'home', 'http://34.66.246.141', 'on'),
(4, 'blogname', 'R Plugin in WordPress on Google Compute Engine', 'on'),
(5, 'blogdescription', '', 'on'),
(6, 'users_can_register', '0', 'on'),
(7, 'admin_email', 'guidoriosciaffaroni@gmail.com', 'on'),
(8, 'start_of_week', '1', 'on'),
(9, 'use_balanceTags', '0', 'on'),
(10, 'use_smilies', '1', 'on'),
(11, 'require_name_email', '1', 'on'),
(12, 'comments_notify', '1', 'on'),
(13, 'posts_per_rss', '10', 'on'),
(14, 'rss_use_excerpt', '0', 'on'),
(15, 'mailserver_url', 'mail.example.com', 'on'),
(16, 'mailserver_login', 'login@example.com', 'on'),
(17, 'mailserver_pass', '', 'on'),
(18, 'mailserver_port', '110', 'on'),
(19, 'default_category', '1', 'on'),
(20, 'default_comment_status', 'open', 'on'),
(21, 'default_ping_status', 'open', 'on'),
(22, 'default_pingback_flag', '1', 'on'),
(23, 'posts_per_page', '10', 'on'),
(24, 'date_format', 'F j, Y', 'on'),
(25, 'time_format', 'g:i a', 'on'),
(26, 'links_updated_date_format', 'F j, Y g:i a', 'on'),
(27, 'comment_moderation', '0', 'on'),
(28, 'moderation_notify', '1', 'on'),
(29, 'permalink_structure', '', 'on'),
(30, 'rewrite_rules', '', 'on'),
(31, 'hack_file', '0', 'on'),
(32, 'blog_charset', 'UTF-8', 'on'),
(33, 'moderation_keys', '', 'off'),
(34, 'active_plugins', 'a:0:{}', 'on'),
(35, 'category_base', '', 'on'),
(36, 'ping_sites', 'http://rpc.pingomatic.com/', 'on'),
(37, 'comment_max_links', '2', 'on'),
(38, 'gmt_offset', '0', 'on'),
(39, 'default_email_category', '1', 'on'),
(40, 'recently_edited', '', 'off'),
(41, 'template', 'twentytwentyfive', 'on'),
(42, 'stylesheet', 'twentytwentyfive', 'on'),
(43, 'comment_registration', '0', 'on'),
(44, 'html_type', 'text/html', 'on'),
(45, 'use_trackback', '0', 'on'),
(46, 'default_role', 'subscriber', 'on'),
(47, 'db_version', '58975', 'on'),
(48, 'uploads_use_yearmonth_folders', '1', 'on'),
(49, 'upload_path', '', 'on'),
(50, 'blog_public', '1', 'on'),
(51, 'default_link_category', '2', 'on'),
(52, 'show_on_front', 'posts', 'on'),
(53, 'tag_base', '', 'on'),
(54, 'show_avatars', '1', 'on'),
(55, 'avatar_rating', 'G', 'on'),
(56, 'upload_url_path', '', 'on'),
(57, 'thumbnail_size_w', '150', 'on'),
(58, 'thumbnail_size_h', '150', 'on'),
(59, 'thumbnail_crop', '1', 'on'),
(60, 'medium_size_w', '300', 'on'),
(61, 'medium_size_h', '300', 'on'),
(62, 'avatar_default', 'mystery', 'on'),
(63, 'large_size_w', '1024', 'on'),
(64, 'large_size_h', '1024', 'on'),
(65, 'image_default_link_type', 'none', 'on'),
(66, 'image_default_size', '', 'on'),
(67, 'image_default_align', '', 'on'),
(68, 'close_comments_for_old_posts', '0', 'on'),
(69, 'close_comments_days_old', '14', 'on'),
(70, 'thread_comments', '1', 'on'),
(71, 'thread_comments_depth', '5', 'on'),
(72, 'page_comments', '0', 'on'),
(73, 'comments_per_page', '50', 'on'),
(74, 'default_comments_page', 'newest', 'on'),
(75, 'comment_order', 'asc', 'on'),
(76, 'sticky_posts', 'a:0:{}', 'on'),
(77, 'widget_categories', 'a:0:{}', 'on'),
(78, 'widget_text', 'a:0:{}', 'on'),
(79, 'widget_rss', 'a:0:{}', 'on'),
(80, 'uninstall_plugins', 'a:0:{}', 'off'),
(81, 'timezone_string', '', 'on'),
(82, 'page_for_posts', '0', 'on'),
(83, 'page_on_front', '0', 'on'),
(84, 'default_post_format', '0', 'on'),
(85, 'link_manager_enabled', '0', 'on'),
(86, 'finished_splitting_shared_terms', '1', 'on'),
(87, 'site_icon', '0', 'on'),
(88, 'medium_large_size_w', '768', 'on'),
(89, 'medium_large_size_h', '0', 'on'),
(90, 'wp_page_for_privacy_policy', '3', 'on'),
(91, 'show_comments_cookies_opt_in', '1', 'on'),
(92, 'admin_email_lifespan', '1767845869', 'on'),
(93, 'disallowed_keys', '', 'off'),
(94, 'comment_previously_approved', '1', 'on'),
(95, 'auto_plugin_theme_update_emails', 'a:0:{}', 'off'),
(96, 'auto_update_core_dev', 'enabled', 'on'),
(97, 'auto_update_core_minor', 'enabled', 'on'),
(98, 'auto_update_core_major', 'enabled', 'on'),
(99, 'wp_force_deactivated_plugins', 'a:0:{}', 'on'),
(100, 'wp_attachment_pages_enabled', '0', 'on'),
(101, 'initial_db_version', '58975', 'on'),
(102, 'wp_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'on'),
(103, 'fresh_site', '1', 'off'),
(104, 'user_count', '1', 'off'),
(105, 'widget_block', 'a:6:{i:2;a:1:{s:7:\"content\";s:19:\"<!-- wp:search /-->\";}i:3;a:1:{s:7:\"content\";s:154:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Posts</h2><!-- /wp:heading --><!-- wp:latest-posts /--></div><!-- /wp:group -->\";}i:4;a:1:{s:7:\"content\";s:227:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Recent Comments</h2><!-- /wp:heading --><!-- wp:latest-comments {\"displayAvatar\":false,\"displayDate\":false,\"displayExcerpt\":false} /--></div><!-- /wp:group -->\";}i:5;a:1:{s:7:\"content\";s:146:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Archives</h2><!-- /wp:heading --><!-- wp:archives /--></div><!-- /wp:group -->\";}i:6;a:1:{s:7:\"content\";s:150:\"<!-- wp:group --><div class=\"wp-block-group\"><!-- wp:heading --><h2>Categories</h2><!-- /wp:heading --><!-- wp:categories /--></div><!-- /wp:group -->\";}s:12:\"_multiwidget\";i:1;}', 'auto'),
(106, 'sidebars_widgets', 'a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:7:\"block-2\";i:1;s:7:\"block-3\";i:2;s:7:\"block-4\";}s:9:\"sidebar-2\";a:2:{i:0;s:7:\"block-5\";i:1;s:7:\"block-6\";}s:13:\"array_version\";i:3;}', 'auto'),
(107, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(108, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(109, 'widget_archives', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(114, 'widget_meta', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(115, 'widget_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(116, 'widget_recent-posts', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(117, 'widget_recent-comments', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(118, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(119, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(120, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'auto'),
(121, '_transient_wp_core_block_css_files', 'a:2:{s:7:\"version\";s:5:\"6.8.1\";s:5:\"files\";a:536:{i:0;s:23:\"archives/editor-rtl.css\";i:1;s:27:\"archives/editor-rtl.min.css\";i:2;s:19:\"archives/editor.css\";i:3;s:23:\"archives/editor.min.css\";i:4;s:22:\"archives/style-rtl.css\";i:5;s:26:\"archives/style-rtl.min.css\";i:6;s:18:\"archives/style.css\";i:7;s:22:\"archives/style.min.css\";i:8;s:20:\"audio/editor-rtl.css\";i:9;s:24:\"audio/editor-rtl.min.css\";i:10;s:16:\"audio/editor.css\";i:11;s:20:\"audio/editor.min.css\";i:12;s:19:\"audio/style-rtl.css\";i:13;s:23:\"audio/style-rtl.min.css\";i:14;s:15:\"audio/style.css\";i:15;s:19:\"audio/style.min.css\";i:16;s:19:\"audio/theme-rtl.css\";i:17;s:23:\"audio/theme-rtl.min.css\";i:18;s:15:\"audio/theme.css\";i:19;s:19:\"audio/theme.min.css\";i:20;s:21:\"avatar/editor-rtl.css\";i:21;s:25:\"avatar/editor-rtl.min.css\";i:22;s:17:\"avatar/editor.css\";i:23;s:21:\"avatar/editor.min.css\";i:24;s:20:\"avatar/style-rtl.css\";i:25;s:24:\"avatar/style-rtl.min.css\";i:26;s:16:\"avatar/style.css\";i:27;s:20:\"avatar/style.min.css\";i:28;s:21:\"button/editor-rtl.css\";i:29;s:25:\"button/editor-rtl.min.css\";i:30;s:17:\"button/editor.css\";i:31;s:21:\"button/editor.min.css\";i:32;s:20:\"button/style-rtl.css\";i:33;s:24:\"button/style-rtl.min.css\";i:34;s:16:\"button/style.css\";i:35;s:20:\"button/style.min.css\";i:36;s:22:\"buttons/editor-rtl.css\";i:37;s:26:\"buttons/editor-rtl.min.css\";i:38;s:18:\"buttons/editor.css\";i:39;s:22:\"buttons/editor.min.css\";i:40;s:21:\"buttons/style-rtl.css\";i:41;s:25:\"buttons/style-rtl.min.css\";i:42;s:17:\"buttons/style.css\";i:43;s:21:\"buttons/style.min.css\";i:44;s:22:\"calendar/style-rtl.css\";i:45;s:26:\"calendar/style-rtl.min.css\";i:46;s:18:\"calendar/style.css\";i:47;s:22:\"calendar/style.min.css\";i:48;s:25:\"categories/editor-rtl.css\";i:49;s:29:\"categories/editor-rtl.min.css\";i:50;s:21:\"categories/editor.css\";i:51;s:25:\"categories/editor.min.css\";i:52;s:24:\"categories/style-rtl.css\";i:53;s:28:\"categories/style-rtl.min.css\";i:54;s:20:\"categories/style.css\";i:55;s:24:\"categories/style.min.css\";i:56;s:19:\"code/editor-rtl.css\";i:57;s:23:\"code/editor-rtl.min.css\";i:58;s:15:\"code/editor.css\";i:59;s:19:\"code/editor.min.css\";i:60;s:18:\"code/style-rtl.css\";i:61;s:22:\"code/style-rtl.min.css\";i:62;s:14:\"code/style.css\";i:63;s:18:\"code/style.min.css\";i:64;s:18:\"code/theme-rtl.css\";i:65;s:22:\"code/theme-rtl.min.css\";i:66;s:14:\"code/theme.css\";i:67;s:18:\"code/theme.min.css\";i:68;s:22:\"columns/editor-rtl.css\";i:69;s:26:\"columns/editor-rtl.min.css\";i:70;s:18:\"columns/editor.css\";i:71;s:22:\"columns/editor.min.css\";i:72;s:21:\"columns/style-rtl.css\";i:73;s:25:\"columns/style-rtl.min.css\";i:74;s:17:\"columns/style.css\";i:75;s:21:\"columns/style.min.css\";i:76;s:33:\"comment-author-name/style-rtl.css\";i:77;s:37:\"comment-author-name/style-rtl.min.css\";i:78;s:29:\"comment-author-name/style.css\";i:79;s:33:\"comment-author-name/style.min.css\";i:80;s:29:\"comment-content/style-rtl.css\";i:81;s:33:\"comment-content/style-rtl.min.css\";i:82;s:25:\"comment-content/style.css\";i:83;s:29:\"comment-content/style.min.css\";i:84;s:26:\"comment-date/style-rtl.css\";i:85;s:30:\"comment-date/style-rtl.min.css\";i:86;s:22:\"comment-date/style.css\";i:87;s:26:\"comment-date/style.min.css\";i:88;s:31:\"comment-edit-link/style-rtl.css\";i:89;s:35:\"comment-edit-link/style-rtl.min.css\";i:90;s:27:\"comment-edit-link/style.css\";i:91;s:31:\"comment-edit-link/style.min.css\";i:92;s:32:\"comment-reply-link/style-rtl.css\";i:93;s:36:\"comment-reply-link/style-rtl.min.css\";i:94;s:28:\"comment-reply-link/style.css\";i:95;s:32:\"comment-reply-link/style.min.css\";i:96;s:30:\"comment-template/style-rtl.css\";i:97;s:34:\"comment-template/style-rtl.min.css\";i:98;s:26:\"comment-template/style.css\";i:99;s:30:\"comment-template/style.min.css\";i:100;s:42:\"comments-pagination-numbers/editor-rtl.css\";i:101;s:46:\"comments-pagination-numbers/editor-rtl.min.css\";i:102;s:38:\"comments-pagination-numbers/editor.css\";i:103;s:42:\"comments-pagination-numbers/editor.min.css\";i:104;s:34:\"comments-pagination/editor-rtl.css\";i:105;s:38:\"comments-pagination/editor-rtl.min.css\";i:106;s:30:\"comments-pagination/editor.css\";i:107;s:34:\"comments-pagination/editor.min.css\";i:108;s:33:\"comments-pagination/style-rtl.css\";i:109;s:37:\"comments-pagination/style-rtl.min.css\";i:110;s:29:\"comments-pagination/style.css\";i:111;s:33:\"comments-pagination/style.min.css\";i:112;s:29:\"comments-title/editor-rtl.css\";i:113;s:33:\"comments-title/editor-rtl.min.css\";i:114;s:25:\"comments-title/editor.css\";i:115;s:29:\"comments-title/editor.min.css\";i:116;s:23:\"comments/editor-rtl.css\";i:117;s:27:\"comments/editor-rtl.min.css\";i:118;s:19:\"comments/editor.css\";i:119;s:23:\"comments/editor.min.css\";i:120;s:22:\"comments/style-rtl.css\";i:121;s:26:\"comments/style-rtl.min.css\";i:122;s:18:\"comments/style.css\";i:123;s:22:\"comments/style.min.css\";i:124;s:20:\"cover/editor-rtl.css\";i:125;s:24:\"cover/editor-rtl.min.css\";i:126;s:16:\"cover/editor.css\";i:127;s:20:\"cover/editor.min.css\";i:128;s:19:\"cover/style-rtl.css\";i:129;s:23:\"cover/style-rtl.min.css\";i:130;s:15:\"cover/style.css\";i:131;s:19:\"cover/style.min.css\";i:132;s:22:\"details/editor-rtl.css\";i:133;s:26:\"details/editor-rtl.min.css\";i:134;s:18:\"details/editor.css\";i:135;s:22:\"details/editor.min.css\";i:136;s:21:\"details/style-rtl.css\";i:137;s:25:\"details/style-rtl.min.css\";i:138;s:17:\"details/style.css\";i:139;s:21:\"details/style.min.css\";i:140;s:20:\"embed/editor-rtl.css\";i:141;s:24:\"embed/editor-rtl.min.css\";i:142;s:16:\"embed/editor.css\";i:143;s:20:\"embed/editor.min.css\";i:144;s:19:\"embed/style-rtl.css\";i:145;s:23:\"embed/style-rtl.min.css\";i:146;s:15:\"embed/style.css\";i:147;s:19:\"embed/style.min.css\";i:148;s:19:\"embed/theme-rtl.css\";i:149;s:23:\"embed/theme-rtl.min.css\";i:150;s:15:\"embed/theme.css\";i:151;s:19:\"embed/theme.min.css\";i:152;s:19:\"file/editor-rtl.css\";i:153;s:23:\"file/editor-rtl.min.css\";i:154;s:15:\"file/editor.css\";i:155;s:19:\"file/editor.min.css\";i:156;s:18:\"file/style-rtl.css\";i:157;s:22:\"file/style-rtl.min.css\";i:158;s:14:\"file/style.css\";i:159;s:18:\"file/style.min.css\";i:160;s:23:\"footnotes/style-rtl.css\";i:161;s:27:\"footnotes/style-rtl.min.css\";i:162;s:19:\"footnotes/style.css\";i:163;s:23:\"footnotes/style.min.css\";i:164;s:23:\"freeform/editor-rtl.css\";i:165;s:27:\"freeform/editor-rtl.min.css\";i:166;s:19:\"freeform/editor.css\";i:167;s:23:\"freeform/editor.min.css\";i:168;s:22:\"gallery/editor-rtl.css\";i:169;s:26:\"gallery/editor-rtl.min.css\";i:170;s:18:\"gallery/editor.css\";i:171;s:22:\"gallery/editor.min.css\";i:172;s:21:\"gallery/style-rtl.css\";i:173;s:25:\"gallery/style-rtl.min.css\";i:174;s:17:\"gallery/style.css\";i:175;s:21:\"gallery/style.min.css\";i:176;s:21:\"gallery/theme-rtl.css\";i:177;s:25:\"gallery/theme-rtl.min.css\";i:178;s:17:\"gallery/theme.css\";i:179;s:21:\"gallery/theme.min.css\";i:180;s:20:\"group/editor-rtl.css\";i:181;s:24:\"group/editor-rtl.min.css\";i:182;s:16:\"group/editor.css\";i:183;s:20:\"group/editor.min.css\";i:184;s:19:\"group/style-rtl.css\";i:185;s:23:\"group/style-rtl.min.css\";i:186;s:15:\"group/style.css\";i:187;s:19:\"group/style.min.css\";i:188;s:19:\"group/theme-rtl.css\";i:189;s:23:\"group/theme-rtl.min.css\";i:190;s:15:\"group/theme.css\";i:191;s:19:\"group/theme.min.css\";i:192;s:21:\"heading/style-rtl.css\";i:193;s:25:\"heading/style-rtl.min.css\";i:194;s:17:\"heading/style.css\";i:195;s:21:\"heading/style.min.css\";i:196;s:19:\"html/editor-rtl.css\";i:197;s:23:\"html/editor-rtl.min.css\";i:198;s:15:\"html/editor.css\";i:199;s:19:\"html/editor.min.css\";i:200;s:20:\"image/editor-rtl.css\";i:201;s:24:\"image/editor-rtl.min.css\";i:202;s:16:\"image/editor.css\";i:203;s:20:\"image/editor.min.css\";i:204;s:19:\"image/style-rtl.css\";i:205;s:23:\"image/style-rtl.min.css\";i:206;s:15:\"image/style.css\";i:207;s:19:\"image/style.min.css\";i:208;s:19:\"image/theme-rtl.css\";i:209;s:23:\"image/theme-rtl.min.css\";i:210;s:15:\"image/theme.css\";i:211;s:19:\"image/theme.min.css\";i:212;s:29:\"latest-comments/style-rtl.css\";i:213;s:33:\"latest-comments/style-rtl.min.css\";i:214;s:25:\"latest-comments/style.css\";i:215;s:29:\"latest-comments/style.min.css\";i:216;s:27:\"latest-posts/editor-rtl.css\";i:217;s:31:\"latest-posts/editor-rtl.min.css\";i:218;s:23:\"latest-posts/editor.css\";i:219;s:27:\"latest-posts/editor.min.css\";i:220;s:26:\"latest-posts/style-rtl.css\";i:221;s:30:\"latest-posts/style-rtl.min.css\";i:222;s:22:\"latest-posts/style.css\";i:223;s:26:\"latest-posts/style.min.css\";i:224;s:18:\"list/style-rtl.css\";i:225;s:22:\"list/style-rtl.min.css\";i:226;s:14:\"list/style.css\";i:227;s:18:\"list/style.min.css\";i:228;s:22:\"loginout/style-rtl.css\";i:229;s:26:\"loginout/style-rtl.min.css\";i:230;s:18:\"loginout/style.css\";i:231;s:22:\"loginout/style.min.css\";i:232;s:25:\"media-text/editor-rtl.css\";i:233;s:29:\"media-text/editor-rtl.min.css\";i:234;s:21:\"media-text/editor.css\";i:235;s:25:\"media-text/editor.min.css\";i:236;s:24:\"media-text/style-rtl.css\";i:237;s:28:\"media-text/style-rtl.min.css\";i:238;s:20:\"media-text/style.css\";i:239;s:24:\"media-text/style.min.css\";i:240;s:19:\"more/editor-rtl.css\";i:241;s:23:\"more/editor-rtl.min.css\";i:242;s:15:\"more/editor.css\";i:243;s:19:\"more/editor.min.css\";i:244;s:30:\"navigation-link/editor-rtl.css\";i:245;s:34:\"navigation-link/editor-rtl.min.css\";i:246;s:26:\"navigation-link/editor.css\";i:247;s:30:\"navigation-link/editor.min.css\";i:248;s:29:\"navigation-link/style-rtl.css\";i:249;s:33:\"navigation-link/style-rtl.min.css\";i:250;s:25:\"navigation-link/style.css\";i:251;s:29:\"navigation-link/style.min.css\";i:252;s:33:\"navigation-submenu/editor-rtl.css\";i:253;s:37:\"navigation-submenu/editor-rtl.min.css\";i:254;s:29:\"navigation-submenu/editor.css\";i:255;s:33:\"navigation-submenu/editor.min.css\";i:256;s:25:\"navigation/editor-rtl.css\";i:257;s:29:\"navigation/editor-rtl.min.css\";i:258;s:21:\"navigation/editor.css\";i:259;s:25:\"navigation/editor.min.css\";i:260;s:24:\"navigation/style-rtl.css\";i:261;s:28:\"navigation/style-rtl.min.css\";i:262;s:20:\"navigation/style.css\";i:263;s:24:\"navigation/style.min.css\";i:264;s:23:\"nextpage/editor-rtl.css\";i:265;s:27:\"nextpage/editor-rtl.min.css\";i:266;s:19:\"nextpage/editor.css\";i:267;s:23:\"nextpage/editor.min.css\";i:268;s:24:\"page-list/editor-rtl.css\";i:269;s:28:\"page-list/editor-rtl.min.css\";i:270;s:20:\"page-list/editor.css\";i:271;s:24:\"page-list/editor.min.css\";i:272;s:23:\"page-list/style-rtl.css\";i:273;s:27:\"page-list/style-rtl.min.css\";i:274;s:19:\"page-list/style.css\";i:275;s:23:\"page-list/style.min.css\";i:276;s:24:\"paragraph/editor-rtl.css\";i:277;s:28:\"paragraph/editor-rtl.min.css\";i:278;s:20:\"paragraph/editor.css\";i:279;s:24:\"paragraph/editor.min.css\";i:280;s:23:\"paragraph/style-rtl.css\";i:281;s:27:\"paragraph/style-rtl.min.css\";i:282;s:19:\"paragraph/style.css\";i:283;s:23:\"paragraph/style.min.css\";i:284;s:35:\"post-author-biography/style-rtl.css\";i:285;s:39:\"post-author-biography/style-rtl.min.css\";i:286;s:31:\"post-author-biography/style.css\";i:287;s:35:\"post-author-biography/style.min.css\";i:288;s:30:\"post-author-name/style-rtl.css\";i:289;s:34:\"post-author-name/style-rtl.min.css\";i:290;s:26:\"post-author-name/style.css\";i:291;s:30:\"post-author-name/style.min.css\";i:292;s:26:\"post-author/editor-rtl.css\";i:293;s:30:\"post-author/editor-rtl.min.css\";i:294;s:22:\"post-author/editor.css\";i:295;s:26:\"post-author/editor.min.css\";i:296;s:25:\"post-author/style-rtl.css\";i:297;s:29:\"post-author/style-rtl.min.css\";i:298;s:21:\"post-author/style.css\";i:299;s:25:\"post-author/style.min.css\";i:300;s:33:\"post-comments-form/editor-rtl.css\";i:301;s:37:\"post-comments-form/editor-rtl.min.css\";i:302;s:29:\"post-comments-form/editor.css\";i:303;s:33:\"post-comments-form/editor.min.css\";i:304;s:32:\"post-comments-form/style-rtl.css\";i:305;s:36:\"post-comments-form/style-rtl.min.css\";i:306;s:28:\"post-comments-form/style.css\";i:307;s:32:\"post-comments-form/style.min.css\";i:308;s:26:\"post-content/style-rtl.css\";i:309;s:30:\"post-content/style-rtl.min.css\";i:310;s:22:\"post-content/style.css\";i:311;s:26:\"post-content/style.min.css\";i:312;s:23:\"post-date/style-rtl.css\";i:313;s:27:\"post-date/style-rtl.min.css\";i:314;s:19:\"post-date/style.css\";i:315;s:23:\"post-date/style.min.css\";i:316;s:27:\"post-excerpt/editor-rtl.css\";i:317;s:31:\"post-excerpt/editor-rtl.min.css\";i:318;s:23:\"post-excerpt/editor.css\";i:319;s:27:\"post-excerpt/editor.min.css\";i:320;s:26:\"post-excerpt/style-rtl.css\";i:321;s:30:\"post-excerpt/style-rtl.min.css\";i:322;s:22:\"post-excerpt/style.css\";i:323;s:26:\"post-excerpt/style.min.css\";i:324;s:34:\"post-featured-image/editor-rtl.css\";i:325;s:38:\"post-featured-image/editor-rtl.min.css\";i:326;s:30:\"post-featured-image/editor.css\";i:327;s:34:\"post-featured-image/editor.min.css\";i:328;s:33:\"post-featured-image/style-rtl.css\";i:329;s:37:\"post-featured-image/style-rtl.min.css\";i:330;s:29:\"post-featured-image/style.css\";i:331;s:33:\"post-featured-image/style.min.css\";i:332;s:34:\"post-navigation-link/style-rtl.css\";i:333;s:38:\"post-navigation-link/style-rtl.min.css\";i:334;s:30:\"post-navigation-link/style.css\";i:335;s:34:\"post-navigation-link/style.min.css\";i:336;s:27:\"post-template/style-rtl.css\";i:337;s:31:\"post-template/style-rtl.min.css\";i:338;s:23:\"post-template/style.css\";i:339;s:27:\"post-template/style.min.css\";i:340;s:24:\"post-terms/style-rtl.css\";i:341;s:28:\"post-terms/style-rtl.min.css\";i:342;s:20:\"post-terms/style.css\";i:343;s:24:\"post-terms/style.min.css\";i:344;s:24:\"post-title/style-rtl.css\";i:345;s:28:\"post-title/style-rtl.min.css\";i:346;s:20:\"post-title/style.css\";i:347;s:24:\"post-title/style.min.css\";i:348;s:26:\"preformatted/style-rtl.css\";i:349;s:30:\"preformatted/style-rtl.min.css\";i:350;s:22:\"preformatted/style.css\";i:351;s:26:\"preformatted/style.min.css\";i:352;s:24:\"pullquote/editor-rtl.css\";i:353;s:28:\"pullquote/editor-rtl.min.css\";i:354;s:20:\"pullquote/editor.css\";i:355;s:24:\"pullquote/editor.min.css\";i:356;s:23:\"pullquote/style-rtl.css\";i:357;s:27:\"pullquote/style-rtl.min.css\";i:358;s:19:\"pullquote/style.css\";i:359;s:23:\"pullquote/style.min.css\";i:360;s:23:\"pullquote/theme-rtl.css\";i:361;s:27:\"pullquote/theme-rtl.min.css\";i:362;s:19:\"pullquote/theme.css\";i:363;s:23:\"pullquote/theme.min.css\";i:364;s:39:\"query-pagination-numbers/editor-rtl.css\";i:365;s:43:\"query-pagination-numbers/editor-rtl.min.css\";i:366;s:35:\"query-pagination-numbers/editor.css\";i:367;s:39:\"query-pagination-numbers/editor.min.css\";i:368;s:31:\"query-pagination/editor-rtl.css\";i:369;s:35:\"query-pagination/editor-rtl.min.css\";i:370;s:27:\"query-pagination/editor.css\";i:371;s:31:\"query-pagination/editor.min.css\";i:372;s:30:\"query-pagination/style-rtl.css\";i:373;s:34:\"query-pagination/style-rtl.min.css\";i:374;s:26:\"query-pagination/style.css\";i:375;s:30:\"query-pagination/style.min.css\";i:376;s:25:\"query-title/style-rtl.css\";i:377;s:29:\"query-title/style-rtl.min.css\";i:378;s:21:\"query-title/style.css\";i:379;s:25:\"query-title/style.min.css\";i:380;s:25:\"query-total/style-rtl.css\";i:381;s:29:\"query-total/style-rtl.min.css\";i:382;s:21:\"query-total/style.css\";i:383;s:25:\"query-total/style.min.css\";i:384;s:20:\"query/editor-rtl.css\";i:385;s:24:\"query/editor-rtl.min.css\";i:386;s:16:\"query/editor.css\";i:387;s:20:\"query/editor.min.css\";i:388;s:19:\"quote/style-rtl.css\";i:389;s:23:\"quote/style-rtl.min.css\";i:390;s:15:\"quote/style.css\";i:391;s:19:\"quote/style.min.css\";i:392;s:19:\"quote/theme-rtl.css\";i:393;s:23:\"quote/theme-rtl.min.css\";i:394;s:15:\"quote/theme.css\";i:395;s:19:\"quote/theme.min.css\";i:396;s:23:\"read-more/style-rtl.css\";i:397;s:27:\"read-more/style-rtl.min.css\";i:398;s:19:\"read-more/style.css\";i:399;s:23:\"read-more/style.min.css\";i:400;s:18:\"rss/editor-rtl.css\";i:401;s:22:\"rss/editor-rtl.min.css\";i:402;s:14:\"rss/editor.css\";i:403;s:18:\"rss/editor.min.css\";i:404;s:17:\"rss/style-rtl.css\";i:405;s:21:\"rss/style-rtl.min.css\";i:406;s:13:\"rss/style.css\";i:407;s:17:\"rss/style.min.css\";i:408;s:21:\"search/editor-rtl.css\";i:409;s:25:\"search/editor-rtl.min.css\";i:410;s:17:\"search/editor.css\";i:411;s:21:\"search/editor.min.css\";i:412;s:20:\"search/style-rtl.css\";i:413;s:24:\"search/style-rtl.min.css\";i:414;s:16:\"search/style.css\";i:415;s:20:\"search/style.min.css\";i:416;s:20:\"search/theme-rtl.css\";i:417;s:24:\"search/theme-rtl.min.css\";i:418;s:16:\"search/theme.css\";i:419;s:20:\"search/theme.min.css\";i:420;s:24:\"separator/editor-rtl.css\";i:421;s:28:\"separator/editor-rtl.min.css\";i:422;s:20:\"separator/editor.css\";i:423;s:24:\"separator/editor.min.css\";i:424;s:23:\"separator/style-rtl.css\";i:425;s:27:\"separator/style-rtl.min.css\";i:426;s:19:\"separator/style.css\";i:427;s:23:\"separator/style.min.css\";i:428;s:23:\"separator/theme-rtl.css\";i:429;s:27:\"separator/theme-rtl.min.css\";i:430;s:19:\"separator/theme.css\";i:431;s:23:\"separator/theme.min.css\";i:432;s:24:\"shortcode/editor-rtl.css\";i:433;s:28:\"shortcode/editor-rtl.min.css\";i:434;s:20:\"shortcode/editor.css\";i:435;s:24:\"shortcode/editor.min.css\";i:436;s:24:\"site-logo/editor-rtl.css\";i:437;s:28:\"site-logo/editor-rtl.min.css\";i:438;s:20:\"site-logo/editor.css\";i:439;s:24:\"site-logo/editor.min.css\";i:440;s:23:\"site-logo/style-rtl.css\";i:441;s:27:\"site-logo/style-rtl.min.css\";i:442;s:19:\"site-logo/style.css\";i:443;s:23:\"site-logo/style.min.css\";i:444;s:27:\"site-tagline/editor-rtl.css\";i:445;s:31:\"site-tagline/editor-rtl.min.css\";i:446;s:23:\"site-tagline/editor.css\";i:447;s:27:\"site-tagline/editor.min.css\";i:448;s:26:\"site-tagline/style-rtl.css\";i:449;s:30:\"site-tagline/style-rtl.min.css\";i:450;s:22:\"site-tagline/style.css\";i:451;s:26:\"site-tagline/style.min.css\";i:452;s:25:\"site-title/editor-rtl.css\";i:453;s:29:\"site-title/editor-rtl.min.css\";i:454;s:21:\"site-title/editor.css\";i:455;s:25:\"site-title/editor.min.css\";i:456;s:24:\"site-title/style-rtl.css\";i:457;s:28:\"site-title/style-rtl.min.css\";i:458;s:20:\"site-title/style.css\";i:459;s:24:\"site-title/style.min.css\";i:460;s:26:\"social-link/editor-rtl.css\";i:461;s:30:\"social-link/editor-rtl.min.css\";i:462;s:22:\"social-link/editor.css\";i:463;s:26:\"social-link/editor.min.css\";i:464;s:27:\"social-links/editor-rtl.css\";i:465;s:31:\"social-links/editor-rtl.min.css\";i:466;s:23:\"social-links/editor.css\";i:467;s:27:\"social-links/editor.min.css\";i:468;s:26:\"social-links/style-rtl.css\";i:469;s:30:\"social-links/style-rtl.min.css\";i:470;s:22:\"social-links/style.css\";i:471;s:26:\"social-links/style.min.css\";i:472;s:21:\"spacer/editor-rtl.css\";i:473;s:25:\"spacer/editor-rtl.min.css\";i:474;s:17:\"spacer/editor.css\";i:475;s:21:\"spacer/editor.min.css\";i:476;s:20:\"spacer/style-rtl.css\";i:477;s:24:\"spacer/style-rtl.min.css\";i:478;s:16:\"spacer/style.css\";i:479;s:20:\"spacer/style.min.css\";i:480;s:20:\"table/editor-rtl.css\";i:481;s:24:\"table/editor-rtl.min.css\";i:482;s:16:\"table/editor.css\";i:483;s:20:\"table/editor.min.css\";i:484;s:19:\"table/style-rtl.css\";i:485;s:23:\"table/style-rtl.min.css\";i:486;s:15:\"table/style.css\";i:487;s:19:\"table/style.min.css\";i:488;s:19:\"table/theme-rtl.css\";i:489;s:23:\"table/theme-rtl.min.css\";i:490;s:15:\"table/theme.css\";i:491;s:19:\"table/theme.min.css\";i:492;s:24:\"tag-cloud/editor-rtl.css\";i:493;s:28:\"tag-cloud/editor-rtl.min.css\";i:494;s:20:\"tag-cloud/editor.css\";i:495;s:24:\"tag-cloud/editor.min.css\";i:496;s:23:\"tag-cloud/style-rtl.css\";i:497;s:27:\"tag-cloud/style-rtl.min.css\";i:498;s:19:\"tag-cloud/style.css\";i:499;s:23:\"tag-cloud/style.min.css\";i:500;s:28:\"template-part/editor-rtl.css\";i:501;s:32:\"template-part/editor-rtl.min.css\";i:502;s:24:\"template-part/editor.css\";i:503;s:28:\"template-part/editor.min.css\";i:504;s:27:\"template-part/theme-rtl.css\";i:505;s:31:\"template-part/theme-rtl.min.css\";i:506;s:23:\"template-part/theme.css\";i:507;s:27:\"template-part/theme.min.css\";i:508;s:30:\"term-description/style-rtl.css\";i:509;s:34:\"term-description/style-rtl.min.css\";i:510;s:26:\"term-description/style.css\";i:511;s:30:\"term-description/style.min.css\";i:512;s:27:\"text-columns/editor-rtl.css\";i:513;s:31:\"text-columns/editor-rtl.min.css\";i:514;s:23:\"text-columns/editor.css\";i:515;s:27:\"text-columns/editor.min.css\";i:516;s:26:\"text-columns/style-rtl.css\";i:517;s:30:\"text-columns/style-rtl.min.css\";i:518;s:22:\"text-columns/style.css\";i:519;s:26:\"text-columns/style.min.css\";i:520;s:19:\"verse/style-rtl.css\";i:521;s:23:\"verse/style-rtl.min.css\";i:522;s:15:\"verse/style.css\";i:523;s:19:\"verse/style.min.css\";i:524;s:20:\"video/editor-rtl.css\";i:525;s:24:\"video/editor-rtl.min.css\";i:526;s:16:\"video/editor.css\";i:527;s:20:\"video/editor.min.css\";i:528;s:19:\"video/style-rtl.css\";i:529;s:23:\"video/style-rtl.min.css\";i:530;s:15:\"video/style.css\";i:531;s:19:\"video/style.min.css\";i:532;s:19:\"video/theme-rtl.css\";i:533;s:23:\"video/theme-rtl.min.css\";i:534;s:15:\"video/theme.css\";i:535;s:19:\"video/theme.min.css\";}}', 'on'),
(125, 'recovery_keys', 'a:0:{}', 'off'),
(126, 'theme_mods_twentytwentyfive', 'a:1:{s:18:\"custom_css_post_id\";i:-1;}', 'auto'),
(127, '_transient_wp_styles_for_blocks', 'a:2:{s:4:\"hash\";s:32:\"995febb4f4fef6e5500e6199916c745b\";s:6:\"blocks\";a:52:{s:11:\"core/button\";s:0:\"\";s:14:\"core/site-logo\";s:0:\"\";s:18:\"core/post-template\";s:0:\"\";s:12:\"core/columns\";s:769:\":root :where(.wp-block-columns-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-columns-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-flow) > *{margin-block-start: var(--wp--preset--spacing--50);margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-columns-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-constrained) > *{margin-block-start: var(--wp--preset--spacing--50);margin-block-end: 0;}:root :where(.wp-block-columns-is-layout-flex){gap: var(--wp--preset--spacing--50);}:root :where(.wp-block-columns-is-layout-grid){gap: var(--wp--preset--spacing--50);}\";s:14:\"core/pullquote\";s:306:\":root :where(.wp-block-pullquote){font-size: var(--wp--preset--font-size--xx-large);font-weight: 300;line-height: 1.2;padding-top: var(--wp--preset--spacing--30);padding-bottom: var(--wp--preset--spacing--30);}:root :where(.wp-block-pullquote p:last-of-type){margin-bottom: var(--wp--preset--spacing--30);}\";s:32:\"c48738dcb285a3f6ab83acff204fc486\";s:106:\":root :where(.wp-block-pullquote cite){font-size: var(--wp--preset--font-size--small);font-style: normal;}\";s:11:\"core/avatar\";s:57:\":root :where(.wp-block-avatar img){border-radius: 100px;}\";s:12:\"core/buttons\";s:665:\":root :where(.wp-block-buttons-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-buttons-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-flow) > *{margin-block-start: 16px;margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-constrained) > *{margin-block-start: 16px;margin-block-end: 0;}:root :where(.wp-block-buttons-is-layout-flex){gap: 16px;}:root :where(.wp-block-buttons-is-layout-grid){gap: 16px;}\";s:9:\"core/code\";s:427:\":root :where(.wp-block-code){background-color: var(--wp--preset--color--accent-5);color: var(--wp--preset--color--contrast);font-family: var(--wp--preset--font-family--fira-code);font-size: var(--wp--preset--font-size--medium);font-weight: 300;padding-top: var(--wp--preset--spacing--40);padding-right: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--40);padding-left: var(--wp--preset--spacing--40);}\";s:24:\"core/comment-author-name\";s:169:\":root :where(.wp-block-comment-author-name){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);margin-top: 5px;margin-bottom: 0px;}\";s:32:\"c0002c260f8238c4212f3e4c369fc4f7\";s:143:\":root :where(.wp-block-comment-author-name a:where(:not(.wp-element-button))){color: var(--wp--preset--color--accent-4);text-decoration: none;}\";s:32:\"1e7c38b45537b325dbbbaec17a301676\";s:112:\":root :where(.wp-block-comment-author-name a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:20:\"core/comment-content\";s:178:\":root :where(.wp-block-comment-content){font-size: var(--wp--preset--font-size--medium);margin-top: var(--wp--preset--spacing--30);margin-bottom: var(--wp--preset--spacing--30);}\";s:17:\"core/comment-date\";s:127:\":root :where(.wp-block-comment-date){color: var(--wp--preset--color--contrast);font-size: var(--wp--preset--font-size--small);}\";s:32:\"c83ca7b3e52884c70f7830c54f99b318\";s:114:\":root :where(.wp-block-comment-date a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:22:\"core/comment-edit-link\";s:90:\":root :where(.wp-block-comment-edit-link){font-size: var(--wp--preset--font-size--small);}\";s:32:\"41d70710612536a90e368c12bcb0efea\";s:119:\":root :where(.wp-block-comment-edit-link a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:23:\"core/comment-reply-link\";s:91:\":root :where(.wp-block-comment-reply-link){font-size: var(--wp--preset--font-size--small);}\";s:32:\"13c96340dbf37700add1f4c5cae19f3e\";s:120:\":root :where(.wp-block-comment-reply-link a:where(:not(.wp-element-button))){color: var(--wp--preset--color--contrast);}\";s:23:\"core/post-comments-form\";s:565:\":root :where(.wp-block-post-comments-form){font-size: var(--wp--preset--font-size--medium);padding-top: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--40);}:root :where(.wp-block-post-comments-form textarea, .wp-block-post-comments-form input:not([type=submit])){border-radius:.25rem; border-color: var(--wp--preset--color--accent-6) !important;}:root :where(.wp-block-post-comments-form input[type=checkbox]){margin:0 .2rem 0 0 !important;}:root :where(.wp-block-post-comments-form label){font-size: var(--wp--preset--font-size--small);}\";s:24:\"core/comments-pagination\";s:182:\":root :where(.wp-block-comments-pagination){font-size: var(--wp--preset--font-size--medium);margin-top: var(--wp--preset--spacing--40);margin-bottom: var(--wp--preset--spacing--40);}\";s:29:\"core/comments-pagination-next\";s:98:\":root :where(.wp-block-comments-pagination-next){font-size: var(--wp--preset--font-size--medium);}\";s:32:\"core/comments-pagination-numbers\";s:101:\":root :where(.wp-block-comments-pagination-numbers){font-size: var(--wp--preset--font-size--medium);}\";s:33:\"core/comments-pagination-previous\";s:102:\":root :where(.wp-block-comments-pagination-previous){font-size: var(--wp--preset--font-size--medium);}\";s:14:\"core/post-date\";s:124:\":root :where(.wp-block-post-date){color: var(--wp--preset--color--accent-4);font-size: var(--wp--preset--font-size--small);}\";s:32:\"ac0d4e00f5ec22d14451759983e5bd43\";s:133:\":root :where(.wp-block-post-date a:where(:not(.wp-element-button))){color: var(--wp--preset--color--accent-4);text-decoration: none;}\";s:32:\"0ae6ffd1b886044c2da62d75d05ab13d\";s:102:\":root :where(.wp-block-post-date a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:25:\"core/post-navigation-link\";s:94:\":root :where(.wp-block-post-navigation-link){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/post-terms\";s:158:\":root :where(.wp-block-post-terms){font-size: var(--wp--preset--font-size--small);font-weight: 600;}:root :where(.wp-block-post-terms a){white-space: nowrap;}\";s:15:\"core/post-title\";s:0:\"\";s:32:\"bb496d3fcd9be3502ce57ff8281e5687\";s:92:\":root :where(.wp-block-post-title a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"12380ab98fdc81351bb32a39bbfc9249\";s:103:\":root :where(.wp-block-post-title a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:10:\"core/quote\";s:1315:\":root :where(.wp-block-quote){border-color: currentColor;border-width: 0 0 0 2px;border-style: solid;font-size: var(--wp--preset--font-size--large);font-weight: 300;margin-right: 0;margin-left: 0;padding-top: var(--wp--preset--spacing--30);padding-right: var(--wp--preset--spacing--40);padding-bottom: var(--wp--preset--spacing--30);padding-left: var(--wp--preset--spacing--40);}:root :where(.wp-block-quote-is-layout-flow) > :first-child{margin-block-start: 0;}:root :where(.wp-block-quote-is-layout-flow) > :last-child{margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-flow) > *{margin-block-start: var(--wp--preset--spacing--30);margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-constrained) > :first-child{margin-block-start: 0;}:root :where(.wp-block-quote-is-layout-constrained) > :last-child{margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-constrained) > *{margin-block-start: var(--wp--preset--spacing--30);margin-block-end: 0;}:root :where(.wp-block-quote-is-layout-flex){gap: var(--wp--preset--spacing--30);}:root :where(.wp-block-quote-is-layout-grid){gap: var(--wp--preset--spacing--30);}:root :where(.wp-block-quote.has-text-align-right ){border-width: 0 2px 0 0;}:root :where(.wp-block-quote.has-text-align-center ){border-width: 0;border-inline: 0; padding-inline: 0;}\";s:32:\"1de7a22e22013106efc5be82788cb6c0\";s:176:\":root :where(.wp-block-quote cite){font-size: var(--wp--preset--font-size--small);font-style: normal;font-weight: 300;}:root :where(.wp-block-quote cite sub){font-size: 0.65em}\";s:21:\"core/query-pagination\";s:107:\":root :where(.wp-block-query-pagination){font-size: var(--wp--preset--font-size--medium);font-weight: 500;}\";s:11:\"core/search\";s:380:\":root :where(.wp-block-search .wp-block-search__label, .wp-block-search .wp-block-search__input, .wp-block-search .wp-block-search__button){font-size: var(--wp--preset--font-size--medium);line-height: 1.6;}:root :where(.wp-block-search .wp-block-search__input){border-radius:3.125rem;padding-left:1.5625rem;padding-right:1.5625rem;border-color:var(--wp--preset--color--accent-6);}\";s:32:\"14fa6a3d0cfbde171cbc0fb04aa8a6cf\";s:138:\":root :where(.wp-block-search .wp-element-button,.wp-block-search  .wp-block-button__link){border-radius: 3.125rem;margin-left: 1.125rem;}\";s:32:\"05993ee2f3de94b5d1350998a7e9b6b0\";s:130:\":root :where(.wp-block-search .wp-element-button:hover,.wp-block-search  .wp-block-button__link:hover){border-color: transparent;}\";s:14:\"core/separator\";s:148:\":root :where(.wp-block-separator){border-color: currentColor;border-width: 0 0 1px 0;border-style: solid;color: var(--wp--preset--color--accent-6);}\";s:17:\"core/site-tagline\";s:86:\":root :where(.wp-block-site-tagline){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/site-title\";s:75:\":root :where(.wp-block-site-title){font-weight: 700;letter-spacing: -.5px;}\";s:32:\"f513d889cf971b13995cc3fffed2f39b\";s:92:\":root :where(.wp-block-site-title a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"22c37a317cc0ebd50155b5ad78564f37\";s:103:\":root :where(.wp-block-site-title a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:21:\"core/term-description\";s:90:\":root :where(.wp-block-term-description){font-size: var(--wp--preset--font-size--medium);}\";s:15:\"core/navigation\";s:84:\":root :where(.wp-block-navigation){font-size: var(--wp--preset--font-size--medium);}\";s:32:\"25289a01850f5a0264ddb79a9a3baf3d\";s:92:\":root :where(.wp-block-navigation a:where(:not(.wp-element-button))){text-decoration: none;}\";s:32:\"026c04da08398d655a95047f1f235d97\";s:103:\":root :where(.wp-block-navigation a:where(:not(.wp-element-button)):hover){text-decoration: underline;}\";s:9:\"core/list\";s:52:\":root :where(.wp-block-list li){margin-top: 0.5rem;}\";s:12:\"core/heading\";s:0:\"\";s:14:\"core/paragraph\";s:0:\"\";s:10:\"core/group\";s:0:\"\";s:11:\"core/column\";s:0:\"\";}}', 'on'),
(133, '_site_transient_timeout_browser_7ddeda88d0c599cc494da0dece6554d5', '1752899333', 'off'),
(134, '_site_transient_browser_7ddeda88d0c599cc494da0dece6554d5', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:9:\"138.0.0.0\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'off'),
(135, '_site_transient_timeout_php_check_feede18ab91a39786f5028b7215ed6a6', '1752899333', 'off'),
(136, '_site_transient_php_check_feede18ab91a39786f5028b7215ed6a6', 'a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(140, 'can_compress_scripts', '0', 'on'),
(153, 'finished_updating_comment_type', '1', 'auto'),
(166, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:29:\"guidoriosciaffaroni@gmail.com\";s:7:\"version\";s:5:\"6.8.1\";s:9:\"timestamp\";i:1752298364;}', 'off'),
(205, '_site_transient_timeout_php_check_7b9fb72b3bf6b27c046e3a9832dfe8e2', '1752933242', 'off'),
(206, '_site_transient_php_check_7b9fb72b3bf6b27c046e3a9832dfe8e2', 'a:5:{s:19:\"recommended_version\";s:3:\"8.3\";s:15:\"minimum_version\";s:6:\"7.2.24\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'off'),
(212, '_site_transient_wp_plugin_dependencies_plugin_data', 'a:0:{}', 'off'),
(213, 'recently_activated', 'a:0:{}', 'off'),
(214, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1752427276;s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:3:\"5.4\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:54:\"https://downloads.wordpress.org/plugin/akismet.5.4.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:60:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=2818463\";s:2:\"1x\";s:60:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=2818463\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/akismet/assets/banner-1544x500.png?rev=2900731\";s:2:\"1x\";s:62:\"https://ps.w.org/akismet/assets/banner-772x250.png?rev=2900731\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"5.8\";}s:9:\"hello.php\";O:8:\"stdClass\":10:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/hello-dolly/assets/banner-1544x500.jpg?rev=2645582\";s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}s:8:\"requires\";s:3:\"4.6\";}}s:7:\"checked\";a:2:{s:19:\"akismet/akismet.php\";s:3:\"5.4\";s:9:\"hello.php\";s:5:\"1.7.2\";}}', 'off'),
(217, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.8.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-6.8.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-6.8.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-6.8.1-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"6.8.1\";s:7:\"version\";s:5:\"6.8.1\";s:11:\"php_version\";s:6:\"7.2.24\";s:13:\"mysql_version\";s:5:\"5.5.5\";s:11:\"new_bundled\";s:3:\"6.7\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1752427275;s:15:\"version_checked\";s:5:\"6.8.1\";s:12:\"translations\";a:0:{}}', 'off'),
(220, 'WPLANG', '', 'auto'),
(221, 'new_admin_email', 'guidoriosciaffaroni@gmail.com', 'auto'),
(224, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1752427276;s:7:\"checked\";a:3:{s:16:\"twentytwentyfive\";s:3:\"1.2\";s:16:\"twentytwentyfour\";s:3:\"1.3\";s:17:\"twentytwentythree\";s:3:\"1.6\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:16:\"twentytwentyfive\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfive\";s:11:\"new_version\";s:3:\"1.2\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfive/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfive.1.2.zip\";s:8:\"requires\";s:3:\"6.7\";s:12:\"requires_php\";s:3:\"7.2\";}s:16:\"twentytwentyfour\";a:6:{s:5:\"theme\";s:16:\"twentytwentyfour\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:46:\"https://wordpress.org/themes/twentytwentyfour/\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/theme/twentytwentyfour.1.3.zip\";s:8:\"requires\";s:3:\"6.4\";s:12:\"requires_php\";s:3:\"7.0\";}s:17:\"twentytwentythree\";a:6:{s:5:\"theme\";s:17:\"twentytwentythree\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:47:\"https://wordpress.org/themes/twentytwentythree/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/theme/twentytwentythree.1.6.zip\";s:8:\"requires\";s:3:\"6.1\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'off');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(304, '_transient_health-check-site-status-result', '{\"good\":16,\"recommended\":7,\"critical\":0}', 'on'),
(374, '_site_transient_timeout_theme_roots', '1752433359', 'off'),
(375, '_site_transient_theme_roots', 'a:3:{s:16:\"twentytwentyfive\";s:7:\"/themes\";s:16:\"twentytwentyfour\";s:7:\"/themes\";s:17:\"twentytwentythree\";s:7:\"/themes\";}', 'off'),
(403, '_site_transient_timeout_wp_theme_files_patterns-b24c4b64a1fe6f9f73313f730ddfc1cf', '1752461269', 'off'),
(404, '_site_transient_wp_theme_files_patterns-b24c4b64a1fe6f9f73313f730ddfc1cf', 'a:2:{s:7:\"version\";s:3:\"1.2\";s:8:\"patterns\";a:98:{s:21:\"banner-about-book.php\";a:4:{s:5:\"title\";s:28:\"Banner with book description\";s:4:\"slug\";s:34:\"twentytwentyfive/banner-about-book\";s:11:\"description\";s:66:\"Banner with book description and accompanying image for promotion.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:28:\"banner-cover-big-heading.php\";a:4:{s:5:\"title\";s:22:\"Cover with big heading\";s:4:\"slug\";s:41:\"twentytwentyfive/banner-cover-big-heading\";s:11:\"description\";s:82:\"A full-width cover section with a large background image and an oversized heading.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}}s:22:\"banner-intro-image.php\";a:4:{s:5:\"title\";s:49:\"Short heading and paragraph and image on the left\";s:4:\"slug\";s:35:\"twentytwentyfive/banner-intro-image\";s:11:\"description\";s:68:\"A Intro pattern with Short heading, paragraph and image on the left.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:16:\"banner-intro.php\";a:4:{s:5:\"title\";s:35:\"Intro with left-aligned description\";s:4:\"slug\";s:29:\"twentytwentyfive/banner-intro\";s:11:\"description\";s:66:\"A large left-aligned heading with a brand name emphasized in bold.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:17:\"banner-poster.php\";a:4:{s:5:\"title\";s:19:\"Poster-like section\";s:4:\"slug\";s:30:\"twentytwentyfive/banner-poster\";s:11:\"description\";s:78:\"A section that can be used as a banner or a landing page to announce an event.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:5:\"media\";}}s:43:\"banner-with-description-and-images-grid.php\";a:4:{s:5:\"title\";s:39:\"Banner with description and images grid\";s:4:\"slug\";s:47:\"twentytwentyfive/banner-description-images-grid\";s:11:\"description\";s:75:\"A banner with a short paragraph, and two images displayed in a grid layout.\";s:10:\"categories\";a:2:{i:0;s:6:\"banner\";i:1;s:8:\"featured\";}}s:18:\"binding-format.php\";a:4:{s:5:\"title\";s:16:\"Post format name\";s:4:\"slug\";s:31:\"twentytwentyfive/binding-format\";s:11:\"description\";s:75:\"Prints the name of the post format with the help of the Block Bindings API.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:12:\"comments.php\";a:5:{s:5:\"title\";s:8:\"Comments\";s:4:\"slug\";s:25:\"twentytwentyfive/comments\";s:11:\"description\";s:63:\"Comments area with comments list, pagination, and comment form.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:13:\"core/comments\";}}s:32:\"contact-centered-social-link.php\";a:5:{s:5:\"title\";s:30:\"Centered link and social links\";s:4:\"slug\";s:45:\"twentytwentyfive/contact-centered-social-link\";s:11:\"description\";s:73:\"Centered contact section with a prominent message and social media links.\";s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:3:{i:0;s:7:\"contact\";i:1;s:3:\"faq\";i:2;s:9:\"questions\";}}s:26:\"contact-info-locations.php\";a:6:{s:5:\"title\";s:27:\"Contact, info and locations\";s:4:\"slug\";s:39:\"twentytwentyfive/contact-info-locations\";s:11:\"description\";s:78:\"Contact section with social media links, email, and multiple location details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:7:\"contact\";}s:8:\"keywords\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"location\";}}s:29:\"contact-location-and-link.php\";a:4:{s:5:\"title\";s:25:\"Contact location and link\";s:4:\"slug\";s:42:\"twentytwentyfive/contact-location-and-link\";s:11:\"description\";s:89:\"Contact section with a location address, a directions link, and an image of the location.\";s:10:\"categories\";a:2:{i:0;s:7:\"contact\";i:1;s:8:\"featured\";}}s:18:\"cta-book-links.php\";a:4:{s:5:\"title\";s:30:\"Call to action with book links\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-book-links\";s:11:\"description\";s:74:\"A call to action section with links to get the book in different websites.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:22:\"cta-book-locations.php\";a:4:{s:5:\"title\";s:29:\"Call to action with locations\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-book-locations\";s:11:\"description\";s:82:\"A call to action section with links to get the book in the most popular locations.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:24:\"cta-centered-heading.php\";a:4:{s:5:\"title\";s:16:\"Centered heading\";s:4:\"slug\";s:37:\"twentytwentyfive/cta-centered-heading\";s:11:\"description\";s:53:\"A hero with a centered heading, paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:19:\"cta-events-list.php\";a:4:{s:5:\"title\";s:11:\"Events list\";s:4:\"slug\";s:32:\"twentytwentyfive/cta-events-list\";s:11:\"description\";s:37:\"A list of events with call to action.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:26:\"cta-grid-products-link.php\";a:5:{s:5:\"title\";s:54:\"Call to action with grid layout with products and link\";s:4:\"slug\";s:39:\"twentytwentyfive/cta-grid-products-link\";s:11:\"description\";s:42:\"A call to action featuring product images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"featured\";}}s:22:\"cta-heading-search.php\";a:4:{s:5:\"title\";s:23:\"Heading and search form\";s:4:\"slug\";s:35:\"twentytwentyfive/cta-heading-search\";s:11:\"description\";s:54:\"Large heading with a search form for quick navigation.\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:18:\"cta-newsletter.php\";a:5:{s:5:\"title\";s:18:\"Newsletter sign-up\";s:4:\"slug\";s:31:\"twentytwentyfive/cta-newsletter\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:10:\"newsletter\";}}s:15:\"event-3-col.php\";a:5:{s:5:\"title\";s:46:\"Events, 3 columns with event images and titles\";s:4:\"slug\";s:28:\"twentytwentyfive/event-3-col\";s:11:\"description\";s:95:\"A header with title and text and three columns that show 3 events with their images and titles.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:6:\"events\";i:1;s:7:\"columns\";i:2;s:6:\"images\";}}s:14:\"event-rsvp.php\";a:7:{s:5:\"title\";s:10:\"Event RSVP\";s:4:\"slug\";s:27:\"twentytwentyfive/event-rsvp\";s:11:\"description\";s:64:\"RSVP for an upcoming event with a cover image and event details.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}s:8:\"keywords\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:4:\"rsvp\";i:2;s:5:\"event\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:18:\"event-schedule.php\";a:5:{s:5:\"title\";s:14:\"Event schedule\";s:4:\"slug\";s:31:\"twentytwentyfive/event-schedule\";s:11:\"description\";s:54:\"A section with specified dates and times for an event.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}s:8:\"keywords\";a:4:{i:0;s:6:\"events\";i:1;s:6:\"agenda\";i:2;s:8:\"schedule\";i:3;s:8:\"lectures\";}}s:19:\"footer-centered.php\";a:5:{s:5:\"title\";s:15:\"Centered footer\";s:4:\"slug\";s:32:\"twentytwentyfive/footer-centered\";s:11:\"description\";s:44:\"Footer with centered site title and tagline.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:18:\"footer-columns.php\";a:5:{s:5:\"title\";s:19:\"Footer with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/footer-columns\";s:11:\"description\";s:45:\"Footer columns with title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:21:\"footer-newsletter.php\";a:5:{s:5:\"title\";s:29:\"Footer with newsletter signup\";s:4:\"slug\";s:34:\"twentytwentyfive/footer-newsletter\";s:11:\"description\";s:51:\"Footer with large site title and newsletter signup.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:17:\"footer-social.php\";a:5:{s:5:\"title\";s:33:\"Centered footer with social links\";s:4:\"slug\";s:30:\"twentytwentyfive/footer-social\";s:11:\"description\";s:49:\"Footer with centered site title and social links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:10:\"footer.php\";a:5:{s:5:\"title\";s:6:\"Footer\";s:4:\"slug\";s:23:\"twentytwentyfive/footer\";s:11:\"description\";s:51:\"Footer columns with logo, title, tagline and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"footer\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/footer\";}}s:16:\"format-audio.php\";a:4:{s:5:\"title\";s:12:\"Audio format\";s:4:\"slug\";s:29:\"twentytwentyfive/format-audio\";s:11:\"description\";s:73:\"An audio post format with an image, title, audio player, and description.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"format-link.php\";a:4:{s:5:\"title\";s:11:\"Link format\";s:4:\"slug\";s:28:\"twentytwentyfive/format-link\";s:11:\"description\";s:77:\"A link post format with a description and an emphasized link for key content.\";s:10:\"categories\";a:1:{i:0;s:28:\"twentytwentyfive_post-format\";}}s:15:\"grid-videos.php\";a:4:{s:5:\"title\";s:16:\"Grid with videos\";s:4:\"slug\";s:28:\"twentytwentyfive/grid-videos\";s:11:\"description\";s:19:\"A grid with videos.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:24:\"grid-with-categories.php\";a:5:{s:5:\"title\";s:20:\"Grid with categories\";s:4:\"slug\";s:37:\"twentytwentyfive/grid-with-categories\";s:11:\"description\";s:41:\"A grid section with different categories.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:19:\"header-centered.php\";a:5:{s:5:\"title\";s:20:\"Centered site header\";s:4:\"slug\";s:32:\"twentytwentyfive/header-centered\";s:11:\"description\";s:52:\"Site header with centered site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:18:\"header-columns.php\";a:5:{s:5:\"title\";s:19:\"Header with columns\";s:4:\"slug\";s:31:\"twentytwentyfive/header-columns\";s:11:\"description\";s:54:\"Site header with site title and navigation in columns.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:22:\"header-large-title.php\";a:5:{s:5:\"title\";s:23:\"Header with large title\";s:4:\"slug\";s:35:\"twentytwentyfive/header-large-title\";s:11:\"description\";s:63:\"Site header with large site title and right-aligned navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:10:\"header.php\";a:5:{s:5:\"title\";s:6:\"Header\";s:4:\"slug\";s:23:\"twentytwentyfive/header\";s:11:\"description\";s:43:\"Site header with site title and navigation.\";s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/template-part/header\";}}s:36:\"heading-and-paragraph-with-image.php\";a:4:{s:5:\"title\";s:45:\"Heading and paragraph with image on the right\";s:4:\"slug\";s:49:\"twentytwentyfive/heading-and-paragraph-with-image\";s:11:\"description\";s:89:\"A two-column section with a heading and paragraph on the left, and an image on the right.\";s:10:\"categories\";a:1:{i:0;s:5:\"about\";}}s:13:\"hero-book.php\";a:5:{s:5:\"title\";s:9:\"Hero book\";s:4:\"slug\";s:26:\"twentytwentyfive/hero-book\";s:11:\"description\";s:66:\"A hero section for the book with a description and pre-order link.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:25:\"hero-full-width-image.php\";a:4:{s:5:\"title\";s:22:\"Hero, full width image\";s:4:\"slug\";s:38:\"twentytwentyfive/hero-full-width-image\";s:11:\"description\";s:68:\"A hero with a full width image, heading, short paragraph and button.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:41:\"hero-overlapped-book-cover-with-links.php\";a:4:{s:5:\"title\";s:38:\"Hero, overlapped book cover with links\";s:4:\"slug\";s:54:\"twentytwentyfive/hero-overlapped-book-cover-with-links\";s:11:\"description\";s:47:\"A hero with an overlapped book cover and links.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:16:\"hero-podcast.php\";a:5:{s:5:\"title\";s:12:\"Hero podcast\";s:4:\"slug\";s:29:\"twentytwentyfive/hero-podcast\";s:11:\"description\";s:0:\"\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}s:8:\"keywords\";a:3:{i:0;s:7:\"podcast\";i:1;s:4:\"hero\";i:2;s:7:\"stories\";}}s:14:\"hidden-404.php\";a:4:{s:5:\"title\";s:3:\"404\";s:4:\"slug\";s:27:\"twentytwentyfive/hidden-404\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"hidden-blog-heading.php\";a:4:{s:5:\"title\";s:19:\"Hidden blog heading\";s:4:\"slug\";s:36:\"twentytwentyfive/hidden-blog-heading\";s:11:\"description\";s:52:\"Hidden heading for the home page and index template.\";s:8:\"inserter\";b:0;}s:17:\"hidden-search.php\";a:4:{s:5:\"title\";s:6:\"Search\";s:4:\"slug\";s:30:\"twentytwentyfive/hidden-search\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:18:\"hidden-sidebar.php\";a:4:{s:5:\"title\";s:7:\"Sidebar\";s:4:\"slug\";s:31:\"twentytwentyfive/hidden-sidebar\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:21:\"hidden-written-by.php\";a:4:{s:5:\"title\";s:10:\"Written by\";s:4:\"slug\";s:34:\"twentytwentyfive/hidden-written-by\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:9:\"logos.php\";a:4:{s:5:\"title\";s:5:\"Logos\";s:4:\"slug\";s:22:\"twentytwentyfive/logos\";s:11:\"description\";s:77:\"Showcasing the podcast\'s clients with a heading and a series of client logos.\";s:10:\"categories\";a:1:{i:0;s:6:\"banner\";}}s:24:\"media-instagram-grid.php\";a:5:{s:5:\"title\";s:14:\"Instagram grid\";s:4:\"slug\";s:37:\"twentytwentyfive/media-instagram-grid\";s:11:\"description\";s:62:\"A grid section with photos and a link to an Instagram profile.\";s:13:\"viewportWidth\";i:1440;s:10:\"categories\";a:3:{i:0;s:5:\"media\";i:1;s:7:\"gallery\";i:2;s:8:\"featured\";}}s:14:\"more-posts.php\";a:5:{s:5:\"title\";s:10:\"More posts\";s:4:\"slug\";s:27:\"twentytwentyfive/more-posts\";s:11:\"description\";s:45:\"Displays a list of posts with title and date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:21:\"overlapped-images.php\";a:4:{s:5:\"title\";s:41:\"Overlapping images and paragraph on right\";s:4:\"slug\";s:34:\"twentytwentyfive/overlapped-images\";s:11:\"description\";s:53:\"A section with overlapping images, and a description.\";s:10:\"categories\";a:2:{i:0;s:5:\"about\";i:1;s:8:\"featured\";}}s:22:\"page-business-home.php\";a:8:{s:5:\"title\";s:17:\"Business homepage\";s:4:\"slug\";s:35:\"twentytwentyfive/page-business-home\";s:11:\"description\";s:28:\"A business homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:20:\"page-coming-soon.php\";a:8:{s:5:\"title\";s:11:\"Coming soon\";s:4:\"slug\";s:33:\"twentytwentyfive/page-coming-soon\";s:11:\"description\";s:96:\"A full-width cover banner that can be applied to a page or it can work as a single landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:15:\"page-cv-bio.php\";a:7:{s:5:\"title\";s:6:\"CV/bio\";s:4:\"slug\";s:28:\"twentytwentyfive/page-cv-bio\";s:11:\"description\";s:36:\"A pattern for a CV/Bio landing page.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"about\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:21:\"page-landing-book.php\";a:8:{s:5:\"title\";s:21:\"Landing page for book\";s:4:\"slug\";s:34:\"twentytwentyfive/page-landing-book\";s:11:\"description\";s:104:\"A landing page for the book with a hero section, pre-order links, locations, FAQs and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:22:\"page-landing-event.php\";a:8:{s:5:\"title\";s:22:\"Landing page for event\";s:4:\"slug\";s:35:\"twentytwentyfive/page-landing-event\";s:11:\"description\";s:87:\"A landing page for the event with a hero section, description, FAQs and call to action.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:24:\"page-landing-podcast.php\";a:8:{s:5:\"title\";s:24:\"Landing page for podcast\";s:4:\"slug\";s:37:\"twentytwentyfive/page-landing-podcast\";s:11:\"description\";s:111:\"A landing page for the podcast with a hero section, description, logos, grid with videos and newsletter signup.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:50:\"page-link-in-bio-heading-paragraph-links-image.php\";a:7:{s:5:\"title\";s:59:\"Link in bio heading, paragraph, links and full-height image\";s:4:\"slug\";s:63:\"twentytwentyfive/page-link-in-bio-heading-paragraph-links-image\";s:11:\"description\";s:84:\"A link in bio landing page with a heading, paragraph, links and a full height image.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:33:\"page-link-in-bio-wide-margins.php\";a:7:{s:5:\"title\";s:48:\"Link in bio with profile, links and wide margins\";s:4:\"slug\";s:46:\"twentytwentyfive/page-link-in-bio-wide-margins\";s:11:\"description\";s:86:\"A link in bio landing page with social links, a profile photo and a brief description.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:3:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";i:2;s:8:\"featured\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}}s:39:\"page-link-in-bio-with-tight-margins.php\";a:8:{s:5:\"title\";s:30:\"Link in bio with tight margins\";s:4:\"slug\";s:52:\"twentytwentyfive/page-link-in-bio-with-tight-margins\";s:11:\"description\";s:90:\"A full-width, full-height link in bio section with an image, a paragraph and social links.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:6:\"banner\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:23:\"page-portfolio-home.php\";a:8:{s:5:\"title\";s:18:\"Portfolio homepage\";s:4:\"slug\";s:36:\"twentytwentyfive/page-portfolio-home\";s:11:\"description\";s:29:\"A portfolio homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:21:\"twentytwentyfive_page\";i:1;s:5:\"posts\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:18:\"page-shop-home.php\";a:8:{s:5:\"title\";s:13:\"Shop homepage\";s:4:\"slug\";s:31:\"twentytwentyfive/page-shop-home\";s:11:\"description\";s:24:\"A shop homepage pattern.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:21:\"twentytwentyfive_page\";}s:8:\"keywords\";a:1:{i:0;s:7:\"starter\";}s:10:\"blockTypes\";a:1:{i:0;s:17:\"core/post-content\";}s:9:\"postTypes\";a:2:{i:0;s:4:\"page\";i:1;s:11:\"wp_template\";}}s:19:\"post-navigation.php\";a:5:{s:5:\"title\";s:15:\"Post navigation\";s:4:\"slug\";s:32:\"twentytwentyfive/post-navigation\";s:11:\"description\";s:29:\"Next and previous post links.\";s:10:\"categories\";a:1:{i:0;s:4:\"text\";}s:10:\"blockTypes\";a:1:{i:0;s:25:\"core/post-navigation-link\";}}s:17:\"pricing-2-col.php\";a:5:{s:5:\"title\";s:18:\"Pricing, 2 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-2-col\";s:11:\"description\";s:88:\"Pricing section with two columns, pricing plan, description, and call-to-action buttons.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:14:\"call-to-action\";}}s:17:\"pricing-3-col.php\";a:4:{s:5:\"title\";s:18:\"Pricing, 3 columns\";s:4:\"slug\";s:30:\"twentytwentyfive/pricing-3-col\";s:11:\"description\";s:100:\"A three-column boxed pricing table designed to showcase services, descriptions, and pricing options.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:18:\"services-3-col.php\";a:4:{s:5:\"title\";s:19:\"Services, 3 columns\";s:4:\"slug\";s:31:\"twentytwentyfive/services-3-col\";s:11:\"description\";s:56:\"Three columns with images and text to showcase services.\";s:10:\"categories\";a:3:{i:0;s:14:\"call-to-action\";i:1;s:6:\"banner\";i:2;s:8:\"services\";}}s:36:\"services-subscriber-only-section.php\";a:4:{s:5:\"title\";s:33:\"Services, subscriber only section\";s:4:\"slug\";s:49:\"twentytwentyfive/services-subscriber-only-section\";s:11:\"description\";s:72:\"A subscriber-only section highlighting exclusive services and offerings.\";s:10:\"categories\";a:2:{i:0;s:14:\"call-to-action\";i:1;s:8:\"services\";}}s:24:\"services-team-photos.php\";a:4:{s:5:\"title\";s:21:\"Services, team photos\";s:4:\"slug\";s:37:\"twentytwentyfive/services-team-photos\";s:11:\"description\";s:59:\"Display team photos in a services section with grid layout.\";s:10:\"categories\";a:3:{i:0;s:6:\"banner\";i:1;s:14:\"call-to-action\";i:2;s:8:\"featured\";}}s:37:\"template-404-vertical-header-blog.php\";a:5:{s:5:\"title\";s:17:\"Right-aligned 404\";s:4:\"slug\";s:50:\"twentytwentyfive/template-404-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:3:\"404\";}}s:30:\"template-archive-news-blog.php\";a:6:{s:5:\"title\";s:17:\"News blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:31:\"template-archive-photo-blog.php\";a:6:{s:5:\"title\";s:18:\"Photo blog archive\";s:4:\"slug\";s:44:\"twentytwentyfive/template-archive-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:30:\"template-archive-text-blog.php\";a:6:{s:5:\"title\";s:17:\"Text blog archive\";s:4:\"slug\";s:43:\"twentytwentyfive/template-archive-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:41:\"template-archive-vertical-header-blog.php\";a:6:{s:5:\"title\";s:21:\"Right-aligned archive\";s:4:\"slug\";s:54:\"twentytwentyfive/template-archive-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:7:\"archive\";}}s:27:\"template-home-news-blog.php\";a:6:{s:5:\"title\";s:14:\"News blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-home-photo-blog.php\";a:6:{s:5:\"title\";s:15:\"Photo blog home\";s:4:\"slug\";s:41:\"twentytwentyfive/template-home-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:38:\"template-home-posts-grid-news-blog.php\";a:5:{s:5:\"title\";s:34:\"News blog with featured posts grid\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-posts-grid-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:27:\"template-home-text-blog.php\";a:6:{s:5:\"title\";s:14:\"Text blog home\";s:4:\"slug\";s:40:\"twentytwentyfive/template-home-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:10:\"front-page\";i:1;s:4:\"home\";}}s:38:\"template-home-vertical-header-blog.php\";a:6:{s:5:\"title\";s:18:\"Right-aligned home\";s:4:\"slug\";s:51:\"twentytwentyfive/template-home-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:40:\"template-home-with-sidebar-news-blog.php\";a:6:{s:5:\"title\";s:22:\"News blog with sidebar\";s:4:\"slug\";s:53:\"twentytwentyfive/template-home-with-sidebar-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:3:{i:0;s:10:\"front-page\";i:1;s:5:\"index\";i:2;s:4:\"home\";}}s:28:\"template-page-photo-blog.php\";a:5:{s:5:\"title\";s:15:\"Photo blog page\";s:4:\"slug\";s:41:\"twentytwentyfive/template-page-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:38:\"template-page-vertical-header-blog.php\";a:5:{s:5:\"title\";s:18:\"Right-aligned page\";s:4:\"slug\";s:51:\"twentytwentyfive/template-page-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:13:\"templateTypes\";a:1:{i:0;s:4:\"page\";}}s:33:\"template-query-loop-news-blog.php\";a:4:{s:5:\"title\";s:20:\"News blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-news-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:34:\"template-query-loop-photo-blog.php\";a:6:{s:5:\"title\";s:16:\"Photo blog posts\";s:4:\"slug\";s:47:\"twentytwentyfive/template-query-loop-photo-blog\";s:11:\"description\";s:54:\"A list of posts, 3 columns, with only featured images.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:33:\"template-query-loop-text-blog.php\";a:4:{s:5:\"title\";s:20:\"Text blog query loop\";s:4:\"slug\";s:46:\"twentytwentyfive/template-query-loop-text-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:44:\"template-query-loop-vertical-header-blog.php\";a:4:{s:5:\"title\";s:24:\"Right-aligned query loop\";s:4:\"slug\";s:57:\"twentytwentyfive/template-query-loop-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:8:\"inserter\";b:0;}s:23:\"template-query-loop.php\";a:5:{s:5:\"title\";s:23:\"List of posts, 1 column\";s:4:\"slug\";s:36:\"twentytwentyfive/template-query-loop\";s:11:\"description\";s:61:\"A list of posts, 1 column, with featured image and post date.\";s:10:\"categories\";a:1:{i:0;s:5:\"query\";}s:10:\"blockTypes\";a:1:{i:0;s:10:\"core/query\";}}s:29:\"template-search-news-blog.php\";a:6:{s:5:\"title\";s:24:\"News blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:30:\"template-search-photo-blog.php\";a:6:{s:5:\"title\";s:25:\"Photo blog search results\";s:4:\"slug\";s:43:\"twentytwentyfive/template-search-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:29:\"template-search-text-blog.php\";a:6:{s:5:\"title\";s:24:\"Text blog search results\";s:4:\"slug\";s:42:\"twentytwentyfive/template-search-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-search-vertical-header-blog.php\";a:6:{s:5:\"title\";s:26:\"Right-aligned blog, search\";s:4:\"slug\";s:53:\"twentytwentyfive/template-search-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:1:{i:0;s:6:\"search\";}}s:40:\"template-single-left-aligned-content.php\";a:6:{s:5:\"title\";s:30:\"Post with left-aligned content\";s:4:\"slug\";s:47:\"twentytwentyfive/post-with-left-aligned-content\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-news-blog.php\";a:6:{s:5:\"title\";s:34:\"News blog single post with sidebar\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-news-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:26:\"template-single-offset.php\";a:6:{s:5:\"title\";s:34:\"Offset post without featured image\";s:4:\"slug\";s:39:\"twentytwentyfive/template-single-offset\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:30:\"template-single-photo-blog.php\";a:6:{s:5:\"title\";s:22:\"Photo blog single post\";s:4:\"slug\";s:43:\"twentytwentyfive/template-single-photo-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:29:\"template-single-text-blog.php\";a:6:{s:5:\"title\";s:21:\"Text blog single post\";s:4:\"slug\";s:42:\"twentytwentyfive/template-single-text-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:40:\"template-single-vertical-header-blog.php\";a:6:{s:5:\"title\";s:25:\"Right-aligned single post\";s:4:\"slug\";s:53:\"twentytwentyfive/template-single-vertical-header-blog\";s:11:\"description\";s:0:\"\";s:13:\"viewportWidth\";i:1400;s:8:\"inserter\";b:0;s:13:\"templateTypes\";a:2:{i:0;s:5:\"posts\";i:1;s:6:\"single\";}}s:22:\"testimonials-2-col.php\";a:5:{s:5:\"title\";s:21:\"2 columns with avatar\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-2-col\";s:11:\"description\";s:42:\"Two columns with testimonials and avatars.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-6-col.php\";a:5:{s:5:\"title\";s:35:\"3 column layout with 6 testimonials\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-6-col\";s:11:\"description\";s:86:\"A section with three columns and two rows, each containing a testimonial and citation.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:22:\"testimonials-large.php\";a:5:{s:5:\"title\";s:32:\"Review with large image on right\";s:4:\"slug\";s:35:\"twentytwentyfive/testimonials-large\";s:11:\"description\";s:46:\"A testimonial with a large image on the right.\";s:10:\"categories\";a:1:{i:0;s:12:\"testimonials\";}s:8:\"keywords\";a:1:{i:0;s:11:\"testimonial\";}}s:13:\"text-faqs.php\";a:6:{s:5:\"title\";s:4:\"FAQs\";s:4:\"slug\";s:26:\"twentytwentyfive/text-faqs\";s:11:\"description\";s:68:\"A FAQs section with a FAQ heading and list of questions and answers.\";s:13:\"viewportWidth\";i:1400;s:10:\"categories\";a:2:{i:0;s:4:\"text\";i:1;s:5:\"about\";}s:8:\"keywords\";a:5:{i:0;s:3:\"faq\";i:1;s:5:\"about\";i:2;s:10:\"frequently\";i:3;s:5:\"asked\";i:4;s:9:\"questions\";}}s:19:\"vertical-header.php\";a:6:{s:5:\"title\";s:20:\"Vertical site header\";s:4:\"slug\";s:32:\"twentytwentyfive/vertical-header\";s:11:\"description\";s:52:\"Vertical site header with site title and navigation.\";s:13:\"viewportWidth\";i:300;s:10:\"categories\";a:1:{i:0;s:6:\"header\";}s:10:\"blockTypes\";a:1:{i:0;s:34:\"core/template-part/vertical-header\";}}}}', 'off');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_postmeta`
--

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `post_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 1, '_edit_lock', '1752294876:1'),
(4, 7, 'origin', 'theme');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_posts`
--

CREATE TABLE `wp_posts` (
  `ID` bigint UNSIGNED NOT NULL,
  `post_author` bigint UNSIGNED NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `post_parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `menu_order` int NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `comment_count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2025-07-12 04:17:51', '2025-07-12 04:17:51', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2025-07-12 04:17:51', '2025-07-12 04:17:51', '', 0, 'http://34.66.246.141/?p=1', 0, 'post', '', 1),
(2, 1, '2025-07-12 04:17:51', '2025-07-12 04:17:51', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://34.66.246.141/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2025-07-12 04:17:51', '2025-07-12 04:17:51', '', 0, 'http://34.66.246.141/?page_id=2', 0, 'page', '', 0),
(3, 1, '2025-07-12 04:17:51', '2025-07-12 04:17:51', '<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we are</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://34.66.246.141.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Comments</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Media</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Cookies</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Embedded content from other websites</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Who we share your data with</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">How long we retain your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p>\n<!-- /wp:paragraph -->\n<!-- wp:paragraph -->\n<p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">What rights you have over your data</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p>\n<!-- /wp:paragraph -->\n<!-- wp:heading -->\n<h2 class=\"wp-block-heading\">Where your data is sent</h2>\n<!-- /wp:heading -->\n<!-- wp:paragraph -->\n<p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p>\n<!-- /wp:paragraph -->\n', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2025-07-12 04:17:51', '2025-07-12 04:17:51', '', 0, 'http://34.66.246.141/?page_id=3', 0, 'page', '', 0),
(4, 0, '2025-07-12 04:19:41', '2025-07-12 04:19:41', '<!-- wp:page-list /-->', 'Navigation', '', 'publish', 'closed', 'closed', '', 'navigation', '', '', '2025-07-12 04:19:41', '2025-07-12 04:19:41', '', 0, 'https://34.66.246.141/?p=4', 0, 'wp_navigation', '', 0),
(5, 1, '2025-07-12 04:28:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2025-07-12 04:28:53', '0000-00-00 00:00:00', '', 0, 'https://34.66.246.141/?p=5', 0, 'post', '', 0),
(6, 1, '2025-07-12 04:29:06', '2025-07-12 04:29:06', '{\"version\": 3, \"isGlobalStylesUserThemeJSON\": true }', 'Custom Styles', '', 'publish', 'closed', 'closed', '', 'wp-global-styles-twentytwentyfive', '', '', '2025-07-12 04:29:06', '2025-07-12 04:29:06', '', 0, 'https://34.66.246.141/?p=6', 0, 'wp_global_styles', '', 0),
(7, 1, '2025-07-12 13:56:37', '2025-07-12 13:56:37', '<!-- wp:template-part {\"slug\":\"header\",\"theme\":\"twentytwentyfive\"} /-->\n\n<!-- wp:group {\"tagName\":\"main\",\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<main class=\"wp-block-group\" style=\"margin-top:var(--wp--preset--spacing--60)\"><!-- wp:heading {\"textAlign\":\"left\",\"level\":1} -->\n<h1 class=\"wp-block-heading has-text-align-left\">Test Data</h1>\n<!-- /wp:heading -->\n\n<!-- wp:query {\"queryId\":0,\"query\":{\"perPage\":10,\"pages\":0,\"offset\":0,\"postType\":\"post\",\"order\":\"desc\",\"orderBy\":\"date\",\"author\":\"\",\"search\":\"\",\"exclude\":[],\"sticky\":\"\",\"inherit\":true,\"taxQuery\":null,\"parents\":[]},\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<div class=\"wp-block-query alignfull\"><!-- wp:post-template {\"align\":\"full\",\"layout\":{\"type\":\"default\"}} -->\n<!-- wp:group {\"align\":\"full\",\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignfull\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:post-featured-image {\"isLink\":true,\"aspectRatio\":\"3/2\"} /-->\n\n<!-- wp:post-title {\"isLink\":true,\"fontSize\":\"x-large\"} /-->\n\n<!-- wp:post-content {\"align\":\"full\",\"fontSize\":\"medium\",\"layout\":{\"type\":\"constrained\"}} /-->\n\n<!-- wp:post-date {\"isLink\":true,\"style\":{\"spacing\":{\"margin\":{\"top\":\"var:preset|spacing|40\"}}},\"fontSize\":\"small\"} /--></div>\n<!-- /wp:group -->\n<!-- /wp:post-template -->\n\n<!-- wp:group {\"style\":{\"spacing\":{\"padding\":{\"top\":\"var:preset|spacing|60\",\"bottom\":\"var:preset|spacing|60\"}}},\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group\" style=\"padding-top:var(--wp--preset--spacing--60);padding-bottom:var(--wp--preset--spacing--60)\"><!-- wp:query-no-results -->\n<!-- wp:paragraph -->\n<p>Sorry, but nothing was found. Please try a search with different keywords.</p>\n<!-- /wp:paragraph -->\n<!-- /wp:query-no-results --></div>\n<!-- /wp:group -->\n\n<!-- wp:group {\"align\":\"wide\",\"layout\":{\"type\":\"constrained\"}} -->\n<div class=\"wp-block-group alignwide\"><!-- wp:query-pagination {\"paginationArrow\":\"arrow\",\"align\":\"wide\",\"layout\":{\"type\":\"flex\",\"justifyContent\":\"space-between\"}} -->\n<!-- wp:query-pagination-previous /-->\n\n<!-- wp:query-pagination-numbers /-->\n\n<!-- wp:query-pagination-next /-->\n<!-- /wp:query-pagination --></div>\n<!-- /wp:group --></div>\n<!-- /wp:query --></main>\n<!-- /wp:group -->\n\n<!-- wp:template-part {\"slug\":\"footer\",\"theme\":\"twentytwentyfive\"} /-->', 'Blog Home', 'Displays the latest posts as either the site homepage or as the \"Posts page\" as defined under reading settings. If it exists, the Front Page template overrides this template when posts are shown on the homepage.', 'publish', 'closed', 'closed', '', 'home', '', '', '2025-07-12 13:56:37', '2025-07-12 13:56:37', '', 0, 'https://34.66.246.141/?p=7', 0, 'wp_template', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_termmeta`
--

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_terms`
--

CREATE TABLE `wp_terms` (
  `term_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `term_group` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'twentytwentyfive', 'twentytwentyfive', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_relationships`
--

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `term_order` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(6, 2, 0),
(7, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_term_taxonomy`
--

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint UNSIGNED NOT NULL,
  `term_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `parent` bigint UNSIGNED NOT NULL DEFAULT '0',
  `count` bigint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'wp_theme', '', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_usermeta`
--

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_520_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', ''),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:\"c18b6b2a14ff3ffa4705138d517e3cf9a3ef23c665fca31e6e31e704e32a3202\";a:4:{s:10:\"expiration\";i:1752467331;s:2:\"ip\";s:13:\"170.245.50.70\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36\";s:5:\"login\";i:1752294531;}s:64:\"a281c8dd6b3ddba932772dccb79ca423844396d199ab9edf26bf1a5050e2098f\";a:4:{s:10:\"expiration\";i:1752501241;s:2:\"ip\";s:13:\"170.245.50.70\";s:2:\"ua\";s:111:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36\";s:5:\"login\";i:1752328441;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '5'),
(18, 1, 'community-events-location', 'a:1:{s:2:\"ip\";s:12:\"170.245.50.0\";}'),
(19, 1, 'wp_persisted_preferences', 'a:4:{s:4:\"core\";a:1:{s:26:\"isComplementaryAreaVisible\";b:1;}s:14:\"core/edit-post\";a:1:{s:12:\"welcomeGuide\";b:0;}s:9:\"_modified\";s:24:\"2025-07-12T13:56:24.630Z\";s:14:\"core/edit-site\";a:1:{s:12:\"welcomeGuide\";b:0;}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wp_users`
--

CREATE TABLE `wp_users` (
  `ID` bigint UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT '',
  `user_status` int NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Volcado de datos para la tabla `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$wp$2y$10$MKbGHp3UT8/F/fpwm..2SeU7eLW/5ZOvJDcs2V7dNZ/ZaEVuZWOAO', 'admin', 'guidoriosciaffaroni@gmail.com', 'http://34.66.246.141', '2025-07-12 04:17:50', '', 0, 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_comments`
--
ALTER TABLE `wp_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indices de la tabla `wp_links`
--
ALTER TABLE `wp_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indices de la tabla `wp_options`
--
ALTER TABLE `wp_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indices de la tabla `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_posts`
--
ALTER TABLE `wp_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indices de la tabla `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_terms`
--
ALTER TABLE `wp_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indices de la tabla `wp_term_relationships`
--
ALTER TABLE `wp_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indices de la tabla `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indices de la tabla `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indices de la tabla `wp_users`
--
ALTER TABLE `wp_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `wp_commentmeta`
--
ALTER TABLE `wp_commentmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_comments`
--
ALTER TABLE `wp_comments`
  MODIFY `comment_ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `wp_links`
--
ALTER TABLE `wp_links`
  MODIFY `link_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_options`
--
ALTER TABLE `wp_options`
  MODIFY `option_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT de la tabla `wp_postmeta`
--
ALTER TABLE `wp_postmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `wp_posts`
--
ALTER TABLE `wp_posts`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `wp_termmeta`
--
ALTER TABLE `wp_termmeta`
  MODIFY `meta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `wp_terms`
--
ALTER TABLE `wp_terms`
  MODIFY `term_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `wp_term_taxonomy`
--
ALTER TABLE `wp_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `wp_usermeta`
--
ALTER TABLE `wp_usermeta`
  MODIFY `umeta_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `wp_users`
--
ALTER TABLE `wp_users`
  MODIFY `ID` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
