<?php 

	use content\modelo\perfilModel as perfilModel;
	
	class PerfilTest extends \PHPUnit\Framework\TestCase{
		private $perfil;

		
		public function setUp(): void
		{
			$this->perfil = new perfilModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->perfil->validarConsultar("Consultar", "18690684"); 	
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testAgregar(){	
			$destino = 'assets/img/perfil/07326555.jpeg';
			$resulRegistrar = $this->perfil->ValidarAgregarOModificar($destino, "Img", "07132428"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id'] = '07132428';
			$datos['cedula'] = '07132428';
			$datos['correo'] = 'ares_10@gmail.com';
			$resulRegistrar = $this->perfil->ValidarAgregarOModificar($datos, "ModificarCorreo"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

	}

?>