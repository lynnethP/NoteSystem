<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\traits\Utility;

	class homeController{
		use Utility;
		private $url;
		private $home;
		private $bitacora;
		private $notificacion;
		
		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->home = new homeModel();
			$this->bitacora = new bitacoraModel();
		}

		public function Consultar(){
			$objModel = new homeModel;
			$_css = new headElement;
			$_css->Heading();
			$this->bitacora->monitorear($this->url);

			$url = $this->url;
			require_once("view/homeView.php");
		}

	}
		

?>