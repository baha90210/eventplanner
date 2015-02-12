<?php
class artistController extends Controller{
	
	public function __construct(){
		parent::__construct();
			
		$this->authorize();

		$this->language->load('artist', $this->user['language']); //overal beschikbaar
		
		$this->label_artist_overview = $this->language->get('label_artist_overview');		
		$this->label_artist = $this->language->get('label_artist');		
		$this->label_artist_name = $this->language->get('label_artist_name');		
		$this->label_artist_profile = $this->language->get('label_artist_profile');		
		$this->label_artist_view_profile = $this->language->get('label_artist_view_profile');		
		$this->label_artist_not_found = $this->language->get('label_artist_not_found');		
		$this->label_artist_rate = $this->language->get('label_artist_rate');		
		$this->label_artist_website = $this->language->get('label_artist_website');		
		$this->label_add_artist = $this->language->get('label_add_artist');		
		$this->label_edit_artist = $this->language->get('label_edit_artist');		
		$this->label_delete_artist = $this->language->get('label_delete_artist');		
		$this->label_artist_added = $this->language->get('label_artist_added');		
		$this->label_artist_edited = $this->language->get('label_artist_edited');		
		$this->label_artist_deleted = $this->language->get('label_artist_deleted');		
		$this->label_artist_submit = $this->language->get('label_artist_submit');		
		$this->label_artist_new_image = $this->language->get('label_artist_new_image');
		$this->label_artist_remove_image = $this->language->get('label_artist_remove_image');
		$this->label_artist_current_image = $this->language->get('label_artist_current_image');
		$this->label_edit = $this->language->get('label_edit');
		$this->label_delete = $this->language->get('label_delete');
		$this->label_cancel = $this->language->get('label_cancel');
		$this->label_back_to_overview = $this->language->get('label_back_to_overview');

	}

	public function overview(){			
		$this->setTitle($this->label_artist_overview);
		
		$this->loadModel('artist');		
		$this->artists = $this->model->getArtists();		
		$this->render('artist_overview.tpl');
	}


	public function profile(){		
		$this->setTitle($this->label_artist_profile);
		
		if(isset($_GET['id'])){
			$this->loadModel('artist');		
			$this->artist = $this->model->getArtist($_GET['id']);		
			$this->render('artist_profile.tpl');
		}
		else {
			$this->msg = $this->label_artist_not_found;	
			$this->render('artist_profile.tpl');
		}
	}



	public function add(){
		$this->setTitle($this->label_add_artist);

		if($_POST){
			$this->loadModel('artist');

			$this->model->addArtist($_POST, $_FILES);
			
			$this->msg = $this->label_artist . ' '.$_POST['req_name'].' '. $this->label_artist_added;
			
			$this->overview();
		}else{		
			$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');

			$this->artist = array(
				'name'			=> '',
				'rate'			=> '',			
				'website'		=> '',
				'image'			=> '' 
				
			);
			
			$this->render('artist_detail.tpl');		
		}
	}


	public function edit(){
		$this->setTitle($this->label_edit_artist);
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
		$this->loadModel('artist');

		if($_POST){
			if($this->validate($_POST)){
				$this->model->editArtist($_POST, $_FILES);

				$this->msg = $this->label_artist . ' '.$_POST['req_name'].' '. $this->label_artist_edited;
			}						

			$this->overview();
		}
		
		if(isset($_GET['id'])){
			$id = $_GET['id'];
			
			$this->artist = $this->model->getArtist($id);
			
			$this->render('artist_detail.tpl');		
		}
	}


	public function delete(){
		if(isset($_GET['id'])){
			$id = $_GET['id'];
	
			$this->loadModel('artist');
			
			$artist = $this->model->getArtist($id);
			
			$this->model->deleteartist($id);
			
			$this->msg = $this->label_artist . ' '.$artist['name'].' '. $this->label_artist_deleted;		}
		
		$this->overview();
		//$this->redirect('index.php?route=artist/overview');
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
	
	public function getInfo(){
		$this->loadModel('artist');
		
		$result = $this->model->getArtist($_GET['artist_id']);
		
		echo json_encode($result);
	}
}