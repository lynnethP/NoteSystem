<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\rolesModel as rolesModel;
	use content\modelo\permisosModel as permisosModel;
	use content\modelo\modulosModel as modulosModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\traits\Utility;
	
	class rolesController{
		use Utility;
		private $url;
		private $rol;
		private $modulo;
		private $permiso;
		private $bitacora;
		private $notificacion;
		private $accesos;

		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->rol = new rolesModel();
			$this->permiso = new permisosModel();
			$this->modulo = new modulosModel();

			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Roles"];
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
				$roles = $this->rol->validarConsultar("Consultar");	
				$accesos = $this->rol->validarConsultar("ConsultarAccesos");
				$permisos = $this->permiso->validarConsultar("Consultar");
				$modulos = $this->modulo->validarConsultar("Consultar");	
				$url = $this->url;
				require_once("view/rolesView.php");
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
						$json = $this->rol->validarConsultar("getOneId", $_POST['userNofif']);
						echo json_encode($json);
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
					if (!empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['nombre']))) && !empty($_POST['accesos'])) {
						$_POST = $this->rol->limpiarPost($_POST);
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$index = 0;
						$nombres = $_POST['accesos'][0];
						$valores = $_POST['accesos'][1];
						$idm = $_POST['accesos'][2];
						$idp = $_POST['accesos'][3];
						$accesos = [];
						foreach ($valores as $keys) {
							$accesos[$index] = ["nombre"=>$nombres[$index], "valor"=>$keys, "id_modulo"=>$idm[$index], "id_permiso"=>$idp[$index]];
							$index++;
						}
						$buscar = $this->rol->validarConsultar("getOne", $datos['nombre']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($buscar['data'][0]['estatus']=="0"){
									$datos['id_rol'] = $buscar['data'][0]['id_rol'];
									$exec = $this->rol->ValidarAgregarOModificar($datos, "Modificar"); 
									if($exec['msj']=="Good"){
										$data['id_rol'] = $datos['id_rol'];
										$execB = $this->rol->validarEliminar("EliminarAccesosP", $data);
										if($execB['msj']=="Good"){
											foreach ($accesos as $acc) {
												if($acc['valor']=="on"){
													$data['id_modulo'] = $acc['id_modulo'];
													$data['id_permiso'] = $acc['id_permiso'];
													$exec = $this->rol->ValidarAgregarOModificar($data, "AgregarAccesos");
												}
											}
											echo json_encode($exec);
										}else{
											echo json_encode(['msj'=>"Error"]);
										}
									}else{
										echo json_encode($exec);
									}
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->rol->ValidarAgregarOModificar($datos, "Agregar");
								if($exec['msj']=="Good"){
									if(!empty($exec['data'])){
										$dat = $exec['data'];
										if(!empty($dat['id'])){
											$id_rol = $dat['id'];
											$data['id_rol'] = $id_rol;
											$execB = $this->rol->validarEliminar("EliminarAccesosP", $data);
											if($execB['msj']=="Good"){
												foreach ($accesos as $acc) {
													if($acc['valor']=="on"){
														$data['id_modulo'] = $acc['id_modulo'];
														$data['id_permiso'] = $acc['id_permiso'];
														$exec = $this->rol->ValidarAgregarOModificar($data, "AgregarAccesos");
													}
												}
												echo json_encode($exec);
											}else{
												echo json_encode(['msj'=>"Error"]);
											}
										}else{
											echo json_encode($exec);
										}
									}else{
										echo json_encode(['msj'=>"Error"]);
									}
								}else{
									echo json_encode($exec);
								}
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
					if (!empty(trim(isset($_POST['id']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['Editar']))) && !empty($_POST['accesos'])) {
						$_POST = $this->rol->limpiarPost($_POST);
						$datos['id_rol'] = $_POST['id'];
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$index = 0;
						$nombres = $_POST['accesos'][0];
						$valores = $_POST['accesos'][1];
						$idm = $_POST['accesos'][2];
						$idp = $_POST['accesos'][3];
						$accesos = [];
						print_r($valores);
						foreach ($valores as $keys) {
							$accesos[$index] = ["nombre"=>$nombres[$index], "valor"=>$keys, "id_modulo"=>$idm[$index], "id_permiso"=>$idp[$index]];
							$index++;
						}
						$buscar = $this->rol->validarConsultar("getOne", $datos['nombre']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($_POST['id']==$buscar['data'][0]['id_rol']){
									$datos['id_rol'] = $buscar['data'][0]['id_rol'];
									$exec = $this->rol->ValidarAgregarOModificar($datos, "Modificar"); 
									if($exec['msj']=="Good"){
										$data['id_rol'] = $datos['id_rol'];
										$execB = $this->rol->validarEliminar("EliminarAccesosP", $data);
										if($execB['msj']=="Good"){
											foreach ($accesos as $acc) {
												if($acc['valor']=="on"){
													$data['id_modulo'] = $acc['id_modulo'];
													$data['id_permiso'] = $acc['id_permiso'];
													$exec = $this->rol->ValidarAgregarOModificar($data, "AgregarAccesos");
												}
											}
											echo json_encode($exec);
										}else{
											echo json_encode(['msj'=>"Error"]);
										}
									}else{
										echo json_encode($exec);
									}
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->rol->ValidarAgregarOModificar($datos, "Modificar");
								if($exec['msj']=="Good"){
									$data['id_rol'] = $datos['id_rol'];
									$execB = $this->rol->validarEliminar("EliminarAccesosP", $data);
									if($execB['msj']=="Good"){
										foreach ($accesos as $acc) {
											if($acc['valor']=="on"){
												$data['id_modulo'] = $acc['id_modulo'];
												$data['id_permiso'] = $acc['id_permiso'];
												$exec = $this->rol->ValidarAgregarOModificar($data, "AgregarAccesos");
											}
										}
										echo json_encode($exec);
									}else{
										echo json_encode(['msj'=>"Error"]);
									}
								}else{
									echo json_encode($exec);
								}
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
						$buscar = $this->rol->validarConsultar("getOneId", $_POST['userDelete']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$data['id_rol'] = $_POST['userDelete'];
								$exec = $this->rol->validarEliminar("Eliminar", $data);
								$exec2 = $this->rol->validarEliminar("EliminarAccesosP", $data);
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