<?php 

	use content\modelo\bloqueoModel as bloqueoModel;
	use content\traits\Utility;
	
	class BloqueoTest extends \PHPUnit\Framework\TestCase{
		use Utility;
		private $bloqueosU;
		public $codigoEncrypt;

		
		public function setUp(): void
		{
			$this->bloqueosU = new bloqueoModel();
			
		}

		public function testBuscar(){				
			$datos['firma'] = "TlRpYks5WXppbFRlTys1cnZ2K3RqQT09"; 
			$resulRegistrar = $this->bloqueosU->validarData($datos, "FirmaD"); 
			$this->assertEquals(true, $resulRegistrar[0]['firma_digital']);
		}
		

		public function testLlaves(){
			$datos['cedula'] = "18690684"; 
			$resulRegistrar = $this->bloqueosU->validarData($datos, "BuscarLlaves"); 	
			$this->assertEquals(true, $resulRegistrar[0]['llave_publica']);
		}

		public function testEncrypt(){	
			$codigo = $this->codigoAleatorio('A', 6, 0);
			$public = 'UXozZHJNM3ZxdGdZWkV2d213YnZFOUJabUIxNllPY2FJRHE3N0NTcjVLOXVHUXI4U0NqRUh6VWlaWlZrMUpBY2RFaEgrYTF2QVhEK081Z0VKdm45VGl2WC9IcDI3cVRmMTR6NXgvQk9TQm9obTNReTI4QkxmaXVDODBUWVZHYk0vZ0tLN0VHOEhQYlBpL0VuaWZGNngyVzNwOTBWTTJYUEhFVlh1Q0p2MWkzS1JmMjhRSG4xb2lLaHFmN01VRTMrdG5Oc3ZMRzVWeHMrakQycXAzWXZGQ2ZLS0piRjJEY3NuNkR4TktDd0VjT2YrZmptRTR1RmgvRGJSUjVSVEhvNGkwc2g4YnQwcWk0bkF4VTBsWlh3R3U2RUlhdDBhWUFUSkFQMWtyTE1GNHloTVVtaEo3eDZlMHIvdG5oeXZBeXJQNHllTEZhZWJlVEhwNFlKUHhoYXc0UndZK2VOYlNIOWpmTlplMjdRem9vWVlUUlloaDRoMElSQ2lpeDFEM215eHJKTXBkbEtBbDNWaGJPdVZJYmxzRk1uSUhzS2xzYjgzVU41RlhsaUoyYkhnWCs5ZGZHUlhWbTg1QVRYSTNNNGxndXpyOUhrU2JGb29YeGVyYTBRSUxxbDNJYzBTU0RwRlVwVGNyZmhWMUViZDMxeTV6eHZBKyt4YXdWUWkrTi8zNEpablRXM2s5RzFwdUN5SDdXdkJRMEZLUHk3Nk9mNlpzRkszanp0bWp0ZE9odmNDVTFuMktnM0FyMkkxT0RTUkVRaDBTVURxaWJrenZBVWlDUFJGTUF0dDJpdyt4TkczSWVPRjZtQkZLOD0=';
			$codigoEncrypt = $this->bloqueosU->Encrypt($codigo, $this->desencriptar($public)); 
			$datos['codigo'] = $codigoEncrypt;
			$datos['cedula'] = "03633921";
			$resulRegistrar = $this->bloqueosU->validarData($datos, "CodigoDesbloqueo");
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		public function testDecrypt(){
			$codigo = 'WsHruTgHY+PEXBWT1lTdgCWFcozZMizbHvNYaM/YLM96IKSpcEbd7xpWCC0zU5SAtpL+UO/KagjDnUcryLQhUjj2GYwyhVlftW+8q+lzD7q+S5lVE6FLfe2wtMrDVqHqzz+gjo4eaM4wgydN0RmwEU2BJq1DUNhtYhKJOOFVgix8S6JrkBN0YbzU85E8vhCxGPLUHQxa9BVkJqnhwBcnmLfgPp6JLKvnAaEV6U/zSK+5b7zeEXwsHemro7GQnTKzNoiGkvxqMmmWczgH3NW2KVrM2yGHn8lZhEdZOgC7vZHDFAA2rEG2XlwjQ0ajHcD929S252jVK9/V0Qin7CQwBQ==';
			$private = 'ZkxmeUlDdXpmRUgyL3JmdHJ2Y0dxbWpuTVJkM2ozakF3ckY4TUZIRUVpZG5xdjg2SlZyS2NNQkMwMUJ1blcyZGducWg4SG9NTCtieTB5WjdGMlI5TFFPWk9aNXY0bzk0NWMrVUppdjVhY1Bvdnh4bWtTdDdBeDJDU3k0RHI1VlRjeTVVOUpYdUVmV2M4dEZieXdXZkpMNEtrbFpLK2dxTkRKZk40M2FmL0wreVRzVUNjK3pFS0M5aVNURkJmS3ZpeFFqRzViUmFGdXN3ekZLcGVmWUtJZlNiQmpFS3prQmpUT3lsam9DOHFaUDh2cjh1dmxzQzMzREtyaStDR3hyWkVKR09aOXYwZUpGellXRm9udGtVdlRhUzdmU2ZwMTFUYjBneCszc2hHWG5nY0VKekF3MEsrVkEzV1JRNDduVFRJOWtmUXYxaWRZL2IzMng1USsyM0tqSktJRXRXUGNkTmhqaTI2L3dHV2FPaEVzYzlpMGJKZUVkRkFydjJSRkVjNXhiMVROUjBNcE56aVp4b3FTd3ZwZDFkaEFyS3lrUnI0ZC9yeU9KMWhUYWp2cjJaZDhhNjc3bkdlY0ZpenRZV3NWOFp6REl1M0pDNHRnbldGNnNOWU9yZEVoTjN4L1ljdjJlZUZSYUx6bUhoQXVOWnozYy9wNmR0UkJNY01yTHRvM2Q1TlhDL3ovN0tZTUVHcTAyYzRGRytlcHN2QWgzSHFKdmFXSjdKS0dBbGI0RURUMjM3TWo5Q0VydzhNN0tjOFBranY4cjRaWkIrdlQ3dEZzbU85L3JIUzVlZUVqZUM4bjY3VnNvYWdHSktZWWVFdEFhblhqN0ZPR0FnK1BuYTQ2TVJxcGZHT1pmL3hLajBoVGJEV2NJeGRjTVJTMlliWXl5cThCMVVMSG1uWWoyY0llbEo2RjI2OXZWcFBVU1pzMWtseVcvcitxN3lWdHA5dkdZMGJSaHhQOVBmVHlPRnBicnVicGVSK1BITTVqOXVjUTZJOXZEZU41RityOHY1bDF1WlgwYm5QTjE1ekdvQlBvcU90aGl3VTVkWEI2cURHRHVLTFpYOHpkME5MUytwd0tEWGRCTldkdEFHWVhqOWJPT2xwVUpQUmlCdmVUVjkvNlVsR0dVYW1EbGxZSGV3U09Ga2RQL2wzdzFxanZUajdtVE81RHU3L3hKQk9WMlhzaEpKUzdQY1lEQTBoYlFQZmdoTmQvZUVCUmZqWmx4Z0loNXFpbTZvZ3lEcCt3Z1BFbnNsbGFtV1pJdXNkQ3ZSNXNQRWx2NlNwRG1aOG9JT0R3ZFRCZmpQNS8xVHVyRm5nT2lPaDVIWnRDdTg1enA5WEVQaTRselk5OEowMUltWkpKQjI0dnBpWjdiOWF3ZHcyNjNTb2g3bFgvOHkzcUgyUWFncW9FWEpRUFYvR0pKWHFMNnZFdmJhbCtFYm81ZDJ4R3ppYU9NZ0ZtVkdMcEo4Q1cyZlhjWVg3dnBzRmRGL2VRL0k4eUdhbXZNVFByL04rSFZEclZBallBaWU0VmpNODE2eFU3ZnlQSytlRXpFZnJGTngyQlU3OGVaU3RobzlZNWFvbS9YWHg0eUwwd3RNcHFZNVhoMXplT0VFcDN6aE9MTDBXOVhiTHRMaVRsbDRkYTBPREo3aVRWYlF6Rmh1OUtWMXZLeUt1bEVEVGRzYUVSNTVlVkpMdmUyVWF4VnRqNFFQKzAwbkdMK2gzQ2tCQnRJS2ZZOXJYQ2Z3Y1ZILzQyWkNka3JrdzhDR1FDNG1BbWNQaXE1ZTVKNDE5cnQrRmd5RXVJalE0NGhoMFRvc2hZNGd2N0MxOFU5VDh0eHJuMVczdHFEV2JEd3diVWRVVm9YZ0VoeGpyZkgzWjNxSER5UldLcWhpRzVibC9WS1hjVkd6NXVuYXZiNmhZWFZ0NGNEcUhJTEprMTlxb2h1a1BUR08xM2ZBQ0plWmVsNEliZlNuRjFTb0s5UEFua282TzlLaE9CUVUycjNZWmNRTHpkdlVNanI1Y1VwUEVSYW4wTEtjRUNPdS9GUGJJM2tlMjhQb2xqMkRxaXAxcDFqSXk0THVGM0JYK3I2WXFoU3pRTXRYbER0MVJNcEl1UjJiWkM4QWxhc1ZacnpNcWJpQUk1a09BTWFpd21LK1pVS0dvbXBXajJjQkxEVkVXNjNIUG5wY0JWR3RBbWFncWVKVURIMStadUlqREZjRjNFSWdZb2lHN2JhamRlNFB6MjAxajcxdFBVQ1NWbzJlN1d6OW5BSU9HbWZYKzBqNm1WMkg0dG51bDhUNXI3OFRiR0U3WjlqbzJ1Ti8vUWIycnhVQWtQZXRVa0YvT2hDTGk0SVoxRVR1VEZFdHNrVm5EOFgwN1ExZG4yaXgxQ0FpOFdQWlN5SFFNTExSQjdhemRJR1NvZXcxdEkwWUplZitUcHowdkRoTVQ0YTkvbmYzaGtKWlpyZEg4R1NDeFM3R1FoSE1uclp1bjl2aHhnYXdwRU5kblFaRDB2TEYwNnZ0NVNuS0xBSUFzd1VEVjdURlZ6dTlHeWpIOVNmVVFwQklhMjQwTXJ2WFVCVzZSVFRXNE9TVUtXVVliZEN6eFV6bi9pQzVpbFFvOUxDREljNU1FOE5nZ0pwVG1HR3J6Qm12QUswbzd3QjQ2aG1IbHpvWDhTNysvSG9YaFhxK0dMUUgwbmZVY3oxUVFYOVB1Kzl6bDkxTDZ5K3pCcW50Wm51WVhMdzlsMnEvcUxOL2FaTGtkSDhsWDdnR1pXUDJuanExZkdsb1lnK2xlVVVaTVQyMkoyNkZGekM5aWlqVVMzNkxOZUJqcWRoQ0RxVnNnQVFSdjdCK0pvSXFzZTQyNEd4YzJlMVlaekZTYXR2Z2NxS1pmS09jaVFpQmRqR3RQd3lzV3FsTkxjb3AzMEo0VFFzZXgzV2lwajNscWErQWJxR3hudW04QnE3QUd0eHBWZkhMbXkrYmJ6dWN4bGJBelVGNjBrZlZhWnJJQmZoVGNQSHFPNGFmbU9GcUo1VkxHRWU5SUhkYTFXNG42RFBaTG84PQ==';
			$resulRegistrar = $this->bloqueosU->Decrypt($codigo, $this->desencriptar($private)); 				
			$this->assertEquals(true, $resulRegistrar);
		}

		public function testVerificarCodigo(){	
			$datos['cedula'] = "03633921"; 
			$resulRegistrar = $this->bloqueosU->validarData($datos, "BuscarCodigo"); 
			$this->assertEquals(true, $resulRegistrar[0]['codigo_desbloqueo']);
		}
		
		public function testDesbloquear(){
			$datos['cedula'] = "01566370";
			$datos['intentos'] = "0";
			$datos['pass'] = $this->encriptarContrasena("01566370");
			$resulRegistrar = $this->bloqueosU->validarData($datos, "Unlook");	
			$this->assertEquals(true, $resulRegistrar['msj']);
		}

		

	}

?>