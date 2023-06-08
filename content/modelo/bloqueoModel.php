<?php

namespace content\modelo;

use mysqli as mysqli;
use content\config\conection\database as database;
use PDOException;

class bloqueoModel extends database{

    private $fecha;
    private $mysqlImportFilename;
    private $mysqlRestoreFilename;

    public function __construct(){
        parent::__construct();
    }
    public function validarData($datos, $metodo)
    {
        $res = [];
        $return = 0;
        foreach ($datos as $campo => $valor) {
            $resExp = self::Validate($campo, $valor);
            $return += $resExp;
        }
        if ($return == 0) {
            if ($metodo == "FirmaD") {
                $result = self::FirmaD($datos['firma']);
            }
            if ($metodo == "BuscarCodigo") {
                $result = self::BuscarCodigo($datos['cedula']);
            }
            if ($metodo == "BuscarLlaves") {
                $result = self::BuscarLlaves($datos['cedula']);
            }
            if ($metodo == "CodigoDesbloqueo") {
                $result = self::CodigoDesbloqueo($datos['codigo'], $datos['cedula']);
            }
            if ($metodo == "Unlook") {
                $result = self::Unlook($datos['cedula'], $datos['intentos'], $datos['pass']);
            }
            if ($metodo == "EliminarSeguridad") {
                $result = self::EliminarSeguridad($datos['cedula']);
            }
            // if ($metodo == "Modificar" || $metodo == "modificar") {
            //     $result = self::Modificar($datos);
            // }
            return $result;
        } else {
            return ['msj' => "Invalido"];
        }
    }
    private function Validate($campo, $valor)
    {
        $pattern = [
            '0' => ['campo' => "cedula", 'expresion' => '/[^0-9]/'],
            '1' => ['campo' => "firma", 'expresion' => '/[^0-9a-zA-Z]/'],
            // '1' => ['campo' => "nombre", 'expresion' => '/[^a-zA-Z ñ Ñ Á á É é Í í Ó ó Ú ú ]/'],
            // '2' => ['campo' => "apellido", 'expresion' => '/[^a-zA-Z ñ Ñ Á á É é Í í Ó ó Ú ú ]/'],
            // '3' => ['campo'=>"telefono",'expresion'=>'/[^0-9]/'],
            // '4' => ['campo' => "trayecto", 'expresion' => '/[^0-9]/'],
            // '5' => ['campo' => "id", 'expresion' => '/[^0-9]/'],
        ];
        // $resExp = 0;
        foreach ($pattern as $exReg) {
            if ($exReg['campo'] == $campo) {
                $resExp = preg_match_all($exReg['expresion'], $valor);
                // echo "Campo: ".$campo." | Valor: ".$valor." | ";
                // echo "ResExp: ".$resExp." | ";
                // echo "\n\n";
                return $resExp;
            }
        }
    }

