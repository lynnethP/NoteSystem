<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\clasesModel as clasesModel;
	use content\modelo\seccionesModel as seccionesModel;
	use content\modelo\periodosModel as periodosModel;
	use content\modelo\saberesModel as saberesModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\profesoresModel as profesoresModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class clasesController{
		use Utility;
		private $url;
		private $clase;
		private $seccion;
		private $periodo;
		private $saber;
		private $profesor;
		private $bitacora;
		private $idClase;
		private $notificacion;
		private $rol;
		private $accesos;
		
		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->clase = new clasesModel();
			$this->seccion = new seccionesModel();
			$this->periodo = new periodosModel();
			$this->saber = new saberesModel();
			$this->profesor = new profesoresModel();
			$this->bitacora = new bitacoraModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Clases"];
			$this->accesos = $this->rol->validarConsultar("ConsultarAccesosModulo", $rolAc);
		} 

		public function Consultar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Consultar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				$_css = new headElement;
				$_css->Heading(); 
				$this->bitacora->monitorear($this->url);

				$clases = $this->clase->validarConsultar("Consultar");
				$periodos = $this->periodo->validarConsultar("Consultar");
				$secciones = $this->seccion->validarConsultar("Consultar");
				$saberes = $this->saber->validarConsultar("Consultar");
				$profesores = $this->profesor->validarConsultar("Consultar");
				
				$url = $this->url;
				require_once("view/clasesView.php");
			}else{
				require_once("errorController.php");
			}
		}

		public function Buscar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Consultar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if($_POST){		
					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['userNofif'])))) {
						$buscar = $this->seccion->validarConsultar("getOne", $_POST['userNofif']);
						echo json_encode($buscar);
					}
					if(!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['saberes']))) && !empty(trim(isset($_POST['id_periodo']))) && !empty(trim(isset($_POST['cod_seccion'])))){
						$id_periodo = $_POST['id_periodo'];
						$cod_seccion = $_POST['cod_seccion'];
						$periodosG = $this->periodo->validarConsultar("getOneId", $id_periodo);
						$seccionesG = $this->seccion->validarConsultar("getOne", $cod_seccion);
						$trayecto = "";
						$fase = "";
						if(!empty($seccionesG['data'][0]['trayecto_seccion'])){
							$trayecto = $seccionesG['data'][0]['trayecto_seccion'];
						}
						if(!empty($periodosG['data'][0]['nombre_periodo'])){
							$fase = $periodosG['data'][0]['nombre_periodo'];
						}
						$response = [];
						if($trayecto!="" && $fase != ""){
							$trayectoN = "";
							$faseN = "";
							if($trayecto=="I"){ $trayectoN = "1"; }else if($trayecto=="1"){ $trayectoN = "1"; }
							if($trayecto=="II"){ $trayectoN = "2"; }else if($trayecto=="2"){ $trayectoN = "2"; }
							if($trayecto=="III"){ $trayectoN = "3"; }else if($trayecto=="3"){ $trayectoN = "3"; }
							if($trayecto=="IV"){ $trayectoN = "4"; }else if($trayecto=="4"){ $trayectoN = "4"; }
							if($fase=="I"){ $faseN = "1"; }else if($fase=="1"){ $faseN = "1"; }
							if($fase=="II"){ $faseN = "2"; }else if($fase=="2"){ $faseN = "2"; }
							// echo $trayectoN."-".	$faseN;
							$buscar = $this->saber->validarConsultar("getSaber", $trayectoN,$faseN);
							if(count($buscar)>0){
								$response['data'] = [];
								$indx = 0;
								foreach ($buscar as $key) {
									if($key['id_SC']){
										$response['data'][$indx] = $key;
										$indx++;
									}
								}
								$response['msj'] = "Good";
								$buscar2 = $this->clase->validarConsultar("Consultar", ['campo'=>"cod_seccion", 'valor'=>$cod_seccion]);
								if(count($buscar2)>0){
									$response['msjSaberes'] = "Good";
									$response['dataSaberes'] = $buscar2;
								}else{
									$response['msjSaberes'] = "Vacio";
								}
							}else{
								$response['msj'] = "Vacio";
							}
						}else{
							$response['msj'] = "Vacio";
						}
						echo json_encode($response);
					}
					if(!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['periodos']))) && !empty(trim(isset($_POST['cod_seccion'])))){
						$cod_seccion = $_POST['cod_seccion'];
						$seccionesG = $this->seccion->validarConsultar("getOne", $cod_seccion);
						$year = date("Y");
						if(count($seccionesG['data'])>1){
							$year = $seccionesG['data'][0]['year_seccion'];
						}
						$buscar = $this->periodo->validarConsultar("getOneYear", $year);
						if(count($buscar['data'])>1){
							$response['data'] = [];
							$indx = 0;
							foreach ($buscar['data'] as $dataT) {
								if(!empty($dataT['id_periodo'])){
									$response['data'][$indx] = $dataT;
									$indx++;
								}
							}
							$response['msj'] = "Good";
							$buscar2 = $this->clase->validarConsultar("Consultar", ['campo'=>"year", 'valor'=>$year]);
							if(count($buscar2)>0){
								$response['msjPeriodos'] = "Good";
								$response['dataPeriodos'] = [];
								$indx = 0;
								foreach ($buscar2 as $key) {
									if(!empty($key['id_periodo'])){
										$response['dataPeriodos'][$indx] = $key;
										$indx++;
									}
								}
								// $response['dataPeriodos'] = $buscar2;
								// print_r($response);
								// echo count($buscar2);
								// print_r($response['dataPeriodos']);
							}else{
								$response['msjPeriodos'] = "Vacio";
							}
						}else{
							$response['msj'] = "Vacio";
						}
						echo json_encode($response);
					}

				}else{
					header("location:./");
				}
			}else{
				echo json_encode(['msj' => "Denegado"]);
			}
		}
		
		public function Agregar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Agregar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if($_POST){		
					if (!empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['periodo']))) && !empty(trim(isset($_POST['saber']))) && !empty(trim(isset($_POST['profesor'])))) {
						$_POST = $this->clase->limpiarPost($_POST);
						$datos['seccion'] = $_POST['seccion'];
						$datos['periodo'] = $_POST['periodo'];
						$datos['saber'] = $_POST['saber'];
						$datos['profesor'] = $_POST['profesor'];
						$buscar = $this->clase->validarConsultar("getOne", $datos);
						// print_r($buscar);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								 // print_r($buscar['data'][0]['estatus']);
								if($buscar['data'][0]['estatus']==0){
									/*$datos['id'] = $buscar['data'][0]['id_clase'];*/
									$datos['id'] = $datos['id_clase'];
						 			$exec = $this->clase->ValidarAgregarOModificar($datos, "Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->clase->ValidarAgregarOModificar($datos, "Agregar");
								if($exec['msj']=="Good"){
									$dataNotificacion['tabla_notificacion'] = "clases";
									$dataNotificacion['elemento_tabla'] = "id";
									$dataNotificacion['id_tabla'] = $exec['id'];
									$dataNotificacion['codigo_tabla'] = "";
									$dataNotificacion['fecha_notificacion'] = date('Y-m-d');
									$dataNotificacion['hora_notificacion'] = date('h:i a');
									$dataNotificacion['visto_alumnos'] = 9;
									$dataNotificacion['visto_profesores'] = 0;
									$dataNotificacion['visto_admin'] = 0;
									$dataNotificacion['visto_superusuario'] = 0;
									$buscarNotificacion = $this->notificacion->Buscar($dataNotificacion);
									if (count($buscarNotificacion) < 1) {
										$res = $this->notificacion->Agregar($dataNotificacion);
									}
								}
								echo json_encode($exec);
							}
						}else{
							echo json_encode(['msj'=>"Error"]);
						}
					}else{
						echo json_encode(['msj'=>"Vacio"]);
					}
				}else{
					header("location:./");
				}
			}else{
				echo json_encode(['msj' => "Denegado"]);
			}
		}

		

		public function Modificar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Modificar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if($_POST){
					if (!empty(trim(isset($_POST['saber']))) && !empty(trim(isset($_POST['id_clase']))) && !empty(trim(isset($_POST['periodo']))) && !empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['profesor'])))) {
						$_POST = $this->clase->limpiarPost($_POST);
						$datos['id_clase'] = $_POST['id_clase'];
						$datos['seccion'] = $_POST['seccion'];
						$datos['periodo'] = $_POST['periodo'];
						$datos['saber'] = $_POST['saber'];
						$datos['profesor'] = $_POST['profesor'];

						$buscar = $this->clase->validarConsultar("getOne", $datos);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($_POST['id_clase']==$buscar['data'][0]['id_clase']){
									$exec = $this->clase->ValidarAgregarOModificar($datos, "Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->clase->ValidarAgregarOModificar($datos, "Modificar"); 
								echo json_encode($exec);
							}
						}else{
							echo json_encode(['msj'=>"Error"]);
						}
					}else{
						echo json_encode(['msj'=>"Vacio"]);
					}
				}else{
					header("location:./");
				}
			}else{
				echo json_encode(['msj' => "Denegado"]);
			}
		} 

		public function Eliminar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Eliminar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if($_POST){		
					if (!empty(trim(isset($_POST['Eliminar']))) && !empty(trim(isset($_POST['claseDelete'])))) {
						$buscar = $this->clase->validarConsultar("getOneC", $_POST['claseDelete']);
						/*print_r($buscar);*/
						if($buscar['msj']=="Good"){
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								 // print_r($buscar['data'][0]['estatus']);
								$exec = $this->clase->validarEliminar($_POST['claseDelete']);
								$exec['data'] = $data;

								$dat['tabla'] = "clases";
								$dat['id'] = $_POST['claseDelete'];
								$respB = $this->notificacion->Eliminar($dat);

								echo json_encode($exec);
							}else{
								echo json_encode(['msj'=>"Error"]);
							}
							$this->bitacora->monitorear($this->url);
						}else{
							echo json_encode(['msj'=>"Error"]);
						}
					}
				}else{
					header("location:./");
				}
			}else{
				echo json_encode(['msj' => "Denegado"]);
			}
		}
}		
		

?>