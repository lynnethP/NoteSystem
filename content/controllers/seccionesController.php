<?php

	namespace content\controllers;

	use config\settings\sysConfig as sysConfig;
	use content\component\headElement as headElement;
	use content\modelo\homeModel as homeModel;
	use content\modelo\bitacoraModel as bitacoraModel;
	use content\modelo\seccionesModel as seccionesModel;
	// use content\modelo\periodosModel as periodosModel;
	use content\modelo\alumnosModel as alumnosModel;
	use content\modelo\notificacionesModel as notificacionesModel;
	use content\modelo\rolesModel as rolesModel;
	use content\traits\Utility;

	class seccionesController{
		use Utility;
		private $url;
		private $seccion;
		// private $periodo;
		private $alumno;
		private $bitacora;
		private $notificacion;
		private $rol;
		private $accesos;

		function __construct($url){

			$this->url = $url;
			$this->notificacion = new notificacionesModel();
			$this->bitacora = new bitacoraModel();

			$this->seccion = new seccionesModel();
			// $this->periodo = new periodosModel();
			$this->alumno = new alumnosModel();

			$this->rol = new rolesModel();
			$rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Secciones"];
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

				$secciones = $this->seccion->validarConsultar("Consultar");
				$seccionAlumnos = $this->seccion->validarConsultar("ConsultarSeccionAlumnos");
				// $secAlumnos = $this->seccion->ConsultarSeccionAlumnos2();
				// $periodos = $this->periodo->validarConsultar("Consultar");
				$alumnos = $this->alumno->validarConsultar("Consultar");
				// print_r($alumnos);

				$url = $this->url;
				require_once("view/seccionesView.php");
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
					if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['cod_seccion'])))) {
						$_POST = $this->seccion->limpiarPost($_POST);
						$buscar = $this->seccion->validarConsultar("getOne", $_POST['cod_seccion']);
						echo json_encode($buscar);
					}
					if(!empty(trim(isset($_POST['Buscar']))) && !empty($_POST['alumnos']) && !empty(trim(isset($_POST['trayecto']))) && !empty(trim(isset($_POST['year'])))){
						$_POST = $this->seccion->limpiarPost($_POST);
						$trayecto = $_POST['trayecto'];
						$year = $_POST['year'];
						// echo "T: ".$trayecto." | ";
						// echo "P: ".$year." | ";
						$buscar = $this->alumno->validarConsultar("Consultar", $trayecto);
						// print_r($buscar);
						$response = [];
						if(count($buscar)>0){
							$response['data'] = $buscar;
							$response['msj'] = "Good";
							$buscar2 = $this->seccion->validarConsultar("ConsultarSecciones", $trayecto, $year);
							if(count($buscar2)>0){
								$response['msjSecciones'] = "Good";
								$response['dataSecciones'] = $buscar2;
							}else{
								$response['msjSecciones'] = "Vacio";
							}
						}else{
							$response['msj'] = "Vacio";
						}
						echo json_encode($response);
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
					if (!empty(trim(isset($_POST['Agregar']))) && !empty(trim(isset($_POST['nombre']))) && !empty(trim(isset($_POST['year']))) && !empty(trim(isset($_POST['trayecto']))) && !empty($_POST['alumnos'])) {
						$_POST = $this->seccion->limpiarPost($_POST);
						$codSeccion = "Y".$_POST['year']."T".$_POST['trayecto']."S";
						$codSeccion = $this->seccion->ExtraerPK($codSeccion); // "C2Y2022LDR5PED83P327"
						// echo $codSeccion;
						// print_r($_POST);
						$datos['cod_seccion'] = $codSeccion;
						$datos['seccion'] = mb_strtoupper($_POST['nombre']);
						$datos['year'] = $_POST['year'];
						$datos['trayecto'] = $_POST['trayecto'];
						$datos['alumnos'] = $_POST['alumnos'];
						$buscar = $this->seccion->validarConsultar("getOneData", $datos);
						// print_r($buscar);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($buscar['data'][0]['estatus']==0){
									$datos['cod_seccion'] = $buscar['data'][0]['cod_seccion'];
									$exec = $this->seccion->ValidarAgregarOModificar($datos, "Modificar"); 

									if($exec["msj"] == "Good"){
										$exec = $this->seccion->validarEliminar("EliminarSeccionAlumno", $datos['cod_seccion']);
										 	if($exec["msj"] == "Good"){
												
												$data['cod_seccion'] = $datos['cod_seccion'];  
												foreach ($datos['alumnos'] as $alumnos) {
													$data['cedula_alumno'] = $alumnos;
														$exec = $this->seccion->ValidarAgregarOModificar($data, "AgregarSecAlumno"); 
												}
												echo json_encode($exec);
											}else{
												echo json_encode($exec);
											} 
									}else{
										echo json_encode($exec);
									}
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->seccion->ValidarAgregarOModificar($datos, "Agregar"); 
								if($exec["msj"] == "Good"){
									$exec = $this->seccion->validarEliminar("EliminarSeccionAlumno", $datos['cod_seccion']);
									 	if($exec["msj"] == "Good"){
											$data['cod_seccion'] = $datos['cod_seccion'];  
											foreach ($datos['alumnos'] as $alumnos) {
												$data['cedula_alumno'] = $alumnos;
													$exec = $this->seccion->ValidarAgregarOModificar($data, "AgregarSecAlumno"); 
											}
											echo json_encode($exec);
										}else{
											echo json_encode($exec);
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
					// print_r($_POST);
					if (!empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['Editar']))) && !empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['trayecto']))) && !empty(trim(isset($_POST['year'])))  && !empty($_POST['alumnos'])) {
						$_POST = $this->seccion->limpiarPost($_POST);
						$datos['cod_seccion'] = $_POST['codigo'];
						$datos['seccion'] = mb_strtoupper($_POST['seccion']);
						$datos['year'] = $_POST['year'];
						$datos['trayecto'] = $_POST['trayecto'];
						$datos['alumnos'] = $_POST['alumnos'];
						$buscar = $this->seccion->validarConsultar("getOneData", $datos);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								if($_POST['codigo']==$buscar['data'][0]['cod_seccion']){
									$datos['cod_seccion'] = $buscar['data'][0]['cod_seccion'];
									$exec = $this->seccion->ValidarAgregarOModificar($datos, "Modificar"); 
									if($exec["msj"] == "Good"){
										$exec = $this->seccion->validarEliminar("EliminarSeccionAlumno", $datos['cod_seccion']);
										 	if($exec["msj"] == "Good"){
												
												$data['cod_seccion'] = $datos['cod_seccion'];  
												foreach ($datos['alumnos'] as $alumnos) {
													$data['cedula_alumno'] = $alumnos;
														$exec = $this->seccion->ValidarAgregarOModificar($data,"AgregarSecAlumno"); 
												}

												echo json_encode($exec);

											}else{
												echo json_encode($exec);
											} 
									}else{
										echo json_encode($exec);
									} 
								}else{
									echo json_encode(['msj'=>"Repetido"]);
								}
							}else{
								$exec = $this->seccion->ValidarAgregarOModificar($datos, "Modificar");
								if($exec["msj"] == "Good"){
									$exec = $this->seccion->validarEliminar("EliminarSeccionAlumno", $datos['cod_seccion']);
									 	if($exec["msj"] == "Good"){
											
											$data['cod_seccion'] = $datos['cod_seccion'];  
											foreach ($datos['alumnos'] as $alumnos) {
												$data['cedula_alumno'] = $alumnos;
													$exec = $this->seccion->ValidarAgregarOModificar($data,"AgregarSecAlumno"); 
											}

											echo json_encode($exec);

										}else{
											echo json_encode($exec);
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
					if (!empty(trim(isset($_POST['Eliminar']))) && !empty(trim(isset($_POST['cod_seccion'])))) {
						$_POST = $this->seccion->limpiarPost($_POST);
						$buscar = $this->seccion->validarConsultar("getOne", $_POST['cod_seccion']);
						if($buscar['msj']=="Good"){
							$this->bitacora->monitorear($this->url);
							if(count($buscar['data'])>1){
								$data = $buscar['data'][0];
								$exec = $this->seccion->validarEliminar("Eliminar", $_POST['cod_seccion']);
								$exec2 = $this->seccion->validarEliminar("EliminarSeccionAlumno", $_POST['cod_seccion']);
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