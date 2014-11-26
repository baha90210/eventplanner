<?php
echo "<form action'' method='get'><input type='text' name='merk'><input type='submit' name='submit'></form>";
class Auto {
	//properties van Auto
	private $snelheid = 0;
	public $max_snelheid;
	public $aantaldeuren = 4;
	private $gestart = false;
	public $merk;
	public $bouwjaar;
	public $kleur;
	//Construct
	function __construct($merk,$max_snelheid=250){
		$this->max_snelheid = $max_snelheid;
		$this->merk = $merk;
		$this->Starten();
	}
	//auto starten
	public function Starten(){
		$this->gestart = true;
	}
	//snelheid verhogen	
	public function Versnellen($versnelling){
		if($this->gestart){
			$this->snelheid += $versnelling;
			$this->controleer_snelheid();
			echo "De ".$this->merk." rijdt ".$this->snelheid. "km/u<br/>";
			
		}
	}
	//snelheid verlagen	
	public function Vertragen($versnelling){
		if($this->gestart){
			$this->snelheid -= $versnelling;
			$this->controleer_snelheid();
		echo "De ".$this->merk." rijdt ".$this->snelheid. "km/u<br/>";
			
		}
	}
	public function controleer_snelheid(){
		if($this->snelheid > $this->max_snelheid){
			$this->snelheid	=$this->max_snelheid;
		}		
		if($this->snelheid < 0){
			$this->snelheid = 0;
		}
	}
	
	public function Uitzetten(){
		$this->gestart=false;
		
	}
	function __Destruct(){
		$this->uitzetten();
	}
}
$auto1 = new Auto($_GET['merk'],120);
$auto1->Versnellen(10);
$auto1->Versnellen(250);
$auto1->Versnellen(-250);
