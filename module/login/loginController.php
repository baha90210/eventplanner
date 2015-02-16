<?php 
class loginController extends Controller{
	
    public function index(){
    	$this->setTitle('Login');
    	$this->render('login.tpl');
    }
    	
    public function login(){
		$this->loadModel('login');
		
		//zet cookies voor onthouden username en keuze;
		if(isset($_POST['remember'])){
		    setcookie('Username',$_POST['username'], strtotime( '+30 days' ));
		    setcookie('RememberMe','1', strtotime( '+30 days' ));
        }else{
		    setcookie('RememberMe',null,time()-1 );
		    setcookie('Username',null,time()-1 );
		    unset($_COOKIE['RememberMe']);
		    unset($_COOKIE['Username']);
		}
    	
    	//check gebruikersnaam en ww	
		$result = $this->model->checkUser($_POST['username'], $_POST['password']);

		if($result){
			$this->redirect('user/overview', $result['token']);
        }else{
			$this->error_msg = 'Je hebt een verkeerde email/wachtwoord combinatie gebruikt!';
			$this->index();
		}
    		
    }
            
    public function logout(){
    		$this->loadModel('login');
    		
    		$this->model->logout();
    		
    		$this->redirect('login'); //JM: gewijzigd ivm menu; alleen menu tonen als user is ingelogd
    }

}
