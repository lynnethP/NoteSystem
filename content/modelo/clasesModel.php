<?php
 
	namespace content\modelo;

	use content\config\conection\database as database;

	class clasesModel extends database{

		private $id;
		private $periodo;
		private $saber;
		private $profesor;

		public function __construct(){
			// $this->con = parent::__construct();
			parent::__construct();
		}

		# @aprobado
		public function validarConsultar($metodo, $data=""){
			if($metodo=="Consultar"){
				$result = self::Consultar($data);
				return $result;
			}
			if($metodo=="ConsultarSeccionClase"){
				$result = self::ConsultarSeccionClase();
				return $result;
			}
			if($metodo=="ConsultarSeccionProfesor"){
				$result = self::ConsultarSeccionProfesor($data);
				return $result;
			}
			if($metodo=="getOneId"){
				$result = self::getOneId($data);
				return $result;
			}
			if($metodo=="getOne"){
				$result = self::getOne($data);
				return $result;
			}
			if($metodo=="getOneC"){
				$result = self::getOneC($data);
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
			if($return==0){
				if($metodo=="Agregar" || $metodo=="agregar"){
					$result = self::Agregar($datos);
				}
				if($metodo=="Modificar" || $metodo=="modificar"){
					$result = self::Modificar($datos);
				}
				return $result;
			}else{
				return ['msj'=>"Invalido"];
			}
		}

		# @aprobado
		public function validarEliminar($data){
			$result = self::Eliminar($data);
			return $result;
		}

		# @aprobado
		public function limpiarPost($array){
			$leng = [
				0=>['campo'=>'seccion', 'length'=>15],
				1=>['campo'=>'saber', 'length'=>5],
				2=>['campo'=>'profesor', 'length'=>8],
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
				'0' => ['campo'=>"saber",'expresion'=>'/[^0-9]/'],
				'1' => ['campo'=>"profesor",'expresion'=>'/[^0-9]/'],
				'2' => ['campo'=>"seccion",'expresion'=>'/[^0-9 a-zA-Z]/'],
				'3' => ['campo'=>"id_clase",'expresion'=>'/[^0-9]/'],
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
		private function Consultar($data=""){
			try {
				if($data==""){
					$query = parent::prepare("SELECT * FROM clases, saberes, secciones, periodos, profesores WHERE periodos.estatus=1 and periodos.id_periodo = clases.id_periodo and clases.cedula_profesor = profesores.cedula_profesor and clases.cod_seccion = secciones.cod_seccion and clases.id_SC = saberes.id_SC and clases.estatus = 1 and profesores.estatus = 1 and secciones.estatus = 1 and saberes.estatus = 1");
				}
				if($data != ""){
					if(!empty($data['campo']) && $data['campo']=="cod_seccion"){
						$cod_seccion = $data['valor'];
						$query = parent::prepare("SELECT * FROM clases, saberes, secciones, periodos, profesores WHERE periodos.estatus=1 and periodos.id_periodo = clases.id_periodo and clases.cedula_profesor = profesores.cedula_profesor and clases.cod_seccion = secciones.cod_seccion and clases.id_SC = saberes.id_SC and clases.estatus = 1 and profesores.estatus = 1 and secciones.estatus = 1 and saberes.estatus = 1 and secciones.cod_seccion = :cod_seccion");
						$query->bindValue(":cod_seccion",$cod_seccion);
					}	
					if(!empty($data['campo']) && $data['campo']=="year"){
						// echo "asd";
						$query = parent::prepare("SELECT * FROM clases, saberes, secciones, periodos, profesores WHERE periodos.estatus=1 and periodos.id_periodo = clases.id_periodo and clases.cedula_profesor = profesores.cedula_profesor and clases.cod_seccion = secciones.cod_seccion and clases.id_SC = saberes.id_SC and clases.estatus = 1 and profesores.estatus = 1 and secciones.estatus = 1 and saberes.estatus = 1 and secciones.year_seccion = :year");
						$year = $data['valor'];
						// echo $year;
						$query->bindValue(":year", $year);
					}
				}
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				// $respuestaArreglo += ['estatus' => true];
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		# @aprobado
		private function ConsultarSeccionClase(){
			try {
				$query = parent::prepare("SELECT DISTINCT periodos.id_periodo, periodos.nombre_periodo, periodos.year_periodo, periodos.fecha_apertura, periodos.fecha_cierre, secciones.cod_seccion, secciones.nombre_seccion, secciones.year_seccion, secciones.trayecto_seccion FROM clases, saberes, secciones, periodos, profesores WHERE periodos.estatus=1 and periodos.id_periodo = clases.id_periodo and clases.cedula_profesor = profesores.cedula_profesor and clases.cod_seccion = secciones.cod_seccion and clases.id_SC = saberes.id_SC and clases.estatus = 1 and profesores.estatus = 1 and secciones.estatus = 1 and saberes.estatus = 1");
				// $query = parent::prepare("SELECT DISTINCT secciones.cod_seccion, secciones.nombre_seccion, secciones.year_seccion, secciones.trayecto_seccion FROM clases, saberes, secciones, periodos, profesores WHERE periodos.estatus=1 and periodos.id_periodo = clases.id_periodo and clases.cedula_profesor = profesores.cedula_profesor and clases.cod_seccion = secciones.cod_seccion and clases.id_SC = saberes.id_SC and clases.estatus = 1 and profesores.estatus = 1 and secciones.estatus = 1 and saberes.estatus = 1");
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				// $respuestaArreglo += ['estatus' => true];
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		# @aprobado
		private function ConsultarSeccionProfesor($cedula_profesor){
			try {
				$query = parent::prepare("SELECT DISTINCT periodos.id_periodo, periodos.nombre_periodo, periodos.year_periodo, periodos.fecha_apertura, periodos.fecha_cierre, secciones.cod_seccion, secciones.nombre_seccion, secciones.trayecto_seccion FROM clases, saberes, secciones, periodos, profesores WHERE periodos.estatus=1 and periodos.id_periodo = clases.id_periodo and clases.cedula_profesor = profesores.cedula_profesor and clases.cod_seccion = secciones.cod_seccion and clases.id_SC = saberes.id_SC and clases.estatus = 1 and profesores.estatus = 1 and secciones.estatus = 1 and saberes.estatus = 1 and profesores.cedula_profesor = :cedula_profesor");
				$query->bindValue(":cedula_profesor", $cedula_profesor);
				$respuestaArreglo = '';
				$query->execute();
				$query->setFetchMode(parent::FETCH_ASSOC);
				$respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
				// $respuestaArreglo += ['estatus' => true];
				return $respuestaArreglo;
			} catch (PDOException $e) {
				$errorReturn = ['estatus' => false];
				$errorReturn += ['info' => "error sql:{$e}"];
				return $errorReturn;
			}
		}

		//  ///////////////
		private function getOneId($datos){
		    try {
		    	$query = parent::prepare("SELECT * FROM clases WHERE id_SC=:saber and cod_seccion = :seccion");
		    	$query->bindValue(":saber", $datos['saber']);
		    	$query->bindValue(":seccion", $datos['seccion']);
		    	$respuestaArreglo = '';
		        $query->execute();
		        $respuestaArreglo = $query->fetchAll();
		        if ($respuestaArreglo += ['estatus' => true]) {
		        	$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
		        	$Result['data'] = ['ejecucion'=>true];
		        	if(count($respuestaArreglo)>1){
		        		$Result['data'] = $respuestaArreglo;
		        	}
					return $Result;
		        }
		    } catch (PDOException $e) {
		        $errorReturn = ['estatus' => false];
		        $errorReturn += ['info' => "error sql:{$e}"];
		        return $errorReturn;
		    }
	    }
		
		# @aprobado
		private function getOne($datos){
		      try {
		      	if(!empty($datos['profesor'])){
		    		$query = parent::prepare("SELECT * FROM clases WHERE id_SC=:id_SC and id_periodo = :id_periodo and cod_seccion=:seccion and cedula_profesor = :profesor and estatus = 1");
		    		$query->bindValue(":id_SC",$datos['saber']);
		    		$query->bindValue(":id_periodo",$datos['periodo']);
		    		$query->bindValue(":seccion",$datos['seccion']);
		    		$query->bindValue(":profesor",$datos['profesor']);
		      	}else{
		      		// echo "Asd";
		    		$query = parent::prepare("SELECT * FROM clases WHERE id_SC=:id_SC and cod_seccion=:seccion and estatus = 1");
		    		// $query = parent::prepare("SELECT * FROM clases WHERE id_SC=:id_SC and id_periodo = :id_periodo and cod_seccion=:seccion and estatus = 1");
		    		$query->bindValue(":id_SC",$datos['saber']);
		    		// $query->bindValue(":id_periodo",$datos['periodo']);
		    		$query->bindValue(":seccion",$datos['seccion']);
		      	}
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
		      } catch (PDOException $e) {
		        $errorReturn = ['estatus' => false];
		        $errorReturn += ['info' => "error sql:{$e}"];
		        return $errorReturn;
		      }
	    }

	    //  ///////////////
		private function getOneC($id){
		    try {
		    	$query = parent::prepare('SELECT * FROM clases WHERE id_clase = :id');
		    	$respuestaArreglo = '';
		        $query->execute(['id'=>$id]);
		        $respuestaArreglo = $query->fetchAll();
		        if ($respuestaArreglo += ['estatus' => true]) {
		        	$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
		        	$Result['data'] = ['ejecucion'=>true];
		        	if(count($respuestaArreglo)>1){
		        		$Result['data'] = $respuestaArreglo;
		        	}
					return $Result;
		        }
		    } catch (PDOException $e) {
		        $errorReturn = ['estatus' => false];
		        $errorReturn += ['info' => "error sql:{$e}"];
		        return $errorReturn;
		    }
	    }
		
		# @aprobado
	    private function Agregar($datos){
			try{
				$query = parent::prepare("INSERT INTO clases (id_clase, id_periodo, id_SC, cod_seccion, cedula_profesor, estatus) VALUES (DEFAULT, :id_periodo, :id_SC, :cod_seccion, :cedula_profesor, 1)");
				$query->bindValue(':id_SC', $datos['saber']);
		    	$query->bindValue(":id_periodo",$datos['periodo']);
				$query->bindValue(':cedula_profesor', $datos['profesor']);
				$query->bindValue(':cod_seccion', $datos['seccion']);
				$query->execute();
				$respuestaArreglo = $query->fetchAll();
				if ($respuestaArreglo += ['estatus' => true]) {
					$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
					$id = $this->getLastId("clases", "id_clase");
					$Result['id'] = $id;
					return $Result;
				}
			} catch(PDOException $e){
				$errorReturn = ['estatus' => false];
				$errorReturn['msj'] = "Error";
				$errorReturn += ['info' => "Error sql:{$e}"];
				return $errorReturn; 
			}
		}

		# @aprobado
		private function Modificar($datos){
			try{

				$query = parent::prepare('UPDATE clases SET  id_SC=:id_SC, cod_seccion=:cod_seccion, cedula_profesor=:cedula_profesor, estatus=1 WHERE id_clase = :id_clase');
				$query->bindValue(':id_clase', $datos['id_clase']);
				$query->bindValue(':id_SC', $datos['saber']);
				$query->bindValue(':cedula_profesor', $datos['profesor']);
				$query->bindValue(':cod_seccion', $datos['seccion']);
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
		
		# @aprobado
		private function Eliminar($id){
			try {
	        $query = parent::prepare('UPDATE clases SET estatus = 0 WHERE id_clase = :id');
	        $query->execute(['id'=>$id]);
	        $query->setFetchMode(parent::FETCH_ASSOC);
	        $respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC);
	        if ($respuestaArreglo += ['estatus' => true]) {
	        	$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
				return $Result;
	        }
	        }
	        catch (PDOException $e)
	        {
	            $errorReturn = ['estatus' => false];
	      		$errorReturn['msj'] = "Error";
	        $errorReturn += ['info' => "Error sql:{$e}"];
	        return $errorReturn; ;
	        } 
		}

		# @aprobado
		private function getLastId($tabla, $id){
			//$sql='SELECT '.$id.' FROM '.$tabla.' ORDER BY '.$id.' desc';
			$sql = 'SELECT MAX(' . $id . ') as id FROM ' . $tabla;
			try {
				$exe = parent::prepare($sql);
				$exe->execute();
				$result = $exe->fetchAll();
				return $result[0]['id'];
			} catch (PDOException $e) {
				echo "Error al consultar el Id de la tabla $tabla <br>";
				echo $e;
			}
		}

	}

?>