<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\modulosModel as modulosModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class modulosController{
		use Utility;
		private $url;
		private $modulo;
		private $bitacora;
		private $notificacion;
		private $rol;
		private $accesos;

		function __construct($url){			
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->modulo = new modulosModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Modulos"];
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
				$modulos = $this->modulo->validarConsultar("Consultar");
				$url = $this->url;
				require_once("view/modulosView.php");
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
					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['moduloM'])))) {
						$buscar = $this->modulo->validarConsultar("getOne", $_POST['moduloM']);
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
					if (!empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['nombre']))) ) {
						$_POST = $this->modulo->limpiarPost($_POST);
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$buscar = $this->modulo->validarConsultar("getOneNombre", $datos['nombre']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($buscar['data'][0]['estatus']==0){
									$datos['id'] = $datos['cedula'];
									$exec = $this->modulo->ValidarAgregarOModificar($datos, "Modificar");
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->modulo->ValidarAgregarOModificar($datos, "Agregar"); 
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
					if (!empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['nombre'])))) {
						$_POST = $this->modulo->limpiarPost($_POST);
						$datos['id'] = $_POST['codigo'];
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$buscar = $this->modulo->validarConsultar("getOneNombre", $datos['nombre']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($_POST['codigo']==$buscar['data'][0]['id_modulo']){
									$exec = $this->modulo->ValidarAgregarOModificar($datos, "Modificar");
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->modulo->ValidarAgregarOModificar($datos, "Modificar");
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
					if (!empty(trim(isset($_POST['Eliminar']))) && !empty(trim(isset($_POST['modeloDelete'])))) {
						$buscar = $this->modulo->validarConsultar("getOne", $_POST['modeloDelete']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$exec = $this->modulo->validarEliminar($_POST['modeloDelete']);
								$exec['data'] = $data;
								echo json_encode($exec);
							}else{
								echo json_encode(['msj'=>"Error"]);
							}
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