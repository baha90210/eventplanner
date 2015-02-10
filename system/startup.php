<?php
function my_autoload ($className) {
	include('./system/library/'.strtolower($className).'.php');
}

spl_autoload_register('my_autoload');	

date_default_timezone_set("Europe/Amsterdam"); 
	
//	require_once('./system/library/controller.php');
//	require_once('./system/library/model.php');
//	require_once('./system/library/db.class.php');