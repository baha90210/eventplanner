<?php
class performanceController extends Controller{
	public function __construct(){
		//parent::__construct();
		
		$this->authorize();
                $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
                $this->addScript('./themes/sander/bootstrap-3.3.2-dist/js/bootstrap.min.js');
	}

	public function overview(){		
		$this->setTitle('Overzicht performance');
		
		$this->loadModel('performance');
		$this->performance = $this->model->getPerformances();
                
                $this->loadModel('event');
                $this->events = $this->model->getEvents();
		
                $this->loadModel('artist');
                $this->artists = $this->model->getArtists();
                
                //var_dump($this->artists);
		$this->render('performance_overview.tpl');
	}

	public function add(){
		$this->setTitle('Performance toevoegen');

		if($_POST)
                {
			$this->loadModel('performance');
			$this->model->addEvent($_POST);
			$this->msg = 'Performance '.$_POST['name'].' werd toegevoegd.';			
			$this->redirect('performance/overview', $_GET['token']);
		}
                else
                {		
			$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

			$this->event = array(
				'name'          => '',
				'start_date'    => '',
				'end_date'      => '',
				'price'		=> ''
			);
                        $this->event_locations = array();
                        $this->loadModel('location');
			$this->locations = $this->model->getLocations();
			$this->render('performance_detail.tpl');		
		}
	}

	public function edit(){
		$this->setTitle('performance aanpassen');

		$this->loadModel('performance');

		if($_POST)
                {
                    if($this->validate($_POST))
                    {
			$this->model->editEvent($_POST);
			$this->msg = 'Performance '.$_POST['req_name'].' werd aangepast.';
                    }						
                    $this->overview();
		}
		
		if(isset($_GET['id']))
                {
			$id = $_GET['id'];
			$this->performance = $this->model->getPerformance($id);
			$this->render('performance_detail.tpl');		
		}
	}

	public function delete(){
		if(isset($_GET['id'])){
                    
			$id = $_GET['id'];
			$this->loadModel('performance');
			$performance = $this->model->getEvent($id);
			$this->model->deleteEvent($id);
			$this->msg = 'U heeft performance '.$event['name'].' verwijderd.';
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