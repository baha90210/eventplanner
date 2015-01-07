<?php 
class loginController extends Controller{
	public function index(){
		$this->setTitle('Login');
		$this->render('login.tpl');
	}
	
	public function login(){
		$this->loadModel('login');
		
		$result = $this->model->checkUser($_POST['username'], $_POST['password']);
		
		if($result->num_rows == 1){
			echo 'Je bent ingelogd als '.$result->row['email'];
		}else{
			$this->error_msg = 'Je hebt een verkeerde email/wachtwoord combinatie gebruikt!';
			$this->index();
		}
	}
}