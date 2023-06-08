<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\usuariosModel as usuariosModel;
	use content\modelo\rolesModel as rolesModel;
	use content\modelo\alumnosModel as alumnosModel;
	use content\modelo\profesoresModel as profesoresModel;
	use content\modelo\preguntasModel as preguntasModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\traits\Utility;

	class usuariosController{
		use Utility;
		private $url;
		private $usuario;
		private $rol;
		private $alumno;
		private $profesor;
		private $bitacora;
		private $notificacion;
		private $accesos;

		function __construct($url){
			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->usuario = new usuariosModel();
			$this->rol = new rolesModel();
			$this->alumno = new alumnosModel();
			$this->profesor = new profesoresModel();
			$this->pregunta = new preguntasModel();

			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Usuarios"];
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
				$usuarios = $this->usuario->validarConsultar("Consultar");
				$usuariosAlumnos = $this->alumno->validarConsultar("Consultar");
				$usuariosProfesores = $this->profesor->validarConsultar("Consultar");
				$roles = $this->rol->validarConsultar("Consultar");
				$url = $this->url;
				require_once("view/usuariosView.php");
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
					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['userModif'])))) {
						$resultado = $this->usuario->validarConsultar("getOne", $_POST['userModif']);
						echo json_encode($resultado);
					}
					if(!empty(trim(isset($_POST['verificarPasswordCuenta']))) && !empty(trim(isset($_POST['pass'])))){
						if($this->verificarContrasena($_POST['pass'], $_SESSION['cuenta_usuario']['password_usuario'])){
							echo json_encode(['msj' => "Good"]);
						}else{
							echo json_encode(['msj' => "Error"]);
						}
					}
					if(!empty(trim(isset($_POST['BuscarSegunRol']))) && !empty(trim(isset($_POST['id_rol'])))){
						$id_rol = $_POST['id_rol'];
						// echo $id_rol;
						$roles = $this->rol->validarConsultar("getOneId", $id_rol);
						if($roles['msj']=="Good"){
							if(count($roles['data'])>1){
								$data = $roles['data'][0];
								$response = [];
								$usuarios = [];
								$buscar = [];
								// echo $data['nombre_rol'];
								if($data['nombre_rol']=="Alumnos"){
									$usuarios = $this->alumno->validarConsultar("Consultar");
									$nAlum = 0;
									foreach ($usuarios as $key) {
										$buscar[$nAlum]['codigo'] = $key['cedula_alumno'];
										$buscar[$nAlum]['cedula'] = number_format($key['cedula_alumno'],0,',','.');
										$buscar[$nAlum]['nombre'] = $key['nombre_alumno'];
										$buscar[$nAlum]['apellido'] = $key['apellido_alumno'];
										// $buscar[$nAlum]['telefono'] = $key['telefono_alumno'];
										$buscar[$nAlum]['trayecto'] = $key['trayecto_alumno'];
										$nAlum++;
									}
									// print_r($buscar);
								}
								if( ($data['nombre_rol']=="Profesores") || ($data['nombre_rol']=="Administrador") || $data['nombre_rol']=="Superusuario" ){

									$usuarios = $this->profesor->validarConsultar("Consultar");
									$nProf = 0;
									foreach ($usuarios as $key) {
										$buscar[$nProf]['codigo'] = $key['cedula_profesor'];
										$buscar[$nProf]['cedula'] = number_format($key['cedula_profesor'],0,',','.');
										$buscar[$nProf]['nombre'] = $key['nombre_profesor'];
										$buscar[$nProf]['apellido'] = $key['apellido_profesor'];
										$buscar[$nProf]['telefono'] = $key['telefono_profesor'];
										$nProf++;
									}
								}
								if(count($buscar)>0){
									$response['msj'] = "Good";
									$response['data'] = $buscar;
									$buscar2 = $this->usuario->validarConsultar("Consultar");
									if(count($buscar2)>0){
										$response['msjUsuario'] = "Good";
										$response['dataUsuario'] = $buscar2;
									}else{
										$response['msjUsuario'] = "Vacio";
									}
								}else{
									$response['msj'] = "Vacio";
								}
								
							}else{
								$response['msj'] = "Error";
							}
						}else{
							$response['msj'] = "Error";
						}
						echo json_encode($response);
					}
					if(!empty(trim(isset($_POST['VerificarUnicoUsername']))) && !empty(trim(isset($_POST['username']))) && !empty(trim(isset($_POST['id'])))){
						$_POST = $this->usuario->limpiarPost($_POST);
						$user = ucwords(mb_strtolower($_POST['username']));
						$id = $_POST['id'];
						$buscar = $this->usuario->validarConsultar("Buscar", "username", $user);
						if(count($buscar)>0){
							if($id==""){
								echo json_encode(['msj'=>"Good", 'valido'=>"0"]);
							}
							if($id!=""){
								if($buscar[0]['cedula_usuario']==$id){
									echo json_encode(['msj'=>"Good", 'valido'=>"1"]);
								}else{
									echo json_encode(['msj'=>"Good", 'valido'=>"0"]);
								}
							}
						}else{
							echo json_encode(['msj'=>"Good", 'valido'=>"1"]);
						}
					}
					if(!empty(trim(isset($_POST['VerificarUnicoCorreo']))) && !empty(trim(isset($_POST['correo'])))){
						$_POST = $this->usuario->limpiarPost($_POST);
						$correo = mb_strtolower($_POST['correo']);
						$id = $_POST['id'];
						// echo $correo;
						// echo "\n\n";
						$buscar = $this->usuario->validarConsultar("Buscar", "correo", $correo);
						// var_dump($buscar);
						// echo count($buscar);
						// echo "\n\n";
						if(count($buscar)>0){
							if($id==""){
								echo json_encode(['msj'=>"Good", 'valido'=>"0"]);
							}
							if($id!=""){
								if($buscar[0]['cedula_usuario']==$id){
									echo json_encode(['msj'=>"Good", 'valido'=>"1"]);
								}else{
									echo json_encode(['msj'=>"Good", 'valido'=>"0"]);
								}
							}
						}else{
							echo json_encode(['msj'=>"Good", 'valido'=>"1"]);
						}
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
					if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['user']))) && !empty(trim(isset($_POST['correo']))) && !empty(trim(isset($_POST['pass']))) && !empty(trim(isset($_POST['rol'])))) {
						$_POST = $this->usuario->limpiarPost($_POST);
						$datos['cedula'] = $_POST['cedula'];
						$datos['nombre'] = ucwords(mb_strtolower($_POST['user']));
						$datos['correo'] = mb_strtolower($_POST['correo']);
						$datos['pass'] = $this->encriptarContrasena($_POST['pass']);
						$datos['rol'] = $_POST['rol'];
						$buscar = $this->usuario->validarConsultar("getOne", $_POST['cedula']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($buscar['data'][0]['estatus']==0){
									$datos['cedula'] = $buscar['data'][0]['cedula_usuario'];
									$datos['id'] = $buscar['data'][0]['cedula_usuario'];
									if($buscar['data'][0]['estatus']==0){ $datos['estatus'] = 2; }
									if($buscar['data'][0]['estatus']==1){ $datos['estatus'] = 1; }
									if($buscar['data'][0]['estatus']==2){ $datos['estatus'] = 2; }
									if($buscar['data'][0]['estatus']==3){ $datos['estatus'] = 3; }
									$buscarCorreo = $this->usuario->validarConsultar("Buscar", "correo", $datos['correo']);
									if(count($buscarCorreo)>0){
										if($buscarCorreo[0]['correo']!=$datos['correo']){
											echo json_encode(['msj'=>"Repetido"]);
											die();
										}
									}
									$buscarUsername = $this->usuario->validarConsultar("Buscar", "username", $datos['nombre']);
									if(count($buscarUsername)>0){
										if($buscarCorreo[0]['nombre_usuario']!=$datos['nombre']){
											echo json_encode(['msj'=>"Repetido"]);
											die();
										}
									}
									$exec = $this->usuario->ValidarAgregarOModificar($datos,"Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$buscarCorreo = $this->usuario->validarConsultar("Buscar", "correo", $datos['correo']);
								if(count($buscarCorreo)>0){
									if($buscarCorreo[0]['correo']!=$datos['correo']){
										echo json_encode(['msj'=>"Repetido"]);
										die();
									}
								}
								$buscarUsername = $this->usuario->validarConsultar("Buscar", "username", $datos['nombre']);
								if(count($buscarUsername)>0){
									if($buscarCorreo[0]['nombre_usuario']!=$datos['nombre']){
										echo json_encode(['msj'=>"Repetido"]);
										die();
									}
								}
								$exec = $this->usuario->ValidarAgregarOModificar($datos,"Agregar");
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
					if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['correo']))) && !empty(trim(isset($_POST['rol']))) && !empty(trim(isset($_POST['nuevoPassword'])))) {
						$_POST = $this->usuario->limpiarPost($_POST);
						$datos['id'] = $_POST['codigo'];
						$datos['cedula'] = $_POST['cedula'];
						$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
						$datos['correo'] = mb_strtolower($_POST['correo']);
						$datos['rol'] = $_POST['rol'];
						$datos['nuevoPassword'] = $this->encriptarContrasena($_POST['nuevoPassword']);
						$buscar = $this->usuario->validarConsultar("getOne", $_POST['codigo']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($_POST['codigo']==$buscar['data'][0]['cedula_usuario']){
									if($buscar['data'][0]['estatus']==0){ $datos['estatus'] = 1; }
									if($buscar['data'][0]['estatus']==1){ $datos['estatus'] = 1; }
									if($buscar['data'][0]['estatus']==2){ $datos['estatus'] = 2; }
									if($buscar['data'][0]['estatus']==3){ $datos['estatus'] = 3; }
									$buscarCorreo = $this->usuario->validarConsultar("Buscar", "correo", $datos['correo']);
									if(count($buscarCorreo)>0){
										if($buscarCorreo[0]['correo']!=$datos['correo']){
											echo json_encode(['msj'=>"Repetido"]);
											die();
										}
									}
									$buscarUsername = $this->usuario->validarConsultar("Buscar", "username", $datos['nombre']);
									if(count($buscarUsername)>0){
										if($buscarCorreo[0]['nombre_usuario']!=$datos['nombre']){
											echo json_encode(['msj'=>"Repetido"]);
											die();
										}
									}
									$exec = $this->usuario->ValidarAgregarOModificar($datos,"Modificar"); 
									echo json_encode($exec);
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$datos['estatus'] = 1;
								$buscarCorreo = $this->usuario->validarConsultar("Buscar", "correo", $datos['correo']);
								if(count($buscarCorreo)>0){
									if($buscarCorreo[0]['correo']!=$datos['correo']){
										echo json_encode(['msj'=>"Repetido"]);
										die();
									}
								}
								$buscarUsername = $this->usuario->validarConsultar("Buscar", "username", $datos['nombre']);
								if(count($buscarUsername)>0){
									if($buscarCorreo[0]['nombre_usuario']!=$datos['nombre']){
										echo json_encode(['msj'=>"Repetido"]);
										die();
									}
								}
								$exec = $this->usuario->ValidarAgregarOModificar($datos,"Modificar");
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
						$_POST = $this->usuario->limpiarPost($_POST);
						$buscar = $this->usuario->validarConsultar("getOne", $_POST['userDelete']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$exec = $this->usuario->validarEliminar("Eliminar", $_POST['userDelete']);
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

		public function Habilitar(){
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if($acc['nombre_permiso']=="Eliminar"){
					$permitirAcceso = 1;
				}
			}
			if($permitirAcceso==1){
				if($_POST){		
					if (!empty(trim(isset($_POST['Habilitar']))) && !empty(trim(isset($_POST['userID'])))) {
						$_POST = $this->usuario->limpiarPost($_POST);
						$buscar = $this->usuario->validarConsultar("getOne", $_POST['userID']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$search = $this->pregunta->validarConsultar("getOne", $data['cedula_usuario']);
								if(count($search['data'])>1){
									$estatusNew = 1;
								}else{
									$estatusNew = 2;
								}
								$exec = $this->usuario->validarEliminar("Habilitar", $_POST['userID'], $estatusNew);
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