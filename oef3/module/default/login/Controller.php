<?php 
class loginController extends Controller{
	public function index(){
		$this->setTitle('Login');
		$this->render('login/_login.tpl');
	}
	
	public function login(){
		$this->loadModel('login');
		
		$result = $this->model->checkUser($_POST['username'], $_POST['password']);
		
		if($result->num_rows == 1){
                    $this->render('login/_loggedin.tpl');
		}else{
                    $this->error_msg = 'Je hebt een verkeerde email/wachtwoord combinatie gebruikt!';
                    $this->index();
		}
	}
}