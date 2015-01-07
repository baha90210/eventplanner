<?php
class Controller{
	private $title = '';
	protected $model;
	protected $error_msg;
	
	public function index(){
		echo 'Dit is de index van de parent controller';		
	}
	
	public function loadModel($module){
                // kijk of de module in de THEME bestaat en laad deze
		if(file_exists('./module/'.THEME.'/'.strtolower($module).'/Model.php')){
                    
			require_once('./module/'.THEME.'/'.strtolower($module).'/Model.php');
			
			$modelName = strtolower($module).'Model';
			
			$this->model = new $modelName();
                // anders halen we die uit de default core        
                }elseif(file_exists('./module/default/'.strtolower($module).'/Model.php')){
                    
			require_once('./module/default/'.strtolower($module).'/Model.php');
			
			$modelName = strtolower($module).'Model';
			
			$this->model = new $modelName();
                // anders moet de programmeur nog een stukkie bij kloppen        
		}else{
			echo 'Kan model ./module/'.strtolower($module).'/Model.php niet vinden';
		}
	}
	
	public function render($viewfile){
		$this->loadFile('head.tpl');
		$this->loadFile('header.tpl');
		$this->loadFile($viewfile);
		$this->loadFile('footer.tpl');
	}
	
	public function loadFile($file){
		if(file_exists('./themes/'.THEME.'/templates/'.$file)){
			include('./themes/'.THEME.'/templates/'.$file);
		}elseif(file_exists('./themes/default/templates/'.$file)){
			include('./themes/default/templates/'.$file);
		}else{
			echo 'Kan view '.$file.' niet vinden';
		}
	}
	
	public function setTitle($title){
		$this->title = APPNAME.$title;
	}
}	
	