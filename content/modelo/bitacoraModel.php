<?php

	 namespace content\modelo;

	use content\config\conection\database as database;

	class bitacoraModel extends database{

		private $cedula;
		private $nombre; 
		private $apellido;
		private $correo;
		private $telefono;

		public function __construct(){
			parent::__construct();
		}

		public function limpiarDatos($array){
			$leng = [
				0=>['campo'=>'last', 'length'=>10],
				1=>['campo'=>'actual', 'length'=>10], 
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

		private function Validate($campo, $valor)
		{
			$pattern = [
				'0' => ['campo' => "last", 'expresion' => '/[^0-9 --]/'],
				'1' => ['campo' => "actual", 'expresion' => '/[^0-9 --]/'],
			];
			// $resExp = 0;
			foreach ($pattern as $exReg) {
				if ($exReg['campo'] == $campo) {
					$resExp = preg_match_all($exReg['expresion'], $valor);
					// echo "Campo: ".$campo." | Valor: ".$valor." | ";
					// echo "ResExp: ".$resExp." | ";
					// echo "\n\n";
					return $resExp;
				}
			}
		}

		public function ValidarConsultar($datos)
		{
			$res = [];
			$return = 0;
			if(!empty($datos)){
				foreach ($datos as $campo => $valor) {
					$resExp = self::Validate($campo, $valor);
					$return += $resExp;
				}
			}
			if ($return == 0) {
				$result = self::ConsultarFiltro($datos);
				return $result;
			} else {
				return ['msj' => "Invalido"];
			}
		}

		private function Consultar($data=""){
			
			try {
				if($data==""){
					$query = parent::prepare("SELECT id_bitacora, usuarios.cedula_usuario, usuarios.id_rol, usuarios.nombre_usuario, usuarios.correo, usuarios.estatus, modulo_bitacora, accion_bitacora, fecha_bitacora, hora_bitacora FROM bitacora, usuarios WHERE usuarios.cedula_usuario = bitacora.cedula_usuario ORDER BY id_bitacora DESC");
				}else{
					$query = parent::prepare("SELECT id_bitacora, usuarios.cedula_usuario, usuarios.id_rol, usuarios.nombre_usuario, usuarios.correo, usuarios.estatus, modulo_bitacora, accion_bitacora, fecha_bitacora, hora_bitacora FROM bitacora, usuarios WHERE usuarios.cedula_usuario = bitacora.cedula_usuario and usuarios.cedula_usuario = :cedula ORDER BY id_bitacora DESC");
					$query->bindValue(":cedula",$data['cedula']);
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

		private function ConsultarFiltro($data=""){
			
			try {
				if($data==""){
					$query = parent::prepare("SELECT id_bitacora, usuarios.cedula_usuario, usuarios.id_rol, usuarios.nombre_usuario, usuarios.correo, usuarios.estatus, modulo_bitacora, accion_bitacora, fecha_bitacora, hora_bitacora FROM bitacora, usuarios WHERE usuarios.cedula_usuario = bitacora.cedula_usuario ORDER BY id_bitacora DESC");
				}else{
					$query = parent::prepare("SELECT id_bitacora, usuarios.cedula_usuario, usuarios.id_rol, usuarios.nombre_usuario, usuarios.correo, usuarios.estatus, modulo_bitacora, accion_bitacora, fecha_bitacora, hora_bitacora FROM bitacora, usuarios WHERE usuarios.cedula_usuario = bitacora.cedula_usuario and bitacora.fecha_bitacora BETWEEN :last and :actual ORDER BY id_bitacora DESC");
					$query->bindValue(":last",$data['last']);
					$query->bindValue(":actual",$data['actual']);
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

		private function Agregar($date){

			try{
	        $query = parent::prepare('INSERT INTO bitacora (id_bitacora, cedula_usuario, modulo_bitacora, accion_bitacora, fecha_bitacora, hora_bitacora, estatus) VALUES (DEFAULT, :cedula_usuario, :modulo_bitacora, :accion_bitacora, :fecha_bitacora, :hora_bitacora, 1)');
	        $query->bindValue(':cedula_usuario', $date['cedula']);
	        $query->bindValue(':modulo_bitacora', $date['modulo']);
	        $query->bindValue(':accion_bitacora', $date['accion']);
	        $query->bindValue(':fecha_bitacora', $date['fecha']);
	        $query->bindValue(':hora_bitacora', $date['hora']);
	        $query->execute();
	        $respuestaArreglo = $query->fetchAll();
	        // print_r($respuestaArreglo);
	        if ($respuestaArreglo += ['estatus' => true]) {
	        	$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
				return $Result;
	        }
	      } catch(PDOException $e){
	      	// print_r($e);
	        	$errorReturn = ['estatus' => false];
	      		$errorReturn['msj'] = "Error";
		        $errorReturn += ['info' => "Error sql:{$e}"];
		        return $errorReturn; 
	      }
		}

		public function Monitorear($url){
			if(!empty($_REQUEST['url'])){
				$reqBitacora = explode('/', $_REQUEST['url']);
			}
			if(!empty($reqBitacora[1])){
				$metodoBitacora = $reqBitacora[1];
			}else{
				$metodoBitacora = "Consultar";
			}
			if($url=="Home"){ $url = "Inicio"; }
			if($url=="Login"){ $url = "Inicio De Sesión"; }
			if($url=="Logout"){ $url = "Cerrar Sesión"; }
			if($metodoBitacora=="Cargar"){ $metodoBitacora = "Agregar Desde Excel"; }
			$dataBitacora['cedula'] = $_SESSION['cuenta_usuario']['cedula_usuario'];
			$dataBitacora['modulo'] = ucwords(mb_strtolower($url));
			$dataBitacora['accion'] = ucwords(mb_strtolower($metodoBitacora));
			$dataBitacora['fecha'] = date('Y-m-d');
			$dataBitacora['hora'] = date('h:i a');

			$bitacoraBuscar = self::Consultar($dataBitacora);
			$procederBitacora = "0";
			if(count($bitacoraBuscar)>0){
				$resulBitacora = $bitacoraBuscar[0];
				if(($resulBitacora['modulo_bitacora']==$dataBitacora['modulo']) && ($resulBitacora['accion_bitacora']==$dataBitacora['accion'])){
					$procederBitacora = "0";
				}else{
					$procederBitacora = "1";
				}
			}else{
				$procederBitacora = "1";
			}
			if($procederBitacora=="1"){
				$bitacoraExec = self::Agregar($dataBitacora);
			}
		}

		public function arreglarFecha($date){
			$anio = substr($date, 0, 4);
			$mes = substr($date, 5, 2);
			$dia = substr($date, 8, 2);
			$fecha = $dia.'-'.$mes.'-'.$anio;
			return $fecha;
		}
	}

?>