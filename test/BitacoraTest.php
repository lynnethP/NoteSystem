<?php 

	use content\modelo\bitacoraModel as bitacoraModel;
	
	class BitacoraTest extends \PHPUnit\Framework\TestCase{
		private $bitacora;

		
		public function setUp(): void
		{
			$this->bitacora = new bitacoraModel();
			
		}

		public function testBuscar(){	
			$datos['last'] = "2023-03-03";
			$datos['actual'] = "2023-03-10";
			$resulRegistrar = $this->bitacora->validarConsultar($datos);		
			$this->assertEquals(true, $resulRegistrar[0]["id_bitacora"]);
		}


	}

?>