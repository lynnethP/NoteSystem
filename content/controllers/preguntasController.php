<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\preguntasModel as preguntasModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\usuariosModel as usuariosModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\traits\Utility;
	use phpseclib\Crypt\RSA;

	class preguntasController{
		use Utility;
		private $url;
		private $preg;
		private $usuario; 
		private $bitacora;
		private $objRSA;
		private $notificacion;

		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->preg = new preguntasModel();
			$this->usuario = new usuariosModel();
			$this->objRSA = new RSA();
		}

		public function Consultar(){
			$_css = new headElement;
			$_css->Heading();
			$this->bitacora->monitorear($this->url);
			
			$preguntas = $this->preg->validarConsultar("Consultar");
			$url = $this->url;
			require_once("view/preguntasView.php");
		}

		public function Buscar(){
			$objModel = new preguntasModel;
			$_css = new headElement;
			$_css->Heading();
			
			$url = $this->url;
			require_once("view/preguntasView.php");
		}
		

		public function Agregar(){
			if($_POST){		
				if (!empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['resp_uno']))) && !empty(trim(isset($_POST['resp_dos']))) && !empty(trim(isset($_POST['resp_tres']))) ){
					$datos['preg'] = array($_POST['preg_uno'], $_POST['preg_dos'], $_POST['preg_tres']);
					$datos['resp'] = array($this->encriptar($_POST['resp_uno']), $this->encriptar($_POST['resp_dos']), $this->encriptar($_POST['resp_tres']));
					$datos['cedula'] = $_SESSION['cuenta_usuario']['cedula_usuario'];
					$buscar = $this->preg->validarConsultar("getOne", $datos['cedula']);
					if($buscar['msj']=="Good"){
						$this->bitacora->monitorear($this->url);
						$exec2 = $this->preg->ValidarEliminar($datos['cedula']);
						if($exec2['msj']=="Good"){
							$exec = $this->preg->ValidarAgregarOModificar($datos, "Agregar");
							if($exec['msj']=="Good"){
								$dat['cedula'] = $_SESSION['cuenta_usuario']['cedula_usuario'];
								$_SESSION['cuenta_usuario']['estatus'] = "1";
								$exec = $this->usuario->ValidarAgregarOModificar($dat, "CompletarDatos");
								$cedula = $dat['cedula'];
								$firma = $this->encriptar($dat['cedula']);

								extract($this->objRSA->createKey(2048)); // publickey // privatekey
								$public_key = $this->encriptar($publickey);
								$private_key = $this->encriptar($privatekey);

								$exec3 = $this->usuario->ValidarEliminar("LimpiarLlaves", $cedula);
								if($exec3['msj']=="Good"){
									$dat['cedula'] = $cedula;
									$dat['firma'] = $firma;
									$dat['public_key'] = $public_key;
									$dat['private_key'] = $private_key;
									$exec = $this->usuario->ValidarAgregarOModificar($dat, "GuardarLlaves");
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
			}
		}




	}
		

?>