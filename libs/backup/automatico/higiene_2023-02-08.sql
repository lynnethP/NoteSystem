

CREATE TABLE `modulos` (
  `id_modulo` int(20) NOT NULL AUTO_INCREMENT,
  `nombre_modulo` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO modulos VALUES("1","Alumnos","1");
INSERT INTO modulos VALUES("2","Profesores","1");
INSERT INTO modulos VALUES("3","Periodos","1");
INSERT INTO modulos VALUES("4","Saberes","1");
INSERT INTO modulos VALUES("5","Secciones","1");
INSERT INTO modulos VALUES("6","Clases","1");
INSERT INTO modulos VALUES("7","Proyectos","1");
INSERT INTO modulos VALUES("8","Notas","1");
INSERT INTO modulos VALUES("9","Usuarios","1");
INSERT INTO modulos VALUES("10","Reportes","1");
INSERT INTO modulos VALUES("11","Bitácora","1");
INSERT INTO modulos VALUES("12","Usuario Bloqueado","1");
INSERT INTO modulos VALUES("13","Modulos","1");
INSERT INTO modulos VALUES("14","Permisos","1");
INSERT INTO modulos VALUES("15","Roles","1");
INSERT INTO modulos VALUES("16","Mantenimiento","1");





CREATE TABLE `permisos` (
  `id_permiso` int(20) NOT NULL AUTO_INCREMENT,
  `nombre_permiso` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_permiso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO permisos VALUES("1","Agregar","1");
INSERT INTO permisos VALUES("2","Consultar","1");
INSERT INTO permisos VALUES("3","Modificar","1");
INSERT INTO permisos VALUES("4","Eliminar","1");





CREATE TABLE `roles` (
  `id_rol` int(20) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO roles VALUES("1","Superusuario","1");
INSERT INTO roles VALUES("2","Administrador","1");
INSERT INTO roles VALUES("3","Alumnos","1");
INSERT INTO roles VALUES("4","Profesores","1");





CREATE TABLE `accesos` (
  `id_accesos` int(20) NOT NULL AUTO_INCREMENT,
  `id_rol` int(20) NOT NULL,
  `id_modulo` int(20) NOT NULL,
  `id_permiso` int(20) NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_accesos`),
  KEY `id_rol` (`id_rol`),
  KEY `id_modulo` (`id_modulo`),
  KEY `id_permiso` (`id_permiso`),
  CONSTRAINT `accesos_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accesos_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `accesos_ibfk_3` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id_permiso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO accesos VALUES("1","1","1","1","1");
INSERT INTO accesos VALUES("2","1","1","2","1");
INSERT INTO accesos VALUES("3","1","1","3","1");
INSERT INTO accesos VALUES("4","1","1","4","1");
INSERT INTO accesos VALUES("5","1","2","1","1");
INSERT INTO accesos VALUES("6","1","2","2","1");
INSERT INTO accesos VALUES("7","1","2","3","1");
INSERT INTO accesos VALUES("8","1","2","4","1");
INSERT INTO accesos VALUES("9","1","3","1","1");
INSERT INTO accesos VALUES("10","1","3","2","1");
INSERT INTO accesos VALUES("11","1","3","3","1");
INSERT INTO accesos VALUES("12","1","3","4","1");
INSERT INTO accesos VALUES("13","1","4","1","1");
INSERT INTO accesos VALUES("14","1","4","2","1");
INSERT INTO accesos VALUES("15","1","4","3","1");
INSERT INTO accesos VALUES("16","1","4","4","1");
INSERT INTO accesos VALUES("17","1","5","1","1");
INSERT INTO accesos VALUES("18","1","5","2","1");
INSERT INTO accesos VALUES("19","1","5","3","1");
INSERT INTO accesos VALUES("20","1","5","4","1");
INSERT INTO accesos VALUES("21","1","6","1","1");
INSERT INTO accesos VALUES("22","1","6","2","1");
INSERT INTO accesos VALUES("23","1","6","3","1");
INSERT INTO accesos VALUES("24","1","6","4","1");
INSERT INTO accesos VALUES("25","1","7","1","1");
INSERT INTO accesos VALUES("26","1","7","2","1");
INSERT INTO accesos VALUES("27","1","7","3","1");
INSERT INTO accesos VALUES("28","1","7","4","1");
INSERT INTO accesos VALUES("29","1","8","1","1");
INSERT INTO accesos VALUES("30","1","8","2","1");
INSERT INTO accesos VALUES("31","1","8","3","1");
INSERT INTO accesos VALUES("32","1","8","4","1");
INSERT INTO accesos VALUES("33","1","9","1","1");
INSERT INTO accesos VALUES("34","1","9","2","1");
INSERT INTO accesos VALUES("35","1","9","3","1");
INSERT INTO accesos VALUES("36","1","9","4","1");
INSERT INTO accesos VALUES("37","1","10","1","1");
INSERT INTO accesos VALUES("38","1","10","2","1");
INSERT INTO accesos VALUES("39","1","10","3","1");
INSERT INTO accesos VALUES("40","1","10","4","1");
INSERT INTO accesos VALUES("41","1","11","1","1");
INSERT INTO accesos VALUES("42","1","11","2","1");
INSERT INTO accesos VALUES("43","1","11","3","1");
INSERT INTO accesos VALUES("44","1","11","4","1");
INSERT INTO accesos VALUES("45","1","12","1","1");
INSERT INTO accesos VALUES("46","1","12","2","1");
INSERT INTO accesos VALUES("47","1","12","3","1");
INSERT INTO accesos VALUES("48","1","12","4","1");
INSERT INTO accesos VALUES("49","1","13","1","1");
INSERT INTO accesos VALUES("50","1","13","2","1");
INSERT INTO accesos VALUES("51","1","13","3","1");
INSERT INTO accesos VALUES("52","1","13","4","1");
INSERT INTO accesos VALUES("53","1","14","1","1");
INSERT INTO accesos VALUES("54","1","14","2","1");
INSERT INTO accesos VALUES("55","1","14","3","1");
INSERT INTO accesos VALUES("56","1","14","4","1");
INSERT INTO accesos VALUES("57","1","15","1","1");
INSERT INTO accesos VALUES("58","1","15","2","1");
INSERT INTO accesos VALUES("59","1","15","3","1");
INSERT INTO accesos VALUES("60","1","15","4","1");
INSERT INTO accesos VALUES("61","1","16","1","1");
INSERT INTO accesos VALUES("62","1","16","2","1");
INSERT INTO accesos VALUES("63","1","16","3","1");
INSERT INTO accesos VALUES("64","1","16","4","1");
INSERT INTO accesos VALUES("77","2","1","1","1");
INSERT INTO accesos VALUES("78","2","1","2","1");
INSERT INTO accesos VALUES("79","2","1","3","1");
INSERT INTO accesos VALUES("80","2","1","4","1");
INSERT INTO accesos VALUES("81","2","2","1","1");
INSERT INTO accesos VALUES("82","2","2","2","1");
INSERT INTO accesos VALUES("83","2","2","3","1");
INSERT INTO accesos VALUES("84","2","2","4","1");
INSERT INTO accesos VALUES("85","2","3","1","1");
INSERT INTO accesos VALUES("86","2","3","2","1");
INSERT INTO accesos VALUES("87","2","3","3","1");
INSERT INTO accesos VALUES("88","2","3","4","1");
INSERT INTO accesos VALUES("89","2","4","1","1");
INSERT INTO accesos VALUES("90","2","4","2","1");
INSERT INTO accesos VALUES("91","2","4","3","1");
INSERT INTO accesos VALUES("92","2","4","4","1");
INSERT INTO accesos VALUES("93","2","5","1","1");
INSERT INTO accesos VALUES("94","2","5","2","1");
INSERT INTO accesos VALUES("95","2","5","3","1");
INSERT INTO accesos VALUES("96","2","5","4","1");
INSERT INTO accesos VALUES("97","2","6","1","1");
INSERT INTO accesos VALUES("98","2","6","2","1");
INSERT INTO accesos VALUES("99","2","6","3","1");
INSERT INTO accesos VALUES("100","2","6","4","1");
INSERT INTO accesos VALUES("101","2","7","1","1");
INSERT INTO accesos VALUES("102","2","7","2","1");
INSERT INTO accesos VALUES("103","2","7","3","1");
INSERT INTO accesos VALUES("104","2","7","4","1");
INSERT INTO accesos VALUES("105","2","8","1","1");
INSERT INTO accesos VALUES("106","2","8","2","1");
INSERT INTO accesos VALUES("107","2","8","3","1");
INSERT INTO accesos VALUES("108","2","8","4","1");
INSERT INTO accesos VALUES("109","2","9","1","1");
INSERT INTO accesos VALUES("110","2","9","2","1");
INSERT INTO accesos VALUES("111","2","9","3","1");
INSERT INTO accesos VALUES("112","2","9","4","1");
INSERT INTO accesos VALUES("113","2","10","1","1");
INSERT INTO accesos VALUES("114","2","10","2","1");
INSERT INTO accesos VALUES("115","2","10","3","1");
INSERT INTO accesos VALUES("116","2","10","4","1");
INSERT INTO accesos VALUES("117","2","12","1","1");
INSERT INTO accesos VALUES("118","2","12","2","1");
INSERT INTO accesos VALUES("119","2","12","3","1");
INSERT INTO accesos VALUES("120","2","12","4","1");
INSERT INTO accesos VALUES("121","3","8","2","1");
INSERT INTO accesos VALUES("122","4","7","1","1");
INSERT INTO accesos VALUES("123","4","7","2","1");
INSERT INTO accesos VALUES("124","4","7","3","1");
INSERT INTO accesos VALUES("125","4","7","4","1");
INSERT INTO accesos VALUES("126","4","8","1","1");
INSERT INTO accesos VALUES("127","4","8","2","1");
INSERT INTO accesos VALUES("128","4","8","3","1");
INSERT INTO accesos VALUES("129","4","8","4","1");
INSERT INTO accesos VALUES("130","4","10","2","1");





CREATE TABLE `alumnos` (
  `cedula_alumno` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_alumno` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_alumno` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_alumno` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`cedula_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO alumnos VALUES("15732561","Jose Manuel","Hernandez Alvarado","1","1");
INSERT INTO alumnos VALUES("25421667","Haisbel Yoelimar","Abad Guedez","1","1");
INSERT INTO alumnos VALUES("26398488","Josmar Alexander","Rodriguez Ramirez","3","1");
INSERT INTO alumnos VALUES("27212841","Emeli Elianny","Betancourt Zambrano","1","1");
INSERT INTO alumnos VALUES("28021462","Yenifer Fragnimar","Adan Vargas","1","1");





CREATE TABLE `profesores` (
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_profesor` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_profesor` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_profesor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`cedula_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO profesores VALUES("01566370","Judith","Díaz ","0416-6562155","1");
INSERT INTO profesores VALUES("03633921","Luis Guillermo","Mendoza ","0414-5229780","1");
INSERT INTO profesores VALUES("03756922","Edgar","Guedez","0416-1417015","1");
INSERT INTO profesores VALUES("03782342","Ricardo","Valderrama ","0416-0509127","1");
INSERT INTO profesores VALUES("03787540","Pablo","Guevara ","0416-3594134","1");
INSERT INTO profesores VALUES("04002660","Cruz","Estanga ","0414-5284797","1");
INSERT INTO profesores VALUES("04177704","Jesús","Guerrero","0416-6518781","1");
INSERT INTO profesores VALUES("04342594","Bertha","Pulido","0416-7553367","1");
INSERT INTO profesores VALUES("04373481","Arelys","Crespo ","0416-5526925","1");
INSERT INTO profesores VALUES("04966848","Carlos","Awais","0414-5331638","1");
INSERT INTO profesores VALUES("05116367","José","Andrade","0416-6509328","1");
INSERT INTO profesores VALUES("05237891","Alida","Peña","0416-4518478","1");
INSERT INTO profesores VALUES("05243212","Luis","Crespo","0416-8520578","1");
INSERT INTO profesores VALUES("05250654","Andrés E","Mendoza ","0416-8583085","1");
INSERT INTO profesores VALUES("07132428","Elizabeth","Briceño ","4145490888","1");
INSERT INTO profesores VALUES("07313351","José Gerardo","González","0416-5013469","1");
INSERT INTO profesores VALUES("07348871","Elisa","Colmenarez","0426-4562176","1");
INSERT INTO profesores VALUES("07350834","Eunice","Jiménez","0414-5197021","1");
INSERT INTO profesores VALUES("07359889","Manuel","Branco ","0426-9514885","1");
INSERT INTO profesores VALUES("07386104","Lesdy","Piña","0426-3545285","1");
INSERT INTO profesores VALUES("07387449","Oliva","Pineda ","0416-2580372","1");
INSERT INTO profesores VALUES("07389728","Jhonny","Picone","0416-5508804","1");
INSERT INTO profesores VALUES("07395006","Francisco","Duran ","0412-5109311","1");
INSERT INTO profesores VALUES("07399931","Rodrigo","Lander","0424-5328522","1");
INSERT INTO profesores VALUES("07403069","Jairo","Arias","0426-8387382","1");
INSERT INTO profesores VALUES("07409068","Elsy","Romero","0424-5251302","1");
INSERT INTO profesores VALUES("07438075","Zieliska","Oviedo ","0426-5520466","1");
INSERT INTO profesores VALUES("07442799","Adolia","Garcés ","0426-6500409","1");
INSERT INTO profesores VALUES("07914356","Evelyn","Barragán","0414-5699490","1");
INSERT INTO profesores VALUES("07970802","Camillo","Di Cola ","0416-9106275","1");
INSERT INTO profesores VALUES("08627938","Jenny","Acosta","0416-5520375","1");
INSERT INTO profesores VALUES("09048980","Ynmaculada","Azuaje","0416-8514112","1");
INSERT INTO profesores VALUES("09378013","Yelitza","Santos ","0416-8584547","1");
INSERT INTO profesores VALUES("09544153","David","Peraza ","0416-5017153","1");
INSERT INTO profesores VALUES("09579750","Johnny","León","0416-9526505","1");
INSERT INTO profesores VALUES("09626909","Yuli","Morales ","0424-5893074","1");
INSERT INTO profesores VALUES("09708093","Alenis","Arevalo","041-68580821","1");
INSERT INTO profesores VALUES("10338520","Winston","Hidalgo","0416-3549992","1");
INSERT INTO profesores VALUES("10846059","María Alexandra","Corti","0414-2863414","1");
INSERT INTO profesores VALUES("10849476","Walter","Torres ","4145781907","1");
INSERT INTO profesores VALUES("11260305","Eva","Arrieche","0416-1503847","1");
INSERT INTO profesores VALUES("11580182","Endert","Gil","0416-9106257","1");
INSERT INTO profesores VALUES("11587952","Alexander","Cubiro ","0416-0747010","1");
INSERT INTO profesores VALUES("12026793","Carlos","Osal","0412-6540197","1");
INSERT INTO profesores VALUES("12244128","Yajhayra","Aldana","0416-4579469","1");
INSERT INTO profesores VALUES("12534603","Dayanara","Santos","0414-9576152","1");
INSERT INTO profesores VALUES("12630557","Michelly","Vivas","0416-4580901","1");
INSERT INTO profesores VALUES("12698690","María","Bonilla ","0416-3533357","1");
INSERT INTO profesores VALUES("12703237","Gizet","Asuaje","0414-5214515","1");
INSERT INTO profesores VALUES("12706637","Lisbeth","Acurero","0414-5162122","1");
INSERT INTO profesores VALUES("12707546","Larry","Segueri ","0426-4360691","1");
INSERT INTO profesores VALUES("12850970","Sergio","Jiménez","0416-7555155","1");
INSERT INTO profesores VALUES("13119423","Marvys","Soler","0416-2788147","1");
INSERT INTO profesores VALUES("13189208","Orana","Rosendo ","0414-5462251","1");
INSERT INTO profesores VALUES("13509849","Lilibell","Estevanot ","0414-5080204","1");
INSERT INTO profesores VALUES("13519545","Anabel","Abarca","0412-1647082","1");
INSERT INTO profesores VALUES("14068853","Gregorio","Colmenarez","0416-5559260","1");
INSERT INTO profesores VALUES("14228345"," Yennys","Gil","0412-5265765","1");
INSERT INTO profesores VALUES("14262620","Miriam","Peña ","0416-3825753","1");
INSERT INTO profesores VALUES("14749211","Somarilis","Valdez","0416-7566814","1");
INSERT INTO profesores VALUES("14880601","Johanna","Alastre","0416-5506816","1");
INSERT INTO profesores VALUES("14979119","Migliver","Montezuma","0426-7183459","1");
INSERT INTO profesores VALUES("15432288","Willians","Butcherr","04248765423","1");
INSERT INTO profesores VALUES("16385532","Isaac","Mendoza","0416-2505896","1");
INSERT INTO profesores VALUES("17612167","Francys","Soteldo ","0416-4555565","1");
INSERT INTO profesores VALUES("18226221","Glennimar","Carreño","0426-9582229","1");
INSERT INTO profesores VALUES("18690684","Joan","Perez","0416-5590847","1");
INSERT INTO profesores VALUES("18917274","Andrés","España","4245026266","1");
INSERT INTO profesores VALUES("19262335","Aldo","Ramos  ","0416-5529142","1");
INSERT INTO profesores VALUES("19591089","Carlos","Cuicas","0424-5932512","1");





CREATE TABLE `periodos` (
  `id_periodo` int(20) NOT NULL AUTO_INCREMENT,
  `nombre_periodo` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `year_periodo` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_apertura` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_cierre` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL,
  PRIMARY KEY (`id_periodo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO periodos VALUES("1","I","2022","2022-02-07","2022-07-01","1");
INSERT INTO periodos VALUES("2","II","2022","2022-09-05","2022-12-09","1");
INSERT INTO periodos VALUES("3","I","2023","2023-01-01","2023-01-10","1");
INSERT INTO periodos VALUES("4","II","2023","2023-02-13","2023-03-10","1");





CREATE TABLE `saberes` (
  `id_SC` int(20) NOT NULL AUTO_INCREMENT,
  `nombreSC` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_SC` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fase_SC` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`id_SC`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO saberes VALUES("1","Metodología","1","1","1");
INSERT INTO saberes VALUES("2","Estadística","1","1","1");
INSERT INTO saberes VALUES("3","Prácticas Comunicacionales","1","2","1");
INSERT INTO saberes VALUES("4","Computación","1","2","1");
INSERT INTO saberes VALUES("5","Metodología Ii","2","1","1");
INSERT INTO saberes VALUES("6","Estadística Ii","2","1","1");
INSERT INTO saberes VALUES("7","Prácticas Comunicacionales Ii","2","2","1");
INSERT INTO saberes VALUES("8","Técnicas De Capacitación","2","2","1");
INSERT INTO saberes VALUES("9","Comunicación Efectiva","3","1","1");
INSERT INTO saberes VALUES("10","Metodología Iii","3","1","1");
INSERT INTO saberes VALUES("11","Negociación Y Resolución De Conflictos","3","2","1");
INSERT INTO saberes VALUES("12","Formulación Y Evaluación De Proyecto","3","2","1");
INSERT INTO saberes VALUES("13","Cad","4","1","1");
INSERT INTO saberes VALUES("14","Innovación","4","1","1");





CREATE TABLE `secciones` (
  `cod_seccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_periodo` int(11) NOT NULL,
  `nombre_seccion` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_seccion` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL,
  PRIMARY KEY (`cod_seccion`),
  KEY `id_periodo` (`id_periodo`),
  CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_periodo`) REFERENCES `periodos` (`id_periodo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO secciones VALUES("T1P2S1","2","HS0102","1","1");
INSERT INTO secciones VALUES("T1P3S1","3","HS0102","1","1");
INSERT INTO secciones VALUES("T2P2S1","2","HS0201","2","1");
INSERT INTO secciones VALUES("T2P3S1","3","HS0202","2","1");





CREATE TABLE `seccion_alumno` (
  `id_SA` int(20) NOT NULL AUTO_INCREMENT,
  `cod_seccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_alumno` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL,
  PRIMARY KEY (`id_SA`),
  KEY `cod_seccion` (`cod_seccion`),
  KEY `cedula_alumno` (`cedula_alumno`),
  CONSTRAINT `seccion_alumno_ibfk_1` FOREIGN KEY (`cod_seccion`) REFERENCES `secciones` (`cod_seccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `seccion_alumno_ibfk_2` FOREIGN KEY (`cedula_alumno`) REFERENCES `alumnos` (`cedula_alumno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `clases` (
  `id_clase` int(20) NOT NULL AUTO_INCREMENT,
  `id_SC` int(20) NOT NULL,
  `cod_seccion` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `visto_profesor` int(11) DEFAULT NULL,
  `visto_tutor` int(11) DEFAULT NULL,
  `visto_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_clase`),
  KEY `id_SC` (`id_SC`),
  KEY `cod_seccion` (`cod_seccion`),
  KEY `cedula_profesor` (`cedula_profesor`),
  CONSTRAINT `clases_ibfk_1` FOREIGN KEY (`id_SC`) REFERENCES `saberes` (`id_SC`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clases_ibfk_2` FOREIGN KEY (`cod_seccion`) REFERENCES `secciones` (`cod_seccion`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clases_ibfk_3` FOREIGN KEY (`cedula_profesor`) REFERENCES `profesores` (`cedula_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO clases VALUES("1","1","T1P3S1","01566370","1","","","");
INSERT INTO clases VALUES("2","2","T1P3S1","03633921","1","","","");
INSERT INTO clases VALUES("3","7","T2P2S1","01566370","1","","","");
INSERT INTO clases VALUES("4","8","T2P2S1","03633921","1","","","");
INSERT INTO clases VALUES("5","3","T1P2S1","01566370","1","","","");





CREATE TABLE `proyectos` (
  `cod_proyecto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titulo_proyecto` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trayecto_proyecto` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`cod_proyecto`),
  KEY `cedula_profesor` (`cedula_profesor`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`cedula_profesor`) REFERENCES `profesores` (`cedula_profesor`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO proyectos VALUES("T1ST1P3S1P1","01566370","PNF INFORMÁTICA","1","1");
INSERT INTO proyectos VALUES("T2ST2P2S1P1","03633921","PNF CONTADURÍA","2","1");





CREATE TABLE `grupos` (
  `cod_grupo` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_SA` int(20) NOT NULL,
  `cod_proyecto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`cod_grupo`),
  KEY `id_SA` (`id_SA`),
  KEY `cod_proyecto` (`cod_proyecto`),
  CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`id_SA`) REFERENCES `seccion_alumno` (`id_SA`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`cod_proyecto`) REFERENCES `proyectos` (`cod_proyecto`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `notas` (
  `id_nota` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_clase` int(20) NOT NULL,
  `id_SA` int(20) NOT NULL,
  `nota` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nota` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_nota` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visto_alumno` int(11) DEFAULT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `id_clase` (`id_clase`),
  KEY `id_SA` (`id_SA`),
  CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_SA`) REFERENCES `seccion_alumno` (`id_SA`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






CREATE TABLE `notificaciones` (
  `id_notificacion` int(20) NOT NULL AUTO_INCREMENT,
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
  `visto_superusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO notificaciones VALUES("21","notas","codigo","-1","S1ST1P3S1N1","2023-01-03","08:07 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("22","notas","codigo","-1","S1ST1P3S1N2","2023-01-03","08:07 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("23","notas","codigo","-1","S1ST1P3S1N3","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("24","notas","codigo","-1","S1ST1P3S1N4","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("25","notas","codigo","-1","S1ST1P3S1N5","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("26","notas","codigo","-1","S1ST1P3S1N6","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("27","notas","codigo","-1","S1ST1P3S1N7","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("28","notas","codigo","-1","S1ST1P3S1N8","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("29","notas","codigo","-1","S1ST1P3S1N9","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("30","notas","codigo","-1","S1ST1P3S1N10","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("31","notas","codigo","-1","S1ST1P3S1N11","2023-01-03","08:08 pm","1","0","0","9","9");
INSERT INTO notificaciones VALUES("32","clases","id","1","","2023-01-04","07:41 am","1","9","0","0","0");
INSERT INTO notificaciones VALUES("33","clases","id","2","","2023-01-04","07:41 am","1","9","0","0","0");





CREATE TABLE `usuarios` (
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_rol` int(20) NOT NULL,
  `nombre_usuario` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_usuario` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  `intentos` int(10) NOT NULL,
  `codigo_desbloqueo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cedula_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO usuarios VALUES("00000000","1","Superadmin","$2y$08$wkSQR3522AQe7U2gywj1LujLmrZxHwWoiE5PfB0rDIaRsviVJER3W","pnfhsl10@gmail.com","","1","0","");
INSERT INTO usuarios VALUES("01566370","4","Jud10","$2y$08$P9WKFERkp5ZxDjvm8.C/5.jCYTZZF.pn1Kc/vZOedp9uVuzmJXQOi","judith_10@gmail.com","","1","0","");
INSERT INTO usuarios VALUES("07132428","2","Elizabeth07","$2y$08$iGp1kYYnWt8Za.Ox0heeTOBSynLsC9doMZhwajxR/pUwI476blIWm","elizabeth_briceño@gmail.com","","1","0","");
INSERT INTO usuarios VALUES("07359667","3","Elio10","$2y$08$iSxbegoMfPyIFOeJ2ZfuJugxv4pZcJ7XlBJKWo8SobtZ6nP6V3whu","elio_guerra@gmail.com","assets/img/perfil/15432287.jpeg","1","0","");
INSERT INTO usuarios VALUES("12346649","3","Carmelia12","$2y$08$1BlV0ZvLM1p3X4xhIn3MnO2bCretEyzRotUzut0BgbYBa/6tUW9zq","lynnethpereira12@gmail.com","","1","0","");
INSERT INTO usuarios VALUES("15432288","2","Will","$2y$08$epEqAagyYClwiIgmgA1/t.YbRQeHrIX.JgspFlu4bRFNb9ywCF7PO","williamss@gmail.com","assets/img/perfil/15432287.jpeg","1","0","");
INSERT INTO usuarios VALUES("15732561","3","15732561","$2y$08$ypz5I8u4pcDeLyU98.RQN.fkWoxQ.z2W6kZVF4/2T7nCC9.H3z6c6","josemanuel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("18690684","1","Joan18","$2y$08$UaGW9pFUu3hJ0UPTO5yOieZJpgFIwccK3lRYghebTVf1psqZ.6jBq","joan_manuel@gmail.com","","1","0","");
INSERT INTO usuarios VALUES("25421667","3","25421667","$2y$08$ghDf.rs2HmcCg17ExtY4R.D0ok.FS/rMD1.2bEAv1B8bHcPB1jpqS","haisbelyoelimar@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26398488","3","26398488","$2y$08$auHgV2zf6ZCdTPzp1DlrfOYLJFRZtrzQ/6tCC4MsMqnSOSznHcp0a","josrod.2112@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27212841","3","27212841","$2y$08$md97RIl79tyPxUbcMVkjUeUoE8igXYlPIyxqDrTmV4fFEWQNpHuUC","emelielianny@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28021462","3","28021462","$2y$08$uODYchySGSImrLJ/wcsbousMaBoNEs0wJGckCD4WkbolZFzwRJPou","yeniferfragnimar@gmail.com","","2","0","");





CREATE TABLE `rsa` (
  `id_rsa` int(20) NOT NULL AUTO_INCREMENT,
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `llave_publica` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `llave_privada` varchar(4000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firma_digital` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_acceso` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`id_rsa`),
  KEY `cedula_usuario` (`cedula_usuario`),
  CONSTRAINT `rsa_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO rsa VALUES("1","15432288","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VHBRSVlxMllyQUZSY0hGZ1U4T0FURDFsUW1YNmJicytRbENIcFRBWXlZd1JnZHIrSVZDc1ZJMWErNFdBcEJGU01ITlgyc0E2WHUrcGFVUGhvZkxxOHE3ZkFXeFZFN3ZsWXA5T2o5Y3E1Q3N6d1ZYZXNXL3FsUDJPZ2o5TitqUG5xY1A4NXpkTUFmL3hYV2NuSW44ZkVreWliRHQydUs2UC9hQmZKanB1WGo1RzhidjFlbm0wUTdZT3ZvMlRnak5FbWwyNWMxRUhNZFNUVlpmZXVya0syN3BBZnJGOC96d29oZDZaVUlQdHBtWC9tQmhtN21qaFJSdHMxYVBrUmhPM3ZXaExlekR5ek1kSHZVT1JQSlBzQStUZVB6ekt3NFl1WmJrWVNkd3htNkFZSkJPbnVtUjZFNEJTVVRYeFIxT1ZQWituVzVyRldjOG9NSzREV0NUZ2VTR050MXFEcE1NQkRueXR0U3pOYkJXeVVUWVQ0cGFYbkRDTEgySU9PY3lXZkhwZ3d0RzNFVVppck9RUzRQQmorSWo5b3cydXZvT2FlK1JLbXRhc2lZcFI2NG16NTRTN3FHTlBlUTJSN0htQ2U3UllZb0hSQUQ3emEzZ1JiRC9MSVpGTE9HTlB0blZrNDJxNnBJTGxQOXQ3WVh1NTl5NmRXMDJzSG1SanlLa0Jrb256WFpiSmE5QTZHczJMUDR2OUkzQT0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZDk5SXZmN3VVelpydjJ1T2lxbWw5WDJHSnhHZXFqZlduZU95aFl1Nmw2TTVRZFRORWQ4V2pJRkhiWFhNd2NKblFCdUdaeDBocHNEci9wLytkM2FrSkFDVVVZalZnUTNIS2IwS0JHR3NwOFRybWhHN3VLWTBrNFlvekt4cnRUajdOMGNGaWpyQWtTVVh2UDg3ZFN0d2ZOeWR0OHV2aHF5VWkwNHcvN05CTzB3ZnZwcTRiN3oyaWNDVitSUCs4bnl2eWNZSEhNM2xjRDg5ZVNCbmhwakZ5dFJaMmZHNzJCV2I5YkR1UTZ5OUJwbENQQUV0MVJ0N3I1RHp5YjRLS3lqUnpqSDU3b01SS0RxajU2cXhiMXEzMXM5OHZ3eGN0QVcyUmNnUEV2QmxzWmhUMVhNaG5aVVRrWHVTTFRNK0dPN3N0OUR3Yy9VdVk5aTg4WmNFemhIMzZlYnFGc3NnSFJJVURKN0NhNjZuSzdQcDR0eStBOGR1bHRKQXFnOWZkY0p5UDQ5R1lQL2gzRmV2RER1ZHVVUUI4SVVlbHJwY1ZrUElRcmhBSkRmTWI5dENwN0xkNzlRODN2TjVSVUh1dUFVVVQzb0Uvcm1qWUZ3K1pCeXM3Z3NBQXdLbEFtSGRibzdFVGlmZzZjMkt4MENyTTU1T2JZcnUwY0l5SEpWcGVndERZdjUvZldZMWQyeEhyV2RCMlcrK3BmMWZHNnVZNVJOQ1V4b2lUSngyZmlRNlpNWDcrTTdtQWMvbFk4L1Z1bGxCNENyYnZ6Y1AwQjdJaTJWc1hKV2wvcHh1cE9ISDE3anAzK0ZLK0ViQ04yUEtHYXZtOXgwaTU5dlBKSDhYb1hEbERGTkd0YjMrV09iTkdMYytQdGNaSjd5a1VtM2JKcUxNdXZOVzIrU2Q4dlJHcWtCMEt3VjkzV0hRRWNSMXpNeVg1NnJnSDh2anZKU2JuNWtBZm9LNXJmamROUVMzWTQzT2NVUlRHenI5TE5zZkE2RXJ6ZFpVaVh1M2c2OGJuZy9NNlFHWitXMGpPcHNXV25mMUhMU1pjVW10VHVHWStYRFc3dWlyWGVwUWtUSm04WmdGOEk5cktoWmZNRU5DS29hU3RWRHoxN25uNFhrVmxJSjZPdUhtcExWTWFTcW9aNmJtTDc0OFZQOTJzaElJQjNTZVFyaEk3bVRGaFFXbVpRbXdDODNqbTZhd0ZESiswWUlvd3dRR1hLNllGajhXTmtpdnlRUkg4dG9Gd1JFS1ZNZDBxWktudTFIUnlNRnNSbWJwdE4zM1ZSeGlmeUlNSFpHalNDcXBEYWttZUJ1czJnU2xKZ3dST1hpMysybXNTUVk4ZmxWbjJ1eXZMSGt1a3R2YWtweHBmZUdxWjRBTEhGdk9QNFlLdlNpU3FsdjlSRjNFWk5KWElaWUtXMlNJVWxHcTQremhrY3RFNkpRZWRCVnJ2dWI4K3ZQZU9WTTRmY0o1MkhwYzhjbEJLSmpQQzhrUzZYcjdVemp4WUVwM29NUHQvL0JCSndkQUlpUWtrTUYyZEh2RG0xVWUyd1E2RFpIYzNRS0JvbTVNL053dVpUc3Y4MHJvVjUxVUc3QlhUcjBSdVlTcjhGS1dlOU5DZmxyM2diREVyR0tWdmRvVVVuZ0I2aUJQVUdEZVhmTm1jZnpyUjdSM1cvQVhiMmUyejV5QnNISHg2MFlYNEk3clVneGlZMCs5WkVxbmpqUjFMek1GSHVHZCtUVmhaaHpDUmxGeEFPVTd3dTMvYUJ6T0ZvWUFxVW1zdzFCWWlVRno2Sks2WG9Uc2FRTVlDeFBrSXV3QUZ1Y3gxTUo4MktsdVF4V0k4cUVOSHAvL094VGxIaGYyS0k3Y2NuY25hWmRCbml2MEFqSXJwaE9DVUorU0VDWFl0WWhTeFhMVmJieDl6OXZYdHRYc0s0RnRoUENuMkJYUTFrdnhZODB6TENrMC91UGpCRFNLY0lrcGRSa1lKcFc0WmdscXpRWUFNUTRtZDduVVhSWm1aZ0JxNFlDMmYwRDBkQi9XS1RKRENYUURPTS9rZWhBYU9HcWNHbVpSYnkxWHZMaTNMUkxwY3p2MmN4cTFIaU1YTE1lTklyZnVZT0JPcG11ZjNYQVJCclFEdnFOUTNWZ21iU3UyTytiTXFlQU5CKy9TNGk4LzJSc0kzUksvOE95VWlKczA3VTU0Zi9tbTNQVlMzZ3lZQzN0ak9JRVMvU2lYNFR0SnIybk1HYU9Qa0JvK2FZbkQvMWIwL09hTlZqcFhjekxKeStockV6djQ2ZTlzbnZkUmFJQnlBV1IrV2QxMVZldmwzWVhkcUdTRjRPb05kYThBVytVdVVWc1dvZ0NuRFd3dk5jK0RUZy80WFFpK0h4WnVoU3NVR2h5L01rdXBsS0hhZHhqS0pSYnpPeEpmYjZiWGtFbnZQVDFSa285TldNbUoweCtqZ01ndlArR042MFVTcVhOUU55R3lUNzc0TmRzMDlQTXdkNkxjZnRJTzdYdFJXOFpzZGhGdmF3WVI1T1BCSHRtbnRXU1YxMHBFZ3FyTTRFM2p5STd2bGREb0JEb1dmZGxObE83U1NQd3FiTWtDdzgwTWpvczduT0xYZDVWRC9ldG5WQ0VyWUV3YkRMQ1dLaVMwSHpFeFE2QVNkODNSSXNlRnJncEcwSzlBZkh0UThmUjBFZ3VleFlldDYvOUZKaFF6c293OWY4bmdTd3c5b0RiOW5ZTW1TMkY2akxEckxCVGdGVWplZXBKMWZDeDBUYkx3MTVHWXlhWkR1WTBUNkpLSWZDMUZVRnJMTGpPakNlciswbndQblFQZUE5R09rQVdBN0F6Q3hGeHRkMnh6N1ZKVDA2d3RESzFRcHF3Q0NIUEI3MGcyYWNGc2c0SkJxTmZzS1BHTE1EUy9HZWk4Z3YyeThCalBLRVBPQ2w1Rm4wRDRpeHhUSkNCR3JTd3lqYTNSblZSSjM2dzZJdHlic0hIQ1VNd0NNPQ==","WFJ5K1g5SjNaUFV4OXdYa2grSHYwQT09","2023-01-03","1");
INSERT INTO rsa VALUES("2","18690684","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VGl2WC9IcDI3cVRmMTR6NXgvQk9TQm9obTNReTI4QkxmaXVDODBUWVZHYk0vZ0tLN0VHOEhQYlBpL0VuaWZGNngyVzNwOTBWTTJYUEhFVlh1Q0p2MWkzS1JmMjhRSG4xb2lLaHFmN01VRTMrdG5Oc3ZMRzVWeHMrakQycXAzWXZGQ2ZLS0piRjJEY3NuNkR4TktDd0VjT2YrZmptRTR1RmgvRGJSUjVSVEhvNGkwc2g4YnQwcWk0bkF4VTBsWlh3R3U2RUlhdDBhWUFUSkFQMWtyTE1GNHloTVVtaEo3eDZlMHIvdG5oeXZBeXJQNHllTEZhZWJlVEhwNFlKUHhoYXc0UndZK2VOYlNIOWpmTlplMjdRem9vWVlUUlloaDRoMElSQ2lpeDFEM215eHJKTXBkbEtBbDNWaGJPdVZJYmxzRk1uSUhzS2xzYjgzVU41RlhsaUoyYkhnWCs5ZGZHUlhWbTg1QVRYSTNNNGxndXpyOUhrU2JGb29YeGVyYTBRSUxxbDNJYzBTU0RwRlVwVGNyZmhWMUViZDMxeTV6eHZBKyt4YXdWUWkrTi8zNEpablRXM2s5RzFwdUN5SDdXdkJRMEZLUHk3Nk9mNlpzRkszanp0bWp0ZE9odmNDVTFuMktnM0FyMkkxT0RTUkVRaDBTVURxaWJrenZBVWlDUFJGTUF0dDJpdyt4TkczSWVPRjZtQkZLOD0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZGducWg4SG9NTCtieTB5WjdGMlI5TFFPWk9aNXY0bzk0NWMrVUppdjVhY1Bvdnh4bWtTdDdBeDJDU3k0RHI1VlRjeTVVOUpYdUVmV2M4dEZieXdXZkpMNEtrbFpLK2dxTkRKZk40M2FmL0wreVRzVUNjK3pFS0M5aVNURkJmS3ZpeFFqRzViUmFGdXN3ekZLcGVmWUtJZlNiQmpFS3prQmpUT3lsam9DOHFaUDh2cjh1dmxzQzMzREtyaStDR3hyWkVKR09aOXYwZUpGellXRm9udGtVdlRhUzdmU2ZwMTFUYjBneCszc2hHWG5nY0VKekF3MEsrVkEzV1JRNDduVFRJOWtmUXYxaWRZL2IzMng1USsyM0tqSktJRXRXUGNkTmhqaTI2L3dHV2FPaEVzYzlpMGJKZUVkRkFydjJSRkVjNXhiMVROUjBNcE56aVp4b3FTd3ZwZDFkaEFyS3lrUnI0ZC9yeU9KMWhUYWp2cjJaZDhhNjc3bkdlY0ZpenRZV3NWOFp6REl1M0pDNHRnbldGNnNOWU9yZEVoTjN4L1ljdjJlZUZSYUx6bUhoQXVOWnozYy9wNmR0UkJNY01yTHRvM2Q1TlhDL3ovN0tZTUVHcTAyYzRGRytlcHN2QWgzSHFKdmFXSjdKS0dBbGI0RURUMjM3TWo5Q0VydzhNN0tjOFBranY4cjRaWkIrdlQ3dEZzbU85L3JIUzVlZUVqZUM4bjY3VnNvYWdHSktZWWVFdEFhblhqN0ZPR0FnK1BuYTQ2TVJxcGZHT1pmL3hLajBoVGJEV2NJeGRjTVJTMlliWXl5cThCMVVMSG1uWWoyY0llbEo2RjI2OXZWcFBVU1pzMWtseVcvcitxN3lWdHA5dkdZMGJSaHhQOVBmVHlPRnBicnVicGVSK1BITTVqOXVjUTZJOXZEZU41RityOHY1bDF1WlgwYm5QTjE1ekdvQlBvcU90aGl3VTVkWEI2cURHRHVLTFpYOHpkME5MUytwd0tEWGRCTldkdEFHWVhqOWJPT2xwVUpQUmlCdmVUVjkvNlVsR0dVYW1EbGxZSGV3U09Ga2RQL2wzdzFxanZUajdtVE81RHU3L3hKQk9WMlhzaEpKUzdQY1lEQTBoYlFQZmdoTmQvZUVCUmZqWmx4Z0loNXFpbTZvZ3lEcCt3Z1BFbnNsbGFtV1pJdXNkQ3ZSNXNQRWx2NlNwRG1aOG9JT0R3ZFRCZmpQNS8xVHVyRm5nT2lPaDVIWnRDdTg1enA5WEVQaTRselk5OEowMUltWkpKQjI0dnBpWjdiOWF3ZHcyNjNTb2g3bFgvOHkzcUgyUWFncW9FWEpRUFYvR0pKWHFMNnZFdmJhbCtFYm81ZDJ4R3ppYU9NZ0ZtVkdMcEo4Q1cyZlhjWVg3dnBzRmRGL2VRL0k4eUdhbXZNVFByL04rSFZEclZBallBaWU0VmpNODE2eFU3ZnlQSytlRXpFZnJGTngyQlU3OGVaU3RobzlZNWFvbS9YWHg0eUwwd3RNcHFZNVhoMXplT0VFcDN6aE9MTDBXOVhiTHRMaVRsbDRkYTBPREo3aVRWYlF6Rmh1OUtWMXZLeUt1bEVEVGRzYUVSNTVlVkpMdmUyVWF4VnRqNFFQKzAwbkdMK2gzQ2tCQnRJS2ZZOXJYQ2Z3Y1ZILzQyWkNka3JrdzhDR1FDNG1BbWNQaXE1ZTVKNDE5cnQrRmd5RXVJalE0NGhoMFRvc2hZNGd2N0MxOFU5VDh0eHJuMVczdHFEV2JEd3diVWRVVm9YZ0VoeGpyZkgzWjNxSER5UldLcWhpRzVibC9WS1hjVkd6NXVuYXZiNmhZWFZ0NGNEcUhJTEprMTlxb2h1a1BUR08xM2ZBQ0plWmVsNEliZlNuRjFTb0s5UEFua282TzlLaE9CUVUycjNZWmNRTHpkdlVNanI1Y1VwUEVSYW4wTEtjRUNPdS9GUGJJM2tlMjhQb2xqMkRxaXAxcDFqSXk0THVGM0JYK3I2WXFoU3pRTXRYbER0MVJNcEl1UjJiWkM4QWxhc1ZacnpNcWJpQUk1a09BTWFpd21LK1pVS0dvbXBXajJjQkxEVkVXNjNIUG5wY0JWR3RBbWFncWVKVURIMStadUlqREZjRjNFSWdZb2lHN2JhamRlNFB6MjAxajcxdFBVQ1NWbzJlN1d6OW5BSU9HbWZYKzBqNm1WMkg0dG51bDhUNXI3OFRiR0U3WjlqbzJ1Ti8vUWIycnhVQWtQZXRVa0YvT2hDTGk0SVoxRVR1VEZFdHNrVm5EOFgwN1ExZG4yaXgxQ0FpOFdQWlN5SFFNTExSQjdhemRJR1NvZXcxdEkwWUplZitUcHowdkRoTVQ0YTkvbmYzaGtKWlpyZEg4R1NDeFM3R1FoSE1uclp1bjl2aHhnYXdwRU5kblFaRDB2TEYwNnZ0NVNuS0xBSUFzd1VEVjdURlZ6dTlHeWpIOVNmVVFwQklhMjQwTXJ2WFVCVzZSVFRXNE9TVUtXVVliZEN6eFV6bi9pQzVpbFFvOUxDREljNU1FOE5nZ0pwVG1HR3J6Qm12QUswbzd3QjQ2aG1IbHpvWDhTNysvSG9YaFhxK0dMUUgwbmZVY3oxUVFYOVB1Kzl6bDkxTDZ5K3pCcW50Wm51WVhMdzlsMnEvcUxOL2FaTGtkSDhsWDdnR1pXUDJuanExZkdsb1lnK2xlVVVaTVQyMkoyNkZGekM5aWlqVVMzNkxOZUJqcWRoQ0RxVnNnQVFSdjdCK0pvSXFzZTQyNEd4YzJlMVlaekZTYXR2Z2NxS1pmS09jaVFpQmRqR3RQd3lzV3FsTkxjb3AzMEo0VFFzZXgzV2lwajNscWErQWJxR3hudW04QnE3QUd0eHBWZkhMbXkrYmJ6dWN4bGJBelVGNjBrZlZhWnJJQmZoVGNQSHFPNGFmbU9GcUo1VkxHRWU5SUhkYTFXNG42RFBaTG84PQ==","TlRpYks5WXppbFRlTys1cnZ2K3RqQT09","2023-01-03","1");
INSERT INTO rsa VALUES("3","07132428","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VHFNQU9GSEw0K2NPQWJuTSt0MlBVUC96Wkc4a0ZmMmtTTGpNWi8rdDBvS0RNZFdtMzFmdXRCNVVteWd2YnR4YjRDcHJCcWxKWjk0VDZ4V3RjcDY3YU5RMm5FNTZ6bnV6cURzVUhhNkxzd3ZYc1BLV29peUd0QzlsNkQyUkUweWRQTVJxTlRPaWdBZEM4WG9PcngxaUF2ZFFBUW40TWdTMzBUVmEvWWRyWGovZGN5MllkelZxcG91bW9vcU8vT01QWjUrL1Q4T000eFNKNmtONlFvOExGajRCOHZyT1kyZVkzVXlCQUp1TzV6Qk9WWmFrclZTWUg2dGlaREJTN1pEL0J2YjJURG41cVRzWENVT3E3ck0wdWYzdlZLaThkOG15Z051eVh2THZCa2hWSFoyL290ODhxRG1uZWxxZnZTSlBIbEROMkVCb1VmZTlkR1Bqb005emJNNVJtUFdYMmxOclBIc2VEenJPNkJNM1hHdy8vVjNnUHBlTnhRNGtkQU03cFVFTVcwY2l1dUFkZkZKaXBqMjdjU2ZqaW0xNjVuMWE5TVdVUlBkdlJmZDFEbGRLZ1UyclZhQzZrcUxVZlVna1JsNlVPQXBIc0Y3L2ppOFRMRVZlUEJSditTZ0JYdXIxbG1RdG9zTlBwcUpNY2t3WG5ib3JRbGo1R2xCdnpZdndITGJsUXYxV1oyRVkxcDhWMWZnQjllTT0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZmVqb0N5YmVxMEFuY1FheFlMS3hqT2dLMmhXbXFHYU11bkNBZmtETVVVbFBzRW1rNk5QVzZwT1VpZld2V2Q0emJWWng0RHorVkpYZGRDdnFUQlA3V3pZUy9BQnlMcE1PVG9nQStkOFUyOU9xUzl0U1U4SXJJNHV3eXg1ZTdnbzlWL0lLVWkwSkZ2ZUVYMDA5VUNPQmN2aTF2NWdiZWFMaFJZUFB0NVowc0ZrMlpGaUJBeFRpUms0Z3RXdVFuY3Y5YVpZblY4Y096OVhzWjR6VUpFUEJSVGFNcnF2MlpOSWNCbWFobXdBQTVGZlpTeklWNndpalEwMFVLN29HVkxGOXh3c3Z4dTNlNG9CUXBuSUFNbmYxekM3ZkFOdlRqYlBwYnc3eFZKdmxxS2lybW16bWppeFQzT1FKNUpKa2N3OUw4UmdQblpZOWFqWFdjdVpDVGRtUEFEbzR2VW5FT2hoVzBPUG5VZk9EVDFtcnFPVzdNRHVZeUhLTkdscEJRcjJ4cHB0dmVKKzMrdGwzdE5iOTBiYkMvdGJnMG9RMmtQaVhiTWkxT1BYd2RpNmxqMkxNbXc4cUVNT1dmWWRLT2M2VkxucDVsZEhsdmhhZ3AyM1pGc0d1MW91eko0VUtvRkY0STdiako1TnBCK0U0OHhLcHMybTRseTRnTmlKR2tDSGcveEZuRUFqQWVMS29WTnpUajlLWFVVcDRvOWxnRW8zYXVVNHhqb2lScWRvc1UwSFpGVFNzZ2xJNEhSM1ZjMlNIaExRbFZSeFlrejQ3WTdtTWhmTjZtK1RodjE3NHhGWDczN3pvWXJhKytYK2Y4dklvSk93cVdiQm9lV3dUWDdhbUhCRHgrME1JWUQvTFFpR0JVamZFL0U4bXBZOGhmK2xDTTd6SnFCczZDTGtZQVY3bFFlcWpHRUFWM094Qm1kcDJPS1VraGpHYzNXMlAyb05ybjRyZzFtbm1UdTh2UTNHTUJvU3EzYnNMaEJJNkdWQk5sQXQ0b1ZQbDNhWmFxMVhpaWRvU0NsZWlOeXVBU1BEV1VaRFFFT2RHL2dEVDRleFhDYWxWWnk5ellWSWFoT0wvOGdZSFpkNVF4b21iT04xUXJIN3lKTHlpVXJqUkdMQTgrZkZFQkJ5L0RSSGNFMTJ1ditrMjUyMXhQbnIwdmt4WGFENldmd3lJNnhTck9nMG0vSGZpVHdYRGVySjV5eTZCL242VHJEblhBbnJFY0szSGhveHNVdWhSbEo3Q3lybnBySUh4TjQyZ0FaUVUzYUcyVDFyditiby8vZXJEZlRTcGQwM2VlSEF0UTB0ZmxwRUp4Y3gwT2tQY0RwdHN4THI0MERueVZPYUhKbXE4SS9ZOHZkbmpsRjlvcGk1R0JoN2g5Q1pMVWZvT3VvQ2N6QzlhU0x0dXduMjk1M3hJUGsycFdPQUhsNzNOb3pFM081ZS9PWUx2Ykw1OGpyM0FEak1Vc205T0t1T2JpaTBWdkw0b2Y3TVBmYU9GWTdaZVJXQmJrd0cyM0RpbDVNNU4wZ05qSlNhOGxWemdLVnluU2ptK0VNNG1kOVF3QXZHVjU5bW43SWUxR0ZmQ0VmRjJ2dWlqVkUyd0o5SjQxbVYxYTIxTFJ2QzlDQlNUdXArTWlzaDE2TUNXSzBiVUprMVIxT3pvK2kvOXZzL1hpazRNZ2NMNWdPV2tyZ2lXOE5jd2lKWnZ2WS9BZ01XWWNYTXZmZEhCUVRXaE92UktTNVd2ZnNHemF0VGxWOTZieHZ2U0ZSdjV0bnNOb3NGMmNFWUduS2xTNGg0b1R3ZXNFY08zdHg1R25pbmhtTEpzb0JDdmp2SXA2dmZlYmthaENYQUIzMTRwSWFYR25vZFRnMlVYV3VhTlVCdm9pWGFRREF2WC9EN0RqVGJZUHpublI4RXJMTlRza1UzdnR3cU5tTmM2NEgxZGlaYXZ0djZnL3JOTGRIK3Z1clVRUVVHRk9uVWVrNXlNbXliNkFRUi9TdkJrbzlTOG03QUlCVFhGN0FERE40dkZralF1QU55eUVMd0E3V2haSllPZ1JSMldYcFh0b3JhcURPRFFaQWdmRG5IcW5VUHMxZVI4NmNsNExKdVpwODducEExalFLbHNZTjYyMllxNlBqOFNSdTI2MTQybCtKSFBVM1dXYWNzenc1OHJOTVdSUE5PWDFLQjBya3RBWWx5ZXVZc1RVZTZxYXY0eStsN3dtK1hoNUNmbVJXQ3NraEZyeWRFQ3lKNFY0NzdwM1RHeEFTa1ZFKzF2VFdmZW8wTXR5eUViSzVsS21oa043OXJXSVp0ZE1BT1dnQ1JlS0cxcW5sckdBeTVjeFo3K3RZWU92QzlzSmtmNU5RSWxSVFR5SGxrWFlHdGdRWGRNZ2JyY21jU3J5QUN4UFJiZUNzK1U2c3Jxa1Fia1BFWUdtM2J4WWlaNFltdUEvalBwZCtJMGxDVG5ONlpLMkJjL2V6MVpWZndiSjhCcDdXdjVFTUxpRFVBcnpCY2xKVG5pbXp3YkZ0L2RlNkJncWF6RDdXRkhpcXU4UmRua0dLSHhVT1dkWnVoRnJKNG15SjVzbmRxQmdDRlRhWHNDdjFXYXNOSk4xcVJ4MmxGRDVPRTdJQ3RzcFdRcSt4ejlYUDYzVHpLd2VEQ2VrMlpiejhjYnJxOHdYdXlaMmZyTklMRCs2Zk5UdVU1Z0hZSitMRWl1bVBxQk9BcHgwRTA1MEJZV2dyNzFReGFGU0g4Uzl2ZUdsUVMzLzY2ODJzL2xGcUdRa2hGbWw1YnB6Vk9rdXJKRnE0SnRRd1BobXhkOGUrYmpuOUtjd3haWVpJb3hjUjZiN0lGOC8yREVYV2xoRXlxcnV2VENmNmdNbXVJRjA4Nkdwa21uSnlnZkF3ZFFPRHBacWhnaHI1aXFLQ2xmZGUrRHJKUXJoWUFNcjNWYnpxKzFhZHJmSHJYY0M2RXhhM1p5NzVBWDdOSzJqMFozNjJydTVPN2M0PQ==","cllmOFBqeXZZcEVRMjd0ZmJxMFVIZz09","2023-01-03","1");
INSERT INTO rsa VALUES("4","07359667","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VHVPNmNyRS9seDlsYU1ENE82R21pc0FtSXYvWFlMSlhHRldOeXBmZ0d2bFVKaTJlaEdkU21EcEhNTGJ6ajVGbGRoemVWVEpxRWhSK2xTWUp4V1BiSk9aTGNsaXp1OGFFVGJKaXhmZzZrMnMrVkE2RjRGQ1UyRmZQOTVLYjgxVDR1YWlWcGpOd01HNUpmeTBEbXNPTGNOamdmZVRmeVZ3ZkhnNm1iaVV2SXc4Y0lrRnUxcklTQVpTU0NpVFI2M2RBUFpxbTdPdlY3dWVCbTdIR0xZM3NEMFIvSHc1TXpkU0lnQVdpZXZDZzMxZXEyeUN1RjNQWWRyYm9sa0FPZ0RLU0d5cnVNb2tsOFl1TDRwZlB4dXJ1c1VTT0YyUnQ0bGNQS2d4dlJoSENsaTBveEV4UVlaUHE1MHZFODFxYisrNTlldmQrY0F3NkFxOHY1NDRIU3FPVGpFeU91YmFiY3M0bzhBc1V3cGNhQmdFcnU1SitkaWFSZTQyUHl3RzNOaWRoVkhuVm5ZZW81WDBteDJUNnZiaXZ1ZU9pSittQzhRWnBZRGprVm9Cb212TEM3d0FrWVFpUDhnblFnRVc1Y3dZMUJtU090N2hvQ3FqWFRodG5kbzhRUkF4M2cwaWFIOHlpSVZFS0VCNjIrdnhwUEQ5c0krWEcvY0NYSFFnalg2RmNTVkQvK2xjcEhOdXo4TE5kMGtkamo5ND0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZDBVQkpoWi9hcU10WWxWODJuK25GTWVYOTlvOTdmNXBUb0xPUzFiV0lrdTR2WHdsb3Z2WHNVMFVxK2loeU5aY3ZlcmJ6OVVvemxHYkRkUFBMV0Y3emcyY3J2QU9xYlhZMVpvSS8wRmFwWU5JSWFRL1VFNFQ4eDN6cVZYQ2NXa01qTjByaWZraEZYU2lZMU9YZW93ekxSVElRbFFleS92emhZWlVwbDNNVlhkUHZWMDRGd0hCWTlycVkxcklGaGwxbWgvRWtWazZVY29zdUdqcWlxVEFPMnhqOEMwREZyYmpkMTB5N3BIWnk3TGsyN2hSTXpWZlBXaHAybzFDdkVHNGlkWTZLZ2xIUG9ZZDkva1BiYnd3MjN3UDRNRldUbWxYYm05VlF6NllkOEtTUURGOXEvWUpsSjhVelh3WlFJclN1cGw1bVZVc21MWHVwV2ZCd0RoR1FGRkJJbEVjOHk1OFIySU0vK29xSUROUkdwQjMzWlM5RGhoNkxhSFc1NFMvY08rRlFkKzVpTzBKc0xKRGZNNnZIQzRQMDBCa3dBYjVPbXJYU2R3UDQ2WnY4U2x0QWMwbTM2K0Z1RlpkeE4vSnFxUklwS0NSS29tRlFVeWErWWsvQ1hOZjZrMnBuSmRHNk1xZkpKeVlHbzJZWWJrWEFXdm9TWitKd1oxYzNRRWsvK0poaXBqSVhQNXVORmpXZnhIQ3BWNFp0emxxY0pRMTUybUF1a1JrRmFhQnBTaTkza09Ba05nY0twbCtrSGRPWkc1RkxlbG1LL0lwcFQ5Rk1ONUN4eU8zSzFSaXViVC9aMUFjajRUT2xsenlCS0RXSjBkRVFOVHp1bTdnenBuNlJ3dndESE1kL3dJcTdJMm5ZN2oxOTlSVnpDU0JQVVFKcDBFT00yQ0ZjQ2dZN1NBUFZtTVVIVXo5Skc5UytvRG5xbVBTZjdqT0tnTUFMVHMyWU5aTWZaRUxKQnd5a0krd2U4Tjl2SHRCbElJM2FNNlIrem9jeStYc2RmVDRrMEE2SlBETnovKzhKQTJJZHBjdjZGZGZzQ3FXbUhNdGdiYzNETkk4Vi96d3lsYklNUUxkNU13MGpLN1JCb1BIUXg0aEdaNU9MZmtucjlndXlOZ3didjkvVjNTT24xdWhFUkxmdng1Q0pra1pjTkRXaVBIaHZYdS8veHVReXZwT00zTUdmZWhYRHBtc2FFVUhTSWxpTEJBWEFkZmtPRU9pUHEwTWY1U3l3S1JwaGRxSFQxd01sc0lrSG5BL1FhY2w5VWpSVFBjeEZQM2NtMjZUdi9jaUZEZUZNMzY1aGxjM0NUSjBxK1ZZelVvT3Jjd1Y3Sk9pRThkdHAwbSt6ejRTd25RWllJbDFvNmZKV0N5TEFUc0YxSXM4ZGJVSytKQXl5cTYrbmhpK3l5WWJ4a1l2WE54R2ZjeDR5UU80TEZFSHQrdGMvc3BhZU9hdWdUZDR5d1JKR0NyR2lWODE4VG5iZUdOdzRvRTNWZ3NIcjBUeDhLTk5laFdmTGxXWkxsSjBrNHZGV1hGRVBnK3FXalU1NU02dThFNDVWWk5MMC9ZWnhVTUNyR0hXSFNWM29COEp4THBCdVJ2YzVFVTgrU2pZczIzK2dxWmRFc2l1YnZ2RjJ4aGl2U0tiVDN4Vnl5cVJVV3FzQkVrVDFpZjhJUk40R3JCZUtsckhMQzZ2QjJvN0pGOEdWK1k1OUllQjFQekN6Nm9Bakh1d0NRaW5OK25jM3VOSm5sdzUycHA1U2ZpYU1mWGZwNloza05WY0YvV04vSm93eHZZVG52TDB0TGVDZWZxbHpJQytTMWp4TklkRGgzaUc1djlPYkxpa0hMRjNXbFY5anMveHFaelJ3MEw2a1BBNjBNMEo0bVdsZWZvYkYrZ0J4SlhvQ1NDcXl2aEI4Q1NtVEVLeGcvSnBpNEJMR2RNVGF2R2p2SStybUlWNm1tVnRNNGhJLzVsSGFuenZid2dXVWI1Rm5wVGt5eHRXR3RGSWZib3NwWG5TUEZLYnMyRFMyZGlKUVFEbmt4QTNxa1JHdm9OZVFqWTRVNEErV0VSbW5PNDZOdnU1WUJnMHptanFxeVRWMWY2NGdTMHVmdXlyd250TXFRTC8xYlU2MzZNRFlYOXZzMzRQakpvM2xmWTZHdXh0TThENDhyN1pTb3o3Q3JEL2JXN3RQdk1NSFlkWk1rWEdkZWVneHZhdGpIZDN2SktDYmZpTy9FaTFqY1poM3M5QWtEUDVOUEJONWtLUTZLTSswM1dWWFRNZW83dzdubStBYkhCNE5aMmRKTVlLSFpBWmJQSkgwSDFrUUswMjIwaXd4ZkF1UHR0d0U0TkVWSDhLVlE5YitleklJNkZQZnBTbGJQNE5kVi9Sd1Z6NWFXVUIzZ1UwbUp1TytpYjBVckdSaFl0SThtWGNIYnhiTmxISDFCK0RzY1V5eHgvWTRiK05tYnFsL0h0cG5xajRtUlRNSWFGa0tqL1A1NzIvcEVTR0RYMEgvWHF5R1hsMXFRdFg4eGkvL3E2bHpJemN6b0cwcW04bjNNcHUyaXl1RlorTGNsSlRLRVBzejZnYWY2YWZVWjJJYThmcGR5LzF0alhUTk5SdWtmK2VZcmY1L25BQzR0K05zL0Jydno2clVMTTluekN0eFR2cUJqOUpyTDJFN0hxVVVEb0JzT3ZkWlBpMTNaRUZDa0g4V1NmdVo4QlN2WG1pRExxK1FKVWw5U1F6cVRiOXBwQURxRE1oVUJiSW41NTloRjZBUlVERnN5YjBBQ1dmTGk4QVVIbng1Vk5EZ0FRa1c4Nm9WeStuZkJkSW1QT1k5cUlvTmhHVmQ0dGFPYlFTWXNTM2JpQ3ViczRMQ3YwZms0c21Rcjl2MVJCNzUxT0MvcWtLRGFlL1M2MzUwaitiMis3K0czYUNRellMVFJPYWVsS1VKNGRNV045ZWIwdVBQS0M4PQ==","OFFSa1NURE5OYkZBblBCRXZRYkhiZz09","2023-01-03","1");
INSERT INTO rsa VALUES("5","01566370","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VG4rNHMxK2VjWFJ4cjh1c3hmVU1ZQktTUEh5ZU10ZFVjaTBXU0tkTXpvMFZ4WmNOVHJGVFdDelIyQnlrSEhvV3RpMExRZkdPL3k4MVFJWEo4OHFVa1RicmNmL1JXajA1aGQ1VlhTV3p5UGF0UW1lS1d4ZStmMmVQeXhFUURBcWRHME4vUkVoSXFLYVZJVXZtb1F4dHBUS0plc3RxcEVxdFpJQjJXVFNhTVA3bnpWdHJFdk9zYU51eCtRdllocnQ4d3FKR1I1VlFnMDc1Q3hvYW8ybThhdW5FdGM0ckJjaFI1YWxPdVdHY0VHbWszc0RpUGJReWdkU3NlTnZ6Y3ZYY3dvS0ZHRGFVU0hERGF0M0ZzM2VITHlTSFQydWx6YUtEUVNxQ1hoaVErb1NacXN1WnVUUjN0YnlEajBndjVpRDBhb0NvNnliSkwwSE44QUJRdU8yQis5RVBvMUJjaUZ3T1EzUDZVeUFiNzhBSEVoV2JaMGhvVkt1RCtCeEJMRUVaaVhMRm5UdjFKTzBBWTNYcnczazJJcjcxeE5LZ3R2cVlhYzNBc0J4UmxPRTNDUm1RU0NEcnhYclpPbG5TQVIvODJMRk1mbk5xR1Y2UFlvUVFrWENOZGlaY0E2YlFmTWpka2tybER5UFYwTEFYaHlwUWNJS2tkdVVKdmZFbWxwUnhUMjVXS3JmR0hHQ2lrYVlONGI0N2ljOD0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZlp2SlE3RmRVNFBOc1g5bmVkc0l0MFZ5Q2xrMU11VGRCLys2eDlRd3M3OTV2MXRRVDZiWmZBdzFxYTJiRVNvOExtanFCRmlRNFdkWm44aGxxd0F4RjFiMkNGNFlhZm9WNkhLUjErTXMybDRnUkUzQVdiRXpvVVJjUUFBTGZlSkR6MnZDekZUTE9qUnV4N1QwZEtkNUl0TXJteHVFVi9hT0d5NitFRmVBWno1bFlPc2NzVjFDdFFJRUEvbVZJa3dtN0dtQWFwK2JFRWs3NGlUczg2VWhuTlpZRUVrbHBHYk9lbnJCUWFicHZRRkViMnozNkFjME9ycnlJM3hOSkNsSGVya0laTkFMS05nM3c3RVdXQVB0dHk3WnQ3dmhDTElaL09hdy9RTUtmcU4rem90SVYyMVo4Mlpwdms2R3dNcUdDSlE4bzVUekcwU2lwZUVsWHFKWGJmenBybWZVR0FkSzA0R3d0NXQ3UWVIYllRWFlmMlpYcWkzb2lVYkRLQWx1RWh2bTVESUlRM3NMZGgxaXFJTzg2V2t4YkRKMXZIa2lKRlBPdnFtaGloUG5qcmRIMFdjU0VKVGoyR0dYYjVRR0JXeGJOa1J4WG5FazZKRFRFaWRYMGZIb3hOWk5Ca0xqcU1ITUwweWYydGppeGg3TjlwY0FqaEFaWlpncEczNG1IeXFLNDFXQzlDN1RWNUxOTGRteXROR2V2THJPTnlUUE9jZWdFOUVtTC9GdFlQNm14ck16WHl2eFIyZGNjdEdEOUoxRVFoeFljNTArM0RGZ3p1Mzk5T3pROThwZ3hSOHh5cE9LMFkzeWQ2Q2xXTG9KNXVCaGc4RjdrQVg1aVdFSEFudXp6T3MySkkwR0tGcWRsZWJhb0pCenhHcmk2SFFWVU1MRU5YRkpraGdraDJXUGJNVDJ3Y3I4WFZXd3NNZGNhVnJYWEtoNkVzQ0NQdkRESW94TS85UjFoOEUwMGM4M0dWM05Ta2FCNjhpbURMemllWVRlVk9JT2Rka3g4a2dDRFdLR2ZtaHhZT0VUQkdIeDRmNUFwVXBFaFNGQVRvbEhzNDUrTkJYQTR3Yy9KSVRGdVB6amhtWDlGOG5aUldoUWx0d0NEMHFKbW9FbjZ3azM4ZXNJZFJGN29Eamp2U3QzOG9sYkZWR0Y3ZFFnRm5Dcys4OXBOVFdKSFFuRXJUbGZxTkVxRnJ1OTBLU2RNUm5jUDRXNFgxd3FvWHlMbkNWUTRxbFpwZ0F1R3d6c2F6OGFEYUVUTWVTSkhkei85YTlUWDdiS0VLUHQwbmN0dWdYbDBrbzJ3VmJwYzQ2bmY2YnJzYXExSmdkZ3lQL3JKT0c2eW9mcEhkTFVFS3RwTGsrcnZya01rRkdaTGljRzFjeXE1VE9RSWh5b3VmN1BOUU9SUkZwek1MaWIyb1hyb2lzMk90TzF2SVc5U2NHazNwdFNJVmtVa044NlltSHNRK2wwWmVUbGJmdThZTDRtNlFyVDFFajYwamkyZzhVMnBHRUFWWHNOY3BBVmd1MXpZNVlmMU9TK0N4Y3BpTlFRQ1l4aHNYdXQ4UzVQZHhVSjl5NVJoTXp0WkpGSWVmQ2x5dE1FWG13bG9rbHNWUHJyaFlBNytJVnd2N2FNUEJaSE1OSUNxV2xha1BDZndtNVdBZ3MrQ0UyL0hvRzZaNVdyWDlva0xlM1ZwakkwOFF2d1lNSysyVkx1Q0hFR0RNV2tUMVIrZjJlNlJaMHdYMTdZS2VYSmY2QnpwVmIrQ3JPOHVYOE9uckg1ODl0S29JODRuYUhSMWt6MWU2ZnJINUlPZ2xYaU9GUlBRRWxnNDZqdEhkekdtcTNYczJCZlpZczN1QzlVL0h2cGRUMzcwOE16RUg5dDVLQy83UjUyOVVZRlZiRGhLK3R2eUJqQ2Iwd3pIbWI0R2VOZXBnbjBLNVhnUlZ6a0NzeERpRFdJcWVHYkhzTkZMcVR2bUI5K2xBNUQ2Tkw4V3VqN1JsZmx1VW14VWx4SitvQktqYzhGeUtKbTJVcFBuODdQblIybXVXbXQ3UUFPYUZQTHRJb2NOdXBjK3pDdFQ5VnRyc2pELzVodE92MGlKWkkvdndnQ2hWUGRPdUlockhNQWh3bFQ1SVZ6TXU4cHFrRWZCMjdrMlNpT2V5c2NBY0RPSEJYL2h0YUF4R3hPSXRROG9CS0hoTVNoY1RIWWhUejVTOGpnT0ROblJxRTZkMVJKY2lmdzhabVRlZTBaZWtEVWRQMEFaZVQ2elRBWExZZVZSeHV6R2NoY21NR2xaTGs0Z0lkcTlyMFRTYlpjRlhBUDMxUGN1S3o0UFdqUXJZNDZ1WmJTNm9wamNYbU9aYjhkc2lEY0xxVThLUUhSN2FGWlVxTDJLVXNGbllsUW1hZXVIendjZUNzNWpGRUtsZjN1Z1NkUitqWW81Z1ZkTWJ4K2djSjMycGlLbzZLcjMwY3crTkZZSmhnTnZDZzVCaEZLQzd4bUswMWpYZFNRRjMwcGtYLy81cHozQVpQd0F1NHdaaW9WUXRUZFVUSjNGTzJZbVk4WkI2MFp5RGdSeFZBblMrZzlqYlNxZnFyeGFXS1hnU2ZrNCtzWC96OGZRekJLVmV4ek5va0pOUElHSDladGhnVVh3VUo2YUcwaUFPZGlhK2ViZmZpblhnTUk2NXd4TEVuSEN4emRENUp2Qm1TRjk0OEpBaVhlNXZPUU81TytSM2VWT05Cc1hPcmVLT09MMmYyam9CT1NPNFcxZ0wveVU2WjZrRFdzR3Ewa2VaU2dGUnA2c2d2eTJsbGhhRXFTbWE0VW9rcnh1NUh2a0FvcFdvaGY2ZnFxNUxzVUZSRkRMZmc0Wm9Ld1Jub0dJR0tpTCswbW9mSEJQcytyTU9Pa09aaTZOOFFMODlFUXBlUTl3ZGJrUE1MdjlJNGJ3Z1BEKzY0R1RLcmZNY1NSMDFZdk10M1dvTEZCZ0dXQkYzYitUMkJERElFYnZZSkZjPQ==","dkROS3B3NWtVWTN4T3pZcTRXcVllZz09","2023-01-03","1");
INSERT INTO rsa VALUES("6","12346649","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VHBzNHZrV3B4OWhkS3F0UFhodVVnT1lla3FmNldOOEpBU0dqaTRRK05kZnlwWWNVWkN5ZFpNNmdWM3g2S1lNeHI0WUJlYS9qWFdQL2hXU2dqTFo5Y21SNEVzdWVDY0N4U3dhaTBCU0puMGNTdi94ZlNZR3BIQk9RZHVkQW44RmNCV09KRFNjT3VxQ0FZVTJiU2drZEZOM3A4V0hkc0lRbDJSVlJ1SDRjb2FvRm9CdFBTdGE0VnMrOXFxWnpzT1M0eFI5VFg0SnRwQ1FxcndTUC9QZU5YTk5wTXdhYkRmTzNJbmZzRzhUUVJJcjFNR3VJcXhxT0ZNS3RDb2c3b1p5Vm8reWpEU0dYM3ZRbUJZRzJwY2NxaHptQyt2WU1NQlh3MDFEcy9hWllFV1NOeXJLZkYwaWVBem81dnE2SWYzK1IreDdMek1EMmtvTlJvSjRkV0VsckFsMzI1KzN0ZzJRSDJkOW55WHFWK1hBaVZSMXBhb0d5UE85dytVUWVqR1ZDU0dkSGVTcXd5a2FzbkY1U2FDQlltVlFlajZUN09KaWNSWUFZMzJoQVMraXZtUzVyRWVHRUtBeTR2RW1UZXU2dURmZFNhbm9iejdsUHJUdktvSTU5K3U1aFFDdFZWK1FkR2pBMlhwZnFNWUlRaFFiYzgvNXBCdEtFMFVsUStjRnR2aTFCTFJIL1FZQ2orU2VzaDlMNitpMD0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZmVqb0N5YmVxMEFuY1FheFlMS3hqT3F5UDZhZkVOay9qNTZUeEdTU0dXZlpMNG5ZUi8xSlBXZG91ZGtpR2REWUxVc2FVdCtiekQ4MXF5MXd4c0RQdXRCckNITDByY1kvTnhaOXZlRXlJVk40QjJiL21Vd3dEK3gzNlVubGtQa0J0M21TZTJ0Y0xLMTZXQUR0OWcyWjBFR082OEJXTmM0eVYxQUNLVS8xeWZiUFlNeTZ4MFJGZFdsWXJkdnlLWWhPTDFZWGU3OHFUN1AwVUJySktXbzVNVEFRK3NmbUIzeFU2dVQrOVJPWmFnNUwvbjF1K0lqRDFtT0tXRVAzNDcrVkFRQXE3T3N0T2o3c2R6eDVEWWdFczdJMVRNaTg3cFNLcnNlbDFGTEJiQ3ZMTk94NnNwNzZWMjdkRHFSa3FLT0N3dUxqd3RMZlBSV2k0cUNlUlJIY0FvM2NTTXpiV1d5dzZxUjVZZGZ1QTNTTDBVTjVSdXA0WjVJVE5oWWVObC9FbXNOdEVuZlNkWTE1aWVhY2FrS1BUbWpkYnpQR3o0dkord1BMTkZNM0I3V0haMUVYYzJLaDgwaUxuS05ZUWhvcUNLMDhRQzQrN2Nsb0VDcmZTYytZd2RDNmh0R3dBeWNic3pUVDdzOWZEQUN1UGFBME83dWRQL1F6YzF6aUJPRHJkdHV3alh3ZWtNZ3lkTzdrUkZwOUY5aTRxSkYrN0YxbTN4bEN5NFlqR2xrVGNPZnRCdjZ5ZDBoRGMvUTZBYVMyWWJOVHA0S3g1OEg2M3VDOWo5VUljSHZFL29VZ2crS095UFJvakszUHpMSFBJcWNmTUc5RTFqZUJlWnN1RjBaWmh5QUlWa0lTWTBFSWNQZGNKdHJGaHMrdHR3K2I4VThHNXJiNTRyNmdINEhQc1YzRzJuV1NCRUlyS3kxU1FONHJXa2ZaQTA1RGhocVNlM2pRYXZ3VUNQdEFMdFplbVNSVGpuM29KU1U0czVnK1MzRERHdVRWcE43dmU3UlBwMDl2VURWekRUYXFqalhFNlNWYkluc3JKdWdlYWNjV3krRmxFSkJsNzRXZUpkM0R6NnlEMUpHTVhxTEFQOE4rQWI4R2M4R2xKWGkvcm9lQ2ZwY3gzM251K1llVktTa2IvcjZZSVlKWkt6dUE4by9Jb1VzeTRrRlJPY3dDeXdZMmI2ODNpNDN1Ym1MckpRc0F1eFlGUDhVWWVHVnUvMnVCOHp5WHQxdklCK25JTmczVE8yUktIUnFKOGZMTnBFeUw5Q2N2TElvRHdYMnVmSUh2RVUzcGR5QUczOFlYTW9SblBuS0hYN05WWnRUVW9SQUdqU1owUlMySVpGL0I1VTY1LzJLanVzYzYxKzV4Z29kN3ZqQVV3NDBGeU0yR0k5cll2SWVOWkpWaDMrU0VwWVZCaXVjQ3dzbVdtcVdBU0dFaTNwNTVjUXVGQVFUQkVzU2FZUHRpb0xFWmdoUDFqWk1Tc3RTL3NVenpOT0s3REJmejcwcCs5Qys4UXN5U3N2TVBoWjUycmw2QlJMU0tEL0RISE5iYWRYZUFPaEdMZUtXK01PUjlvdWZycTBMSHovYzFDRkpqMnpKbEtnVmNNeVFabjZoYUxFd3FPdnpTcGY1QmRKTlFaVFY2a2VaTmhiVzlGNnh4WGpmOEJhc3IwdVlFdnora29OeUxuUit0TUdsV3d4TDRRakJVaWFlWmUxSjJXd0NwZWVyODVXekdSRDNiVWNCLytkZmZNUlhzNnVrYUlibmZBVVIydlF2Y2gxeXpYcjdDVGx3RDFZM1F6TnQ4ZG9LNVhUL1hEbVBMSVZ2emZTam9ESlByZy9jR0pBWXM4QXJkTklrZVlMQ1VCTkk3LzM2Sjh3MEx3R0JTdnJHclp4VUw3RzN2NUFlU0Zuc2ZnRUFuOUxpV3ZvOEdxUHdER0ZKcE5QcUNUejFRS3hCNys4ZThPL3RGZ1ZnZm1VL1pJVEhTTEwvL1JCZ2tLdzByTVlQWHl3dCtoMGxvaytaVmZqYzBvUFNEYlhPOFhhQ1N0NlZ5eVVZbzZpNENHWUJsZW9DQnNPNXR5eDdZM3dGK3lhZW9scHJNcVpUQjdwWVI5Y1dLWWtuSWo1cEplUlFRSmVJK1hHbFQ4azVpbXd2RHlRZGJFRS8xRTBMSzhxYmNzVFBsZ0JEWkppLy9RMFN4WStreU1ZYTlNRStEV1kzdmJLd1R0ckNjWUZ4SUdJK1ZxcWsxK285UjlucjBQZEZadUFNczBOWXhxNGN0MjRPRjVsTHRXMU1MWWhCSEpzVE5BYU1pRlJ2Q0diOEdNS3ExaENISGFQaDJPS2RUTTlIWGQ1ekszTjdwTXBhbnVCZCtuaVNJZCszWUJvY2Z0Y3o4MCt3dVRqTEljZU5qVFF2NGhvb1dmWFZjaXpkbmV4SmJ4TlM1NVU5KzZiaE85c242TmxreEpGbnBKcTY4V2JPV2RWNktYT3UzampBZDRWdUIyV3IyTnFYaVhDNGltTTJzUmp1cEdhalEzYmxNdCszWTFOR2RXZmRZdDRHY2RvTkgzYU5OZVMrc0E3cjNyQTl2OXRjL0pmL2V2aDNjWkxVTXZCeTl6L2pBR2kyZm4yY2RLeFJ0aDEvYXdxMW5BWUNwcEF3OU5aRkxNMU1lNW5kcXVsVG84VUZtS3NiTFRvY1ZTTUY3Uk12YXBTOGl3SGJyelBjZW1RcW5FS2dZSUFBdnFDT1g2UlF5NzM0R2tqRGtkYkpRWnJoTzJpN3ZjVGtzdGZ5RHBZL0Fjb3U5eXZubU4vdVhDQWNpV1NxdXhNOTI3bzJmZC9Td3IrUTdDcVdUQzJwMkFqdUFadzBSMG9sVUtKWVcrTDVyTWpEb3hMQThscDdWTWpzM1pINTd4bWQzdityd1dzWlR5cU92VElaYy8zK0pScFFXNW8wOFVUbjZNZ2o3TjFrb2tmc1Z1RDl4N2wzRElaVzRLblpoNUtZUmJBVjRnPQ==","NDJjRlFRUkJweUZZMTJLeWRmcDFEdz09","2023-01-13","1");





CREATE TABLE `bitacora` (
  `id_bitacora` int(20) NOT NULL AUTO_INCREMENT,
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modulo_bitacora` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accion_bitacora` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_bitacora` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_bitacora` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(10) NOT NULL,
  PRIMARY KEY (`id_bitacora`),
  KEY `cedula_usuario` (`cedula_usuario`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO bitacora VALUES("1","15432288","Inicio De Sesión","Consultar","2023-01-03","12:29 am","1");
INSERT INTO bitacora VALUES("2","15432288","Preguntas","Consultar","2023-01-03","12:29 am","1");
INSERT INTO bitacora VALUES("3","15432288","Preguntas","Agregar","2023-01-03","12:30 am","1");
INSERT INTO bitacora VALUES("4","15432288","Inicio","Consultar","2023-01-03","12:30 am","1");
INSERT INTO bitacora VALUES("5","15432288","Usuarios","Consultar","2023-01-03","12:30 am","1");
INSERT INTO bitacora VALUES("6","15432288","Alumnos","Consultar","2023-01-03","12:30 am","1");
INSERT INTO bitacora VALUES("7","15432288","Profesores","Consultar","2023-01-03","12:31 am","1");
INSERT INTO bitacora VALUES("8","15432288","Periodos","Consultar","2023-01-03","12:31 am","1");
INSERT INTO bitacora VALUES("9","15432288","Alumnos","Consultar","2023-01-03","12:31 am","1");
INSERT INTO bitacora VALUES("10","15432288","Profesores","Consultar","2023-01-03","12:38 am","1");
INSERT INTO bitacora VALUES("11","15432288","Alumnos","Consultar","2023-01-03","12:39 am","1");
INSERT INTO bitacora VALUES("12","15432288","Profesores","Consultar","2023-01-03","12:50 am","1");
INSERT INTO bitacora VALUES("13","15432288","Alumnos","Consultar","2023-01-03","01:01 am","1");
INSERT INTO bitacora VALUES("14","15432288","Profesores","Consultar","2023-01-03","01:02 am","1");
INSERT INTO bitacora VALUES("15","15432288","Alumnos","Consultar","2023-01-03","02:24 am","1");
INSERT INTO bitacora VALUES("16","15432288","Periodos","Consultar","2023-01-03","02:24 am","1");
INSERT INTO bitacora VALUES("17","15432288","Periodos","Modificar","2023-01-03","02:26 am","1");
INSERT INTO bitacora VALUES("18","15432288","Periodos","Consultar","2023-01-03","02:26 am","1");
INSERT INTO bitacora VALUES("19","15432288","Saberes","Consultar","2023-01-03","02:28 am","1");
INSERT INTO bitacora VALUES("20","15432288","Saberes","Agregar","2023-01-03","02:34 am","1");
INSERT INTO bitacora VALUES("21","15432288","Saberes","Consultar","2023-01-03","02:34 am","1");
INSERT INTO bitacora VALUES("22","15432288","Saberes","Agregar","2023-01-03","02:34 am","1");
INSERT INTO bitacora VALUES("23","15432288","Saberes","Consultar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("24","15432288","Saberes","Agregar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("25","15432288","Saberes","Consultar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("26","15432288","Saberes","Agregar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("27","15432288","Saberes","Consultar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("28","15432288","Saberes","Agregar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("29","15432288","Saberes","Consultar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("30","15432288","Saberes","Agregar","2023-01-03","02:35 am","1");
INSERT INTO bitacora VALUES("31","15432288","Saberes","Consultar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("32","15432288","Saberes","Agregar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("33","15432288","Saberes","Consultar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("34","15432288","Saberes","Agregar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("35","15432288","Saberes","Consultar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("36","15432288","Saberes","Agregar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("37","15432288","Saberes","Consultar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("38","15432288","Saberes","Agregar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("39","15432288","Saberes","Consultar","2023-01-03","02:36 am","1");
INSERT INTO bitacora VALUES("40","15432288","Saberes","Agregar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("41","15432288","Saberes","Consultar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("42","15432288","Saberes","Agregar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("43","15432288","Saberes","Consultar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("44","15432288","Saberes","Agregar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("45","15432288","Saberes","Consultar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("46","15432288","Saberes","Agregar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("47","15432288","Saberes","Consultar","2023-01-03","02:37 am","1");
INSERT INTO bitacora VALUES("48","15432288","Secciones","Consultar","2023-01-03","02:38 am","1");
INSERT INTO bitacora VALUES("49","15432288","Secciones","Agregar","2023-01-03","02:39 am","1");
INSERT INTO bitacora VALUES("50","15432288","Secciones","Consultar","2023-01-03","02:39 am","1");
INSERT INTO bitacora VALUES("51","15432288","Secciones","Agregar","2023-01-03","02:40 am","1");
INSERT INTO bitacora VALUES("52","15432288","Secciones","Consultar","2023-01-03","02:40 am","1");
INSERT INTO bitacora VALUES("53","15432288","Clases","Consultar","2023-01-03","02:40 am","1");
INSERT INTO bitacora VALUES("54","15432288","Clases","Agregar","2023-01-03","02:41 am","1");
INSERT INTO bitacora VALUES("55","15432288","Clases","Consultar","2023-01-03","02:41 am","1");
INSERT INTO bitacora VALUES("56","15432288","Clases","Agregar","2023-01-03","02:41 am","1");
INSERT INTO bitacora VALUES("57","15432288","Clases","Consultar","2023-01-03","02:41 am","1");
INSERT INTO bitacora VALUES("58","15432288","Clases","Agregar","2023-01-03","02:42 am","1");
INSERT INTO bitacora VALUES("59","15432288","Clases","Consultar","2023-01-03","02:42 am","1");
INSERT INTO bitacora VALUES("60","15432288","Clases","Agregar","2023-01-03","02:42 am","1");
INSERT INTO bitacora VALUES("61","15432288","Clases","Consultar","2023-01-03","02:42 am","1");
INSERT INTO bitacora VALUES("62","15432288","Secciones","Consultar","2023-01-03","02:43 am","1");
INSERT INTO bitacora VALUES("63","15432288","Alumnos","Consultar","2023-01-03","02:43 am","1");
INSERT INTO bitacora VALUES("64","15432288","Secciones","Consultar","2023-01-03","02:43 am","1");
INSERT INTO bitacora VALUES("65","15432288","Proyectos","Consultar","2023-01-03","02:44 am","1");
INSERT INTO bitacora VALUES("66","15432288","Proyectos","Agregar","2023-01-03","02:45 am","1");
INSERT INTO bitacora VALUES("67","15432288","Proyectos","Consultar","2023-01-03","02:45 am","1");
INSERT INTO bitacora VALUES("68","15432288","Proyectos","Agregar","2023-01-03","02:45 am","1");
INSERT INTO bitacora VALUES("69","15432288","Proyectos","Consultar","2023-01-03","02:45 am","1");
INSERT INTO bitacora VALUES("70","15432288","Usuarios","Consultar","2023-01-03","02:45 am","1");
INSERT INTO bitacora VALUES("71","15432288","Usuarios","Agregar","2023-01-03","02:48 am","1");
INSERT INTO bitacora VALUES("72","15432288","Usuarios","Consultar","2023-01-03","02:48 am","1");
INSERT INTO bitacora VALUES("73","18690684","Inicio De Sesión","Consultar","2023-01-03","02:49 am","1");
INSERT INTO bitacora VALUES("74","18690684","Preguntas","Consultar","2023-01-03","02:49 am","1");
INSERT INTO bitacora VALUES("75","18690684","Preguntas","Agregar","2023-01-03","02:51 am","1");
INSERT INTO bitacora VALUES("76","18690684","Inicio","Consultar","2023-01-03","02:51 am","1");
INSERT INTO bitacora VALUES("77","18690684","Usuarios","Consultar","2023-01-03","02:51 am","1");
INSERT INTO bitacora VALUES("78","18690684","Usuarios","Modificar","2023-01-03","02:51 am","1");
INSERT INTO bitacora VALUES("79","18690684","Usuarios","Consultar","2023-01-03","02:51 am","1");
INSERT INTO bitacora VALUES("80","18690684","Usuarios","Agregar","2023-01-03","02:52 am","1");
INSERT INTO bitacora VALUES("81","18690684","Usuarios","Consultar","2023-01-03","02:52 am","1");
INSERT INTO bitacora VALUES("82","18690684","Usuarios","Modificar","2023-01-03","02:53 am","1");
INSERT INTO bitacora VALUES("83","18690684","Usuarios","Consultar","2023-01-03","02:53 am","1");
INSERT INTO bitacora VALUES("84","18690684","Reportes","Consultar","2023-01-03","02:58 am","1");
INSERT INTO bitacora VALUES("85","18690684","Usuarios","Consultar","2023-01-03","02:58 am","1");
INSERT INTO bitacora VALUES("86","18690684","Alumnos","Consultar","2023-01-03","02:59 am","1");
INSERT INTO bitacora VALUES("87","18690684","Usuarios","Consultar","2023-01-03","02:59 am","1");
INSERT INTO bitacora VALUES("88","18690684","Usuarios","Agregar","2023-01-03","03:00 am","1");
INSERT INTO bitacora VALUES("89","18690684","Usuarios","Consultar","2023-01-03","03:01 am","1");
INSERT INTO bitacora VALUES("90","18690684","Usuarios","Agregar","2023-01-03","03:03 am","1");
INSERT INTO bitacora VALUES("91","18690684","Usuarios","Consultar","2023-01-03","03:03 am","1");
INSERT INTO bitacora VALUES("92","18690684","Alumnos","Consultar","2023-01-03","03:05 am","1");
INSERT INTO bitacora VALUES("93","18690684","Usuarios","Consultar","2023-01-03","03:05 am","1");
INSERT INTO bitacora VALUES("94","15432288","Notas","Consultar","2023-01-03","03:15 am","1");
INSERT INTO bitacora VALUES("95","15432288","Notas","Agregar","2023-01-03","03:15 am","1");
INSERT INTO bitacora VALUES("96","15432288","Notas","Consultar","2023-01-03","03:15 am","1");
INSERT INTO bitacora VALUES("97","15432288","Notas","Agregar","2023-01-03","03:16 am","1");
INSERT INTO bitacora VALUES("98","15432288","Notas","Consultar","2023-01-03","03:16 am","1");
INSERT INTO bitacora VALUES("99","15432288","Reportes","Consultar","2023-01-03","03:16 am","1");
INSERT INTO bitacora VALUES("100","15432288","Alumnos","Consultar","2023-01-03","04:05 am","1");
INSERT INTO bitacora VALUES("101","15432288","Reportes","Consultar","2023-01-03","04:06 am","1");
INSERT INTO bitacora VALUES("102","15432288","Usuarios","Consultar","2023-01-03","04:47 am","1");
INSERT INTO bitacora VALUES("103","15432288","Alumnos","Consultar","2023-01-03","04:48 am","1");
INSERT INTO bitacora VALUES("104","15432288","Usuarios","Consultar","2023-01-03","04:59 am","1");
INSERT INTO bitacora VALUES("105","15432288","Usuarios","Agregar","2023-01-03","05:00 am","1");
INSERT INTO bitacora VALUES("106","15432288","Usuarios","Consultar","2023-01-03","05:00 am","1");
INSERT INTO bitacora VALUES("107","18690684","Cerrar Sesión","Consultar","2023-01-03","08:07 am","1");
INSERT INTO bitacora VALUES("108","07132428","Inicio De Sesión","Consultar","2023-01-03","08:07 am","1");
INSERT INTO bitacora VALUES("109","07132428","Preguntas","Consultar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("110","07132428","Preguntas","Agregar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("111","07132428","Inicio","Consultar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("112","07132428","Cerrar Sesión","Consultar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("113","15432288","Usuarios","Modificar","2023-01-03","08:09 am","1");
INSERT INTO bitacora VALUES("114","15432288","Usuarios","Consultar","2023-01-03","08:09 am","1");
INSERT INTO bitacora VALUES("115","15432288","Secciones","Consultar","2023-01-03","08:15 am","1");
INSERT INTO bitacora VALUES("116","15432288","Notas","Consultar","2023-01-03","08:15 am","1");
INSERT INTO bitacora VALUES("117","15432288","Saberes","Consultar","2023-01-03","08:15 am","1");
INSERT INTO bitacora VALUES("118","15432288","Secciones","Consultar","2023-01-03","08:15 am","1");
INSERT INTO bitacora VALUES("119","15432288","Secciones","Modificar","2023-01-03","08:16 am","1");
INSERT INTO bitacora VALUES("120","15432288","Secciones","Consultar","2023-01-03","08:16 am","1");
INSERT INTO bitacora VALUES("121","15432288","Alumnos","Consultar","2023-01-03","08:16 am","1");
INSERT INTO bitacora VALUES("122","15432288","Profesores","Consultar","2023-01-03","08:17 am","1");
INSERT INTO bitacora VALUES("123","15432288","Alumnos","Consultar","2023-01-03","08:18 am","1");
INSERT INTO bitacora VALUES("124","15432288","Usuarios","Consultar","2023-01-03","08:18 am","1");
INSERT INTO bitacora VALUES("125","15432288","Alumnos","Consultar","2023-01-03","08:18 am","1");
INSERT INTO bitacora VALUES("126","15432288","Secciones","Consultar","2023-01-03","07:43 pm","1");
INSERT INTO bitacora VALUES("127","15432288","Profesores","Consultar","2023-01-03","07:43 pm","1");
INSERT INTO bitacora VALUES("128","15432288","Saberes","Consultar","2023-01-03","07:43 pm","1");
INSERT INTO bitacora VALUES("129","15432288","Secciones","Consultar","2023-01-03","07:44 pm","1");
INSERT INTO bitacora VALUES("130","15432288","Secciones","Modificar","2023-01-03","07:44 pm","1");
INSERT INTO bitacora VALUES("131","15432288","Secciones","Consultar","2023-01-03","07:44 pm","1");
INSERT INTO bitacora VALUES("132","15432288","Clases","Consultar","2023-01-03","07:45 pm","1");
INSERT INTO bitacora VALUES("133","15432288","Proyectos","Consultar","2023-01-03","07:45 pm","1");
INSERT INTO bitacora VALUES("134","15432288","Proyectos","Modificar","2023-01-03","07:46 pm","1");
INSERT INTO bitacora VALUES("135","15432288","Proyectos","Consultar","2023-01-03","07:46 pm","1");
INSERT INTO bitacora VALUES("136","15432288","Proyectos","Modificar","2023-01-03","07:46 pm","1");
INSERT INTO bitacora VALUES("137","15432288","Proyectos","Consultar","2023-01-03","07:46 pm","1");
INSERT INTO bitacora VALUES("138","15432288","Notas","Consultar","2023-01-03","07:46 pm","1");
INSERT INTO bitacora VALUES("139","15432288","Usuarios","Consultar","2023-01-03","07:46 pm","1");
INSERT INTO bitacora VALUES("140","15432288","Usuarios","Agregar","2023-01-03","07:47 pm","1");
INSERT INTO bitacora VALUES("141","15432288","Usuarios","Consultar","2023-01-03","07:47 pm","1");
INSERT INTO bitacora VALUES("142","07359667","Inicio De Sesión","Consultar","2023-01-03","07:48 pm","1");
INSERT INTO bitacora VALUES("143","07359667","Preguntas","Consultar","2023-01-03","07:48 pm","1");
INSERT INTO bitacora VALUES("144","07359667","Preguntas","Agregar","2023-01-03","07:49 pm","1");
INSERT INTO bitacora VALUES("145","07359667","Inicio","Consultar","2023-01-03","07:49 pm","1");
INSERT INTO bitacora VALUES("146","07359667","Notas","Consultar","2023-01-03","07:49 pm","1");
INSERT INTO bitacora VALUES("147","07359667","Cerrar Sesión","Consultar","2023-01-03","07:49 pm","1");
INSERT INTO bitacora VALUES("148","01566370","Inicio De Sesión","Consultar","2023-01-03","07:50 pm","1");
INSERT INTO bitacora VALUES("149","01566370","Preguntas","Consultar","2023-01-03","07:50 pm","1");
INSERT INTO bitacora VALUES("150","01566370","Preguntas","Agregar","2023-01-03","07:50 pm","1");
INSERT INTO bitacora VALUES("151","01566370","Inicio","Consultar","2023-01-03","07:50 pm","1");
INSERT INTO bitacora VALUES("152","15432288","Clases","Consultar","2023-01-03","07:53 pm","1");
INSERT INTO bitacora VALUES("153","15432288","Secciones","Consultar","2023-01-03","07:54 pm","1");
INSERT INTO bitacora VALUES("154","15432288","Secciones","Agregar","2023-01-03","07:55 pm","1");
INSERT INTO bitacora VALUES("155","15432288","Secciones","Consultar","2023-01-03","07:55 pm","1");
INSERT INTO bitacora VALUES("156","15432288","Clases","Consultar","2023-01-03","07:55 pm","1");
INSERT INTO bitacora VALUES("157","15432288","Clases","Agregar","2023-01-03","07:55 pm","1");
INSERT INTO bitacora VALUES("158","15432288","Clases","Consultar","2023-01-03","07:55 pm","1");
INSERT INTO bitacora VALUES("159","15432288","Periodos","Consultar","2023-01-03","07:55 pm","1");
INSERT INTO bitacora VALUES("160","15432288","Periodos","Modificar","2023-01-03","07:58 pm","1");
INSERT INTO bitacora VALUES("161","15432288","Periodos","Consultar","2023-01-03","07:58 pm","1");
INSERT INTO bitacora VALUES("162","15432288","Secciones","Consultar","2023-01-03","07:58 pm","1");
INSERT INTO bitacora VALUES("163","15432288","Secciones","Modificar","2023-01-03","07:58 pm","1");
INSERT INTO bitacora VALUES("164","15432288","Secciones","Consultar","2023-01-03","07:58 pm","1");
INSERT INTO bitacora VALUES("165","15432288","Periodos","Consultar","2023-01-03","08:04 pm","1");
INSERT INTO bitacora VALUES("166","15432288","Secciones","Consultar","2023-01-03","08:04 pm","1");
INSERT INTO bitacora VALUES("167","15432288","Clases","Consultar","2023-01-03","08:05 pm","1");
INSERT INTO bitacora VALUES("168","15432288","Secciones","Consultar","2023-01-03","08:05 pm","1");
INSERT INTO bitacora VALUES("169","15432288","Clases","Consultar","2023-01-03","08:05 pm","1");
INSERT INTO bitacora VALUES("170","15432288","Secciones","Consultar","2023-01-03","08:06 pm","1");
INSERT INTO bitacora VALUES("171","15432288","Clases","Consultar","2023-01-03","08:06 pm","1");
INSERT INTO bitacora VALUES("172","15432288","Secciones","Consultar","2023-01-03","08:07 pm","1");
INSERT INTO bitacora VALUES("173","15432288","Notas","Consultar","2023-01-03","08:07 pm","1");
INSERT INTO bitacora VALUES("174","15432288","Notas","Agregar","2023-01-03","08:08 pm","1");
INSERT INTO bitacora VALUES("175","15432288","Notas","Consultar","2023-01-03","08:08 pm","1");
INSERT INTO bitacora VALUES("176","01566370","Cerrar Sesión","Consultar","2023-01-03","08:09 pm","1");
INSERT INTO bitacora VALUES("177","15432288","Usuarios","Consultar","2023-01-03","08:09 pm","1");
INSERT INTO bitacora VALUES("178","07359667","Inicio De Sesión","Consultar","2023-01-03","08:09 pm","1");
INSERT INTO bitacora VALUES("179","07359667","Inicio","Consultar","2023-01-03","08:09 pm","1");
INSERT INTO bitacora VALUES("180","07359667","Notas","Consultar","2023-01-03","08:09 pm","1");
INSERT INTO bitacora VALUES("181","15432288","Reportes","Consultar","2023-01-03","08:14 pm","1");
INSERT INTO bitacora VALUES("182","15432288","Inicio","Consultar","2023-01-04","05:55 am","1");
INSERT INTO bitacora VALUES("183","15432288","Reportes","Consultar","2023-01-04","05:55 am","1");
INSERT INTO bitacora VALUES("184","15432288","Usuarios","Consultar","2023-01-04","07:40 am","1");
INSERT INTO bitacora VALUES("185","15432288","Periodos","Consultar","2023-01-04","07:41 am","1");
INSERT INTO bitacora VALUES("186","15432288","Periodos","Modificar","2023-01-04","07:41 am","1");
INSERT INTO bitacora VALUES("187","15432288","Periodos","Consultar","2023-01-04","07:41 am","1");
INSERT INTO bitacora VALUES("188","15432288","Clases","Consultar","2023-01-04","07:41 am","1");
INSERT INTO bitacora VALUES("189","15432288","Notas","Consultar","2023-01-04","07:42 am","1");
INSERT INTO bitacora VALUES("190","15432288","Reportes","Consultar","2023-01-04","07:45 am","1");
INSERT INTO bitacora VALUES("191","15432288","Usuarios","Consultar","2023-01-04","01:55 pm","1");
INSERT INTO bitacora VALUES("192","07359667","Inicio De Sesión","Consultar","2023-01-04","02:01 pm","1");
INSERT INTO bitacora VALUES("193","07359667","Inicio","Consultar","2023-01-04","02:01 pm","1");
INSERT INTO bitacora VALUES("194","07359667","Cerrar Sesión","Consultar","2023-01-04","02:02 pm","1");
INSERT INTO bitacora VALUES("195","15432288","Usuarios","Modificar","2023-01-04","02:08 pm","1");
INSERT INTO bitacora VALUES("196","15432288","Usuarios","Consultar","2023-01-04","02:08 pm","1");
INSERT INTO bitacora VALUES("197","18690684","Inicio De Sesión","Consultar","2023-01-04","02:08 pm","1");
INSERT INTO bitacora VALUES("198","18690684","Inicio","Consultar","2023-01-04","02:08 pm","1");
INSERT INTO bitacora VALUES("199","18690684","Cerrar Sesión","Consultar","2023-01-04","02:16 pm","1");
INSERT INTO bitacora VALUES("200","01566370","Inicio De Sesión","Consultar","2023-01-04","02:16 pm","1");
INSERT INTO bitacora VALUES("201","01566370","Inicio","Consultar","2023-01-04","02:16 pm","1");
INSERT INTO bitacora VALUES("202","01566370","Cerrar Sesión","Consultar","2023-01-04","02:17 pm","1");
INSERT INTO bitacora VALUES("203","15432288","Usuarios","Modificar","2023-01-04","02:33 pm","1");
INSERT INTO bitacora VALUES("204","15432288","Usuarios","Consultar","2023-01-04","02:33 pm","1");
INSERT INTO bitacora VALUES("205","15432288","Inicio De Sesión","Consultar","2023-01-04","03:04 pm","1");
INSERT INTO bitacora VALUES("206","15432288","Inicio","Consultar","2023-01-04","03:04 pm","1");
INSERT INTO bitacora VALUES("207","15432288","Usuarios","Consultar","2023-01-04","03:04 pm","1");
INSERT INTO bitacora VALUES("208","15432288","Usuarios","Modificar","2023-01-04","03:09 pm","1");
INSERT INTO bitacora VALUES("209","15432288","Usuarios","Consultar","2023-01-04","03:09 pm","1");
INSERT INTO bitacora VALUES("210","15432288","Usuarios","Modificar","2023-01-04","03:10 pm","1");
INSERT INTO bitacora VALUES("211","15432288","Usuarios","Consultar","2023-01-04","03:10 pm","1");
INSERT INTO bitacora VALUES("212","18690684","Inicio De Sesión","Consultar","2023-01-04","03:30 pm","1");
INSERT INTO bitacora VALUES("213","18690684","Inicio","Consultar","2023-01-04","03:30 pm","1");
INSERT INTO bitacora VALUES("214","18690684","Cerrar Sesión","Consultar","2023-01-04","03:30 pm","1");
INSERT INTO bitacora VALUES("215","07132428","Inicio De Sesión","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("216","07132428","Inicio","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("217","07132428","Cerrar Sesión","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("218","01566370","Inicio De Sesión","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("219","01566370","Inicio","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("220","15432288","Cerrar Sesión","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("221","01566370","Cerrar Sesión","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("222","07359667","Inicio De Sesión","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("223","07359667","Inicio","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("224","18690684","Inicio De Sesión","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("225","18690684","Inicio","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("226","18690684","Roles","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("227","18690684","Roles","Modificar","2023-01-04","03:55 pm","1");
INSERT INTO bitacora VALUES("228","18690684","Roles","Consultar","2023-01-04","03:55 pm","1");
INSERT INTO bitacora VALUES("229","07359667","Cerrar Sesión","Consultar","2023-01-04","03:55 pm","1");
INSERT INTO bitacora VALUES("230","01566370","Inicio De Sesión","Consultar","2023-01-04","03:56 pm","1");
INSERT INTO bitacora VALUES("231","01566370","Inicio","Consultar","2023-01-04","03:56 pm","1");
INSERT INTO bitacora VALUES("232","01566370","Reportes","Consultar","2023-01-04","03:56 pm","1");
INSERT INTO bitacora VALUES("233","18690684","Reportes","Consultar","2023-01-04","04:05 pm","1");
INSERT INTO bitacora VALUES("234","18690684","Alumnos","Consultar","2023-01-04","04:08 pm","1");
INSERT INTO bitacora VALUES("235","18690684","Reportes","Consultar","2023-01-04","04:30 pm","1");
INSERT INTO bitacora VALUES("236","18690684","Alumnos","Consultar","2023-01-04","11:42 pm","1");
INSERT INTO bitacora VALUES("237","18690684","Reportes","Consultar","2023-01-05","01:27 am","1");
INSERT INTO bitacora VALUES("238","18690684","Usuarios","Consultar","2023-01-05","03:44 am","1");
INSERT INTO bitacora VALUES("239","01566370","Inicio De Sesión","Consultar","2023-01-05","03:45 am","1");
INSERT INTO bitacora VALUES("240","01566370","Inicio","Consultar","2023-01-05","03:45 am","1");
INSERT INTO bitacora VALUES("241","01566370","Reportes","Consultar","2023-01-05","03:45 am","1");
INSERT INTO bitacora VALUES("242","18690684","Reportes","Consultar","2023-01-05","03:58 am","1");
INSERT INTO bitacora VALUES("243","18690684","Reportes","Usuarios","2023-01-05","03:58 am","1");
INSERT INTO bitacora VALUES("244","18690684","Bitacora","Consultar","2023-01-05","03:58 am","1");
INSERT INTO bitacora VALUES("245","18690684","Usuarios","Consultar","2023-01-05","04:06 am","1");
INSERT INTO bitacora VALUES("246","18690684","Mantenimiento","Consultar","2023-01-05","04:47 am","1");
INSERT INTO bitacora VALUES("247","18690684","Mantenimiento","Respaldar","2023-01-05","05:23 am","1");
INSERT INTO bitacora VALUES("248","18690684","Mantenimiento","Consultar","2023-01-05","05:25 am","1");
INSERT INTO bitacora VALUES("249","18690684","Mantenimiento","Respaldar","2023-01-05","05:25 am","1");
INSERT INTO bitacora VALUES("250","18690684","Mantenimiento","Consultar","2023-01-05","05:25 am","1");
INSERT INTO bitacora VALUES("251","18690684","Mantenimiento","Respaldar","2023-01-05","05:26 am","1");
INSERT INTO bitacora VALUES("252","18690684","Mantenimiento","Consultar","2023-01-05","05:26 am","1");
INSERT INTO bitacora VALUES("253","18690684","Mantenimiento","Respaldar","2023-01-05","05:27 am","1");
INSERT INTO bitacora VALUES("254","18690684","Mantenimiento","Consultar","2023-01-05","05:29 am","1");
INSERT INTO bitacora VALUES("255","18690684","Mantenimiento","Respaldar","2023-01-05","05:34 am","1");
INSERT INTO bitacora VALUES("256","18690684","Mantenimiento","Consultar","2023-01-05","05:36 am","1");
INSERT INTO bitacora VALUES("257","18690684","Mantenimiento","Respaldar","2023-01-05","05:37 am","1");
INSERT INTO bitacora VALUES("258","18690684","Mantenimiento","Consultar","2023-01-05","05:38 am","1");
INSERT INTO bitacora VALUES("259","18690684","Mantenimiento","Respaldar","2023-01-05","05:39 am","1");
INSERT INTO bitacora VALUES("260","18690684","Mantenimiento","Consultar","2023-01-05","05:48 am","1");
INSERT INTO bitacora VALUES("261","18690684","Mantenimiento","Respaldar","2023-01-05","05:48 am","1");
INSERT INTO bitacora VALUES("262","18690684","Mantenimiento","Consultar","2023-01-05","06:03 am","1");
INSERT INTO bitacora VALUES("263","18690684","Secciones","Consultar","2023-01-05","10:23 pm","1");
INSERT INTO bitacora VALUES("264","18690684","Secciones","Agregar","2023-01-05","10:59 pm","1");
INSERT INTO bitacora VALUES("265","18690684","Secciones","Consultar","2023-01-05","10:59 pm","1");
INSERT INTO bitacora VALUES("266","18690684","Alumnos","Consultar","2023-01-05","11:03 pm","1");
INSERT INTO bitacora VALUES("267","18690684","Inicio De Sesión","Consultar","2023-01-05","11:40 pm","1");
INSERT INTO bitacora VALUES("268","18690684","Inicio","Consultar","2023-01-05","11:40 pm","1");
INSERT INTO bitacora VALUES("269","18690684","Secciones","Consultar","2023-01-05","11:40 pm","1");
INSERT INTO bitacora VALUES("270","18690684","Inicio De Sesión","Consultar","2023-01-06","12:19 am","1");
INSERT INTO bitacora VALUES("271","18690684","Inicio","Consultar","2023-01-06","12:19 am","1");
INSERT INTO bitacora VALUES("272","18690684","Usuarios","Consultar","2023-01-06","12:19 am","1");
INSERT INTO bitacora VALUES("273","18690684","Cerrar Sesión","Consultar","2023-01-06","09:34 pm","1");
INSERT INTO bitacora VALUES("274","07359667","Inicio De Sesión","Consultar","2023-01-06","09:34 pm","1");
INSERT INTO bitacora VALUES("275","07359667","Inicio","Consultar","2023-01-06","09:34 pm","1");
INSERT INTO bitacora VALUES("276","07359667","Cerrar Sesión","Consultar","2023-01-07","01:06 pm","1");
INSERT INTO bitacora VALUES("277","18690684","Inicio De Sesión","Consultar","2023-01-07","01:06 pm","1");
INSERT INTO bitacora VALUES("278","18690684","Inicio","Consultar","2023-01-07","01:06 pm","1");
INSERT INTO bitacora VALUES("279","18690684","Mantenimiento","Consultar","2023-01-07","08:54 pm","1");
INSERT INTO bitacora VALUES("280","18690684","Cerrar Sesión","Consultar","2023-01-09","07:53 pm","1");
INSERT INTO bitacora VALUES("281","18690684","Inicio De Sesión","Consultar","2023-01-13","08:24 pm","1");
INSERT INTO bitacora VALUES("282","18690684","Inicio","Consultar","2023-01-13","08:24 pm","1");
INSERT INTO bitacora VALUES("283","18690684","Cerrar Sesión","Consultar","2023-01-13","08:24 pm","1");
INSERT INTO bitacora VALUES("284","18690684","Inicio De Sesión","Consultar","2023-01-13","08:24 pm","1");
INSERT INTO bitacora VALUES("285","18690684","Inicio","Consultar","2023-01-13","08:31 pm","1");
INSERT INTO bitacora VALUES("286","18690684","Cerrar Sesión","Consultar","2023-01-13","08:31 pm","1");
INSERT INTO bitacora VALUES("287","18690684","Inicio De Sesión","Consultar","2023-01-13","08:32 pm","1");
INSERT INTO bitacora VALUES("288","18690684","Inicio","Consultar","2023-01-13","08:46 pm","1");
INSERT INTO bitacora VALUES("289","18690684","Cerrar Sesión","Consultar","2023-01-13","08:46 pm","1");
INSERT INTO bitacora VALUES("290","18690684","Inicio De Sesión","Consultar","2023-01-13","09:21 pm","1");
INSERT INTO bitacora VALUES("291","18690684","Inicio","Consultar","2023-01-13","09:32 pm","1");
INSERT INTO bitacora VALUES("292","18690684","Cerrar Sesión","Consultar","2023-01-13","09:32 pm","1");
INSERT INTO bitacora VALUES("293","18690684","Inicio De Sesión","Consultar","2023-01-13","09:33 pm","1");
INSERT INTO bitacora VALUES("294","18690684","Inicio","Consultar","2023-01-13","09:33 pm","1");
INSERT INTO bitacora VALUES("295","18690684","Alumnos","Consultar","2023-01-13","09:33 pm","1");
INSERT INTO bitacora VALUES("296","18690684","Usuarios","Consultar","2023-01-13","10:35 pm","1");
INSERT INTO bitacora VALUES("297","18690684","Usuarios","Agregar","2023-01-13","10:36 pm","1");
INSERT INTO bitacora VALUES("298","18690684","Usuarios","Consultar","2023-01-13","10:37 pm","1");
INSERT INTO bitacora VALUES("299","18690684","Cerrar Sesión","Consultar","2023-01-13","10:37 pm","1");
INSERT INTO bitacora VALUES("300","12346649","Inicio De Sesión","Consultar","2023-01-13","10:37 pm","1");
INSERT INTO bitacora VALUES("301","12346649","Preguntas","Consultar","2023-01-13","10:37 pm","1");
INSERT INTO bitacora VALUES("302","12346649","Preguntas","Agregar","2023-01-13","10:38 pm","1");
INSERT INTO bitacora VALUES("303","12346649","Inicio","Consultar","2023-01-13","10:38 pm","1");
INSERT INTO bitacora VALUES("304","12346649","Cerrar Sesión","Consultar","2023-01-13","11:03 pm","1");
INSERT INTO bitacora VALUES("305","18690684","Inicio De Sesión","Consultar","2023-01-13","11:04 pm","1");
INSERT INTO bitacora VALUES("306","18690684","Inicio","Consultar","2023-01-13","11:04 pm","1");
INSERT INTO bitacora VALUES("307","18690684","Alumnos","Consultar","2023-01-13","11:07 pm","1");
INSERT INTO bitacora VALUES("308","18690684","Inicio","Consultar","2023-01-13","11:11 pm","1");
INSERT INTO bitacora VALUES("309","18690684","Alumnos","Consultar","2023-01-13","11:33 pm","1");
INSERT INTO bitacora VALUES("310","18690684","Inicio","Consultar","2023-01-13","11:41 pm","1");
INSERT INTO bitacora VALUES("311","18690684","Inicio","Vendor","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("312","18690684","Inicio","Assets","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("313","18690684","Inicio","Cierreperiodosubidanotas","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("314","18690684","Inicio","Consultar","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("315","18690684","Inicio","Vendor","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("316","18690684","Inicio","Assets","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("317","18690684","Inicio","Vendor","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("318","18690684","Inicio","Consultar","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("319","18690684","Inicio","Cierreperiodosubidanotas","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("320","18690684","Inicio","Consultar","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("321","18690684","Inicio","Vendor","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("322","18690684","Inicio","Assets","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("323","18690684","Inicio","Cierreperiodosubidanotas","2023-01-13","11:42 pm","1");
INSERT INTO bitacora VALUES("324","18690684","Inicio","Consultar","2023-01-13","11:43 pm","1");
INSERT INTO bitacora VALUES("325","18690684","Alumnos","Consultar","2023-01-13","11:51 pm","1");
INSERT INTO bitacora VALUES("326","18690684","Notas","Consultar","2023-01-14","01:41 am","1");
INSERT INTO bitacora VALUES("327","18690684","Usuarios","Consultar","2023-01-14","01:41 am","1");
INSERT INTO bitacora VALUES("328","18690684","Cerrar Sesión","Consultar","2023-01-14","01:41 am","1");
INSERT INTO bitacora VALUES("329","18690684","Inicio De Sesión","Consultar","2023-01-16","03:11 pm","1");
INSERT INTO bitacora VALUES("330","18690684","Inicio","Consultar","2023-01-16","03:11 pm","1");
INSERT INTO bitacora VALUES("331","18690684","Alumnos","Consultar","2023-01-16","03:41 pm","1");
INSERT INTO bitacora VALUES("332","18690684","Inicio De Sesión","Consultar","2023-01-16","04:23 pm","1");
INSERT INTO bitacora VALUES("333","18690684","Inicio","Consultar","2023-01-16","04:23 pm","1");
INSERT INTO bitacora VALUES("334","18690684","Alumnos","Consultar","2023-01-16","04:23 pm","1");
INSERT INTO bitacora VALUES("335","18690684","Inicio","Consultar","2023-01-16","05:01 pm","1");
INSERT INTO bitacora VALUES("336","18690684","Alumnos","Consultar","2023-01-16","05:01 pm","1");
INSERT INTO bitacora VALUES("337","18690684","Inicio De Sesión","Consultar","2023-01-16","05:17 pm","1");
INSERT INTO bitacora VALUES("338","18690684","Inicio","Consultar","2023-01-16","05:17 pm","1");
INSERT INTO bitacora VALUES("339","18690684","Inicio De Sesión","Consultar","2023-01-16","05:42 pm","1");
INSERT INTO bitacora VALUES("340","18690684","Inicio","Consultar","2023-01-16","05:42 pm","1");
INSERT INTO bitacora VALUES("341","18690684","Alumnos","Consultar","2023-01-16","05:42 pm","1");
INSERT INTO bitacora VALUES("342","18690684","Inicio De Sesión","Consultar","2023-01-18","10:55 pm","1");
INSERT INTO bitacora VALUES("343","18690684","Inicio","Consultar","2023-01-18","10:55 pm","1");
INSERT INTO bitacora VALUES("344","18690684","Alumnos","Consultar","2023-01-18","10:55 pm","1");
INSERT INTO bitacora VALUES("345","18690684","Alumnos","Agregar Desde Excel","2023-01-18","10:47 pm","1");
INSERT INTO bitacora VALUES("346","18690684","Alumnos","Consultar","2023-01-18","10:47 pm","1");
INSERT INTO bitacora VALUES("347","18690684","Usuarios","Consultar","2023-01-18","10:47 pm","1");
INSERT INTO bitacora VALUES("348","18690684","Cerrar Sesión","Consultar","2023-01-21","01:25 pm","1");
INSERT INTO bitacora VALUES("349","12346649","Inicio De Sesión","Consultar","2023-01-21","01:31 pm","1");
INSERT INTO bitacora VALUES("350","12346649","Inicio","Consultar","2023-01-21","01:31 pm","1");
INSERT INTO bitacora VALUES("351","12346649","Cerrar Sesión","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("352","18690684","Inicio De Sesión","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("353","18690684","Inicio","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("354","18690684","Alumnos","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("355","18690684","Alumnos","Agregar Desde Excel","2023-01-21","03:28 pm","1");
INSERT INTO bitacora VALUES("356","18690684","Inicio","Consultar","2023-02-08","10:39 pm","1");





CREATE TABLE `preguntas` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO preguntas VALUES("1","¿Cuál es el año de nacimiento de su padre?","1");
INSERT INTO preguntas VALUES("2","¿Cuál es el nombre de su primera mascota?","1");
INSERT INTO preguntas VALUES("3","¿Cuál es el nombre de su hermano/a?","1");
INSERT INTO preguntas VALUES("4","¿Cuál es su libro favorito?","1");
INSERT INTO preguntas VALUES("5","¿Cuál es la marca de su primer carro?","1");





CREATE TABLE `respuestas` (
  `id_respuesta` int(20) NOT NULL AUTO_INCREMENT,
  `cedula_usuario` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pregunta` int(10) NOT NULL,
  `respuestas` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_respuesta`),
  KEY `cedula_usuario` (`cedula_usuario`),
  KEY `id_pregunta` (`id_pregunta`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`cedula_usuario`) REFERENCES `usuarios` (`cedula_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `respuestas_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO respuestas VALUES("1","15432288","1","M01ncWVhc0k4RHg1WkxVWWpPRm82Zz09","1");
INSERT INTO respuestas VALUES("2","15432288","2","YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09","1");
INSERT INTO respuestas VALUES("3","15432288","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");
INSERT INTO respuestas VALUES("4","18690684","2","L3ZvWHMyV1ZldjdWRnhGczFkdkkzZz09","1");
INSERT INTO respuestas VALUES("5","18690684","3","eGNrbE1aSDByUk42TE5ETzRUQlFJUT09","1");
INSERT INTO respuestas VALUES("6","18690684","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");
INSERT INTO respuestas VALUES("7","07132428","2","YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09","1");
INSERT INTO respuestas VALUES("8","07132428","3","eE5KczhvdUNXYXpJRzZLVjhwRmVFQT09","1");
INSERT INTO respuestas VALUES("9","07132428","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");
INSERT INTO respuestas VALUES("10","07359667","2","dTh1bWpiSE0yMVlVdzZJRUh2ME12UT09","1");
INSERT INTO respuestas VALUES("11","07359667","3","dHFIcWxiM3VhNHRlMm1aTVQ1ZHIvZz09","1");
INSERT INTO respuestas VALUES("12","07359667","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");
INSERT INTO respuestas VALUES("13","01566370","2","dTh1bWpiSE0yMVlVdzZJRUh2ME12UT09","1");
INSERT INTO respuestas VALUES("14","01566370","3","dHFIcWxiM3VhNHRlMm1aTVQ1ZHIvZz09","1");
INSERT INTO respuestas VALUES("15","01566370","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");
INSERT INTO respuestas VALUES("16","12346649","1","M01ncWVhc0k4RHg1WkxVWWpPRm82Zz09","1");
INSERT INTO respuestas VALUES("17","12346649","2","YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09","1");
INSERT INTO respuestas VALUES("18","12346649","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");



