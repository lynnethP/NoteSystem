<?php

namespace content\modelo;

use content\config\conection\database as database;
use PDOException;
use content\traits\Utility;

class perfilModel extends database
{


	private $nombre;
	private $user;
	private $passw;
	private $pass;
	private $password;
	use Utility;

	public function __construct() {
		// $this->con = parent::__construct();
		parent::__construct();
	}
	public function validarConsultar($metodo, $data="", $data2=""){
		if($metodo=="Consultar"){
			$result = self::Consultar($data);
			return $result;
		}
		if($metodo=="ConsultaImagen"){
			$result = self::ConsultaImagen($data);
			return $result;
		}
		if($metodo=="ConsultarProfesor"){
			$result = self::ConsultarProfesor($data);
			return $result;
		}
		if($metodo=="ConsultarAlumno"){
			$result = self::ConsultarAlumno($data);
			return $result;
		}
		if($metodo=="ConsultarUsuario"){
			$result = self::ConsultarUsuario($data);
			return $result;
		}
		if($metodo=="ValidarContraseña"){
			$result = self::ConsultarUsuario($data, $data2);
			return $result;
		}
	}
	public function ValidarAgregarOModificar($datos, $metodo, $dato2=""){
		$res = [];
		$return = 0;
		if($metodo == "ModificarCorreo"){
			foreach ($datos as $campo => $valor) {
				$resExp = self::Validate($campo, $valor);
				$return += $resExp;
			}
		}
		if($return==0){
			if($metodo=="ModificarCorreo" || $metodo=="modificarcorreo"){
				$result = self::ModificarCorreo($datos);
			}
			if($metodo=="Img" || $metodo=="img"){
				$result = self::Img($datos, $dato2);
			}
			return $result;
		}else{
			return ['msj'=>"Invalido"];
		}
	}

	private function Validate($campo, $valor){
		$pattern = [
			'0' => ['campo'=>"cedula",'expresion'=>'/[^0-9]/'],
			'1' => ['campo'=>"correo",'expresion'=>'/^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{4,6}))$/'],
			'2' => ['campo'=>"id",'expresion'=>'/[^0-9]/'],
		];
		// $resExp = 0;
		foreach ($pattern as $exReg) {
			if($exReg['campo']==$campo){
				$resExp = preg_match_all($exReg['expresion'], $valor);
				// echo "Campo: ".$campo." | Valor: ".$valor." | ";
				// echo "ResExp: ".$resExp." | ";
				// echo "\n\n";
				return $resExp;
			}
		}
	}

	private function Consultar($cedula){
		try {
			if($cedula!=""){
				$query = parent::prepare("SELECT * FROM rsa WHERE estatus = 1 and cedula_usuario = :cedula");
				$query->bindValue(":cedula",$cedula);
			}else{
				$query = parent::prepare("SELECT * FROM modulos WHERE estatus = 1");
			}
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

	private function ConsultaImagen($cedula){

		try {
			$query = parent::prepare("SELECT * FROM usuarios WHERE estatus = 1 && cedula_usuario = :cedula");
			$query->bindValue(":cedula",$cedula);
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

	private function ConsultarProfesor($cedula){

		try {
			$query = parent::prepare("SELECT * FROM profesores WHERE estatus = 1 && cedula_profesor = :cedula");
			$query->bindValue(":cedula",$cedula);
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

	private function ConsultarAlumno($cedula){

		try {
			$query = parent::prepare("SELECT * FROM alumnos WHERE estatus = 1 && cedula_alumno = :cedula");
			$query->bindValue(":cedula",$cedula);
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

	private function ConsultarUsuario($cedula){

		try {
			$query = parent::prepare("SELECT * FROM usuarios WHERE estatus = 1 && cedula_usuario = :cedula");
			$query->bindValue(":cedula",$cedula);
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

	private function ValidarContraseña($user, $passw){		//Se hace una consulta de los usuarios recibidos
		$this->user = $user;
		$this->passw = $passw;
		$sql = ('SELECT * FROM roles, usuarios WHERE usuarios.id_rol = roles.id_rol AND usuarios.nombre_usuario = :user AND usuarios.password_usuario = :password');
		$new = parent::prepare($sql);
		$new->bindValue(':user', $this->user);
		$new->bindValue(':password', $this->passw);
		$new->execute();
		$user = $new->fetchAll();


		foreach ($user as $currentUser) {
			$usuario = $currentUser['nombre_usuario'];
			$cont = $currentUser['password_usuario'];
			// var_dump($usuario);
			// var_dump($cont);
		}
		if ($this->user == $usuario and $this->passw == $cont) {
			$Result = array('msj' => "Good");		//Si todo esta correcto y consigue al usuario
			$Result['data'] = $user;
			return $Result;
		} else {
			$Result = array('msj' => "Usuario o contraseña invalido!");
			return $Result;
		}
	}
	
	private function ModificarCorreo($datos){
			try {
			$query = parent::prepare('UPDATE usuarios SET cedula_usuario=:cedula_usuario, correo=:correo WHERE cedula_usuario = :codigo_usuario');
			$query->bindValue(':codigo_usuario', $datos['id']);
			$query->bindValue(':cedula_usuario', $datos['cedula']);
			$query->bindValue(':correo', $datos['correo']);
			$query->execute();
			$respuestaArreglo = $query->fetchAll();
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

	private function Img($img, $cedula){
		try {
			$query = parent::prepare("UPDATE usuarios SET imagen=:imagen WHERE cedula_usuario = :cedula_usuario");
			$query->bindValue(':cedula_usuario', $cedula);
			$query->bindValue(':imagen', $img);
			$query->execute();
			$respuestaArreglo = $query->fetchAll();
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

}
