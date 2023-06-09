<?php

	/* utilizaremos namespace en la primera línea de código */
	namespace config\settings;

	/* Definimos las constantes que usaremos */
	
	define("_ROUTE_" , "/");					/* direccion del proyecto */
	define("_THEME_" , "/assets");			/* Direccion de recursos y estilos */
	define("_INDEX_FILE_" , "/index.php");	/* direccion del archivo index */
	define("_IMG_" , "assets/img/perfil");

	define('_DIRECTORY_', 'content/controllers/'); 					/* Direccion de controladores */
	define("_MODEL_" , "content/modelo/");							/* direccion de los modelos */
	define("_CONTROLLER_" , "Controller.php");						/* complemento para la llamada de controladores */
	
	define("_DB_SERVER_" , "ftp.cwq.ifk.mybluehost.me");
	define("_URL_" , "/");					/* nombre del servidor */

	define('_DB_MANAGER_', 	'mysql');						        /* manejador de base de datos */
	define("_DB_WEB_" , "cwqifkmy_higiene2023");								/* nombre de la base de datos */
	define('_HOST_', 'ftp.cwq.ifk.mybluehost.me');							/* nombre del host */
	define("_DB_USER_", "cwqifkmy_Higiene");									/* nombre del usuario de la base de datos */
	define("_DB_PASS_", "Higiene_2022!");										/* contraseña de la base de datos  */
	
	define("_ACC_USER_", "#pnf.higiene");										/* contraseña de la base de datos  */
	define("_ACC_PASS_", "#pnf.Higiene2022");										/* contraseña de la base de datos  */

	define("_COMPLEMENT_" , "/view/assets/");					/* direccion del proyecto */
	define("_NAMESYSTEM_" , "PNFH");					/* direccion del proyecto */

	/* clase con el nombre config  */
	class sysConfig{

		/* método publico llamado _init()   */
		public function _init(){
			/* verifica si existe dentro de la carpeta Controllers el archivo frontcontroller.php */
			if (file_exists("content/controllers/frontController.php")){
				require_once('content/controllers/frontController.php');
			}
			else{
				die("<script>location='?url=error'</script>");
			}
		}
		/* métodos protegidos los cuales retornan los define que se definieron en la parte superior del código */
		protected function _ROUTE_()		{return _ROUTE_;}
		protected function _THEME_()		{return _THEME_;}
		protected function _INDEX_FILE_()	{return _INDEX_FILE_;}
		protected function _DIRECTORY_()	{return _DIRECTORY_;}
		protected function _MODEL_()		{return _MODEL_;}
		protected function _CONTROLLER_()	{return _CONTROLLER_;}
		protected function _DB_SERVER_()	{return _DB_SERVER_;}
		protected function _DB_MANAGER_()	{return _DB_MANAGER_;}
		protected function _DB_WEB_()		{return _DB_WEB_;}
		protected function _HOST_()			{return _HOST_;}
		protected function _DB_USER_()		{return _DB_USER_;}
		protected function _DB_PASS_()		{return _DB_PASS_;}

	}


?>