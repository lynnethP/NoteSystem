<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\saberesModel as saberesModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class saberesController{
		use Utility;
		private $url;
		private $saber;
		private $bitacora;
		private $notificacion;
		private $rol;
		private $accesos;

		function __construct($url){			
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->saber = new saberesModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Saberes"];
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
				$saberes = $this->saber->validarConsultar("Consultar");
				$url = $this->url;
				require_once("view/saberesView.php");
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
						$buscar = $this->saber->validarConsultar("getOne", $_POST['userNofif']);
						echo json_encode($buscar);
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
					if(!empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['nombreSC']))) && !empty(trim(isset($_POST['trayectoSC']))) && !empty(trim(isset($_POST['faseSC'])))){
						$_POST = $this->saber->limpiarPost($_POST);
						$datos['nombreSC'] = ucwords(mb_strtolower($_POST['nombreSC']));
						$datos['trayectoSC'] = ucwords(mb_strtolower($_POST['trayectoSC']));
						$datos['faseSC'] = $_POST['faseSC'];
						$buscar = $this->saber->validarConsultar("getOne", $_POST['nombreSC']);
						if ($buscar['msj']=="Good") {
							$this->bitacora->monitorear($this->url);
						    if(count($buscar['data'])>1){
						    	if($datos['nombreSC']==$buscar['data'][0]['nombreSC']){
						    		$datos['id_SC'] = $buscar['data'][0]['id_SC'];
									$exec = $this->saber->ValidarAgregarOModificar($datos, "Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->saber->ValidarAgregarOModificar($datos, "Agregar"); 
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
					if (!empty(trim(isset($_POST['nombreSC']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['trayectoSC']))) && !empty(trim(isset($_POST['faseSC'])))){
						$_POST = $this->saber->limpiarPost($_POST);
						$datos['nombreSC'] = ucwords(mb_strtolower($_POST['nombreSC']));
						$datos['trayectoSC'] = ucwords(mb_strtolower($_POST['trayectoSC']));
						$datos['faseSC'] = $_POST['faseSC'];
						$datos['id_SC'] = $_POST['codigo'];
						$buscar = $this->saber->validarConsultar("getOne", $_POST['nombreSC']);

						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$busq = $buscar['data'][0];
								if($datos['id_SC']==$busq['id_SC']){
									$exec = $this->saber->ValidarAgregarOModificar($datos, "Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->saber->ValidarAgregarOModificar($datos, "Modificar"); 
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
						$buscar = $this->saber->validarConsultar("getOneId", $_POST['userDelete']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$exec = $this->saber->validarEliminar($_POST['userDelete']);
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