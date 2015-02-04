<?php
class artistController extends Controller{
	public function __construct(){
		//parent::__construct(); // te activeren als er in de parent class een construct zou zitten	
		$this->authorize();
	}

	public function overview(){		
		$this->setTitle('Overzicht artists');
		
		$this->loadModel('artist');		
		$this->artists = $this->model->getArtists();		
		$this->render('artist_overview.tpl');
	}


	public function profile(){		
		$this->setTitle('Artist profile');
		
		if(isset($_GET['id'])){
			$this->loadModel('artist');		
			$this->artist = $this->model->getArtist($_GET['id']);		
			$this->render('artist_profile.tpl');
		}
		else {
			$this->msg = 'Artiest niet gevonden';	
			$this->render('artist_profile.tpl');
		}
	}



	public function add(){
		$this->setTitle('artist toevoegen');

		if($_POST){
			$this->loadModel('artist');

			$this->model->addArtist($_POST, $_FILES);
			
			$this->msg = 'artist '.$_POST['req_name'].' werd toegevoegd.';
			
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
		$this->setTitle('artist aanpassen');
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
		$this->loadModel('artist');

		if($_POST){
			if($this->validate($_POST)){
				$this->model->editArtist($_POST, $_FILES);

				$this->msg = 'artist '.$_POST['req_name'].' werd aangepast.';
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
			
			$this->msg = 'U heeft artist '.$artist['name'].' verwijderd.';
		}
		
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
}