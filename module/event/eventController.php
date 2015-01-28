<?php
class eventController extends Controller{
	public function __construct(){
		//parent::__construct();
		
		$this->authorize();
	}

	public function overview(){		
		$this->setTitle('Overzicht events');
		
		$this->loadModel('event');
		
		$this->events = $this->model->getEvents();
		//haal de locations
                foreach($this->events as $event){
                    //begin van de loop eerst de event model weer laden
                    $this->loadModel('event');
                    //haal de locations op
                    $this->event_locations = $this->model->getEventLocations($event['event_id']);
                    //location model laden
                    $this->loadModel('location');
                    //teller op 0
                    $i= 0;
                    //lus door de  locations en haal de data op
                    foreach($this->event_locations as $event_location){
                        //stop ze in een array
                        $this->event_locationsdata[$event['event_id']][$i] = $this->model->getLocationsbyId($event_location['location_id']);
                        //teller omhoog wippen
                        $i++;
                    }
                }
                //haal de resources
                foreach($this->events as $event){
                    $this->loadModel('event');
                    //echo "<pre>";var_dump($event);echo "</pre>"; 
                    $this->event_resources = $this->model->getEventResources($event['event_id']);
                    //haal de resources op
                    $this->loadModel('resource');
                    //teller op 0
                    $i= 0;
                    //lus door de  resources en haal de data op
                    foreach($this->event_resources as $event_resource){
                        //prop ze weer in de array
                        $this->event_resourcesdata[$event['event_id']][$i] = $this->model->getResourcesbyId($event_resource['resource_id']);
                        //teller schoppen
                        $i++;
                    }
                }
                //spuug uit die bende..........
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