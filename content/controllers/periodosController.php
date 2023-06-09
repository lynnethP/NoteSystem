<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\periodosModel as periodosModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class periodosController{
		use Utility;

		private $url;
		private $periodo;
		private $bitacora;
		private $notificacion;
		private $rol;
		private $accesos;

		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->periodo = new periodosModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Periodos"];
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
				$periodos = $this->periodo->validarConsultar("Consultar");
				$url = $this->url;
				require_once("view/periodosView.php");
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
					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['userNofifId'])))) {
						$buscar = $this->periodo->validarConsultar("getOneId" ,$_POST['userNofifId']);
						echo json_encode($buscar);
					}

					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['periodos']))) && !empty(trim(isset($_POST['year'])))) {
						$yearPeriodo = $_POST['year'];
						$buscar = $this->periodo->validarConsultar("getOneYear" ,$yearPeriodo);
						if(count($buscar)>1){
							$dat = [];
							$indx = 0;
							foreach ($buscar['data'] as $key) {
								if(!empty($key['id_periodo'])){
									$dat[$indx] = $key;
									$indx++;
								}
							}
							$resp['msj']="Good";
							$resp['data']=$dat;
						}else{
							$resp['msj'] = "Vacio";
						}
						echo json_encode($resp);
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
					if( !empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['numeroPr']))) && !empty(trim(isset($_POST['yearPeriodo'])))  && !empty(trim(isset($_POST['fechaAP']))) && !empty(trim(isset($_POST['fechaAC'])))){
						$_POST = $this->periodo->limpiarPost($_POST);
						$datos['numeroPr'] = mb_strtoupper($_POST['numeroPr']);
						$datos['yearPeriodo'] = $_POST['yearPeriodo'];
						$datos['fechaAP'] = $_POST['fechaAP'];
						$datos['fechaAC'] = $_POST['fechaAC'];
						
						$buscar = $this->periodo->validarConsultar("getOne", $_POST['numeroPr'], $_POST['yearPeriodo']);
	                    // print_r($datos);
						if ($buscar['msj']=="Good") {
							// $this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								// print_r($buscar['data'][0]['estatus']);
								if($buscar['data'][0]['estatus']=="0"){
									$exec = $this->periodo->ValidarAgregarOModificar($datos,"Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->periodo->ValidarAgregarOModificar($datos,"Agregar");
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
					if ( !empty(trim(isset($_POST['numeroPr']))) && !empty(trim(isset($_POST['yearPeriodo']))) && !empty(trim(isset($_POST['fechaAP']))) && !empty(trim(isset($_POST['fechaAC']))) && !empty(trim(isset($_POST['id_periodo'])))){
						$_POST = $this->periodo->limpiarPost($_POST);
						// $datos['numeroPr'] = ucwords(mb_strtolower($_POST['numeroPr']));
						$datos['numeroPr'] = mb_strtoupper($_POST['numeroPr']);
						$datos['yearPeriodo'] = $_POST['yearPeriodo'];
						$datos['fechaAP'] = $_POST['fechaAP'];
						$datos['fechaAC'] = $_POST['fechaAC'];
						$datos['id_periodo'] = $_POST['id_periodo'];

						$buscar = $this->periodo->validarConsultar("getOne" ,$_POST['numeroPr'], $_POST['yearPeriodo']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$busq = $buscar['data'][0];
								if($datos['id_periodo']==$busq['id_periodo']){
									$exec = $this->periodo->ValidarAgregarOModificar($datos,"Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->periodo->ValidarAgregarOModificar($datos,"Modificar"); 
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
					if (!empty(trim(isset($_POST['Eliminar']))) && !empty(trim(isset($_POST['userDelete'])))) {
						$buscar = $this->periodo->validarConsultar("getOneId", $_POST['userDelete']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$exec = $this->periodo->validarEliminar($_POST['userDelete']);
								$exec['data'] = $data;
								echo json_encode($exec);
							}else{
								echo json_encode(['msj'=>"Error No encontrado"]);
							}
						}else{
							echo json_encode(['msj'=>"ErrorEn busqueda"]);
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