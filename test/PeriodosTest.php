<?php 

	use content\modelo\periodosModel as periodosModel;
	
	class PeriodosTest extends \PHPUnit\Framework\TestCase{
		private $periodo;

		
		public function setUp(): void
		{
			$this->periodo = new periodosModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->periodo->validarConsultar("getOneId", "1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['numeroPr'] = 'I';
			$datos['yearPeriodo'] = '2026';
			$datos['fechaAP'] = '2026-04-12';
			$datos['fechaAC'] = '2026-10-12';
			$resulRegistrar = $this->periodo->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['id_periodo'] = '5';
			$datos['numeroPr'] = 'II';
			$datos['yearPeriodo'] = '2025';
			$datos['fechaAP'] = '2025-04-12';
			$datos['fechaAC'] = '2025-10-12';
			$resulRegistrar = $this->periodo->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->periodo->validarEliminar("5"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>