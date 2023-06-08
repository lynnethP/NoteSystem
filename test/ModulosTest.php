<?php 

	use content\modelo\modulosModel as modulosModel;
	
	class ModulosTest extends \PHPUnit\Framework\TestCase{
		private $modulo;

		
		public function setUp(): void
		{
			$this->modulo = new modulosModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->modulo->validarConsultar("getOne", "1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['nombre'] = 'Estadísticos';
			$resulRegistrar = $this->modulo->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id'] = '17';
			$datos['nombre'] = 'Perfil';
			$resulRegistrar = $this->modulo->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->modulo->validarEliminar("17"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>