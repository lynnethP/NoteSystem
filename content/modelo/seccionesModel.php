<?php

	namespace content\modelo;

	use content\config\conection\database as database;
	use PDOException;

	class seccionesModel extends database{

		private $cod_seccion;
		private $nombre_seccion;
		private $trayecto_seccion;
		private $year_seccion;

		public function __construct(){
			// $this->con = parent::__construct();
			parent::__construct();
		}

		# @aprobado
		public function validarConsultar($metodo, $data="", $data2=""){
			if($metodo=="Consultar"){
				$result = self::Consultar($data);
				return $result;
			}
			if($metodo=="ConsultarSeccionAlumnos"){
				$result = self::ConsultarSeccionAlumnos($data);
				return $result;
			}
			if($metodo=="ConsultarSecciones"){
				$result = self::ConsultarSecciones($data, $data2);
				return $result;
			}
			
			if($metodo=="getOne"){
				$result = self::getOne($data);
				return $result;
			}
			if($metodo=="getOneData"){
				$result = self::getOneData($data);
				return $result;
			}
		}

		# @aprobado
		public function ValidarAgregarOModificar($datos, $metodo){
			$res = [];
			$return = 0;
			foreach ($datos as $campo => $valor) {
				$resExp = self::Validate($campo, $valor);
				$return += $resExp;
			}
			// echo "Retorno: ".$return."\n\n";
			if($return==0){
				if($metodo=="Agregar" || $metodo=="agregar"){
					$result = self::Agregar($datos);
				}
				if($metodo=="Modificar" || $metodo=="modificar"){
					$result = self::Modificar($datos);
				}
				if($metodo=="AgregarSecAlumno" || $metodo=="agregarsecalumno"){
					$result = self::AgregarSecAlumno($datos);
				}
				return $result;
			}else{
				return ['msj'=>"Invalido"];
			}
		}

		# @aprobado
		public function validarEliminar($metodo, $data){
			if($metodo=="Eliminar"){
				$result = self::Eliminar($data);
				return $result;
			}
			if($metodo=="EliminarSeccionAlumno"){
				$result = self::EliminarSeccionAlumno($data);
				return $result;
			}
		}

		# @aprobado
		public function limpiarPost($array){
			$leng = [
				0=>['campo'=>'nombre', 'length'=>15],
				1=>['campo'=>'trayecto', 'length'=>1], 
				2=>['campo'=>'seccion', 'length'=>15],
				3=>['campo'=>'year', 'length'=>4],
				4=>['campo'=>'codigo', 'length'=>12],
				5=>['campo'=>'cod_seccion', 'length'=>12],
			];
			foreach($leng as $len){
				if(!empty($array[$len['campo']])){
					if(strlen($array[$len['campo']]) > $len['length']){
						$array[$len['campo']] = substr($array[$len['campo']], 0, $len['length']);
						$array[$len['campo']] = stripslashes($array[$len['campo']]);
						$array[$len['campo']] = strip_tags($array[$len['campo']]);
						$array[$len['campo']] = htmlspecialchars($array[$len['campo']]);
					}
				}
			}
			return $array;
		}

		# @aprobado
		private function Validate($campo, $valor){
			$pattern = [
				'0' => ['campo'=>"cod_seccion",'expresion'=>'/[^0-9 a-zA-Z]/'],
				'1' => ['campo'=>"seccion",'expresion'=>'/[^0-9 S s H h]/'],
				'2' => ['campo'=>"trayecto",'expresion'=>'/[^0-9]/'],
				'3' => ['campo'=>"year",'expresion'=>'/[^0-9]/'],
			];
			foreach ($pattern as $exReg) {
				if($exReg['campo']==$campo){
					$resExp = preg_match_all($exReg['expresion'], $valor);
					// echo "Campo: ".$campo." | Valor: ".$valor." | ";
					// echo "ResExp: ".$resExp;
					// echo "\n";
					return $resExp;
				}
			}
		}

		# @aprobado
		private function Consultar($trayecto=""){
			try {
				if($trayecto==""){
					$query = parent::prepare("SELECT * FROM secciones WHERE secciones.estatus = 1");
				}else{
					$query = parent::prepare("SELECT * FROM secciones WHERE secciones.estatus = 1 and secciones.trayecto_seccion = :trayecto");
					$query->bindValue(":trayecto", $trayecto);
				}
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

		//  ///////////////
			// private function ConsultarSeccionProfesor($trayecto=""){
			// 	try {
			// 		if($trayecto==""){
			// 			$query = parent::prepare("SELECT * FROM secciones, periodos WHERE periodos.id_periodo = secciones.id_periodo and periodos.estatus = 1 and secciones.estatus = 1");
			// 		}else{
			// 			$query = parent::prepare("SELECT * FROM secciones, periodos WHERE periodos.id_periodo = secciones.id_periodo and periodos.estatus = 1 and secciones.estatus = 1 and secciones.trayecto_seccion = :trayecto");
			// 			$query->bindValue(":trayecto", $trayecto);
			// 		}
			// 		$respuestaArreglo = '';
			// 		$query->execute();
			// 		$query->setFetchMode(parent::FETCH_ASSOC);
			// 		$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
			// 		return $respuestaArreglo;
			// 	} catch (PDOException $e) {
			// 		$errorReturn = ['estatus' => false];
			// 		$errorReturn += ['info' => "error sql:{$e}"];
			// 		return $errorReturn;
			// 	}
			// }

		# @Aprobado
		private function ConsultarSecciones($trayecto="", $year=""){
			try {
				if($trayecto=="" && $year==""){
					$query = parent::prepare("SELECT * FROM secciones, seccion_alumno, alumnos WHERE secciones.cod_seccion = seccion_alumno.cod_seccion and seccion_alumno.cedula_alumno=alumnos.cedula_alumno and alumnos.estatus = 1 and secciones.estatus = 1");
				}else if($trayecto!="" && $year==""){
					$query = parent::prepare("SELECT * FROM secciones, seccion_alumno, alumnos WHERE secciones.cod_seccion = seccion_alumno.cod_seccion and seccion_alumno.cedula_alumno=alumnos.cedula_alumno and alumnos.estatus = 1 and secciones.estatus = 1 and alumnos.trayecto_alumno = :trayecto");
					$query->bindValue(":trayecto", $trayecto);
				}else if($trayecto!="" && $year!=""){
					$query = parent::prepare("SELECT * FROM secciones, seccion_alumno, alumnos WHERE secciones.cod_seccion = seccion_alumno.cod_seccion and seccion_alumno.cedula_alumno=alumnos.cedula_alumno and alumnos.estatus = 1 and secciones.estatus = 1 and alumnos.trayecto_alumno = :trayecto and secciones.year_seccion = :years");
					$query->bindValue(":trayecto", $trayecto);
					$query->bindValue(":years", $year);
				}

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

		# @Aprobado
		private function ConsultarSeccionAlumnos($cod_seccion=""){
			try {
				if($cod_seccion==""){
					$query = parent::prepare("SELECT * FROM secciones, seccion_alumno, alumnos WHERE secciones.cod_seccion = seccion_alumno.cod_seccion and seccion_alumno.cedula_alumno=alumnos.cedula_alumno and alumnos.estatus = 1 and secciones.estatus = 1");
				}else{
					$query = parent::prepare("SELECT * FROM secciones, seccion_alumno, alumnos WHERE secciones.cod_seccion = seccion_alumno.cod_seccion and seccion_alumno.cedula_alumno=alumnos.cedula_alumno and alumnos.estatus = 1 and secciones.estatus = 1 and secciones.cod_seccion = :cod_seccion");
					$query->bindValue(":cod_seccion",$cod_seccion);
				}

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

		# @Aprobado
		private function ConsultaPK($codSeccion){
			try {
				$query = parent::prepare("SELECT * FROM secciones WHERE cod_seccion LIKE '%{$codSeccion}%'");
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				$respuestaArreglo += ['estatus' => true];
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		# @Aprobado
		private function getOne($cod){
			try {
				$query = parent::prepare("SELECT * FROM secciones WHERE cod_seccion = :cod");
				$query->bindValue(':cod', $cod);
				$respuestaArreglo = '';
				$query->execute();
				$respuestaArreglo = $query->fetchAll();
				if ($respuestaArreglo += ['estatus' => true]) {
					$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
					$Result['data'] = ['ejecucion'=>true];
					if(count($respuestaArreglo)>1){
						$Result['data'] = $respuestaArreglo;
					}
					// echo json_encode($Result);
					return $Result;
				}
		       //return $respuestaArreglo;
		      //require_once 'Vista/usuarios.php';
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}
		
		# @Aprobado
		private function getOneData($datos){
		      try {
		    	$query = parent::prepare("SELECT * FROM secciones WHERE nombre_seccion = :seccion and trayecto_seccion = :trayecto and year_seccion = :year");
		    	$query->bindValue(':seccion', $datos['seccion']);
		    	$query->bindValue(':trayecto', $datos['trayecto']);
		    	$query->bindValue(':year', $datos['year']);
		    	$respuestaArreglo = '';
		        $query->execute();
		        $respuestaArreglo = $query->fetchAll();
		        if ($respuestaArreglo += ['estatus' => true]) {
		        	$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
		        	$Result['data'] = ['ejecucion'=>true];
		        	if(count($respuestaArreglo)>1){
		        		$Result['data'] = $respuestaArreglo;
		        	}
					// echo json_encode($Result);
					return $Result;
		        }
		       //return $respuestaArreglo;
		      //require_once 'Vista/usuarios.php';
		      } catch (PDOException $e) {
		        $errorReturn = ['estatus' => false];
		        $errorReturn += ['info' => "error sql:{$e}"];
		        return $errorReturn;
		      }
	    }

	    # @Aprobado
		private function Agregar($datos){
			try{
				$query = parent::prepare('INSERT INTO secciones (cod_seccion, nombre_seccion, trayecto_seccion, year_seccion, estatus) VALUES (:cod_seccion, :nombre_seccion, :trayecto_seccion, :year, 1)');
				$query->bindValue(':cod_seccion', $datos['cod_seccion']);
				$query->bindValue(':nombre_seccion', $datos['seccion']);
		    	$query->bindValue(':trayecto_seccion', $datos['trayecto']);
		    	$query->bindValue(':year', $datos['year']);
		            
				$query->execute();
				$respuestaArreglo = $query->fetchAll();
		        // print_r($respuestaArreglo);
		        if ($respuestaArreglo += ['estatus' => true]) {
		        	$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
				}
				return $Result;
			} catch(PDOException $e){
				$errorReturn = ['estatus' => false];
				$errorReturn['msj'] = "Error";
				$errorReturn += ['info' => "Error sql:{$e}"];
				return $errorReturn; 
			}
		}

		# @Aprobado
		private function AgregarSecAlumno($datos){
          	try{
           	   $query = parent:: prepare('INSERT INTO seccion_alumno (id_SA, cod_seccion, cedula_alumno, estatus) VALUES (DEFAULT, :cod_seccion, :cedula_alumno, 1)');

                $query->bindValue(':cod_seccion', $datos['cod_seccion']);
				$query->bindValue(':cedula_alumno', $datos['cedula_alumno']);
		            
				$query->execute();
				$respuestasArreglo = $query->fetchAll();

				if($respuestasArreglo += ['estatus' => true]) {
					$Result = array ('msj' => 'Good');
				}


				return $Result;
			} catch(PDOException $e){
				$errorReturn = ['estatus' => false];
				$errorReturn['msj'] = "Error";
				$errorReturn += ['info' => "Error sql:{$e}"];
				return $errorReturn; 
			}
        }
		
		# @Aprobado
		private function Modificar($datos){
			try{
				$query = parent::prepare('UPDATE secciones SET nombre_seccion=:nombre_seccion, trayecto_seccion = :trayecto_seccion, year_seccion = :year, estatus=1 WHERE cod_seccion = :cod_seccion');
				$query->bindValue(':cod_seccion', $datos['cod_seccion']);
				$query->bindValue(':nombre_seccion', $datos['seccion']);
		    	$query->bindValue(':trayecto_seccion', $datos['trayecto']);
		    	$query->bindValue(':year', $datos['year']);
				$query->execute();
				$respuestaArreglo = $query->fetchAll();
				if ($respuestaArreglo += ['estatus' => true]) {
					$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
					return $Result;
				}
			} catch(PDOException $e){
				$errorReturn = ['estatus' => false];
				$errorReturn['msj'] = "Error";
				$errorReturn += ['info' => "Error sql:{$e}"];
				return $errorReturn; 
			}
		}

		# @Aprobado
		private function Eliminar($cod){
			try {
				$query = parent::prepare('UPDATE secciones SET estatus = 0 WHERE cod_seccion = :cod');
				$query->execute(['cod'=>$cod]);
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC);
				if ($respuestaArreglo += ['estatus' => true]) {
					$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
					return $Result;
				}
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn['msj'] = "Error";
				$errorReturn += ['info' => "Error sql:{$e}"];
				return $errorReturn; ;
			}
		}

		# @Aprobado
		private function EliminarSeccionAlumno($cod){
			try {
				$query = parent::prepare('DELETE FROM seccion_alumno WHERE cod_seccion = :cod');
				$query->execute(['cod'=>$cod]);
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC);
				if ($respuestaArreglo += ['estatus' => true]) {
					$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
					return $Result;
				}
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn['msj'] = "Error";
				$errorReturn += ['info' => "Error sql:{$e}"];
				return $errorReturn; ;
			}
		}

		# @Aprobado
		public function ExtraerPK($codSeccion){
			// echo $codSeccion." --- ";
			$numss = $this::ConsultaPK($codSeccion);
			// print_r($numss);
			$numMax = 0;
			if(count($numss)>1){
				$len = strlen($codSeccion);
				// echo $len;
				foreach ($numss as $key) {
					if(!empty($key['cod_seccion'])){
						$n = substr($key['cod_seccion'], $len);
						if($n > $numMax){
							$numMax = $n;
						}
					}
				}
			}
			$numero = $numMax+1;
			// echo $numero;
			$codSeccion .= $numero;
			return $codSeccion;
		}

	}

?>