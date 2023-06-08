<?php 

	use content\modelo\mantenimientoModel as mantenimientoModel;
	
	class MantenimientoTest extends \PHPUnit\Framework\TestCase{
		private $manteniment;

		
		public function setUp(): void
		{
			$this->manteniment = new mantenimientoModel();			
		}

		public function testRespaldar(){	
			$resulRegistrar = $this->manteniment->Respaldar(); 
			$resulRegistrar = is_array($resulRegistrar);
			$this->assertEquals(true, $resulRegistrar);
		}		

	}

?>




