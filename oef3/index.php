<?php 
require_once('./config.php');

if(isset($_GET['route']) && $_GET['route'] != ''){
	//correcte class instantiëren
        // split de route
	$route = explode('/', $_GET['route']);
        // eerste waarde is de module map
	if(isset($route[0])){
		$module = $route[0];
		$controllerName = $route[0].'Controller';
	}
        // als er een tweede waarde is dan is dan de modele controller
	if(isset($route[1])){
		$action = $route[1];
        // zo niet belanden we in de index van de child zo niet de parent        
	}else{
		$action = 'index';
	}

	require_once('./system/startup.php');	

	//controleren of het bestand bestaat en indien wel, includen
	//anders kunnen we de class niet gebruiken
	if(file_exists('./module/'.THEME.'/'.$module.'/Controller.php')){
		require_once('./module/'.THEME.'/'.$module.'/Controller.php');
		$obj = new $controllerName();
		$obj->$action();
        // of anders halen we die uit de default      
        }elseif(file_exists('./module/default/'.$module.'/Controller.php')){
		require_once('./module/default/'.$module.'/Controller.php');
		$obj = new $controllerName();
		$obj->$action();
        // en anders moet de programmeur al weer een stukkie bij kloppen        
	}else{
		echo 'module does not exist';
	}
}else{
	//En als echt niet helpt of de gebruiker is nie zo slim redirect dan naar de 404
	header('Location: 404.html');
}
?>