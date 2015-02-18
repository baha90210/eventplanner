<?php
class eventController extends Controller{
	public function __construct(){
		parent::__construct();
		
		$this->authorize();
                $this->loadMenu();
                
                $this->language->load('event', $this->user['language']); //overal beschikbaar
		
		$this->label_event = $this->language->get('label_event_overview');		
		$this->label_event_name = $this->language->get('label_event_name');		
		$this->label_event_startdatum = $this->language->get('label_event_startdatum');		
		$this->label_event_einddatum = $this->language->get('label_event_einddatum');		
		$this->label_event_prijs = $this->language->get('label_event_prijs');		
		$this->label_event_edit = $this->language->get('label_event_edit');		
		$this->label_event_delete = $this->language->get('label_event_delete');		
		$this->label_event_pdf = $this->language->get('label_event_pdf');		
		$this->label_locations = $this->language->get('label_locations');		
		$this->label_locations_adres = $this->language->get('label_locations_adres');		
		$this->label_locations_cap = $this->language->get('label_locations_cap');		
		$this->label_locations_price = $this->language->get('label_locations_price');		
		$this->label_resources = $this->language->get('label_resources');		
		$this->label_resources_desc = $this->language->get('label_resources_desc');		
		$this->label_resources_type = $this->language->get('label_resources_type');		
		$this->label_resources_price = $this->language->get('label_resources_price');		
		$this->label_performances = $this->language->get('label_performances');		
		$this->label_performances_title = $this->language->get('label_performances_title');		
		$this->label_performances_artist_name = $this->language->get('label_performances_artist_name');		
		$this->label_performances_from = $this->language->get('label_performances_from');		
		$this->label_performances_until = $this->language->get('label_performances_until');		
		$this->label_performances_rate = $this->language->get('label_performances_rate');
                
                $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
                $this->addScript('//code.jquery.com/ui/1.11.2/jquery-ui.js');
                $this->addStyle('//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css');
	}

	public function overview(){

		$this->setTitle('Overzicht events');
                
		$this->addScript('./themes/'.THEME.'/javascript/jquery/jquery-1.7.1.min.js');
                

                
		$this->loadModel('event');
		
		$events = $this->model->getEvents();
                
//                $ws = new Ws();
	

        //echo '<pre>';var_dump($ws->getFunctions('cdyne_client'));echo '</pre>';        
        //echo '<pre>';var_dump($ws->NumbWord());echo '</pre>';        
	//echo '<pre>';var_dump($ws->getWeather('90210'));echo '</pre>';
	//echo '<pre>';var_dump($ws->getWeatherInfo('90210'));echo '</pre>';
	//echo '<pre>';var_dump($ws->getWeatherCity());echo '</pre>';
	

		$this->events = array();
		
        foreach($events as $event){
	        //get event locations
	        $event['locations'] = array();
	        $event_locations = $this->model->baha_getEventLocation($event['event_id']);
	        
	        foreach($event_locations as $location){
//                        var_dump( $location ['postcode']);
//                        $weather =  $ws->getWeather($location['postcode']); 
//                        var_dump($weather);
		        $event['locations'][] = $location;
	        }

	        //get event resources
	        $event['resources'] = array();
	        $event_resources = $this->model->baha_getEventResources($event['event_id']);
	        //var_dump($event_resources);
	        foreach($event_resources as $resource){
		        $event['resources'][] = $resource;
	        }
                
	        //get event performances
	        $event['performances'] = array();
	        $event_performances = $this->model->baha_getEventPerformances($event['event_id']);
                //var_dump($event_performances);
	        foreach($event_performances as $performance){
                        
                        
                        
                        
		        $event['performances'][] = $performance;
                        

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
			

			$this->event = array(
				'name'			=> '',
				'start_date'	=> '',
				'end_date'		=> '',
				'price'			=> ''
			);
			
			$this->event_locations = array();
			
			$this->loadModel('location');
			
			$this->locations = $this->model->getLocations();
                        
			$this->event_resources = array();
			
			$this->loadModel('resource');
			
			$this->resources = $this->model->getResources();
                        
			$this->event_performances = array();
			
			$this->loadModel('performance');
			
			$this->performances = $this->model->getPerformances();
                        
			$this->render('event_detail.tpl');		
		}
	}

	public function edit(){
		$this->setTitle('Event aanpassen');

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
                        
                        $this->loadModel('event');
                        
			$this->event_resources = $this->model->getEventResources($id);
			
			$this->loadModel('resource');
			
			$this->resources = $this->model->getResources();
                        
                        $this->loadModel('event');
                        
			$this->event_performances = $this->model->getEventPerformances($id);
			
			$this->loadModel('performance');
			
			$this->performances = $this->model->getPerformances();
                       
			
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


	public function event_pdf(){
		if(isset($_GET['id'])){
			// inladen html2pdf uit Library
			require_once('system/library/html2pdf.class.php');		

			$id = $_GET['id'];
			$this->loadModel('event');
			$this->event = $this->model->eventPdf($id);
			$this->event['total_rate'] = 0;
			
			if($this->event['locations_array'] != '') $this->createArray('locations', $this->event['locations_array']);			
			if($this->event['artists_array'] != '') $this->createArray('artists', $this->event['artists_array']);
			if($this->event['resources_array'] != '') $this->createArray('resources', $this->event['resources_array']);

			ob_start();
			require('themes/'.THEME.'/event_pdf.tpl');
			$content = ob_get_contents();
			ob_end_clean();
			
			$html2pdf = new HTML2PDF('P','A4','nl');
  	 		$html2pdf->WriteHTML($content);
			$html2pdf->Output('event'.$id.'.pdf');
		}
	}
	
	private function createArray($type, $data){
		$data = rtrim($data, '#');
	//	print_r($data);
		$array1 = explode('#,', $data);
		$i = 0;
		foreach($array1 as $item){
			$array2 = explode('|', $item);
			$this->event[$type][$i]['name']=$array2[0];
			$this->event[$type][$i]['desc']=$array2[1];
			$this->event[$type][$i]['rate']=$array2[2];

			$this->event['total_rate'] += $this->event[$type][$i]['rate'];
			$i++;
			}
		
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
