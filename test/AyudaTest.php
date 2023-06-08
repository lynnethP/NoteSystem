<?php 

	class AyudaTest extends \PHPUnit\Framework\TestCase{
	
		public function testAyuda(){
			$help = file_get_contents('http://localhost/PNFH/guide/manual-de-usuario.pdf');
			$result = is_string($help);
			$this->assertEquals(true,$result);
		}			

	}

?>
