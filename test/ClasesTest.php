<?php 

	use content\modelo\clasesModel as clasesModel;
	
	class ClasesTest extends \PHPUnit\Framework\TestCase{
		private $clase;

		
		public function setUp(): void
		{
			$this->clase = new clasesModel();
			
		}

		public function testBuscar(){	
			$datos['saber'] = '1';
			$datos['seccion'] = 'Y2022T1S1';
			$resulRegistrar = $this->clase->validarConsultar("getOne", $datos); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['seccion'] = 'Y2024T3S1';			
			$datos['periodo'] = '5';
			$datos['saber'] = '9';
			$datos['profesor'] = '03633921';
			$resulRegistrar = $this->clase->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id_clase'] = '5';
			$datos['periodo'] = '5';
			$datos['seccion'] = 'Y2024T3S1';
			$datos['saber'] = '10';
			$datos['profesor'] = '01566370';
			$resulRegistrar = $this->clase->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->clase->validarEliminar("Eliminar", "5"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>