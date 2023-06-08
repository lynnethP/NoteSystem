<?php 

	use content\modelo\alumnosModel as alumnosModel;
	
	class AlumnosTest extends \PHPUnit\Framework\TestCase{
		private $alumno;
		
		public function setUp(): void
		{
			$this->alumno = new alumnosModel();
		}

		public function testBuscar(){	
			$resulRegistrar = $this->alumno->validarConsultar("getOne", "05787285"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['cedula'] = '18262345';
			$datos['nombre'] = 'Julián';
			$datos['apellido'] = 'Torres';
			$datos['trayecto'] = '1';
			$resulRegistrar = $this->alumno->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){	
			$datos['id'] = '18262345';
			$datos['cedula'] = '18262346';
			$datos['nombre'] = 'Lynneth';
			$datos['apellido'] = 'Pereira';
			$datos['trayecto'] = '1';
			$resulRegistrar = $this->alumno->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->alumno->validarEliminar("18262346"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>