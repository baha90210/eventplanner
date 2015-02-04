<?php
class Controller{
	private $title = '';
	protected $model;
	protected $error_msg = '';
	private $header_msg = '';
	public $scripts = array();
	public $styles = array();
	
	public function index(){
		echo 'Dit is de index van de parent controller';		
	}
	
	public function getDirs($directory){
	    $result = array_diff(scandir($directory), array('..', '.', '.DS_Store')); //evt andere dirs of files toevoegen die je niet wilt zien
	    return $result;
	}
	
	public function addScript($scr){
		$this->scripts[] = '<script src="'.$scr.'"></script>';
	}

	public function addStyle($style){
		$this->styles[] = '<link rel="stylesheet" href="'.$style.'">';
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
	
	public function redirect($route, $token = '', $msg = ''){
	    $str='Location: index.php?route='.$route;
		if($token != '') $str .= '&token='.$token;
		if($msg != '') $str .= '&msg='.$msg;
		// Redirect browser, $str contains location data
        header($str);
	}
	
	public function authorize(){
		if(!isset($_GET['token'])){
			$this->redirect('login', '');
		}else{
			$this->loadModel('login');
			$result = $this->model->authorize($_GET['token']);
			
			if($result){
				return true;
			}else{
				$this->redirect('login', '');
			}
		}
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
	
	// Set the header_msg to the provided text.
	public function setHeaderMSG($text){
	    $this->header_msg = $text;
	}
}	
	