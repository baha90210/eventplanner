<?php
class locationController extends Controller{

	public function __construct(){
		parent::__construct();

		$this->authorize();
		$this->loadMenu();
		$this->lang = new stdClass();

		$translations = $this->language->loadResult('location', $this->user['language']);
		foreach($translations as $key => $value){
			$this->lang->$key = $value;
		}

		$this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
		$this->addScript('//code.jquery.com/ui/1.11.2/jquery-ui.js');
		$this->addScript('./themes/sander/bootstrap-3.3.2-dist/js/bootstrap.min.js');
		$this->addStyle('//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css');
	}
	
	public function index(){

		if (isset($_GET['msg'])) {
			// Set Header message according to value of $GET['msg']
			$this->setHeaderMSG($this->model->getMessageTextByKey($_GET['msg']));
		} else {
			// Set Header Message to a standard text
			$this->setHeaderMSG($this->lang->label_location_overview);
		}
			
		$this->setTitle($this->lang->label_location_overview);
		$this->loadModel('location');
		$this->locations = $this->model->getLocations();
		$this->render('location_overview.tpl');

	}
		
	public function overview(){
			
		if (isset($_GET['msg'])) {
			// Set Header message according to value of $GET['msg']
			$this->setHeaderMSG($this->model->getMessageTextByKey($_GET['msg']));
		} else {
			// Set Header Message to a standard text
			$this->setHeaderMSG($this->lang->label_location_overview);
		}
			
		$this->setTitle($this->lang->label_location_overview);
		$this->loadModel('location');
		
		$this->locations = $this->model->getLocations();
		$this->plaatsen = $this->model->getUniqueLocationCities();
		
		$this->render('location_overview.tpl');
	}

	public function add(){
		$this->setTitle($this->lang->label_add_location);
		
		if($_POST){
			$this->loadModel('location');
			$this->model->addlocation($_POST);
			$this->msg = $this->lang->label_location.' '.$_POST['req_name'].' '.$this->lang->label_location_added;
			$this->overview();
		}else{		
			$this->addScript('./themes/'.THEME.'/javascript/jquery/jquery-1.7.1.min.js');
			$this->render('location_detail.tpl');		
		}
	}

	public function edit(){
<<<<<<< HEAD
		$this->setTitle('Locatie aanpassen');
		$this->addScript('./themes/'.THEME.'/javascript/jquery/jquery-1.7.1.min.js');
=======
		$this->setTitle($this->lang->label_edit_location);
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
>>>>>>> branch 'master' of https://github.com/baha90210/eventplanner.git
		$this->loadModel('location');
		
		if($_POST){
			if($this->validate($_POST)){
				$this->model->editlocation($_POST);
				$this->msg = $this->lang->label_location.' '.$_POST['req_name'].' '.$this->lang->label_location_edited;
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
			$this->msg = $this->lang->label_location.' '.$_POST['req_name'].' '.$this->lang->label_location_deleted;
		}
		
		$this->overview();
	}
	
	public function getEventLocations() {
		$this->loadModel('location');
		$result = $this->model->getLocationsByEvent($_GET['event']);
		echo json_encode($result);
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
