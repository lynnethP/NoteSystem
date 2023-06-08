<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\notasModel as notasModel;
	use content\modelo\seccionesModel as seccionesModel;
	use content\modelo\periodosModel as periodosModel;
	use content\modelo\saberesModel as saberesModel;
	use content\modelo\clasesModel as clasesModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class notasController
	{
		use Utility;
		private $url;
		private $nota;
		private $seccion;
		private $periodo;
		private $saber;
		private $clase;
		private $bitacora;
		private $notificacion;
		private $rol;
		private $accesos;

		private $idNota;
		function __construct($url)
		{

			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();
			$this->nota = new notasModel();
			$this->seccion = new seccionesModel();
			$this->periodo = new periodosModel();
			$this->saber = new saberesModel();
			$this->clase = new clasesModel();

			$this->rol = new rolesModel();
			$rolAc = ['id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Notas"];
			$this->accesos = $this->rol->validarConsultar("ConsultarAccesosModulo", $rolAc);
		}

		public function Consultar()
		{
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if ($acc['nombre_permiso'] == "Consultar") {
					$permitirAcceso = 1;
				}
			}
			if ($permitirAcceso == 1) {
				if (!empty($_POST['id_notificacion2']) && !empty(trim(isset($_POST['lista']))) && !empty(trim(isset($_POST['visto'])))) {
					$this->notificacion->RevisarNotificacion();
					header("location:./" . $this->encriptar("Notas"));
				} else {
					$_css = new headElement;
					$_css->Heading();
					$this->bitacora->monitorear($this->url);

					if ($_SESSION['cuenta_usuario']['nombre_rol'] == "Alumnos") {
						$notas = $this->nota->validarConsultar("Consultar", $_SESSION['cuenta_persona']['cedula'], $_SESSION['cuenta_usuario']['nombre_rol']);
						$url = $this->url;
						require_once("view/notasAlumnoView.php");
					} else {
						$alumnos = $this->nota->validarConsultar("ConsultarNotasAlumnos");
						if ($_SESSION['cuenta_usuario']['nombre_rol'] == "Superusuario") {
							$notas = $this->nota->validarConsultar("Consultar");
							$secciones = $this->clase->validarConsultar("ConsultarSeccionClase");
						}
						if ($_SESSION['cuenta_usuario']['nombre_rol'] == "Administrador") {
							$notas = $this->nota->validarConsultar("Consultar");
							$secciones = $this->clase->validarConsultar("ConsultarSeccionClase");
						}
						if ($_SESSION['cuenta_usuario']['nombre_rol'] == "Profesores") {
							$notasProf = $this->nota->validarConsultar("Consultar", $_SESSION['cuenta_persona']['cedula'], $_SESSION['cuenta_usuario']['nombre_rol']);
							$notasTutor = $this->nota->validarConsultar("ConsultarNotasTutor", $_SESSION['cuenta_persona']['cedula']);
							$notas = [];
							$nume = 0;
							foreach ($notasProf as $key) {
								if (!empty($key['cod_seccion']) && !empty($key['id_SC']) && !empty($key['id_clase'])) {
									$notas[$nume] = $key;
									$nume++;
								}
							}
							foreach ($notasTutor as $key) {
								if (!empty($key['cod_seccion']) && !empty($key['id_SC']) && !empty($key['id_clase'])) {
									$notas[$nume] = $key;
									$nume++;
								}
							}
							$secciones = $this->clase->validarConsultar("ConsultarSeccionProfesor", $_SESSION['cuenta_persona']['cedula']);
						}
						$saberes = $this->saber->validarConsultar("Consultar");
						$url = $this->url;
						require_once("view/notasView.php");
					}
				}
			} else {
				require_once("errorController.php");
			}
		}

		public function Buscar()
		{
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if ($acc['nombre_permiso'] == "Consultar") {
					$permitirAcceso = 1;
				}
			}
			if ($permitirAcceso == 1) {
				if ($_POST) {
					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['notaModif'])))) {
						$_POST = $this->nota->limpiarPost($_POST);
						list($cod_seccion, $id_SC, $id_clase) = explode('-', $_POST['notaModif']);
						$buscar = $this->nota->validarConsultar("getOne", $id_clase);
						echo json_encode($buscar);
					}
					if(!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['saberes']))) && !empty(trim(isset($_POST['cod_seccion'])))){
						// list($cod_seccion, $id_periodo) = explode('=', $_POST['cod_seccion']);
						list($_POST['cod_seccion'], $_POST['id_periodo']) = explode('=', $_POST['cod_seccion']);
						$_POST = $this->nota->limpiarPost($_POST);
						$cod_seccion = $_POST['cod_seccion'];
						$id_periodo = $_POST['id_periodo'];
						$periodosG = $this->periodo->validarConsultar("getOneId", $id_periodo);
						$seccionesG = $this->seccion->validarConsultar("getOne", $cod_seccion);
						$trayecto = "";
						$fase = "";
						if(!empty($seccionesG['data'][0]['trayecto_seccion'])){
							$trayecto = $seccionesG['data'][0]['trayecto_seccion'];
						}
						if(!empty($periodosG['data'][0]['nombre_periodo'])){
							$fase = $periodosG['data'][0]['nombre_periodo'];
						}
						$response = [];
						if($trayecto!="" && $fase != ""){
							$trayectoN = "";
							$faseN = "";
							if($trayecto=="I"){ $trayectoN = "1"; }else if($trayecto=="1"){ $trayectoN = "1"; }
							if($trayecto=="II"){ $trayectoN = "2"; }else if($trayecto=="2"){ $trayectoN = "2"; }
							if($trayecto=="III"){ $trayectoN = "3"; }else if($trayecto=="3"){ $trayectoN = "3"; }
							if($trayecto=="IV"){ $trayectoN = "4"; }else if($trayecto=="4"){ $trayectoN = "4"; }
							if($fase=="I"){ $faseN = "1"; }else if($fase=="1"){ $faseN = "1"; }
							if($fase=="II"){ $faseN = "2"; }else if($fase=="2"){ $faseN = "2"; }
							// echo $trayectoN."-".	$faseN;
							$buscar = $this->saber->validarConsultar("getSaber", $trayectoN,$faseN);
							if(count($buscar)>0){
								$response['data'] = [];
								$indx = 0;
								foreach ($buscar as $key) {
									if($key['id_SC']){
										$response['data'][$indx] = $key;
										$indx++;
									}
								}
								$response['msj'] = "Good";
								$buscar2 = $this->clase->validarConsultar("Consultar", ['campo'=>"cod_seccion", 'valor'=>$cod_seccion]);
								if(count($buscar2)>0){
									$response['msjSaberes'] = "Good";
									$response['dataSaberes'] = $buscar2;
									$buscar3 = $this->nota->validarConsultar("ConsultarNotasAlumnos", $cod_seccion);
									if(count($buscar3)>0){
										$response['msjNotas'] = "Good";
										$response['dataNotas'] = $buscar3;
									}else{
										$response['msjNotas'] = "Vacio";
									}
								}else{
									$response['msjSaberes'] = "Vacio";
								}
							}else{
								$response['msj'] = "Vacio";
							}
						}else{
							$response['msj'] = "Vacio";
						}
						echo json_encode($response);
					}
					if (!empty(trim(isset($_POST['Buscar']))) && !empty($_POST['alumnosSeccion']) && !empty($_POST['id_SC']) && !empty(trim(isset($_POST['cod_seccion'])))) {
						list($_POST['cod_seccion'], $_POST['id_periodo']) = explode('=', $_POST['cod_seccion']);
						$_POST = $this->nota->limpiarPost($_POST);
						$cod_seccion = $_POST['cod_seccion'];
						$id_periodo = $_POST['id_periodo'];
						$id_SC = $_POST['id_SC'];
						$alumnos = $this->nota->validarConsultar("ConsultarAlumnos", $cod_seccion, $id_SC);
						// echo "Seccion: ".$cod_seccion." || Saber: ".$id_SC;
						$response = [];
						if (count($alumnos) > 0) {
							$response['msj'] = "Good";
							$response['data'] = $alumnos;
							// $buscar2 = $this->seccion->ConsultarSecciones($trayecto);
							// if(count($buscar2)>0){
							// 	$response['msjSecciones'] = "Good";
							// 	$response['dataSecciones'] = $buscar2;
							// }else{
							// 	$response['msjSecciones'] = "Vacio";
							// }
						} else {
							$response['msj'] = "Vacio";
						}
						echo json_encode($response);
					}
				} else {
					header("location:./");
				}
			} else {
				echo json_encode(['msj' => "Denegado"]);
			}
		}

		public function Agregar()
		{
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if ($acc['nombre_permiso'] == "Agregar") {
					$permitirAcceso = 1;
				}
			}
			if ($permitirAcceso == 1) {
				if ($_POST) {
					if (!empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['saber']))) && !empty(trim(isset($_POST['Agregar']))) && !empty($_POST['idSA']) && !empty($_POST['notas'])) {
						list($_POST['seccion'], $_POST['id_periodo']) = explode('=', $_POST['seccion']);
						$_POST = $this->nota->limpiarPost($_POST);						
						$datos['seccion'] = $_POST['seccion'];
						$datos['id_periodo'] = $_POST['id_periodo'];
						$datos['saber'] = $_POST['saber'];
						$datos['id_clase'] = "";
						$clases = $this->clase->validarConsultar("getOne", $datos);
						if ($clases['msj'] == "Good") {
							if (count($clases['data']) > 1) {
								$claseAct = $clases['data'][0];
								$datos['id_clase'] = $claseAct['id_clase'];
							}
						}
						$suma = 0;
						$msj = [];
						$numb = 0;
						for ($i = 0; $i < count($_POST['notas']); $i++) {
							$idNota = "S" . $_POST['saber'] . "S" . $_POST['seccion'] . "N";
							$idNota = $this->nota->ExtraerPK($idNota); // "C2Y2022LDR5PED83P327"	
							$datos['id'] = $idNota;
							$datos['alumno'] = $_POST['idSA'][$i];
							$datos['nota'] = $_POST['notas'][$i];
							$buscar = $this->nota->validarConsultar("buscar", $datos['id_clase'], $datos['alumno']);
							if ($buscar['msj'] == "Good") {
								if (count($buscar['data']) > 1) {
									$datos['id'] = $buscar['data'][0]['id_nota'];
									$exec = $this->nota->ValidarAgregarOModificar($datos, "Modificar");
									if ($exec['msj'] == "Good") {
										$suma += 1;
										$msj[$numb] = "Good";
										$msj = "Good";
									}
									if ($exec['msj'] == "Error") {
										$msj[$numb] = "Error";
										$suma += 2;
									}
									if ($exec['msj'] == "Invalido") {
										$msj[$numb] = "Invalido";
										$suma += 0;
									}
								} else {
									$exec = $this->nota->ValidarAgregarOModificar($datos, "Agregar");
									if ($exec['msj'] == "Good") {
										$suma += 1;
										$msj[$numb] = "Good";
										$msj = "Good";
									}
									if ($exec['msj'] == "Error") {
										$msj[$numb] = "Error";
										$suma += 2;
									}
									if ($exec['msj'] == "Invalido") {
										$msj[$numb] = "Invalido";
										$suma += 0;
									}
								}
								$numb++;
							} else {
								$suma += 2;
							}
							if($msj == "Good"){
								$dataNotificacion['tabla_notificacion'] = "notas";
								$dataNotificacion['elemento_tabla'] = "codigo";
								$dataNotificacion['id_tabla'] = -1;
								$dataNotificacion['codigo_tabla'] = $datos['id'];
								$dataNotificacion['fecha_notificacion'] = date('Y-m-d');
								$dataNotificacion['hora_notificacion'] = date('h:i a');
								$dataNotificacion['visto_alumnos'] = 0;
								$dataNotificacion['visto_profesores'] = 0;
								$dataNotificacion['visto_admin'] = 9;
								$dataNotificacion['visto_superusuario'] = 9;
								$buscarNotificacion = $this->notificacion->Buscar($dataNotificacion);
								if (count($buscarNotificacion) < 1) {
									$res = $this->notificacion->Agregar($dataNotificacion);
								}
							}
						}
						if ($suma == count($_POST['notas'])) {
							$this->bitacora->monitorear($this->url);
							echo json_encode(['msj' => "Good"]);
						} else {
							if ($suma == 0) {
								echo json_encode(['msj' => "Invalido"]);
							} else {
								echo json_encode(['msj' => "Error"]);
							}
						}
					} else {
						echo json_encode(['msj' => "Vacio"]);
					}
				} else {
					header("location:./");
				}
			} else {
				echo json_encode(['msj' => "Denegado"]);
			}
		}


		public function Modificar()
		{
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if ($acc['nombre_permiso'] == "Modificar") {
					$permitirAcceso = 1;
				}
			}
			if ($permitirAcceso == 1) {
				if ($_POST) {
					if (!empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['saber']))) && !empty(trim(isset($_POST['Editar']))) && !empty($_POST['idSA']) && !empty($_POST['notas'])) {
						list($_POST['seccion'], $_POST['id_periodo']) = explode('=', $_POST['seccion']);
						$_POST = $this->nota->limpiarPost($_POST);
						// print_r($_POST['notas']);
						$datos['seccion'] = $_POST['seccion'];
						// print_r($_POST['seccion']);
						$datos['id_periodo'] = $_POST['id_periodo'];
						$datos['saber'] = $_POST['saber'];
						$datos['id_clase'] = "";
						$clases = $this->clase->validarConsultar("getOne", $datos);
						if ($clases['msj'] == "Good") {
							if (count($clases['data']) > 1) {
								$claseAct = $clases['data'][0];
								$datos['id_clase'] = $claseAct['id_clase'];
							}
						}
						$suma = 0;
						$msj = [];
						$numb = 0;
						// $result = $this->nota->validarEliminar("LimpiarNotas", $datos['id_clase']);
						// if ($result['msj'] == "Good") {
							for ($i = 0; $i < count($_POST['notas']); $i++) {
								$idNota = "S" . $_POST['saber'] . "S" . $_POST['seccion'] . "N";
								$idNota = $this->nota->ExtraerPK($idNota); // "C2Y2022LDR5PED83P327"	
								$datos['id'] = $idNota;
								$datos['alumno'] = $_POST['idSA'][$i];
								$datos['nota'] = $_POST['notas'][$i];
								$buscar = $this->nota->validarConsultar("buscar", $datos['saber'], $datos['alumno']);
								if ($buscar['msj'] == "Good") {
									if (count($buscar['data']) > 1) {
										$datos['id'] = $buscar['data'][0]['id_nota'];
										// print_r($buscar['data'][0]['id_nota']);
										$exec = $this->nota->ValidarAgregarOModificar($datos, "Modificar");
										// print_r($exec['msj']);
										if ($exec['msj'] == "Good") {
											$suma += 1;
											$msj[$numb] = "Good";
											$msj = "Good";
										}
										if ($exec['msj'] == "Error") {
											$msj[$numb] = "Error";
											$suma += 2;
										}
										if ($exec['msj'] == "Invalido") {
											$msj[$numb] = "Invalido";
											$suma += 0;
										}
									} else {
										$exec = $this->nota->ValidarAgregarOModificar($datos, "Modificar");
										if ($exec['msj'] == "Good") {
											$suma += 1;
											$msj[$numb] = "Good";
											$msj = "Good";
										}
										if ($exec['msj'] == "Error") {
											$msj[$numb] = "Error";
											$suma += 2;
										}
										if ($exec['msj'] == "Invalido") {
											$msj[$numb] = "Invalido";
											$suma += 0;
										}
										// echo json_encode($exec);
									}
								} else {
									$suma += 2;
								}
							}
							if ($suma == count($_POST['notas'])) {
								$this->bitacora->monitorear($this->url);
								echo json_encode(['msj' => "Good"]);
							} else {
								if ($suma == 0) {
									echo json_encode(['msj' => "Invalido"]);
								} else {
									echo json_encode(['msj' => "Error"]);
								}
							}
						// } else {
						// 	echo json_encode(['msj' => "Error"]);
						// }
					} else {
						echo json_encode(['msj' => "Vacio"]);
					}
				} else {
					header("location:./");
				}
			} else {
				echo json_encode(['msj' => "Denegado"]);
			}
		}


		public function Eliminar()
		{
			$permitirAcceso = 0;
			foreach ($this->accesos as $acc) {
				if ($acc['nombre_permiso'] == "Eliminar") {
					$permitirAcceso = 1;
				}
			}
			if ($permitirAcceso == 1) {
				if ($_POST) {
					if (!empty(trim(isset($_POST['Eliminar']))) && !empty(trim(isset($_POST['notaDelete'])))) {
						$_POST = $this->nota->limpiarPost($_POST);
						list($cod_seccion, $id_SC, $id_clase) = explode('-', $_POST['notaDelete']);
						$buscar = $this->nota->validarConsultar("getOne", $id_clase);
						if ($buscar['msj'] == "Good") {
							if (count($buscar['data']) > 1) {
								$data = $buscar['data'][0];
								$exec = $this->nota->validarEliminar("Eliminar", $id_clase);
								$exec['data'] = $data;

								foreach($buscar['data'] as $notasB){
									$dat['tabla'] = "notas";
									$dat['codigo'] = $notasB['id_nota'];
									$respB = $this->notificacion->Eliminar($dat);
								}

								echo json_encode($exec);
							} else {
								echo json_encode(['msj' => "Error"]);
							}
							$this->bitacora->monitorear($this->url);
						} else {
							echo json_encode(['msj' => "Error"]);
						}
					}
				} else {
					header("location:./");
				}
			} else {
				echo json_encode(['msj' => "Denegado"]);
			}
		}
	}
