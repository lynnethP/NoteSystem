<?php 

	use content\modelo\proyectosModel as proyectosModel;
	
	class ProyectosTest extends \PHPUnit\Framework\TestCase{
		private $proyecto;

		
		public function setUp(): void
		{
			$this->proyecto = new proyectosModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->proyecto->validarConsultar("getOne", "T1SY2023T1S1P1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		
		public function testAgregar(){	
			$datos['id'] = 'T3Y2024T3S1P1';
			$datos['nombre'] = 'PNF Administración';
			$datos['trayecto'] = '3';
			$datos['cedula_tutor'] = '03782342';
			$resulRegistrar = $this->proyecto->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregarGrupo(){	
			$datos['cod_grupo'] = "PT3Y2024T3S1P1G1";
			$datos['cod_proyecto'] = 'T3Y2024T3S1P1';
			$datos['id_SA'] = ['05787285', '12023810', '12278410'];
			foreach ($datos['id_SA'] as $alumnos) {
				$datos['id_SA'] = $alumnos;
				$resulRegistrar = $this->proyecto->ValidarAgregarOModificar($datos, "AgregarGrupo"); 
			}	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}			

		public function testModificar(){
			$datos['id'] = 'T3Y2024T3S1P1';
			$datos['nombre'] = 'PNF Contaduría';
			$datos['trayecto'] = '3';
			$datos['cedula_tutor'] = '03756922';
			$resulRegistrar = $this->proyecto->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->proyecto->validarEliminar("Eliminar", "T3Y2024T3S1P1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminarAlumnos(){	
			$resulRegistrar = $this->proyecto->validarEliminar("EliminarGrupos", "T3Y2024T3S1P1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}
		

	}

?>