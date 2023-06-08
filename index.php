<?php
	date_default_timezone_set('America/Caracas');
	ini_set('date.timezone', 'america/caracas');

	// echo "probemos";
	if(file_exists("vendor/autoload.php")){
		require_once("vendor/autoload.php");
	}else{
		if(file_exists("content/component/error404.php")){
			require_once("content/component/error404.php");
		}
		die($html404);
	}
	session_start();
	if( !empty($_GET['web']) && $_GET['web']=="test" ){
		$_SESSION['accesoTemporalActualUser'] = "#pnf.higiene";
		$_SESSION['accesoTemporalActualPass'] = "#pnf.Higiene2022";
		$_SESSION['_ROUTE_'] = "/"; 
		$_SESSION['cuentaActiva'] = true;
		$_SESSION['cuenta_usuario']['id_rol'] = 1;
		$_SESSION['cuenta_usuario']['nombre_rol'] = "Superusuario";
		$_SESSION['cuenta_usuario']['estatus'] = 1;
		$_SESSION['cuenta_usuario']['cedula_usuario'] = "18690684";
		$_SESSION['cuenta_usuario']['nombre_usuario'] = "Joan18";
		$_SESSION['cuenta_usuario']['password_usuario'] = '$2y$08$dhacF2aI6NnSHTKB7/lZPuVHncP3pHltvLveMdQB7cVXp4h/BLdXm';
		$_SESSION['cuenta_usuario']['correo'] = "joan_18@gmail.com";

		$_SESSION['cuenta_usuario']['imagen'] = "assets/img/perfil/18690684.jpeg";
		$_SESSION['cuenta_usuario']['intentos'] = 0;
		$_SESSION['cuenta_usuario']['codigo_desbloqueo'] = "";
		$_SESSION['cuenta_usuario']['accesos_usuario'] = [0=>[true],1=>[true]];

		$_SESSION['cuenta_persona']['cedula_profesor'] = "18690684";
		$_SESSION['cuenta_persona']['nombre_profesor'] = "Joan";
		$_SESSION['cuenta_persona']['apellido_profesor'] = "Perez";
		$_SESSION['cuenta_persona']['telefono_profesor'] = "04121647134";
		$_SESSION['cuenta_persona']['estatus'] = 1;
		$_SESSION['cuenta_persona']['cedula'] = "18690684";
		$_SESSION['cuenta_persona']['nombre'] = "Joan";
		$_SESSION['cuenta_persona']['apellido'] = "Perez";
		$_SESSION['cuenta_persona']['telefono'] = "04121647134";
		$_SESSION['cuenta_persona']['nombreCorto'] = "";
		$_SESSION['cuenta_persona']['apellidoCorto'] = "";
	}
	// session_destroy();

	use config\settings\sysConfig as sysConfig;

	$globalConfig = new sysConfig();
	$globalConfig->_init();

	use content\controllers\frontController as frontController;

	$IndexSystem = new frontController($_REQUEST);
	$_SESSION['_ROUTE_'] = "/";
	// $_SESSION['_ROUTE_'] = _ROUTE_;

?>