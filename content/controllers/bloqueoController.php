<?php

namespace content\controllers;

use config\settings\sysConfig as sysConfig;
use content\component\headElement as headElement;
use content\modelo\homeModel as homeModel;
use content\modelo\bloqueoModel as bloqueoModel;
use content\modelo\preguntasModel as preguntasModel;
use content\modelo\bitacoraModel as bitacoraModel;
use content\modelo\notificacionesModel as notificacionesModel;
use content\modelo\rolesModel as rolesModel;
use content\traits\Utility;

class bloqueoController
{
    use Utility;
    private $url;
    private $bloqueosU;
    private $notificacion;
    private $bitacora;
    private $rol;
    private $preg;

    function __construct($url)
    {
        $this->url = $url;
        $this->notificacion = new notificacionesModel();
        $this->bitacora = new bitacoraModel();
        $this->bloqueosU = new bloqueoModel();
        $this->preg = new preguntasModel();

        $this->rol = new rolesModel();
        $rolAc = [ 'id_rol' => $_SESSION['cuenta_usuario']['id_rol'], 'nombre_modulo' => "Usuario Bloqueado"];
        $this->accesos = $this->rol->validarConsultar("ConsultarAccesosModulo", $rolAc);
    }

    public function Consultar()
    {
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

            $bloqueos = $this->bloqueosU->Consultar();
            $url = $this->url;
            require_once("view/bloqueoView.php");
        }else{
            require_once("errorController.php");
        }
    }

    public function Buscar()
    {
        if ($_POST) {
            if (!empty(trim(isset($_POST['Buscar']))) && !empty(trim(isset($_POST['firma'])))) {
                $datos['firma'] = $_POST['firma'];
                $buscar = $this->bloqueosU->validarData($datos,"FirmaD");
                // $buscar = $this->bloqueosU->FirmaD($_POST['firma']);
                $resp = array('datos' =>  $buscar);
                echo json_encode($resp);
            }
        }
    }

    public function VerificarCodigo()
    {
        if ($_POST) {
            if (!empty(trim(isset($_POST['Verificar']))) && !empty(trim(isset($_POST['usuarioD'])))) {
                $datos['cedula'] = $_POST['usuarioD'];
                $verificar = $this->bloqueosU->validarData($datos,"BuscarCodigo");
                // $verificar = $this->bloqueosU->BuscarCodigo($_POST['usuarioD']);
                $resp = array('datos' =>  $verificar);
                echo json_encode($resp);
            }
        }
    }
    public function VerificarClave()
    {
        if ($_POST) {
            if (!empty(trim(isset($_POST['Verificar']))) && !empty(trim(isset($_POST['cedula'])))){
                $datos['cedula'] = $_POST['cedula'];
                $verificar = $this->bloqueosU->validarData($datos,"BuscarLlaves");
                // $verificar = $this->bloqueosU->BuscarLlaves($_POST['cedula']);
                $resp = array('date' =>  $verificar);
                echo json_encode($resp);
            }
        }
    }

    public function Generar()
    {
        if ($_POST) {
            if (!empty(trim(isset($_POST['Generar']))) && !empty(trim(isset($_POST['public']))) && !empty(trim(isset($_POST['usuarioG'])))) {
                $codigo = $this->codigoAleatorio('A', 6, 0);
                $encrypt = $this->bloqueosU->Encrypt($codigo, $this->desencriptar($_POST['public']));
                $datos['codigo'] = $encrypt;
                $datos['cedula'] = $_POST['usuarioG'];
                $codigoDesbloqueo = $this->bloqueosU->validarData($datos, "CodigoDesbloqueo");
                // $codigoDesbloqueo = $this->bloqueosU->CodigoDesbloqueo($encrypt, $_POST['usuarioG']);
                $resp = array('encrypt' =>  $encrypt, 'result' => $codigoDesbloqueo);
                echo json_encode($resp);
            }
        }
    }

    public function Desbloquear()
    {
        if ($_POST) {
            if (!empty(trim(isset($_POST['Desbloquear']))) && !empty(trim(isset($_POST['codigo']))) && !empty(trim(isset($_POST['private']))) && !empty(trim(isset($_POST['firma']))) && !empty(trim(isset($_POST['cedula'])))) {
                $desencrypt = $this->desencriptar($_POST['private']);
                // var_dump($desencrypt); ##
                $ci = $_POST['cedula'];
                $datos['cedula'] = $ci;
                // $busqueda = $this->bloqueosU->BuscarCodigo($ci);
                $busqueda = $this->bloqueosU->validarData($datos, "BuscarCodigo");
                // var_dump($busqueda); ##

                $decrypt = $this->bloqueosU->Decrypt($_POST['codigo'], $desencrypt);
                // var_dump($decrypt);
                var_dump($_POST['codigo']);
                var_dump($busqueda[0]['codigo_desbloqueo']);
                $code = $this->bloqueosU->Decrypt($busqueda[0]['codigo_desbloqueo'], $desencrypt);
                // var_dump($code);
                if ($decrypt != "" && $code != "" && $decrypt != NULL && $code != NULL && $decrypt === $code) {
                    $datos['intentos'] = 0;
                    $datos['pass'] = $this->encriptarContrasena($_POST['cedula']);

                    // $unlook = $this->bloqueosU->Unlook($_POST['cedula'], 0, $this->encriptarContrasena($_POST['cedula']));
                    $unlook = $this->bloqueosU->validarData($datos,"Unlook");

                    $preguntas = $this->preg->ValidarEliminar($_POST['cedula']);

                    // $rsa = $this->bloqueosU->EliminarSeguridad($_POST['cedula']);
                    $rsa = $this->bloqueosU->validarData($datos,"EliminarSeguridad");
                }
                $this->bitacora->monitorear($this->url);
                $resp = array('decrypt' =>  $decrypt, 'code' => $code, 'look' => $unlook, 'preg' => $preguntas, 'rsa' => $rsa);
                echo json_encode($resp);
            }
        }
    }
}
