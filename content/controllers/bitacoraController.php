<?php
	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class bitacoraController{
		use Utility;
		private $url;
		private $home;
		private $bitacora;
		private $notificacion;
		private $rol;
		
		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Bitacora"];
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
				if(!empty($_GET['L']) && !empty($_GET['A'])){
					$_GET = $this->bitacora->limpiarDatos($_GET);
					$datos['last'] = $_GET['L'];
					$datos['actual'] = $_GET['A'];
				}else{
					$datos="";
				}
				$bitacoras = $this->bitacora->validarConsultar($datos);
				$url = $this->url;
				require_once("view/bitacoraView.php");
			}else{
				require_once("errorController.php");
			}
		}
	}
		

?>