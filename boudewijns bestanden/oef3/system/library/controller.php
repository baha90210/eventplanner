<?php
class Controller{
	private $title = '';
	protected $model;
	protected $error_msg;
	
	public function index(){
		echo 'Dit is de index van de parent controller';		
	}
	
	public function loadModel($module){
		if(file_exists('./module/'.strtolower($module).'/'.strtolower($module).'Model.php')){
			require_once('./module/'.strtolower($module).'/'.strtolower($module).'Model.php');
			
			$modelName = strtolower($module).'Model';
			
			$this->model = new $modelName();
		}else{
			echo 'Kan model ./module/'.strtolower($module).'/'.strtolower($module).'Model.php niet vinden';
		}
	}
	
	public function render($viewfile){
		$this->loadFile('head.tpl');
		$this->loadFile('header.tpl');
		$this->loadFile($viewfile);
		$this->loadFile('footer.tpl');
	}
	
	public function loadFile($file){
		if(file_exists('./themes/'.THEME.'/'.$file)){
			include('./themes/'.THEME.'/'.$file);
		}elseif(file_exists('./themes/default/'.$file)){
			include('./themes/default/'.$file);
		}else{
			echo 'Kan view '.$file.' niet vinden';
		}
	}
	
	public function setTitle($title){
		$this->title = APPNAME.$title;
	}
}	
	