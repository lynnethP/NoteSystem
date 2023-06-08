<?php 

	use content\modelo\loginModel as loginModel;
	use content\traits\Utility;
	
	class LoginTest extends \PHPUnit\Framework\TestCase{
		use Utility;
		private $login;
		
		public function setUp(): void
		{
			$this->login = new loginModel();			
		}
		
		public function testLogin(){	
			$resulRegistrar = $this->login->loginSistema('Joan18', 'sAdmin123.');
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testBusqueda(){	
			$resulRegistrar = $this->login->busquedaCedula('Joan18'); 	
			$this->assertEquals(true, $resulRegistrar[0]['cedula_usuario']);
		}

		public function testConsultar(){	
			$resulRegistrar = $this->login->Consultar('18690684');
			$this->assertEquals(true, $resulRegistrar[0]['respuestas']);
		}

	}

?>