

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

INSERT INTO alumnos VALUES("24160658","Victor Junior","Jimenez Gonzalez","3","1");
INSERT INTO alumnos VALUES("24325718","Richar David","Quero Arteaga","3","1");
INSERT INTO alumnos VALUES("24326463","Wanda Joelys","Gutiérrez Falcón","3","1");
INSERT INTO alumnos VALUES("24385111","Dannys Alfredo","Tua Tua","3","1");
INSERT INTO alumnos VALUES("24418470","Diego Pastor","Mújica Peraza","3","1");
INSERT INTO alumnos VALUES("24550321","Roismar Alejandra","Mogollon Chirinos","3","1");
INSERT INTO alumnos VALUES("24613886","Luis  Fernando","Pargas Matheus","3","1");
INSERT INTO alumnos VALUES("24928079","Mariarlys Jose","Montilla Lopez","3","1");
INSERT INTO alumnos VALUES("24990010","Wileidy Cristina","Torres Flores","3","1");
INSERT INTO alumnos VALUES("25403600","Emily Carolina","Ortiz Mendoza","3","1");
INSERT INTO alumnos VALUES("25442453","Yonaiker Javier","Chambuco Mendoza","3","1");
INSERT INTO alumnos VALUES("25474327","Adriana Karina","Guédez Vargas","3","1");
INSERT INTO alumnos VALUES("25571829","Pedro Jose","Gomez Yepez","3","1");
INSERT INTO alumnos VALUES("25638923","Catherine Del Carmen","Partipilo Daza","3","1");
INSERT INTO alumnos VALUES("25857222","Rafael Ramon","Vivas Ramirez","3","1");
INSERT INTO alumnos VALUES("25857600","Isneidis Yenire","Garcia Freitez","3","1");
INSERT INTO alumnos VALUES("26076292","Omar De Jesus","Torrellas Molina","3","1");
INSERT INTO alumnos VALUES("26260221","Altair Sarahi","Perez Barradas","3","1");
INSERT INTO alumnos VALUES("26358018","Marioly Katherine","Basabe Peralta","3","1");
INSERT INTO alumnos VALUES("26370091","Blanca Mariana","Medina Salom","3","1");
INSERT INTO alumnos VALUES("26370490","Paola Carolina","Aguero Colmenarez","3","1");
INSERT INTO alumnos VALUES("26398233","Anthony Daniel","Suarez Colmenarez","3","1");
INSERT INTO alumnos VALUES("26398488","Josmar A","Rodriguez R","1","0");
INSERT INTO alumnos VALUES("26487568","Ambar Daniela","Valera Perez","3","1");
INSERT INTO alumnos VALUES("26540740","Nathaly Milagros","Rodriguez Yepez","3","1");
INSERT INTO alumnos VALUES("26644449","Yisel Nataly","Rodriguez Alvarado","3","1");
INSERT INTO alumnos VALUES("26750721","Francis Antonieta","Castillo Sangronis","3","1");
INSERT INTO alumnos VALUES("26799164","Johnniel Joalver","Vasquez Rodriguez","3","1");
INSERT INTO alumnos VALUES("26800684","Andreina Yenireth","Martinez Hernandez","3","1");
INSERT INTO alumnos VALUES("26898084","Alexander Manuel","Aguilar Colmenares","3","1");
INSERT INTO alumnos VALUES("26941019","Nailibeth Maria","Rivero Carrasco","3","1");
INSERT INTO alumnos VALUES("26964485","Mariana Alejandra","Rodriguez Berrios","3","1");
INSERT INTO alumnos VALUES("27085726","Greidy Mariana","Peraza Colmenarez","3","1");
INSERT INTO alumnos VALUES("27193391","Nestor Omar","Heredia Rodriguez","3","1");
INSERT INTO alumnos VALUES("27388907","Luis David","Lopez Garcia","3","1");
INSERT INTO alumnos VALUES("27436972","Eddimar Nohemi","Diaz Sanchez","3","1");
INSERT INTO alumnos VALUES("27524468","Yoscairy Andreina","Medina Suarez","3","1");
INSERT INTO alumnos VALUES("27586609","Leydimar Anais","Silva Peraza","3","1");
INSERT INTO alumnos VALUES("27666883","Jose Leonardo","Linarez Suarez","3","1");
INSERT INTO alumnos VALUES("27737767","Loriangely Adrianys","Sequera Escalona","3","1");
INSERT INTO alumnos VALUES("27759611","Emnimar Andrea","Soteldo Zerpa","3","1");
INSERT INTO alumnos VALUES("27827122","Maria De Los Angeles","Gutierrez Garcia","3","1");
INSERT INTO alumnos VALUES("27829899","Yessica Patricia","Mendoza Blanco","3","1");
INSERT INTO alumnos VALUES("27831006","Jose","Fuentes","3","1");
INSERT INTO alumnos VALUES("28019593","Gusnelly Alejandra","Barrios Vargas","3","1");
INSERT INTO alumnos VALUES("28020528","Karelys Andreina","Aranguren Alejos","3","1");
INSERT INTO alumnos VALUES("28165974","Yoselin Josefina","Gonzalez Chavez","3","1");
INSERT INTO alumnos VALUES("28256888","Heritmar Yoeslyn","Alvarado Navas","3","1");
INSERT INTO alumnos VALUES("28259658","Maria De Los Angeles","Burgos Gonzalez","3","1");
INSERT INTO alumnos VALUES("28286679","Yeily Mariangel","Rodriguez  Gimenez","3","1");
INSERT INTO alumnos VALUES("28653762","Abraham David","Jimenez Gomez","3","1");
INSERT INTO alumnos VALUES("29517646","Alberto Jesus","Rodriguez Saavedra","3","1");
INSERT INTO alumnos VALUES("29707357","Carlos Alejandro","Rodriguez Suarez","3","1");
INSERT INTO alumnos VALUES("30621621","Camila Michell","Mujica Peña","3","1");





