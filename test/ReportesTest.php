<?php 

	use content\modelo\reportesModel as reportesModel;
	use content\modelo\clasesModel as clasesModel;
	use content\modelo\notasModel as notasModel;
	use content\modelo\seccionesModel as seccionesModel;

	class ReportesTest extends \PHPUnit\Framework\TestCase{
		private $reportes;
		private $clase;		
		private $nota;
		private $seccion;

		public function setUp(): void
		{
			$this->reportes = new reportesModel();
			$this->clase = new clasesModel();
			$this->nota = new notasModel();
			$this->seccion = new seccionesModel();			
		}

		public function testBuscarClase(){	
			$resulRegistrar = $this->clase->validarConsultar("ConsultarSeccionClase");
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testBuscarNota(){	
			$resulRegistrar = $this->nota->validarConsultar("getOne", '1');	
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testBuscarSeccion(){	
			$resulRegistrar = $this->seccion->validarConsultar("getOne", 'Y2022T1S1');
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}


		public function testAprobacion(){	
			$resulRegistrar = $this->reportes->Aprobacion('07359667', '1');	
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testUsuarios(){	
			$resulRegistrar = $this->reportes->Usuarios();
			$resulRegistrar = is_array($resulRegistrar); 	
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testNotas(){	
			$resulRegistrar = $this->reportes->Notas('Y2022T1S1', '1');
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}
		

	}

?>