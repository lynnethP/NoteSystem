-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-03-2023 a las 19:18:22
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `higienes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id_accesos` int(20) NOT NULL,
  `id_rol` int(20) NOT NULL,
  `id_modulo` int(20) NOT NULL,
  `id_permiso` int(20) NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id_accesos`, `id_rol`, `id_modulo`, `id_permiso`, `estatus`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 1),
(3, 1, 1, 3, 1),
(4, 1, 1, 4, 1),
(5, 1, 2, 1, 1),
(6, 1, 2, 2, 1),
(7, 1, 2, 3, 1),
(8, 1, 2, 4, 1),
(9, 1, 3, 1, 1),
(10, 1, 3, 2, 1),
(11, 1, 3, 3, 1),
(12, 1, 3, 4, 1),
(13, 1, 4, 1, 1),
(14, 1, 4, 2, 1),
(15, 1, 4, 3, 1),
(16, 1, 4, 4, 1),
(17, 1, 5, 1, 1),
(18, 1, 5, 2, 1),
(19, 1, 5, 3, 1),
(20, 1, 5, 4, 1),
(21, 1, 6, 1, 1),
(22, 1, 6, 2, 1),
(23, 1, 6, 3, 1),
(24, 1, 6, 4, 1),
(25, 1, 7, 1, 1),
(26, 1, 7, 2, 1),
(27, 1, 7, 3, 1),
(28, 1, 7, 4, 1),
(29, 1, 8, 1, 1),
(30, 1, 8, 2, 1),
(31, 1, 8, 3, 1),
(32, 1, 8, 4, 1),
(33, 1, 9, 1, 1),
(34, 1, 9, 2, 1),
(35, 1, 9, 3, 1),
(36, 1, 9, 4, 1),
(37, 1, 10, 1, 1),
(38, 1, 10, 2, 1),
(39, 1, 10, 3, 1),
(40, 1, 10, 4, 1),
(41, 1, 11, 1, 1),
(42, 1, 11, 2, 1),
(43, 1, 11, 3, 1),
(44, 1, 11, 4, 1),
(45, 1, 12, 1, 1),
(46, 1, 12, 2, 1),
(47, 1, 12, 3, 1),
(48, 1, 12, 4, 1),
(49, 1, 13, 1, 1),
(50, 1, 13, 2, 1),
(51, 1, 13, 3, 1),
(52, 1, 13, 4, 1),
(53, 1, 14, 1, 1),
(54, 1, 14, 2, 1),
(55, 1, 14, 3, 1),
(56, 1, 14, 4, 1),
(57, 1, 15, 1, 1),
(58, 1, 15, 2, 1),
(59, 1, 15, 3, 1),
(60, 1, 15, 4, 1),
(61, 1, 16, 1, 1),
(62, 1, 16, 2, 1),
(63, 1, 16, 3, 1),
(64, 1, 16, 4, 1),
(77, 2, 1, 1, 1),
(78, 2, 1, 2, 1),
(79, 2, 1, 3, 1),
(80, 2, 1, 4, 1),
(81, 2, 2, 1, 1),
(82, 2, 2, 2, 1),
(83, 2, 2, 3, 1),
(84, 2, 2, 4, 1),
(85, 2, 3, 1, 1),
(86, 2, 3, 2, 1),
(87, 2, 3, 3, 1),
(88, 2, 3, 4, 1),
(89, 2, 4, 1, 1),
(90, 2, 4, 2, 1),
(91, 2, 4, 3, 1),
(92, 2, 4, 4, 1),
(93, 2, 5, 1, 1),
(94, 2, 5, 2, 1),
(95, 2, 5, 3, 1),
(96, 2, 5, 4, 1),
(97, 2, 6, 1, 1),
(98, 2, 6, 2, 1),
(99, 2, 6, 3, 1),
(100, 2, 6, 4, 1),
(101, 2, 7, 1, 1),
(102, 2, 7, 2, 1),
(103, 2, 7, 3, 1),
(104, 2, 7, 4, 1),
(105, 2, 8, 1, 1),
(106, 2, 8, 2, 1),
(107, 2, 8, 3, 1),
(108, 2, 8, 4, 1),
(109, 2, 9, 1, 1),
(110, 2, 9, 2, 1),
(111, 2, 9, 3, 1),
(112, 2, 9, 4, 1),
(113, 2, 10, 1, 1),
(114, 2, 10, 2, 1),
(115, 2, 10, 3, 1),
(116, 2, 10, 4, 1),
(117, 2, 12, 1, 1),
(118, 2, 12, 2, 1),
(119, 2, 12, 3, 1),
(120, 2, 12, 4, 1),
(121, 3, 8, 2, 1),
(122, 4, 7, 1, 1),
(123, 4, 7, 2, 1),
(124, 4, 7, 3, 1),
(125, 4, 7, 4, 1),
(126, 4, 8, 1, 1),
(127, 4, 8, 2, 1),
(128, 4, 8, 3, 1),
(129, 4, 8, 4, 1),
(130, 4, 10, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `cedula_alumno` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_alumno` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_alumno` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_alumno` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`cedula_alumno`, `nombre_alumno`, `apellido_alumno`, `trayecto_alumno`, `estatus`) VALUES
('05787285', 'Ivo De Jesus', 'Segovia Villegas', '3', 1),
('07359667', 'Elio Andres', 'Osechas Guerra', '3', 1),
('12023810', 'Yris Nexi', 'Torin Quintana', '3', 1),
('12278410', 'Argenis Eduardo', 'Fuentes Zavala', '3', 1),
('12346649', 'Camelia Leonor', 'Mercado Estevez', '1', 1),
('12669401', 'Daniel Alexander', 'San Ignacio Urdaneta', '1', 1),
('13032697', 'Maria Esther', 'Mujica Rosendo', '3', 1),
('13036074', 'Yireima Del Carmen', 'Martinez Torrealba', '3', 1),
('13264251', 'Richard Antonio', 'Aldana Torrealba', '4', 1),
('14031622', 'Kelymar Del Carmen', 'Virguez Arrieta', '1', 1),
('14513542', 'Marly Coromoto', 'Higuera Lopez', '3', 1),
('14590758', 'Jackson  Emigdio', 'Mateo Mogollon', '3', 1),
('14760449', 'Heidi Margarita', 'Yepez Osal', '3', 1),
('15229143', 'Ricardo Antonio', 'Amache Sira', '3', 1),
('15446339', 'Yorbin Javier', 'Perez Catari', '3', 1),
('15482467', 'Lisbeth Coromoto', 'Colmenarez Naranjo', '3', 1),
('15732561', 'Jose Manuel', 'Hernandez Alvarado', '3', 1),
('16736117', 'Evelyn Josefina', 'Guedez Colmenarez', '1', 1),
('16794591', 'Jackeline Del Carmen', 'Peraza Hernandez', '3', 1),
('16867504', 'Nestor Luis', 'Rodriguez Samuel', '3', 1),
('16898818', 'Hermes Alejandro', 'Valles Galeno', '1', 1),
('17379196', 'Gelisa Yoelin', 'Beaucicot Hernandez', '3', 1),
('17380052', 'Andy Yixon', 'Dorta Saavedra', '4', 1),
('17380408', 'Italo Eduardo', 'Crespo Perez', '3', 1),
('17380419', 'Cecilio Antonio', 'Rodriguez Sanchez', '1', 1),
('17573748', 'Leonel Alfonso', 'Mendez Araque', '1', 1),
('17574088', 'Rafael Alberto', 'Pernalete Garcia', '1', 1),
('17626769', 'Kenian Beatriz', 'Ortiz Gonzalez', '3', 1),
('17859482', 'Elsy Marina', 'Vizcaya Colina', '1', 1),
('18059528', 'Mildred Jackeline', 'Carreño Rodriguez', '3', 1),
('18421151', 'Ignacio Emisael', 'Suarez Peña', '1', 1),
('19106390', 'Yeckson Jose', 'Marchan Canelon', '3', 1),
('19241105', 'Joseph Kerenskin', 'Morillo Bastidas', '3', 1),
('19483057', 'Dorangela', 'Urdaneta Alvarez', '2', 1),
('19591195', 'Keila Carolina', 'Cordero Mendoza', '1', 1),
('19828762', 'Joseph Abraham', 'Marmol Marmol', '3', 1),
('20009345', 'Marialejandra', 'López Giménez', '1', 1),
('20016633', 'Naibeth Carolina', 'Palmera Querales', '1', 1),
('20045024', 'Barbara Someidy', 'Alvarado Chavez', '3', 1),
('20189609', 'Gesmary Maryaleth', 'Perez Pargas', '1', 1),
('20234290', 'Héctor Ricardo', 'Contreras Torres', '3', 1),
('20237123', 'Rosalba Salvita', 'Torrealba Villamizar', '3', 1),
('20321693', 'Monica Coromoto', 'Garcia Garcia', '3', 1),
('20351575', 'Yesenia Valentina', 'Martinez Manzano', '2', 1),
('20472224', 'Ritder Jose', 'Montero Suarez', '3', 1),
('20473487', 'Irene Carolina', 'Carreño Rodriguez', '3', 1),
('20668100', 'Karla Carolina', 'Piña Adjunta', '1', 1),
('20809464', 'Maria Evelyn', 'Campos Ramirez', '1', 1),
('20929586', 'Estefany Daniela', 'Lucena Figueroa', '3', 1),
('20929799', 'Yonathan Jesus', 'Vargas Bracho', '3', 1),
('21125524', 'Rafael Felipe', 'Suarez Mendoza', '4', 1),
('21142765', 'Jose Manuel', 'Suarez Pineda', '3', 1),
('21143989', 'Mireilys Yaivirith', 'Colmenarez Volcanes', '1', 1),
('21243104', 'Katryn Roisbeth', 'Rodriguez Perez', '3', 1),
('21459778', 'Jhosimar Yuraisbeth', 'Salon Salon', '1', 1),
('21506407', 'Doriamnys Joselyn', 'Arjona Reyes', '3', 1),
('21726768', 'Rafael Eduardo', 'Guedez Camejo', '1', 1),
('21726875', 'Dacsony Daniel', 'Zapata Ponce', '2', 1),
('22181397', 'Heriberly Patricia', 'Pereira Morillo', '1', 1),
('22189205', 'Yohelis Rosana', 'Perez Perez', '3', 1),
('22190797', 'Daniela Andreina', 'Romero Tua', '1', 1),
('22190822', 'Ludy Nohemi', 'Perez Torres', '3', 1),
('22200273', 'Karlha Jennissy', 'Graterol Acosta', '1', 1),
('22200606', 'Ervis Yhoandry', 'Galindez Garcia', '3', 1),
('22262565', 'Liliana Coromoto', 'Medina Alvarado', '3', 1),
('22262954', 'Jose Gregorio', 'Rivero Guevara', '1', 1),
('22268744', 'Maria Victoria', 'Perez Alvarado', '3', 1),
('22275490', 'Dubraska Del Carmen', 'Peraza Gil', '4', 1),
('22301153', 'Leidy Laura', 'Linarez Colmenarez', '3', 1),
('22329093', 'Dannelys Kysbel', 'Suarez Leal', '3', 1),
('22332809', 'Jeimar Isabel', 'Perez Zavarce', '4', 1),
('23488197', 'Karla María', 'Lobo Alejos', '3', 1),
('23488905', 'Jorge Luis', 'Rivero Valera', '3', 1),
('23537673', 'Yudarly Atzara', 'Marcano Segura', '3', 1),
('23553977', 'Yasmireth Carolina', 'Rodriguez Rodriguez', '3', 1),
('23572938', 'Genesis Ninguno', 'Segovia Olivar', '2', 1),
('23813020', 'Elvis Jose', 'Peña Perez', '1', 1),
('23833006', 'Elimer  Franchesca', 'Duran  Castillo', '3', 1),
('23833582', 'Franklin Javier', 'Rodriguez Martinez', '1', 1),
('23836481', 'Lisnay Yonayda', 'Perez Colmenarez', '1', 1),
('23846916', 'Franmary Graciela', 'Rivas Campos', '1', 1),
('23850416', 'Jean Josue', 'Martinez Sivira', '3', 1),
('23850558', 'Angel Jose', 'Lizcano Primera', '3', 1),
('23917833', 'María Alejandra', 'Aular Chirinos', '3', 1),
('24155221', 'Yahin Jose', 'Alvarez Suarez', '3', 1),
('24155394', 'Ivan Alexander', 'Silva Suarez', '4', 1),
('24156839', 'Dulce Mayerlin', 'Atacho Espinoza', '4', 1),
('24157778', 'Miguel Arturo', 'Zambrano Herrera', '2', 1),
('24158482', 'Naibelys Paola', 'Escalona Guasimucaro', '1', 1),
('24160658', 'Victor Junior', 'Jimenez Gonzalez', '3', 1),
('24162432', 'Antonio De Jesus', 'Rodriguez Castillo', '1', 1),
('24325718', 'Richar David', 'Quero Arteaga', '3', 1),
('24326463', 'Wanda Joelys', 'Gutiérrez Falcón', '3', 1),
('24353119', 'Yilbelis Coromoto', 'Martinez Martinez', '4', 1),
('24385111', 'Dannys Alfredo', 'Tua Tua', '3', 1),
('24397893', 'Yaiselis Greimar', 'Vargas Rodriguez', '1', 1),
('24418470', 'Diego Pastor', 'Mújica Peraza', '3', 1),
('24550130', 'Meiralith Pastora', 'Baudin Romero', '1', 1),
('24550321', 'Roismar Alejandra', 'Mogollon Chirinos', '3', 1),
('24613886', 'Luis  Fernando', 'Pargas Matheus', '3', 1),
('24925628', 'Danyelo Jesus', 'Villanueva Delgado', '2', 1),
('24928079', 'Mariarlys Jose', 'Montilla Lopez', '3', 1),
('24989515', 'Adel Rosangela', 'Ramos Yepez', '1', 1),
('24990010', 'Wileidy Cristina', 'Torres Flores', '3', 1),
('25141603', 'Virsalith De Jesus', 'Guedez Chavez', '1', 1),
('25143277', 'Florielbys Nazareth', 'Almao Camacaro', '1', 1),
('25403314', 'César Augusto', 'Yánez Colmenarez', '1', 1),
('25403600', 'Emily Carolina', 'Ortiz Mendoza', '3', 1),
('25421667', 'Haisbel Yoelimar', 'Abad Guedez', '1', 1),
('25433067', 'Scarlet Massiel', 'Arrieche Meléndez', '1', 1),
('25442453', 'Yonaiker Javier', 'Chambuco Mendoza', '3', 1),
('25474327', 'Adriana Karina', 'Guédez Vargas', '3', 1),
('25513468', 'Wanda Maria', 'Principal Rojas', '1', 1),
('25571829', 'Pedro Jose', 'Gomez Yepez', '3', 1),
('25627218', 'Pedro Luis', 'Freitez Colmenarez', '1', 1),
('25630466', 'Reimary Josnely', 'Barcos Rodriguez', '4', 1),
('25638923', 'Catherine Del Carmen', 'Partipilo Daza', '3', 1),
('25753357', 'Rodmary Carolina', 'Rodriguez Rojas', '1', 1),
('25791618', 'Sibel Guadalupe', 'Melendez Hernandez', '1', 1),
('25856528', 'Carlos Jesus', 'Ramos Castillo', '1', 1),
('25857222', 'Rafael Ramon', 'Vivas Ramirez', '3', 1),
('25857600', 'Isneidis Yenire', 'Garcia Freitez', '3', 1),
('25961508', 'Carelis Carola', 'Sanchez Rivero', '1', 1),
('25971462', 'Maria De Los Angeles', 'Medina Quintero', '4', 1),
('26006254', 'Maria Yohana', 'Rojas Hernandez', '1', 1),
('26076292', 'Omar De Jesus', 'Torrellas Molina', '3', 1),
('26076972', 'Evelyn Yannery', 'Diaz Colmenarez', '4', 1),
('26238105', 'Daniela Maria', 'Amaro Mujica', '1', 1),
('26260221', 'Altair Sarahi', 'Perez Barradas', '3', 1),
('26305726', 'Stefany Maria', 'Alvarado Rodriguez', '1', 1),
('26336783', 'Engerber Gabriel', 'Leal Utrera', '1', 1),
('26357078', 'Dailyn Betzabeth', 'Mendoza Aguilar', '1', 1),
('26358018', 'Marioly Katherine', 'Basabe Peralta', '3', 1),
('26370091', 'Blanca Mariana', 'Medina Salom', '3', 1),
('26370490', 'Paola Carolina', 'Aguero Colmenarez', '3', 1),
('26398233', 'Anthony Daniel', 'Suarez Colmenarez', '3', 1),
('26398376', 'Gregseth Rotzinger', 'Rodriguez Sibada', '1', 1),
('26487568', 'Ambar Daniela', 'Valera Perez', '2', 1),
('26502530', 'Anggelo D Janier', 'Galazzo Lopez', '1', 1),
('26540740', 'Nathaly Milagros', 'Rodriguez Yepez', '3', 1),
('26556674', 'Carlos Javier', 'Monsalve Marquez', '1', 1),
('26561931', 'Carlos Eduardo', 'Torres Fernandez', '4', 1),
('26577429', 'Enmanuel Armando', 'Vivas Torres', '2', 1),
('26584842', 'Krisbely Eugenia', 'Montes Marin', '1', 1),
('26644449', 'Yisel Nataly', 'Rodriguez Alvarado', '3', 1),
('26668677', 'Yohandry Valerys', 'Paez Aldana', '4', 1),
('26712455', 'Karla Jose', 'Colmenarez Castellanos', '1', 1),
('26750621', 'Victoria Anyurith', 'Davila Rivas', '1', 1),
('26750721', 'Francis Antonieta', 'Castillo Sangronis', '3', 1),
('26799164', 'Johnniel Joalver', 'Vasquez Rodriguez', '3', 1),
('26800684', 'Andreina Yenireth', 'Martinez Hernandez', '3', 1),
('26886513', 'Alirio Jose', 'Perez Montaño', '1', 1),
('26898084', 'Alexander Manuel', 'Aguilar Colmenares', '3', 1),
('26941019', 'Nailibeth Maria', 'Rivero Carrasco', '3', 1),
('26964475', 'Michelle Stefhany', 'Quintero Gimenez', '1', 1),
('26964485', 'Mariana Alejandra', 'Rodriguez Berrios', '3', 1),
('26964743', 'Nais Takary', 'Cabrera Ruiz', '1', 1),
('26976697', 'Daniel Alejandro', 'Gonzalez Velasquez', '4', 1),
('26976766', 'Neliannis Yuraia', 'Rodriguez Dominguez', '1', 1),
('27085726', 'Greidy Mariana', 'Peraza Colmenarez', '3', 1),
('27193391', 'Nestor Omar', 'Heredia Rodriguez', '3', 1),
('27212841', 'Emeli Elianny', 'Betancourt Zambrano', '1', 1),
('27217754', 'Dariannys Josefina', 'Vargas Martinez', '2', 1),
('27250073', 'Ketsis Josefina', 'Ramos Escalona', '1', 1),
('27250667', 'Alejandro Antonio', 'Amaya Navas', '1', 1),
('27290217', 'Jose Manuel', 'Balza  Barroeta', '1', 1),
('27290829', 'Ivana Maria', 'Freitez Rodriguez', '1', 1),
('27349269', 'Carlian Elienait', 'Chirinos Rodriguez', '4', 1),
('27388907', 'Luis David', 'Lopez Garcia', '3', 1),
('27397229', 'Adrianys Alejandry', 'Cordero Sira', '1', 1),
('27411146', 'Michele Antonio', 'Fiore Peña', '4', 1),
('27436972', 'Eddimar Nohemi', 'Diaz Sanchez', '3', 1),
('27452890', 'Wendy Olimar', 'Gonzalez Veliz', '4', 1),
('27479391', 'Brian Jose', 'Garcia Dominguez', '1', 1),
('27524263', 'Leoanny Arismar', 'Navarro Rodriguez', '1', 1),
('27524346', 'Kelly Estefania', 'Rivas Cordero', '1', 1),
('27524468', 'Yoscairy Andreina', 'Medina Suarez', '3', 1),
('27554471', 'Rosbeglis  Damelys', 'Lopez Rosendo', '1', 1),
('27585924', 'Jose Alejandro', 'Rivero Sierra', '1', 1),
('27586008', 'Wilmer Jose', 'Valenzuela Freitez', '2', 1),
('27586609', 'Leydimar Anais', 'Silva Peraza', '3', 1),
('27617542', 'Lisny Maria', 'Alvarado Betancourt', '1', 1),
('27617613', 'Reinaldo Jose', 'Martinez Rivas', '2', 1),
('27617836', 'Juanymar Haidellys', 'Moreno Sequera', '1', 1),
('27629364', 'Angeles Fabiola', 'Jimenez Lucena', '1', 1),
('27648861', 'Enghely  Alejandria', 'Ledezma  Diaz', '4', 1),
('27666123', 'Dahimar Del Carmen', 'Rodriguez Silva', '1', 1),
('27666883', 'Jose Leonardo', 'Linarez Suarez', '2', 1),
('27737767', 'Loriangely Adrianys', 'Sequera Escalona', '3', 1),
('27738841', 'Zoraida Del Carmen', 'Mendoza Liscano', '1', 1),
('27759098', 'Eduard Jesus', 'Castillo Franklin', '1', 1),
('27759364', 'Edith Ramona', 'Perez Colmenares', '1', 1),
('27759611', 'Emnimar Andrea', 'Soteldo Zerpa', '3', 1),
('27760491', 'Santiago Rafael', 'Parada Camacaro', '1', 1),
('27816190', 'Alma Veronica', 'Medina Zozaya', '1', 1),
('27827122', 'Maria De Los Angeles', 'Gutierrez Garcia', '3', 1),
('27828006', 'Edelteana Sn', 'Montero Carrasquero', '1', 1),
('27829899', 'Yessica Patricia', 'Mendoza Blanco', '3', 1),
('27831006', 'Jose', 'Fuentes', '3', 1),
('27868200', 'Roibert Gabriel', 'Moreno Garrido', '1', 1),
('27868383', 'Javier Alexander', 'Rivas Mendoza', '1', 1),
('27882710', 'Osglee Katiuska', 'Manbel Vásquez', '1', 1),
('27883607', 'Jesilmar Yaneth', 'Melendez Medina', '1', 1),
('27987936', 'Adriannys Mariana', 'Freitez Silva', '1', 1),
('28002138', 'Reyver Daniel', 'Ojeda Nuñez', '1', 1),
('28019344', 'Josepht David', 'Peña Franco', '1', 1),
('28019347', 'Carmen Elisa', 'Peña Franco', '1', 1),
('28019552', 'Saindry Nicol', 'Daza Silva', '1', 1),
('28019593', 'Gusnelly Alejandra', 'Barrios Vargas', '3', 1),
('28020149', 'Maria Gabriela', 'Diaz Medina', '2', 1),
('28020173', 'Carlos Daniel', 'Leon Hernández', '1', 1),
('28020528', 'Karelys Andreina', 'Aranguren Alejos', '3', 1),
('28021462', 'Yenifer Fragnimar', 'Adan Vargas', '1', 1),
('28021836', 'Daniela Vanessa', 'Gimenez Torres', '1', 1),
('28021915', 'Samantha', 'Berti Rios', '1', 1),
('28055726', 'Arelys Alexandra', 'Camacaro Mogollon', '1', 1),
('28055934', 'Jesus David', 'Maita Alvarez', '1', 1),
('28114664', 'Henrich Zbigniewf', 'Szczurek Vargas', '4', 1),
('28114837', 'Grachel Anais', 'Toussaint Pernalete', '1', 1),
('28114964', 'Paulimar Del Carmen', 'Perez Escobar', '1', 1),
('28127941', 'Genesis Alexandra', 'López Ortiz', '2', 1),
('28150500', 'Genesis Alejandra', 'Viera Escalona', '2', 1),
('28165974', 'Yoselin Josefina', 'Gonzalez Chavez', '3', 1),
('28204595', 'Manuel Alejandro', 'Telleria Peroza', '1', 1),
('28256888', 'Heritmar Yoeslyn', 'Alvarado Navas', '3', 1),
('28259658', 'Maria De Los Angeles', 'Burgos Gonzalez', '3', 1),
('28286679', 'Yeily Mariangel', 'Rodriguez  Gimenez', '3', 1),
('28286997', 'Ali Andres', 'Perez  Dugarte', '1', 1),
('28297960', 'Kevin Alejandro', 'Pirela Valderrama', '1', 1),
('28381909', 'Greidys Orianna', 'Ure Jimenez', '2', 1),
('28399194', 'Gloriannys Andrea', 'Vargas Escalona', '4', 1),
('28406541', 'Veruska Daniela', 'Lopez Lameda', '2', 1),
('28419255', 'José Alfredo', 'Gutiérrez Rivero', '1', 1),
('28425074', 'Carlos Alberto', 'Sandoval Vasquez', '1', 1),
('28425163', 'Jesus Reinaldo', 'Azuaje Romero', '1', 1),
('28454171', 'Daniel Alejandro', 'Molina Morillo', '1', 1),
('28493551', 'Saraly De Jesus', 'Melendez Flores', '1', 1),
('28493599', 'Angel David', 'Gutierrez Gonzalez', '2', 1),
('28566015', 'Selenia Del Carmen', 'Hernandez Rosales', '1', 1),
('28577290', 'Ashley Ninoska', 'Castillo Caripa', '1', 1),
('28591644', 'Noriana Valentina', 'López Córdova', '1', 1),
('28653762', 'Abraham David', 'Jimenez Gomez', '3', 1),
('28653985', 'Eyitzath Lelibeth', 'Rodriguez Rodriguez', '1', 1),
('28667508', 'Camila Marilin', 'Mogollon  Castillo', '1', 1),
('28732056', 'Michelle Getsemani', 'Gonzalez Lucena', '1', 1),
('29506929', 'Stephaly Fernanda', 'Peña Garcia', '1', 1),
('29517646', 'Alberto Jesus', 'Rodriguez Saavedra', '3', 1),
('29531699', 'Diego Alejandro', 'Garcia Dominguez', '1', 1),
('29531941', 'Huralit Gabriela', 'Mendoza Espinoza', '1', 1),
('29623858', 'Jesus David', 'Valenzuela Daza', '1', 1),
('29673344', 'Daimary Raxiel', 'Rodriguez Hernandez', '1', 1),
('29707357', 'Carlos Alejandro', 'Rodriguez Suarez', '3', 1),
('29737725', 'Giovanna Dariana', 'Mendoza Villanueva', '2', 1),
('29778296', 'Keylimar Jorjelys', 'Gomez Roa', '1', 1),
('29805035', 'Aranza Victoria', 'Palacios Peña', '1', 1),
('29805811', 'Barbara Katherina', 'Delgado Perez', '1', 1),
('29805959', 'Maria Fabiola', 'Arroyo Chavez', '1', 1),
('29868285', 'Hildanis Michelle', 'Hernández Escobar', '1', 1),
('29873599', 'Julianny Carolina', 'Benitez Araujo', '1', 1),
('29873681', 'Luciriamny Angelica', 'Lopez Ramos', '1', 1),
('29880046', 'Joriel Felipe', 'Herrera Mendoza', '1', 1),
('29895603', 'Osyarly Del Valle', 'Torrealba Santiago', '2', 1),
('29896222', 'Arianna Gabriela', 'Carrasco Perozo', '1', 1),
('29909672', 'Andrea Dalay', 'Caripa Gil', '1', 1),
('29957240', 'Maria Jose', 'Mendoza Hernandez', '1', 1),
('29972507', 'Leukar Andreina', 'Maldonado Garcia', '1', 1),
('29997284', 'Mariangel Coromoto', 'Alvarado Devies', '1', 1),
('29997745', 'Alexa Gabriela', 'Riera Rodriguez', '1', 1),
('29997933', 'Dayrelis Oriana', 'Ortiz Diaz', '1', 1),
('29997996', 'Yexenia Alejandra', 'Melendez Chirinos', '1', 1),
('30014332', 'Domini Willianny', 'Perez Castillo', '1', 1),
('30014941', 'Manuel Alejandro', 'Mendoza Mendoza', '2', 1),
('30019949', 'Marialba Andrea', 'Rodriguez Zerpa', '1', 1),
('30025508', 'Williannys Sinais', 'Duran Ruiz', '1', 1),
('30042882', 'Yulianny Carolina', 'Gonzalez Ocanto', '1', 1),
('30071684', 'Maria  Virginia', 'Lucena Rincones', '1', 1),
('30071916', 'Alexander Enmanuel', 'Rodriguez Gonzalez', '1', 1),
('30072006', 'Heilyn Ariangel', 'Freitez Mosquera', '2', 1),
('30105851', 'Arianna Paola', 'Torres Riera', '1', 1),
('30125529', 'Jayker Alfredo', 'Uranga Gonzalez', '1', 1),
('30128198', 'Aleander Jose', 'Rosendo Hernandez', '1', 1),
('30130092', 'Ariannys Yiseth', 'Mendoza Suarez', '1', 1),
('30130398', 'Asly Mishell', 'Rodriguez Valera', '2', 1),
('30204766', 'Katerin Vivinana', 'Hernandez Pacheco', '1', 1),
('30233789', 'Victor Artuto', 'Nelo Ramos', '1', 1),
('30304308', 'Daviannys Andreina', 'Ladino Angulo', '1', 1),
('30318011', 'Scarlett Beatriz', 'Patiño Oropeza', '1', 1),
('30352820', 'Maria Jose', 'Perez Ramos', '1', 1),
('30352909', 'Jereslin Andreina', 'Ramirez Bullones', '1', 1),
('30353140', 'Elyimar Del Valle', 'Andazora Domoromo', '2', 1),
('30376563', 'Yodeimar Claudisbe', 'Perez Avendaño', '1', 1),
('30416805', 'Jeisis Yoselyn', 'Yanez Rivero', '1', 1),
('30485158', 'Dannelys Estefany', 'Arroyo Boquillon', '2', 1),
('30485269', 'Wilmary Katherine', 'Rodriguez Abreu', '1', 1),
('30560561', 'Franco Kenneth', 'Gonzalez Mendoza', '1', 1),
('30615904', 'Mckensy Lucia', 'Pacheco Centella', '2', 1),
('30621621', 'Camila Michell', 'Mujica Peña', '3', 1),
('30621694', 'Paola Gissethl', 'Rivero Rivero', '1', 1),
('30759265', 'Rismary Jose', 'Sequera  Reyes', '1', 1),
('30868143', 'Samantha Vanessa', 'Briceño Lopez', '1', 1),
('30873044', 'Orianny Fabiola', 'Uzcategui Hernandez', '2', 1),
('31026129', 'Jesus Daniel', 'Aranguren Apostol', '1', 1),
('31041718', 'Wilson David', 'Carreño Diaz', '1', 1),
('31400939', 'Efrain Antonio', 'Ramos Alvarado', '1', 1),
('31402507', 'Miguel Amilcar', 'Suarez Riera', '1', 1),
('32790740', 'Henry Francisco', 'Cordero Alvarado', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id_bitacora` int(20) NOT NULL,
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulo_bitacora` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion_bitacora` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_bitacora` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_bitacora` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id_bitacora`, `cedula_usuario`, `modulo_bitacora`, `accion_bitacora`, `fecha_bitacora`, `hora_bitacora`, `estatus`) VALUES
(73, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-03', '02:49 am', 1),
(74, '18690684', 'Preguntas', 'Consultar', '2023-01-03', '02:49 am', 1),
(75, '18690684', 'Preguntas', 'Agregar', '2023-01-03', '02:51 am', 1),
(76, '18690684', 'Inicio', 'Consultar', '2023-01-03', '02:51 am', 1),
(77, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '02:51 am', 1),
(78, '18690684', 'Usuarios', 'Modificar', '2023-01-03', '02:51 am', 1),
(79, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '02:51 am', 1),
(80, '18690684', 'Usuarios', 'Agregar', '2023-01-03', '02:52 am', 1),
(81, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '02:52 am', 1),
(82, '18690684', 'Usuarios', 'Modificar', '2023-01-03', '02:53 am', 1),
(83, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '02:53 am', 1),
(84, '18690684', 'Reportes', 'Consultar', '2023-01-03', '02:58 am', 1),
(85, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '02:58 am', 1),
(86, '18690684', 'Alumnos', 'Consultar', '2023-01-03', '02:59 am', 1),
(87, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '02:59 am', 1),
(88, '18690684', 'Usuarios', 'Agregar', '2023-01-03', '03:00 am', 1),
(89, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '03:01 am', 1),
(90, '18690684', 'Usuarios', 'Agregar', '2023-01-03', '03:03 am', 1),
(91, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '03:03 am', 1),
(92, '18690684', 'Alumnos', 'Consultar', '2023-01-03', '03:05 am', 1),
(93, '18690684', 'Usuarios', 'Consultar', '2023-01-03', '03:05 am', 1),
(107, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-03', '08:07 am', 1),
(108, '07132428', 'Inicio De Sesión', 'Consultar', '2023-01-03', '08:07 am', 1),
(109, '07132428', 'Preguntas', 'Consultar', '2023-01-03', '08:08 am', 1),
(110, '07132428', 'Preguntas', 'Agregar', '2023-01-03', '08:08 am', 1),
(111, '07132428', 'Inicio', 'Consultar', '2023-01-03', '08:08 am', 1),
(112, '07132428', 'Cerrar Sesión', 'Consultar', '2023-01-03', '08:08 am', 1),
(197, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-04', '02:08 pm', 1),
(198, '18690684', 'Inicio', 'Consultar', '2023-01-04', '02:08 pm', 1),
(199, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-04', '02:16 pm', 1),
(212, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-04', '03:30 pm', 1),
(213, '18690684', 'Inicio', 'Consultar', '2023-01-04', '03:30 pm', 1),
(214, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-04', '03:30 pm', 1),
(215, '07132428', 'Inicio De Sesión', 'Consultar', '2023-01-04', '03:31 pm', 1),
(216, '07132428', 'Inicio', 'Consultar', '2023-01-04', '03:31 pm', 1),
(217, '07132428', 'Cerrar Sesión', 'Consultar', '2023-01-04', '03:31 pm', 1),
(224, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-04', '03:32 pm', 1),
(225, '18690684', 'Inicio', 'Consultar', '2023-01-04', '03:32 pm', 1),
(226, '18690684', 'Roles', 'Consultar', '2023-01-04', '03:32 pm', 1),
(227, '18690684', 'Roles', 'Modificar', '2023-01-04', '03:55 pm', 1),
(228, '18690684', 'Roles', 'Consultar', '2023-01-04', '03:55 pm', 1),
(233, '18690684', 'Reportes', 'Consultar', '2023-01-04', '04:05 pm', 1),
(234, '18690684', 'Alumnos', 'Consultar', '2023-01-04', '04:08 pm', 1),
(235, '18690684', 'Reportes', 'Consultar', '2023-01-04', '04:30 pm', 1),
(236, '18690684', 'Alumnos', 'Consultar', '2023-01-04', '11:42 pm', 1),
(237, '18690684', 'Reportes', 'Consultar', '2023-01-05', '01:27 am', 1),
(238, '18690684', 'Usuarios', 'Consultar', '2023-01-05', '03:44 am', 1),
(242, '18690684', 'Reportes', 'Consultar', '2023-01-05', '03:58 am', 1),
(243, '18690684', 'Reportes', 'Usuarios', '2023-01-05', '03:58 am', 1),
(244, '18690684', 'Bitacora', 'Consultar', '2023-01-05', '03:58 am', 1),
(245, '18690684', 'Usuarios', 'Consultar', '2023-01-05', '04:06 am', 1),
(246, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '04:47 am', 1),
(247, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:23 am', 1),
(248, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:25 am', 1),
(249, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:25 am', 1),
(250, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:25 am', 1),
(251, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:26 am', 1),
(252, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:26 am', 1),
(253, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:27 am', 1),
(254, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:29 am', 1),
(255, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:34 am', 1),
(256, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:36 am', 1),
(257, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:37 am', 1),
(258, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:38 am', 1),
(259, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:39 am', 1),
(260, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '05:48 am', 1),
(261, '18690684', 'Mantenimiento', 'Respaldar', '2023-01-05', '05:48 am', 1),
(262, '18690684', 'Mantenimiento', 'Consultar', '2023-01-05', '06:03 am', 1),
(263, '18690684', 'Secciones', 'Consultar', '2023-01-05', '10:23 pm', 1),
(264, '18690684', 'Secciones', 'Agregar', '2023-01-05', '10:59 pm', 1),
(265, '18690684', 'Secciones', 'Consultar', '2023-01-05', '10:59 pm', 1),
(266, '18690684', 'Alumnos', 'Consultar', '2023-01-05', '11:03 pm', 1),
(267, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-05', '11:40 pm', 1),
(268, '18690684', 'Inicio', 'Consultar', '2023-01-05', '11:40 pm', 1),
(269, '18690684', 'Secciones', 'Consultar', '2023-01-05', '11:40 pm', 1),
(270, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-06', '12:19 am', 1),
(271, '18690684', 'Inicio', 'Consultar', '2023-01-06', '12:19 am', 1),
(272, '18690684', 'Usuarios', 'Consultar', '2023-01-06', '12:19 am', 1),
(273, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-06', '09:34 pm', 1),
(277, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-07', '01:06 pm', 1),
(278, '18690684', 'Inicio', 'Consultar', '2023-01-07', '01:06 pm', 1),
(279, '18690684', 'Mantenimiento', 'Consultar', '2023-01-07', '08:54 pm', 1),
(280, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-09', '07:53 pm', 1),
(281, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-13', '08:24 pm', 1),
(282, '18690684', 'Inicio', 'Consultar', '2023-01-13', '08:24 pm', 1),
(283, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-13', '08:24 pm', 1),
(284, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-13', '08:24 pm', 1),
(285, '18690684', 'Inicio', 'Consultar', '2023-01-13', '08:31 pm', 1),
(286, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-13', '08:31 pm', 1),
(287, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-13', '08:32 pm', 1),
(288, '18690684', 'Inicio', 'Consultar', '2023-01-13', '08:46 pm', 1),
(289, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-13', '08:46 pm', 1),
(290, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-13', '09:21 pm', 1),
(291, '18690684', 'Inicio', 'Consultar', '2023-01-13', '09:32 pm', 1),
(292, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-13', '09:32 pm', 1),
(293, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-13', '09:33 pm', 1),
(294, '18690684', 'Inicio', 'Consultar', '2023-01-13', '09:33 pm', 1),
(295, '18690684', 'Alumnos', 'Consultar', '2023-01-13', '09:33 pm', 1),
(296, '18690684', 'Usuarios', 'Consultar', '2023-01-13', '10:35 pm', 1),
(297, '18690684', 'Usuarios', 'Agregar', '2023-01-13', '10:36 pm', 1),
(298, '18690684', 'Usuarios', 'Consultar', '2023-01-13', '10:37 pm', 1),
(299, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-13', '10:37 pm', 1),
(305, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-13', '11:04 pm', 1),
(306, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:04 pm', 1),
(307, '18690684', 'Alumnos', 'Consultar', '2023-01-13', '11:07 pm', 1),
(308, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:11 pm', 1),
(309, '18690684', 'Alumnos', 'Consultar', '2023-01-13', '11:33 pm', 1),
(310, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:41 pm', 1),
(311, '18690684', 'Inicio', 'Vendor', '2023-01-13', '11:42 pm', 1),
(312, '18690684', 'Inicio', 'Assets', '2023-01-13', '11:42 pm', 1),
(313, '18690684', 'Inicio', 'Cierreperiodosubidanotas', '2023-01-13', '11:42 pm', 1),
(314, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:42 pm', 1),
(315, '18690684', 'Inicio', 'Vendor', '2023-01-13', '11:42 pm', 1),
(316, '18690684', 'Inicio', 'Assets', '2023-01-13', '11:42 pm', 1),
(317, '18690684', 'Inicio', 'Vendor', '2023-01-13', '11:42 pm', 1),
(318, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:42 pm', 1),
(319, '18690684', 'Inicio', 'Cierreperiodosubidanotas', '2023-01-13', '11:42 pm', 1),
(320, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:42 pm', 1),
(321, '18690684', 'Inicio', 'Vendor', '2023-01-13', '11:42 pm', 1),
(322, '18690684', 'Inicio', 'Assets', '2023-01-13', '11:42 pm', 1),
(323, '18690684', 'Inicio', 'Cierreperiodosubidanotas', '2023-01-13', '11:42 pm', 1),
(324, '18690684', 'Inicio', 'Consultar', '2023-01-13', '11:43 pm', 1),
(325, '18690684', 'Alumnos', 'Consultar', '2023-01-13', '11:51 pm', 1),
(326, '18690684', 'Notas', 'Consultar', '2023-01-14', '01:41 am', 1),
(327, '18690684', 'Usuarios', 'Consultar', '2023-01-14', '01:41 am', 1),
(328, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-14', '01:41 am', 1),
(329, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-16', '03:11 pm', 1),
(330, '18690684', 'Inicio', 'Consultar', '2023-01-16', '03:11 pm', 1),
(331, '18690684', 'Alumnos', 'Consultar', '2023-01-16', '03:41 pm', 1),
(332, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-16', '04:23 pm', 1),
(333, '18690684', 'Inicio', 'Consultar', '2023-01-16', '04:23 pm', 1),
(334, '18690684', 'Alumnos', 'Consultar', '2023-01-16', '04:23 pm', 1),
(335, '18690684', 'Inicio', 'Consultar', '2023-01-16', '05:01 pm', 1),
(336, '18690684', 'Alumnos', 'Consultar', '2023-01-16', '05:01 pm', 1),
(337, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-16', '05:17 pm', 1),
(338, '18690684', 'Inicio', 'Consultar', '2023-01-16', '05:17 pm', 1),
(339, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-16', '05:42 pm', 1),
(340, '18690684', 'Inicio', 'Consultar', '2023-01-16', '05:42 pm', 1),
(341, '18690684', 'Alumnos', 'Consultar', '2023-01-16', '05:42 pm', 1),
(342, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-18', '10:55 pm', 1),
(343, '18690684', 'Inicio', 'Consultar', '2023-01-18', '10:55 pm', 1),
(344, '18690684', 'Alumnos', 'Consultar', '2023-01-18', '10:55 pm', 1),
(345, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-01-18', '10:47 pm', 1),
(346, '18690684', 'Alumnos', 'Consultar', '2023-01-18', '10:47 pm', 1),
(347, '18690684', 'Usuarios', 'Consultar', '2023-01-18', '10:47 pm', 1),
(348, '18690684', 'Cerrar Sesión', 'Consultar', '2023-01-21', '01:25 pm', 1),
(352, '18690684', 'Inicio De Sesión', 'Consultar', '2023-01-21', '03:13 pm', 1),
(353, '18690684', 'Inicio', 'Consultar', '2023-01-21', '03:13 pm', 1),
(354, '18690684', 'Alumnos', 'Consultar', '2023-01-21', '03:13 pm', 1),
(355, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-01-21', '03:28 pm', 1),
(356, '18690684', 'Inicio', 'Consultar', '2023-02-08', '10:39 pm', 1),
(357, '18690684', 'Alumnos', 'Consultar', '2023-02-08', '10:39 pm', 1),
(358, '18690684', 'Cerrar Sesión', 'Consultar', '2023-02-08', '10:43 pm', 1),
(389, '18690684', 'Inicio De Sesión', 'Consultar', '2023-02-08', '11:47 pm', 1),
(390, '18690684', 'Inicio', 'Consultar', '2023-02-08', '11:47 pm', 1),
(391, '18690684', 'Inicio De Sesión', 'Consultar', '2023-02-08', '11:49 pm', 1),
(392, '18690684', 'Inicio', 'Consultar', '2023-02-08', '11:49 pm', 1),
(393, '18690684', 'Cerrar Sesión', 'Consultar', '2023-02-08', '11:49 pm', 1),
(394, '07132428', 'Inicio De Sesión', 'Consultar', '2023-02-08', '11:50 pm', 1),
(395, '07132428', 'Inicio', 'Consultar', '2023-02-08', '11:50 pm', 1),
(396, '07132428', 'Usuarios', 'Consultar', '2023-02-08', '11:50 pm', 1),
(397, '07132428', 'Cerrar Sesión', 'Consultar', '2023-02-08', '11:50 pm', 1),
(398, '07132428', 'Inicio De Sesión', 'Consultar', '2023-02-08', '11:52 pm', 1),
(399, '07132428', 'Inicio', 'Consultar', '2023-02-08', '11:52 pm', 1),
(400, '07132428', 'Usuarios', 'Consultar', '2023-02-08', '11:52 pm', 1),
(401, '07132428', 'Usuarios', 'Modificar', '2023-02-08', '11:53 pm', 1),
(402, '07132428', 'Usuarios', 'Consultar', '2023-02-08', '11:54 pm', 1),
(403, '07132428', 'Cerrar Sesión', 'Consultar', '2023-02-08', '11:55 pm', 1),
(404, '07132428', 'Inicio De Sesión', 'Consultar', '2023-02-08', '11:59 pm', 1),
(405, '07132428', 'Inicio', 'Consultar', '2023-02-08', '11:59 pm', 1),
(406, '07132428', 'Cerrar Sesión', 'Consultar', '2023-02-08', '11:59 pm', 1),
(407, '18690684', 'Inicio De Sesión', 'Consultar', '2023-02-08', '11:59 pm', 1),
(408, '18690684', 'Inicio', 'Consultar', '2023-02-08', '11:59 pm', 1),
(409, '18690684', 'Cerrar Sesión', 'Consultar', '2023-02-08', '11:59 pm', 1),
(410, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-01', '10:36 am', 1),
(411, '18690684', 'Inicio', 'Consultar', '2023-03-01', '10:36 am', 1),
(412, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-01', '10:47 am', 1),
(413, '18690684', 'Inicio', 'Consultar', '2023-03-01', '10:47 am', 1),
(414, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-01', '11:05 am', 1),
(415, '18690684', 'Inicio', 'Consultar', '2023-03-01', '11:05 am', 1),
(416, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:14 am', 1),
(417, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-03-01', '11:18 am', 1),
(418, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:20 am', 1),
(419, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-03-01', '11:27 am', 1),
(420, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:27 am', 1),
(421, '18690684', 'Profesores', 'Consultar', '2023-03-01', '11:28 am', 1),
(422, '18690684', 'Profesores', 'Agregar Desde Excel', '2023-03-01', '11:28 am', 1),
(423, '18690684', 'Profesores', 'Consultar', '2023-03-01', '11:28 am', 1),
(424, '18690684', 'Periodos', 'Consultar', '2023-03-01', '11:32 am', 1),
(425, '18690684', 'Periodos', 'Modificar', '2023-03-01', '11:34 am', 1),
(426, '18690684', 'Periodos', 'Consultar', '2023-03-01', '11:34 am', 1),
(427, '18690684', 'Periodos', 'Modificar', '2023-03-01', '11:36 am', 1),
(428, '18690684', 'Periodos', 'Consultar', '2023-03-01', '11:36 am', 1),
(429, '18690684', 'Saberes', 'Consultar', '2023-03-01', '11:38 am', 1),
(430, '18690684', 'Secciones', 'Consultar', '2023-03-01', '11:41 am', 1),
(431, '18690684', 'Secciones', 'Agregar', '2023-03-01', '11:42 am', 1),
(432, '18690684', 'Secciones', 'Consultar', '2023-03-01', '11:42 am', 1),
(433, '18690684', 'Secciones', 'Agregar', '2023-03-01', '11:44 am', 1),
(434, '18690684', 'Secciones', 'Consultar', '2023-03-01', '11:44 am', 1),
(435, '18690684', 'Secciones', 'Agregar', '2023-03-01', '11:45 am', 1),
(436, '18690684', 'Secciones', 'Consultar', '2023-03-01', '11:45 am', 1),
(437, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:46 am', 1),
(438, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-03-01', '11:46 am', 1),
(439, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:46 am', 1),
(440, '18690684', 'Secciones', 'Consultar', '2023-03-01', '11:47 am', 1),
(441, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:47 am', 1),
(442, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-03-01', '11:49 am', 1),
(443, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '11:49 am', 1),
(444, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-03-01', '12:07 pm', 1),
(445, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '12:07 pm', 1),
(446, '18690684', 'Alumnos', 'Agregar Desde Excel', '2023-03-01', '12:14 pm', 1),
(447, '18690684', 'Alumnos', 'Consultar', '2023-03-01', '12:14 pm', 1),
(448, '18690684', 'Profesores', 'Consultar', '2023-03-01', '12:20 pm', 1),
(449, '18690684', 'Secciones', 'Consultar', '2023-03-01', '12:20 pm', 1),
(450, '18690684', 'Secciones', 'Modificar', '2023-03-01', '12:27 pm', 1),
(451, '18690684', 'Secciones', 'Consultar', '2023-03-01', '12:27 pm', 1),
(452, '18690684', 'Secciones', 'Modificar', '2023-03-01', '12:27 pm', 1),
(453, '18690684', 'Secciones', 'Consultar', '2023-03-01', '12:27 pm', 1),
(454, '18690684', 'Secciones', 'Modificar', '2023-03-01', '12:27 pm', 1),
(455, '18690684', 'Secciones', 'Consultar', '2023-03-01', '12:28 pm', 1),
(456, '18690684', 'Secciones', 'Agregar', '2023-03-01', '12:28 pm', 1),
(457, '18690684', 'Secciones', 'Consultar', '2023-03-01', '12:28 pm', 1),
(458, '18690684', 'Clases', 'Consultar', '2023-03-01', '12:28 pm', 1),
(459, '18690684', 'Clases', 'Agregar', '2023-03-01', '12:29 pm', 1),
(460, '18690684', 'Clases', 'Consultar', '2023-03-01', '12:29 pm', 1),
(461, '18690684', 'Clases', 'Agregar', '2023-03-01', '12:29 pm', 1),
(462, '18690684', 'Clases', 'Consultar', '2023-03-01', '12:29 pm', 1),
(463, '18690684', 'Clases', 'Agregar', '2023-03-01', '12:29 pm', 1),
(464, '18690684', 'Clases', 'Consultar', '2023-03-01', '12:29 pm', 1),
(465, '18690684', 'Clases', 'Agregar', '2023-03-01', '12:29 pm', 1),
(466, '18690684', 'Clases', 'Consultar', '2023-03-01', '12:29 pm', 1),
(467, '18690684', 'Proyectos', 'Consultar', '2023-03-01', '12:31 pm', 1),
(468, '18690684', 'Proyectos', 'Agregar', '2023-03-01', '12:31 pm', 1),
(469, '18690684', 'Proyectos', 'Consultar', '2023-03-01', '12:31 pm', 1),
(470, '18690684', 'Proyectos', 'Agregar', '2023-03-01', '12:32 pm', 1),
(471, '18690684', 'Proyectos', 'Consultar', '2023-03-01', '12:32 pm', 1),
(472, '18690684', 'Notas', 'Consultar', '2023-03-01', '12:33 pm', 1),
(473, '18690684', 'Notas', 'Agregar', '2023-03-01', '12:33 pm', 1),
(474, '18690684', 'Notas', 'Consultar', '2023-03-01', '12:33 pm', 1),
(475, '18690684', 'Notas', 'Agregar', '2023-03-01', '12:34 pm', 1),
(476, '18690684', 'Notas', 'Consultar', '2023-03-01', '12:34 pm', 1),
(477, '18690684', 'Notas', 'Agregar', '2023-03-01', '12:34 pm', 1),
(478, '18690684', 'Notas', 'Consultar', '2023-03-01', '12:34 pm', 1),
(479, '18690684', 'Notas', 'Agregar', '2023-03-01', '12:34 pm', 1),
(480, '18690684', 'Notas', 'Consultar', '2023-03-01', '12:35 pm', 1),
(481, '18690684', 'Usuarios', 'Consultar', '2023-03-01', '12:35 pm', 1),
(482, '18690684', 'Usuarios', 'Eliminar', '2023-03-01', '12:35 pm', 1),
(483, '18690684', 'Usuarios', 'Consultar', '2023-03-01', '12:35 pm', 1),
(484, '18690684', 'Usuarios', 'Habilitar', '2023-03-01', '12:35 pm', 1),
(485, '18690684', 'Usuarios', 'Consultar', '2023-03-01', '12:35 pm', 1),
(486, '18690684', 'Usuarios', 'Modificar', '2023-03-01', '12:36 pm', 1),
(487, '18690684', 'Usuarios', 'Consultar', '2023-03-01', '12:36 pm', 1),
(488, '18690684', 'Usuarios', 'Modificar', '2023-03-01', '12:36 pm', 1),
(489, '18690684', 'Usuarios', 'Consultar', '2023-03-01', '12:36 pm', 1),
(490, '18690684', 'Reportes', 'Consultar', '2023-03-01', '12:45 pm', 1),
(491, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '12:45 pm', 1),
(492, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '12:46 pm', 1),
(493, '18690684', 'Reportes', 'Consultar', '2023-03-01', '12:47 pm', 1),
(494, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '12:48 pm', 1),
(495, '18690684', 'Reportes', 'Consultar', '2023-03-01', '12:49 pm', 1),
(496, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '12:49 pm', 1),
(497, '18690684', 'Reportes', 'Consultar', '2023-03-01', '12:50 pm', 1),
(498, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '12:51 pm', 1),
(499, '18690684', 'Reportes', 'Consultar', '2023-03-01', '12:52 pm', 1),
(500, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '12:53 pm', 1),
(501, '18690684', 'Reportes', 'Consultar', '2023-03-01', '12:57 pm', 1),
(502, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '02:55 pm', 1),
(503, '18690684', 'Reportes', 'Consultar', '2023-03-01', '02:56 pm', 1),
(504, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '02:56 pm', 1),
(505, '18690684', 'Reportes', 'Consultar', '2023-03-01', '02:58 pm', 1),
(506, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '02:58 pm', 1),
(507, '18690684', 'Reportes', 'Consultar', '2023-03-01', '02:59 pm', 1),
(508, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '02:59 pm', 1),
(509, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:00 pm', 1),
(510, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:09 pm', 1),
(511, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:10 pm', 1),
(512, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:31 pm', 1),
(513, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:32 pm', 1),
(514, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:32 pm', 1),
(515, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:33 pm', 1),
(516, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:33 pm', 1),
(517, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:35 pm', 1),
(518, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:35 pm', 1),
(519, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:37 pm', 1),
(520, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:38 pm', 1),
(521, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:39 pm', 1),
(522, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:40 pm', 1),
(523, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:44 pm', 1),
(524, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:45 pm', 1),
(525, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:48 pm', 1),
(526, '18690684', 'Reportes', 'Estadistico', '2023-03-01', '03:49 pm', 1),
(527, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:50 pm', 1),
(528, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:52 pm', 1),
(529, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:52 pm', 1),
(530, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:53 pm', 1),
(531, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:53 pm', 1),
(532, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:54 pm', 1),
(533, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:54 pm', 1),
(534, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:55 pm', 1),
(535, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:55 pm', 1),
(536, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:56 pm', 1),
(537, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:56 pm', 1),
(538, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:56 pm', 1),
(539, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:57 pm', 1),
(540, '18690684', 'Reportes', 'Consultar', '2023-03-01', '03:58 pm', 1),
(541, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '03:58 pm', 1),
(542, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '03:58 pm', 1),
(543, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:19 pm', 1),
(544, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:19 pm', 1),
(545, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:22 pm', 1),
(546, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:22 pm', 1),
(547, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:24 pm', 1),
(548, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:24 pm', 1),
(549, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:26 pm', 1),
(550, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:26 pm', 1),
(551, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:28 pm', 1),
(552, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '04:28 pm', 1),
(553, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:29 pm', 1),
(554, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:30 pm', 1),
(555, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:34 pm', 1),
(556, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '04:35 pm', 1),
(557, '18690684', 'Reportes', 'Estadistico', '2023-03-01', '04:35 pm', 1),
(558, '18690684', 'Reportes', 'Consultar', '2023-03-01', '04:37 pm', 1),
(559, '18690684', 'Reportes', 'Aprobados', '2023-03-01', '04:40 pm', 1),
(560, '18690684', 'Reportes', 'Porcentaje', '2023-03-01', '04:40 pm', 1),
(561, '18690684', 'Usuarios', 'Consultar', '2023-03-01', '04:40 pm', 1),
(562, '18690684', 'Cerrar Sesión', 'Consultar', '2023-03-01', '04:46 pm', 1),
(563, '01566370', 'Inicio De Sesión', 'Consultar', '2023-03-01', '04:47 pm', 1),
(564, '01566370', 'Preguntas', 'Consultar', '2023-03-01', '04:47 pm', 1),
(565, '01566370', 'Preguntas', 'Agregar', '2023-03-01', '04:48 pm', 1),
(566, '01566370', 'Inicio', 'Consultar', '2023-03-01', '04:48 pm', 1),
(567, '01566370', 'Proyectos', 'Consultar', '2023-03-01', '04:49 pm', 1),
(568, '01566370', 'Cerrar Sesión', 'Consultar', '2023-03-01', '04:49 pm', 1),
(569, '05787285', 'Inicio De Sesión', 'Consultar', '2023-03-01', '04:49 pm', 1),
(570, '05787285', 'Preguntas', 'Consultar', '2023-03-01', '04:49 pm', 1),
(571, '05787285', 'Preguntas', 'Agregar', '2023-03-01', '04:50 pm', 1),
(572, '05787285', 'Inicio', 'Consultar', '2023-03-01', '04:50 pm', 1),
(573, '05787285', 'Notas', 'Consultar', '2023-03-01', '04:51 pm', 1),
(574, '05787285', 'Cerrar Sesión', 'Consultar', '2023-03-01', '04:51 pm', 1),
(575, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-01', '04:52 pm', 1),
(576, '18690684', 'Inicio', 'Consultar', '2023-03-01', '04:52 pm', 1),
(577, '18690684', 'Bloqueo', 'Consultar', '2023-03-01', '04:52 pm', 1),
(578, '18690684', 'Inicio', 'Consultar', '2023-03-02', '07:12 pm', 1),
(579, '18690684', 'Alumnos', 'Agregar', '2023-03-02', '07:14 pm', 1),
(580, '18690684', 'Alumnos', 'Consultar', '2023-03-02', '08:22 pm', 1),
(581, '18690684', 'Inicio', 'Consultar', '2023-03-04', '04:35 pm', 1),
(582, '18690684', 'Secciones', 'Consultar', '2023-03-04', '05:36 pm', 1),
(583, '18690684', 'Proyectos', 'Consultar', '2023-03-04', '05:38 pm', 1),
(584, '18690684', 'Secciones', 'Consultar', '2023-03-04', '05:39 pm', 1),
(585, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-05', '12:51 pm', 1),
(586, '18690684', 'Inicio', 'Consultar', '2023-03-05', '12:51 pm', 1),
(587, '18690684', 'Notas', 'Consultar', '2023-03-05', '12:55 pm', 1),
(588, '18690684', 'Inicio', 'Consultar', '2023-03-05', '12:55 pm', 1),
(589, '18690684', 'Clases', 'Consultar', '2023-03-05', '12:55 pm', 1),
(590, '18690684', 'Inicio', 'Consultar', '2023-03-05', '12:55 pm', 1),
(591, '18690684', 'Secciones', 'Consultar', '2023-03-05', '12:55 pm', 1),
(592, '18690684', 'Usuarios', 'Consultar', '2023-03-05', '12:55 pm', 1),
(593, '18690684', 'Bitacora', 'Consultar', '2023-03-05', '12:55 pm', 1),
(594, '18690684', 'Bloqueo', 'Consultar', '2023-03-05', '12:55 pm', 1),
(595, '18690684', 'Mantenimiento', 'Consultar', '2023-03-05', '12:55 pm', 1),
(596, '18690684', 'Secciones', 'Consultar', '2023-03-05', '12:55 pm', 1),
(597, '18690684', 'Periodos', 'Consultar', '2023-03-05', '12:56 pm', 1),
(598, '18690684', 'Cerrar Sesión', 'Consultar', '2023-03-05', '12:56 pm', 1),
(599, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-05', '12:58 pm', 1),
(600, '18690684', 'Inicio', 'Consultar', '2023-03-05', '12:58 pm', 1),
(601, '18690684', 'Cerrar Sesión', 'Consultar', '2023-03-05', '12:58 pm', 1),
(602, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-05', '12:59 pm', 1),
(603, '18690684', 'Inicio', 'Consultar', '2023-03-05', '12:59 pm', 1),
(604, '18690684', 'Cerrar Sesión', 'Consultar', '2023-03-05', '12:59 pm', 1),
(605, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-05', '01:15 pm', 1),
(606, '18690684', 'Inicio', 'Consultar', '2023-03-05', '01:15 pm', 1),
(607, '18690684', 'Secciones', 'Consultar', '2023-03-05', '01:16 pm', 1),
(608, '18690684', 'Periodos', 'Consultar', '2023-03-05', '01:19 pm', 1),
(609, '18690684', 'Secciones', 'Consultar', '2023-03-05', '01:20 pm', 1),
(610, '18690684', 'Alumnos', 'Consultar', '2023-03-05', '01:23 pm', 1),
(611, '18690684', 'Secciones', 'Consultar', '2023-03-05', '01:25 pm', 1),
(612, '18690684', 'Clases', 'Consultar', '2023-03-05', '01:41 pm', 1),
(613, '18690684', 'Alumnos', 'Consultar', '2023-03-05', '01:41 pm', 1),
(614, '18690684', 'Secciones', 'Consultar', '2023-03-05', '01:43 pm', 1),
(615, '18690684', 'Secciones', 'Agregar', '2023-03-05', '02:10 pm', 1),
(616, '18690684', 'Secciones', 'Consultar', '2023-03-05', '02:10 pm', 1),
(617, '18690684', 'Secciones', 'Modificar', '2023-03-05', '02:27 pm', 1),
(618, '18690684', 'Secciones', 'Consultar', '2023-03-05', '02:27 pm', 1),
(619, '18690684', 'Clases', 'Consultar', '2023-03-05', '02:32 pm', 1),
(620, '18690684', 'Periodos', 'Consultar', '2023-03-05', '02:40 pm', 1),
(621, '18690684', 'Secciones', 'Consultar', '2023-03-05', '02:42 pm', 1),
(622, '18690684', 'Clases', 'Consultar', '2023-03-05', '02:44 pm', 1),
(623, '18690684', 'Periodos', 'Consultar', '2023-03-05', '02:49 pm', 1),
(624, '18690684', 'Clases', 'Consultar', '2023-03-05', '02:53 pm', 1),
(625, '18690684', 'Periodos', 'Consultar', '2023-03-05', '03:06 pm', 1),
(626, '18690684', 'Clases', 'Consultar', '2023-03-05', '03:13 pm', 1),
(627, '18690684', 'Periodos', 'Consultar', '2023-03-05', '03:44 pm', 1),
(628, '18690684', 'Clases', 'Consultar', '2023-03-05', '03:44 pm', 1),
(629, '18690684', 'Clases', 'Agregar', '2023-03-05', '05:05 pm', 1),
(630, '18690684', 'Clases', 'Consultar', '2023-03-05', '05:05 pm', 1),
(631, '18690684', 'Periodos', 'Consultar', '2023-03-05', '08:54 pm', 1),
(632, '18690684', 'Clases', 'Consultar', '2023-03-05', '08:55 pm', 1),
(633, '18690684', 'Clases', 'Agregar', '2023-03-05', '09:33 pm', 1),
(634, '18690684', 'Clases', 'Consultar', '2023-03-05', '09:33 pm', 1),
(635, '18690684', 'Clases', 'Agregar', '2023-03-05', '09:43 pm', 1),
(636, '18690684', 'Clases', 'Consultar', '2023-03-05', '09:44 pm', 1),
(637, '18690684', 'Clases', 'Modificar', '2023-03-05', '11:00 pm', 1),
(638, '18690684', 'Clases', 'Consultar', '2023-03-05', '11:00 pm', 1),
(639, '18690684', 'Proyectos', 'Consultar', '2023-03-05', '11:01 pm', 1),
(640, '18690684', 'Secciones', 'Consultar', '2023-03-05', '11:42 pm', 1),
(641, '18690684', 'Clases', 'Consultar', '2023-03-05', '11:42 pm', 1),
(642, '18690684', 'Proyectos', 'Consultar', '2023-03-05', '11:56 pm', 1),
(643, '18690684', 'Proyectos', 'Agregar', '2023-03-06', '12:01 am', 1),
(644, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '12:02 am', 1),
(645, '18690684', 'Proyectos', 'Agregar', '2023-03-06', '12:03 am', 1),
(646, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '12:19 am', 1),
(647, '18690684', 'Proyectos', 'Agregar', '2023-03-06', '12:20 am', 1),
(648, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '12:46 am', 1),
(649, '18690684', 'Proyectos', 'Modificar', '2023-03-06', '12:48 am', 1),
(650, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '12:48 am', 1),
(651, '18690684', 'Clases', 'Consultar', '2023-03-06', '12:48 am', 1),
(652, '18690684', 'Notas', 'Consultar', '2023-03-06', '12:48 am', 1),
(653, '18690684', 'Clases', 'Consultar', '2023-03-06', '12:48 am', 1),
(654, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '12:48 am', 1),
(655, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-06', '11:34 am', 1),
(656, '18690684', 'Inicio', 'Consultar', '2023-03-06', '11:34 am', 1),
(657, '18690684', 'Notas', 'Consultar', '2023-03-06', '11:59 am', 1),
(658, '18690684', 'Clases', 'Consultar', '2023-03-06', '12:07 pm', 1),
(659, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '12:08 pm', 1),
(660, '18690684', 'Notas', 'Consultar', '2023-03-06', '12:08 pm', 1),
(661, '18690684', 'Clases', 'Consultar', '2023-03-06', '12:30 pm', 1),
(662, '18690684', 'Notas', 'Consultar', '2023-03-06', '12:33 pm', 1),
(663, '18690684', 'Notas', 'Agregar', '2023-03-06', '12:41 pm', 1),
(664, '18690684', 'Notas', 'Consultar', '2023-03-06', '12:41 pm', 1),
(665, '18690684', 'Notas', 'Modificar', '2023-03-06', '12:50 pm', 1),
(666, '18690684', 'Notas', 'Consultar', '2023-03-06', '12:50 pm', 1),
(667, '18690684', 'Reportes', 'Consultar', '2023-03-06', '12:51 pm', 1),
(668, '18690684', 'Reportes', 'Usuarios', '2023-03-06', '12:54 pm', 1),
(669, '18690684', 'Reportes', 'Aprobados', '2023-03-06', '12:54 pm', 1),
(670, '18690684', 'Reportes', 'Consultar', '2023-03-06', '12:54 pm', 1),
(671, '18690684', 'Cerrar Sesión', 'Consultar', '2023-03-06', '12:54 pm', 1),
(672, '18690684', 'Inicio De Sesión', 'Consultar', '2023-03-06', '12:54 pm', 1),
(673, '18690684', 'Inicio', 'Consultar', '2023-03-06', '12:54 pm', 1),
(674, '18690684', 'Reportes', 'Consultar', '2023-03-06', '12:54 pm', 1),
(675, '18690684', 'Reportes', 'Porcentaje', '2023-03-06', '01:07 pm', 1),
(676, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:08 pm', 1),
(677, '18690684', 'Reportes', 'Estadistico', '2023-03-06', '01:08 pm', 1),
(678, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:08 pm', 1),
(679, '18690684', 'Reportes', 'Estadistico', '2023-03-06', '01:08 pm', 1),
(680, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:09 pm', 1),
(681, '18690684', 'Reportes', 'Notas', '2023-03-06', '01:13 pm', 1),
(682, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:16 pm', 1),
(683, '18690684', 'Reportes', 'Aprobados', '2023-03-06', '01:16 pm', 1),
(684, '18690684', 'Reportes', 'Porcentaje', '2023-03-06', '01:17 pm', 1),
(685, '18690684', 'Reportes', 'Estadistico', '2023-03-06', '01:17 pm', 1),
(686, '18690684', 'Reportes', 'Usuarios', '2023-03-06', '01:18 pm', 1),
(687, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:18 pm', 1),
(688, '18690684', 'Reportes', 'Notas', '2023-03-06', '01:25 pm', 1),
(689, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:26 pm', 1),
(690, '18690684', 'Reportes', 'Notas', '2023-03-06', '01:27 pm', 1),
(691, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:28 pm', 1),
(692, '18690684', 'Reportes', 'Notas', '2023-03-06', '01:28 pm', 1),
(693, '18690684', 'Reportes', 'Usuarios', '2023-03-06', '01:29 pm', 1),
(694, '18690684', 'Reportes', 'Consultar', '2023-03-06', '01:29 pm', 1),
(695, '18690684', 'Reportes', 'Porcentaje', '2023-03-06', '01:36 pm', 1),
(696, '18690684', 'Reportes', 'Usuarios', '2023-03-06', '01:37 pm', 1),
(697, '18690684', 'Bitacora', 'Consultar', '2023-03-06', '01:37 pm', 1),
(698, '18690684', 'Alumnos', 'Consultar', '2023-03-06', '01:43 pm', 1),
(699, '18690684', 'Bitacora', 'Consultar', '2023-03-06', '01:43 pm', 1),
(700, '18690684', 'Modulos', 'Consultar', '2023-03-06', '02:13 pm', 1),
(701, '18690684', 'Roles', 'Consultar', '2023-03-06', '02:13 pm', 1),
(702, '18690684', 'Mantenimiento', 'Consultar', '2023-03-06', '02:13 pm', 1),
(703, '18690684', 'Alumnos', 'Consultar', '2023-03-06', '02:17 pm', 1),
(704, '18690684', 'Profesores', 'Consultar', '2023-03-06', '02:17 pm', 1),
(705, '18690684', 'Secciones', 'Consultar', '2023-03-06', '02:17 pm', 1),
(706, '18690684', 'Clases', 'Consultar', '2023-03-06', '02:17 pm', 1),
(707, '18690684', 'Proyectos', 'Consultar', '2023-03-06', '02:17 pm', 1),
(708, '18690684', 'Notas', 'Consultar', '2023-03-06', '02:18 pm', 1),
(709, '18690684', 'Reportes', 'Consultar', '2023-03-06', '02:18 pm', 1),
(710, '18690684', 'Inicio', 'Consultar', '2023-03-06', '02:18 pm', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id_clase` int(20) NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `id_SC` int(20) NOT NULL,
  `cod_seccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `visto_profesor` int(11) DEFAULT NULL,
  `visto_tutor` int(11) DEFAULT NULL,
  `visto_admin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

CREATE TABLE `grupos` (
  `cod_grupo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_SA` int(20) NOT NULL,
  `cod_proyecto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `id_modulo` int(20) NOT NULL,
  `nombre_modulo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id_modulo`, `nombre_modulo`, `estatus`) VALUES
(1, 'Alumnos', 1),
(2, 'Profesores', 1),
(3, 'Periodos', 1),
(4, 'Saberes', 1),
(5, 'Secciones', 1),
(6, 'Clases', 1),
(7, 'Proyectos', 1),
(8, 'Notas', 1),
(9, 'Usuarios', 1),
(10, 'Reportes', 1),
(11, 'Bitácora', 1),
(12, 'Usuario Bloqueado', 1),
(13, 'Modulos', 1),
(14, 'Permisos', 1),
(15, 'Roles', 1),
(16, 'Mantenimiento', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_clase` int(20) NOT NULL,
  `id_SA` int(20) NOT NULL,
  `nota` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nota` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_nota` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visto_alumno` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id_notificacion` int(20) NOT NULL,
  `tabla_notificacion` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `elemento_tabla` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_tabla` int(11) NOT NULL,
  `codigo_tabla` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_notificacion` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hora_notificacion` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estatus` int(11) NOT NULL,
  `visto_alumnos` int(11) DEFAULT NULL,
  `visto_profesores` int(11) DEFAULT NULL,
  `visto_admin` int(11) DEFAULT NULL,
  `visto_superusuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id_periodo` int(20) NOT NULL,
  `nombre_periodo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_periodo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_apertura` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_cierre` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `periodos`
--

INSERT INTO `periodos` (`id_periodo`, `nombre_periodo`, `year_periodo`, `fecha_apertura`, `fecha_cierre`, `estatus`) VALUES
(1, 'I', '2022', '2022-02-07', '2022-07-01', 1),
(2, 'II', '2022', '2022-09-05', '2022-12-09', 1),
(3, 'I', '2023', '2023-02-01', '2023-02-28', 1),
(4, 'II', '2023', '2023-03-06', '2023-03-31', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(20) NOT NULL,
  `nombre_permiso` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `nombre_permiso`, `estatus`) VALUES
(1, 'Agregar', 1),
(2, 'Consultar', 1),
(3, 'Modificar', 1),
(4, 'Eliminar', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id` int(20) NOT NULL,
  `pregunta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id`, `pregunta`, `status`) VALUES
(1, '¿Cuál es el año de nacimiento de su padre?', 1),
(2, '¿Cuál es el nombre de su primera mascota?', 1),
(3, '¿Cuál es el nombre de su hermano/a?', 1),
(4, '¿Cuál es su libro favorito?', 1),
(5, '¿Cuál es la marca de su primer carro?', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_profesor` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_profesor` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_profesor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`cedula_profesor`, `nombre_profesor`, `apellido_profesor`, `telefono_profesor`, `estatus`) VALUES
('01566370', 'Judith', 'Díaz ', '04121647106', 1),
('03633921', 'Luis Guillermo', 'Mendoza ', '04121647126', 1),
('03756922', 'Edgar', 'Guedez', '04121647116', 1),
('03782342', 'Ricardo', 'Valderrama ', '04121647148', 1),
('03787540', 'Pablo', 'Guevara ', '04121647118', 1),
('04002660', 'Cruz', 'Estanga ', '04121647109', 1),
('04177704', 'Jesús', 'Guerrero', '04121647117', 1),
('04342594', 'Bertha', 'Pulido', '04121647138', 1),
('04373481', 'Arelys', 'Crespo ', '04121647102', 1),
('04966848', 'Carlos', 'Awais', '04121647092', 1),
('05116367', 'José', 'Andrade', '04121647087', 1),
('05237891', 'Alida', 'Peña', '04121647131', 1),
('05243212', 'Luis', 'Crespo', '04121647103', 1),
('05250654', 'Andrés E', 'Mendoza ', '04121647124', 1),
('07132428', 'Elizabeth', 'Briceño ', '04121647097', 1),
('07313351', 'José Gerardo', 'González', '04121647115', 1),
('07348871', 'Elisa', 'Colmenarez', '04121647099', 1),
('07350834', 'Eunice', 'Jiménez', '04121647120', 1),
('07359889', 'Manuel', 'Branco ', '04121647096', 1),
('07386104', 'Lesdy', 'Piña', '04121647137', 1),
('07387449', 'Oliva', 'Pineda ', '04121647136', 1),
('07389728', 'Jhonny', 'Picone', '04121647135', 1),
('07395006', 'Francisco', 'Duran ', '04121647108', 1),
('07399931', 'Rodrigo', 'Lander', '04121647122', 1),
('07403069', 'Jairo', 'Arias', '04121647089', 1),
('07409068', 'Elsy', 'Romero', '04121647140', 1),
('07438075', 'Zieliska', 'Oviedo ', '04121647130', 1),
('07442799', 'Adolia', 'Garcés ', '04121647112', 1),
('07914356', 'Evelyn', 'Barragán', '04121647094', 1),
('07970802', 'Camillo', 'Di Cola ', '04121647107', 1),
('08627938', 'Jenny', 'Acosta', '04121647083', 1),
('09048980', 'Ynmaculada', 'Azuaje', '04121647093', 1),
('09378013', 'Yelitza', 'Santos ', '04121647143', 1),
('09544153', 'David', 'Peraza ', '04121647133', 1),
('09579750', 'Johnny', 'León', '04121647123', 1),
('09626909', 'Yuli', 'Morales ', '04121647128', 1),
('09708093', 'Alenis', 'Arevalo', '04121647088', 1),
('10338520', 'Winston', 'Hidalgo', '04121647119', 1),
('10846059', 'María Alexandra', 'Corti', '04121647101', 1),
('10849476', 'Walter', 'Torres ', '04121647147', 1),
('11260305', 'Eva', 'Arrieche', '04121647090', 1),
('11580182', 'Endert', 'Gil', '04121647113', 1),
('11587952', 'Alexander', 'Cubiro ', '04121647104', 1),
('12026793', 'Carlos', 'Osal', '04121647129', 1),
('12244128', 'Yajhayra', 'Aldana', '04121647086', 1),
('12534603', 'Dayanara', 'Santos', '04121647142', 1),
('12630557', 'Michelly', 'Vivas', '04121647150', 1),
('12698690', 'María', 'Bonilla ', '04121647095', 1),
('12703237', 'Gizet', 'Asuaje', '04121647091', 1),
('12706637', 'Lisbeth', 'Acurero', '04121647084', 1),
('12707546', 'Larry', 'Segueri ', '04121647144', 1),
('12850970', 'Sergio', 'Jiménez', '04121647121', 1),
('13119423', 'Marvys', 'Soler', '04121647145', 1),
('13189208', 'Orana', 'Rosendo ', '04121647141', 1),
('13509849', 'Lilibell', 'Estevanot ', '04121647111', 1),
('13519545', 'Anabel', 'Abarca', '04121647082', 1),
('14068853', 'Gregorio', 'Colmenarez', '04121647100', 1),
('14228345', ' Yennys', 'Gil', '04121647114', 1),
('14262620', 'Miriam', 'Peña ', '04121647132', 1),
('14749211', 'Somarilis', 'Valdez', '04121647149', 1),
('14880601', 'Johanna', 'Alastre', '04121647085', 1),
('14979119', 'Migliver', 'Montezuma', '04121647127', 1),
('16385532', 'Isaac', 'Mendoza', '04121647125', 1),
('17612167', 'Francys', 'Soteldo ', '04121647146', 1),
('18226221', 'Glennimar', 'Carreño', '04121647098', 1),
('18690684', 'Joan', 'Perez', '04121647134', 1),
('18917274', 'Andrés', 'España', '04121647110', 1),
('19262335', 'Aldo', 'Ramos  ', '04121647139', 1),
('19591089', 'Carlos', 'Cuicas', '04121647105', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `cod_proyecto` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo_proyecto` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_proyecto` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`cod_proyecto`, `cedula_profesor`, `titulo_proyecto`, `trayecto_proyecto`, `estatus`) VALUES
('T1SY2023T1S1P1', '04177704', 'GALLETAS XD', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestas`
--

CREATE TABLE `respuestas` (
  `id_respuesta` int(20) NOT NULL,
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pregunta` int(10) NOT NULL,
  `respuestas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `respuestas`
--

INSERT INTO `respuestas` (`id_respuesta`, `cedula_usuario`, `id_pregunta`, `respuestas`, `estatus`) VALUES
(4, '18690684', 2, 'L3ZvWHMyV1ZldjdWRnhGczFkdkkzZz09', 1),
(5, '18690684', 3, 'eGNrbE1aSDByUk42TE5ETzRUQlFJUT09', 1),
(6, '18690684', 4, 'TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09', 1),
(7, '07132428', 2, 'YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09', 1),
(8, '07132428', 3, 'eE5KczhvdUNXYXpJRzZLVjhwRmVFQT09', 1),
(9, '07132428', 4, 'TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09', 1),
(19, '01566370', 1, 'M01ncWVhc0k4RHg1WkxVWWpPRm82Zz09', 1),
(20, '01566370', 2, 'YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09', 1),
(21, '01566370', 4, 'TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09', 1),
(22, '05787285', 2, 'YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09', 1),
(23, '05787285', 3, 'dHFIcWxiM3VhNHRlMm1aTVQ1ZHIvZz09', 1),
(24, '05787285', 5, 'ay9MWlNaNm93RzlGTTlIV3ZsNk1HUT09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(20) NOT NULL,
  `nombre_rol` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `estatus`) VALUES
(1, 'Superusuario', 1),
(2, 'Administrador', 1),
(3, 'Alumnos', 1),
(4, 'Profesores', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rsa`
--

CREATE TABLE `rsa` (
  `id_rsa` int(20) NOT NULL,
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `llave_publica` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `llave_privada` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firma_digital` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_acceso` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rsa`
--

INSERT INTO `rsa` (`id_rsa`, `cedula_usuario`, `llave_publica`, `llave_privada`, `firma_digital`, `fecha_acceso`, `estatus`) VALUES
(2, '18690684', 'UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VGl2WC9IcDI3cVRmMTR6NXgvQk9TQm9obTNReTI4QkxmaXVDODBUWVZHYk0vZ0tLN0VHOEhQYlBpL0VuaWZGNngyVzNwOTBWTTJYUEhFVlh1Q0p2MWkzS1JmMjhRSG4xb2lLaHFmN01VRTMrdG5Oc3ZMRzVWeHMrakQycXAzWXZGQ2ZLS0piRjJEY3NuNkR4TktDd0VjT2YrZmptRTR1RmgvRGJSUjVSVEhvNGkwc2g4YnQwcWk0bkF4VTBsWlh3R3U2RUlhdDBhWUFUSkFQMWtyTE1GNHloTVVtaEo3eDZlMHIvdG5oeXZBeXJQNHllTEZhZWJlVEhwNFlKUHhoYXc0UndZK2VOYlNIOWpmTlplMjdRem9vWVlUUlloaDRoMElSQ2lpeDFEM215eHJKTXBkbEtBbDNWaGJPdVZJYmxzRk1uSUhzS2xzYjgzVU41RlhsaUoyYkhnWCs5ZGZHUlhWbTg1QVRYSTNNNGxndXpyOUhrU2JGb29YeGVyYTBRSUxxbDNJYzBTU0RwRlVwVGNyZmhWMUViZDMxeTV6eHZBKyt4YXdWUWkrTi8zNEpablRXM2s5RzFwdUN5SDdXdkJRMEZLUHk3Nk9mNlpzRkszanp0bWp0ZE9odmNDVTFuMktnM0FyMkkxT0RTUkVRaDBTVURxaWJrenZBVWlDUFJGTUF0dDJpdyt4TkczSWVPRjZtQkZLOD0=', 'ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZGducWg4SG9NTCtieTB5WjdGMlI5TFFPWk9aNXY0bzk0NWMrVUppdjVhY1Bvdnh4bWtTdDdBeDJDU3k0RHI1VlRjeTVVOUpYdUVmV2M4dEZieXdXZkpMNEtrbFpLK2dxTkRKZk40M2FmL0wreVRzVUNjK3pFS0M5aVNURkJmS3ZpeFFqRzViUmFGdXN3ekZLcGVmWUtJZlNiQmpFS3prQmpUT3lsam9DOHFaUDh2cjh1dmxzQzMzREtyaStDR3hyWkVKR09aOXYwZUpGellXRm9udGtVdlRhUzdmU2ZwMTFUYjBneCszc2hHWG5nY0VKekF3MEsrVkEzV1JRNDduVFRJOWtmUXYxaWRZL2IzMng1USsyM0tqSktJRXRXUGNkTmhqaTI2L3dHV2FPaEVzYzlpMGJKZUVkRkFydjJSRkVjNXhiMVROUjBNcE56aVp4b3FTd3ZwZDFkaEFyS3lrUnI0ZC9yeU9KMWhUYWp2cjJaZDhhNjc3bkdlY0ZpenRZV3NWOFp6REl1M0pDNHRnbldGNnNOWU9yZEVoTjN4L1ljdjJlZUZSYUx6bUhoQXVOWnozYy9wNmR0UkJNY01yTHRvM2Q1TlhDL3ovN0tZTUVHcTAyYzRGRytlcHN2QWgzSHFKdmFXSjdKS0dBbGI0RURUMjM3TWo5Q0VydzhNN0tjOFBranY4cjRaWkIrdlQ3dEZzbU85L3JIUzVlZUVqZUM4bjY3VnNvYWdHSktZWWVFdEFhblhqN0ZPR0FnK1BuYTQ2TVJxcGZHT1pmL3hLajBoVGJEV2NJeGRjTVJTMlliWXl5cThCMVVMSG1uWWoyY0llbEo2RjI2OXZWcFBVU1pzMWtseVcvcitxN3lWdHA5dkdZMGJSaHhQOVBmVHlPRnBicnVicGVSK1BITTVqOXVjUTZJOXZEZU41RityOHY1bDF1WlgwYm5QTjE1ekdvQlBvcU90aGl3VTVkWEI2cURHRHVLTFpYOHpkME5MUytwd0tEWGRCTldkdEFHWVhqOWJPT2xwVUpQUmlCdmVUVjkvNlVsR0dVYW1EbGxZSGV3U09Ga2RQL2wzdzFxanZUajdtVE81RHU3L3hKQk9WMlhzaEpKUzdQY1lEQTBoYlFQZmdoTmQvZUVCUmZqWmx4Z0loNXFpbTZvZ3lEcCt3Z1BFbnNsbGFtV1pJdXNkQ3ZSNXNQRWx2NlNwRG1aOG9JT0R3ZFRCZmpQNS8xVHVyRm5nT2lPaDVIWnRDdTg1enA5WEVQaTRselk5OEowMUltWkpKQjI0dnBpWjdiOWF3ZHcyNjNTb2g3bFgvOHkzcUgyUWFncW9FWEpRUFYvR0pKWHFMNnZFdmJhbCtFYm81ZDJ4R3ppYU9NZ0ZtVkdMcEo4Q1cyZlhjWVg3dnBzRmRGL2VRL0k4eUdhbXZNVFByL04rSFZEclZBallBaWU0VmpNODE2eFU3ZnlQSytlRXpFZnJGTngyQlU3OGVaU3RobzlZNWFvbS9YWHg0eUwwd3RNcHFZNVhoMXplT0VFcDN6aE9MTDBXOVhiTHRMaVRsbDRkYTBPREo3aVRWYlF6Rmh1OUtWMXZLeUt1bEVEVGRzYUVSNTVlVkpMdmUyVWF4VnRqNFFQKzAwbkdMK2gzQ2tCQnRJS2ZZOXJYQ2Z3Y1ZILzQyWkNka3JrdzhDR1FDNG1BbWNQaXE1ZTVKNDE5cnQrRmd5RXVJalE0NGhoMFRvc2hZNGd2N0MxOFU5VDh0eHJuMVczdHFEV2JEd3diVWRVVm9YZ0VoeGpyZkgzWjNxSER5UldLcWhpRzVibC9WS1hjVkd6NXVuYXZiNmhZWFZ0NGNEcUhJTEprMTlxb2h1a1BUR08xM2ZBQ0plWmVsNEliZlNuRjFTb0s5UEFua282TzlLaE9CUVUycjNZWmNRTHpkdlVNanI1Y1VwUEVSYW4wTEtjRUNPdS9GUGJJM2tlMjhQb2xqMkRxaXAxcDFqSXk0THVGM0JYK3I2WXFoU3pRTXRYbER0MVJNcEl1UjJiWkM4QWxhc1ZacnpNcWJpQUk1a09BTWFpd21LK1pVS0dvbXBXajJjQkxEVkVXNjNIUG5wY0JWR3RBbWFncWVKVURIMStadUlqREZjRjNFSWdZb2lHN2JhamRlNFB6MjAxajcxdFBVQ1NWbzJlN1d6OW5BSU9HbWZYKzBqNm1WMkg0dG51bDhUNXI3OFRiR0U3WjlqbzJ1Ti8vUWIycnhVQWtQZXRVa0YvT2hDTGk0SVoxRVR1VEZFdHNrVm5EOFgwN1ExZG4yaXgxQ0FpOFdQWlN5SFFNTExSQjdhemRJR1NvZXcxdEkwWUplZitUcHowdkRoTVQ0YTkvbmYzaGtKWlpyZEg4R1NDeFM3R1FoSE1uclp1bjl2aHhnYXdwRU5kblFaRDB2TEYwNnZ0NVNuS0xBSUFzd1VEVjdURlZ6dTlHeWpIOVNmVVFwQklhMjQwTXJ2WFVCVzZSVFRXNE9TVUtXVVliZEN6eFV6bi9pQzVpbFFvOUxDREljNU1FOE5nZ0pwVG1HR3J6Qm12QUswbzd3QjQ2aG1IbHpvWDhTNysvSG9YaFhxK0dMUUgwbmZVY3oxUVFYOVB1Kzl6bDkxTDZ5K3pCcW50Wm51WVhMdzlsMnEvcUxOL2FaTGtkSDhsWDdnR1pXUDJuanExZkdsb1lnK2xlVVVaTVQyMkoyNkZGekM5aWlqVVMzNkxOZUJqcWRoQ0RxVnNnQVFSdjdCK0pvSXFzZTQyNEd4YzJlMVlaekZTYXR2Z2NxS1pmS09jaVFpQmRqR3RQd3lzV3FsTkxjb3AzMEo0VFFzZXgzV2lwajNscWErQWJxR3hudW04QnE3QUd0eHBWZkhMbXkrYmJ6dWN4bGJBelVGNjBrZlZhWnJJQmZoVGNQSHFPNGFmbU9GcUo1VkxHRWU5SUhkYTFXNG42RFBaTG84PQ==', 'TlRpYks5WXppbFRlTys1cnZ2K3RqQT09', '2023-01-03', 1),
(3, '07132428', 'UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VHFNQU9GSEw0K2NPQWJuTSt0MlBVUC96Wkc4a0ZmMmtTTGpNWi8rdDBvS0RNZFdtMzFmdXRCNVVteWd2YnR4YjRDcHJCcWxKWjk0VDZ4V3RjcDY3YU5RMm5FNTZ6bnV6cURzVUhhNkxzd3ZYc1BLV29peUd0QzlsNkQyUkUweWRQTVJxTlRPaWdBZEM4WG9PcngxaUF2ZFFBUW40TWdTMzBUVmEvWWRyWGovZGN5MllkelZxcG91bW9vcU8vT01QWjUrL1Q4T000eFNKNmtONlFvOExGajRCOHZyT1kyZVkzVXlCQUp1TzV6Qk9WWmFrclZTWUg2dGlaREJTN1pEL0J2YjJURG41cVRzWENVT3E3ck0wdWYzdlZLaThkOG15Z051eVh2THZCa2hWSFoyL290ODhxRG1uZWxxZnZTSlBIbEROMkVCb1VmZTlkR1Bqb005emJNNVJtUFdYMmxOclBIc2VEenJPNkJNM1hHdy8vVjNnUHBlTnhRNGtkQU03cFVFTVcwY2l1dUFkZkZKaXBqMjdjU2ZqaW0xNjVuMWE5TVdVUlBkdlJmZDFEbGRLZ1UyclZhQzZrcUxVZlVna1JsNlVPQXBIc0Y3L2ppOFRMRVZlUEJSditTZ0JYdXIxbG1RdG9zTlBwcUpNY2t3WG5ib3JRbGo1R2xCdnpZdndITGJsUXYxV1oyRVkxcDhWMWZnQjllTT0=', 'ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZmVqb0N5YmVxMEFuY1FheFlMS3hqT2dLMmhXbXFHYU11bkNBZmtETVVVbFBzRW1rNk5QVzZwT1VpZld2V2Q0emJWWng0RHorVkpYZGRDdnFUQlA3V3pZUy9BQnlMcE1PVG9nQStkOFUyOU9xUzl0U1U4SXJJNHV3eXg1ZTdnbzlWL0lLVWkwSkZ2ZUVYMDA5VUNPQmN2aTF2NWdiZWFMaFJZUFB0NVowc0ZrMlpGaUJBeFRpUms0Z3RXdVFuY3Y5YVpZblY4Y096OVhzWjR6VUpFUEJSVGFNcnF2MlpOSWNCbWFobXdBQTVGZlpTeklWNndpalEwMFVLN29HVkxGOXh3c3Z4dTNlNG9CUXBuSUFNbmYxekM3ZkFOdlRqYlBwYnc3eFZKdmxxS2lybW16bWppeFQzT1FKNUpKa2N3OUw4UmdQblpZOWFqWFdjdVpDVGRtUEFEbzR2VW5FT2hoVzBPUG5VZk9EVDFtcnFPVzdNRHVZeUhLTkdscEJRcjJ4cHB0dmVKKzMrdGwzdE5iOTBiYkMvdGJnMG9RMmtQaVhiTWkxT1BYd2RpNmxqMkxNbXc4cUVNT1dmWWRLT2M2VkxucDVsZEhsdmhhZ3AyM1pGc0d1MW91eko0VUtvRkY0STdiako1TnBCK0U0OHhLcHMybTRseTRnTmlKR2tDSGcveEZuRUFqQWVMS29WTnpUajlLWFVVcDRvOWxnRW8zYXVVNHhqb2lScWRvc1UwSFpGVFNzZ2xJNEhSM1ZjMlNIaExRbFZSeFlrejQ3WTdtTWhmTjZtK1RodjE3NHhGWDczN3pvWXJhKytYK2Y4dklvSk93cVdiQm9lV3dUWDdhbUhCRHgrME1JWUQvTFFpR0JVamZFL0U4bXBZOGhmK2xDTTd6SnFCczZDTGtZQVY3bFFlcWpHRUFWM094Qm1kcDJPS1VraGpHYzNXMlAyb05ybjRyZzFtbm1UdTh2UTNHTUJvU3EzYnNMaEJJNkdWQk5sQXQ0b1ZQbDNhWmFxMVhpaWRvU0NsZWlOeXVBU1BEV1VaRFFFT2RHL2dEVDRleFhDYWxWWnk5ellWSWFoT0wvOGdZSFpkNVF4b21iT04xUXJIN3lKTHlpVXJqUkdMQTgrZkZFQkJ5L0RSSGNFMTJ1ditrMjUyMXhQbnIwdmt4WGFENldmd3lJNnhTck9nMG0vSGZpVHdYRGVySjV5eTZCL242VHJEblhBbnJFY0szSGhveHNVdWhSbEo3Q3lybnBySUh4TjQyZ0FaUVUzYUcyVDFyditiby8vZXJEZlRTcGQwM2VlSEF0UTB0ZmxwRUp4Y3gwT2tQY0RwdHN4THI0MERueVZPYUhKbXE4SS9ZOHZkbmpsRjlvcGk1R0JoN2g5Q1pMVWZvT3VvQ2N6QzlhU0x0dXduMjk1M3hJUGsycFdPQUhsNzNOb3pFM081ZS9PWUx2Ykw1OGpyM0FEak1Vc205T0t1T2JpaTBWdkw0b2Y3TVBmYU9GWTdaZVJXQmJrd0cyM0RpbDVNNU4wZ05qSlNhOGxWemdLVnluU2ptK0VNNG1kOVF3QXZHVjU5bW43SWUxR0ZmQ0VmRjJ2dWlqVkUyd0o5SjQxbVYxYTIxTFJ2QzlDQlNUdXArTWlzaDE2TUNXSzBiVUprMVIxT3pvK2kvOXZzL1hpazRNZ2NMNWdPV2tyZ2lXOE5jd2lKWnZ2WS9BZ01XWWNYTXZmZEhCUVRXaE92UktTNVd2ZnNHemF0VGxWOTZieHZ2U0ZSdjV0bnNOb3NGMmNFWUduS2xTNGg0b1R3ZXNFY08zdHg1R25pbmhtTEpzb0JDdmp2SXA2dmZlYmthaENYQUIzMTRwSWFYR25vZFRnMlVYV3VhTlVCdm9pWGFRREF2WC9EN0RqVGJZUHpublI4RXJMTlRza1UzdnR3cU5tTmM2NEgxZGlaYXZ0djZnL3JOTGRIK3Z1clVRUVVHRk9uVWVrNXlNbXliNkFRUi9TdkJrbzlTOG03QUlCVFhGN0FERE40dkZralF1QU55eUVMd0E3V2haSllPZ1JSMldYcFh0b3JhcURPRFFaQWdmRG5IcW5VUHMxZVI4NmNsNExKdVpwODducEExalFLbHNZTjYyMllxNlBqOFNSdTI2MTQybCtKSFBVM1dXYWNzenc1OHJOTVdSUE5PWDFLQjBya3RBWWx5ZXVZc1RVZTZxYXY0eStsN3dtK1hoNUNmbVJXQ3NraEZyeWRFQ3lKNFY0NzdwM1RHeEFTa1ZFKzF2VFdmZW8wTXR5eUViSzVsS21oa043OXJXSVp0ZE1BT1dnQ1JlS0cxcW5sckdBeTVjeFo3K3RZWU92QzlzSmtmNU5RSWxSVFR5SGxrWFlHdGdRWGRNZ2JyY21jU3J5QUN4UFJiZUNzK1U2c3Jxa1Fia1BFWUdtM2J4WWlaNFltdUEvalBwZCtJMGxDVG5ONlpLMkJjL2V6MVpWZndiSjhCcDdXdjVFTUxpRFVBcnpCY2xKVG5pbXp3YkZ0L2RlNkJncWF6RDdXRkhpcXU4UmRua0dLSHhVT1dkWnVoRnJKNG15SjVzbmRxQmdDRlRhWHNDdjFXYXNOSk4xcVJ4MmxGRDVPRTdJQ3RzcFdRcSt4ejlYUDYzVHpLd2VEQ2VrMlpiejhjYnJxOHdYdXlaMmZyTklMRCs2Zk5UdVU1Z0hZSitMRWl1bVBxQk9BcHgwRTA1MEJZV2dyNzFReGFGU0g4Uzl2ZUdsUVMzLzY2ODJzL2xGcUdRa2hGbWw1YnB6Vk9rdXJKRnE0SnRRd1BobXhkOGUrYmpuOUtjd3haWVpJb3hjUjZiN0lGOC8yREVYV2xoRXlxcnV2VENmNmdNbXVJRjA4Nkdwa21uSnlnZkF3ZFFPRHBacWhnaHI1aXFLQ2xmZGUrRHJKUXJoWUFNcjNWYnpxKzFhZHJmSHJYY0M2RXhhM1p5NzVBWDdOSzJqMFozNjJydTVPN2M0PQ==', 'cllmOFBqeXZZcEVRMjd0ZmJxMFVIZz09', '2023-01-03', 1),
(7, '01566370', 'UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VGt2bnZ6SERDbklaTjM2UUNpSUxUR2orbjFuc0FMYXJPemJPcEsraGxUY0RMcW5vK2ZWR1FtSDMvR1I1UEJXRi9zbVdBSXpYbVZkV29URjJLb3VKamIvR2F3MmRFVE90b2llRXF3Vm1wUjB5TXE1YmlIR2NyWlVITHBYU0lNb0tDaVNDVUpuQTB0MytpSGRzczY4WGpiVEx0bjZjWkRBOVp5YXo2NDZZZ2NDcFJPMzFReTNyTnNEVFRVbWVPUTdCbGpiaGZDbzZ2K3VJOTBDSFRDZVdkUGwrcUxlbFRRczY5eHRmdm5xOHdmS1BFSms4UEFxY1dYUkE5aDh3cU9jWVlWcU9SSVUvMFRWSStkSW9FWFJxQWIxV1VDWUJOcWpNLzJVZVkrb1E1YnBTc1oxN3k2ekZlOWRFWUwxY1JXTUR5TzRWTER1ZUpQdGtsOXJHTzEzMktlVTFWdFUrL3ZoNVVsT3U4SnZXV3dJQkNINnliakpKeUl3MDRKM2J4cldUUGhTL3p4eGcxMzlJMGk5b25rcHNpUjFpYkMyVVdXMExQTUx4eVJObnVMeUQyTkZkdU8rWmM1ejFlaStZSldKMFBpOXhra0N3czhodHF5THI3ZFpjdXhaNlFLUXk5NnRkVFpMV0VTSnNqZXFkcXpiYittRXp6SVBWdFVUOHhMMlFKcFA5TVFKYVNPMVJsb0huRVZEN1dGcz0=', 'ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZHlCTTBGY3NzLzlRSXB3VDR4UDFMelVBazNaUSsreHhnZ21nRWlFOUJHOVNLUXAxTUxxQ1lnVWZ1dk5sMGlDblJZaGFaeWNUMmNpMlZxK0dUUndBZ1BDNTNHVDI3NndKRDlDT1BDdUV1aW5mQ0JkRTloazlDaHZqalVsTXU3M1ZYc0lYTVNSVEZ0NjJIU3RFcVZEQThJTmd4ZE5hNlhaemhsTkRwWFcwTjAxTUV2R1FIRVY0a2VSQ1RqRlY5aGU3aXNzZmJpNzZsK2orTFVOTThyM0Nrb3k4RldRZDRzY09QWlpCRkorTkY3NVdiTVBaM3BZZ1FOOVZ0WmpkUkZoaG9Ea054cEdmMG42bXJmSEllUDFCNC9vbm5BMHo4OXNmTURBQ3FSOVRpVUpLSmJRVVJoNDY2bnBySkpxdmUyQTc4WDQremdnWXZ2UFdJakFaaTBiejZtN2owY01rZ2RLcUUzZHJrSzlKcnhkYUV5TENIOTVoREJTcUwxMHhtT2NiaVE1dlNJVTF4dUc4US8wUCtUTlpBQ0cyQ0hhc1Z5dStrYXBpVkxiVlpoT0E4bVZTRDJDWVRKTUhhc216ODNQT3ovSFBBUi91Y2lQR0tLd1RkTjdCeC96MlA0dTE1TTVOd05rcmdSemovWUNzelhqNS9iZXBGYjRPTjFxMFhsS3JSeW9sdFF0ZjVNRXMyWkVDRk5GN09EdHdwdjNxQzlVVUJ3cU02c1VBcDRJMlVmdG1iVE0wTzVZaWo0b2NLbzl1NVNGMnBSc3ZEYU9hYVlRK1hxdi9wQWorVEQyM051MU9nOCtlZ2VqQ0hZbllLWkovdzlaWlVQZmIrdSttYWlKR09NZmUzZnVNRlF1WWUyNFVIWmREYVptZW5mTm5PWGhPS05pRmM0YmdySUJ0OW1GZ1JHV0tQOGhqUFU4MHNuVjBQRHMwVHo5aldDT2ZWM2h4OWxiZjk5cFlUOGIxbUxueTB0N2Y5U3d1Zm9ZVUlwL1Q0QndIQmNLVTlzOGpsMjhOQnBFNEhNRDJxWnp1Q1JidVZ2Sk05TjBqM1gvYjBEVk9JMmEvVG91UjNzbHkxd0RlZWsvTnJzWFh4blR3ejdDK2Jvc1RGUEVqajQrK0dTMkpMN0t0OW1GS2JTdGZtRHRtaXE3QkVhRVdzcSt0WVAzWHE1Y2xwSHRGVDVJWDdnbEJYZDdpRVg1NVBhQ1NKQThUOEdsMmkvWUpNVlVxWkVQZ1pFcGlzbUdZUTRLV1FsdG1Ham9EZXFmUDJOR2YwU3hrMEw1MXdmNlFSUnZzQkd1T2UrUUljTDZkWEFaQXMxSllCTWduY1RFTU1qTW8rVUV6Y1pYbGluTnNvQnBCUFJZUkZkSUpWWStDSFl5OFBmaUFGOVVpVXByZDh1OFlIbkVxL0Ftd0FMNldTOHhsWDRhQ0szbkNTdzV6V2N6NWlIc25RT0pxSE9TY016TzlzWmZDQkhyV0ZMMnpmUEhuSkF6ZElmeDVSVjN3SHJ2azBuTnZRYmp6ZEpJbE84QVpiYjBodnFiSU5qc211SUNmNHMwWVJwOUNnWTdLdW9seGNtRkI2bDE3bWszbi96MFIybXlDU25OVDNwY3ZTYXM3bXpISlBiUXpIUnZ3VUlQRXRrRkhyRWNsT0VUbDNtM20yRzhPbE5vSkZnMTljWmErSEpqQ2QwZGsxWkJ1VU0rWnIzS0hQUG4xR3k3R2l6RGw1cnNYaHFCWUt1ZDZ4eWNpREFPQllIelZRVlZCNFJDTWZlRS9rWXFPRUVvZldmOEhKZVRIbDdSWmF2WGljZ09GNEs4NnF2NnJGTituSURSRTdQUk1nc0RJL284YkFiNU10VjRwb3p2VVFpK0IyN2owRnZjN3phaVJvZEF4Qk9ydGlrY3JMS3FqMEU3Yk1uNExxNDZFb1hvU3RRWm9kM2wwVlhKM004bE9mT0RpMTNndm04MjUxVzNkdUhnUzlmOU9weEg3Q2hxdkw5Z1lFOW50eXNvaE9CUGRUYjJURmRIYXdHWkFxUVhwZUJnaVVlNWtwSHBQd1VHVnlDSVdsMWsrRnhwL1hVd3ByM1pEWGxxL2lQV2V3bzZ2NUlFREJqM2kyZnFiekFiMWpDcllMSnRPV2xZM0dCTmZLUGxOby9yYkdNbEZ0ckZucmdJWm9seHlzRityVkVNbC9XTWpxb1EyS0xtb1pmcE1xSE40dWdGSHlsU1hYZWFjamtLVUtvNFphR08ySWZmSzlYTHRkRmIrblZwN0twUUlFL28xc25qQVNPcEFYMUYwNE5Sbit4REdtZDNIVzdUbjE5MXpNSTVFWkk1UytEUUd6RkYxRHppOGZPOXltNFdvanRGTllCdmNnZzhzVmduWkx4aTc2dXlkZEd1d1k3UXRXTk9jdG53TWtpQ1p6L0l6R3lBY0htY1Ztemp5N0VseHZ2TGtLaTRIeHJmcFc5U2orSHZwWVJvTjljU1IrSFE5OHJ1RmZGL1RNbWZrTHdSL2JhV0dWam9TOVhqMmNQSDBjdlYzbU0rdEJPQUUzTzhOTUZTU2dWL2hLY1dJL1hhMmMwUXNpY01taGlsQWlxbGliUkF2ZnhZNTQrQjBFeUw1YlRJTEtCOWZTL1Y2amU4NGRaUjhOd2UrQmV4Qm5qQUJnQ0F2NkdSeXIvYlNybFdMZkEycmZsM0tJd1ZzVmpWaWQ1aHNmUmIxNnRFN3VLSS9VMVBBOXFCMXNvVGxBUjlxRHpydWdpOU9pUUpwVFRqUE11dGNDOW8yTkFHOUN3WGowTlk5S3BXWGdBZEIrbUM3WngyYWlvb1U1UXo5c3dESm5TZ3c4bUs1bDJpMS92TjFQa1lPNC9SZzhpVHhWVXpsRUsvZXprWEpjUXlxTU1tVTVDdmMrRGV1VXQvS21iMnBaeDFQVFVkWndhSjJabFlKai9ZTDA3K2FNRDRnTHQyRXR5dk1wWTZFPQ==', 'dkROS3B3NWtVWTN4T3pZcTRXcVllZz09', '2023-03-01', 1),
(8, '05787285', 'UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VGdxdXBjdG9ReFRxTXlROUMvTmpsSTJ2U0JIczFudkRIRmg0WjF4UkJLUFdsVmdkWk00OWJySHpOSWNYbW4zekNlUmdFTDNhdXNsaXdDaWMwSkhCSytyTjdhTnZkUldwb1granFURlNTcHdRNGh5NWdoMFJRZFZSZkF3a2ErY29sai81V3FXMWNqQm5idnN2eDdNMlpwZm9DSWpwaTJmSWVSU2drNUttMVExdGxIUHE4Z3RYS0xwaEg0VFU1UHVSNzdySElPd3UvcHovWVIwT3hQQXVKRUFvbmZiYktoempHZDZFU2x2U3ZzZDd5dGp4cEJJUDFxV1BmMkxDdEFsNjdrN2haQVJhTWtSZVhvV0VaZEFMQ3lyMVZoL21IS09uL0tHU2JUaFhrVlN3MUR3NEMweVFxWWVLZFZKeXZkL25HaFI4UjYvL2JhcElrODN5cXY5eWFUSnEwMGRMVlMyTmIwcUd1TEM5TXZzWkptWTRMUmY4STZxRGFBbVRWdEkwaEJ0bTRQc20zMGM2UTVNMHBqd3ZxVjdQMVlJVCs5bHBRRXlqSnlIZERYMGN0OHBxczR1TDhuemo4eTRMUjZ3RmZ2YWpLQy9iWVFLZjlzcGE0S29qa3RiSnhsTVJ1WkNrS2Z4R3hMcjNnVStHeUlKOFBTRGpNRmQwV25Xd29oa2JXV3J1UmZZNVJVNm9heDZJbnRaNFB6RT0=', 'ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZDhQcndCT0JDRTlZaWdZc09vTVFiUWZEM3VnZFJyeXVIY01EdGtJUFFHSWVHL01GZ2hvSnFlaVdva0pWbE1kdVArRDUrQXVVK1RxZGdLc2lweVBuZllYUkxRck1GYldhczd3VFRndGpObGdJR0tmd2JWODh1eUJ2MXJnRkxuRTd4VnoxMGxlMlM5c2NJbGg0ZmxNMFNSUHhpUEE1SmZ0UmNsYk5OZDRkN1VpOEZ1VXpQcmdFcXlHVmMyUU8vRTU4ekQwbGhuL0hZbFFBbWJQSzMzbXd6OG42Q1poQnZuTkFDTm1OYjRYbitTOEJpT3VUczF4UHk2dGdIcjlheTI5SEhlU0J1SUJZS2RvTDFBY1liNUpQVUJYZVl6Ny9zdDQwazhhNk90Vm54cktUZmlYZnZSZEVoNXpkczMvbDNGVHBrTVpPRThSNmhPNS9Kb2hMbU52VGpPM3ErWGRnTi9rV21RWHY3QmdIQ1RJYlF1MFJJQ0lMbUQ0ZjEwdWVtRHhYS1hhM0Q2cnc2b0hXL2g4OHNvd3BYK2lNSEI4Mi91bC9xMmlFa0s2N1o0SFBXQndwQndvZFJFSEtsSUlTWGpUSUU5ZnJSZHdKdlFMNys4RktFdktYbkNrNXdVaGRJaC9LQ2hZM3h1ajQ1Lzd2UWVXYnZvNWYwZEZrVGh2Y3Z5YndrU0pERlFrTzk4dWRYaTZXcVRYNEJDdy9Bakg1V3RiUTk4RStncE1LYnNNT1JMMFpVeG5vT3BpMmhCdkxPalZQWktvOXBPdlFDa3ZYMDU0dkh1Vm1tVllHSUdmVGlWemtwMmZMWnU2c2JhdHZaRHNWQzN1SWFCRWFJM2N1QkNVZzYyRmJXbGQ2OTVBMWZVRjZ6L0NnV2RCaCt3R1JKbWZnenRxMVYraURMWHd3encyeExabmR3MGt6TmRNaDc4Z2NIRUdOT3o0d1ErbE16SC9nQ1hLSmhqRjZ6WHRUeGJIOEVuSmk2Q3BsVXp4a0M5RkxHRkxrRGJOVjhyaDJxRE9qOFNJb0RtbWJkN3l4Uk9RdUVKUzRjQkFEbEswSmdSc1JRU1FQVzY5OEZRd1pRTEE4ZFl0Z1o4UjVJK0toRzNabUx6Y3NNZWNJcFlWbmQxTktjR21wK0NGQWM4Nkd3TzMvcytpbWZKbFV6alVtcERpTnVYZHRLdUVtR0FLa3hXdG1LWTNVT0xlMDFrVm9yWS9raXp0UG50OGNPYVJrRWtURndsSkNOYWcwZGpZM09pbFhXNzhrS1lBUUVLOXFjcitmNVlVUUxCVGphVG5pV29qb1p4dWNicU1oRGdFalg3WEp1K1I0R3p6OVM3ZEQ4cGY2QlZxK21OSWlWdXFsR1YvLzRtT1o0ckVRbHRuSTNlRnE2SGxBUFJsNUc3M1RobTBVQ3NvYWhDN2RUMnQwTFpOeEd2NGgxWExCdmo2VEI2aFRyNmpKN093OCt0ZkdzbG45cGxmUERpY1p4NnROV2hpakJ2dDEyYVFqSzlGSnVDNFpsZVYxeitDVzN3Ni9HWDBWOHFlZ2podEVJMUNWNHpVSHNJbENENVZlTEFKVG9vSTJvc0tTc0pHSlptTXZ3NXZKRG80SklHbmllMUVNeVJvRHFJdEUvbmNMNVFjdlU1dTlXdWFwbzV6V2t2ekZQdlJMWUlzNmVYU3BicHpORXgrNElFWE5DbnU5K0pMRitNQmFvK1RtLzREOHlRUUpXcU5Fa0NmMnIrTTZTRnBvemZKVE5yQjB1bHI3T0ZVOVNaeDNkVmhISjRNUSt6eG5aRHlUdSs4RDIySDIwU0ZCYTZ3N0FLYXkxOTcyYUdOcCtCcUl4a1BoVjFSWCt5Zll2dkRDT1VTSTJUTmhqNXp6UC9jRFJZalRlYmNoYnR3TWZVdVErYlNZY3JlcEp4RVhscy95OFFxVkNyWkxROUVZVXorcG9TMVlzVHVSb1ZtMUV1Z3l4WllMakJTWDFDeGlSTUM1Yk45Tm55cERxYkpHbGRSWUl4dEkzUTJrUENUSkdkaTB2NExOZVlsNUwzUEJSTmQ5LzRnSUgvVVA3djg0eUtJd0wyMjhnZEp0UGkySFY0V1BrR2dwT2RGVVBJb09pVTdFUHB0REtHR29zZlc3RDFwbnVqR1V2YjRLdldtV2xjOTRHQjJuNlB1TVpFVDlBU0JBRU93SnlKMGxINnQ3Qm9rdGFNVFBvbnJYNE53RUZoS1RnZnczUkIxQXFRbjVnUjh2UHFlZXoxc002ZmlncVFUejdaWkxERDc4NFA5TGg0VkRrcVY1cEI3V1RQbzBJR1pqYlJURWZtZ3ZZaWJ2aFBteHZHNHNUeVg2c0xYR3BXQ2xWQjZlTW54eklNTEVwVWdiTWdMUTBjWkZUeHJyR0xwRWtPQlREWjZ3T0R5WlVpL0F4dnQvbnNWelRzVGFiWmk5a2FOZVBUUFNlVVBzRndFYWxuY3lRK3NWV1BTMm05U0lIQjlMcWdVbStlZVFkMmxpQ0hFL0JuUDNMcUZGaFExM2x4VkFxLzMydG5QNzlYMU1jaW9sekJJamhDa0doekRpMjFNSVFwZVBybStaZVdMcVVHK1lxeVVYTlFXaVNCR3A2WjBybDk5Ui9DQWhycU9SSy9GMUtncEVuLytkTm8wR0loTFpuR3BiVkc4VEpCM2FkbXhiRFRlZjFNS2lIaXlLRzVOems5ZytIREVxbWJFMXM1bDhmempFaHBNOG1FUGNsZ09pdXBTUitWRzZBTUlhVFMxdnNVb0s1dm1RUUtEUFhWSHgrM01RdHVNQk9ydWN2MlN2NFZIdUMzcU9NK1Y4cnl4QVcyWklBdVQvcjRLelFEbXBSa3dPWWcwVy9Cb2djeEQ3ZWpwbVZyK1FSVkduOGR2R0JPUVNCVVp4Z1ZtRlJlUnM0RXFoYnh3MW55QWt0YWNKTkY3WmhybEhqWTcvS3YvZGVWYlpDRmVnPQ==', 'bWxmMlplVUNTR1J3MVl0NjNGamlLUT09', '2023-03-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `saberes`
--

CREATE TABLE `saberes` (
  `id_SC` int(20) NOT NULL,
  `nombreSC` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_SC` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fase_SC` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `saberes`
--

INSERT INTO `saberes` (`id_SC`, `nombreSC`, `trayecto_SC`, `fase_SC`, `estatus`) VALUES
(1, 'Metodología', '1', '1', 1),
(2, 'Estadística', '1', '1', 1),
(3, 'Prácticas Comunicacionales', '1', '2', 1),
(4, 'Computación', '1', '2', 1),
(5, 'Metodología Ii', '2', '1', 1),
(6, 'Estadística Ii', '2', '1', 1),
(7, 'Prácticas Comunicacionales Ii', '2', '2', 1),
(8, 'Técnicas De Capacitación', '2', '2', 1),
(9, 'Comunicación Efectiva', '3', '1', 1),
(10, 'Metodología Iii', '3', '1', 1),
(11, 'Negociación Y Resolución De Conflictos', '3', '2', 1),
(12, 'Formulación Y Evaluación De Proyecto', '3', '2', 1),
(13, 'Cad', '4', '1', 1),
(14, 'Innovación', '4', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `secciones`
--

CREATE TABLE `secciones` (
  `cod_seccion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_seccion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_seccion` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_seccion` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seccion_alumno`
--

CREATE TABLE `seccion_alumno` (
  `id_SA` int(20) NOT NULL,
  `cod_seccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_alumno` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rol` int(20) NOT NULL,
  `nombre_usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_usuario` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `intentos` int(10) NOT NULL,
  `codigo_desbloqueo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cedula_usuario`, `id_rol`, `nombre_usuario`, `password_usuario`, `correo`, `imagen`, `estatus`, `intentos`, `codigo_desbloqueo`) VALUES
('00000000', 1, 'Superadmin', '$2y$08$wkSQR3522AQe7U2gywj1LujLmrZxHwWoiE5PfB0rDIaRsviVJER3W', 'pnfhsl10@gmail.com', '', 1, 0, ''),
('01566370', 4, '01566370', '$2y$08$u7VhzsOBIQQpyAWpTZ6N5uEusfRIGmc8LVTBIIeK1SKUZL1V73hw.', 'judith@gmail.com', '', 3, 0, NULL),
('03633921', 4, '03633921', '$2y$08$P.9b1ZJBNdMV4Yu1QiWSVOA.hi88Mls.nw71YIyPbUID89qNq17hq', 'luisguillermo@gmail.com', '', 2, 0, NULL),
('03756922', 4, '03756922', '$2y$08$1Ha1/PF.ZhChC5OQY8DDIe7fligMPUlAPkOXlT2.y65K/a0q8fO3a', 'edgar@gmail.com', '', 2, 0, NULL),
('03782342', 4, '03782342', '$2y$08$GLKnNRwP/aLtGXfts/HmGukY9YvQWN8REiljJlGOlPTuOAlggAxr.', 'ricardo@gmail.com', '', 2, 0, NULL),
('03787540', 4, '03787540', '$2y$08$liiwN.0oVVU3IwdljhVXDuEvmG40ONXvixegcAn7FPyBEdnOYoXpu', 'pablo@gmail.com', '', 2, 0, NULL),
('04002660', 4, '04002660', '$2y$08$XEwGrENtigERXfxxxskdW.k8YqBAnvsVwEvFzkQsRzN3w3aEqWNRq', 'cruz@gmail.com', '', 2, 0, NULL),
('04177704', 4, '04177704', '$2y$08$sMFjuRVWWLyvHLTcsdcdheRLlIJFYa7Z/P69Za976EXGCAWBN4tPm', 'jesús@gmail.com', '', 2, 0, NULL),
('04342594', 4, '04342594', '$2y$08$GL1eg3a.9Iib24TLlrfD/OS2tMfdVal4mTfzN4RhjnMsN7PeQ7OhC', 'bertha@gmail.com', '', 2, 0, NULL),
('04373481', 4, '04373481', '$2y$08$IsHjlN0IcP5VAN9faGEcZOXONO7h7xvvRQPAWHhR4pNsFbll.VeNi', 'arelys@gmail.com', '', 2, 0, NULL),
('04966848', 4, '04966848', '$2y$08$G.uapVyu2.kgL6M37jQrf.ek7X8YS1nGYPO.RPKiSlwGjjjJA0jNS', 'carlos@gmail.com', '', 2, 0, NULL),
('05116367', 4, '05116367', '$2y$08$w6pqHUlQKhk1wqGMU.c/uOo3NW4PoLk7Ww7QbTAwvcCHkyxRb2THq', 'josé@gmail.com', '', 2, 0, NULL),
('05237891', 4, '05237891', '$2y$08$ZsumZ4UJ.wIJhGccQRQXd..7kLHx8t8vHeJMoeWx4JphPD/1DaSXe', 'alida@gmail.com', '', 2, 0, NULL),
('05243212', 4, '05243212', '$2y$08$M38OqcvaVkYXMWPs49szZOBOGhiFJ5UJaxhqh6UEcu0SKF1CFmp9K', 'luis@gmail.com', '', 2, 0, NULL),
('05250654', 4, '05250654', '$2y$08$Kl8iEqGoqsZXbPajI59/JOp7BoLlHW3D65HwWhpo4AwHEx3cuVMbi', 'andrése@gmail.com', '', 2, 0, NULL),
('05787285', 3, '05787285', '$2y$08$/N6KML9bS1FN8NKK2N/oDeJIzq17MoO1l1/KtPtrdPyFaoBXDfFw.', 'ivodejesus@gmail.com', '', 3, 0, NULL),
('07132428', 2, 'Elizabeth07', '$2y$08$gjTZINac4w6CpyJI.lCUwO7K6c3BIpHIVpL8twfSSz9psDytKJ7ZS', 'elizabeth_briceño@gmail.com', '', 3, 0, NULL),
('07313351', 4, '07313351', '$2y$08$vfflFji5XxLcJ3VeT697YeKavldwUtAUKrdVBLCwAbwTpZWrkMI3O', 'joségerardo@gmail.com', '', 2, 0, NULL),
('07348871', 4, '07348871', '$2y$08$F2SGxOHVH15ACfVrhQ6h3uMun/GEHEejNu1akQr/8COh1qifu5jKm', 'elisa@gmail.com', '', 2, 0, NULL),
('07350834', 4, '07350834', '$2y$08$C5dXZSK/49waNYaiwurLMOsUVu3XcVydufjjKLNji78vPq6Hi/S06', 'eunice@gmail.com', '', 2, 0, NULL),
('07359667', 3, '07359667', '$2y$08$WkqIi7HeksqD0n8SlvnM/.y4.5oHXUSusKSVPCmMBJcdV512jisYu', 'elioandres@gmail.com', '', 2, 0, NULL),
('07359889', 4, '07359889', '$2y$08$p4nbsbH13atcMdjsKdv/LOwFdqmewqeTc4qnG78LFuO2Cv4pxPeJm', 'manuel@gmail.com', '', 2, 0, NULL),
('07386104', 4, '07386104', '$2y$08$PsHAfidfFytNrnQBrFc6mOAZ4HbYvd87UgLBBh8gsiG4nDWOHKAAW', 'lesdy@gmail.com', '', 2, 0, NULL),
('07387449', 4, '07387449', '$2y$08$JVZXIFqJNxF8.toVhA2veulLNlcw98Us6.o9WzULU6BLvAlYh0CJO', 'oliva@gmail.com', '', 2, 0, NULL),
('07389728', 4, '07389728', '$2y$08$8ale3h2Z9KRE196VF/6Ffu2evJS0RBrLRbAak82yWyZT/Fkz3ZqzG', 'jhonny@gmail.com', '', 2, 0, NULL),
('07395006', 4, '07395006', '$2y$08$mfLVjlJY0uh8YNMv327D/u6qAaeUouhvStBI1HDJmSwzkhC1gZNIC', 'francisco@gmail.com', '', 2, 0, NULL),
('07399931', 4, '07399931', '$2y$08$owkHQMIcdRfJJZqOPDqe9OyLQFpma08VjhMIz2PicJwCmT7q9UQJq', 'rodrigo@gmail.com', '', 2, 0, NULL),
('07403069', 4, '07403069', '$2y$08$aigMH67/TRxbDj2SZ2ZxGONTlZj4oOK6eyvEgmzO1wMNXq.8TG4bK', 'jairo@gmail.com', '', 2, 0, NULL),
('07409068', 4, '07409068', '$2y$08$3R.O3cURM0BWqP1LmMbSkeHoSskfG5alR7gq91JA2vr/uA36jJHTu', 'elsy@gmail.com', '', 2, 0, NULL),
('07438075', 4, '07438075', '$2y$08$K2rhMPdPB2fbrOJFDxUSo.fa./7vv0v6X3idfgSf8lKm.6.u1EreK', 'zieliska@gmail.com', '', 2, 0, NULL),
('07442799', 4, '07442799', '$2y$08$v//Ci04LmYZceo7TEPLY3eXkHb4IGXCRv/An/TNpbWrDicd.Zja5i', 'adolia@gmail.com', '', 2, 0, NULL),
('07914356', 4, '07914356', '$2y$08$PiMJqR0KQ.Gbgv2xLxFllOwWGyk1yc0FuLyzttnJZUHYu82SotJIO', 'evelyn@gmail.com', '', 2, 0, NULL),
('07970802', 4, '07970802', '$2y$08$K7xC/oknA4jtuwEjj.LLsuMdWwirrllrF5mvDIieGShoZijr6qJeW', 'camillo@gmail.com', '', 2, 0, NULL),
('08627938', 4, '08627938', '$2y$08$OoiacG9E0xiSosSZZfoPwei5ouwrLz8neaJUjvMmiqvbuxStbgvh6', 'jenny@gmail.com', '', 2, 0, NULL),
('09048980', 4, '09048980', '$2y$08$kYixEL7JaG7RtJHUmN3eNuTBVOvzzAVPphMTfshvpKvRETf8S1jKC', 'ynmaculada@gmail.com', '', 2, 0, NULL),
('09378013', 4, '09378013', '$2y$08$e4jpjvtHaWyXJ4/ffmHvEOYytGNPaLO1j5EmY9BiaN0gB/StjpslC', 'yelitza@gmail.com', '', 2, 0, NULL),
('09544153', 4, '09544153', '$2y$08$Y0CSNle49o1Bea8fPaEmc.QHEwycuYGoapLTqT5X6/gwqOMcJGjnO', 'david@gmail.com', '', 2, 0, NULL),
('09579750', 4, '09579750', '$2y$08$XgTHaAoVo/2l6/0I5c4IcO025fj1KSmsg0/BuAkuDPTRqoExSfhN6', 'johnny@gmail.com', '', 2, 0, NULL),
('09626909', 4, '09626909', '$2y$08$ASMPctZUPoLW8bJsy8MJwuXoxCERxmD88Qdy2AXpdMd.tRR6bl3Jm', 'yuli@gmail.com', '', 2, 0, NULL),
('09708093', 4, '09708093', '$2y$08$HY2qD7JApB4aH063P1hgY.D96AFolZfXMPtR1bvUjrvXu/5gZKoYu', 'alenis@gmail.com', '', 2, 0, NULL),
('10338520', 4, '10338520', '$2y$08$/McvYK6jYeANhUOfumrDP.pARMaRGuiFS3RaUQUslYnP5RyS0w3JG', 'winston@gmail.com', '', 2, 0, NULL),
('10846059', 4, '10846059', '$2y$08$TDxOu/CzNTSDgQkAhWTq0.eWPMuteRPFxpVKcotJl71iCnkHr95Ry', 'maríaalexandra@gmail.com', '', 2, 0, NULL),
('10849476', 4, '10849476', '$2y$08$F9CLPl1Uy72Az9QqRul6Gu5MrzH1FdZW0YuYYvRw4AHksNP9Mlg/2', 'walter@gmail.com', '', 2, 0, NULL),
('11260305', 4, '11260305', '$2y$08$jbgSOFzq85DZO.c2QL8xoeceEh.BsT/Bz5iEMU9mpnRkWH6dDAWSC', 'eva@gmail.com', '', 2, 0, NULL),
('11580182', 4, '11580182', '$2y$08$SctmVhgAZid0VY3dY1UNDe8NFi0aPWU7iP2IUcDED9J2r2Qwvr.5q', 'endert@gmail.com', '', 2, 0, NULL),
('11587952', 4, '11587952', '$2y$08$VCuHWwuxw9oWRZh1XkUsROdW4AoznfB..St36l5qcEeHXujLZ0n2u', 'alexander@gmail.com', '', 2, 0, NULL),
('12023810', 3, '12023810', '$2y$08$ro/flrN4N2QVtwfIij.PVOYkhYk27WUFevzY6MPEZc/d3o/gs9BFG', 'yrisnexi@gmail.com', '', 2, 0, NULL),
('12026793', 4, '12026793', '$2y$08$R4kdPsPTA6gKLY4hJRxvt.rco29qsbO6N6UqVppi2gVSK/E6wLKOC', 'carlos@gmail.com', '', 2, 0, NULL),
('12244128', 4, '12244128', '$2y$08$A2pVuI4uoU0I1qIyGIYa.OH23FbmY7JxklIsnwZxwA6ua7nIZLQ9m', 'yajhayra@gmail.com', '', 2, 0, NULL),
('12278410', 3, '12278410', '$2y$08$kXLo8KEpQnv8/c0.kAvxNuoXU8QFfGP15NIxIi0Zji0x5WHvhc5.m', 'argeniseduardo@gmail.com', '', 2, 0, NULL),
('12346649', 3, '12346649', '$2y$08$AGoUPYbZzFMTCPJR22VcwOZVf6eRpihCV8peWF61zsTwkm4q1CiOq', 'camelialeonor@gmail.com', '', 2, 0, NULL),
('12534603', 4, '12534603', '$2y$08$sH4RfJ9jmkWIiHsL5pqZTuR.30RFLeWFLAlzA0MohmP40oNPwc5LC', 'dayanara@gmail.com', '', 2, 0, NULL),
('12630557', 4, '12630557', '$2y$08$Pq0ktYxe3NlTBgezGmOQhe.0T3b.cHDY.oeJRxXivu8XIMRTt5cMO', 'michelly@gmail.com', '', 2, 0, NULL),
('12669401', 3, '12669401', '$2y$08$fwTMCKVHbHqu5ptmrtNwpOz695r1G3K6YkbR5h61EO0CChsOHU4hu', 'danielalexander@gmail.com', '', 2, 0, NULL),
('12698690', 4, '12698690', '$2y$08$nakuY3VBvn5oZR4BPtpI2OwFll3meKpCXqjOccD/qBLVViPtoO/AO', 'maría@gmail.com', '', 2, 0, NULL),
('12703237', 4, '12703237', '$2y$08$t6agz8Bu3ndp4/1wAdO2VeD9IOr8s6CfGnjG99W4/CS3skobRHtnm', 'gizet@gmail.com', '', 2, 0, NULL),
('12706637', 4, '12706637', '$2y$08$6JMNdRojBAPLTTJW4adzWeRUh8gxxw9FposI6VpE/TRKIt79vnOY2', 'lisbeth@gmail.com', '', 2, 0, NULL),
('12707546', 4, '12707546', '$2y$08$/2tc9BQKH9cGSMK7ArLZTOWDgk44WIH3gIJaqEXbis77/VlgwMtBi', 'larry@gmail.com', '', 2, 0, NULL),
('12850970', 4, '12850970', '$2y$08$fGXeErSES1ualH1kd8LP1.mEi9cJ1GJSXF6Jkr9F0Gma7CeqgZ/OK', 'sergio@gmail.com', '', 2, 0, NULL),
('13032697', 3, '13032697', '$2y$08$9bQpE480NCszS6TGVqYt7uOf65QCi0R9z5dBPIZFHWEDkhA9es7SO', 'mariaesther@gmail.com', '', 2, 0, NULL),
('13036074', 3, '13036074', '$2y$08$ggLVcWbqSTMozOLYbWga0eVSn237cmvjPALL8/mOIs8IfSfPSZZhC', 'yireimadelcarmen@gmail.com', '', 2, 0, NULL),
('13119423', 4, '13119423', '$2y$08$02QlZ5CZp0i6Jss3tyvAJ.GCl0e8t./J4JITEBDvSlhQpCRIHyQPm', 'marvys@gmail.com', '', 2, 0, NULL),
('13189208', 4, '13189208', '$2y$08$YLjLm97salCGSmg6F9mJQewEhGJQ/2or6/TmyIY1De0W/cHPFnlmu', 'orana@gmail.com', '', 2, 0, NULL),
('13264251', 3, '13264251', '$2y$08$m9LpevhczWewwfjEhy20AuwpzhuVai7.lhnpMwbYO74nyN17EqCeC', 'richardantonio@gmail.com', '', 2, 0, NULL),
('13509849', 4, '13509849', '$2y$08$lq1LzVM/bcsnlSSu25uKB./G3FV1JFr6mwQoeA7i8Pa73fWxZvOsK', 'lilibell@gmail.com', '', 2, 0, NULL),
('13519545', 4, '13519545', '$2y$08$5ffc6Uuagg4Et1pVgQkk2eSu.YIevD0kfs0vhYkYpnMknBv0BaWie', 'anabel@gmail.com', '', 2, 0, NULL),
('14031622', 3, '14031622', '$2y$08$9zm8SIYakgwiYYRdSYQcpe5OEeoMnOJRCzI.wCkoqIZiGVk3yvQ6O', 'kelymardelcarmen@gmail.com', '', 2, 0, NULL),
('14068853', 4, '14068853', '$2y$08$Y5T3RuplYQgYHYQIUchwBucC0Q11YhBqzEemqD89mX.cyL440HGRu', 'gregorio@gmail.com', '', 2, 0, NULL),
('14228345', 4, '14228345', '$2y$08$meilavs8CJvIJIvrBg0Di.FxUPCT7HEd4R5SBtifyMjCOJMD/xDAq', 'yennys@gmail.com', '', 2, 0, NULL),
('14262620', 4, '14262620', '$2y$08$PeEDT/6SJCrSVqNja4f.vOD42NeQP8Qwinso6KqU0/eBIWxQ5U.ra', 'miriam@gmail.com', '', 2, 0, NULL),
('14513542', 3, '14513542', '$2y$08$xoTSbXmOUa0hxT7LymGnR.RYzFwMjeP6V4RS5TFeo5Th/jdZORIDS', 'marlycoromoto@gmail.com', '', 2, 0, NULL),
('14590758', 3, '14590758', '$2y$08$QUNblaA7SetnmAh97GV3MepWDm1C1z3hFPNxJcXpN2NEwmrl8m0vq', 'jacksonemigdio@gmail.com', '', 2, 0, NULL),
('14749211', 4, '14749211', '$2y$08$W8vum4HojhgFh6/BkeF5hOq16aXlKEdJNEzT/r4L712Sgkn.JJxGm', 'somarilis@gmail.com', '', 2, 0, NULL),
('14760449', 3, '14760449', '$2y$08$kQdU0uag2gaV1Ry9SsCJ5OtKxabpdQuOtSsdSYyMKiwX48NaUlEW2', 'heidimargarita@gmail.com', '', 2, 0, NULL),
('14880601', 4, '14880601', '$2y$08$IieKorud37YunH06J1j0rutVSDoFPpe1mq2rXQVQnmr5xZx1G6JlO', 'johanna@gmail.com', '', 2, 0, NULL),
('14979119', 4, '14979119', '$2y$08$j7NGvcEsFg81go4Rbd1cye9Is6RC3iLqsc4XQheU073rRBhRXdwFO', 'migliver@gmail.com', '', 2, 0, NULL),
('15229143', 3, '15229143', '$2y$08$9motQI1NipGHvxWFW3i3QeBvmw8B4OG6NiUfLRTD1DAQF.QzcYYyq', 'ricardoantonio@gmail.com', '', 2, 0, NULL),
('15446339', 3, '15446339', '$2y$08$5TT901KzxykxCaVNyGHAOuv8aROe9aEJMoSwTGAZfkBOYtWW5rJ9y', 'yorbinjavier@gmail.com', '', 2, 0, NULL),
('15482467', 3, '15482467', '$2y$08$SO8We2U8s7SMhSDPEyCUSuFteSeJYBgmPZc..nVq0FVrxIfWxXwku', 'lisbethcoromoto@gmail.com', '', 2, 0, NULL),
('15732561', 3, '15732561', '$2y$08$2z/t1ENbvvNjwZGx9D8ui.MdcXZA9NkNfVvgP45Qex4MMsiDEYT5G', 'josemanuel@gmail.com@gmail.com', '', 2, 0, NULL),
('16385532', 4, '16385532', '$2y$08$ISCk8JM06tsWR0rkpylKYOA44HHc01yGpOFVpAROVdJEpemTEomgC', 'isaac@gmail.com', '', 2, 0, NULL),
('16736117', 3, '16736117', '$2y$08$kdEXKeYIpB/fQBL85ZCPceX4VlAMpZB.g/Gs7R21CVFxMgswpSzqK', 'evelynjosefina@gmail.com', '', 2, 0, NULL),
('16794591', 3, '16794591', '$2y$08$nVKhdHjWQgGn3tJIK0UMzuaoEapIUUu15m462f/wnzs9trRiQqAhy', 'jackelinedelcarmen@gmail.com', '', 2, 0, NULL),
('16867504', 3, '16867504', '$2y$08$VSTrg8gZxyx9CLF/Sm7wCexslnze5T4l/aVckARHmBphFdEGi7S7O', 'nestorluis@gmail.com', '', 2, 1, NULL),
('16898818', 3, '16898818', '$2y$08$bPbPATHXF3o3J18uxpLFg.O/W8AQ3/GAv/pW9O6U2iRq8wizxMKSm', 'hermesalejandro@gmail.com', '', 2, 0, NULL),
('17379196', 3, '17379196', '$2y$08$X6jcJEEyih4MiB1Ye5qScexLwobkHOEi/Z5zM0J96UDmZX3fEzhH.', 'gelisayoelin@gmail.com', '', 2, 0, NULL),
('17380052', 3, '17380052', '$2y$08$F6e8xhK5n41bETOPLNH4oukO3kN8iZ4q0ZEIV4vyTogAU0JPdSAri', 'andyyixon@gmail.com', '', 2, 0, NULL),
('17380408', 3, '17380408', '$2y$08$5iGkgdVrYEAcXmPNvXOcheTsAM6Jx/oWMB/N8/5et0D3OznjjSJky', 'italoeduardo@gmail.com', '', 2, 0, NULL),
('17380419', 3, '17380419', '$2y$08$W8d5BftX7j/1IDjkiG.xeue0RfLDZFeYXFGM7zJfY4Z/eFnjqduwe', 'cecilioantonio@gmail.com', '', 2, 0, NULL),
('17573748', 3, '17573748', '$2y$08$qFrFj2Ll3WkXbD9ZsM04m.4.FX/9w2NKZDILmjbp53LZiiOd4A7Di', 'leonelalfonso@gmail.com', '', 2, 0, NULL),
('17574088', 3, '17574088', '$2y$08$oeYZiMT82VV61C4Ewu.ZYeoQb9FcCcJ6juhrC9D1fqtOpSRa8QY9q', 'rafaelalberto@gmail.com', '', 2, 0, NULL),
('17612167', 4, '17612167', '$2y$08$/zyOWF6qkUHelA156rO7aebjLubqu6Vl6BPyrkNt8Werb0V03IuCa', 'francys@gmail.com', '', 2, 0, NULL),
('17626769', 3, '17626769', '$2y$08$qtxehe/1u8hXTsMt4cNn8emqAGd3WxCLB8u1fluqR19RmMGSdZdzy', 'kenianbeatriz@gmail.com', '', 2, 0, NULL),
('17859482', 3, '17859482', '$2y$08$wPqLCJsgbXCC1HRDIc5SruMWt75vwnCN3Qy3aItlBJmOWA.rrJnXm', 'elsymarina@gmail.com', '', 2, 0, NULL),
('18059528', 3, '18059528', '$2y$08$/.wFRe5jxgWQnVy56zBdJuY.yqHD0rvQKgndp1N71qoqAL2gnBTBS', 'mildredjackeline@gmail.com', '', 2, 0, NULL),
('18226221', 4, '18226221', '$2y$08$Vyck47rVvhOHuN3adhQf4.8BYyXmepWySDyVwzZu4V9O6NGPAIsm2', 'glennimar@gmail.com', '', 2, 0, NULL),
('18421151', 3, '18421151', '$2y$08$DGK6d6UXBtTgS/EAok8ImeDgvIXX5fIpWuBSR5Zyu5cPMxsky65Gq', 'ignacioemisael@gmail.com', '', 2, 0, NULL),
('18690684', 1, 'Joan18', '$2y$08$dhacF2aI6NnSHTKB7/lZPuVHncP3pHltvLveMdQB7cVXp4h/BLdXm', 'joan_18@gmail.com', 'assets/img/perfil/18690684.jpeg', 1, 0, NULL),
('18917274', 4, '18917274', '$2y$08$fXjABVBcOwUf2L.AxvZ99OnCjB9oRb0Imf3GokAhUuViKGCVnEzei', 'andrés@gmail.com', '', 2, 0, NULL),
('19106390', 3, '19106390', '$2y$08$dy7DM4B/K7tJx9kMit3pl.1QvprbFp05Ph/.mUKQkvwoIntNx3Ijy', 'yecksonjose@gmail.com', '', 2, 0, NULL),
('19241105', 3, '19241105', '$2y$08$uI1zGNNK.UWU1MYVSl10GuloxIkdgBDhec1ho1WdKk2LjhhHlicaq', 'josephkerenskin@gmail.com', '', 2, 0, NULL),
('19262335', 4, '19262335', '$2y$08$8fEZXo7JFdUlfBW2cCHTr.E27VICdmQ7ZnSsqxJYqwpWNUVOZqoMC', 'aldo@gmail.com', '', 2, 0, NULL),
('19483057', 3, '19483057', '$2y$08$2VzhIZQqFMKZ76.KMsVpG.jNA.b1d/tS9Gr45LtkkMi7kgsV80WHa', 'dorangela@gmail.com', '', 2, 0, NULL),
('19591089', 4, '19591089', '$2y$08$mOYtmNEY4.KBr/INfrknI.YQz9DvREMGy1Gy84MkkIwtcAT5thnxK', 'carlos@gmail.com', '', 2, 0, NULL),
('19591195', 3, '19591195', '$2y$08$OGd4hxbTZye8GJgrQJOdUOKNfgNMg9/yjyAum8/uz1kne77jcY73.', 'keilacarolina@gmail.com', '', 2, 0, NULL),
('19828762', 3, '19828762', '$2y$08$9gdTDtc9Um1sPLPcDY/A9..SgFgxlc/9RaTksVfpxFrXylJLLVy92', 'josephabraham@gmail.com', '', 2, 0, NULL),
('20009345', 3, '20009345', '$2y$08$tuSlPivS6G4nTUGpDkCCROBdVj5KfgRuPOP/uvQMDzI644VScN0CK', 'marialejandra@gmail.com', '', 2, 0, NULL),
('20016633', 3, '20016633', '$2y$08$aQcWX2x.lTIUYxwuB3ZBH.ya211tKSc7bYqeJImsXVwhkm10wQ2oC', 'naibethcarolina@gmail.com', '', 2, 0, NULL),
('20045024', 3, '20045024', '$2y$08$J5Coobdi0ToC8gNb6vE7I.MBJLLbMZfc/Au0Eh5nZlDuxtI/8oFPi', 'barbarasomeidy@gmail.com', '', 2, 0, NULL),
('20189609', 3, '20189609', '$2y$08$Byijl24IslQUENjCDqi2iOqrmCiaYAMvRC76vyosgkv3v1QWO8Yda', 'gesmarymaryaleth@gmail.com', '', 2, 0, NULL),
('20234290', 3, '20234290', '$2y$08$HdZ/AdtvPo1qKxKSnw60Q.vVc4dmhVJVgrpRN1lpu4q8R85wnQHFa', 'héctorricardo@gmail.com', '', 2, 0, NULL),
('20237123', 3, '20237123', '$2y$08$pROFmUSrkeUw7s3dxNQFDOsevQuhObuTPt5XCMTpa1QPTIk7Hwmx6', 'rosalbasalvita@gmail.com', '', 2, 0, NULL),
('20321693', 3, '20321693', '$2y$08$2FHQlm.x6rQEiz4YsxhZiOOIl4U0EjubF/af1OGUbrvxbw.d8dmPW', 'monicacoromoto@gmail.com', '', 2, 0, NULL),
('20351575', 3, '20351575', '$2y$08$ASqUrEWsvepF/n7gu2Bpyus5wcLX2x2dqLfsW77rPWykQZSEa7zqu', 'yeseniavalentina@gmail.com', '', 2, 0, NULL),
('20472224', 3, '20472224', '$2y$08$Cv4XLMMBWhyqbGD1X5zb.ub61V7L.MMHv25fjz2tNWnStKuOpEXn2', 'ritderjose@gmail.com', '', 2, 0, NULL),
('20473487', 3, '20473487', '$2y$08$wgWAU1oO5GeY892JHMDBIe353iElSt81m5iBs3NZ3DfdiynyefooG', 'irenecarolina@gmail.com', '', 2, 0, NULL),
('20668100', 3, '20668100', '$2y$08$sZqNZmnhuoAhvvhtwd.8Q.I5wTNcX8angCi6YXU7GRdoAcRzlg04O', 'karlacarolina@gmail.com', '', 2, 0, NULL),
('20809464', 3, '20809464', '$2y$08$Jck8PXKjeoLL1pNI3WyGdeHyBPZ0/YZJ2IaXd39PNmTOor3qLjfw2', 'mariaevelyn@gmail.com', '', 2, 0, NULL),
('20929586', 3, '20929586', '$2y$08$6v7kSioJcR9Ui53l5pquDuKSXdUoWQYmB2UGxh9T11XDzugCzZr6K', 'estefanydaniela@gmail.com', '', 2, 0, NULL),
('20929799', 3, '20929799', '$2y$08$E7Q1vYFhdXZxP8CF9AhLdeqFPbguB9jdtb.61Gep8cX3ofHv5WUhy', 'yonathanjesus@gmail.com', '', 2, 0, NULL),
('21125524', 3, '21125524', '$2y$08$WO7rsd0uGpC/4zE8veNVI.uouu.ECLwVstyxbUeq1W2pNA/8LWsje', 'rafaelfelipe@gmail.com', '', 2, 0, NULL),
('21142765', 3, '21142765', '$2y$08$NbjalIYqG5/zeebN8.mI5eFZLLurFrWNjI5bRm2369JjC.MOg1LT6', 'josemanuel@gmail.com', '', 2, 0, NULL),
('21143989', 3, '21143989', '$2y$08$P.U2.MwYxFvx6qG4GGnE4uOEVL4qjsU7h1CC01jMwF6WvjTkk.Z9C', 'mireilysyaivirith@gmail.com', '', 2, 0, NULL),
('21243104', 3, '21243104', '$2y$08$rEqmXk7DXlaLFpJK412aPu0kXoYSZjJiEzMIpB7E1oYPiUIbBeyqG', 'katrynroisbeth@gmail.com', '', 2, 0, NULL),
('21459778', 3, '21459778', '$2y$08$2V0vxGl2/p/sNcf8d9iMcOA96nVRvPIjDkbsl4fy6abHetbyIlaaq', 'jhosimaryuraisbeth@gmail.com', '', 2, 0, NULL),
('21506407', 3, '21506407', '$2y$08$1HU/q5gZl0QW1socoLohcuFqqLETfwoQSmaS3oVdBtp3B5MAuekCO', 'doriamnysjoselyn@gmail.com', '', 2, 0, NULL),
('21726768', 3, '21726768', '$2y$08$eAQxw3ud0HSDzaXOTmttZ.FbydIG4/LY8eHehRJx2MOWia9hRS6xK', 'rafaeleduardo@gmail.com', '', 2, 0, NULL),
('21726875', 3, '21726875', '$2y$08$sBfOPHBV1b.lhHS4354ege.gSzvL6hFg3OO3LVlCNnFmQCdxcZcYq', 'dacsonydaniel@gmail.com', '', 2, 0, NULL),
('22181397', 3, '22181397', '$2y$08$8fruKdkCL8lE7UvxrR/FG.NukZ5YIRAwuxGu8oDQ/ueAJ9TV5YB.S', 'heriberlypatricia@gmail.com', '', 2, 0, NULL),
('22189205', 3, '22189205', '$2y$08$JGRdUen3grv/AZrKaSRFc.uNxRL.yq905yyPtkNvTCvRV0fjdv99O', 'yohelisrosana@gmail.com', '', 2, 0, NULL),
('22190797', 3, '22190797', '$2y$08$cu4D70EAiF6OlXebpXSxFOs4lcbAl9bzLnjnEsn/tRbNORcifrvmG', 'danielaandreina@gmail.com', '', 2, 0, NULL),
('22190822', 3, '22190822', '$2y$08$9W4KmZ2tlETyTLsuHpgT2.slbyP8H1QR6QkujcoawhIx2PcbETmLO', 'ludynohemi@gmail.com', '', 2, 0, NULL),
('22200273', 3, '22200273', '$2y$08$BCWwIPZjZxnNG2vAwDbcnOa2rTCd0/ZDENJHtD95fhH8EfNok0su6', 'karlhajennissy@gmail.com', '', 2, 0, NULL),
('22200606', 3, '22200606', '$2y$08$UfXgEzEmnkfJZPLk/cj5DeShTEBCnpD6s9k13YssXWswEtkVDnEAK', 'ervisyhoandry@gmail.com', '', 2, 0, NULL),
('22262565', 3, '22262565', '$2y$08$FfR8Hmtu7jU4kvfSWfRsXe3hFKjUfmRxdtlPFcks31lUM6zRW7rKq', 'lilianacoromoto@gmail.com', '', 2, 0, NULL),
('22262954', 3, '22262954', '$2y$08$5dnHw2/LRkmffyRJ1YXCWuNcjApMOeqibAin.Ktoev4eMLo0pqzyy', 'josegregorio@gmail.com', '', 2, 0, NULL),
('22268744', 3, '22268744', '$2y$08$yuCi3mx1nORcRXNzfRZMSOUlsiZaTD9qpk.Wg7motQ7uCXlrNtk3q', 'mariavictoria@gmail.com', '', 2, 0, NULL),
('22275490', 3, '22275490', '$2y$08$h3wTnNABm.vRANJDtIhwwe6AZoJFibEAfMcqwbzLtyxsJojkOZXZu', 'dubraskadelcarmen@gmail.com', '', 2, 0, NULL),
('22301153', 3, '22301153', '$2y$08$lWz1L29HZ/y8RXYyusxb1uR7D.u144dcJ0gyaXpn6nGFuxGcCjdZu', 'leidylaura@gmail.com', '', 2, 0, NULL),
('22329093', 3, '22329093', '$2y$08$lhhJRIEdkEtmCcil4C4AkO7vSR1g8xCCqEZcuB8jo9Z/MNN7vJAY.', 'dannelyskysbel@gmail.com', '', 2, 0, NULL),
('22332809', 3, '22332809', '$2y$08$owduzNpWl2Ue.QBK9OQZ4.4vhIaq56ZzePqBgCf3W7Rn/.Dp6u3VS', 'jeimarisabel@gmail.com', '', 2, 0, NULL),
('23488197', 3, '23488197', '$2y$08$DffeFdQQYd1QppbhMRTWbOLnxmkgQF6IQTYaddr8Qfa9VlQw9Ma8G', 'karlamaría@gmail.com', '', 2, 0, NULL),
('23488905', 3, '23488905', '$2y$08$C2h3UVOMGxsgKgewXUYa.uXgV3ZBU3VjNIXW8VtTX1XeSwHRpaiiC', 'jorgeluis@gmail.com', '', 2, 0, NULL),
('23537673', 3, '23537673', '$2y$08$3MVPNlDHruyNWAe6AScA4uhJ13oHfxVlm.wJm3OHPpgyFJ.pl5sii', 'yudarlyatzara@gmail.com', '', 2, 0, NULL),
('23553977', 3, '23553977', '$2y$08$5xs0tNFOFfac5yQ3eAkbS.5rsnnMPUQo2p9Vbo7cirqpQaQITd4yK', 'yasmirethcarolina@gmail.com', '', 2, 0, NULL),
('23572938', 3, '23572938', '$2y$08$4efFQ4eZdSfCskEfYX.0Yu0Nr3QO2bZBZfy4VP.c2yx9B1FZnyfgi', 'genesisninguno@gmail.com', '', 2, 0, NULL),
('23813020', 3, '23813020', '$2y$08$YUXR3xfbLUOx.7XGURYwseLE5dm9OTXkNv7lze0WCD.0tKj.O6drW', 'elvisjose@gmail.com', '', 2, 0, NULL),
('23833006', 3, '23833006', '$2y$08$BMGLykqhSoi2uaNOwSfmLuor3kYS10uFzNZLA5wHIEqcoIMSNvx7q', 'elimerfranchesca@gmail.com', '', 2, 0, NULL),
('23833582', 3, '23833582', '$2y$08$bZehrRSHUklvPY/H3rhEHuGb8OlX/76XpuqI1u7cQj00oyX/Euiny', 'franklinjavier@gmail.com', '', 2, 0, NULL),
('23836481', 3, '23836481', '$2y$08$2MqaLcJX9vq1wWk3JOdqGeDwp4HJuR0UjpUErg0AJMZn7HzFsbP/2', 'lisnayyonayda@gmail.com', '', 2, 0, NULL),
('23846916', 3, '23846916', '$2y$08$5jlwG3j9WCcWQJUkofF2De/Rtzyo7Eo/qYPuLQokvPBPIvoPWqyp6', 'franmarygraciela@gmail.com', '', 2, 0, NULL),
('23850416', 3, '23850416', '$2y$08$Bd9n5diims/OVhkdoLyqjuuAVqMBMyFsJtbJLE0IURWW2h0l.AuU6', 'jeanjosue@gmail.com', '', 2, 0, NULL),
('23850558', 3, '23850558', '$2y$08$MqDWfvdpw4o.zOqn9HDK6OXVkVB7nfDT0wk7D1D0Fd88tEkmOeSFe', 'angeljose@gmail.com', '', 2, 0, NULL),
('23917833', 3, '23917833', '$2y$08$OpU6g3D.Co5c5JhQkNwDnuypuG.xjEjAEGEFQCdHVZeLMN6CptKKq', 'maríaalejandra@gmail.com', '', 2, 0, NULL),
('24155221', 3, '24155221', '$2y$08$/UzfwbZK6yt.jxm/wO2OX.GUuB4s.3Ez90LZGuaPquv83GT5MPjfW', 'yahinjose@gmail.com', '', 2, 0, NULL),
('24155394', 3, '24155394', '$2y$08$xUI/euOAm9qYeCRz9lYtLuQ1DmmwCjjd1JDnDQeXAeQ2FQZ8REUWK', 'ivanalexander@gmail.com', '', 2, 0, NULL),
('24156839', 3, '24156839', '$2y$08$SDa8oIQYKqIoGA4y4DFDEeGJfTcZ1QV/aJc70sjT7flGHf4omK..e', 'dulcemayerlin@gmail.com', '', 2, 0, NULL),
('24157778', 3, '24157778', '$2y$08$QKEDH46K6QxD1l2eyH8/xeIfYW7fvDHwU0NFzMFt3SyoeLqve3cEm', 'miguelarturo@gmail.com', '', 2, 0, NULL),
('24158482', 3, '24158482', '$2y$08$8YEgHHlLOyqoMlUL2movTesX1v12XNIOj/RORA9vhcgeUZ16lFM5y', 'naibelyspaola@gmail.com', '', 2, 0, NULL),
('24160658', 3, '24160658', '$2y$08$9h5OEfdUgzNIcvo/j1Wq4ewiW2.fEO6.EUAKLaOIjYVe/hhWbEPSO', 'victorjunior@gmail.com', '', 2, 0, NULL),
('24162432', 3, '24162432', '$2y$08$1PTaM84H6K9epI0n321ue.pvUT0Idr4.bZ4CKaR4r1894BICGcT/q', 'antoniodejesus@gmail.com', '', 2, 0, NULL),
('24325718', 3, '24325718', '$2y$08$KWpmeeksMzLObLxG8BGKceggCYw8oevUc/QF3h/YLpvjk1hK3v486', 'richardavid@gmail.com', '', 2, 0, NULL),
('24326463', 3, '24326463', '$2y$08$nVJ0U1ctJCp/0s9rzo4Pp.fY11G2vlxhmGTDhh8TRTOJfRiYh2o/K', 'wandajoelys@gmail.com', '', 2, 0, NULL),
('24353119', 3, '24353119', '$2y$08$r0qBuPEtsP7UyaWzYJQSkOaCLuhgdJmoOg8W.mmTz2dHBbrlKXxFC', 'yilbeliscoromoto@gmail.com', '', 2, 0, NULL),
('24385111', 3, '24385111', '$2y$08$BcvxnSPmdppUGY19guJaIOt1Sx9npjnfPGC/Z4N.KgwuY.ztCbIMC', 'dannysalfredo@gmail.com', '', 2, 0, NULL),
('24397893', 3, '24397893', '$2y$08$aohaETd5N1y6enewuyvWruUJvruFddjUjS9IFwMjH4itggSTV7gCa', 'yaiselisgreimar@gmail.com', '', 2, 0, NULL),
('24418470', 3, '24418470', '$2y$08$UGXb78p5nlNc3eFwkFwtfeShI9jEe5mOIgkTG81JJRNOJ/hqk4eFa', 'diegopastor@gmail.com', '', 2, 0, NULL),
('24550130', 3, '24550130', '$2y$08$R1nY87HCBppaqG8xGee8AO06fN7Nsqo7eBa9CIoKvsF9nf9INZfli', 'meiralithpastora@gmail.com', '', 2, 0, NULL),
('24550321', 3, '24550321', '$2y$08$0aTHrYo0X/XYWb4.ZR8B4..IIcBRU85xHwXXhOfvKb4aZWbEoo.uq', 'roismaralejandra@gmail.com', '', 2, 0, NULL),
('24613886', 3, '24613886', '$2y$08$O4/hrx1pWuF82J1vs7YEou5Ky48yRv2Nj0EdZvMO1d985o1VmRa7e', 'luisfernando@gmail.com', '', 2, 0, NULL),
('24925628', 3, '24925628', '$2y$08$dSX9BX4/FQGYcisAcOdVu.OzCk8IB6pbdPx4F00FdiiyhBIrwx836', 'danyelojesus@gmail.com', '', 2, 0, NULL),
('24928079', 3, '24928079', '$2y$08$WKVJe.6jyr2jf9AZfHPWAOwS5lRwW8ajbTToT3PnVqcq8K6G8sloa', 'mariarlysjose@gmail.com', '', 2, 0, NULL),
('24989515', 3, '24989515', '$2y$08$su85aD2UXEbwKQeeAGSQwO9oEMx5qfNgeeOR4R8HBuShTkfKzuub2', 'adelrosangela@gmail.com', '', 2, 0, NULL),
('24990010', 3, '24990010', '$2y$08$JhvmHByBLhAGx5zcSStjSuY2ohPMpvHY3iboBIcrs8aI7n1AqoTJq', 'wileidycristina@gmail.com', '', 2, 0, NULL),
('25141603', 3, '25141603', '$2y$08$GeDNHAnbNq8Az1877QEIMO76MpJlljYxJP12uhhWUJycACfE9wefK', 'virsalithdejesus@gmail.com', '', 2, 0, NULL),
('25143277', 3, '25143277', '$2y$08$hbTNajT4kSLZpErNc7b3Ver4dhpQmkrrKVu0xCUDdVuLpBAj9gpse', 'florielbysnazareth@gmail.com', '', 2, 0, NULL),
('25403314', 3, '25403314', '$2y$08$UayVF4aR.IHLN.LD1Y5yIOC5mfCbIOsvGxXSgGopevpdnQ8cy.M1K', 'césaraugusto@gmail.com', '', 2, 0, NULL),
('25403600', 3, '25403600', '$2y$08$WYCM.sMMh.RHVAnqflwODuN03EccG2v.0oHl3THUlLnwI78NWsuI6', 'emilycarolina@gmail.com', '', 2, 0, NULL),
('25421667', 3, '25421667', '$2y$08$oSD4dKbDimnI42aAdbBegeGGQP961dOkHfGYg6dxb1QcFyHJC4eK2', 'haisbelyoelimar@gmail.com', '', 2, 0, NULL),
('25433067', 3, '25433067', '$2y$08$f7t.h5R.CF/kGE9.8HWw5OZf3jnbVjunHLRDoWw3dJ/SREvTMlIE.', 'scarletmassiel@gmail.com', '', 2, 0, NULL),
('25442453', 3, '25442453', '$2y$08$oCJloauFCtladzCS2Y3APeIY1Oor8BtGeG0CICMz0O5gey9uOxk4e', 'yonaikerjavier@gmail.com', '', 2, 0, NULL),
('25474327', 3, '25474327', '$2y$08$EUOH87gEA1DLQnXktSsO8.ptpGEbEndTl2mPGpcqrHs0q2wtZ.c..', 'adrianakarina@gmail.com', '', 2, 0, NULL),
('25513468', 3, '25513468', '$2y$08$Ou3lBGvFIVwIC5zk43r9kOiBcw2nrcc2yH9JLtaXg84fQeZRZh726', 'wandamaria@gmail.com', '', 2, 0, NULL),
('25571829', 3, '25571829', '$2y$08$/YUCYTJ6DhzyNuybn//.KeId.vbeHS5xLinPACDO8JrLbw9VSFW9W', 'pedrojose@gmail.com', '', 2, 0, NULL),
('25627218', 3, '25627218', '$2y$08$y.CZQiG8I2o7Mc2nphwnQehjTUj4.lcNK3gpYXNM0BPl3RvU7Nq7.', 'pedroluis@gmail.com', '', 2, 0, NULL),
('25630466', 3, '25630466', '$2y$08$TfHWSZHxS.7ymu6knm9y.e7jcV9OBUrMwN.hwpeo333uvjYAU4A6C', 'reimaryjosnely@gmail.com', '', 2, 0, NULL),
('25638923', 3, '25638923', '$2y$08$quoGwbO3KkClb8eaxpQHDudySRHgBEGBX.2Blqb.nt44AECxIi5fS', 'catherinedelcarmen@gmail.com', '', 2, 0, NULL),
('25753357', 3, '25753357', '$2y$08$d37OSY8L0jDAUE2gYIF.vu9jHcxM/ATAbgUkmfQCgMmYG9MZpZh/K', 'rodmarycarolina@gmail.com', '', 2, 0, NULL),
('25791618', 3, '25791618', '$2y$08$TNV.uvCl23uAIWljxRXRlunZycfuta73IR4N.AvgbcasMpe3yknfS', 'sibelguadalupe@gmail.com', '', 2, 0, NULL),
('25856528', 3, '25856528', '$2y$08$vvNpUkZonz4Xllw1a.M7h.NPGGVqEJpsMo7ZWnk01M1vSUEXkQylm', 'carlosjesus@gmail.com', '', 2, 0, NULL),
('25857222', 3, '25857222', '$2y$08$7mM.0VwSKqnzlTOy8ei5IeKDg66jlOLJX/MCGPfsG0dX5fshaj3Qm', 'rafaelramon@gmail.com', '', 2, 0, NULL),
('25857600', 3, '25857600', '$2y$08$uavDCAo6FXt3D32jtpbZdupttQJS.oqHja1U6xsQLE/x7jcDNLE3G', 'isneidisyenire@gmail.com', '', 2, 0, NULL),
('25961508', 3, '25961508', '$2y$08$zZyJpYOyZFsXS1ATKeN/seUrSWEXuINlgDwXmzHSd.88JDQEKs6Ou', 'careliscarola@gmail.com', '', 2, 0, NULL),
('25971462', 3, '25971462', '$2y$08$xTHnEmUYfVbWEvg6jymZKeo2B6G4654FiXEwbxDELQ0QYZ6uVRPWq', 'mariadelosangeles@gmail.com@gmail.com', '', 2, 0, NULL),
('26006254', 3, '26006254', '$2y$08$FeIq.our9FeZZqXsX/el/Ohhf0bO49PCydxwYOpY8J/vZHs9qbN8.', 'mariayohana@gmail.com', '', 2, 0, NULL),
('26076292', 3, '26076292', '$2y$08$j6tiESCysADBTasoq1qbR.9cGNzfLhRk8q8R0vGv4zvJIAxrLlkB6', 'omardejesus@gmail.com', '', 2, 0, NULL),
('26076972', 3, '26076972', '$2y$08$QBAYHGPzkpTcFZYBMrJ4VOj0CZbXqOfmfi4UXec5z015SS//7OWqq', 'evelynyannery@gmail.com', '', 2, 0, NULL),
('26238105', 3, '26238105', '$2y$08$pML95gORqrJZ/e/8GykVdeQl99pb7LurllDHQ/46aN5KcGTPTP8XO', 'danielamaria@gmail.com', '', 2, 0, NULL),
('26260221', 3, '26260221', '$2y$08$Y0zoVOyZCH/q6ifjE4qx4.8jMWu0ejYlSvggYIX9UYd9b.40e57s2', 'altairsarahi@gmail.com', '', 2, 0, NULL),
('26305726', 3, '26305726', '$2y$08$BJPi69FOK22QiKgR4CyYDuuf32EbKd7buDNCxdzanJEZiVupptoPC', 'stefanymaria@gmail.com', '', 2, 0, NULL),
('26336783', 3, '26336783', '$2y$08$WBy5jqH.qXD/5UcoRl4e.eSoKRUVL38ScjMZbKWkpAmp9FvSZioOC', 'engerbergabriel@gmail.com', '', 2, 0, NULL),
('26357078', 3, '26357078', '$2y$08$vNKH7J0fM3QJy7JItuTx9uEtgX43ftpmRfw6COYitb7S5Oc3oMML.', 'dailynbetzabeth@gmail.com', '', 2, 0, NULL),
('26358018', 3, '26358018', '$2y$08$iiTcc.5YeuQ8lpOtjWgayunvHJEdWnxnRy2Db1F2lSg2w.rjXC0fe', 'mariolykatherine@gmail.com', '', 2, 0, NULL),
('26370091', 3, '26370091', '$2y$08$/CWKmyNOqMJfC3mk4ykOMeyuikRgPlLwnI8YcmZymxjJHA81.s8aa', 'blancamariana@gmail.com', '', 2, 0, NULL),
('26370490', 3, '26370490', '$2y$08$VRRlfVRNEvDNdlVYh1Tdg.6Zn.0f2YaERYro8T1QawxVQr70VBn2i', 'paolacarolina@gmail.com', '', 2, 0, NULL),
('26398233', 3, '26398233', '$2y$08$PZE4z/LX7JeYf0VAgwPaA.80vapo37q6NVlw/jI/oNuzSe5L3EGqu', 'anthonydaniel@gmail.com', '', 2, 0, NULL),
('26398376', 3, '26398376', '$2y$08$3NqGUtxz7VD5lrdKGb01D.gP4seSu6syyYxV8DxArKFu/7qUuqPk6', 'gregsethrotzinger@gmail.com', '', 2, 0, NULL),
('26487568', 3, '26487568', '$2y$08$5174Fqf/Oy1Xyuz0hs9IT.aL.hG4pkms3N1CCrAVipsIY/Bxqy3Jm', 'ambardaniela@gmail.com', '', 2, 0, NULL),
('26502530', 3, '26502530', '$2y$08$Ow5jOCdaTjVOyqYyBN7vzeh3USmuonm0o/rUG81iaJ/fX4NOMEBZa', 'anggelodjanier@gmail.com', '', 2, 0, NULL),
('26540740', 3, '26540740', '$2y$08$NKT5pokhBRTjXb717LItguKS8JP3Y8JytkfUHf4lG5Zj7UXZ4/Yv6', 'nathalymilagros@gmail.com', '', 2, 0, NULL),
('26556674', 3, '26556674', '$2y$08$dh4FVI0sX34X.mYgeU0lnOe6SNvKEBMPU9cgH067bAUmwUUcf4xcS', 'carlosjavier@gmail.com', '', 2, 0, NULL),
('26561931', 3, '26561931', '$2y$08$Fu1b.0dNR7EULhGfEVroTe..wwECOetxEnycmDJQyx5Acjeh.dMui', 'carloseduardo@gmail.com', '', 2, 0, NULL),
('26577429', 3, '26577429', '$2y$08$EfnqJLf9HrPKLU32xJab0OPAjJhmLEL3jX.0AscN8TSzxuGg8YHe.', 'enmanuelarmando@gmail.com', '', 2, 0, NULL),
('26584842', 3, '26584842', '$2y$08$N4UNmaa/08U2hPMvd6HwpeEXDPIQwMf34nGFlmOoeFkrtLaQWprxa', 'krisbelyeugenia@gmail.com', '', 2, 0, NULL),
('26644449', 3, '26644449', '$2y$08$peZyNBBw/PS4hmMD/x9k5OxjL4cs3s2/iw4unDemiOqoHXpTkqeg2', 'yiselnataly@gmail.com', '', 2, 0, NULL),
('26668677', 3, '26668677', '$2y$08$CkbryHNlRKyztQrsy35yIOeTQcu4zZNzeXLb6ZVFYlC3pW1rDxEym', 'yohandryvalerys@gmail.com', '', 2, 0, NULL),
('26712455', 3, '26712455', '$2y$08$lNJXq.kOrxInJ1B5lzEFl./RfZFmPBuzSNQQF4fwvPufDcVxSC.Z.', 'karlajose@gmail.com', '', 2, 0, NULL),
('26750621', 3, '26750621', '$2y$08$c0kLRxo50aOVJ/hrKVnjKeUUbjpbxpN71Q5Pk1ehJdo1iaCvrD0Ti', 'victoriaanyurith@gmail.com', '', 2, 0, NULL),
('26750721', 3, '26750721', '$2y$08$5JCMA2Sl9Hin4FeheZ3bUecXpOpLtV6M27bwwH0wJRcu5PREOfXfm', 'francisantonieta@gmail.com', '', 2, 0, NULL),
('26799164', 3, '26799164', '$2y$08$SBtP4rUBq2igatyd5FTq/.cQRhVy0QTJD9hRi0h7WbDldpEfR8EAC', 'johnnieljoalver@gmail.com', '', 2, 0, NULL),
('26800684', 3, '26800684', '$2y$08$v1eViXvi0uTqCuTItVSpneYTZ7YjBWUQF4cGpQzyYPHzD1KI2WoSS', 'andreinayenireth@gmail.com', '', 2, 0, NULL),
('26886513', 3, '26886513', '$2y$08$a4m.sEshLHcTWo5XG0f/GuXOFFqBr7vWTSmUfiyq.ZgIiTZa2blWC', 'aliriojose@gmail.com', '', 2, 0, NULL),
('26898084', 3, '26898084', '$2y$08$r68LbGz5W5j/0zX8qe23LuDWCLHnuwB4th08PAFuBaxEKPhW9Ltpu', 'alexandermanuel@gmail.com', '', 2, 0, NULL),
('26941019', 3, '26941019', '$2y$08$b1LygvHtrZDJJRFQUZhZYuLWH6FWrP6g9vHumk2Mm.Qvnea/TO3A2', 'nailibethmaria@gmail.com', '', 2, 0, NULL),
('26964475', 3, '26964475', '$2y$08$bDQICtZS2NGfu9.vx8f8ROrpnNpV1I5db0rVIstVUnr6a0PGEAaam', 'michellestefhany@gmail.com', '', 2, 0, NULL),
('26964485', 3, '26964485', '$2y$08$epDz.PddSaMcpj7PKuojFeBcysdWwszZYN/FoCjDuicuVSWwf6wVm', 'marianaalejandra@gmail.com', '', 2, 0, NULL),
('26964743', 3, '26964743', '$2y$08$IznkPKHut96/HVpj0QjzNuSXICUMHYgErNoQEAjfaG1wrKutL4SoG', 'naistakary@gmail.com', '', 2, 0, NULL),
('26976697', 3, '26976697', '$2y$08$Mmh1RReuVjmtiCEyOBtgm.ZIUf/4h8aI7DS2qXqX.sTdgQJ9Xa1Ii', 'danielalejandro@gmail.com@gmail.com', '', 2, 0, NULL),
('26976766', 3, '26976766', '$2y$08$q2DVmdF51Ayq9GN2dqOb..36Z5Asucs.7V5lnmEG8QDJ.vHWxRPNy', 'neliannisyuraia@gmail.com', '', 2, 0, NULL),
('27085726', 3, '27085726', '$2y$08$Qgx2fO5aDbJOTm4YcVBA5O0mzq/0vFEAF3wwv45BncVxgh1UaCIOy', 'greidymariana@gmail.com', '', 2, 0, NULL),
('27193391', 3, '27193391', '$2y$08$DR04cizat3eh1JIxlrqe5./4fyWaNwp5hvHDsdC0LEfKv8EaSLR9W', 'nestoromar@gmail.com', '', 2, 0, NULL),
('27212841', 3, '27212841', '$2y$08$icIemuBt3XHVoVz7DePdUubV8y31WNIcH4l/7uWVJN9wZhDoVc/ZW', 'emelielianny@gmail.com', '', 2, 0, NULL),
('27217754', 3, '27217754', '$2y$08$5mSDKe8AOqWwPpAECEZAmO7uqdLwJ8UI/SxZ6e7Qfy9qzeSJV5W8e', 'dariannysjosefina@gmail.com', '', 2, 0, NULL),
('27250073', 3, '27250073', '$2y$08$kBpSx43CnJa8iUSc8fcIxecjItJ33h.fmsZcftDzk3MNyZsGqXgLa', 'ketsisjosefina@gmail.com', '', 2, 0, NULL),
('27250667', 3, '27250667', '$2y$08$sslqXm0DY7iyu.2peaXet.R3k.Vuot/tri6W6qcFuvyywCRitlG/6', 'alejandroantonio@gmail.com', '', 2, 0, NULL),
('27290217', 3, '27290217', '$2y$08$PQWEHphogogNQ4tzv25bTeA0.dvRVPqT3K.tLSVZfc5m0m2y9t2pK', 'josemanuel@gmail.com@gmail.com', '', 2, 0, NULL),
('27290829', 3, '27290829', '$2y$08$4YxckEH3jtUaI5cwiLQN8.np9V9LScBBOdx3mA/cC8dV1Hj27P9HK', 'ivanamaria@gmail.com', '', 2, 0, NULL),
('27349269', 3, '27349269', '$2y$08$hSS/UN7VRNYhM3o9CdyfRuoHMZq1Cy/xKx8TQaVDF6yZ7oy.JsN0e', 'carlianelienait@gmail.com', '', 2, 0, NULL),
('27388907', 3, '27388907', '$2y$08$VCAr7bZmkCfVqICw8Tnx.OXcY0SvOsuNAnRdTJSq/5/y0d7NRkKaq', 'luisdavid@gmail.com', '', 2, 0, NULL),
('27397229', 3, '27397229', '$2y$08$YUyZyDWDHsciEqw3Hww1/.kglOAJSWTKB.mC2RNhM5kKA45DfegWi', 'adrianysalejandry@gmail.com', '', 2, 0, NULL),
('27411146', 3, '27411146', '$2y$08$HSaXrxxOSq0L2BvroJwWme.heCxxkNwExyTxq9VlajUhf7AV.p3h.', 'micheleantonio@gmail.com', '', 2, 0, NULL),
('27436972', 3, '27436972', '$2y$08$WCLWn7bzqP902V2uMy.6xOeMuCRWqNw25kPcn/95hllJ2DsCmRVRe', 'eddimarnohemi@gmail.com', '', 2, 0, NULL),
('27452890', 3, '27452890', '$2y$08$ES9uCDymjqYvMA4JoBxQ6O8KvxZY9L/BuBCIjqMF9XeF3GkKtgiMO', 'wendyolimar@gmail.com', '', 2, 0, NULL),
('27479391', 3, '27479391', '$2y$08$9n5EoAVOHLthtX3R2b/dJe8mGG1EvlLP9hkKrlzZjk58jADa4FID.', 'brianjose@gmail.com', '', 2, 0, NULL),
('27524263', 3, '27524263', '$2y$08$L7lszaUNh8CekvBvzIGcPuj/uK/52gaXDH7rqtk7ePM.EJCS7Cctm', 'leoannyarismar@gmail.com', '', 2, 0, NULL),
('27524346', 3, '27524346', '$2y$08$/EwXiEjPPjbSWPkLNtfW4u5BZIQPe05JrthI1d/R856YEBoPjFWqe', 'kellyestefania@gmail.com', '', 2, 0, NULL),
('27524468', 3, '27524468', '$2y$08$G05XAnUhBi70uA.n3rW/..W2myswRd7PLG0YagQJY8q6E1c5vvj5W', 'yoscairyandreina@gmail.com', '', 2, 0, NULL),
('27554471', 3, '27554471', '$2y$08$GWUijCqOWu.4o4IbckTZq.kc3ZB7QkvstCqImtkU0hWS9qbIT9Wlq', 'rosbeglisdamelys@gmail.com', '', 2, 0, NULL),
('27585924', 3, '27585924', '$2y$08$ggBpy1ohhmVeB5V6gtdZp.OXMejeKA/1Qoam7kxrOiUiYiavjxvcW', 'josealejandro@gmail.com', '', 2, 0, NULL),
('27586008', 3, '27586008', '$2y$08$/Ts5ZJmrn63c2NtK.xJCB.U4KT/LNwFvav4XYDq/bhDjh4RvO5HLS', 'wilmerjose@gmail.com', '', 2, 0, NULL),
('27586609', 3, '27586609', '$2y$08$r3wq2..PhpZ5M/Ujk/DJAOx3zZKuw.usNGd/Kq5G0SDPh/9TD2H52', 'leydimaranais@gmail.com', '', 2, 0, NULL),
('27617542', 3, '27617542', '$2y$08$j8VrGcZF7BmpEhG2eXreNO1htuW3Mp4APd9FMvlhrZX9Y6iMaf3DK', 'lisnymaria@gmail.com', '', 2, 0, NULL),
('27617613', 3, '27617613', '$2y$08$Ie4WjBhnqxbTRWsE67mvCeOtAk9GQjpgxCuUnXkimkzqMdqGjuhSi', 'reinaldojose@gmail.com', '', 2, 0, NULL),
('27617836', 3, '27617836', '$2y$08$am5T5k9PlvsKlQrNTFoDFuMVIjOgAhN5NeZtrrH7iPyKmPo7vZQFK', 'juanymarhaidellys@gmail.com', '', 2, 0, NULL),
('27629364', 3, '27629364', '$2y$08$JJEeticaIY3r7tBG7CqN0eqzBn5JBNSGeOhSk271Rh6KyksM1.WZy', 'angelesfabiola@gmail.com', '', 2, 0, NULL),
('27648861', 3, '27648861', '$2y$08$7BgFD5DQuXXq6NI/oYAsQ.L7yRKsbhgl5N1sCuh.nHIru8Wrlcci6', 'enghelyalejandria@gmail.com', '', 2, 0, NULL),
('27666123', 3, '27666123', '$2y$08$T0gUsdKJ.HDb7tU2ltpqiu7dc6/6CWNWyc8OlvfPRJg9mttVGOxsy', 'dahimardelcarmen@gmail.com', '', 2, 0, NULL),
('27666883', 3, '27666883', '$2y$08$fYAr0aW8raRpVA/3UrRuLeWbAj/.umqmIIGduLkJ8jfhfem0alQvi', 'joseleonardo@gmail.com', '', 2, 0, NULL),
('27737767', 3, '27737767', '$2y$08$Lmy0r/k5GiFek1aO8qmHy.GhKCyrb8Zh//B2Qi8MxFgkytjJ2tiO2', 'loriangelyadrianys@gmail.com', '', 2, 0, NULL),
('27738841', 3, '27738841', '$2y$08$MFLQN9Er5hlPrrwIEVQkQO6HbzIkXQsFLvykghAJEsburo1hx9xrC', 'zoraidadelcarmen@gmail.com', '', 2, 0, NULL),
('27759098', 3, '27759098', '$2y$08$1ELKyozRu3hj5cLDFRipt.dtg0HFML5uoE3JIkSrH4HOseUleKvI2', 'eduardjesus@gmail.com', '', 2, 0, NULL),
('27759364', 3, '27759364', '$2y$08$gEHuCpAjbL.Ihcy11abrzuu5ra.k/OtqU/jqqDnt9fbQ.A9v8fa/a', 'edithramona@gmail.com', '', 2, 0, NULL),
('27759611', 3, '27759611', '$2y$08$q7KMFszwX9sJEp4qEx0gWe7PK3SqjbvbQ6C/SIs/.2BREo9HN9o32', 'emnimarandrea@gmail.com', '', 2, 0, NULL),
('27760491', 3, '27760491', '$2y$08$LDluswwJ0M1MbagSAQnfIutQ0k87kZ3HhrWNIg4PCwmZQWFVsf5a2', 'santiagorafael@gmail.com', '', 2, 0, NULL),
('27816190', 3, '27816190', '$2y$08$anQjdlRYy.ZAol.JNi.fW.5Toajc3AKcxltS2xatyMdEPsiMl2mdC', 'almaveronica@gmail.com', '', 2, 0, NULL),
('27827122', 3, '27827122', '$2y$08$rhUBbpqntLR2aRZvTSNn2./E9Z5hB7TNuD3GeQlRjaFOB3VCgsabC', 'mariadelosangeles@gmail.com', '', 2, 0, NULL),
('27828006', 3, '27828006', '$2y$08$xXXTJLBp./gWaKWqZJNKVutbnZVz2SKtdPuUQl7OVq8TS39yxjIXm', 'edelteanasn@gmail.com', '', 2, 0, NULL),
('27829899', 3, '27829899', '$2y$08$wvllpmdPArUMnHHkKmZyAOvnvglnVuqt6YNiIKdSEcVUYymbfzGlC', 'yessicapatricia@gmail.com', '', 2, 0, NULL),
('27831006', 3, '27831006', '$2y$08$99pJFWEjZBloQ2hEnAgoT.8QURkNUW3xtYeGD9WprPE1C47AZc7yi', 'jose@gmail.com', '', 2, 0, NULL),
('27868200', 3, '27868200', '$2y$08$kRuMOiC4YtONLBBfiyeqR.5CNXefPfAqcYQkmdxssoy3EVfG6kOKG', 'roibertgabriel@gmail.com', '', 2, 0, NULL),
('27868383', 3, '27868383', '$2y$08$oMszbYMGDg4nSKsTZ4D5yeB3ZKod3P1E8TR0sMcSLRXgB.GTp1Qya', 'javieralexander@gmail.com', '', 2, 0, NULL),
('27882710', 3, '27882710', '$2y$08$ewvYr7.YtK0unso2hwRVweQCeL0JiklWeqGwNDeDf9Q2580R.9UrW', 'osgleekatiuska@gmail.com', '', 2, 0, NULL),
('27883607', 3, '27883607', '$2y$08$KuPcPNUcTT.rxtOOXRUCXuxRjQhjsoHR.h0E8kUUNSGO38CGIkTTq', 'jesilmaryaneth@gmail.com', '', 2, 0, NULL),
('27987936', 3, '27987936', '$2y$08$S6LGqKXKIZ8EG4Wm3rlWZOeaVwW4DnEgDi1nE5EW4.yaHtH1x8GI6', 'adriannysmariana@gmail.com', '', 2, 0, NULL),
('28002138', 3, '28002138', '$2y$08$DlNafmit4wt1/.Am6DU3a.o6aEqjRXI8wicEITSG3GNlSKKe0nYBG', 'reyverdaniel@gmail.com', '', 2, 0, NULL),
('28019344', 3, '28019344', '$2y$08$sYCXoq9PDnURNHjIBINqaus2EL.NS8M99uZyYafh6IU7Nd5rSD5qu', 'josephtdavid@gmail.com', '', 2, 0, NULL),
('28019347', 3, '28019347', '$2y$08$GvBJS/BkMbXer.eccP.E.OMl1oJOQjdLbqTeeKliezWitUHRw5b02', 'carmenelisa@gmail.com', '', 2, 0, NULL),
('28019552', 3, '28019552', '$2y$08$BP0cdfyrWha59CepvfcNOem92xC6ZniBWgTtuCQTt/.hkrzxBir0m', 'saindrynicol@gmail.com', '', 2, 0, NULL),
('28019593', 3, '28019593', '$2y$08$pgPx.4aEyb0SOBesEF/JIesZic7fRBCdDq/l.QOOsciySn5Xar4TK', 'gusnellyalejandra@gmail.com', '', 2, 0, NULL),
('28020149', 3, '28020149', '$2y$08$AfW5Vucxz7hI7i7PwZVLgucrowRyid/JYmuF.CUuTduTjCWTdDXd.', 'mariagabriela@gmail.com', '', 2, 0, NULL),
('28020173', 3, '28020173', '$2y$08$X1lfnZoyFZWUeyxMGi1ipOEmNRQR48V1TL6zx8XwJnutEjd3rDDvu', 'carlosdaniel@gmail.com', '', 2, 0, NULL),
('28020528', 3, '28020528', '$2y$08$c98UMhodXO342/4gm5cD..Zpc8vAnGt68MDSXlgnUK0UNu3eqMxQa', 'karelysandreina@gmail.com', '', 2, 0, NULL),
('28021462', 3, '28021462', '$2y$08$pJA5DYsvGmh6CZ45QywZpeuR./GKK7/Nu3TX8pEg4wMd/md0gzreW', 'yeniferfragnimar@gmail.com', '', 2, 0, NULL),
('28021836', 3, '28021836', '$2y$08$.S9A0BAnXeCrmSRi67VBfer91hxj1feQYFv39wwI1KWNT.rkFsxWm', 'danielavanessa@gmail.com', '', 2, 0, NULL),
('28021915', 3, '28021915', '$2y$08$HhM21D7A7GdgHzqZsp046.l0AJVpp0Yqhn2SLmtCo5HZtYoGPbBlu', 'samantha@gmail.com', '', 2, 0, NULL),
('28055726', 3, '28055726', '$2y$08$rL15Vh5LoTMEoiPEL06HQeUslVtqFGSIqSguexsbTFblzc3Yo5.Am', 'arelysalexandra@gmail.com', '', 2, 0, NULL),
('28055934', 3, '28055934', '$2y$08$F4H8h.M7S/SVbogx96SbX.4Y1MgDpN33GUfuSDhoh7nxp4lDCRpgy', 'jesusdavid@gmail.com', '', 2, 0, NULL),
('28114664', 3, '28114664', '$2y$08$xdJUM9bSyUTFvWqQpA3E6udzEFBpOis5k3fqTHsWvP5BkvOU1nHQG', 'henrichzbigniewf@gmail.com', '', 2, 0, NULL),
('28114837', 3, '28114837', '$2y$08$R4bW6sVLqpXlghqDVH95COJItZWzQ17WiXfYfBkggGTwzKrxtJTIq', 'grachelanais@gmail.com', '', 2, 0, NULL),
('28114964', 3, '28114964', '$2y$08$JZN7mEP0yZcB53hC2mut9umOKHcvV3.Go8whO1DhChpcWjw0/tGhm', 'paulimardelcarmen@gmail.com', '', 2, 0, NULL),
('28127941', 3, '28127941', '$2y$08$QX5z5TfpmSiA4GBgeZIS5.Dlt.hs7/dQ/qPewvlQTuuYHhB537y9e', 'genesisalexandra@gmail.com', '', 2, 0, NULL),
('28150500', 3, '28150500', '$2y$08$xGin.qBpUXVa3mqX3/fx1ODidR0rZcVQi3xXMTaEO7nNhJ7ZYoRZG', 'genesisalejandra@gmail.com', '', 2, 0, NULL),
('28165974', 3, '28165974', '$2y$08$Qbg8.ebQL/EuJ2BAtgA7Ku1NAJaiQoD8J94jy5bGE6Ezi5F7R5Hwa', 'yoselinjosefina@gmail.com', '', 2, 0, NULL),
('28204595', 3, '28204595', '$2y$08$NPsSfp0W.ydOZW2p/kzsF.Sz8i8NR.wdCxWwcb99mjt8Xsmx6OwmO', 'manuelalejandro@gmail.com', '', 2, 0, NULL),
('28256888', 3, '28256888', '$2y$08$chlwAxNToyZNvKC2h3ZoIe992FcVhSv7Wr1HWHHNZNQLQXM616aU.', 'heritmaryoeslyn@gmail.com', '', 2, 0, NULL),
('28259658', 3, '28259658', '$2y$08$Y7H6je8myIcRpyPpXaNBPOt8bE/uuX0JgwMdyfJUAahvRots1Fqm2', 'mariadelosangeles@gmail.com', '', 2, 0, NULL),
('28286679', 3, '28286679', '$2y$08$NK0iD48zPTGhvq0wraWBQupcnz3B5n9bPsJtQwwxGCY1UJOQk5dTK', 'yeilymariangel@gmail.com', '', 2, 0, NULL),
('28286997', 3, '28286997', '$2y$08$H4PtjM3vGd.LGEboKtn4Nu7KwAR7LnWNnD7eAHjWJucabWoZ5jYVG', 'aliandres@gmail.com', '', 2, 0, NULL),
('28297960', 3, '28297960', '$2y$08$GWQ8MlPCqVTCddj7YQrgGuxmQhCAjFCn59h0KXmMW8Ll1A7p6SlYC', 'kevinalejandro@gmail.com', '', 2, 0, NULL),
('28381909', 3, '28381909', '$2y$08$Z6DeMHhNheGK0QfP3qUuYu0s3gLnk5pfgp8khg2l01EusWEk3xfy6', 'greidysorianna@gmail.com', '', 2, 0, NULL),
('28399194', 3, '28399194', '$2y$08$esNQhF.ayp6BXkfEHkk7wuEtCp/H5jiAujdI7M7xFsOeHfpWWNX3O', 'gloriannysandrea@gmail.com', '', 2, 0, NULL),
('28406541', 3, '28406541', '$2y$08$cLbmGQAtIjnULSENvKhF.eW/LACGkdYrPuH3autJCy5bRUVO6amHy', 'veruskadaniela@gmail.com', '', 2, 0, NULL),
('28419255', 3, '28419255', '$2y$08$S3fdCQ2aLmnPuUy0XbROM.aFVnp3ac4D05ISefYJSJHSoHFXgiP6e', 'joséalfredo@gmail.com', '', 2, 0, NULL),
('28425074', 3, '28425074', '$2y$08$rx4RoUD6sgyc3J3XjrAGMe6QfKsCdZP7Ac1EF61oHinoS98pHJeaW', 'carlosalberto@gmail.com', '', 2, 0, NULL),
('28425163', 3, '28425163', '$2y$08$W7Tu2zX1Fu4QuzAkvveKZO6nTVaSTUtyyARxRRkyzeZQXfOzNuSSS', 'jesusreinaldo@gmail.com', '', 2, 0, NULL),
('28454171', 3, '28454171', '$2y$08$tdsRmqceGT4JZSFMzN34wOID62fh0kuDMOOznOeXWuJaX7ia7qGa.', 'danielalejandro@gmail.com', '', 2, 0, NULL),
('28493551', 3, '28493551', '$2y$08$E5Pjnmg9tCC4PCk.KMSupepe5c7wmf.f2VxwO9KTGkJZcCLfFs3rS', 'saralydejesus@gmail.com', '', 2, 0, NULL),
('28493599', 3, '28493599', '$2y$08$/QIHCrng2hKHtJYU0W3vDufnYDi0/Y3ufblpxC4MecVDR2qWaZLFW', 'ángeldavid@gmail.com', '', 2, 0, NULL),
('28566015', 3, '28566015', '$2y$08$Jj8NV6PX.R/4tw6aBY3gUOBXVXgaFS.aj.3MqTe97w7Et3XdZYd5.', 'seleniadelcarmen@gmail.com', '', 2, 0, NULL),
('28577290', 3, '28577290', '$2y$08$GLjlFiCNZPe6IGRTT.ULUe7Y1.Xa4WrZbgjPz68.M076BdieUwpQa', 'ashleyninoska@gmail.com', '', 2, 0, NULL),
('28591644', 3, '28591644', '$2y$08$j1WWNttyaomoqaUKluOHz.RbX3A4QWDSQ2oGZCh/moZNFwi989Ysa', 'norianavalentina@gmail.com', '', 2, 0, NULL),
('28653762', 3, '28653762', '$2y$08$rm8Enw2nrv4IbOQ2PFdf5.IaAn373I1MVjOZKMTuLzLM0CMH7wUDC', 'abrahamdavid@gmail.com', '', 2, 0, NULL),
('28653985', 3, '28653985', '$2y$08$lSsjOkRjWauC9dbMR1cgLuqH1ALc/CFbMJImBPilMJSaXESWJG39e', 'eyitzathlelibeth@gmail.com', '', 2, 0, NULL),
('28667508', 3, '28667508', '$2y$08$bVJLxLIjbL9XcZb6nc11Be2VMlSdNXM/mbgnDsW/4wsg9FszdaQdO', 'camilamarilin@gmail.com', '', 2, 0, NULL),
('28732056', 3, '28732056', '$2y$08$oKsJ9FqVweUzYeMHHx1iaumYN9fEMVjtg86F0c.v.YbBC22wwbssC', 'michellegetsemani@gmail.com', '', 2, 0, NULL),
('29506929', 3, '29506929', '$2y$08$t8gmp5suuSIF2i1aCcergu8ywhoDE.ybr.FgsoPzLgGsIgVuYAhzy', 'stephalyfernanda@gmail.com', '', 2, 0, NULL),
('29517646', 3, '29517646', '$2y$08$B99Tek.h48ISh2u4REViMuU7A51pGs.eW6X/GuH8I1cDqCzHA.zde', 'albertojesus@gmail.com', '', 2, 0, NULL),
('29531699', 3, '29531699', '$2y$08$8DThA5sGEhZGx/FTCWGARO8DmXk2aJZh87gjHAcnihBrNmcwlVH8.', 'diegoalejandro@gmail.com', '', 2, 0, NULL),
('29531941', 3, '29531941', '$2y$08$8YWVPDwxcGN2Eaqjfo3VVOaLIHLKrKtXshZsytQvJBLeUjz99woDq', 'huralitgabriela@gmail.com', '', 2, 0, NULL),
('29623858', 3, '29623858', '$2y$08$pGmwHgnmzwt0nUxSqfmwJODOfC1tPnf696.xCbA83Mb72/6Mhk7KG', 'jesusdavid@gmail.com@gmail.com', '', 2, 0, NULL),
('29673344', 3, '29673344', '$2y$08$kU9o45IFXJpq8qTH7OzKh.u0UCl7fOo0goiMQTnFQLxvM8zuz8iDG', 'daimaryraxiel@gmail.com', '', 2, 0, NULL),
('29707357', 3, '29707357', '$2y$08$8a9/4Gjm2xcW1s303fb56ukdyObEPcc5s47CyIdgxriv3zo2jegvG', 'carlosalejandro@gmail.com', '', 2, 0, NULL),
('29737725', 3, '29737725', '$2y$08$DuzxR0Gc726WIjcmFPzyW.T8Nxz7IQcvS3PsuDZ5DAFhzyspHFj1a', 'giovannadariana@gmail.com', '', 2, 0, NULL),
('29778296', 3, '29778296', '$2y$08$RzYUsdUCwUXao4uJuGx9I.3Iy.Hhw8qmhMnSLTo2mwheCe2gWeyGy', 'keylimarjorjelys@gmail.com', '', 2, 0, NULL),
('29805035', 3, '29805035', '$2y$08$BuMVa57utzERPkJ9WXp8herqtqvFDnC7H/6wXUw/b0Sn35PbcqJq2', 'aranzavictoria@gmail.com', '', 2, 0, NULL),
('29805811', 3, '29805811', '$2y$08$fvvaX/38juTotgDRjyksBeP92ZV5M5g5yZEu6R0/.VyH9tdX.HItG', 'barbarakatherina@gmail.com', '', 2, 0, NULL),
('29805959', 3, '29805959', '$2y$08$smwqfO2NwFNGPxE7oOQ1.e.sGKaWhYQmaDQi6WWWNp1cIBF4s3Kw.', 'mariafabiola@gmail.com', '', 2, 0, NULL),
('29868285', 3, '29868285', '$2y$08$rWwu2uat/mXZgGK2Y2vdX.2ktDG8qdWFRVBtiZnOHI1mc.gfu//hS', 'hildanismichelle@gmail.com', '', 2, 0, NULL),
('29873599', 3, '29873599', '$2y$08$1CymVvotdC6suJv4jNoG/O1x8Hr39EYLePOAcaDzMPFIBrTifzZSa', 'juliannycarolina@gmail.com', '', 2, 0, NULL),
('29873681', 3, '29873681', '$2y$08$Ew.fBc/jLLZu1IB2ei4lB.VgX9U20YN4uzVAXu1Gnbcd9SPzYOM9S', 'luciriamnyangelica@gmail.com', '', 2, 0, NULL),
('29880046', 3, '29880046', '$2y$08$tXSy5Hg.dG1JZPY4idss3uHhp1.o5PqBwApKT47Q45QWyohRc2fqO', 'jorielfelipe@gmail.com', '', 2, 0, NULL),
('29895603', 3, '29895603', '$2y$08$yLBIOM7WCBjiQ3oxCTmh9O9kg4J0O0n6qS7ARsJCJXJPr9wSPHbDS', 'osyarlydelvalle@gmail.com', '', 2, 0, NULL),
('29896222', 3, '29896222', '$2y$08$Y3HQDzFwyojPQc7YSKdTxO/q0FYESnCOowxb1MgJTogYAJRFgYAx2', 'ariannagabriela@gmail.com', '', 2, 0, NULL),
('29909672', 3, '29909672', '$2y$08$OVGLz3hvMdmFllgl/1QjGeBHg09eVYRAoolrLEzZxsrkpZ4xZfiju', 'andreadalay@gmail.com', '', 2, 0, NULL),
('29957240', 3, '29957240', '$2y$08$Qjuk7vekzurKK/gGCpJUseeQz74CDvRuifsk9OM4/RuNl5JpL3FhK', 'mariajose@gmail.com@gmail.com', '', 2, 0, NULL),
('29972507', 3, '29972507', '$2y$08$CtuSrpxrMcEUdd1JYhJjn.F2eEQt1iMyzmJ3qOe/OIJkrITMhZ7zW', 'leukarandreina@gmail.com', '', 2, 0, NULL),
('29997284', 3, '29997284', '$2y$08$NqR/uI7VyJgdN.YaGcpnG.cBxc8w5tGVY20g3CzWpjKPfdxP9KXSe', 'mariangelcoromoto@gmail.com', '', 2, 0, NULL),
('29997745', 3, '29997745', '$2y$08$y1Nq2BaBUilvRDCfwOhEiuee3vyAPI4NL3MCcscODk32ZbsVXHj/6', 'alexagabriela@gmail.com', '', 2, 0, NULL),
('29997933', 3, '29997933', '$2y$08$6f5a74Cr99JVGkdcNDWCy.tco950Dr3hMPu9GbM8HOFeUfURY.pBu', 'dayrelisoriana@gmail.com', '', 2, 0, NULL),
('29997996', 3, '29997996', '$2y$08$iY939SA9ixMaGFLfQqFMmeuHD7.ZdcVFQEuKgkPFQtThDxxZaDv2m', 'yexeniaalejandra@gmail.com', '', 2, 0, NULL),
('30014332', 3, '30014332', '$2y$08$jBIDlKnG6nuc6Cb6c0OFJuA.zw6vk/JOL4s/I7NWnzEYvEWdVUb.u', 'dominiwillianny@gmail.com', '', 2, 0, NULL),
('30014941', 3, '30014941', '$2y$08$vg8DAdTIANLaCD1tdZ8V1OfLa15YGZSGwekDXUP0/iy44z0w0LCfe', 'manuelalejandro@gmail.com@gmail.com', '', 2, 0, NULL),
('30019949', 3, '30019949', '$2y$08$iN.fbxFEPMKTpCuyzzy9QeCnC6.h7V0IHnJ5w64xhrX..bIvcSH0K', 'marialbaandrea@gmail.com', '', 2, 0, NULL),
('30025508', 3, '30025508', '$2y$08$4vrXSp.1iPuCjO6V5B98yO4VnaSkXKGwh7cjAG4pn6yaqXFvrZOWa', 'williannyssinais@gmail.com', '', 2, 0, NULL),
('30042882', 3, '30042882', '$2y$08$t6.9Q6pymwumfaq/SpXOOOUe.QtKoAzoTsNu1gcOa1Ea6/9wcgqse', 'yuliannycarolina@gmail.com', '', 2, 0, NULL),
('30071684', 3, '30071684', '$2y$08$DoMYMA05Zs8u1WN9uIoxDONofkwVlb2WMuiznbSJvXpxjpomealyq', 'mariavirginia@gmail.com', '', 2, 0, NULL),
('30071916', 3, '30071916', '$2y$08$v5QG0nZQZNLFVplgPX.Nx.gyFeM/bnhqUu.70UV.NhPJGFE9YTorO', 'alexanderenmanuel@gmail.com', '', 2, 0, NULL),
('30072006', 3, '30072006', '$2y$08$VBZ2cX3ctRYdkaNSoROmhu1xFLrLtJon64nCsGpzeoj3u.lYQ/E4q', 'heilynariangel@gmail.com', '', 2, 0, NULL),
('30105851', 3, '30105851', '$2y$08$MKi2XsZtPCt4bP4rjPVMROY32SV1a7zNB0Mg.uh8iQR5AkuhByM12', 'ariannapaola@gmail.com', '', 2, 0, NULL),
('30125529', 3, '30125529', '$2y$08$UDDDOd3kUV67DsLo/mTLX.yhIGrINn5oMubivkoWAMHWluKUTSKFu', 'jaykeralfredo@gmail.com', '', 2, 0, NULL),
('30128198', 3, '30128198', '$2y$08$d4ggVdAG7PKr/oUnVxRPzO24KzTw5iPtaDjzMe/r/tUqWmH7EnO/G', 'aleanderjose@gmail.com', '', 2, 0, NULL),
('30130092', 3, '30130092', '$2y$08$yotl7Wnr2Xa3tGsEMqlihebUC2fd.pv7Q45.pvlJp596pd.lLU.mG', 'ariannysyiseth@gmail.com', '', 2, 0, NULL),
('30130398', 3, '30130398', '$2y$08$PaO7NsVIXDkq2dl7mxMZFefPYEXFLZBvS00J0NzqGf1GHdsVv5erS', 'aslymishell@gmail.com', '', 2, 0, NULL),
('30204766', 3, '30204766', '$2y$08$IHipkHUA3kcg7zLw2L2urOGDubVm4qvYind0VvD.F1.92PxcyuKqy', 'katerinvivinana@gmail.com', '', 2, 0, NULL),
('30233789', 3, '30233789', '$2y$08$nQUcfyRrq6mp0zANO4uUpunqu6PulaVoNSzQ7hGSFzS74FgQVX98.', 'victorartuto@gmail.com', '', 2, 0, NULL),
('30304308', 3, '30304308', '$2y$08$sixyAWl8NbNaaYclvbugrOU9XzKQosuCHGdExckZfA.EKaLNVIVzu', 'daviannysandreina@gmail.com', '', 2, 0, NULL),
('30318011', 3, '30318011', '$2y$08$c7R8tVjXNv1MLVgmvQHLhOBNAZxgQ0jou8xj3jS84c9UeRmvt9iaa', 'scarlettbeatriz@gmail.com', '', 2, 0, NULL),
('30352820', 3, '30352820', '$2y$08$4DMqwS9cYJKkTIyRLqSqXeTrGSJZezNpoeBKdZV.6qj5H7RLVa0EC', 'mariajose@gmail.com', '', 2, 0, NULL),
('30352909', 3, '30352909', '$2y$08$jQ9OddekKhGI7iJMLykVpOU5RLADtkeJUVa9UVnEZ4u2DMr6hR7JO', 'jereslinandreina@gmail.com', '', 2, 0, NULL),
('30353140', 3, '30353140', '$2y$08$FupeWSrB0DPwIYOK7/qvYeVNOUNn1Rw7lKhHcmIuvq6umhlTA9QNu', 'elyimardelvalle@gmail.com', '', 2, 0, NULL),
('30376563', 3, '30376563', '$2y$08$oHAlqvF28la.vZTzkb5yYebQrfFux1nJdi9Mp3643sz4vCVbEzQfa', 'yodeimarclaudisbe@gmail.com', '', 2, 0, NULL),
('30416805', 3, '30416805', '$2y$08$tb6LrufrrEKuE3X6iGKmc.1zcWryZ26TdZz3i0PWx.868Jf9LJ5Oa', 'jeisisyoselyn@gmail.com', '', 2, 0, NULL),
('30485158', 3, '30485158', '$2y$08$NLDoaJvE8uPhJxPXHGHTo.P4G27LTN2CvCh9G3XkiuDzJPw1LyTJ.', 'dannelysestefany@gmail.com', '', 2, 0, NULL),
('30485269', 3, '30485269', '$2y$08$.D8xKUgv2y4a1CfDIqSUVeG3Gpq1YgRvSssfrsrjVXGYRvq2GUT7S', 'wilmarykatherine@gmail.com', '', 2, 0, NULL),
('30560561', 3, '30560561', '$2y$08$XVtNTVNC6isuppUWo6.zie3TkJ/34W/XvnnGrA7.4J8/Qm4serNw.', 'francokenneth@gmail.com', '', 2, 0, NULL),
('30615904', 3, '30615904', '$2y$08$v7t/76YLKRx8BWskd0RdpOA8FZkwhaddINzbI8zPEamfA7eh1ynGi', 'mckensylucia@gmail.com', '', 2, 0, NULL),
('30621621', 3, '30621621', '$2y$08$.7iwd64gZhcW0Q.XgmyIo.vTq5p3vf5lW4.AU4rReWj/SDO1hLJOO', 'camilamichell@gmail.com', '', 2, 0, NULL),
('30621694', 3, '30621694', '$2y$08$jCBgGGFCHHvttLywIrmWtO9Fv4OK5cwzLLpdg74IrBFC53A7jRYka', 'paolagissethl@gmail.com', '', 2, 0, NULL),
('30759265', 3, '30759265', '$2y$08$CzEgzGXmDd/Jf/TNLmaU0Omu6.QIxQxdqQIdORjwrunxxG3di8kBu', 'rismaryjose@gmail.com', '', 2, 0, NULL),
('30868143', 3, '30868143', '$2y$08$yIv1yWLnoby70gBulBWU0eWZq4BhKrKUR5cqTfagLyeQSDcHULAlC', 'samanthavanessa@gmail.com', '', 2, 0, NULL),
('30873044', 3, '30873044', '$2y$08$ZtCD5k/zDY32RiYhejCKQ.46/3Ip94ZCojp7FJlzuMzPO3Od2x.hG', 'oriannyfabiola@gmail.com', '', 2, 0, NULL),
('31026129', 3, '31026129', '$2y$08$kIxLfjBaRo1u6Oi/5FLRf.69Rpb7HUZ.pu1w0CAqCUtj.xTIPyNkq', 'jesusdaniel@gmail.com', '', 2, 0, NULL),
('31041718', 3, '31041718', '$2y$08$/IK5JuVvjN7ZFmwpxXqehO.RqkIbWQyDMH6uAVy1SfVk.4mq6iC6S', 'wilsondavid@gmail.com', '', 2, 0, NULL);
INSERT INTO `usuarios` (`cedula_usuario`, `id_rol`, `nombre_usuario`, `password_usuario`, `correo`, `imagen`, `estatus`, `intentos`, `codigo_desbloqueo`) VALUES
('31400939', 3, '31400939', '$2y$08$1EH9mGu/3DqGqst7XeyUluK/8ruY4hgQiqP6Oi.Sf1YkQqevrF.5q', 'efrainantonio@gmail.com', '', 2, 0, NULL),
('31402507', 3, '31402507', '$2y$08$8l1eicZCQWhQnR01yjfxO.y03aT76WVh7R0Qq8XimmiKfrBjSfvEm', 'miguelamilcar@gmail.com', '', 2, 0, NULL),
('32790740', 3, '32790740', '$2y$08$4z4MT9BuQ77IFtViyuU.GO0oooCvK2X8BiJhcvkrunFkEBxZCPuWy', 'henryfrancisco@gmail.com', '', 2, 0, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id_accesos`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_modulo` (`id_modulo`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`cedula_alumno`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id_bitacora`),
  ADD KEY `cedula_usuario` (`cedula_usuario`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id_clase`),
  ADD KEY `id_SC` (`id_SC`),
  ADD KEY `cod_seccion` (`cod_seccion`),
  ADD KEY `cedula_profesor` (`cedula_profesor`),
  ADD KEY `clases_ibfk_4` (`id_periodo`);

--
-- Indices de la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD PRIMARY KEY (`cod_grupo`),
  ADD KEY `id_SA` (`id_SA`),
  ADD KEY `cod_proyecto` (`cod_proyecto`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id_modulo`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_clase` (`id_clase`),
  ADD KEY `id_SA` (`id_SA`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id_notificacion`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id_periodo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`cedula_profesor`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`cod_proyecto`),
  ADD KEY `cedula_profesor` (`cedula_profesor`);

--
-- Indices de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `cedula_usuario` (`cedula_usuario`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `rsa`
--
ALTER TABLE `rsa`
  ADD PRIMARY KEY (`id_rsa`),
  ADD KEY `cedula_usuario` (`cedula_usuario`);

--
-- Indices de la tabla `saberes`
--
ALTER TABLE `saberes`
  ADD PRIMARY KEY (`id_SC`);

--
-- Indices de la tabla `secciones`
--
ALTER TABLE `secciones`
  ADD PRIMARY KEY (`cod_seccion`);

--
-- Indices de la tabla `seccion_alumno`
--
ALTER TABLE `seccion_alumno`
  ADD PRIMARY KEY (`id_SA`),
  ADD KEY `cod_seccion` (`cod_seccion`),
  ADD KEY `cedula_alumno` (`cedula_alumno`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cedula_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accesos`
--
ALTER TABLE `accesos`
  MODIFY `id_accesos` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id_bitacora` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=711;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id_clase` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id_modulo` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id_notificacion` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id_periodo` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `respuestas`
--
ALTER TABLE `respuestas`
  MODIFY `id_respuesta` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `rsa`
--
ALTER TABLE `rsa`
  MODIFY `id_rsa` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `saberes`
--
ALTER TABLE `saberes`
  MODIFY `id_SC` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `seccion_alumno`
--
ALTER TABLE `seccion_alumno`
  MODIFY `id_SA` int(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `accesos_ibfk_3` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_SC`) REFERENCES `saberes` (`id_SC`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`cod_seccion`) REFERENCES `secciones` (`cod_seccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clases_ibfk_3` FOREIGN KEY (`cedula_profesor`) REFERENCES `profesores` (`cedula_profesor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clases_ibfk_4` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`id_SA`) REFERENCES `seccion_alumno` (`id_SA`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_SA`) REFERENCES `seccion_alumno` (`id_SA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`cedula_profesor`) REFERENCES `profesores` (`cedula_profesor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rsa`
--
ALTER TABLE `rsa`
  ADD CONSTRAINT `rsa_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seccion_alumno`
--
ALTER TABLE `seccion_alumno`
  ADD CONSTRAINT `seccion_alumno_ibfk_1` FOREIGN KEY (`cod_seccion`) REFERENCES `secciones` (`cod_seccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seccion_alumno_ibfk_2` FOREIGN KEY (`cedula_alumno`) REFERENCES `alumnos` (`cedula_alumno`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
