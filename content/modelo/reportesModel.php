<?php

	namespace content\modelo;

	use mysqli as mysqli;
	use content\config\conection\database as database;
	use PDOException;

	class reportesModel extends database{

		public $fecha;
		public $mysqlImportFilename;

		public function __construct(){			
			parent::__construct();
			
		}
		public function Aprobacion($cedula, $saber){
			try {
				$query = parent::prepare("SELECT seccion_alumno.cedula_alumno, saberes.nombreSC, saberes.trayecto_SC, saberes.fase_SC, alumnos.nombre_alumno, alumnos.apellido_alumno, notas.nota FROM notas, seccion_alumno, clases, saberes, alumnos WHERE notas.id_SA = seccion_alumno.id_SA and notas.id_clase = clases.id_clase and clases.id_SC = saberes.id_SC and alumnos.cedula_alumno = seccion_alumno.cedula_alumno and seccion_alumno.cedula_alumno = :cedula and clases.id_SC = '{$saber}'");
				$respuestaArreglo = '';
				$query->execute(['cedula' => $cedula]);
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		public function Usuarios(){
			try {
				$query = parent::prepare("SELECT usuarios.cedula_usuario, usuarios.nombre_usuario, usuarios.correo, usuarios.estatus, roles.nombre_rol FROM usuarios, roles WHERE usuarios.id_rol = roles.id_rol and usuarios.cedula_usuario != '00000000'");
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		public function Notas($seccion, $saber){
			try {
				$query = parent::prepare("SELECT notas.id_nota, seccion_alumno.cedula_alumno, alumnos.nombre_alumno, alumnos.apellido_alumno, notas.nota, saberes.id_SC, saberes.nombreSC, secciones.cod_seccion, secciones.nombre_seccion FROM notas, clases, seccion_alumno, saberes, alumnos, secciones WHERE notas.id_clase = clases.id_clase and notas.id_SA = seccion_alumno.id_SA and clases.id_SC = saberes.id_SC and seccion_alumno.cedula_alumno = alumnos.cedula_alumno and seccion_alumno.cod_seccion = secciones.cod_seccion and clases.cod_seccion = '{$seccion}' and clases.id_SC = '{$saber}'");
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		public function Aprobados($seccion){
			try {
				$query = parent::prepare("SELECT notas.id_nota, seccion_alumno.cedula_alumno, alumnos.nombre_alumno, alumnos.apellido_alumno, notas.nota, saberes.id_SC, saberes.nombreSC, secciones.cod_seccion, secciones.nombre_seccion FROM notas, clases, seccion_alumno, saberes, alumnos, secciones WHERE notas.id_clase = clases.id_clase and notas.id_SA = seccion_alumno.id_SA and clases.id_SC = saberes.id_SC and seccion_alumno.cedula_alumno = alumnos.cedula_alumno and seccion_alumno.cod_seccion = secciones.cod_seccion and clases.cod_seccion = '{$seccion}'");
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

	}

?>