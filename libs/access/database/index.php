<?php

	date_default_timezone_set('America/Caracas');
	ini_set('date.timezone', 'america/caracas');

	session_start();
	if(file_exists("../../../content/config/settings/sysConfig.php")){
		require_once("../../../vendor/autoload.php");
		require_once("../../../content/config/settings/sysConfig.php"); /* Indexar mediante require_once el autoload.php de composer */
	}

	use config\settings\sysConfig as sysConfig; /* El as nos ayuda a renombrar el directorio sysConfig*/
	$globalConfig = new sysConfig(); /* instanciamos la clase sysConfig */
	use phpseclib\Crypt\RSA; 
	$objRSA = new RSA();

	$adix = date('h.i');
	// $accesoTemporalActualUser = $_SESSION['accesoTemporalActualUser'].".".$adix;
	// $accesoTemporalActualPass = $_SESSION['accesoTemporalActualPass'].".".$adix;
	$accesoTemporalActualUser = $_SESSION['accesoTemporalActualUser'];
	$accesoTemporalActualPass = $_SESSION['accesoTemporalActualPass'];

	const METODO ='AES-256-CBC';
	const CODIGO_PASSWORD ='WORLD*';
	const CODIGO_VECTOR ='1997';

	function encriptar($cadena){
        $salida = FALSE;
        $password = hash('sha256', CODIGO_PASSWORD); //Genera Valor Cifrado en base a un string
        $vectorInicializacion = substr(hash('sha256', CODIGO_VECTOR), 0, 16);
        $salida = openssl_encrypt($cadena, METODO, $password, 0, $vectorInicializacion);
        $salida = base64_encode($salida);
        return $salida;
    }

    function desencriptar($cadena){
        $password = hash('sha256', CODIGO_PASSWORD);
        $vectorInicializacion = substr(hash('sha256', CODIGO_VECTOR), 0, 16);
        $salida = openssl_decrypt(base64_decode($cadena), METODO, $password, 0, $vectorInicializacion);
        return $salida;
    }

    function EncryptRSA($codigo, $llave){
        $public_key = openssl_pkey_get_public($llave);
        openssl_public_encrypt(json_encode($codigo), $mensajeEncriptado, $public_key);
        $salida = base64_encode($mensajeEncriptado);
        return $salida;
    } 

    function DecryptRSA($codigo, $llave){
        $decode = base64_decode($codigo);
        $private_key = openssl_pkey_get_private($llave);
        $rs = openssl_private_decrypt($decode, $decrypted, $private_key);
        return $decrypted;
    } 

	if(!empty($_GET['r'])){
		$r = $_GET['r'];
		$descrip = DecryptRSA(desencriptar($r), desencriptar($_SESSION['tempPVK']));
		if($descrip==""){
			if(file_exists($urlsql.'/accesoTempDataBaseMyAdmin.txt')){
				$borrado = unlink($urlsql.'/accesoTempDataBaseMyAdmin.txt');  
			}
			echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
		}else{
			$string = str_replace('"', '', $descrip);
			$scan = scandir(__DIR__);
			// print_r($scan);
			$dirScan = "";
			foreach ($scan as $key) {
				if(is_dir($key)){
					if(strlen($key) > 2){
						$dirScan = $key;
					}
				}
			}
			// echo $dirScan;
			$rs = rename($dirScan, $r);
			if($rs=="1"){
				$urlsql = $r;
			}else{
				$urlsql = $dirScan;
			}
			// echo $dirScan;
			// echo $urlsql."<br><br>";
			if(file_exists($urlsql.'/accesoTempDataBaseMyAdmin.txt')){
				$borrado = unlink($urlsql.'/accesoTempDataBaseMyAdmin.txt');  
			}
			$archivo = fopen($urlsql.'/accesoTempDataBaseMyAdmin.txt','a');  
			fwrite($archivo, $urlsql);
			fclose($archivo);
			if($string=="phpmyadminAccessConcedido"){
				header("location:./".$urlsql);
			}
		}
		// echo "<br>";
		// echo "<br>";
		// echo "==========================";
		// echo "<br>";
		// echo $string;
		// echo "<br>";
		// echo "<br>";
		// echo $r;
	}else{
		extract($objRSA->createKey(380));
		$public_key = encriptar($publickey);
		$private_key = encriptar($privatekey);
		$_SESSION['tempPBK'] = $public_key;
		$_SESSION['tempPVK'] = $private_key;

		$string = 'phpmyadminAccessConcedido';
		$encripCode = EncryptRSA($string,desencriptar($public_key));
		//$decripCode = DecryptRSA($encripCode,desencriptar($private_key));
		$urlphpmyadmin = "./?r=".encriptar($encripCode); 


		if(file_exists('../accesoTemp1DataBaseMyAdmin.txt')){
			$borrado = unlink('../accesoTemp1DataBaseMyAdmin.txt');  
		}
		$archivo = fopen('../accesoTemp1DataBaseMyAdmin.txt','a');
		fwrite($archivo, encriptar($encripCode));
		fclose($archivo);


		$accessLink = false;

		if(!empty($_SESSION['borrarPOST']) && $_SESSION['borrarPOST']==true){
			unset($_POST);
			unset($_SESSION['borrarPOST']);
			header("location:./");
		}
		if(!empty($_POST)){
			if(($_POST['user']==$accesoTemporalActualUser) && $_POST['pass']==$accesoTemporalActualPass){
				$accessLink = true;
			}else{
				$accessLink = false;
				$accessLinkD = true;
			}
		}


	}


?>
<!DOCTYPE html>
<html>
<head>
	<title>Acceso a My Admin</title>
</head>
<body>
<?php if(!empty($_POST) && $accessLink==true){ ?>
	Acceder a <a href="<?=$urlphpmyadmin;?>" target="_blank" id='elemento' onclick="window.close();" title="My Admin">PHP My Admin</a>
	<?php $_SESSION['borrarPOST'] = true;
}else{
	if(!empty($_SESSION['accesoTemporalActualUser']) && !empty($_SESSION['accesoTemporalActualPass'])){
		if(!empty($accessLinkD)){ ?>
			<p>Acceso denegado.</p>
			<?php $_SESSION['borrarPOST'] = true;
		}else{ ?>
			<form action="" method="post">
				<label>User: </label>
				<br>
				<input type="password" name="user" autocomplete="off" required>
				<br>
				<br>
				<label>Password: </label>
				<br>
				<input type="password" name="pass" autocomplete="off" required>
				<br>
				<br>
				<button>Enviar</button>
			</form>
		<?php }
	}else{ ?>
	<p>Acceso denegado.</p>
	<?php }
} ?>
</body>
</html>