<?php

	namespace content\modelo;

	use content\config\conection\database as database;
	use PDOException;

	class proyectosModel extends database{

		private $cod_proyecto;
		private $titulo_proyecto;
		private $trayecto_proyecto; 
		private $cedula_profesor;

		public function __construct(){
			// $this->con = parent::__construct();
			parent::__construct();
		}

		public function validarConsultar($metodo, $data=""){
			if($metodo=="Consultar"){
				$result = self::Consultar();
				return $result;
			}
			if($metodo=="ConsultarGrupos"){
				$result = self::ConsultarGrupos($data);
				return $result;
			}
			if($metodo=="ConsultarGrupos2"){
				$result = self::ConsultarGrupos2($data);
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
			if($metodo=="getOneDataGrupo"){
				$result = self::getOneDataGrupo($data);
				return $result;
			}
		}

		public function ValidarAgregarOModificar($datos, $metodo){
			$res = [];
			$return = 0;
			foreach ($datos as $campo => $valor) {
				$resExp = self::Validate($campo, $valor);
				$return += $resExp;
			}
			if($return==0){
				if($metodo=="Agregar" || $metodo=="agregar"){
					$result = self::Agregar($datos);
				}
				if($metodo=="AgregarGrupo" || $metodo=="agregargrupo"){
					$result = self::AgregarGrupo($datos);
				}
				if($metodo=="Modificar" || $metodo=="modificar"){
					$result = self::Modificar($datos);
				}
				return $result;
			}else{
				return ['msj'=>"Invalido"];
			}
		}

		public function validarEliminar($metodo, $data){
			if($metodo=="Eliminar"){
				$result = self::Eliminar($data);
				return $result;
			}
			if($metodo=="EliminarGrupos"){
				$result = self::EliminarGrupos($data);
				return $result;
			}
		}

		public function limpiarPost($array){
			$leng = [
				0=>['campo'=>'nombre', 'length'=>60], 
				1=>['campo'=>'seccion', 'length'=>15], 
				2=>['campo'=>'trayecto', 'length'=>1], 
				3=>['campo'=>'tutor', 'length'=>8], 
				4=>['campo'=>'codigo', 'length'=>20],
				5=>['campo'=>'cod_proyecto', 'length'=>20],
				6=>['campo'=>'secciones', 'length'=>15],
				7=>['campo'=>'cod_seccion', 'length'=>15],
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

		private function Validate($campo, $valor){
			$pattern = [
				'0' => ['campo'=>"id",'expresion'=>'/[^a-zA-Z0-9]/'],
				'1' => ['campo'=>"nombre",'expresion'=>'/[^a-zA-Z Ñ ñ Á á É é Í í Ó ó Ú ú ]/'],
				'2' => ['campo'=>"trayecto",'expresion'=>'/[^0-9]/'],
				'3' => ['campo'=>"cedula_tutor",'expresion'=>'/[^0-9]/'],
			];
			// $resExp = 0;
			foreach ($pattern as $exReg) {
				if($exReg['campo']==$campo){
					$resExp = preg_match_all($exReg['expresion'], $valor);
					// echo "Campo: ".$campo." | Valor: ".$valor." | ";
					// echo "ResExp: ".$resExp." | ";
					// echo "\n\n";
					return $resExp;
				}
			}
		}

		private function Consultar(){
			try {
				$query = parent::prepare("SELECT * FROM proyectos WHERE proyectos.estatus = 1");
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

		private function ConsultarGrupos($cod_seccion=""){
			
			try {
				if($cod_seccion==""){
					$query = parent::prepare("SELECT * FROM proyectos, grupos, seccion_alumno, alumnos WHERE proyectos.cod_proyecto = grupos.cod_proyecto and grupos.id_SA = seccion_alumno.id_SA and seccion_alumno.cedula_alumno = alumnos.cedula_alumno and proyectos.estatus = 1 and grupos.estatus = 1 and alumnos.estatus = 1");
				}else{
					$query = parent::prepare("SELECT * FROM proyectos, grupos, seccion_alumno, alumnos WHERE proyectos.cod_proyecto = grupos.cod_proyecto and grupos.id_SA = seccion_alumno.id_SA and seccion_alumno.cedula_alumno = alumnos.cedula_alumno and proyectos.estatus = 1 and grupos.estatus = 1 and alumnos.estatus = 1 and seccion_alumno.cod_seccion = :cod_seccion");
					$query->bindValue(":cod_seccion", $cod_seccion);
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

		private function ConsultarGrupos2($cod_seccion=""){
			
			try {
				if($cod_seccion==""){
					$query = parent::prepare("SELECT DISTINCT proyectos.cod_proyecto, seccion_alumno.cod_seccion FROM proyectos, grupos, seccion_alumno, alumnos WHERE proyectos.cod_proyecto = grupos.cod_proyecto and grupos.id_SA = seccion_alumno.id_SA and seccion_alumno.cedula_alumno = alumnos.cedula_alumno and proyectos.estatus = 1 and grupos.estatus = 1 and alumnos.estatus = 1");
				}else{
					$query = parent::prepare("SELECT DISTINCT proyectos.cod_proyecto, seccion_alumno.cod_seccion FROM proyectos, grupos, seccion_alumno, alumnos WHERE proyectos.cod_proyecto = grupos.cod_proyecto and grupos.id_SA = seccion_alumno.id_SA and seccion_alumno.cedula_alumno = alumnos.cedula_alumno and proyectos.estatus = 1 and grupos.estatus = 1 and alumnos.estatus = 1 and seccion_alumno.cod_seccion = :cod_seccion");
					$query->bindValue(":cod_seccion", $cod_seccion);
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

		private function getOne($cod){
			try {
				$query = parent::prepare("SELECT * FROM proyectos WHERE cod_proyecto = :cod");
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

		private function getOneData($datos){
		      try {
		    	$query = parent::prepare("SELECT * FROM proyectos WHERE titulo_proyecto = :nombre and trayecto_proyecto = :trayecto");
		    	$query->bindValue(':nombre', $datos['nombre']);
		    	$query->bindValue(':trayecto', $datos['trayecto']);
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

	    private function getOneDataGrupo($datos){
		      try {
		    	$query = parent::prepare("SELECT * FROM proyectos WHERE titulo_proyecto = :nombre and trayecto_proyecto = :trayecto");
		    	$query->bindValue(':nombre', $datos['nombre']);
		    	$query->bindValue(':trayecto', $datos['trayecto']);
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

		private function ConsultaPK($codProyecto){
			try {
				$query = parent::prepare("SELECT * FROM proyectos WHERE cod_proyecto LIKE '%{$codProyecto}%'");
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

		private function ConsultaPKGrupo($codGrupo){
			try {
				$query = parent::prepare("SELECT * FROM grupos WHERE cod_grupo LIKE '%{$codGrupo}%'");
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

		private function Agregar($datos){
			try{
				$query = parent::prepare("INSERT INTO proyectos (cod_proyecto, titulo_proyecto, trayecto_proyecto, cedula_profesor, estatus) VALUES (:cod_proyecto, :titulo_proyecto, :trayecto_proyecto, :cedula_tutor, 1)");

				$query->bindValue(':cod_proyecto', $datos['id']);
				$query->bindValue(':titulo_proyecto', $datos['nombre']);
		    	$query->bindValue(':trayecto_proyecto', $datos['trayecto']);
		    	$query->bindValue(':cedula_tutor', $datos['cedula_tutor']);
		            
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

		private function AgregarGrupo($data){
			try{
				$query = parent::prepare("INSERT INTO grupos (cod_grupo, id_SA, cod_proyecto, estatus) VALUES (:cod_grupo, :id_SA, :cod_proyecto, 1)");

				$query->bindValue(':cod_grupo', $data['cod_grupo']);
		    	$query->bindValue(':id_SA', $data['id_SA']);
				$query->bindValue(':cod_proyecto', $data['cod_proyecto']);
		            
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

		private function Modificar($datos){
			try{
				$query = parent::prepare('UPDATE proyectos SET titulo_proyecto = :titulo_proyecto, trayecto_proyecto=:trayecto_proyecto, cedula_profesor=:cedula_tutor, estatus=1 WHERE cod_proyecto = :cod_proyecto');
				$query->bindValue(':titulo_proyecto', $datos['nombre']);
				$query->bindValue(':trayecto_proyecto', $datos['trayecto']);
		    	$query->bindValue(':cedula_tutor', $datos['cedula_tutor']);
		    	$query->bindValue(':cod_proyecto', $datos['id']);
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

		private function Eliminar($cod){
			try {
				$query = parent::prepare('UPDATE proyectos SET estatus = 0 WHERE cod_proyecto = :cod');
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

		private function EliminarGrupos($cod){
			try {
				$query = parent::prepare('DELETE FROM grupos WHERE cod_proyecto = :cod');
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

		public function ExtraerPK($codProyecto){
			$numss = self::ConsultaPK($codProyecto);
			$numMax = 0;
			if(count($numss)>1){
				$len = strlen($codProyecto);
				foreach ($numss as $key) {
					if(!empty($key['cod_proyecto'])){
						$n = substr($key['cod_proyecto'], $len);
						if($n > $numMax){
							$numMax = $n;
						}
					}
				}
			}
			$numero = $numMax+1;
			$codProyecto .= $numero;
			return $codProyecto;
		}

		public function ExtraerPKGrupo($codGrupo){
			$numss = self::ConsultaPKGrupo($codGrupo);
			$numMax = 0;
			if(count($numss)>1){
				$len = strlen($codGrupo);
				foreach ($numss as $key) {
					if(!empty($key['cod_grupo'])){
						$n = substr($key['cod_grupo'], $len);
						if($n > $numMax){
							$numMax = $n;
						}
					}
				}
			}
			$numero = $numMax+1;
			$codGrupo .= $numero;
			return $codGrupo;
		}

	}

?>