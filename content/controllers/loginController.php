<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\loginModel as loginModel;
	use content\modelo\usuariosModel as usuariosModel;
	use content\modelo\alumnosModel as alumnosModel;
	use content\modelo\profesoresModel as profesoresModel;
	use content\modelo\rolesModel as rolesModel;
	use content\modelo\bloqueoModel as bloqueoModel;
	use content\modelo\preguntasModel as preguntasModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\mantenimientoModel as mantenimientoModel;
	use PHPMailer\PHPMailer\PHPMailer;
	use PHPMailer\PHPMailer\SMTP;
	use PHPMailer\PHPMailer\Exception;
	use content\traits\Utility;

	class loginController
	{
		use Utility;
		private $url;
		private $login;
		private $usuario;
		private $bitacora;
		private $manteniment;
		private $alumno;
		private $profesor;
		private $rol;
		private $preg;
		private $bloqueo;

		function __construct($url)
		{
			$this->url = $url;
			$this->login = new loginModel();
			$this->usuario = new usuariosModel();		
			$this->alumno = new alumnosModel();
			$this->profesor = new profesoresModel();
			$this->rol = new rolesModel();
			$this->bloqueo = new bloqueoModel();
			$this->preg = new preguntasModel();
			$this->bitacora = new bitacoraModel();
			$this->manteniment = new mantenimientoModel();
		}

		public function Consultar(){
			if($_POST){
				if($this->login->getConnection()){
					if (!empty(trim(isset($_POST['username']))) && !empty(trim(isset($_POST['loginSistema']))) && !empty(trim(isset($_POST['password'])))) {
						$_POST = $this->usuario->limpiarPost($_POST);
						// echo $_POST['username']." ".$_POST['password'];
						$resp = $this->login->loginSistema(ucwords(mb_strtolower($_POST['username'])), $_POST['password']); //pasa el user y pass
						// print_r($resp);
						if($resp['msj'] == "Good" && !empty($resp['data']) && count($resp['data'])>0 && 
							$resp['data'][0]['estatus']==0 && $resp['data'][0]['cedula_usuario'] == "00000000"){
							$permitirContinuar = "1";
						}else if($resp['msj'] == "Good" && !empty($resp['data']) && count($resp['data'])>0 && $resp['data'][0]['estatus']>0){
							$permitirContinuar = "1";
						}else{
							$permitirContinuar = "0";
						}
						if($resp['msj'] == "Good"){
							if($permitirContinuar=="1"){
								$intentos = $this->usuario->validarConsultar("Intentos", ucwords(mb_strtolower($_POST['username'])));
								// print_r($intentos);
								$int = 0;
								$estatus = -1;
								if(!empty($resp['data']) && count($resp['data'])>0){
									$estatus = $resp['data'][0]['estatus'];
								}
								if(count($intentos)>0){
									$int = $intentos[0]["intentos"];
								}

								if($resp['msj'] === 'Good' && $int < 3){
									$dataTemp = $resp['data'][0];

									// OPEN CONTENIDO DE RESTAURACION DE USUARIO LUEGO DE UN TIEMPO
									$dattTemp['cedula'] = $dataTemp['cedula_usuario'];
									$resultRSA = $this->bloqueo->validarData($dattTemp, "BuscarLlaves");
									if(count($resultRSA)>0){
										$resultRSA = $resultRSA[0];
										$fecha_acceso = $resultRSA['fecha_acceso'];
										$fecha_act = date("Y-m-d");
										$unMinuto = 60;
										$unaHora = $unMinuto * 60;
										$unDia = $unaHora * 24;
										$unaSemana = $unDia * 7;
										$unaQuincena = $unDia * 15;
										$unMes = $unDia * 30;
										$unTrimestre = $unMes * 3;
										$unSemestre = $unMes * 6;
										$medioA = date('Y-m-d', time() - $unSemestre);
										if($medioA >= $fecha_acceso){
											$dattTemp['intentos'] = 0;
											$dattTemp['pass'] = $dataTemp['password_usuario'];
											$unlook = $this->bloqueo->validarData($dattTemp, "Unlook");
											$rsa = $this->bloqueo->validarData($dattTemp, "EliminarSeguridad");
											$preguntas = $this->preg->ValidarEliminar($dataTemp['cedula_usuario']);
											$estatus = 2;
										}
									}
									// CLOSE CONTENIDO DE RESTAURACION DE USUARIO LUEGO DE UN TIEMPO

									$resp = array('access' => "Acceder");
									$_SESSION['cuentaActiva'] = true;
									$_SESSION['cuenta_usuario'] = $dataTemp;
									$accesos = $this->rol->validarConsultar("ConsultarAccesos",$_SESSION['cuenta_usuario']['id_rol']);
									$_SESSION['accesos_usuario'] = $accesos;
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
									$nombre = $_SESSION['cuenta_persona']['nombre'];
									$apellido = $_SESSION['cuenta_persona']['apellido'];

									$_SESSION['cuenta_persona']['nombreCorto'] = substr($nombre, 0, strpos($nombre, " "));
									$_SESSION['cuenta_persona']['apellidoCorto'] = substr($apellido, 0, strpos($apellido, " "));
									
									$this->bitacora->monitorear($this->url);
									if($estatus=="1"){
										$resp['stat'] = "1";
									}
									if($estatus=="2"){
										$resp['stat'] = "2";
									}
									$this->usuario->validarConsultar("Bloqueo", ucwords(mb_strtolower($_POST['username'])), 0);
								}

								if($intentos[0]["intentos"] >= 3){
									$resp = array('look' => "Bloqueo");
								}
								if($intentos[0]["estatus"] > 2){
									$resp = [];
									$resp['msj']="Cuenta Bloqueada";
									$resp['stat']=3;
								}
								echo json_encode($resp);
							}else{
								$resps['msj'] = "Usuario o contraseña invalido!";
								echo json_encode($resps);
							}
						}else{
							$intentos = $this->usuario->validarConsultar("Intentos", ucwords(mb_strtolower($_POST['username'])));
							$int = 0;
							if(count($intentos)>0){
								$int = $intentos[0]["intentos"];
								$estat = $intentos[0]["estatus"];
								$tempEstat = $intentos[0]["estatus"];
								if($estat > 2){
									$resp = [];
									$resp['msj']="Cuenta Bloqueada";
									$resp['stat']=3;
								}
								if($resp['msj'] === 'Usuario o contraseña invalido!'){
									if(isset($intentos[0]["intentos"])){
										$intentos[0]["intentos"] += 1;
									}
									$fallos = $intentos[0]["intentos"];
									$respuest = $this->usuario->validarConsultar("Bloqueo", ucwords(mb_strtolower($_POST['username'])),$fallos);
									$_SESSION['permisoTemporal']=true;
	 							}
								if($estat <= 2 && $intentos[0]["intentos"] >= 3){
									if(!empty($_SESSION['permisoTemporal']) && $tempEstat==3){
										unset($_SESSION['permisoTemporal']);
									}
									$cedula = $this->login->busquedaCedula(ucwords(mb_strtolower($_POST['username'])));
									$preguntas = $this->login->Consultar($cedula[0]['cedula_usuario']);
									$resp = array('look' => "Bloqueo", 'preguntas' => $preguntas, 'cedula'=>$cedula[0]['cedula_usuario']);
								}
							}
							echo json_encode($resp);
						}
					}
				}else{
					echo json_encode(['msj'=>"Desconectado"]);
				}
			}else{
				$objModel = new homeModel;
				$_css = new headElement;
				$_css->Heading();

				$url = $this->url;
				require_once("view/loginView.php");
			}
		}
		
		private function email($usuario, $token){
			if($this->login->getConnection()){
				$mail = new PHPMailer(true);
				$link = _URL_ . 'Login/recuperarAcceso/'.$token;
				try {
					$mail->SMTPDebug = 0;                      //Enable verbose debug output
					$mail->isSMTP();                                            //Send using SMTP
					$mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
					$mail->SMTPAuth   = true;                                   //Enable SMTP authentication
					$mail->Username   = 'pnfhsl10@gmail.com'; //SMTP username
					$mail->Password   = 'rhrxnkbnlbobftjv'; //SMTP password
					
					$mail->SMTPSecure = 'ssl';         //Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` encouraged
					$mail->Port       = 465;   //TCP port to connect to, use 465 for `PHPMailer::ENCRYPTION_SMTPS` above
					$mail->CharSet = 'UTF-8';                              
					$mail->setFrom($mail->Username, 'SCHSL');
					$mail->addAddress($usuario['correo']);   
					$mail->addReplyTo($mail->Username, 'Información');
					$mail->isHTML(true);                                  //Set email format to HTML
					$mail->Subject = 'Recuperar Acceso';
					$mail->Body    = "<h2>SCHSL - Recuperar Acceso</h2><br>
						Si solicitaste la recuperación de acceso para tu usuario \"$usuario[nombre]\" del sistema SCHSL, usa el link que aparece a 
						continuación para completar el proceso. Si no solicitaste esto, puedes ignorar este correo. <br>
						$link <br>
						Usuario: $usuario[nombre] <br>";
					$mail->AltBody    = "SCHSL - Recuperar Acceso 
						Si solicitaste la recuperación de acceso para tu usuario \"$usuario[nombre]\" del sistema SCHSL, usa el link que aparece a 
						continuación para completar el proceso. Si no solicitaste esto, puedes ignorar este correo. <br>
						$link  
						Usuario: $usuario[nombre]";
								
					$mail->send();
					return ['msj'=>'Good'];
				} catch (Exception $e) {
					return ['msj'=>'error', 'data'=>'No se pudo enviar el correo. Lo sentimos! Intente de nuevo.' .$e->getMessage(),];
				}
			}else{
				echo json_encode(['msj'=>"Desconectado"]);
			}
		}
	
		public function enviarLink(){
			if($this->login->getConnection()){
				if (!empty(trim(isset($_POST['correo'])))) {
					$_POST = $this->usuario->limpiarPost($_POST);
					$usuarios = $this->login->busquedaCorreo($_POST['correo']);
					if($usuarios['msj']=="Good"){
						if(!empty($usuarios['data'])){
							$usuario = $usuarios['data'][0];
							if($usuario['estatus']=="3" && (!empty($_SESSION['permisoTemporal']) && $_SESSION['permisoTemporal']==true)){
								$usuario['estatus']="1";	
								unset($_SESSION['permisoTemporal']);
							}
							if($usuario['estatus']=="1"){
								$token = bin2hex(random_bytes(10));
								unset($_SESSION['RC']);
								$_SESSION['RC'] = array(
									'token' => $this->encriptar($token),
									'cedula_recuperacion' => $usuario['cedula']
								);
								$resp = $this->email($usuario, $token);
								echo json_encode($resp);
							}
							if($usuario['estatus']=="2"){
								echo json_encode(['msj'=>"Vacio"]);
							}
							if($usuario['estatus']=="3"){
								echo json_encode(['msj'=>"Bloqueado"]);
							}
						}else{
							echo json_encode(['msj'=>"Vacio"]);
						}
					} else{
						echo json_encode(['msj'=>"Error"]);
					}
				}
			}else{
				echo json_encode(['msj'=>"Desconectado"]);
			}
		}

		public function validarRespuestas(){
			if($this->login->getConnection()){
				if(!empty($_POST)){
					$ci = $_POST['ci'];
					$bq = array(
						0 => array('id'=>$_POST['nr1'], 'rsp'=>$_POST['r1']), 
						1 => array('id'=>$_POST['nr2'], 'rsp'=>$_POST['r2']), 
						2 => array('id'=>$_POST['nr3'], 'rsp'=>$_POST['r3'])
					);
					$preguntas = $this->login->Consultar($ci);
					$ress = 0;
					$error = 0;
					foreach ($preguntas as $pg) {
						if(!empty($pg['id_respuesta'])){
							foreach ($bq as $b) {
								if($pg['id_respuesta']==$b['id']){
									if($pg['respuestas']==$this->encriptar($b['rsp'])){
										$ress++;
									}else{
										$error++;
									}
								}
							}
						}
					}
					if($ress==3 and $error==0){
						$users = $this->usuario->validarConsultar("getOne", $ci);
						$email = $users['data'][0]['correo'];
						echo json_encode(['msj'=>"Good", 'email'=>$email]);
					}else{
						echo json_encode(['msj'=>"Error"]);
					}
				}
			}else{
				echo json_encode(['msj'=>"Desconectado"]);
			}
		}

		public function recuperarAcceso($param){
			if($this->login->getConnection()){
				$token = $this->encriptar($param); //Encriptar ese token para comparar con el que está en sesión
				if($token == $_SESSION['RC']['token']){
					$objModel = new homeModel;
					$_css = new headElement;
					$_css->Heading();
					$url = $this->url;
					require_once("view/recuperarView.php");
				} else {
					if($_POST){
						if (!empty($_POST['recuperarSistema']) && !empty($_POST['pass']) ) {
							$exec = $this->login->recuperarPass($_SESSION['RC']['cedula_recuperacion'], $this->encriptarContrasena($_POST['pass']));
							echo json_encode($exec);
						}
					}else{
						require_once("errorController.php");
					}
				}
			}else{
				echo json_encode(['msj'=>"Desconectado"]);
			}

		}

}
	
		

?>