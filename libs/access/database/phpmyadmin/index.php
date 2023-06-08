<?php

$actual = basename(dirname(__FILE__));
if(file_exists('accesoTempDataBaseMyAdmin.txt')){
	$txt = file_get_contents('accesoTempDataBaseMyAdmin.txt');
	if($txt==$actual){
		if(file_exists('../../accesoTemp1DataBaseMyAdmin.txt')){
			$txt1 = file_get_contents('../../accesoTemp1DataBaseMyAdmin.txt');
			if(($txt==$txt1) && ($txt1==$actual)){
				// echo "asd";
				require_once'index2.php';
			}else{
			    echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
			}
		}else{
		    echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
		}
	}else{
	    echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
	}
}else{
    echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
}
?>