<?php 

	use content\modelo\profesoresModel as profesoresModel;
	
	class ProfesoresTest extends \PHPUnit\Framework\TestCase{
		private $profesor;
		
		public function setUp(): void
		{
			$this->profesor = new profesoresModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->profesor->validarConsultar("getOne", "01566370"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['cedula'] = '09559044';
			$datos['nombre'] = 'Usbaldo';
			$datos['apellido'] = 'Pereira';
			$datos['telefono'] = '04169790187';
			$resulRegistrar = $this->profesor->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){	
			$datos['id'] = '09559044';
			$datos['cedula'] = '09559045';
			$datos['nombre'] = 'Rafael';
			$datos['apellido'] = 'Pereira';
			$datos['telefono'] = '04169790185';
			$resulRegistrar = $this->profesor->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->profesor->validarEliminar("09559045"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}		

	}
?>