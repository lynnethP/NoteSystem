<?php
	namespace content\controllers;
	use content\traits\Utility as Utility;
	use config\settings\sysConfig as sysConfig;
	use content\modelo\mantenimientoModel as mantenimientoModel;

	class frontController extends sysConfig{
		use Utility;
		private $url;
		private $direccion;
		private $controlador;
		private $utility;

		private $request;
		private $controller;
		private $method;
		private $params;

		public function __construct($request){
			/* Si la url no existe, está en blanco o no cumple con los parámetros devuelve valor por defecto */
			if(empty($request['url'])){$request['url']="";}
			$this->request = $request['url'];
			$this->Url();
			$this->Controller();
			$this->Method();
			$this->Param();

			$this->Validar_URL();

			$_SESSION['accesoTemporalActualUser'] = _ACC_USER_;
			$_SESSION['accesoTemporalActualPass'] = _ACC_PASS_;

			$this->Respaldo_BD();
		}

		public function Url(){
			$this->url = explode('/', $this->request);
			$this->direccion = _DIRECTORY_;
			$this->controlador = _CONTROLLER_;
		}
		
		public function Controller(){
			$control = $this->desencriptar($this->url[0]);
			if(!empty($_SESSION['cuentaActiva']) && $_SESSION['cuentaActiva']==true && 
			   !empty($_SESSION['cuenta_usuario']) && !empty($_SESSION['cuenta_persona'])
			){
				if(!empty($_SESSION['cuenta_usuario']) && 
				   $_SESSION['cuenta_usuario']['estatus']=="2"){
					
					$this->controller = $control == 'Logout' ? $control : 'Preguntas';
				}
				if(!empty($_SESSION['cuenta_usuario']) && 
				   $_SESSION['cuenta_usuario']['estatus']=="1"){
					$this->controller = $control == '' ? 'Home' : $control;
				}
			}else{
				$this->controller = 'Login';
			}
			$this->url[0] = $this->controller;
		}
		
		public function Method(){
			$this->method = !empty($this->url[1]) ? $this->url[1] : 'Consultar';
		}
		public function Param(){
			$this->params = !empty($this->url[2]) ? $this->url[2] : '';
		}

		private function Validar_URL(){
			$url = preg_match_all("/^[a-zA-Z0-9-@\/.=:_#$ ]{1,700}$/", $this->url[0]);
			if($url == 1){
				$this->Cargar_Pagina($this->url[0]); /* llamdo de la funcion que cargara las vistas */
			}else{	
				require_once("errorController.php");	
			}
		}

		private function Cargar_Pagina($url){
			if(file_exists($this->direccion.mb_strtolower($url).$this->controlador)){
				require_once($this->direccion.mb_strtolower($url).$this->controlador); 
				
				$root = str_replace("/", "\\", $this->direccion);
				$method = $this->method;
				$param = $this->params;

				$class = $root.mb_strtolower($url)."Controller";
				if(class_exists($class)){
					$object = new $class($url);
					if(method_exists($object, $method)){
						$object->$method($param);
					}else{
						require_once("errorController.php");					
					}
				}else{
					require_once("errorController.php");					
				}
			}else{
				require_once("errorController.php");					
			}	
		}

		private function Respaldo_BD(){
			$manteniment = new mantenimientoModel();
			$unDia = 3600*24;
			$unaSemana = $unDia*7;
			$unaQuincena = $unDia*15;
			$unMes = $unDia*30;
			$date = date('Y-m-d', time());
			$dateReq = date('Y-m-d', time()-($unaSemana));
			$lastBackup = "libs/backup/automatico/lastBackup.txt";
			$lastDate = "";
			if (file_exists($lastBackup)) {
				$handle = fopen($lastBackup,'r');
				if (!$handle){
					$info = "No se ha podido abrir el archivo";
				}else{
					$lastDate = fread($handle, 10);
				}
				fclose($handle);
			}
			$respaldar = false;
			if($lastDate!=""){
				if($dateReq >= $lastDate){ $respaldar = true; }
			}else{
				$respaldar = true;
			}
			if($respaldar == true){
				$archivo = "libs/backup/automatico/" . _DB_WEB_ . "_" . $date . ".sql";
				if (file_exists($archivo)) {
					$info = "Ya se encuentra respaldado";
				} else {
					$mantenimiento = $manteniment->Respaldar($date);
					if($mantenimiento['ejecucion']==true){
						$info = "Respaldo exitoso";
						$handle = fopen($lastBackup,'w+');
						fwrite($handle, $date);
						fclose($handle);
					}else{
						$info = "Error al respaldar";
					}
				}
			}
		}

	}


?>