<?php

	namespace config\settings;
	
	define("_ROUTE_" , "/PNFH/");
	define("_THEME_" , "/PNFH/assets");
	define("_INDEX_FILE_" , "/PNFH/index.php");
	define("_IMG_" , "assets/img/perfil");

	define('_DIRECTORY_', 'content/controllers/');
	define("_MODEL_" , "content/modelo/");
	define("_CONTROLLER_" , "Controller.php");

	define("_DB_SERVER_" , "http://localhost/");
	define("_URL_" , "http://localhost/PNFH/");

	define('_DB_MANAGER_', 	'mysql');
	define("_DB_WEB_" , "higiene");
	define('_HOST_', 'localhost');
	define("_DB_USER_", "pnfh");
	define("_DB_PASS_", "pnf.higiene");

	define("_ACC_USER_", "#pnf.higiene");
	define("_ACC_PASS_", "#pnf.Higiene2022");

	define("_COMPLEMENT_" , "/PNFH/view/assets/");
	define("_NAMESYSTEM_" , "PNFH");

	class sysConfig{

		public function _init(){
			if (file_exists("content/controllers/frontController.php")){
				require_once('content/controllers/frontController.php');
			}
			else{
				die("<script>location='?url=error'</script>");
			}
		}
		protected function _ROUTE_()		{return _ROUTE_;}
		protected function _THEME_()		{return _THEME_;}
		protected function _INDEX_FILE_()	{return _INDEX_FILE_;}
		protected function _DIRECTORY_()	{return _DIRECTORY_;}
		protected function _MODEL_()		{return _MODEL_;}
		protected function _CONTROLLER_()	{return _CONTROLLER_;}
		protected function _DB_SERVER_()	{return _DB_SERVER_;}
		protected function _DB_MANAGER_()	{return _DB_MANAGER_;}
		protected function _DB_WEB_()		{return _DB_WEB_;}
		protected function _HOST_()			{return _DB_WEB_;}
		protected function _DB_USER_()		{return _DB_USER_;}
		protected function _DB_PASS_()		{return _DB_PASS_;}
	}

?>