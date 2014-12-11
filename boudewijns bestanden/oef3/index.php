<?php 
require_once('./config.php');

if(isset($_GET['route']) && $_GET['route'] != ''){
	//correcte class instantiëren
	$route = explode('/', $_GET['route']);

	if(isset($route[0])){
		$module = $route[0];
		$controllerName = $route[0].'Controller';
	}

	if(isset($route[1])){
		$action = $route[1];
	}else{
		$action = 'index';
	}

	require_once('./system/startup.php');	

	//controleren of het bestand bestaat en indien wel, includen
	//anders kunnen we de class niet gebruiken
	if(file_exists('./module/'.$module.'/'.$module.'Controller.php')){
		require_once('./module/'.$module.'/'.$module.'Controller.php');
		$obj = new $controllerName();
		$obj->$action();
	}else{
		echo 'module does not exist';
	}
}else{
	//redirect naar 404
	header('Location: 404.html');
}
?>