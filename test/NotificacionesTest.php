<?php 

	use content\modelo\notificacionesModel as notificacionesModel;
	
	class NotificacionesTest extends \PHPUnit\Framework\TestCase{
		private $notificacion;

		
		public function setUp(): void
		{
			$this->notificacion = new notificacionesModel();
			
		}

		public function testBuscar(){	
			$data['tabla_notificacion'] = 'notas';
			$data['elemento_tabla'] = 'codigo';
			$data['id_tabla'] = -1;
			$data['codigo_tabla'] = 'S1SY2022T1S1N1';
			$resulRegistrar = $this->notificacion->Buscar($data); 
			$resulRegistrar = is_array($resulRegistrar);	
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testBuscarClasesPorPeriodo(){	
			$data['id_periodo'] = '1';
			$resulRegistrar = $this->notificacion->BuscarClasesPorPeriodo($data); 
			$resulRegistrar = is_array($resulRegistrar);	
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testLimitesPeriodos(){
			$data['inicio'] = '2022-04-12';
			$data['final'] = '2022-08-17';
			$resulRegistrar = $this->notificacion->LimitesPeriodos($data, "cierre"); 	
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testAgregar(){	
			$dataNotificacion['tabla_notificacion']="clases";
			$dataNotificacion['elemento_tabla']="id";
			$dataNotificacion['id_tabla'] = '1';
			$dataNotificacion['codigo_tabla'] = "";
			$dataNotificacion['fecha_notificacion'] = date('Y-m-d');
			$dataNotificacion['hora_notificacion'] = date('h:i a');
			$dataNotificacion['visto_alumnos'] = 9;
			$dataNotificacion['visto_profesores'] = 0;
			$dataNotificacion['visto_admin'] = 0;
			$dataNotificacion['visto_superusuario'] = 0;
			$resulRegistrar = $this->notificacion->Agregar($dataNotificacion, "Agregar"); 
			$resulRegistrar = is_array($resulRegistrar);	
			$this->assertEquals(true, $resulRegistrar);
		}		
		

	}

?>