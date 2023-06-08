<?php 

	use content\modelo\notasModel as notasModel;
	
	class NotasTest extends \PHPUnit\Framework\TestCase{
		private $nota;

		
		public function setUp(): void
		{
			$this->nota = new notasModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->nota->validarConsultar("getOne", "2"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['id'] = 'S2SY2022T1S1N5';
			$datos['id_clase'] = '2';
			$datos['alumno'] = '5';
			$datos['nota'] = '0.5';
			$resulRegistrar = $this->nota->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id'] = 'S2SY2022T1S1N5';
			$datos['nota'] = '0.8';
			$resulRegistrar = $this->nota->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->nota->validarEliminar("Eliminar", "2"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>