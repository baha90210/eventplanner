<?php 
class loginController extends Controller{
	
    public function index(){
    	$this->setTitle('Login');
    	$this->render('login.tpl');
    }
    	
    public function login(){
    		$this->loadModel('login');
    		
    		$result = $this->model->checkUser($_POST['username'], $_POST['password']);
    
    		if($result)
    			$this->redirect('event/overview', $result['token']);
    		else {
    			$this->error_msg = 'Je hebt een verkeerde email/wachtwoord combinatie gebruikt!';
    			$this->index();
    		}
    		
    		if (isset($_POST['remember']))
    		    setcookie('RememberMe',$_POST['username'], strtotime( '+30 days' ));
    		else 
    		{
    		    setcookie('RememberMe',null,time()-1 );
    		    unset($_COOKIE['RememberMe']);
    		}
    }
    	
    public function logout(){
    		$this->loadModel('login');
    		
    		$this->model->logout();
    		
    		$this->index();
    }

}