CREATE TABLE `profesores` (
  `cedula_profesor` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_profesor` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido_profesor` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono_profesor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estatus` int(11) NOT NULL,
  PRIMARY KEY (`cedula_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO profesores VALUES("01566370","Judith","Díaz ","04121647106","1");
INSERT INTO profesores VALUES("03633921","Luis Guillermo","Mendoza ","04121647126","1");
INSERT INTO profesores VALUES("03756922","Edgar","Guedez","04121647116","1");
INSERT INTO profesores VALUES("03782342","Ricardo","Valderrama ","04121647148","1");
INSERT INTO profesores VALUES("03787540","Pablo","Guevara ","04121647118","1");
INSERT INTO profesores VALUES("04002660","Cruz","Estanga ","04121647109","1");
INSERT INTO profesores VALUES("04177704","Jesús","Guerrero","04121647117","1");
INSERT INTO profesores VALUES("04342594","Bertha","Pulido","04121647138","1");
INSERT INTO profesores VALUES("04373481","Arelys","Crespo ","04121647102","1");
INSERT INTO profesores VALUES("04966848","Carlos","Awais","04121647092","1");
INSERT INTO profesores VALUES("05116367","José","Andrade","04121647087","1");
INSERT INTO profesores VALUES("05237891","Alida","Peña","04121647131","1");
INSERT INTO profesores VALUES("05243212","Luis","Crespo","04121647103","1");
INSERT INTO profesores VALUES("05250654","Andrés E","Mendoza ","04121647124","1");
INSERT INTO profesores VALUES("07132428","Elizabeth","Briceño ","04121647097","1");
INSERT INTO profesores VALUES("07313351","José Gerardo","González","04121647115","1");
INSERT INTO profesores VALUES("07348871","Elisa","Colmenarez","04121647099","1");
INSERT INTO profesores VALUES("07350834","Eunice","Jiménez","04121647120","1");
INSERT INTO profesores VALUES("07359889","Manuel","Branco ","04121647096","1");
INSERT INTO profesores VALUES("07386104","Lesdy","Piña","04121647137","1");
INSERT INTO profesores VALUES("07387449","Oliva","Pineda ","04121647136","1");
INSERT INTO profesores VALUES("07389728","Jhonny","Picone","04121647135","1");
INSERT INTO profesores VALUES("07395006","Francisco","Duran ","04121647108","1");
INSERT INTO profesores VALUES("07399931","Rodrigo","Lander","04121647122","1");
INSERT INTO profesores VALUES("07403069","Jairo","Arias","04121647089","1");
INSERT INTO profesores VALUES("07409068","Elsy","Romero","04121647140","1");
INSERT INTO profesores VALUES("07438075","Zieliska","Oviedo ","04121647130","1");
INSERT INTO profesores VALUES("07442799","Adolia","Garcés ","04121647112","1");
INSERT INTO profesores VALUES("07914356","Evelyn","Barragán","04121647094","1");
INSERT INTO profesores VALUES("07970802","Camillo","Di Cola ","04121647107","1");
INSERT INTO profesores VALUES("08627938","Jenny","Acosta","04121647083","1");
INSERT INTO profesores VALUES("09048980","Ynmaculada","Azuaje","04121647093","1");
INSERT INTO profesores VALUES("09378013","Yelitza","Santos ","04121647143","1");
INSERT INTO profesores VALUES("09544153","David","Peraza ","04121647133","1");
INSERT INTO profesores VALUES("09579750","Johnny","León","04121647123","1");
INSERT INTO profesores VALUES("09626909","Yuli","Morales ","04121647128","1");
INSERT INTO profesores VALUES("09708093","Alenis","Arevalo","04121647088","1");
INSERT INTO profesores VALUES("10338520","Winston","Hidalgo","04121647119","1");
INSERT INTO profesores VALUES("10846059","María Alexandra","Corti","04121647101","1");
INSERT INTO profesores VALUES("10849476","Walter","Torres ","04121647147","1");
INSERT INTO profesores VALUES("11260305","Eva","Arrieche","04121647090","1");
INSERT INTO profesores VALUES("11580182","Endert","Gil","04121647113","1");
INSERT INTO profesores VALUES("11587952","Alexander","Cubiro ","04121647104","1");
INSERT INTO profesores VALUES("12026793","Carlos","Osal","04121647129","1");
INSERT INTO profesores VALUES("12244128","Yajhayra","Aldana","04121647086","1");
INSERT INTO profesores VALUES("12534603","Dayanara","Santos","04121647142","1");
INSERT INTO profesores VALUES("12630557","Michelly","Vivas","04121647150","1");
INSERT INTO profesores VALUES("12698690","María","Bonilla ","04121647095","1");
INSERT INTO profesores VALUES("12703237","Gizet","Asuaje","04121647091","1");
INSERT INTO profesores VALUES("12706637","Lisbeth","Acurero","04121647084","1");
INSERT INTO profesores VALUES("12707546","Larry","Segueri ","04121647144","1");
INSERT INTO profesores VALUES("12850970","Sergio","Jiménez","04121647121","1");
INSERT INTO profesores VALUES("13119423","Marvys","Soler","04121647145","1");
INSERT INTO profesores VALUES("13189208","Orana","Rosendo ","04121647141","1");
INSERT INTO profesores VALUES("13509849","Lilibell","Estevanot ","04121647111","1");
INSERT INTO profesores VALUES("13519545","Anabel","Abarca","04121647082","1");
INSERT INTO profesores VALUES("14068853","Gregorio","Colmenarez","04121647100","1");
INSERT INTO profesores VALUES("14228345"," Yennys","Gil","04121647114","1");
INSERT INTO profesores VALUES("14262620","Miriam","Peña ","04121647132","1");
INSERT INTO profesores VALUES("14749211","Somarilis","Valdez","04121647149","1");
INSERT INTO profesores VALUES("14880601","Johanna","Alastre","04121647085","1");
INSERT INTO profesores VALUES("14979119","Migliver","Montezuma","04121647127","1");
INSERT INTO profesores VALUES("16385532","Isaac","Mendoza","04121647125","1");
INSERT INTO profesores VALUES("17612167","Francys","Soteldo ","04121647146","1");
INSERT INTO profesores VALUES("18226221","Glennimar","Carreño","04121647098","1");
INSERT INTO profesores VALUES("18690684","Joan","Perez","04121647134","1");
INSERT INTO profesores VALUES("18917274","Andrés","España","04121647110","1");
INSERT INTO profesores VALUES("19262335","Aldo","Ramos  ","04121647139","1");
INSERT INTO profesores VALUES("19591089","Carlos","Cuicas","04121647105","1");





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

INSERT INTO secciones VALUES("T1P2S1","2","HS0102","1","0");
INSERT INTO secciones VALUES("T1P3S1","3","HS0102","1","0");
INSERT INTO secciones VALUES("T2P2S1","2","HS0201","2","0");
INSERT INTO secciones VALUES("T2P3S1","3","HS0202","2","0");
INSERT INTO secciones VALUES("T3P1S1","1","SH3101","3","1");





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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO seccion_alumno VALUES("1","T3P1S1","24160658","1");
INSERT INTO seccion_alumno VALUES("2","T3P1S1","24325718","1");
INSERT INTO seccion_alumno VALUES("3","T3P1S1","24326463","1");
INSERT INTO seccion_alumno VALUES("4","T3P1S1","24385111","1");
INSERT INTO seccion_alumno VALUES("5","T3P1S1","24418470","1");





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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO clases VALUES("6","10","T3P1S1","03633921","1","","","");





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

INSERT INTO proyectos VALUES("T3ST3P1S1P1","03787540","CRISTALES TINTADOS","3","1");





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

INSERT INTO grupos VALUES("PT3ST3P1S1P1G1","1","T3ST3P1S1P1","1");
INSERT INTO grupos VALUES("PT3ST3P1S1P1G2","2","T3ST3P1S1P1","1");
INSERT INTO grupos VALUES("PT3ST3P1S1P1G3","3","T3ST3P1S1P1","1");





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

INSERT INTO notas VALUES("S10ST3P1S1N1","6","1","0.8","2023-02-14","11:09 am","","1");
INSERT INTO notas VALUES("S10ST3P1S1N2","6","2","0.7","2023-02-14","11:09 am","","1");
INSERT INTO notas VALUES("S10ST3P1S1N3","6","3","0.9","2023-02-14","11:09 am","","1");
INSERT INTO notas VALUES("S10ST3P1S1N4","6","4","0.8","2023-02-14","11:09 am","","1");
INSERT INTO notas VALUES("S10ST3P1S1N5","6","5","0.9","2023-02-14","11:09 am","","1");





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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO notificaciones VALUES("34","clases","id","6","","2023-02-14","11:07 am","1","9","0","0","0");
INSERT INTO notificaciones VALUES("35","notas","codigo","-1","S10ST3P1S1N1","2023-02-14","11:09 am","1","0","0","9","9");
INSERT INTO notificaciones VALUES("36","notas","codigo","-1","S10ST3P1S1N2","2023-02-14","11:09 am","1","0","0","9","9");
INSERT INTO notificaciones VALUES("37","notas","codigo","-1","S10ST3P1S1N3","2023-02-14","11:09 am","1","0","0","9","9");
INSERT INTO notificaciones VALUES("38","notas","codigo","-1","S10ST3P1S1N4","2023-02-14","11:09 am","1","0","0","9","9");
INSERT INTO notificaciones VALUES("39","notas","codigo","-1","S10ST3P1S1N5","2023-02-14","11:09 am","1","0","0","9","9");





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
INSERT INTO usuarios VALUES("01566370","4","01566370","$2y$08$u7VhzsOBIQQpyAWpTZ6N5uEusfRIGmc8LVTBIIeK1SKUZL1V73hw.","judith@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("03633921","4","03633921","$2y$08$P.9b1ZJBNdMV4Yu1QiWSVOA.hi88Mls.nw71YIyPbUID89qNq17hq","luisguillermo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("03756922","4","03756922","$2y$08$1Ha1/PF.ZhChC5OQY8DDIe7fligMPUlAPkOXlT2.y65K/a0q8fO3a","edgar@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("03782342","4","03782342","$2y$08$GLKnNRwP/aLtGXfts/HmGukY9YvQWN8REiljJlGOlPTuOAlggAxr.","ricardo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("03787540","4","03787540","$2y$08$liiwN.0oVVU3IwdljhVXDuEvmG40ONXvixegcAn7FPyBEdnOYoXpu","pablo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("04002660","4","04002660","$2y$08$XEwGrENtigERXfxxxskdW.k8YqBAnvsVwEvFzkQsRzN3w3aEqWNRq","cruz@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("04177704","4","04177704","$2y$08$sMFjuRVWWLyvHLTcsdcdheRLlIJFYa7Z/P69Za976EXGCAWBN4tPm","jesús@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("04342594","4","04342594","$2y$08$GL1eg3a.9Iib24TLlrfD/OS2tMfdVal4mTfzN4RhjnMsN7PeQ7OhC","bertha@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("04373481","4","04373481","$2y$08$IsHjlN0IcP5VAN9faGEcZOXONO7h7xvvRQPAWHhR4pNsFbll.VeNi","arelys@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("04966848","4","04966848","$2y$08$G.uapVyu2.kgL6M37jQrf.ek7X8YS1nGYPO.RPKiSlwGjjjJA0jNS","carlos@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("05116367","4","05116367","$2y$08$w6pqHUlQKhk1wqGMU.c/uOo3NW4PoLk7Ww7QbTAwvcCHkyxRb2THq","josé@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("05237891","4","05237891","$2y$08$ZsumZ4UJ.wIJhGccQRQXd..7kLHx8t8vHeJMoeWx4JphPD/1DaSXe","alida@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("05243212","4","05243212","$2y$08$M38OqcvaVkYXMWPs49szZOBOGhiFJ5UJaxhqh6UEcu0SKF1CFmp9K","luis@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("05250654","4","05250654","$2y$08$Kl8iEqGoqsZXbPajI59/JOp7BoLlHW3D65HwWhpo4AwHEx3cuVMbi","andrése@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07132428","2","Elizabeth07","$2y$08$18ot3NIT2Y6Sk1rrgKTY3uoSxc7AnT1nPP5RFu7tE1YU3PMFZHlJu","elizabeth_briceño@gmail.com","","1","0","");
INSERT INTO usuarios VALUES("07313351","4","07313351","$2y$08$vfflFji5XxLcJ3VeT697YeKavldwUtAUKrdVBLCwAbwTpZWrkMI3O","joségerardo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07348871","4","07348871","$2y$08$F2SGxOHVH15ACfVrhQ6h3uMun/GEHEejNu1akQr/8COh1qifu5jKm","elisa@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07350834","4","07350834","$2y$08$C5dXZSK/49waNYaiwurLMOsUVu3XcVydufjjKLNji78vPq6Hi/S06","eunice@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07359889","4","07359889","$2y$08$p4nbsbH13atcMdjsKdv/LOwFdqmewqeTc4qnG78LFuO2Cv4pxPeJm","manuel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07386104","4","07386104","$2y$08$PsHAfidfFytNrnQBrFc6mOAZ4HbYvd87UgLBBh8gsiG4nDWOHKAAW","lesdy@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07387449","4","07387449","$2y$08$JVZXIFqJNxF8.toVhA2veulLNlcw98Us6.o9WzULU6BLvAlYh0CJO","oliva@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07389728","4","07389728","$2y$08$8ale3h2Z9KRE196VF/6Ffu2evJS0RBrLRbAak82yWyZT/Fkz3ZqzG","jhonny@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07395006","4","07395006","$2y$08$mfLVjlJY0uh8YNMv327D/u6qAaeUouhvStBI1HDJmSwzkhC1gZNIC","francisco@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07399931","4","07399931","$2y$08$owkHQMIcdRfJJZqOPDqe9OyLQFpma08VjhMIz2PicJwCmT7q9UQJq","rodrigo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07403069","4","07403069","$2y$08$aigMH67/TRxbDj2SZ2ZxGONTlZj4oOK6eyvEgmzO1wMNXq.8TG4bK","jairo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07409068","4","07409068","$2y$08$3R.O3cURM0BWqP1LmMbSkeHoSskfG5alR7gq91JA2vr/uA36jJHTu","elsy@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07438075","4","07438075","$2y$08$K2rhMPdPB2fbrOJFDxUSo.fa./7vv0v6X3idfgSf8lKm.6.u1EreK","zieliska@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07442799","4","07442799","$2y$08$v//Ci04LmYZceo7TEPLY3eXkHb4IGXCRv/An/TNpbWrDicd.Zja5i","adolia@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07914356","4","07914356","$2y$08$PiMJqR0KQ.Gbgv2xLxFllOwWGyk1yc0FuLyzttnJZUHYu82SotJIO","evelyn@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("07970802","4","07970802","$2y$08$K7xC/oknA4jtuwEjj.LLsuMdWwirrllrF5mvDIieGShoZijr6qJeW","camillo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("08627938","4","08627938","$2y$08$OoiacG9E0xiSosSZZfoPwei5ouwrLz8neaJUjvMmiqvbuxStbgvh6","jenny@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("09048980","4","09048980","$2y$08$kYixEL7JaG7RtJHUmN3eNuTBVOvzzAVPphMTfshvpKvRETf8S1jKC","ynmaculada@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("09378013","4","09378013","$2y$08$e4jpjvtHaWyXJ4/ffmHvEOYytGNPaLO1j5EmY9BiaN0gB/StjpslC","yelitza@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("09544153","4","09544153","$2y$08$Y0CSNle49o1Bea8fPaEmc.QHEwycuYGoapLTqT5X6/gwqOMcJGjnO","david@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("09579750","4","09579750","$2y$08$XgTHaAoVo/2l6/0I5c4IcO025fj1KSmsg0/BuAkuDPTRqoExSfhN6","johnny@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("09626909","4","09626909","$2y$08$ASMPctZUPoLW8bJsy8MJwuXoxCERxmD88Qdy2AXpdMd.tRR6bl3Jm","yuli@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("09708093","4","09708093","$2y$08$HY2qD7JApB4aH063P1hgY.D96AFolZfXMPtR1bvUjrvXu/5gZKoYu","alenis@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("10338520","4","10338520","$2y$08$/McvYK6jYeANhUOfumrDP.pARMaRGuiFS3RaUQUslYnP5RyS0w3JG","winston@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("10846059","4","10846059","$2y$08$TDxOu/CzNTSDgQkAhWTq0.eWPMuteRPFxpVKcotJl71iCnkHr95Ry","maríaalexandra@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("10849476","4","10849476","$2y$08$F9CLPl1Uy72Az9QqRul6Gu5MrzH1FdZW0YuYYvRw4AHksNP9Mlg/2","walter@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("11260305","4","11260305","$2y$08$jbgSOFzq85DZO.c2QL8xoeceEh.BsT/Bz5iEMU9mpnRkWH6dDAWSC","eva@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("11580182","4","11580182","$2y$08$SctmVhgAZid0VY3dY1UNDe8NFi0aPWU7iP2IUcDED9J2r2Qwvr.5q","endert@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("11587952","4","11587952","$2y$08$VCuHWwuxw9oWRZh1XkUsROdW4AoznfB..St36l5qcEeHXujLZ0n2u","alexander@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12026793","4","12026793","$2y$08$R4kdPsPTA6gKLY4hJRxvt.rco29qsbO6N6UqVppi2gVSK/E6wLKOC","carlos@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12244128","4","12244128","$2y$08$A2pVuI4uoU0I1qIyGIYa.OH23FbmY7JxklIsnwZxwA6ua7nIZLQ9m","yajhayra@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12534603","4","12534603","$2y$08$sH4RfJ9jmkWIiHsL5pqZTuR.30RFLeWFLAlzA0MohmP40oNPwc5LC","dayanara@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12630557","4","12630557","$2y$08$Pq0ktYxe3NlTBgezGmOQhe.0T3b.cHDY.oeJRxXivu8XIMRTt5cMO","michelly@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12698690","4","12698690","$2y$08$nakuY3VBvn5oZR4BPtpI2OwFll3meKpCXqjOccD/qBLVViPtoO/AO","maría@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12703237","4","12703237","$2y$08$t6agz8Bu3ndp4/1wAdO2VeD9IOr8s6CfGnjG99W4/CS3skobRHtnm","gizet@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12706637","4","12706637","$2y$08$6JMNdRojBAPLTTJW4adzWeRUh8gxxw9FposI6VpE/TRKIt79vnOY2","lisbeth@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12707546","4","12707546","$2y$08$/2tc9BQKH9cGSMK7ArLZTOWDgk44WIH3gIJaqEXbis77/VlgwMtBi","larry@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("12850970","4","12850970","$2y$08$fGXeErSES1ualH1kd8LP1.mEi9cJ1GJSXF6Jkr9F0Gma7CeqgZ/OK","sergio@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("13119423","4","13119423","$2y$08$02QlZ5CZp0i6Jss3tyvAJ.GCl0e8t./J4JITEBDvSlhQpCRIHyQPm","marvys@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("13189208","4","13189208","$2y$08$YLjLm97salCGSmg6F9mJQewEhGJQ/2or6/TmyIY1De0W/cHPFnlmu","orana@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("13509849","4","13509849","$2y$08$lq1LzVM/bcsnlSSu25uKB./G3FV1JFr6mwQoeA7i8Pa73fWxZvOsK","lilibell@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("13519545","4","13519545","$2y$08$5ffc6Uuagg4Et1pVgQkk2eSu.YIevD0kfs0vhYkYpnMknBv0BaWie","anabel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("14068853","4","14068853","$2y$08$Y5T3RuplYQgYHYQIUchwBucC0Q11YhBqzEemqD89mX.cyL440HGRu","gregorio@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("14228345","4","14228345","$2y$08$meilavs8CJvIJIvrBg0Di.FxUPCT7HEd4R5SBtifyMjCOJMD/xDAq","yennys@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("14262620","4","14262620","$2y$08$PeEDT/6SJCrSVqNja4f.vOD42NeQP8Qwinso6KqU0/eBIWxQ5U.ra","miriam@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("14749211","4","14749211","$2y$08$W8vum4HojhgFh6/BkeF5hOq16aXlKEdJNEzT/r4L712Sgkn.JJxGm","somarilis@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("14880601","4","14880601","$2y$08$IieKorud37YunH06J1j0rutVSDoFPpe1mq2rXQVQnmr5xZx1G6JlO","johanna@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("14979119","4","14979119","$2y$08$j7NGvcEsFg81go4Rbd1cye9Is6RC3iLqsc4XQheU073rRBhRXdwFO","migliver@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("16385532","4","16385532","$2y$08$ISCk8JM06tsWR0rkpylKYOA44HHc01yGpOFVpAROVdJEpemTEomgC","isaac@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("16867504","3","16867504","$2y$08$VSTrg8gZxyx9CLF/Sm7wCexslnze5T4l/aVckARHmBphFdEGi7S7O","nestorluis@gmail.com","","2","1","");
INSERT INTO usuarios VALUES("17379196","3","17379196","$2y$08$X6jcJEEyih4MiB1Ye5qScexLwobkHOEi/Z5zM0J96UDmZX3fEzhH.","gelisayoelin@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("17380408","3","17380408","$2y$08$5iGkgdVrYEAcXmPNvXOcheTsAM6Jx/oWMB/N8/5et0D3OznjjSJky","italoeduardo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("17612167","4","17612167","$2y$08$/zyOWF6qkUHelA156rO7aebjLubqu6Vl6BPyrkNt8Werb0V03IuCa","francys@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("17626769","3","17626769","$2y$08$qtxehe/1u8hXTsMt4cNn8emqAGd3WxCLB8u1fluqR19RmMGSdZdzy","kenianbeatriz@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("18059528","3","18059528","$2y$08$/.wFRe5jxgWQnVy56zBdJuY.yqHD0rvQKgndp1N71qoqAL2gnBTBS","mildredjackeline@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("18226221","4","18226221","$2y$08$Vyck47rVvhOHuN3adhQf4.8BYyXmepWySDyVwzZu4V9O6NGPAIsm2","glennimar@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("18690684","1","Joan18","$2y$08$6eOkZ.zzRzbr/fzqS4Y8VOTewPoC6iRKQDwLZ69/d.D75vpgyKmG2","joan_manuel@gmail.com","assets/img/perfil/18690684.jpeg","1","0","");
INSERT INTO usuarios VALUES("18917274","4","18917274","$2y$08$fXjABVBcOwUf2L.AxvZ99OnCjB9oRb0Imf3GokAhUuViKGCVnEzei","andrés@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("19106390","3","19106390","$2y$08$dy7DM4B/K7tJx9kMit3pl.1QvprbFp05Ph/.mUKQkvwoIntNx3Ijy","yecksonjose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("19241105","3","19241105","$2y$08$uI1zGNNK.UWU1MYVSl10GuloxIkdgBDhec1ho1WdKk2LjhhHlicaq","josephkerenskin@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("19262335","4","19262335","$2y$08$8fEZXo7JFdUlfBW2cCHTr.E27VICdmQ7ZnSsqxJYqwpWNUVOZqoMC","aldo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("19591089","4","19591089","$2y$08$wy7yt.24RFAXHlrLglVgPuKPDq7wfeZ9Q9B4fSoc8wSDgGvKxWPbS","carlos@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("19828762","3","19828762","$2y$08$9gdTDtc9Um1sPLPcDY/A9..SgFgxlc/9RaTksVfpxFrXylJLLVy92","josephabraham@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20045024","3","20045024","$2y$08$J5Coobdi0ToC8gNb6vE7I.MBJLLbMZfc/Au0Eh5nZlDuxtI/8oFPi","barbarasomeidy@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20234290","3","20234290","$2y$08$HdZ/AdtvPo1qKxKSnw60Q.vVc4dmhVJVgrpRN1lpu4q8R85wnQHFa","héctorricardo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20237123","3","20237123","$2y$08$pROFmUSrkeUw7s3dxNQFDOsevQuhObuTPt5XCMTpa1QPTIk7Hwmx6","rosalbasalvita@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20321693","3","20321693","$2y$08$2FHQlm.x6rQEiz4YsxhZiOOIl4U0EjubF/af1OGUbrvxbw.d8dmPW","monicacoromoto@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20472224","3","20472224","$2y$08$Cv4XLMMBWhyqbGD1X5zb.ub61V7L.MMHv25fjz2tNWnStKuOpEXn2","ritderjose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20473487","3","20473487","$2y$08$wgWAU1oO5GeY892JHMDBIe353iElSt81m5iBs3NZ3DfdiynyefooG","irenecarolina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20929586","3","20929586","$2y$08$6v7kSioJcR9Ui53l5pquDuKSXdUoWQYmB2UGxh9T11XDzugCzZr6K","estefanydaniela@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("20929799","3","20929799","$2y$08$E7Q1vYFhdXZxP8CF9AhLdeqFPbguB9jdtb.61Gep8cX3ofHv5WUhy","yonathanjesus@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("21142765","3","21142765","$2y$08$NbjalIYqG5/zeebN8.mI5eFZLLurFrWNjI5bRm2369JjC.MOg1LT6","josemanuel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("21243104","3","21243104","$2y$08$rEqmXk7DXlaLFpJK412aPu0kXoYSZjJiEzMIpB7E1oYPiUIbBeyqG","katrynroisbeth@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("21506407","3","21506407","$2y$08$1HU/q5gZl0QW1socoLohcuFqqLETfwoQSmaS3oVdBtp3B5MAuekCO","doriamnysjoselyn@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22189205","3","22189205","$2y$08$JGRdUen3grv/AZrKaSRFc.uNxRL.yq905yyPtkNvTCvRV0fjdv99O","yohelisrosana@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22190822","3","22190822","$2y$08$9W4KmZ2tlETyTLsuHpgT2.slbyP8H1QR6QkujcoawhIx2PcbETmLO","ludynohemi@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22200606","3","22200606","$2y$08$UfXgEzEmnkfJZPLk/cj5DeShTEBCnpD6s9k13YssXWswEtkVDnEAK","ervisyhoandry@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22262565","3","22262565","$2y$08$FfR8Hmtu7jU4kvfSWfRsXe3hFKjUfmRxdtlPFcks31lUM6zRW7rKq","lilianacoromoto@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22268744","3","22268744","$2y$08$yuCi3mx1nORcRXNzfRZMSOUlsiZaTD9qpk.Wg7motQ7uCXlrNtk3q","mariavictoria@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22301153","3","22301153","$2y$08$lWz1L29HZ/y8RXYyusxb1uR7D.u144dcJ0gyaXpn6nGFuxGcCjdZu","leidylaura@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("22329093","3","22329093","$2y$08$lhhJRIEdkEtmCcil4C4AkO7vSR1g8xCCqEZcuB8jo9Z/MNN7vJAY.","dannelyskysbel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23488197","3","23488197","$2y$08$DffeFdQQYd1QppbhMRTWbOLnxmkgQF6IQTYaddr8Qfa9VlQw9Ma8G","karlamaría@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23488905","3","23488905","$2y$08$C2h3UVOMGxsgKgewXUYa.uXgV3ZBU3VjNIXW8VtTX1XeSwHRpaiiC","jorgeluis@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23537673","3","23537673","$2y$08$3MVPNlDHruyNWAe6AScA4uhJ13oHfxVlm.wJm3OHPpgyFJ.pl5sii","yudarlyatzara@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23553977","3","23553977","$2y$08$5xs0tNFOFfac5yQ3eAkbS.5rsnnMPUQo2p9Vbo7cirqpQaQITd4yK","yasmirethcarolina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23833006","3","23833006","$2y$08$BMGLykqhSoi2uaNOwSfmLuor3kYS10uFzNZLA5wHIEqcoIMSNvx7q","elimerfranchesca@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23850416","3","23850416","$2y$08$Bd9n5diims/OVhkdoLyqjuuAVqMBMyFsJtbJLE0IURWW2h0l.AuU6","jeanjosue@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23850558","3","23850558","$2y$08$MqDWfvdpw4o.zOqn9HDK6OXVkVB7nfDT0wk7D1D0Fd88tEkmOeSFe","angeljose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("23917833","3","23917833","$2y$08$OpU6g3D.Co5c5JhQkNwDnuypuG.xjEjAEGEFQCdHVZeLMN6CptKKq","maríaalejandra@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24155221","3","24155221","$2y$08$/UzfwbZK6yt.jxm/wO2OX.GUuB4s.3Ez90LZGuaPquv83GT5MPjfW","yahinjose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24157778","3","24157778","$2y$08$QKEDH46K6QxD1l2eyH8/xeIfYW7fvDHwU0NFzMFt3SyoeLqve3cEm","miguelarturo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24160658","3","24160658","$2y$08$9h5OEfdUgzNIcvo/j1Wq4ewiW2.fEO6.EUAKLaOIjYVe/hhWbEPSO","victorjunior@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24325718","3","24325718","$2y$08$KWpmeeksMzLObLxG8BGKceggCYw8oevUc/QF3h/YLpvjk1hK3v486","richardavid@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24326463","3","24326463","$2y$08$nVJ0U1ctJCp/0s9rzo4Pp.fY11G2vlxhmGTDhh8TRTOJfRiYh2o/K","wandajoelys@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24385111","3","24385111","$2y$08$BcvxnSPmdppUGY19guJaIOt1Sx9npjnfPGC/Z4N.KgwuY.ztCbIMC","dannysalfredo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24418470","3","24418470","$2y$08$UGXb78p5nlNc3eFwkFwtfeShI9jEe5mOIgkTG81JJRNOJ/hqk4eFa","diegopastor@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24550321","3","24550321","$2y$08$0aTHrYo0X/XYWb4.ZR8B4..IIcBRU85xHwXXhOfvKb4aZWbEoo.uq","roismaralejandra@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24613886","3","24613886","$2y$08$O4/hrx1pWuF82J1vs7YEou5Ky48yRv2Nj0EdZvMO1d985o1VmRa7e","luisfernando@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24928079","3","24928079","$2y$08$WKVJe.6jyr2jf9AZfHPWAOwS5lRwW8ajbTToT3PnVqcq8K6G8sloa","mariarlysjose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("24990010","3","24990010","$2y$08$JhvmHByBLhAGx5zcSStjSuY2ohPMpvHY3iboBIcrs8aI7n1AqoTJq","wileidycristina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25403600","3","25403600","$2y$08$WYCM.sMMh.RHVAnqflwODuN03EccG2v.0oHl3THUlLnwI78NWsuI6","emilycarolina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25442453","3","25442453","$2y$08$oCJloauFCtladzCS2Y3APeIY1Oor8BtGeG0CICMz0O5gey9uOxk4e","yonaikerjavier@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25474327","3","25474327","$2y$08$EUOH87gEA1DLQnXktSsO8.ptpGEbEndTl2mPGpcqrHs0q2wtZ.c..","adrianakarina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25571829","3","25571829","$2y$08$/YUCYTJ6DhzyNuybn//.KeId.vbeHS5xLinPACDO8JrLbw9VSFW9W","pedrojose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25638923","3","25638923","$2y$08$quoGwbO3KkClb8eaxpQHDudySRHgBEGBX.2Blqb.nt44AECxIi5fS","catherinedelcarmen@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25857222","3","25857222","$2y$08$7mM.0VwSKqnzlTOy8ei5IeKDg66jlOLJX/MCGPfsG0dX5fshaj3Qm","rafaelramon@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("25857600","3","25857600","$2y$08$uavDCAo6FXt3D32jtpbZdupttQJS.oqHja1U6xsQLE/x7jcDNLE3G","isneidisyenire@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26076292","3","26076292","$2y$08$j6tiESCysADBTasoq1qbR.9cGNzfLhRk8q8R0vGv4zvJIAxrLlkB6","omardejesus@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26260221","3","26260221","$2y$08$Y0zoVOyZCH/q6ifjE4qx4.8jMWu0ejYlSvggYIX9UYd9b.40e57s2","altairsarahi@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26358018","3","26358018","$2y$08$iiTcc.5YeuQ8lpOtjWgayunvHJEdWnxnRy2Db1F2lSg2w.rjXC0fe","mariolykatherine@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26370091","3","26370091","$2y$08$/CWKmyNOqMJfC3mk4ykOMeyuikRgPlLwnI8YcmZymxjJHA81.s8aa","blancamariana@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26370490","3","26370490","$2y$08$VRRlfVRNEvDNdlVYh1Tdg.6Zn.0f2YaERYro8T1QawxVQr70VBn2i","paolacarolina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26398233","3","26398233","$2y$08$PZE4z/LX7JeYf0VAgwPaA.80vapo37q6NVlw/jI/oNuzSe5L3EGqu","anthonydaniel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26487568","3","26487568","$2y$08$5174Fqf/Oy1Xyuz0hs9IT.aL.hG4pkms3N1CCrAVipsIY/Bxqy3Jm","ambardaniela@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26540740","3","26540740","$2y$08$NKT5pokhBRTjXb717LItguKS8JP3Y8JytkfUHf4lG5Zj7UXZ4/Yv6","nathalymilagros@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26644449","3","26644449","$2y$08$peZyNBBw/PS4hmMD/x9k5OxjL4cs3s2/iw4unDemiOqoHXpTkqeg2","yiselnataly@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26750721","3","26750721","$2y$08$5JCMA2Sl9Hin4FeheZ3bUecXpOpLtV6M27bwwH0wJRcu5PREOfXfm","francisantonieta@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26799164","3","26799164","$2y$08$SBtP4rUBq2igatyd5FTq/.cQRhVy0QTJD9hRi0h7WbDldpEfR8EAC","johnnieljoalver@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26800684","3","26800684","$2y$08$v1eViXvi0uTqCuTItVSpneYTZ7YjBWUQF4cGpQzyYPHzD1KI2WoSS","andreinayenireth@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26898084","3","26898084","$2y$08$r68LbGz5W5j/0zX8qe23LuDWCLHnuwB4th08PAFuBaxEKPhW9Ltpu","alexandermanuel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26941019","3","26941019","$2y$08$b1LygvHtrZDJJRFQUZhZYuLWH6FWrP6g9vHumk2Mm.Qvnea/TO3A2","nailibethmaria@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("26964485","3","26964485","$2y$08$epDz.PddSaMcpj7PKuojFeBcysdWwszZYN/FoCjDuicuVSWwf6wVm","marianaalejandra@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27085726","3","27085726","$2y$08$Qgx2fO5aDbJOTm4YcVBA5O0mzq/0vFEAF3wwv45BncVxgh1UaCIOy","greidymariana@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27193391","3","27193391","$2y$08$DR04cizat3eh1JIxlrqe5./4fyWaNwp5hvHDsdC0LEfKv8EaSLR9W","nestoromar@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27388907","3","27388907","$2y$08$VCAr7bZmkCfVqICw8Tnx.OXcY0SvOsuNAnRdTJSq/5/y0d7NRkKaq","luisdavid@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27436972","3","27436972","$2y$08$WCLWn7bzqP902V2uMy.6xOeMuCRWqNw25kPcn/95hllJ2DsCmRVRe","eddimarnohemi@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27524468","3","27524468","$2y$08$G05XAnUhBi70uA.n3rW/..W2myswRd7PLG0YagQJY8q6E1c5vvj5W","yoscairyandreina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27586609","3","27586609","$2y$08$r3wq2..PhpZ5M/Ujk/DJAOx3zZKuw.usNGd/Kq5G0SDPh/9TD2H52","leydimaranais@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27666883","3","27666883","$2y$08$fYAr0aW8raRpVA/3UrRuLeWbAj/.umqmIIGduLkJ8jfhfem0alQvi","joseleonardo@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27737767","3","27737767","$2y$08$Lmy0r/k5GiFek1aO8qmHy.GhKCyrb8Zh//B2Qi8MxFgkytjJ2tiO2","loriangelyadrianys@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27759611","3","27759611","$2y$08$q7KMFszwX9sJEp4qEx0gWe7PK3SqjbvbQ6C/SIs/.2BREo9HN9o32","emnimarandrea@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27827122","3","27827122","$2y$08$rhUBbpqntLR2aRZvTSNn2./E9Z5hB7TNuD3GeQlRjaFOB3VCgsabC","mariadelosangeles@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27829899","3","27829899","$2y$08$wvllpmdPArUMnHHkKmZyAOvnvglnVuqt6YNiIKdSEcVUYymbfzGlC","yessicapatricia@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("27831006","3","27831006","$2y$08$99pJFWEjZBloQ2hEnAgoT.8QURkNUW3xtYeGD9WprPE1C47AZc7yi","jose@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28019593","3","28019593","$2y$08$pgPx.4aEyb0SOBesEF/JIesZic7fRBCdDq/l.QOOsciySn5Xar4TK","gusnellyalejandra@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28020528","3","28020528","$2y$08$c98UMhodXO342/4gm5cD..Zpc8vAnGt68MDSXlgnUK0UNu3eqMxQa","karelysandreina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28165974","3","28165974","$2y$08$Qbg8.ebQL/EuJ2BAtgA7Ku1NAJaiQoD8J94jy5bGE6Ezi5F7R5Hwa","yoselinjosefina@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28256888","3","28256888","$2y$08$chlwAxNToyZNvKC2h3ZoIe992FcVhSv7Wr1HWHHNZNQLQXM616aU.","heritmaryoeslyn@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28259658","3","28259658","$2y$08$Y7H6je8myIcRpyPpXaNBPOt8bE/uuX0JgwMdyfJUAahvRots1Fqm2","mariadelosangeles@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28286679","3","28286679","$2y$08$NK0iD48zPTGhvq0wraWBQupcnz3B5n9bPsJtQwwxGCY1UJOQk5dTK","yeilymariangel@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("28653762","3","28653762","$2y$08$rm8Enw2nrv4IbOQ2PFdf5.IaAn373I1MVjOZKMTuLzLM0CMH7wUDC","abrahamdavid@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("29517646","3","29517646","$2y$08$B99Tek.h48ISh2u4REViMuU7A51pGs.eW6X/GuH8I1cDqCzHA.zde","albertojesus@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("29707357","3","29707357","$2y$08$8a9/4Gjm2xcW1s303fb56ukdyObEPcc5s47CyIdgxriv3zo2jegvG","carlosalejandro@gmail.com","","2","0","");
INSERT INTO usuarios VALUES("30621621","3","30621621","$2y$08$.7iwd64gZhcW0Q.XgmyIo.vTq5p3vf5lW4.AU4rReWj/SDO1hLJOO","camilamichell@gmail.com","","2","0","");





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

INSERT INTO rsa VALUES("2","18690684","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VGl2WC9IcDI3cVRmMTR6NXgvQk9TQm9obTNReTI4QkxmaXVDODBUWVZHYk0vZ0tLN0VHOEhQYlBpL0VuaWZGNngyVzNwOTBWTTJYUEhFVlh1Q0p2MWkzS1JmMjhRSG4xb2lLaHFmN01VRTMrdG5Oc3ZMRzVWeHMrakQycXAzWXZGQ2ZLS0piRjJEY3NuNkR4TktDd0VjT2YrZmptRTR1RmgvRGJSUjVSVEhvNGkwc2g4YnQwcWk0bkF4VTBsWlh3R3U2RUlhdDBhWUFUSkFQMWtyTE1GNHloTVVtaEo3eDZlMHIvdG5oeXZBeXJQNHllTEZhZWJlVEhwNFlKUHhoYXc0UndZK2VOYlNIOWpmTlplMjdRem9vWVlUUlloaDRoMElSQ2lpeDFEM215eHJKTXBkbEtBbDNWaGJPdVZJYmxzRk1uSUhzS2xzYjgzVU41RlhsaUoyYkhnWCs5ZGZHUlhWbTg1QVRYSTNNNGxndXpyOUhrU2JGb29YeGVyYTBRSUxxbDNJYzBTU0RwRlVwVGNyZmhWMUViZDMxeTV6eHZBKyt4YXdWUWkrTi8zNEpablRXM2s5RzFwdUN5SDdXdkJRMEZLUHk3Nk9mNlpzRkszanp0bWp0ZE9odmNDVTFuMktnM0FyMkkxT0RTUkVRaDBTVURxaWJrenZBVWlDUFJGTUF0dDJpdyt4TkczSWVPRjZtQkZLOD0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZGducWg4SG9NTCtieTB5WjdGMlI5TFFPWk9aNXY0bzk0NWMrVUppdjVhY1Bvdnh4bWtTdDdBeDJDU3k0RHI1VlRjeTVVOUpYdUVmV2M4dEZieXdXZkpMNEtrbFpLK2dxTkRKZk40M2FmL0wreVRzVUNjK3pFS0M5aVNURkJmS3ZpeFFqRzViUmFGdXN3ekZLcGVmWUtJZlNiQmpFS3prQmpUT3lsam9DOHFaUDh2cjh1dmxzQzMzREtyaStDR3hyWkVKR09aOXYwZUpGellXRm9udGtVdlRhUzdmU2ZwMTFUYjBneCszc2hHWG5nY0VKekF3MEsrVkEzV1JRNDduVFRJOWtmUXYxaWRZL2IzMng1USsyM0tqSktJRXRXUGNkTmhqaTI2L3dHV2FPaEVzYzlpMGJKZUVkRkFydjJSRkVjNXhiMVROUjBNcE56aVp4b3FTd3ZwZDFkaEFyS3lrUnI0ZC9yeU9KMWhUYWp2cjJaZDhhNjc3bkdlY0ZpenRZV3NWOFp6REl1M0pDNHRnbldGNnNOWU9yZEVoTjN4L1ljdjJlZUZSYUx6bUhoQXVOWnozYy9wNmR0UkJNY01yTHRvM2Q1TlhDL3ovN0tZTUVHcTAyYzRGRytlcHN2QWgzSHFKdmFXSjdKS0dBbGI0RURUMjM3TWo5Q0VydzhNN0tjOFBranY4cjRaWkIrdlQ3dEZzbU85L3JIUzVlZUVqZUM4bjY3VnNvYWdHSktZWWVFdEFhblhqN0ZPR0FnK1BuYTQ2TVJxcGZHT1pmL3hLajBoVGJEV2NJeGRjTVJTMlliWXl5cThCMVVMSG1uWWoyY0llbEo2RjI2OXZWcFBVU1pzMWtseVcvcitxN3lWdHA5dkdZMGJSaHhQOVBmVHlPRnBicnVicGVSK1BITTVqOXVjUTZJOXZEZU41RityOHY1bDF1WlgwYm5QTjE1ekdvQlBvcU90aGl3VTVkWEI2cURHRHVLTFpYOHpkME5MUytwd0tEWGRCTldkdEFHWVhqOWJPT2xwVUpQUmlCdmVUVjkvNlVsR0dVYW1EbGxZSGV3U09Ga2RQL2wzdzFxanZUajdtVE81RHU3L3hKQk9WMlhzaEpKUzdQY1lEQTBoYlFQZmdoTmQvZUVCUmZqWmx4Z0loNXFpbTZvZ3lEcCt3Z1BFbnNsbGFtV1pJdXNkQ3ZSNXNQRWx2NlNwRG1aOG9JT0R3ZFRCZmpQNS8xVHVyRm5nT2lPaDVIWnRDdTg1enA5WEVQaTRselk5OEowMUltWkpKQjI0dnBpWjdiOWF3ZHcyNjNTb2g3bFgvOHkzcUgyUWFncW9FWEpRUFYvR0pKWHFMNnZFdmJhbCtFYm81ZDJ4R3ppYU9NZ0ZtVkdMcEo4Q1cyZlhjWVg3dnBzRmRGL2VRL0k4eUdhbXZNVFByL04rSFZEclZBallBaWU0VmpNODE2eFU3ZnlQSytlRXpFZnJGTngyQlU3OGVaU3RobzlZNWFvbS9YWHg0eUwwd3RNcHFZNVhoMXplT0VFcDN6aE9MTDBXOVhiTHRMaVRsbDRkYTBPREo3aVRWYlF6Rmh1OUtWMXZLeUt1bEVEVGRzYUVSNTVlVkpMdmUyVWF4VnRqNFFQKzAwbkdMK2gzQ2tCQnRJS2ZZOXJYQ2Z3Y1ZILzQyWkNka3JrdzhDR1FDNG1BbWNQaXE1ZTVKNDE5cnQrRmd5RXVJalE0NGhoMFRvc2hZNGd2N0MxOFU5VDh0eHJuMVczdHFEV2JEd3diVWRVVm9YZ0VoeGpyZkgzWjNxSER5UldLcWhpRzVibC9WS1hjVkd6NXVuYXZiNmhZWFZ0NGNEcUhJTEprMTlxb2h1a1BUR08xM2ZBQ0plWmVsNEliZlNuRjFTb0s5UEFua282TzlLaE9CUVUycjNZWmNRTHpkdlVNanI1Y1VwUEVSYW4wTEtjRUNPdS9GUGJJM2tlMjhQb2xqMkRxaXAxcDFqSXk0THVGM0JYK3I2WXFoU3pRTXRYbER0MVJNcEl1UjJiWkM4QWxhc1ZacnpNcWJpQUk1a09BTWFpd21LK1pVS0dvbXBXajJjQkxEVkVXNjNIUG5wY0JWR3RBbWFncWVKVURIMStadUlqREZjRjNFSWdZb2lHN2JhamRlNFB6MjAxajcxdFBVQ1NWbzJlN1d6OW5BSU9HbWZYKzBqNm1WMkg0dG51bDhUNXI3OFRiR0U3WjlqbzJ1Ti8vUWIycnhVQWtQZXRVa0YvT2hDTGk0SVoxRVR1VEZFdHNrVm5EOFgwN1ExZG4yaXgxQ0FpOFdQWlN5SFFNTExSQjdhemRJR1NvZXcxdEkwWUplZitUcHowdkRoTVQ0YTkvbmYzaGtKWlpyZEg4R1NDeFM3R1FoSE1uclp1bjl2aHhnYXdwRU5kblFaRDB2TEYwNnZ0NVNuS0xBSUFzd1VEVjdURlZ6dTlHeWpIOVNmVVFwQklhMjQwTXJ2WFVCVzZSVFRXNE9TVUtXVVliZEN6eFV6bi9pQzVpbFFvOUxDREljNU1FOE5nZ0pwVG1HR3J6Qm12QUswbzd3QjQ2aG1IbHpvWDhTNysvSG9YaFhxK0dMUUgwbmZVY3oxUVFYOVB1Kzl6bDkxTDZ5K3pCcW50Wm51WVhMdzlsMnEvcUxOL2FaTGtkSDhsWDdnR1pXUDJuanExZkdsb1lnK2xlVVVaTVQyMkoyNkZGekM5aWlqVVMzNkxOZUJqcWRoQ0RxVnNnQVFSdjdCK0pvSXFzZTQyNEd4YzJlMVlaekZTYXR2Z2NxS1pmS09jaVFpQmRqR3RQd3lzV3FsTkxjb3AzMEo0VFFzZXgzV2lwajNscWErQWJxR3hudW04QnE3QUd0eHBWZkhMbXkrYmJ6dWN4bGJBelVGNjBrZlZhWnJJQmZoVGNQSHFPNGFmbU9GcUo1VkxHRWU5SUhkYTFXNG42RFBaTG84PQ==","TlRpYks5WXppbFRlTys1cnZ2K3RqQT09","2023-01-03","1");
INSERT INTO rsa VALUES("3","07132428","UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VHFNQU9GSEw0K2NPQWJuTSt0MlBVUC96Wkc4a0ZmMmtTTGpNWi8rdDBvS0RNZFdtMzFmdXRCNVVteWd2YnR4YjRDcHJCcWxKWjk0VDZ4V3RjcDY3YU5RMm5FNTZ6bnV6cURzVUhhNkxzd3ZYc1BLV29peUd0QzlsNkQyUkUweWRQTVJxTlRPaWdBZEM4WG9PcngxaUF2ZFFBUW40TWdTMzBUVmEvWWRyWGovZGN5MllkelZxcG91bW9vcU8vT01QWjUrL1Q4T000eFNKNmtONlFvOExGajRCOHZyT1kyZVkzVXlCQUp1TzV6Qk9WWmFrclZTWUg2dGlaREJTN1pEL0J2YjJURG41cVRzWENVT3E3ck0wdWYzdlZLaThkOG15Z051eVh2THZCa2hWSFoyL290ODhxRG1uZWxxZnZTSlBIbEROMkVCb1VmZTlkR1Bqb005emJNNVJtUFdYMmxOclBIc2VEenJPNkJNM1hHdy8vVjNnUHBlTnhRNGtkQU03cFVFTVcwY2l1dUFkZkZKaXBqMjdjU2ZqaW0xNjVuMWE5TVdVUlBkdlJmZDFEbGRLZ1UyclZhQzZrcUxVZlVna1JsNlVPQXBIc0Y3L2ppOFRMRVZlUEJSditTZ0JYdXIxbG1RdG9zTlBwcUpNY2t3WG5ib3JRbGo1R2xCdnpZdndITGJsUXYxV1oyRVkxcDhWMWZnQjllTT0=","ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZmVqb0N5YmVxMEFuY1FheFlMS3hqT2dLMmhXbXFHYU11bkNBZmtETVVVbFBzRW1rNk5QVzZwT1VpZld2V2Q0emJWWng0RHorVkpYZGRDdnFUQlA3V3pZUy9BQnlMcE1PVG9nQStkOFUyOU9xUzl0U1U4SXJJNHV3eXg1ZTdnbzlWL0lLVWkwSkZ2ZUVYMDA5VUNPQmN2aTF2NWdiZWFMaFJZUFB0NVowc0ZrMlpGaUJBeFRpUms0Z3RXdVFuY3Y5YVpZblY4Y096OVhzWjR6VUpFUEJSVGFNcnF2MlpOSWNCbWFobXdBQTVGZlpTeklWNndpalEwMFVLN29HVkxGOXh3c3Z4dTNlNG9CUXBuSUFNbmYxekM3ZkFOdlRqYlBwYnc3eFZKdmxxS2lybW16bWppeFQzT1FKNUpKa2N3OUw4UmdQblpZOWFqWFdjdVpDVGRtUEFEbzR2VW5FT2hoVzBPUG5VZk9EVDFtcnFPVzdNRHVZeUhLTkdscEJRcjJ4cHB0dmVKKzMrdGwzdE5iOTBiYkMvdGJnMG9RMmtQaVhiTWkxT1BYd2RpNmxqMkxNbXc4cUVNT1dmWWRLT2M2VkxucDVsZEhsdmhhZ3AyM1pGc0d1MW91eko0VUtvRkY0STdiako1TnBCK0U0OHhLcHMybTRseTRnTmlKR2tDSGcveEZuRUFqQWVMS29WTnpUajlLWFVVcDRvOWxnRW8zYXVVNHhqb2lScWRvc1UwSFpGVFNzZ2xJNEhSM1ZjMlNIaExRbFZSeFlrejQ3WTdtTWhmTjZtK1RodjE3NHhGWDczN3pvWXJhKytYK2Y4dklvSk93cVdiQm9lV3dUWDdhbUhCRHgrME1JWUQvTFFpR0JVamZFL0U4bXBZOGhmK2xDTTd6SnFCczZDTGtZQVY3bFFlcWpHRUFWM094Qm1kcDJPS1VraGpHYzNXMlAyb05ybjRyZzFtbm1UdTh2UTNHTUJvU3EzYnNMaEJJNkdWQk5sQXQ0b1ZQbDNhWmFxMVhpaWRvU0NsZWlOeXVBU1BEV1VaRFFFT2RHL2dEVDRleFhDYWxWWnk5ellWSWFoT0wvOGdZSFpkNVF4b21iT04xUXJIN3lKTHlpVXJqUkdMQTgrZkZFQkJ5L0RSSGNFMTJ1ditrMjUyMXhQbnIwdmt4WGFENldmd3lJNnhTck9nMG0vSGZpVHdYRGVySjV5eTZCL242VHJEblhBbnJFY0szSGhveHNVdWhSbEo3Q3lybnBySUh4TjQyZ0FaUVUzYUcyVDFyditiby8vZXJEZlRTcGQwM2VlSEF0UTB0ZmxwRUp4Y3gwT2tQY0RwdHN4THI0MERueVZPYUhKbXE4SS9ZOHZkbmpsRjlvcGk1R0JoN2g5Q1pMVWZvT3VvQ2N6QzlhU0x0dXduMjk1M3hJUGsycFdPQUhsNzNOb3pFM081ZS9PWUx2Ykw1OGpyM0FEak1Vc205T0t1T2JpaTBWdkw0b2Y3TVBmYU9GWTdaZVJXQmJrd0cyM0RpbDVNNU4wZ05qSlNhOGxWemdLVnluU2ptK0VNNG1kOVF3QXZHVjU5bW43SWUxR0ZmQ0VmRjJ2dWlqVkUyd0o5SjQxbVYxYTIxTFJ2QzlDQlNUdXArTWlzaDE2TUNXSzBiVUprMVIxT3pvK2kvOXZzL1hpazRNZ2NMNWdPV2tyZ2lXOE5jd2lKWnZ2WS9BZ01XWWNYTXZmZEhCUVRXaE92UktTNVd2ZnNHemF0VGxWOTZieHZ2U0ZSdjV0bnNOb3NGMmNFWUduS2xTNGg0b1R3ZXNFY08zdHg1R25pbmhtTEpzb0JDdmp2SXA2dmZlYmthaENYQUIzMTRwSWFYR25vZFRnMlVYV3VhTlVCdm9pWGFRREF2WC9EN0RqVGJZUHpublI4RXJMTlRza1UzdnR3cU5tTmM2NEgxZGlaYXZ0djZnL3JOTGRIK3Z1clVRUVVHRk9uVWVrNXlNbXliNkFRUi9TdkJrbzlTOG03QUlCVFhGN0FERE40dkZralF1QU55eUVMd0E3V2haSllPZ1JSMldYcFh0b3JhcURPRFFaQWdmRG5IcW5VUHMxZVI4NmNsNExKdVpwODducEExalFLbHNZTjYyMllxNlBqOFNSdTI2MTQybCtKSFBVM1dXYWNzenc1OHJOTVdSUE5PWDFLQjBya3RBWWx5ZXVZc1RVZTZxYXY0eStsN3dtK1hoNUNmbVJXQ3NraEZyeWRFQ3lKNFY0NzdwM1RHeEFTa1ZFKzF2VFdmZW8wTXR5eUViSzVsS21oa043OXJXSVp0ZE1BT1dnQ1JlS0cxcW5sckdBeTVjeFo3K3RZWU92QzlzSmtmNU5RSWxSVFR5SGxrWFlHdGdRWGRNZ2JyY21jU3J5QUN4UFJiZUNzK1U2c3Jxa1Fia1BFWUdtM2J4WWlaNFltdUEvalBwZCtJMGxDVG5ONlpLMkJjL2V6MVpWZndiSjhCcDdXdjVFTUxpRFVBcnpCY2xKVG5pbXp3YkZ0L2RlNkJncWF6RDdXRkhpcXU4UmRua0dLSHhVT1dkWnVoRnJKNG15SjVzbmRxQmdDRlRhWHNDdjFXYXNOSk4xcVJ4MmxGRDVPRTdJQ3RzcFdRcSt4ejlYUDYzVHpLd2VEQ2VrMlpiejhjYnJxOHdYdXlaMmZyTklMRCs2Zk5UdVU1Z0hZSitMRWl1bVBxQk9BcHgwRTA1MEJZV2dyNzFReGFGU0g4Uzl2ZUdsUVMzLzY2ODJzL2xGcUdRa2hGbWw1YnB6Vk9rdXJKRnE0SnRRd1BobXhkOGUrYmpuOUtjd3haWVpJb3hjUjZiN0lGOC8yREVYV2xoRXlxcnV2VENmNmdNbXVJRjA4Nkdwa21uSnlnZkF3ZFFPRHBacWhnaHI1aXFLQ2xmZGUrRHJKUXJoWUFNcjNWYnpxKzFhZHJmSHJYY0M2RXhhM1p5NzVBWDdOSzJqMFozNjJydTVPN2M0PQ==","cllmOFBqeXZZcEVRMjd0ZmJxMFVIZz09","2023-01-03","1");





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
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO bitacora VALUES("107","18690684","Cerrar Sesión","Consultar","2023-01-03","08:07 am","1");
INSERT INTO bitacora VALUES("108","07132428","Inicio De Sesión","Consultar","2023-01-03","08:07 am","1");
INSERT INTO bitacora VALUES("109","07132428","Preguntas","Consultar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("110","07132428","Preguntas","Agregar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("111","07132428","Inicio","Consultar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("112","07132428","Cerrar Sesión","Consultar","2023-01-03","08:08 am","1");
INSERT INTO bitacora VALUES("197","18690684","Inicio De Sesión","Consultar","2023-01-04","02:08 pm","1");
INSERT INTO bitacora VALUES("198","18690684","Inicio","Consultar","2023-01-04","02:08 pm","1");
INSERT INTO bitacora VALUES("199","18690684","Cerrar Sesión","Consultar","2023-01-04","02:16 pm","1");
INSERT INTO bitacora VALUES("212","18690684","Inicio De Sesión","Consultar","2023-01-04","03:30 pm","1");
INSERT INTO bitacora VALUES("213","18690684","Inicio","Consultar","2023-01-04","03:30 pm","1");
INSERT INTO bitacora VALUES("214","18690684","Cerrar Sesión","Consultar","2023-01-04","03:30 pm","1");
INSERT INTO bitacora VALUES("215","07132428","Inicio De Sesión","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("216","07132428","Inicio","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("217","07132428","Cerrar Sesión","Consultar","2023-01-04","03:31 pm","1");
INSERT INTO bitacora VALUES("224","18690684","Inicio De Sesión","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("225","18690684","Inicio","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("226","18690684","Roles","Consultar","2023-01-04","03:32 pm","1");
INSERT INTO bitacora VALUES("227","18690684","Roles","Modificar","2023-01-04","03:55 pm","1");
INSERT INTO bitacora VALUES("228","18690684","Roles","Consultar","2023-01-04","03:55 pm","1");
INSERT INTO bitacora VALUES("233","18690684","Reportes","Consultar","2023-01-04","04:05 pm","1");
INSERT INTO bitacora VALUES("234","18690684","Alumnos","Consultar","2023-01-04","04:08 pm","1");
INSERT INTO bitacora VALUES("235","18690684","Reportes","Consultar","2023-01-04","04:30 pm","1");
INSERT INTO bitacora VALUES("236","18690684","Alumnos","Consultar","2023-01-04","11:42 pm","1");
INSERT INTO bitacora VALUES("237","18690684","Reportes","Consultar","2023-01-05","01:27 am","1");
INSERT INTO bitacora VALUES("238","18690684","Usuarios","Consultar","2023-01-05","03:44 am","1");
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
INSERT INTO bitacora VALUES("352","18690684","Inicio De Sesión","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("353","18690684","Inicio","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("354","18690684","Alumnos","Consultar","2023-01-21","03:13 pm","1");
INSERT INTO bitacora VALUES("355","18690684","Alumnos","Agregar Desde Excel","2023-01-21","03:28 pm","1");
INSERT INTO bitacora VALUES("356","18690684","Inicio","Consultar","2023-02-08","10:39 pm","1");
INSERT INTO bitacora VALUES("357","18690684","Alumnos","Consultar","2023-02-08","10:39 pm","1");
INSERT INTO bitacora VALUES("358","18690684","Cerrar Sesión","Consultar","2023-02-08","10:43 pm","1");
INSERT INTO bitacora VALUES("389","18690684","Inicio De Sesión","Consultar","2023-02-08","11:47 pm","1");
INSERT INTO bitacora VALUES("390","18690684","Inicio","Consultar","2023-02-08","11:47 pm","1");
INSERT INTO bitacora VALUES("391","18690684","Inicio De Sesión","Consultar","2023-02-08","11:49 pm","1");
INSERT INTO bitacora VALUES("392","18690684","Inicio","Consultar","2023-02-08","11:49 pm","1");
INSERT INTO bitacora VALUES("393","18690684","Cerrar Sesión","Consultar","2023-02-08","11:49 pm","1");
INSERT INTO bitacora VALUES("394","07132428","Inicio De Sesión","Consultar","2023-02-08","11:50 pm","1");
INSERT INTO bitacora VALUES("395","07132428","Inicio","Consultar","2023-02-08","11:50 pm","1");
INSERT INTO bitacora VALUES("396","07132428","Usuarios","Consultar","2023-02-08","11:50 pm","1");
INSERT INTO bitacora VALUES("397","07132428","Cerrar Sesión","Consultar","2023-02-08","11:50 pm","1");
INSERT INTO bitacora VALUES("398","07132428","Inicio De Sesión","Consultar","2023-02-08","11:52 pm","1");
INSERT INTO bitacora VALUES("399","07132428","Inicio","Consultar","2023-02-08","11:52 pm","1");
INSERT INTO bitacora VALUES("400","07132428","Usuarios","Consultar","2023-02-08","11:52 pm","1");
INSERT INTO bitacora VALUES("401","07132428","Usuarios","Modificar","2023-02-08","11:53 pm","1");
INSERT INTO bitacora VALUES("402","07132428","Usuarios","Consultar","2023-02-08","11:54 pm","1");
INSERT INTO bitacora VALUES("403","07132428","Cerrar Sesión","Consultar","2023-02-08","11:55 pm","1");
INSERT INTO bitacora VALUES("404","07132428","Inicio De Sesión","Consultar","2023-02-08","11:59 pm","1");
INSERT INTO bitacora VALUES("405","07132428","Inicio","Consultar","2023-02-08","11:59 pm","1");
INSERT INTO bitacora VALUES("406","07132428","Cerrar Sesión","Consultar","2023-02-08","11:59 pm","1");
INSERT INTO bitacora VALUES("407","18690684","Inicio De Sesión","Consultar","2023-02-08","11:59 pm","1");
INSERT INTO bitacora VALUES("408","18690684","Inicio","Consultar","2023-02-08","11:59 pm","1");
INSERT INTO bitacora VALUES("409","18690684","Cerrar Sesión","Consultar","2023-02-08","11:59 pm","1");
INSERT INTO bitacora VALUES("410","00000000","Inicio De Sesión","Consultar","2023-02-09","10:51 pm","1");
INSERT INTO bitacora VALUES("411","00000000","Inicio","Consultar","2023-02-09","10:51 pm","1");
INSERT INTO bitacora VALUES("412","00000000","Mantenimiento","Consultar","2023-02-09","10:51 pm","1");
INSERT INTO bitacora VALUES("413","00000000","Mantenimiento","Respaldar","2023-02-09","10:51 pm","1");
INSERT INTO bitacora VALUES("414","00000000","Mantenimiento","Consultar","2023-02-09","10:51 pm","1");
INSERT INTO bitacora VALUES("415","00000000","Inicio De Sesión","Consultar","2023-02-13","08:46 am","1");
INSERT INTO bitacora VALUES("416","00000000","Inicio","Consultar","2023-02-13","08:46 am","1");
INSERT INTO bitacora VALUES("417","00000000","Alumnos","Consultar","2023-02-13","08:46 am","1");
INSERT INTO bitacora VALUES("418","00000000","Periodos","Consultar","2023-02-13","08:47 am","1");
INSERT INTO bitacora VALUES("419","00000000","Cerrar Sesión","Consultar","2023-02-13","09:13 am","1");
INSERT INTO bitacora VALUES("420","00000000","Inicio De Sesión","Consultar","2023-02-13","10:10 am","1");
INSERT INTO bitacora VALUES("421","00000000","Inicio","Consultar","2023-02-13","10:10 am","1");
INSERT INTO bitacora VALUES("422","00000000","Usuarios","Consultar","2023-02-13","10:10 am","1");
INSERT INTO bitacora VALUES("423","00000000","Bloqueo","Consultar","2023-02-13","10:10 am","1");
INSERT INTO bitacora VALUES("424","18690684","Inicio De Sesión","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("425","18690684","Inicio","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("426","18690684","Cerrar Sesión","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("427","18690684","Inicio De Sesión","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("428","18690684","Inicio","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("429","18690684","Cerrar Sesión","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("430","18690684","Inicio De Sesión","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("431","18690684","Inicio","Consultar","2023-02-13","04:57 pm","1");
INSERT INTO bitacora VALUES("432","18690684","Cerrar Sesión","Consultar","2023-02-13","04:58 pm","1");
INSERT INTO bitacora VALUES("433","18690684","Inicio De Sesión","Consultar","2023-02-13","04:58 pm","1");
INSERT INTO bitacora VALUES("434","18690684","Inicio","Consultar","2023-02-13","04:58 pm","1");
INSERT INTO bitacora VALUES("435","18690684","Cerrar Sesión","Consultar","2023-02-13","04:59 pm","1");
INSERT INTO bitacora VALUES("436","00000000","Inicio De Sesión","Consultar","2023-02-14","10:13 am","1");
INSERT INTO bitacora VALUES("437","00000000","Inicio","Consultar","2023-02-14","10:13 am","1");
INSERT INTO bitacora VALUES("438","00000000","Alumnos","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("439","00000000","Profesores","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("440","00000000","Periodos","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("441","00000000","Saberes","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("442","00000000","Secciones","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("443","00000000","Clases","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("444","00000000","Proyectos","Consultar","2023-02-14","10:14 am","1");
INSERT INTO bitacora VALUES("445","00000000","Notas","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("446","00000000","Usuarios","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("447","00000000","Reportes","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("448","00000000","Bitacora","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("449","00000000","Bloqueo","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("450","00000000","Modulos","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("451","00000000","Permisos","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("452","00000000","Roles","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("453","00000000","Mantenimiento","Consultar","2023-02-14","10:15 am","1");
INSERT INTO bitacora VALUES("454","00000000","Inicio","Consultar","2023-02-14","10:16 am","1");
INSERT INTO bitacora VALUES("455","00000000","Alumnos","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("456","00000000","Profesores","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("457","00000000","Periodos","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("458","00000000","Secciones","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("459","00000000","Clases","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("460","00000000","Secciones","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("461","00000000","Clases","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("462","00000000","Proyectos","Consultar","2023-02-14","10:26 am","1");
INSERT INTO bitacora VALUES("463","00000000","Secciones","Consultar","2023-02-14","11:04 am","1");
INSERT INTO bitacora VALUES("464","00000000","Usuarios","Consultar","2023-02-14","11:04 am","1");
INSERT INTO bitacora VALUES("465","00000000","Notas","Consultar","2023-02-14","11:04 am","1");
INSERT INTO bitacora VALUES("466","00000000","Clases","Consultar","2023-02-14","11:04 am","1");
INSERT INTO bitacora VALUES("467","00000000","Secciones","Consultar","2023-02-14","11:04 am","1");
INSERT INTO bitacora VALUES("468","00000000","Clases","Consultar","2023-02-14","11:05 am","1");
INSERT INTO bitacora VALUES("469","00000000","Saberes","Consultar","2023-02-14","11:05 am","1");
INSERT INTO bitacora VALUES("470","00000000","Secciones","Consultar","2023-02-14","11:05 am","1");
INSERT INTO bitacora VALUES("471","00000000","Alumnos","Consultar","2023-02-14","11:05 am","1");
INSERT INTO bitacora VALUES("472","00000000","Profesores","Consultar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("473","00000000","Secciones","Consultar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("474","00000000","Secciones","Eliminar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("475","00000000","Secciones","Consultar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("476","00000000","Secciones","Eliminar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("477","00000000","Secciones","Consultar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("478","00000000","Secciones","Eliminar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("479","00000000","Secciones","Consultar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("480","00000000","Secciones","Eliminar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("481","00000000","Secciones","Consultar","2023-02-14","11:06 am","1");
INSERT INTO bitacora VALUES("482","00000000","Secciones","Agregar","2023-02-14","11:07 am","1");
INSERT INTO bitacora VALUES("483","00000000","Secciones","Consultar","2023-02-14","11:07 am","1");
INSERT INTO bitacora VALUES("484","00000000","Clases","Consultar","2023-02-14","11:07 am","1");
INSERT INTO bitacora VALUES("485","00000000","Clases","Agregar","2023-02-14","11:07 am","1");
INSERT INTO bitacora VALUES("486","00000000","Clases","Consultar","2023-02-14","11:07 am","1");
INSERT INTO bitacora VALUES("487","00000000","Proyectos","Consultar","2023-02-14","11:07 am","1");
INSERT INTO bitacora VALUES("488","00000000","Proyectos","Agregar","2023-02-14","11:08 am","1");
INSERT INTO bitacora VALUES("489","00000000","Proyectos","Consultar","2023-02-14","11:08 am","1");
INSERT INTO bitacora VALUES("490","00000000","Notas","Consultar","2023-02-14","11:09 am","1");
INSERT INTO bitacora VALUES("491","00000000","Notas","Agregar","2023-02-14","11:09 am","1");
INSERT INTO bitacora VALUES("492","00000000","Notas","Consultar","2023-02-14","11:09 am","1");
INSERT INTO bitacora VALUES("493","00000000","Usuarios","Consultar","2023-02-14","11:10 am","1");
INSERT INTO bitacora VALUES("494","00000000","Bloqueo","Consultar","2023-02-14","11:16 am","1");
INSERT INTO bitacora VALUES("495","00000000","Alumnos","Consultar","2023-02-14","02:57 pm","1");
INSERT INTO bitacora VALUES("496","00000000","Alumnos","Agregar","2023-02-14","03:14 pm","1");
INSERT INTO bitacora VALUES("497","00000000","Alumnos","Consultar","2023-02-14","03:14 pm","1");
INSERT INTO bitacora VALUES("498","00000000","Alumnos","Agregar","2023-02-14","03:19 pm","1");
INSERT INTO bitacora VALUES("499","00000000","Alumnos","Consultar","2023-02-14","03:32 pm","1");
INSERT INTO bitacora VALUES("500","00000000","Alumnos","Agregar","2023-02-14","03:33 pm","1");
INSERT INTO bitacora VALUES("501","00000000","Alumnos","Consultar","2023-02-14","03:35 pm","1");
INSERT INTO bitacora VALUES("502","00000000","Alumnos","Agregar","2023-02-14","03:35 pm","1");
INSERT INTO bitacora VALUES("503","00000000","Alumnos","Consultar","2023-02-14","03:37 pm","1");
INSERT INTO bitacora VALUES("504","00000000","Alumnos","Agregar","2023-02-14","03:38 pm","1");
INSERT INTO bitacora VALUES("505","00000000","Alumnos","Eliminar","2023-02-14","03:38 pm","1");
INSERT INTO bitacora VALUES("506","00000000","Alumnos","Consultar","2023-02-14","03:38 pm","1");
INSERT INTO bitacora VALUES("507","00000000","Alumnos","Agregar","2023-02-14","03:39 pm","1");
INSERT INTO bitacora VALUES("508","00000000","Alumnos","Consultar","2023-02-14","03:39 pm","1");
INSERT INTO bitacora VALUES("509","00000000","Alumnos","Agregar","2023-02-14","03:45 pm","1");
INSERT INTO bitacora VALUES("510","00000000","Alumnos","Eliminar","2023-02-14","03:57 pm","1");
INSERT INTO bitacora VALUES("511","00000000","Alumnos","Consultar","2023-02-14","03:57 pm","1");
INSERT INTO bitacora VALUES("512","00000000","Alumnos","Agregar","2023-02-14","03:58 pm","1");
INSERT INTO bitacora VALUES("513","00000000","Bitacora","Consultar","2023-02-14","04:01 pm","1");
INSERT INTO bitacora VALUES("514","00000000","Bloqueo","Consultar","2023-02-14","04:04 pm","1");
INSERT INTO bitacora VALUES("515","00000000","Cerrar Sesión","Consultar","2023-02-14","04:08 pm","1");
INSERT INTO bitacora VALUES("516","18690684","Inicio De Sesión","Consultar","2023-02-14","04:08 pm","1");
INSERT INTO bitacora VALUES("517","18690684","Inicio","Consultar","2023-02-14","04:08 pm","1");
INSERT INTO bitacora VALUES("518","18690684","Bloqueo","Consultar","2023-02-14","04:08 pm","1");
INSERT INTO bitacora VALUES("519","18690684","Usuarios","Consultar","2023-02-14","04:45 pm","1");
INSERT INTO bitacora VALUES("520","18690684","Bloqueo","Consultar","2023-02-14","04:46 pm","1");
INSERT INTO bitacora VALUES("521","18690684","Bloqueo","Desbloquear","2023-02-14","05:00 pm","1");
INSERT INTO bitacora VALUES("522","18690684","Bloqueo","Consultar","2023-02-14","05:00 pm","1");
INSERT INTO bitacora VALUES("523","18690684","Alumnos","Consultar","2023-02-14","05:41 pm","1");
INSERT INTO bitacora VALUES("524","18690684","Alumnos","Agregar","2023-02-14","05:41 pm","1");





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

INSERT INTO respuestas VALUES("4","18690684","2","L3ZvWHMyV1ZldjdWRnhGczFkdkkzZz09","1");
INSERT INTO respuestas VALUES("5","18690684","3","eGNrbE1aSDByUk42TE5ETzRUQlFJUT09","1");
INSERT INTO respuestas VALUES("6","18690684","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");
INSERT INTO respuestas VALUES("7","07132428","2","YkRRWmdBQWgzRDd4bVBQNG5mOHZ1Zz09","1");
INSERT INTO respuestas VALUES("8","07132428","3","eE5KczhvdUNXYXpJRzZLVjhwRmVFQT09","1");
INSERT INTO respuestas VALUES("9","07132428","4","TlVUd1Nva2p4bWcveVZVUkhwZUl1Zz09","1");



