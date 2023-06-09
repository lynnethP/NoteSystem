<?php

namespace content\config\conection;

use config\settings\sysConfig as sysConfig;
use PDO as pdo;
use PDOException;

class database extends PDO
{

    private $error_conexion;
    private $servidor = 'mysql';
    private $host = 'localhost';
    private $user_mysql = 'pnfh';
    private $db = 'higiene';
    private $password_mysql = 'pnf.higiene';

    public function __construct()
    {
   
        $DNS = "{$this->servidor}:host={$this->host};dbname={$this->db};";

        $opciones = array(
            // PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            parent::ATTR_ERRMODE            => parent::ERRMODE_EXCEPTION,
            #Reporte de errores (Lanza exceptions)
            // PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            parent::ATTR_DEFAULT_FETCH_MODE => parent::FETCH_ASSOC,
            #Establece el modo de recuperación predeterminado
            // PDO::ATTR_PERSISTENT         => true,
            parent::ATTR_PERSISTENT         => true,
            #utiliza conexiones persistentes
            // PDO::ATTR_EMULATE_PREPARES   => false,
            parent::ATTR_EMULATE_PREPARES   => false,
            #Habilita o deshabilita la emulación de declaraciones preparadas.
            // PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\'',
            parent::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES  \'UTF8\'',
            #Comando a ejecutar cuando se conecta al servidor MySQL
        );

        try
        {
            // $conexion = new PDO($DNS, $this->user_mysql, $this->password_mysql, $opciones);
            $conexion = parent::__construct($DNS, $this->user_mysql, $this->password_mysql, $opciones);
            // echo "Conectado XD /// ";
            return $conexion;

        } catch (PDOException $e) 
        {
            $this->error_conexion = 'Ha surgido un error y no se puede conectar a la base de datos. Detalle: ' . $e->getMessage();
            return $this->error_conexion;
        }
    }

}
