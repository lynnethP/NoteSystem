<?php 

	use content\modelo\permisosModel as permisosModel;
	
	class PermisosTest extends \PHPUnit\Framework\TestCase{
		private $permiso;

		
		public function setUp(): void
		{
			$this->permiso = new permisosModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->permiso->validarConsultar("getOne", "1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['nombre'] = 'Busqueda';
			$resulRegistrar = $this->permiso->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id'] = '5';
			$datos['nombre'] = 'Buscar';
			$resulRegistrar = $this->permiso->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->permiso->validarEliminar("5"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>