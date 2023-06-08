<?php
	session_start();
	header("location:".$_SESSION['_ROUTE_']);
	session_destroy();
?>