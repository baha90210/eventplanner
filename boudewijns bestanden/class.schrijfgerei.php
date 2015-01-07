<?php
/*##################################/
/*#####overerving/inheritance#######/
/*##################################*/

// dont let people see your shizzle
error_reporting(1);

class schrijfgerei{
	//properties
	public $kleur;
	//methodes
	public function __construct(){
		echo"class schrijfgerei werd geinitialiseerd<br />";
	}
	public function schrijf($data){
		echo $data.'<br />';
	}
}
//initieer object
$obj = new schrijfgerei();
$obj->schrijf('schrijfgerei schrift');

class potlood extends schrijfgerei{
	//methodes
	
	//construct overruled the parent construct
	public function __construct(){
		//hier word de construct van de parent aangeroepen
		parent::__construct();
		echo"class potlood werd geinitialiseerd<br />";
	}
	
	public function wis(){
		echo "de tekst wordt gewist<br />";
	}
}
//initieer object
$potlood = new potlood;
$potlood->schrijf('potlood schrift');
$potlood->wis('adfsadfd');