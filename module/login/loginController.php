<?php 
class loginController extends Controller{
	public function index(){
		$this->setTitle('Login');
		$this->render('login.tpl');
	}
	
	public function login(){
		$this->loadModel('login');
		
		$result = $this->model->checkUser($_POST['username'], $_POST['password']);

		if($result){
//			echo 'Je bent ingelogd als '.$result['email'];
			$this->redirect('event/overview', $result['token']);
		}else{
			$this->error_msg = 'Je hebt een verkeerde email/wachtwoord combinatie gebruikt!';
			$this->index();
		}
	}
	
	public function logout(){
		$this->loadModel('login');
		
		$this->model->logout();
		
		$this->index();
		
	}
}