<?php
class eventController extends Controller{
	public function overview(){
		$this->setTitle('Overzicht events');
		
		$this->loadModel('event');
		
		$this->events = $this->model->getEvents();
		
		$this->render('event_overview.tpl');
	}

	public function add(){
		$this->setTitle('Event toevoegen');
		
/*
		$this->event['name'] = '';
		$this->event['start_date'] = '';
		$this->event['end_date'] = '';
		$this->event['price'] = '';
*/
		if($_POST){
			$this->loadModel('event');

			$this->model->addEvent($_POST);
			
			$this->msg = 'Event '.$_POST['name'].' werd toegevoegd.';
			
			$this->overview();
		}else{		
			$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

			$this->event = array(
				'name'			=> '',
				'start_date'	=> '',
				'end_date'		=> '',
				'price'			=> ''
			);
	
			$this->render('event_detail.tpl');		
		}
	}

	public function edit(){
		$this->setTitle('Event aanpassen');
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
		$this->loadModel('event');
		
		if($_POST){
			if($this->validate($_POST)){
				$this->model->editEvent($_POST);

				$this->msg = 'Event '.$_POST['req_name'].' werd aangepast.';
			}						

			$this->overview();
		}
		
		if(isset($_GET['id'])){
			$id = $_GET['id'];
			
			$this->event = $this->model->getEvent($id);
			
			$this->render('event_detail.tpl');		
		}
	}

	public function delete(){
		if(isset($_GET['id'])){
			$id = $_GET['id'];
	
			$this->loadModel('event');
			
			$event = $this->model->getEvent($id);
			
			$this->model->deleteEvent($id);
			
			$this->msg = 'U heeft event '.$event['name'].' verwijderd.';
		}
		
		$this->overview();
		//$this->redirect('index.php?route=event/overview');
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