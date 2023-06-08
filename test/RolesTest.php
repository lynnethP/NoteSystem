<?php 

	use content\modelo\rolesModel as rolesModel;
	
	class RolesTest extends \PHPUnit\Framework\TestCase{
		private $rol;

		
		public function setUp(): void
		{
			$this->rol = new rolesModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->rol->validarConsultar("getOneId", "1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['nombre'] = 'Tutoreado';
			$resulRegistrar = $this->rol->ValidarAgregarOModificar($datos, "Agregar"); 
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregarAccesos(){
			$datos['id_rol'] = '1';
			$datos['id_modulo'] = '1';
			$datos['id_permiso'] = '1';
			$resulRegistrar = $this->rol->ValidarAgregarOModificar($datos, "AgregarAccesos"); 
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id_rol'] = '5';
			$datos['nombre'] = 'Tutor';
			$resulRegistrar = $this->rol->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$data['id_rol'] = "5";
			$resulRegistrar = $this->rol->validarEliminar("Eliminar", $data); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>