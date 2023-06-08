<?php 

	use content\modelo\loginModel as loginModel;
	use content\traits\Utility;
	
	class RecuperarTest extends \PHPUnit\Framework\TestCase{
		use Utility;
		private $login;

		
		public function setUp(): void
		{
			$this->login = new loginModel();			
		}
		
		public function testRecuperar(){	
			$resulRegistrar = $this->login->recuperarPass('18690684', $this->encriptarContrasena('sAdmin123.')); 
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testCorreo(){	
			$resulRegistrar = $this->login->busquedaCorreo('joan_18@gmail.com'); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
	}

?>