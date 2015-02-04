<?php
class resourceController extends Controller{
	public function overview(){
		$this->setTitle('Overzicht resources');
		
		$this->loadModel('resource');
		
		$this->resources = $this->model->getresources();
		
		$this->render('resource_overview.tpl');
	}

	public function add(){
		$this->setTitle('resource toevoegen');
		
/*
		$this->resource['name'] = '';
		$this->resource['start_date'] = '';
		$this->resource['end_date'] = '';
		$this->resource['price'] = '';
*/
		if($_POST){
			$this->loadModel('resource');

			$this->model->addresource($_POST);
			
			$this->msg = 'resource '.$_POST['req_name'].' werd toegevoegd.';
			
			$this->overview();
		}else{		
			$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

			$this->resource = array(
				'name'			=> '',
				'rate'			=> ''
			);
	
			$this->render('resource_detail.tpl');		
		}
	}

	public function edit(){
		$this->setTitle('resource aanpassen');
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
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