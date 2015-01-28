<?php
class userController extends Controller{
    
    public function __construct(){
        //parent::__construct();
    
        $this->authorize();
    }
    
    public function overview(){
        //echo "functie userOverview";
        
        $this->loadModel('user');
        
        $this->users = $this->model->getUsers();
        
        //var_dump($this->users);
        
        $this->setTitle("Overzicht Gebruikers");
        
        $this->render('user_overview.tpl');
    }
    
    public function add(){
        echo "module: user; <br />functie: add";
    }
    
    public function group(){
        //echo "module: user; <br />functie: group";
        $this->setTitle("Overzicht Autorisatiegroepen");
                
        if($_POST){
            var_dump($_POST);
            die;
        }
        $this->loadModel('user');
        $this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
        $this->groups = $this->model->getUserGroups();
        
        //var_dump($this->users);
        
        
        $this->render('group_overview.tpl');
        
    }

    public function user(){
        echo "module: user; <br />functie: user";
    }
    
    public function edit(){
        echo "module: user; <br />functie: edit";
    }
    
    public function delete(){
        echo "module: user; <br />functie: delete";
    }
    
    public function group_add(){
        echo "module: user; <br />functie: group_add";
    }
    
    public function group_delete(){
        echo "module: user; <br />functie: group_delete";
    }
    
}