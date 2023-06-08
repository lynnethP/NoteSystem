<?php

namespace content\controllers;

require_once 'vendor/dompdf/dompdf/vendor/autoload.php';

use config\settings\sysConfig as sysConfig;
use content\component\headElement as headElement;
use content\modelo\homeModel as homeModel;
use content\modelo\reportesModel as reportesModel;
use content\modelo\notificacionesModel as notificacionesModel;
use content\modelo\rolesModel as rolesModel;
use content\modelo\clasesModel as clasesModel;
use content\modelo\notasModel as notasModel;
use content\modelo\seccionesModel as seccionesModel;
	use content\modelo\periodosModel as periodosModel;
use content\modelo\saberesModel as saberesModel;
use content\modelo\bitacoraModel as bitacoraModel;
use Dompdf\Dompdf;
use content\traits\Utility;
use \DateTime;

class reportesController
{
	use Utility;
	private $url;
	private $reportes;
	private $dompdf;
	private $notificacion;
	private $bitacora;
	private $accesos;
	private $clase;
	private $nota;
	private $rol;
	private $seccion;
	private $periodo;
	private $saber;

	function __construct($url)
	{
		$this->url = $url;
		$this->notificacion = new notificacionesModel();
		$this->reportes = new reportesModel();
		$this->rol = new rolesModel();
		$this->clase = new clasesModel();
		$this->nota = new notasModel();
		$this->seccion = new seccionesModel();
		$this->periodo = new periodosModel();
		$this->saber = new saberesModel();
		$this->bitacora = new bitacoraModel();
		$this->dompdf = new Dompdf();
		$rolAc = ['id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Reportes"];
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
			$objModel = new homeModel;
			$_css = new headElement;
			$_css->Heading();
			$secciones = $this->clase->validarConsultar("ConsultarSeccionClase");
			$this->bitacora->monitorear($this->url);
			$url = $this->url;
			require_once("view/reportesView.php");
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
				if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['alumnosSeccion']))) && !empty(trim(isset($_POST['id_SC']))) && !empty(trim(isset($_POST['cod_seccion'])))) {
					$cod_seccion = $_POST['cod_seccion'];
					$id_SC = $_POST['id_SC'];
					$alumnos = $this->nota->validarConsultar("ConsultarAlumnos", $cod_seccion, $id_SC);
					$response = [];
					if (count($alumnos) > 0) {
						$response['msj'] = "Good";
						$response['data'] = $alumnos;
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

	public function Aprobacion() {
		$resp = $this->reportes->Aprobacion($_POST['alumno'], $_POST['saber']);
		if (empty($resp) == true) {
			echo $html404 = '
				<style>
				body{
					margin:0;padding:0;
					background-image: url(' . _ROUTE_ . 'assets/img/post.png);
					background-repeat: no-repeat;
					background-size: 100% 100%;
					background-position: center;
				}
				</style>
				';
		} else {
			ob_start();
			$fecha = date('Y-m-d');
			date_default_timezone_set('America/Caracas');
			setlocale(LC_TIME, 'spanish');
			$inicio = strftime("a los %d días del mes de %B del %Y", strtotime($fecha));
			$nota = floatval($resp[0]["nota"]);
			if ($nota  >= 0.5) {
				$aprobacion = "aprobó con éxito";
			} else {
				$aprobacion = "reprobó";
			}
			switch ($resp[0]["trayecto_SC"]) {
				case '1':
					$trayecto = 'I';
					break;
				case '2':
					$trayecto = 'II';
					break;
				case '3':
					$trayecto = 'III';
					break;
				case '4':
					$trayecto = 'IV';
					break;
				default:
					break;
			}
			switch ($resp[0]["fase_SC"]) {
				case '1':
					$fase = 'I';
					break;
				case '2':
					$fase = 'II';
					break;
				default:
					break;
			}
			?>
			<!DOCTYPE html>
			<html>

			<head>
				<title> <?php echo _NAMESYSTEM_; ?> | Constancia de Aprobación</title>

			</head>
			<style>
				* {
					font-size: 1.010em;
				}

				img {
					width: 100%;
				}
			</style>

			<body class="">

				<img src="http://<?php echo $_SERVER['HTTP_HOST']; ?>/PNFH/assets/img/cint.jpg" alt="cintillo">
				<div class="box-body">

					<section class="content">
						<div style="width:100%;display:inline-block;">
							<div style="width:100%;margin:auto;text-align:center;">
								<p style="width:100%;">
									<b style="font-family:arial;">
										REPÚBLICA BOLIVARIANA DE VENEUELA<br>MINISTERIO DEL PODER POPULAR PARA LA EDUCACIÓN<br>UNIVERSIDAD POLITÉCNICA TERRITORIAL <br> ANDRÉS ELOY BLANCO

									</b>
								</p>

								<p style="width:100%;margin-top:15%;">
									<b style="font-family:arial;">
										CONSTANCIA

									</b>
								</p>

								<p style="width:75%;margin:auto;margin-top:5%;text-align:justify;">
									<span style="margin-left:5%;"> </span>Quien suscribe: Licenciado <b>Joan Perez</b>, C.I. V-18.690.684, encargado del departamento de HIGIENE Y SEGURIDAD LABORAL, ubicado en las instalaciones de la UPTAEB, estado Lara.
								</p>

								<p style="width:75%;margin:auto;margin-top:2%;text-align:justify;">
									<span style="margin-left:5%;"> </span>Por medio de la presente hago constar que el/la estudiante: <b><?php echo strtoupper($resp[0]["nombre_alumno"]) . ' ' . strtoupper($resp[0]["apellido_alumno"]); ?></b>, C.I. V-<?php echo number_format($resp[0]["cedula_alumno"], 0, ',', '.'); ?> , <?php echo $aprobacion; ?> el Saber Complementario <?php echo $resp[0]["nombreSC"]; ?> correspondiente a la FASE <?php echo $fase; ?> del TRAYECTO <?php echo $trayecto; ?>, cursado en dicho PNF.
								</p>

								<p style="width:75%;margin:auto;margin-top:2%;text-align:justify;">
									<span style="margin-left:5%;"> </span>Constancia que se expide, por medio de la parte interesada, en Barquisimeto <?php echo $inicio; ?>.
								</p>

								<p style="width:75%;margin:auto;margin-top:35%;text-align:justify;">
									<hr style="border-bottom:1px solid #000;width:35%;">
									Ldo. Joan Pérez<br>
									C.I. V-18.123.543<br>
									Encargado
								</p>
							</div>
						</div>
					</section>
				</div>
			</body>

			</html>
			<?php
			$html = ob_get_clean();
			//echo $html;	
			$options = $this->dompdf->getOptions();
			$options->set(array('isRemoteEnabled' => true));
			$this->dompdf->setOptions($options);
			$this->dompdf->loadHtml($html);
			$this->dompdf->setPaper('letter');
			$this->dompdf->render();
			$this->dompdf->stream("Lista_Usuarios", array("Attachment" => false));
		}
	}

	public function Usuarios()
	{
		$resp = $this->reportes->Usuarios();
		if (empty($resp) == true) {

			echo $html404 = '
				
				<style>

				body{
					margin:0;padding:0;
					background-image: url(' . _ROUTE_ . 'assets/img/post.png);
					background-repeat: no-repeat;
					background-size: 100% 100%;
					background-position: center;
				}

				</style>

				';
		} else {
			$num = 1;
			ob_start();
			?>


			<!DOCTYPE html>
			<html>

			<head>
				<title> <?php echo _NAMESYSTEM_; ?> | Lista de Usuarios</title>
				<!-- CSS only -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			</head>
			<style>
				table {
					border-collapse: collapse;
				}

				table,
				th,
				td {
					border: 1px solid black;
				}

				th,
				td {
					padding: 5px;
				}

				img {
					width: 100%;
				}
			</style>

			<body class="">
				<div class="box-body ">
					<img src="http://<?php echo $_SERVER['HTTP_HOST']; ?>/PNFH/assets/img/cint.jpg" alt="cintillo">
					<h2 style="text-align: center;">Lista de Usuarios</h2>
					<div class="table-responsive">

						<table id="datatable" class="table table-bordered" style="text-align:center;width:100%;font-size:1em;">
							<thead>
								<tr>
									<th style="text-align: center;">Nº</th>
									<th style="text-align: center;">Cédula</th>
									<th style="text-align: center;">Usuario</th>
									<th style="text-align: center;">Correo</th>
									<th style="text-align: center;">Rol</th>
									<th style="text-align: center;">Estado</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$num = 1;
								foreach ($resp as $data) :
									if (!empty($data['cedula_usuario'])) :
										$estado = "";
										$estiloss = "";
										$cantidad = count($resp);
										if ($num % 2 != 0) {
											$estiloss = "background:#ebe4e4";
										}

										if ($data['estatus'] == "0") {
											$estado = "Inactivo";
										} else if ($data['estatus'] == "1") {
											$estado = "Activo";
										} else if ($data['estatus'] == "2") {
											$estado = "Primer Ingreso";
										} else if ($data['estatus'] == "3") {
											$estado = "Bloqueado";
										}
								?>
										<tr style="<?= $estiloss; ?>">
											<td style="width:5%">
												<span class="contenido2">
													<?php echo $num++; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['cedula_usuario']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['nombre_usuario']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['correo']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['nombre_rol']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $estado; ?>
												</span>
											</td>



										</tr>
								<?php
									endif;
								endforeach;
								?>
							</tbody>
							<tfoot>
								<tr>
									<th style="text-align: center;">Nº</th>
									<th style="text-align: center;">Cédula</th>
									<th style="text-align: center;">Usuario</th>
									<th style="text-align: center;">Correo</th>
									<th style="text-align: center;">Rol</th>
									<th style="text-align: center;">Estado</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</body>

			</html>

			<?php
			$html = ob_get_clean();
			$options = $this->dompdf->getOptions();
			$options->set(array('isRemoteEnabled' => true));
			$this->dompdf->setOptions($options);
			$this->dompdf->loadHtml($html);
			$this->dompdf->setPaper('letter');
			$this->dompdf->render();
			$this->dompdf->stream("Lista_Usuarios", array("Attachment" => false));
			$this->bitacora->monitorear($this->url);
		}
	}

	public function Notas()
	{	
		list($_POST['seccion'], $_POST['id_periodo']) = explode('=', $_POST['seccion']);
		$resp = $this->reportes->Notas($_POST['seccion'], $_POST['saber']);
		if (empty($resp) == true) {

			echo $html404 = '
				
				<style>

				body{
					margin:0;padding:0;
					background-image: url(' . _ROUTE_ . 'assets/img/post.png);
					background-repeat: no-repeat;
					background-size: 100% 100%;
					background-position: center;
				}

				</style>

				';
			// echo json_encode(['msj' => 'vacio']);
		} else {


			$seccion = $resp[0]['nombre_seccion'];
			$saber = $resp[0]['nombreSC'];
			$num = 1;
			ob_start();

			?>


			<!DOCTYPE html>
			<html>

			<head>
				<title> <?php echo _NAMESYSTEM_; ?> | Lista de Notas</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<!-- CSS only -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
			</head>
			<style>
				table {
					border-collapse: collapse;
				}

				table,
				th,
				td {
					border: 1px solid black;
				}

				th,
				td {
					padding: 5px;
				}

				img {
					width: 100%;
				}
			</style>

			<body class="">
				<div class="box-body ">
					<img src="http://<?php echo $_SERVER['HTTP_HOST']; ?>/PNFH/assets/img/cint.jpg" alt="cintillo">
					<h2 style="text-align: center;">Lista de Calificaciones</h2>
					<div class="table-responsive">
						<h3>Sección: <?php echo $seccion; ?></h3>
						<h3>Saber Complementario: <?php echo $saber; ?></h3>
						<table id="datatable" class="table table-bordered" style="text-align:center;width:100%;font-size:1em;">
							<thead>
								<tr>
									<th style="text-align: center;">Nº</th>
									<!-- <th style="text-align: center;">Id</th> -->
									<th style="text-align: center;">Cédula</th>
									<th style="text-align: center;">Nombre</th>
									<th style="text-align: center;">Apellido</th>
									<th style="text-align: center;">Nota</th>
								</tr>
							</thead>
							<tbody>
								<?php
								$num = 1;
								foreach ($resp as $data) :
									if (!empty($data['id_nota'])) :
										$estado = "";
										$estiloss = "";
										$cantidad = count($resp);
										if ($num % 2 != 0) {
											$estiloss = "background:#ebe4e4";
										}
								?>
										<tr style="<?= $estiloss; ?>">
											<td style="width:5%">
												<span class="contenido2">
													<?php echo $num++; ?>
												</span>
											</td>
											<!-- <td style="width:20%">
												<span class="contenido2">
													<?php echo $data['id_nota']; ?>
												</span>
											</td> -->
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['cedula_alumno']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['nombre_alumno']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo $data['apellido_alumno']; ?>
												</span>
											</td>
											<td style="width:20%">
												<span class="contenido2">
													<?php echo number_format($data['nota'],1,',','.'); ?>
												</span>
											</td>
										</tr>
								<?php
									endif;
								endforeach;
								?>
							</tbody>
							<tfoot>
								<tr>
									<th style="text-align: center;">Nº</th>
									<!-- <th style="text-align: center;">Id</th> -->
									<th style="text-align: center;">Cédula</th>
									<th style="text-align: center;">Nombre</th>
									<th style="text-align: center;">Apellido</th>
									<th style="text-align: center;">Nota</th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</body>

			</html>

			<?php
			$html = ob_get_clean();
			//echo $html;	
			$options = $this->dompdf->getOptions();
			$options->set(array('isRemoteEnabled' => true));
			$this->dompdf->setOptions($options);
			$this->dompdf->loadHtml($html);
			$this->dompdf->setPaper('letter');
			$this->dompdf->render();
			$this->dompdf->stream("Lista_Notas_" . $seccion . "_" . $saber, array("Attachment" => false));
			$this->bitacora->monitorear($this->url);
		}
	}


	public function Estadistico()
	{
		$permitirAcceso = 0;
		foreach ($this->accesos as $acc) {
			if ($acc['nombre_permiso'] == "Consultar") {
				$permitirAcceso = 1;
			}
		}
		if ($permitirAcceso == 1) {
			if ($_POST) {
				if (!empty(trim(isset($_POST['Reportes']))) && !empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['saber'])))) {
					list($_POST['seccion'], $_POST['id_periodo']) = explode('=', $_POST['seccion']);
					// $_POST = $this->nota->limpiarPost($_POST);
					// $datos['seccion'] = $_POST['seccion'];
					// $datos['id_periodo'] = $_POST['id_periodo'];
					// echo $_POST['seccion']." | ".$_POST['saber'];
					$resp = $this->reportes->Notas($_POST['seccion'], $_POST['saber']);
					// print_r($resp);
					echo json_encode($resp);
					if(!empty($resp)){
						$this->bitacora->monitorear($this->url);
					}
				}
			} else {
				header("location:./");
			}
		} else {
			echo json_encode(['msj' => "Denegado"]);
		}
	}

	public function Porcentaje()
	{
		$permitirAcceso = 0;
		foreach ($this->accesos as $acc) {
			if ($acc['nombre_permiso'] == "Consultar") {
				$permitirAcceso = 1;
			}
		}
		if ($permitirAcceso == 1) {
			if ($_POST) {
				if (!empty(trim(isset($_POST['Reportes']))) && !empty(trim(isset($_POST['seccion']))) && !empty(trim(isset($_POST['saber'])))) {
					list($_POST['seccion'], $_POST['id_periodo']) = explode('=', $_POST['seccion']);
					$resp = $this->reportes->Notas($_POST['seccion'], $_POST['saber']);
					echo json_encode($resp);
					if(!empty($resp)){
						$this->bitacora->monitorear($this->url);
					}
				}
			} else {
				header("location:./");
			}
		} else {
			echo json_encode(['msj' => "Denegado"]);
		}
	}

	public function Aprobados()
	{
		$permitirAcceso = 0;
		foreach ($this->accesos as $acc) {
			if ($acc['nombre_permiso'] == "Consultar") {
				$permitirAcceso = 1;
			}
		}
		if ($permitirAcceso == 1) {
			if ($_POST) {
				if (!empty(trim(isset($_POST['Reportes']))) && !empty(trim(isset($_POST['seccion']))) ) {
					list($_POST['seccion'], $_POST['id_periodo']) = explode('=', $_POST['seccion']);
					$resp = $this->reportes->Aprobados($_POST['seccion']);
					echo json_encode($resp);
					if(!empty($resp)){
						$this->bitacora->monitorear($this->url);
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


?>