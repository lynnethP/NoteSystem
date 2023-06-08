<?php
	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\mantenimientoModel as mantenimientoModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class mantenimientoController{
		use Utility;
		private $url;
		private $manteniment;
		private $bitacora;
		private $notificacion;
		private $rol;
		
		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->manteniment = new mantenimientoModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Mantenimiento"];
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
				$url = $this->url;
				require_once("view/mantenimientoView.php");
			}else{
				require_once("errorController.php");
			}
		}

		public function Respaldar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Agregar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if(!empty($_POST)){
					$mantenimiento = $this->manteniment->Respaldar();
					if($mantenimiento['ejecucion']=="1"){
						$this->bitacora->monitorear($this->url);
						if(!empty($mantenimiento['response'])){
							$result['msj'] = "Good";
							$result['rutaFile'] = $mantenimiento['response'];
						}else{
							$result['msj'] = "Vacio";
						}
					}else{
						$result['msj'] = "Error";
					}
					echo json_encode($result);
				}
			}else{
				require_once("errorController.php");
			}
		}
		
		public function Restaurar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Modificar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				$file = $_FILES['file'];
				if( !empty($file['name']) && !empty($file['type']) && !empty($file['tmp_name']) &&
					!empty($file['error']) && !empty($file['size']) ){
					$name_file = $file['name'][0];
					$tipo_file = $file['type'][0];
					$ruta_file = $file['tmp_name'][0];
					$error_file = $file['error'][0];
					$size_file = $file['size'][0];
					if($error_file==0){
						$newRuta = "libs/restore/";
						$newName = _DB_WEB_."_".date("Y-m-d__H-i-s");
						copy($ruta_file, $newRuta.$newName);
						$restauracion = $this->manteniment->Restaurar($newRuta.$newName);
						$this->bitacora->monitorear($this->url);
						unlink($newRuta.$newName);
						echo json_encode($restauracion);
					}else{
						echo json_encode(['stat'=>2, 'message'=>'Error en la subida del Archivo']);
					}
				}else{
					echo json_encode(['stat'=>2, 'message'=>'Error en la subida del Archivo']);
				}
			}else{
				require_once("errorController.php");
			}
		}

		public function Borrarfile(){
			$resul = unlink($_POST['file']);
			if($resul=="1"){
				$result['msj'] = "Good";
			}else{
				$result['msj'] = "Error";
			}
			echo json_encode($result);
		}

	}
		

?>