    public function Consultar(){
        try {
            $query = parent::prepare('SELECT * FROM usuarios, roles WHERE usuarios.estatus = 3 and usuarios.id_rol = roles.id_rol');
            $respuestaArreglo = '';
            $query->execute();
            $query->setFetchMode(parent::FETCH_ASSOC);
            $respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC); 
            return $respuestaArreglo;
        } catch (PDOException $e) {
            $errorReturn = ['estatus' => false];
            $errorReturn += ['info' => "error sql:{$e}"];
            return $errorReturn;
        }
    }

    private function FirmaD($firma){			
        try{
            $query = parent::prepare("SELECT * FROM rsa, profesores, usuarios, roles WHERE firma_digital = :firma and rsa.cedula_usuario = profesores.cedula_profesor and rsa.cedula_usuario = usuarios.cedula_usuario and usuarios.id_rol = roles.id_rol");
            $query->bindValue(":firma",$firma);
            $query->execute();  
            $respuestaArreglo = $query->fetchAll();
            return $respuestaArreglo;
        } catch (PDOException $e) {
            $errorReturn = ['estatus' => false];
            $errorReturn += ['info' => "error sql:{$e}"];
            return $errorReturn;
        }
    }
        
    private function BuscarCodigo($cedula){
        try{
            // $sql = "SELECT * FROM rsa, usuarios WHERE firma_digital = '{$firma}'  and rsa.cedula_usuario = usuarios.cedula_usuario";
            $query = parent::prepare("SELECT * FROM usuarios WHERE cedula_usuario = :cedula");
            $query->bindValue(":cedula",$cedula);
            $query->execute();  
            $respuestaArreglo = $query->fetchAll();
            return $respuestaArreglo;
        } catch (PDOException $e) {
            $errorReturn = ['estatus' => false];
            $errorReturn += ['info' => "error sql:{$e}"];
            return $errorReturn;
        }
    }

    private function BuscarLlaves($cedula){
        try{
            // $sql = "SELECT * FROM rsa, usuarios WHERE firma_digital = '{$firma}'  and rsa.cedula_usuario = usuarios.cedula_usuario";
            $query = parent::prepare("SELECT * FROM rsa WHERE cedula_usuario = :cedula");
            $query->bindValue(":cedula",$cedula);
            $query->execute();  
            $respuestaArreglo = $query->fetchAll();
            return $respuestaArreglo;
        } catch (PDOException $e) {
            $errorReturn = ['estatus' => false];
            $errorReturn += ['info' => "error sql:{$e}"];
            return $errorReturn;
        }
    }

    public function Encrypt($codigo, $llave){
        $public_key = openssl_pkey_get_public($llave);
        openssl_public_encrypt(json_encode($codigo), $mensajeEncriptado, $public_key);
        $salida = base64_encode($mensajeEncriptado);
        return $salida;
    } 

    public function Decrypt($codigo, $llave){
        // var_dump($codigo);
        // var_dump($llave);
        $decode = base64_decode($codigo);
        // var_dump($decode);
        $private_key = openssl_pkey_get_private($llave);
        // var_dump($private_key);
        $rs = openssl_private_decrypt($decode, $decrypted, $private_key);
        // var_dump($rs);
        // var_dump($decrypted);
        return $decrypted;
    } 

    private function CodigoDesbloqueo($codigo, $cedula){

        try{
        $query = parent::prepare("UPDATE usuarios SET codigo_desbloqueo = :codigo_desbloqueo WHERE cedula_usuario = :cedula");
        $query->bindValue(':codigo_desbloqueo', $codigo);
        $query->bindValue(':cedula', $cedula);
        $query->execute();
        $respuestaArreglo = $query->fetchAll();
        if ($respuestaArreglo += ['estatus' => true]) {
            $Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
            return $Result;
        }
      } catch(PDOException $e){

        $errorReturn = ['estatus' => false];
              $errorReturn['msj'] = "Error";
            $errorReturn += ['info' => "Error sql:{$e}"];
            return $errorReturn; 
      }
    }

    private function Unlook($user, $int, $newPass){
		try {
			$query = parent::prepare("UPDATE usuarios SET intentos=:intentos, estatus=2, codigo_desbloqueo='', password_usuario=:newPass WHERE cedula_usuario = :cedula_usuario");
            $query->bindValue(':intentos', $int);
            $query->bindValue(':newPass', $newPass);
			$query->bindValue(':cedula_usuario', $user);
			$query->execute();
			$respuestaArreglo = $query->fetchAll();
            // return $respuestaArreglo;
			if ($respuestaArreglo += ['estatus' => true]) {
				$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
				return $Result;
			}
		} catch (PDOException $e) {

			$errorReturn = ['estatus' => false];
			$errorReturn['msj'] = "Error";
			$errorReturn += ['info' => "Error sql:{$e}"];
			return $errorReturn;
		}
	}

    private function EliminarSeguridad($cedula){
        try {
            // $query = parent::prepare('UPDATE respuestas SET estatus = 0 WHERE cedula_usuario = :cedula_usuario');
            $query = parent::prepare("DELETE FROM rsa WHERE cedula_usuario = :cedula_usuario");
            $query->execute(['cedula_usuario'=>$cedula]);
            $query->setFetchMode(parent::FETCH_ASSOC);
            $respuestaArreglo = $query->fetchAll(parent::FETCH_ASSOC);
            if ($respuestaArreglo += ['estatus' => true]) {
                $Result = array('msj' => "Good");       //Si todo esta correcto y consigue al usuario
                return $Result;
            }
        } catch (PDOException $e) {
            $errorReturn = ['estatus' => false];
            $errorReturn['msj'] = "Error";
            $errorReturn += ['info' => "Error sql:{$e}"];
            return $errorReturn; ;
        }
    }
    
}
