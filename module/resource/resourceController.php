<?php
class resourceController extends Controller{
	public function __construct(){
		parent::__construct();
		
		$this->authorize();
        $this->loadMenu();
		
		$this->language->load('resource', $this->user['language']);
		$this->label_resource_price = $this->language->get('label_resource_price');
		$this->label_resource_discription = $this->language->get('label_resource_discription');
		$this->label_resource_add_button = $this->language->get('label_resource_add_button');
		
		$this->label_resource_add = $this->language->get('label_resource_add');
		$this->label_resource_name = $this->language->get('label_resource_name');
	}

    
	public function overview(){
		$this->setTitle('Overzicht resources');
		
		$this->loadModel('resource');
		
		$this->resources = $this->model->getresources();
		
		$this->render('resource_overview.tpl');
	}

	public function add(){
		$this->setTitle('resource toevoegen');
		

		if($_POST){
			$this->loadModel('resource');

			$this->model->addresource($_POST);
			
			$this->msg = 'resource '.$_POST['req_name'].' werd toegevoegd.';
			
			$this->overview();
		}else{		
			$this->addScript('./themes/'.THEME.'/javascript/jquery/jquery-1.7.1.min.js');

			$this->resource = array(
				'name'			=> '',
				'rate'			=> '',
				'description'			=> '',
			);
	
			$this->render('resource_detail.tpl');		
		}
	}

	public function edit(){
		$this->setTitle('resource aanpassen');
		$this->addScript('./themes/'.THEME.'/javascript/jquery/jquery-1.7.1.min.js');
		$this->loadModel('resource');
		
		if($_POST){
			if($this->validate($_POST)){
				$this->model->editresource($_POST);

				$this->msg = 'resource '.$_POST['req_name'].' werd aangepast.';
			}						

			$this->overview();
		}
		
		if(isset($_GET['id'])){
			$id = $_GET['id'];
			
			$this->resource = $this->model->getresource($id);
			
			$this->render('resource_detail.tpl');		
		}
	}

	public function delete(){
		if(isset($_GET['id'])){
			$id = $_GET['id'];
	
			$this->loadModel('resource');
			
			$resource = $this->model->getresource($id);
			
			$this->model->deleteresource($id);
			
			$this->msg = 'U heeft resource '.$resource['name'].' verwijderd.';
		}
		
		$this->overview();
		//$this->redirect('index.php?route=resource/overview');
	}
	
	private function validate($data){
		foreach($data as $k => $v){
			if(substr($k, 0, 3) == 'req'){
				if($v == ''){
					return false;
				}
			}
			
			if(substr($k, 0, 6) == 'reqnum'){
				if(!is_numeric($v)){
					return false;
				}
			}
		}
		
		return true;
	}
}
