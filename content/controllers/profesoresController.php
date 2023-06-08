<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\profesoresModel as profesoresModel;
	use content\modelo\alumnosModel as alumnosModel;
	use content\modelo\usuariosModel as usuariosModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use PhpOffice\PhpSpreadsheet\IOFactory;
	use content\traits\Utility;

	class profesoresController{
		use Utility;
		private $url;
		private $profesor;
		private $alumno;
		private $usuario;
		private $bitacora;
		private $notificacion;
		private $rol;
		private $accesos;

		function __construct($url){			
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->profesor = new profesoresModel();
			$this->alumno = new alumnosModel();
			$this->usuario = new usuariosModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Profesores"];
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
				$profesores = $this->profesor->validarConsultar("Consultar");
				$usuarios = $this->usuario->validarConsultar("Consultar");
				$url = $this->url;
				require_once("view/profesoresView.php");
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
						$_POST = $this->profesor->limpiarPost($_POST);
						$buscar = $this->profesor->validarConsultar("getOne", $_POST['userNofif']);
						echo json_encode($buscar);
					}
				}else{
					header("location:./");
				}
			}else{
				echo json_encode(['msj' => "Denegado"]);
			}
		}

		public function Cargar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Agregar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if (!empty($_FILES)) {
					$documento = IOFactory::load($_FILES["file"]["tmp_name"][0]);
					$hojaProfesor = $documento->getSheet(0);
					$numeroFilas = $hojaProfesor->getHighestDataRow();
					$error = 0;
					$repit = 0;
					$success = 0;
					$rols = $this->rol->validarConsultar("getOne", "Profesores");
					if($rols['msj']=="Good"){
						if(count($rols['data']) > 1){		
							$idRolProfesor = $rols['data'][0]['id_rol']; 
						}else{
							$idRolProfesor = 0;
						}
					}
					for ($i=2; $i <= $numeroFilas; $i++) {
						$datos['cedula'] = str_replace(".", '', $hojaProfesor->getCellByColumnAndRow(1,$i));
						$datos['nombre'] = $hojaProfesor->getCellByColumnAndRow(2,$i);
						$datos['nombre'] = ucwords(mb_strtolower($datos['nombre']));
						$datos['apellido'] = $hojaProfesor->getCellByColumnAndRow(3,$i);
						$datos['apellido'] = ucwords(mb_strtolower($datos['apellido']));
						$datos['telefono'] = $hojaProfesor->getCellByColumnAndRow(4,$i);
						$datos['correo'] = $hojaProfesor->getCellByColumnAndRow(5,$i);
						if(str_replace(" ", "", trim($datos['cedula']))!="" && str_replace(" ", "", trim($datos['nombre']))!="" && str_replace(" ", "", trim($datos['apellido']))!="" && str_replace(" ", "", trim($datos['telefono']))!=""){
							$buscar = $this->profesor->validarConsultar("getOne", $datos['cedula']);
							if ($buscar['msj']=="Good"){
								if (count($buscar['data'])>1){
									$datos['id'] = $datos['cedula'];
									$exec = $this->profesor->ValidarAgregarOModificar($datos, "Modificar");
								} else {
									$buscar = $this->alumno->validarConsultar("getOne", $datos['cedula']);
									if ($buscar['msj'] == "Good") {
										if (count($buscar['data']) > 1) {
										}else{
											$exec = $this->profesor->ValidarAgregarOModificar($datos, "Agregar");
										}
									}
								}
								if($exec['msj']!="Good"){
									$error++;
								}
								if($exec['msj']=="Good"){
									$success++;
									if($idRolProfesor > 0){
										$respUser = $this->usuario->validarConsultar("getOne", $datos['cedula']);
										if($respUser['msj']=="Good"){
											if(count($respUser['data']) < 2){
												$correo = "";
												if(str_replace(" ", "", trim($datos['correo']))==""){
													$correo = mb_strtolower( str_replace( " ", "", $datos['nombre'] ) );
													$correo = $correo."@gmail.com";
												}else{
													$correo = mb_strtolower(str_replace(" ", "", trim($datos['correo'])));
												}
												$correo = mb_strtolower($correo);
												$buscarCorreo = $this->usuario->validarConsultar("Buscar", "correo", $correo);
												if(count($buscarCorreo)>0){
													$correoR = mb_strtolower( str_replace(" ", "", $datos['nombre'] ) );
													$correoR = $correo.$datos['cedula'];
													$correoR = $correo."@gmail.com";
													$correo = $correoR; 
												}
												$dataUser['nombre'] = mb_strtolower($datos['cedula']);
												$buscarUsername = $this->usuario->validarConsultar("Buscar", "username", $dataUser['nombre']);
												if(count($buscarUsername)>0){
												}else{
													// echo json_encode(['msj'=>"Repetido"])
													$passw = "Uptaeb.".date("Y");
													$dataUser['cedula'] = $datos['cedula'];
													$dataUser['correo'] = $correo;
													$dataUser['pass'] = $this->encriptarContrasena($passw);
													$dataUser['rol'] = $idRolProfesor;
													$exec = $this->usuario->ValidarAgregarOModificar($dataUser, "Agregar");
												}
											}
										}
									}
								}
							}
						}
					}
					if($error == 0){
						$this->bitacora->monitorear($this->url);
						echo json_encode(['msj' => "Good"]);
					}else{
						echo json_encode(['msj' => "Se encontraron $error errores"]);
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
					if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['apellido']))) && !empty(trim(isset($_POST['telefono'])))) {
						$_POST = $this->profesor->limpiarPost($_POST);
						$datos['cedula'] = $_POST['cedula'];
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$datos['apellido'] = ucwords(mb_strtolower($_POST['apellido']));
						$datos['telefono'] = $_POST['telefono'];
						$buscar = $this->profesor->validarConsultar("getOne", $_POST['cedula']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								// print_r($buscar['data'][0]['estatus']);
								if($buscar['data'][0]['estatus']==0){
									$datos['id'] = $datos['cedula'];
									$exec = $this->profesor->ValidarAgregarOModificar($datos, "Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$buscar = $this->alumno->validarConsultar("getOne", $_POST['cedula']);
								if ($buscar['msj'] == "Good") {
									if (count($buscar['data']) > 1) {
										echo json_encode(['msj' => "NegadoDuplicado"]);
									}else{
										$exec = $this->profesor->ValidarAgregarOModificar($datos, "Agregar"); 
										echo json_encode($exec);
									}
								} else {
									echo json_encode(['msj' => "Error"]);
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
					if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['apellido']))) && !empty(trim(isset($_POST['telefono'])))) {
						$_POST = $this->profesor->limpiarPost($_POST);
						$datos['id'] = $_POST['codigo'];
						$datos['cedula'] = $_POST['cedula'];
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$datos['apellido'] = ucwords(mb_strtolower($_POST['apellido']));
						$datos['telefono'] = $_POST['telefono'];
						$buscar = $this->profesor->validarConsultar("getOne", $_POST['cedula']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($_POST['codigo']==$_POST['cedula']){
									// echo "Actualizar 2";
									$usersAct = $this->usuario->validarConsultar("getOne", $datos['id']);
									if($usersAct['msj']=="Good"){
										if(count($usersAct['data'])>1){
											$exec2 = $this->usuario->ValidarAgregarOModificar($datos, "ActualizarCodUsuario");
										}
									}
									$exec = $this->profesor->ValidarAgregarOModificar($datos, "Modificar");
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$buscar = $this->alumno->validarConsultar("getOne", $_POST['cedula']);
								if ($buscar['msj'] == "Good") {
									if (count($buscar['data']) > 1) {
										echo json_encode(['msj' => "NegadoDuplicado"]);
									}else{
										$usersAct = $this->usuario->validarConsultar("getOne", $datos['id']);
										if($usersAct['msj']=="Good"){
											if(count($usersAct['data'])>1){
												$exec2 = $this->usuario->ValidarAgregarOModificar($datos, "ActualizarCodUsuario");
											}
										}
										$exec = $this->profesor->ValidarAgregarOModificar($datos, "Modificar"); 
										echo json_encode($exec);
									}
								} else {
									echo json_encode(['msj' => "Error"]);
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
						$_POST = $this->profesor->limpiarPost($_POST);
						$buscar = $this->profesor->validarConsultar("getOne", $_POST['userDelete']);
						if($buscar['msj']=="Good"){
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$exec = $this->profesor->validarEliminar($_POST['userDelete']);
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
