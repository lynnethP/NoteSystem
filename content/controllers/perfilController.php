<?php
namespace content\controllers;

use config\settings\sysConfig as sysConfig;
use content\component\headElement as headElement;
use content\modelo\homeModel as homeModel;
use content\modelo\perfilModel as perfilModel;
use content\modelo\loginModel as loginModel;
use content\modelo\usuariosModel as usuariosModel;
use content\modelo\alumnosModel as alumnosModel;
use content\modelo\profesoresModel as profesoresModel;
use content\modelo\rolesModel as rolesModel;
use content\modelo\notificacionesModel as notificacionesModel;
use content\traits\Utility;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

class perfilController
{
	use Utility;
	private $url;
	private $perfil;
	private $login;
	private $usuario;
	private $notificacion;
	private $alumno;
	private $profesor;
	private $rol;
	function __construct($url){
		$this->url = $url;
		$this->notificacion = new notificacionesModel();
		$this->perfil = new perfilModel();
		$this->url = $url;
		$this->login = new loginModel();
		$this->usuario = new usuariosModel();
		$this->alumno = new alumnosModel();
		$this->profesor = new profesoresModel();
		$this->rol = new rolesModel();
	}

	public function Consultar() {
		$_css = new headElement;
		$_css->Heading();
		$perfiles = $this->perfil->validarConsultar("Consultar", $_SESSION['cuenta_usuario']['cedula_usuario']);
		if ($_SESSION['cuenta_usuario']['nombre_rol'] === "Superusuario" || $_SESSION['cuenta_usuario']['nombre_rol'] === "Administrador" || $_SESSION['cuenta_usuario']['nombre_rol'] === "Profesores") {
			$resp = $this->perfil->validarConsultar("ConsultarProfesor", $_SESSION['cuenta_usuario']['cedula_usuario']);
			if(count($resp)>0){
				$ci = $resp[0]['cedula_profesor'];
				$nombre = $resp[0]['nombre_profesor'];
				$apellido = $resp[0]['apellido_profesor'];
				$telef = $resp[0]['telefono_profesor'];
				$trayecto = "";
			}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario" && $_SESSION['cuenta_usuario']['cedula_usuario']=="00000000"){
				$ci = $_SESSION['cuenta_persona']['cedula'];
				$nombre = $_SESSION['cuenta_persona']['nombre'];
				$apellido = $_SESSION['cuenta_persona']['apellido'];
				$telef = $_SESSION['cuenta_persona']['telefono'];
				$trayecto = "";
			}
		} else if ($_SESSION['cuenta_usuario']['nombre_rol'] === "Alumnos") {
			$resp = $this->perfil->validarConsultar("ConsultarAlumno", $_SESSION['cuenta_usuario']['cedula_usuario']);
			if(count($resp)>0){
				$ci = $resp[0]['cedula_alumno'];
				$nombre = $resp[0]['nombre_alumno'];
				$apellido = $resp[0]['apellido_alumno'];
				$trayecto = $resp[0]['trayecto_alumno'];
			}
		}
		$usuarios = $this->perfil->validarConsultar("ConsultarUsuario", $_SESSION['cuenta_usuario']['cedula_usuario']);
		if(count($usuarios)>0){
			$correo = $usuarios[0]['correo'];
			$usuario = $usuarios[0]['nombre_usuario'];
			$password = $usuarios[0]['password_usuario'];
			$rol = $usuarios[0]['id_rol'];
		}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario" && $_SESSION['cuenta_usuario']['cedula_usuario']=="00000000"){
			$correo = $_SESSION['cuenta_usuario']['correo'];
			$usuario = $_SESSION['cuenta_usuario']['nombre_usuario'];
			$rol = $_SESSION['cuenta_usuario']['id_rol'];
			$nombre_rol = $_SESSION['cuenta_usuario']['nombre_rol'];
		}
		$url = $this->url;
		require_once("view/perfilView.php");
	}

	public function Modificar() {
		if ($_SESSION['cuenta_usuario']['nombre_rol'] == "Alumnos") {
			if ($_POST) {
				if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['apellido']))) && !empty(trim(isset($_POST['trayecto']))) && !empty(trim(isset($_POST['correo'])))) {
					$_POST = $this->alumno->limpiarPost($_POST);
					$datos['id'] = $_POST['codigo'];
					$datos['cedula'] = $_POST['cedula'];
					$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
					$datos['apellido'] = ucwords(mb_strtolower($_POST['apellido']));
					$datos['trayecto'] = $_POST['trayecto'];
					$datos['correo'] = $_POST['correo'];
					$buscar = $this->alumno->validarConsultar("getOne", $_POST['cedula']);
					if ($buscar['msj'] == "Good") {
						if (count($buscar['data']) > 1) {
							if ($_POST['codigo'] == $_POST['cedula']) {
								$exec = $this->alumno->ValidarAgregarOModificar($datos, "Modificar");
								$modif = $this->perfil->ValidarAgregarOModificar($datos, "ModificarCorreo"); 
								$Result = array('msj' => $exec['msj'], 'email' => $modif);
								if($exec['msj']=="Good"){
									// OPEN ACTUALIZANDO VARIABLES SESSION
									$resp = $this->usuario->validarConsultar("getOne", $datos['cedula'], true);
									if($resp['msj']=="Good"){
										$dataTemp = $resp['data'][0];
										$_SESSION['cuenta_usuario'] = $dataTemp;
										if($_SESSION['cuenta_usuario']['nombre_rol']=="Alumnos"){
											$alumnos = $this->alumno->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
											if($alumnos['msj']=="Good"){
												if(count($alumnos['data']) > 1){
													$_SESSION['cuenta_persona'] = $alumnos['data'][0];
													$_SESSION['cuenta_persona']['cedula'] = $alumnos['data'][0]['cedula_alumno'];
													$_SESSION['cuenta_persona']['nombre'] = $alumnos['data'][0]['nombre_alumno'];
													$_SESSION['cuenta_persona']['apellido'] = $alumnos['data'][0]['apellido_alumno'];
													$_SESSION['cuenta_persona']['trayecto'] = $alumnos['data'][0]['trayecto_alumno'];	
												}else{
													session_destroy();
													$resps['msj'] = "Usuario o contraseña invalido!";
													echo json_encode($resps);
													die();
												}
											}
										}else{
											$profesores = $this->profesor->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
											if($profesores['msj']=="Good"){
												if(count($profesores['data']) > 1){
													$_SESSION['cuenta_persona'] = $profesores['data'][0];
													$_SESSION['cuenta_persona']['cedula'] = $profesores['data'][0]['cedula_profesor'];
													$_SESSION['cuenta_persona']['nombre'] = $profesores['data'][0]['nombre_profesor'];
													$_SESSION['cuenta_persona']['apellido'] = $profesores['data'][0]['apellido_profesor'];
													$_SESSION['cuenta_persona']['telefono'] = $profesores['data'][0]['telefono_profesor'];
												}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario"){
													$supersu = ['cedula'=>'00000000', 'nombre'=>'Usuario', 'apellido'=>'Sistema', 'telefono'=>'00000000000'];
													$_SESSION['cuenta_persona']= $supersu;
													if($_SESSION['cuenta_usuario']['estatus']=="0"){
														$_SESSION['cuenta_usuario']['estatus'] = "1";
														$estatus = "1";
													}
												}else{
													session_destroy();
													$resps['msj'] = "Usuario o contraseña invalido!";	
													echo json_encode($resps);
													die();
												}
											}
										}
										$_SESSION['cuenta_persona']['nombreCorto'] = substr($_SESSION['cuenta_persona']['nombre'], 0, strpos($_SESSION['cuenta_persona']['nombre'], " "));
										$_SESSION['cuenta_persona']['apellidoCorto'] = substr($_SESSION['cuenta_persona']['apellido'], 0, strpos($_SESSION['cuenta_persona']['apellido'], " "));
									}
									// CLOSE ACTUALIZANDO VARIABLES SESSION
								}
								echo json_encode($Result);
							} else {
								echo json_encode(['msj' => "Repetido"]);
							}
						} else {
							$buscar = $this->profesor->validarConsultar("getOne", $_POST['cedula']);
							if ($buscar['msj'] == "Good") {
								if (count($buscar['data']) > 1) {
									echo json_encode(['msj' => "NegadoDuplicado"]);
								}else{
									$exec = $this->alumno->ValidarAgregarOModificar($datos,"Modificar");
									$modif = $this->perfil->ValidarAgregarOModificar($datos,"ModificarCorreo");  
									$Result = array('msj'=>$exec['msj'], 'email' => $modif);
									if($exec['msj']=="Good"){
										// OPEN ACTUALIZANDO VARIABLES SESSION
										$resp = $this->usuario->validarConsultar("getOne", $datos['cedula'], true);
										if($resp['msj']=="Good"){
											$dataTemp = $resp['data'][0];
											$_SESSION['cuenta_usuario'] = $dataTemp;
											if($_SESSION['cuenta_usuario']['nombre_rol']=="Alumnos"){
												$alumnos = $this->alumno->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
												if($alumnos['msj']=="Good"){
													if(count($alumnos['data']) > 1){
														$_SESSION['cuenta_persona'] = $alumnos['data'][0];
														$_SESSION['cuenta_persona']['cedula'] = $alumnos['data'][0]['cedula_alumno'];
														$_SESSION['cuenta_persona']['nombre'] = $alumnos['data'][0]['nombre_alumno'];
														$_SESSION['cuenta_persona']['apellido'] = $alumnos['data'][0]['apellido_alumno'];
														$_SESSION['cuenta_persona']['trayecto'] = $alumnos['data'][0]['trayecto_alumno'];	
													}else{
														session_destroy();
														$resps['msj'] = "Usuario o contraseña invalido!";
														echo json_encode($resps);
														die();
													}
												}
											}else{
												$profesores = $this->profesor->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
												if($profesores['msj']=="Good"){
													if(count($profesores['data']) > 1){
														$_SESSION['cuenta_persona'] = $profesores['data'][0];
														$_SESSION['cuenta_persona']['cedula'] = $profesores['data'][0]['cedula_profesor'];
														$_SESSION['cuenta_persona']['nombre'] = $profesores['data'][0]['nombre_profesor'];
														$_SESSION['cuenta_persona']['apellido'] = $profesores['data'][0]['apellido_profesor'];
														$_SESSION['cuenta_persona']['telefono'] = $profesores['data'][0]['telefono_profesor'];
													}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario"){
														$supersu = ['cedula'=>'00000000', 'nombre'=>'Usuario', 'apellido'=>'Sistema', 'telefono'=>'00000000000'];
														$_SESSION['cuenta_persona']= $supersu;
														if($_SESSION['cuenta_usuario']['estatus']=="0"){
															$_SESSION['cuenta_usuario']['estatus'] = "1";
															$estatus = "1";
														}
													}else{
														session_destroy();
														$resps['msj'] = "Usuario o contraseña invalido!";	
														echo json_encode($resps);
														die();
													}
												}
											}
											$_SESSION['cuenta_persona']['nombreCorto'] = substr($_SESSION['cuenta_persona']['nombre'], 0, strpos($_SESSION['cuenta_persona']['nombre'], " "));
											$_SESSION['cuenta_persona']['apellidoCorto'] = substr($_SESSION['cuenta_persona']['apellido'], 0, strpos($_SESSION['cuenta_persona']['apellido'], " "));
										}
										// CLOSE ACTUALIZANDO VARIABLES SESSION
										echo json_encode($Result);
									}
								}
							} else {
								echo json_encode(['msj' => "Error"]);
							}
						}
					} else {
						echo json_encode(['msj' => "Error"]);
					}
				} else {
					echo json_encode(['msj' => "Vacio"]);
				}
			}
		} else {
			if ($_POST) {
				if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['apellido']))) && !empty(trim(isset($_POST['telefono']))) && !empty(trim(isset($_POST['correo'])))) {
					$_POST = $this->profesor->limpiarPost($_POST);
					$datos['id'] = $_POST['codigo'];
					$datos['cedula'] = $_POST['cedula'];
					$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
					$datos['apellido'] = ucwords(mb_strtolower($_POST['apellido']));
					$datos['telefono'] = $_POST['telefono'];
					$datos['correo'] = $_POST['correo'];
					$buscar = $this->profesor->validarConsultar("getOne", $_POST['cedula']);
					if ($buscar['msj'] == "Good") {
						if (count($buscar['data']) > 1) {
							if ($_POST['codigo'] == $_POST['cedula']) {
								$exec = $this->profesor->ValidarAgregarOModificar($datos,"Modificar");
								$modif = $this->perfil->ValidarAgregarOModificar($datos,"ModificarCorreo");
								$Result = array('msj' => $exec['msj'], 'email' => $modif);
								if($exec['msj']=="Good"){
									// OPEN ACTUALIZANDO VARIABLES SESSION
									$resp = $this->usuario->validarConsultar("getOne", $datos['cedula'], true);
									if($resp['msj']=="Good"){
										$dataTemp = $resp['data'][0];
										$_SESSION['cuenta_usuario'] = $dataTemp;
										if($_SESSION['cuenta_usuario']['nombre_rol']=="Alumnos"){
											$alumnos = $this->alumno->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
											if($alumnos['msj']=="Good"){
												if(count($alumnos['data']) > 1){
													$_SESSION['cuenta_persona'] = $alumnos['data'][0];
													$_SESSION['cuenta_persona']['cedula'] = $alumnos['data'][0]['cedula_alumno'];
													$_SESSION['cuenta_persona']['nombre'] = $alumnos['data'][0]['nombre_alumno'];
													$_SESSION['cuenta_persona']['apellido'] = $alumnos['data'][0]['apellido_alumno'];
													$_SESSION['cuenta_persona']['trayecto'] = $alumnos['data'][0]['trayecto_alumno'];	
												}else{
													session_destroy();
													$resps['msj'] = "Usuario o contraseña invalido!";
													echo json_encode($resps);
													die();
												}
											}
										}else{
											$profesores = $this->profesor->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
											if($profesores['msj']=="Good"){
												if(count($profesores['data']) > 1){
													$_SESSION['cuenta_persona'] = $profesores['data'][0];
													$_SESSION['cuenta_persona']['cedula'] = $profesores['data'][0]['cedula_profesor'];
													$_SESSION['cuenta_persona']['nombre'] = $profesores['data'][0]['nombre_profesor'];
													$_SESSION['cuenta_persona']['apellido'] = $profesores['data'][0]['apellido_profesor'];
													$_SESSION['cuenta_persona']['telefono'] = $profesores['data'][0]['telefono_profesor'];
												}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario"){
													$supersu = ['cedula'=>'00000000', 'nombre'=>'Usuario', 'apellido'=>'Sistema', 'telefono'=>'00000000000'];
													$_SESSION['cuenta_persona']= $supersu;
													if($_SESSION['cuenta_usuario']['estatus']=="0"){
														$_SESSION['cuenta_usuario']['estatus'] = "1";
														$estatus = "1";
													}
												}else{
													session_destroy();
													$resps['msj'] = "Usuario o contraseña invalido!";	
													echo json_encode($resps);
													die();
												}
											}
										}
										$_SESSION['cuenta_persona']['nombreCorto'] = substr($_SESSION['cuenta_persona']['nombre'], 0, strpos($_SESSION['cuenta_persona']['nombre'], " "));
										$_SESSION['cuenta_persona']['apellidoCorto'] = substr($_SESSION['cuenta_persona']['apellido'], 0, strpos($_SESSION['cuenta_persona']['apellido'], " "));
									}
									// CLOSE ACTUALIZANDO VARIABLES SESSION
								}
								echo json_encode($Result);
							} else {
								echo json_encode(['msj' => "Repetido"]);
							}
						} else {
							$buscar = $this->alumno->validarConsultar("getOne", $_POST['cedula']);
							if ($buscar['msj'] == "Good") {
								if (count($buscar['data']) > 1) {
									echo json_encode(['msj' => "NegadoDuplicado"]);
								}else{
									$exec = $this->profesor->ValidarAgregarOModificar($datos, "Modificar");
									$modif = $this->perfil->ValidarAgregarOModificar($datos, "ModificarCorreo");
									$Result = array('msj' => $exec['msj'], 'email' => $modif);
									if($exec['msj']=="Good"){
										// OPEN ACTUALIZANDO VARIABLES SESSION
										$resp = $this->usuario->validarConsultar("getOne", $datos['cedula'], true);
										if($resp['msj']=="Good"){
											$dataTemp = $resp['data'][0];
											$_SESSION['cuenta_usuario'] = $dataTemp;
											if($_SESSION['cuenta_usuario']['nombre_rol']=="Alumnos"){
												$alumnos = $this->alumno->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
												if($alumnos['msj']=="Good"){
													if(count($alumnos['data']) > 1){
														$_SESSION['cuenta_persona'] = $alumnos['data'][0];
														$_SESSION['cuenta_persona']['cedula'] = $alumnos['data'][0]['cedula_alumno'];
														$_SESSION['cuenta_persona']['nombre'] = $alumnos['data'][0]['nombre_alumno'];
														$_SESSION['cuenta_persona']['apellido'] = $alumnos['data'][0]['apellido_alumno'];
														$_SESSION['cuenta_persona']['trayecto'] = $alumnos['data'][0]['trayecto_alumno'];	
													}else{
														session_destroy();
														$resps['msj'] = "Usuario o contraseña invalido!";
														echo json_encode($resps);
														die();
													}
												}
											}else{
												$profesores = $this->profesor->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
												if($profesores['msj']=="Good"){
													if(count($profesores['data']) > 1){
														$_SESSION['cuenta_persona'] = $profesores['data'][0];
														$_SESSION['cuenta_persona']['cedula'] = $profesores['data'][0]['cedula_profesor'];
														$_SESSION['cuenta_persona']['nombre'] = $profesores['data'][0]['nombre_profesor'];
														$_SESSION['cuenta_persona']['apellido'] = $profesores['data'][0]['apellido_profesor'];
														$_SESSION['cuenta_persona']['telefono'] = $profesores['data'][0]['telefono_profesor'];
													}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario"){
														$supersu = ['cedula'=>'00000000', 'nombre'=>'Usuario', 'apellido'=>'Sistema', 'telefono'=>'00000000000'];
														$_SESSION['cuenta_persona']= $supersu;
														if($_SESSION['cuenta_usuario']['estatus']=="0"){
															$_SESSION['cuenta_usuario']['estatus'] = "1";
															$estatus = "1";
														}
													}else{
														session_destroy();
														$resps['msj'] = "Usuario o contraseña invalido!";	
														echo json_encode($resps);
														die();
													}
												}
											}
											$_SESSION['cuenta_persona']['nombreCorto'] = substr($_SESSION['cuenta_persona']['nombre'], 0, strpos($_SESSION['cuenta_persona']['nombre'], " "));
											$_SESSION['cuenta_persona']['apellidoCorto'] = substr($_SESSION['cuenta_persona']['apellido'], 0, strpos($_SESSION['cuenta_persona']['apellido'], " "));
										}
										// CLOSE ACTUALIZANDO VARIABLES SESSION
									}
									echo json_encode($Result);
								}
							} else {
								echo json_encode(['msj' => "Error"]);
							}
						}
					} else {
						echo json_encode(['msj' => "Error"]);
					}
				} else {
					echo json_encode(['msj' => "Vacio"]);
				}
			}

		}
	}

	public function Verificar(){
		if($_POST){
			if (!empty(trim(isset($_POST['username']))) && !empty(trim(isset($_POST['ValidarContraseña']))) && !empty(trim(isset($_POST['password'])))) {
				$resp = $this->login->loginSistema(ucwords(mb_strtolower($_POST['username'])), $_POST['password']);
				if($resp['msj']=="Good"){
					if(count($resp['data'])>0){
						echo json_encode($resp);
					}else{
						echo json_encode($resp);
					}
				}else{
					echo json_encode($resp);
				}
			}
		}
		if(!empty(trim(isset($_POST['VerificarUnicoUsername']))) && !empty(trim(isset($_POST['username']))) && !empty(trim(isset($_POST['id'])))){
			$_POST = $this->usuario->limpiarPost($_POST);
			$user = ucwords(mb_strtolower($_POST['username']));
			$id = $_POST['id'];
			$buscar = $this->usuario->validarConsultar("Buscar", "username", $user);
			if(count($buscar)>0){
				// print_r($buscar);
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
			$buscar = $this->usuario->validarConsultar("Buscar", "correo", $correo);
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
	}

	public function Guardar(){
		if (!empty($_FILES)) {
			$user = $_SESSION['cuenta_persona']['cedula'];
			$type = $_FILES["file"]["type"][0];
			$tmp_name = $_FILES["file"]["tmp_name"][0];
			$file = $_FILES["file"]["name"][0];
			$directorio_destino = ""._IMG_;
			
			if (strpos($type, 'gif') || strpos($type, 'jpeg') || strpos($type, 'jpg') || strpos($type, 'png')) {
				if(strpos($type, 'gif')){ $typeTemp = 'gif'; }
				if(strpos($type, 'png')){ $typeTemp = 'png'; }
				if(strpos($type, 'jpeg')){ $typeTemp = 'jpeg'; }
				if(strpos($type, 'jpg')){ $typeTemp = 'jpg'; }
				$destino = $directorio_destino . '/' . $user.".".$typeTemp;
				if(file_exists($destino)){
					unlink($destino);
				}
				if(copy($tmp_name, $destino)){
					$upd = $this->perfil->ValidarAgregarOModificar($destino, "Img", $user);
				}
			}
			if($upd['msj']=="Good"){
				// OPEN ACTUALIZANDO VARIABLES SESSION
				$cedularUser = $_SESSION['cuenta_usuario']['cedula_usuario'];
				//var_dump($cedularUser);				
				$resp = $this->usuario->validarConsultar("getOne", $cedularUser, true);
				if($resp['msj']=="Good"){
					$dataTemp = $resp['data'][0];
					$_SESSION['cuenta_usuario'] = $dataTemp;
					if($_SESSION['cuenta_usuario']['nombre_rol']=="Alumnos"){
						$alumnos = $this->alumno->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
						if($alumnos['msj']=="Good"){
							if(count($alumnos['data']) > 1){
								$_SESSION['cuenta_persona'] = $alumnos['data'][0];
								$_SESSION['cuenta_persona']['cedula'] = $alumnos['data'][0]['cedula_alumno'];
								$_SESSION['cuenta_persona']['nombre'] = $alumnos['data'][0]['nombre_alumno'];
								$_SESSION['cuenta_persona']['apellido'] = $alumnos['data'][0]['apellido_alumno'];
								$_SESSION['cuenta_persona']['trayecto'] = $alumnos['data'][0]['trayecto_alumno'];	
							}else{
								session_destroy();
								$resps['msj'] = "Usuario o contraseña invalido!";
								echo json_encode($resps);
								die();
							}
						}
					}else{
						$profesores = $this->profesor->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
						if($profesores['msj']=="Good"){
							if(count($profesores['data']) > 1){
								$_SESSION['cuenta_persona'] = $profesores['data'][0];
								$_SESSION['cuenta_persona']['cedula'] = $profesores['data'][0]['cedula_profesor'];
								$_SESSION['cuenta_persona']['nombre'] = $profesores['data'][0]['nombre_profesor'];
								$_SESSION['cuenta_persona']['apellido'] = $profesores['data'][0]['apellido_profesor'];
								$_SESSION['cuenta_persona']['telefono'] = $profesores['data'][0]['telefono_profesor'];
							}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario"){
								$supersu = ['cedula'=>'00000000', 'nombre'=>'Usuario', 'apellido'=>'Sistema', 'telefono'=>'00000000000'];
								$_SESSION['cuenta_persona']= $supersu;
								if($_SESSION['cuenta_usuario']['estatus']=="0"){
									$_SESSION['cuenta_usuario']['estatus'] = "1";
									$estatus = "1";
								}
							}else{
								session_destroy();
								$resps['msj'] = "Usuario o contraseña invalido!";	
								echo json_encode($resps);
								die();
							}
						}
					}
					$_SESSION['cuenta_persona']['nombreCorto'] = substr($_SESSION['cuenta_persona']['nombre'], 0, strpos($_SESSION['cuenta_persona']['nombre'], " "));
					$_SESSION['cuenta_persona']['apellidoCorto'] = substr($_SESSION['cuenta_persona']['apellido'], 0, strpos($_SESSION['cuenta_persona']['apellido'], " "));
				}
				// CLOSE ACTUALIZANDO VARIABLES SESSION
			}
			echo json_encode($upd);
		}
	}
		
	public function ModificarUsuario(){
		if($_POST){		
			if (!empty(trim(isset($_POST['cedula']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['correo']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['rol']))) && !empty(trim(isset($_POST['nuevoPassword'])))) {
				$_POST = $this->usuario->limpiarPost($_POST);
				$datos['id'] = $_POST['codigo'];
				$datos['cedula'] = $_POST['cedula'];
				$datos['correo'] = $_POST['correo'];
				$datos['nombre'] = ucwords(mb_strtolower($_POST['nombre']));
				$datos['rol'] = $_POST['rol'];
				$datos['nuevoPassword'] = $this->encriptarContrasena($_POST['nuevoPassword']);
				$buscar = $this->usuario->validarConsultar("getOne", $_POST['cedula']);
				if($buscar['msj']=="Good"){
					if(count($buscar['data'])>1){
						if($_POST['codigo']==$_POST['cedula']){
							if($buscar['data'][0]['estatus']==0){ $datos['estatus'] = 1; }
							if($buscar['data'][0]['estatus']==1){ $datos['estatus'] = 1; }
							if($buscar['data'][0]['estatus']==2){ $datos['estatus'] = 2; }
							if($buscar['data'][0]['estatus']==3){ $datos['estatus'] = 3; }
							$exec = $this->usuario->ValidarAgregarOModificar($datos, "Modificar");
							if($exec['msj']=="Good"){
								// OPEN ACTUALIZANDO VARIABLES SESSION
								$resp = $this->usuario->validarConsultar("getOne", $datos['cedula'], true);
								if($resp['msj']=="Good"){
									$dataTemp = $resp['data'][0];
									$_SESSION['cuenta_usuario'] = $dataTemp;
									if($_SESSION['cuenta_usuario']['nombre_rol']=="Alumnos"){
										$alumnos = $this->alumno->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
										if($alumnos['msj']=="Good"){
											if(count($alumnos['data']) > 1){
												$_SESSION['cuenta_persona'] = $alumnos['data'][0];
												$_SESSION['cuenta_persona']['cedula'] = $alumnos['data'][0]['cedula_alumno'];
												$_SESSION['cuenta_persona']['nombre'] = $alumnos['data'][0]['nombre_alumno'];
												$_SESSION['cuenta_persona']['apellido'] = $alumnos['data'][0]['apellido_alumno'];
												$_SESSION['cuenta_persona']['trayecto'] = $alumnos['data'][0]['trayecto_alumno'];	
											}else{
												session_destroy();
												$resps['msj'] = "Usuario o contraseña invalido!";
												echo json_encode($resps);
												die();
											}
										}
									}else{
										$profesores = $this->profesor->validarConsultar("getOne", $_SESSION['cuenta_usuario']['cedula_usuario']);
										if($profesores['msj']=="Good"){
											if(count($profesores['data']) > 1){
												$_SESSION['cuenta_persona'] = $profesores['data'][0];
												$_SESSION['cuenta_persona']['cedula'] = $profesores['data'][0]['cedula_profesor'];
												$_SESSION['cuenta_persona']['nombre'] = $profesores['data'][0]['nombre_profesor'];
												$_SESSION['cuenta_persona']['apellido'] = $profesores['data'][0]['apellido_profesor'];
												$_SESSION['cuenta_persona']['telefono'] = $profesores['data'][0]['telefono_profesor'];
											}else if($_SESSION['cuenta_usuario']['nombre_rol']=="Superusuario"){
												$supersu = ['cedula'=>'00000000', 'nombre'=>'Usuario', 'apellido'=>'Sistema', 'telefono'=>'00000000000'];
												$_SESSION['cuenta_persona']= $supersu;
												if($_SESSION['cuenta_usuario']['estatus']=="0"){
													$_SESSION['cuenta_usuario']['estatus'] = "1";
													$estatus = "1";
												}
											}else{
												session_destroy();
												$resps['msj'] = "Usuario o contraseña invalido!";	
												echo json_encode($resps);
												die();
											}
										}
									}
									$_SESSION['cuenta_persona']['nombreCorto'] = substr($_SESSION['cuenta_persona']['nombre'], 0, strpos($_SESSION['cuenta_persona']['nombre'], " "));
									$_SESSION['cuenta_persona']['apellidoCorto'] = substr($_SESSION['cuenta_persona']['apellido'], 0, strpos($_SESSION['cuenta_persona']['apellido'], " "));
								}
								// CLOSE ACTUALIZANDO VARIABLES SESSION
							}
							echo json_encode($exec);
						}else{
							echo json_encode(['msj'=>"Repetido"]);
						}
					}else{
						$exec = $this->usuario->ValidarAgregarOModificar($datos, "Modificar");
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


	


	
		
