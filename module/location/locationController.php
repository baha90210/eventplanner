<?php
class locationController extends Controller{
	public function overview(){
		$this->setTitle('Overzicht locaties');
		
		$this->loadModel('location');
		
		$this->locations = $this->model->getLocations();
		
		$this->render('location_overview.tpl');
	}

	public function add(){
		$this->setTitle('Locatie toevoegen');
		
		if($_POST){
			$this->loadModel('location');

			$this->model->addlocation($_POST);
			
			$this->msg = 'Locatie '.$_POST['req_name'].' werd toegevoegd.';
			
			$this->overview();
		}else{		
			$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

			$this->location = array(
				'name'     => '',
				'address'  => '',
				'rate'     => '',
				'capacity' => ''
			);
	
			$this->render('location_detail.tpl');		
		}
	}

	public function edit(){
		$this->setTitle('Locatie aanpassen');
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
		$this->loadModel('location');
		
		if($_POST){
			if($this->validate($_POST)){
				$this->model->editlocation($_POST);

				$this->msg = 'Locatie '.$_POST['req_name'].' is aangepast.';
			}						

			$this->overview();
		}
		
		if(isset($_GET['id'])){
			$id = $_GET['id'];
			
			$this->location = $this->model->getLocation($id);
			
			$this->render('location_detail.tpl');		
		}
	}

	public function delete(){
		if(isset($_GET['id'])){
			$id = $_GET['id'];
	
			$this->loadModel('location');
			
			$location = $this->model->getLocation($id);
			
			$this->model->deleteLocation($id);
			
			$this->msg = 'U heeft locatie '.$location['name'].' verwijderd.';
		}
		
		$this->overview();
		//$this->redirect('index.php?route=location/overview');
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