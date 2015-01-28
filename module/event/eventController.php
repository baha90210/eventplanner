<?php
class eventController extends Controller{
	public function __construct(){
		//parent::__construct();
		
		$this->authorize();
	}

	public function overview(){		
		$this->setTitle('Overzicht events');
		
		$this->loadModel('event');
		
		$events = $this->model->getEvents();

		$this->events = array();
		
        foreach($events as $event){
	        //get event locations
	        $event['locations'] = array();
	        $event_locations = $this->model->baha_getEventLocation($event['event_id']);
	        
	        foreach($event_locations as $location){
		        $event['locations'][] = $location;
	        }

	        //get event resources
	        $event['resources'] = array();
	        $event_resources = $this->model->baha_getEventResources($event['event_id']);
	        
	        foreach($event_resources as $resource){
		        $event['resources'][] = $resource;
	        }
	        
	        $this->events[] = $event;
		}		

		$this->render('event_overview.tpl');
	}

	public function add(){
		$this->setTitle('Event toevoegen');

		if($_POST){
			$this->loadModel('event');

			$this->model->addEvent($_POST);
			
			$this->msg = 'Event '.$_POST['req_name'].' werd toegevoegd.';
			
			$this->overview();
		}else{		
			$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

			$this->event = array(
				'name'			=> '',
				'start_date'	=> '',
				'end_date'		=> '',
				'price'			=> ''
			);
			
			$this->event_locations = array();
			
			$this->loadModel('location');
			
			$this->locations = $this->model->getLocations();
	
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
			$this->event_locations = $this->model->getEventLocations($id);
			
			$this->loadModel('location');
			
			$this->locations = $this->model->getLocations();
			
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