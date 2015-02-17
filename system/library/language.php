<?php
class language{
	private $xml;

	public function load($module, $language = 'nederlands'){
	    if(!isset($language) || $language=="") $language='nederlands';
		$this->xml = simplexml_load_file('./languages/'.$language.'/'.$module.'.xml');
		
		return;
	}
	
	public function get($key){
		if(isset($this->xml->$key)){
			return (string)$this->xml->$key;
		}else{
			return $key;
		}
	}
	
	public function loadResult($module, $language = 'nederlands'){
	    if(!isset($language) || $language=="") $language='nederlands';
		$result = $this->xml = simplexml_load_file('./languages/'.$language.'/'.$module.'.xml');
		
		return $result;
	}
	
}