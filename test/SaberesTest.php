<?php 

	use content\modelo\saberesModel as saberesModel;
	
	class SaberesTest extends \PHPUnit\Framework\TestCase{
		private $saber;

		
		public function setUp(): void
		{
			$this->saber = new saberesModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->saber->validarConsultar("getOne", "Metodología"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['nombreSC'] = 'Programación';
			$datos['trayectoSC'] = '1';
			$datos['faseSC'] = '1';
			$resulRegistrar = $this->saber->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id_SC'] = '15';
			$datos['nombreSC'] = 'Análisis';
			$datos['trayectoSC'] = '1';
			$datos['faseSC'] = '2';
			$resulRegistrar = $this->saber->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->saber->validarEliminar("15"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>