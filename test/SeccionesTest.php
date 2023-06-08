<?php 

	use content\modelo\seccionesModel as seccionesModel;
	
	class SeccionesTest extends \PHPUnit\Framework\TestCase{
		private $seccion;

		
		public function setUp(): void
		{
			$this->seccion = new seccionesModel();
			
		}

		public function testBuscar(){	
			$resulRegistrar = $this->seccion->validarConsultar("getOne", "Y2022T1S1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregar(){	
			$datos['cod_seccion'] = 'Y2023T2S1';
			$datos['seccion'] = 'HS2101';
			$datos['trayecto'] = '2';
			$datos['year'] = '2023';
			$resulRegistrar = $this->seccion->ValidarAgregarOModificar($datos, "Agregar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testAgregarAlumnos(){	
			$data['cod_seccion'] = 'Y2023T2S1';
			$datos['alumnos'] = ['11862547', '12567542', '15432854'];
			foreach ($datos['alumnos'] as $alumnos) {
				$data['cedula_alumno'] = $alumnos;
					$resulRegistrar = $this->seccion->ValidarAgregarOModificar($data, "AgregarSecAlumno"); 
			}
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testModificar(){
			$datos['cod_seccion'] = 'Y2023T2S1';
			$datos['seccion'] = 'HS2112';
			$datos['trayecto'] = '2';
			$datos['year'] = '2023';
			$resulRegistrar = $this->seccion->ValidarAgregarOModificar($datos, "Modificar"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminar(){	
			$resulRegistrar = $this->seccion->validarEliminar("Eliminar", "Y2023T2S1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testEliminarAlumnos(){	
			$resulRegistrar = $this->seccion->validarEliminar("EliminarSeccionAlumno", "Y2023T2S1"); 	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}		

	}
?>