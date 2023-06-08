<?php 

	use content\modelo\usuariosModel as usuariosModel;
	use content\traits\Utility;
	
	class UsuariosTest extends \PHPUnit\Framework\TestCase{
		use Utility;
		private $usuario;

		
		public function setUp(): void
		{
			$this->usuario = new usuariosModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->usuario->validarConsultar("getOne", "07132428"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['cedula'] = '27828165';
			$datos['nombre'] = 'Nath12';
			$datos['correo'] = 'lynnethpereira@gmail.com';
			$datos['pass'] = $this->encriptarContrasena('Nath.12');
			$datos['rol'] = '3';
			$resulRegistrar = $this->usuario->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id'] = '27828165';
			$datos['cedula'] = '27828164';
			$datos['nombre'] = 'Naty12';
			$datos['correo'] = 'lynnethpereira12@gmail.com';
			$datos['nuevoPassword'] = $this->encriptarContrasena('Naty.12');
			$datos['rol'] = '3';
			$datos['estatus'] = 1;
			$resulRegistrar = $this->usuario->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->usuario->validarEliminar("Eliminar", "27828164"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>