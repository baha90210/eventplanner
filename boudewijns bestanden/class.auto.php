<?php
//class Auto en Fiets zijn kids van Voertuig
// inheritance van methodes en properties 
class Voertuig {
        //properties van Auto
	private $snelheid = 0;
	public $max_snelheid = 250;
	public $deuren;
	private $gestart = false;
	public $merk;
	public $bouwjaar;
	public $kleur;
        //construct
	public function __construct($merk,$max_snelheid){
            $this->deuren = 2;
            $this->merk = $merk;
            $this->max_snelheid = $max_snelheid;
	}
        //snelheid verhogen	
	public function Versnellen($versnelling){
		
		$this->snelheid += $versnelling;
		$this->controleer_snelheid();
		echo "De ".$this->merk." rijdt ".$this->snelheid. "km/u<br/>";	
	}
	//snelheid verlagen	
	public function Vertragen($versnelling){
		if($this->snelheid >= 0){
			$this->snelheid -= $versnelling;
			$this->controleer_snelheid();
		echo "De ".$this->merk." rijdt ".$this->snelheid. "km/u<br/>";	
		}
	}
        // LoHi snelheids check
	public function controleer_snelheid(){
		if($this->snelheid > $this->max_snelheid){
			$this->snelheid	=$this->max_snelheid;
		}		
		if($this->snelheid < 0){
			$this->snelheid = 0;
		}
	}
}
//Auto class
class Auto extends Voertuig{
	private $gestart = true;
	//auto stoppen
	public function Stoppen(){
		$this->gestart=false;
	}
	//auto starten
	public function Starten(){
		$this->gestart = true;
	}
	public function Versnellen($versnelling){
		if($this->gestart){
			parent::Versnellen($versnelling);
		}else{
			echo"Je moet de auto eerst starten<br />";
		}
        }        
	public function Vertragen($versnelling){
		if($this->gestart){
			parent::Vertragen($versnelling);
		}else{
			echo"Je moet de auto eerst starten<br />";
		}
	}
}
//Fiets class
class Fiets extends Voertuig{
        public function Versnellen($versnelling){
	$this->max_snelheid = 25;	
			parent::Versnellen($versnelling);	
	}	
        public function Vertragen($versnelling){
	$this->max_snelheid = 25;	
			parent::Vertragen($versnelling);	
	}	
}
// instances
$voertuig1 = new Auto('BMX',200);
$voertuig1->Versnellen(100);
$voertuig1->Vertragen(50);
$voertuig2 = new Fiets('chuck',25);
$voertuig2->Versnellen(15);
$voertuig2->Vertragen(2);
?>