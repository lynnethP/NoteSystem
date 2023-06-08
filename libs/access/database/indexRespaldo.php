<?php

	date_default_timezone_set('America/Caracas');
	ini_set('date.timezone', 'america/caracas');

	if(file_exists("../../../content/config/settings/sysConfig.php")){
		require_once("../../../vendor/autoload.php");
		require_once("../../../content/config/settings/sysConfig.php"); /* Indexar mediante require_once el autoload.php de composer */
	}
	session_start();

	use config\settings\sysConfig as sysConfig; /* El as nos ayuda a renombrar el directorio sysConfig*/
	$globalConfig = new sysConfig(); /* instanciamos la clase sysConfig */
	use phpseclib\Crypt\RSA; 
	$objRSA = new RSA();


	const METODO ='AES-256-CBC';
	const CODIGO_PASSWORD ='WORLD*';
	const CODIGO_VECTOR ='1997';
	function encriptar($cadena)
    {
        $salida = FALSE;
        $password = hash('sha256', CODIGO_PASSWORD); //Genera Valor Cifrado en base a un string
        $vectorInicializacion = substr(hash('sha256', CODIGO_VECTOR), 0, 16);
        $salida = openssl_encrypt($cadena, METODO, $password, 0, $vectorInicializacion);
        $salida = base64_encode($salida);
        return $salida;
    }

    function desencriptar($cadena)
    {
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

    // echo "<br><br>";
    // echo $_SESSION['tempPBK'];
    // echo "<br><br>";

    // echo $_SESSION['tempPVK'];
    // echo "<br><br>";


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
			$rs = rename($scan[2], $r);
			if($rs=="1"){
				$urlsql = $r;
			}else{
				$urlsql = $scan[2];
			}
			echo $scan[2];
			echo $urlsql."<br><br>";
			// if(file_exists($urlsql.'/accesoTempDataBaseMyAdmin.txt')){
			// 	$borrado = unlink($urlsql.'/accesoTempDataBaseMyAdmin.txt');  
			// }
			// $archivo = fopen($urlsql.'/accesoTempDataBaseMyAdmin.txt','a');  
			// fwrite($archivo, $urlsql);
			// fclose($archivo);
			// if($string=="phpmyadminAccessConcedido"){
			// 	header("location:./".$urlsql);
			// }
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
	}



?>
<!DOCTYPE html>
<html>
<head>
	<title>Acceso a My Admin</title>
</head>
<body>

Acceder a <a href="<?=$urlphpmyadmin;?>" target="_blank" id='elemento' onclick="window.close();" title="My Admin">PHP My Admin</a>

</body>
</html>