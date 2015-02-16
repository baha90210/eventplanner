<?php
class userController extends Controller{
    
    public function __construct(){
        parent::__construct();
    
        $this->authorize();
        $this->loadMenu();
//     	$this->language->load('user', $this->user['language']);
    }
    
    public function overview(){
        $this->loadModel('user');
        $this->users = $this->model->getUsers();
        
        $this->setTitle("Overzicht Gebruikers");
		$this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
        
        $this->render('user_overview.tpl');
    }
    
    public function add(){
        //functie wordt ook gebruikt om edit-pagina weer te geven
        //editfunctie vangt de POST op.
        
        if(isset($_GET['email'])){  //aanroep pagina om user te bewerken
            $this->loadModel('user');
            $this->user = $this->model->getUser($_GET['email']);
            $this->usergroups = $this->model->getUserGroupsUser($_GET['email']);
            $this->groups = $this->model->getUserGroups();
            $this->languages = $this->getDirs('./languages');
            $this->readonly="readonly"; //email niet laten wijzigen
            $this->passwordreq=false; //password niet verplicht bij edit - leeg is niet wijzigen!!
            $this->setTitle("Beheer Gebruiker");
        }else{                      //aanroepen pagina zonder gegevens is toevoegen.
            $this->setTitle("Toevoegen Gebruiker");
            $this->loadModel('user');
            $this->groups = $this->model->getUserGroups();
            $this->languages = $this->getDirs('./languages');
            $this->readonly="";
            $this->passwordreq=true;
            
			$this->user = array(
				'email'			         => '<email>',
				'password'	             => '<password>',
				'date_last_logged_in'	 => '',
				'token'			         => '',
			    'language'               => ''
			);
        }
        $this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
        $this->render('user_detail.tpl');
    }
    
    public function edit(){
        //var_dump($_POST); die;
        //als token gevuld: user bestaat al
        if($_POST){
            if(isset($_POST['req_email']) && isset($_POST['token']) && $_POST['token']!=""){
                //code voor opslaan in db
                $this->loadModel('user');
                $this->model->updateUser($_POST);
            }else{
                //nieuwe user"
                $this->loadModel('user');
                $this->model->addUser($_POST);
            }
            $this->overview();
        }else{
             $this->add();
        }
    }
    
    public function group(){
        $this->setTitle("Beheer Autorisatiegroepen");
        //echo "function group";
        
        //Module aan groep toevoegen
        if(isset($_POST['Submit'])){
            //groepen en modules opslaan 
            $this->loadModel('user');
            if(isset($_POST['group'])){
                if($_POST['group']!="" && $_POST['module']!=""){
                    if(isset($_POST['edit']) && $_POST['edit']==""){
                        $edit=0;
                    }else{
                        $edit=1;
                    }
                    if(isset($_POST['view']) && $_POST['view']==""){
                        $view=0;
                    }else{
                        $view=1;
                    }
                    
                    $this->model->addGroupModule($_POST['group'],$_POST['module'], $edit, $view);
                }
            }
            if(isset($_POST['groep'])){
                if($_POST['groep']!="" && $_POST['omschrijving']!=""){
                    $this->model->addGroup($_POST['groep'],$_POST['omschrijving']);
                }
            //echo "<pre>";var_dump($_POST);echo "</pre>";
            //die;
            }
        }
        //Als er op "opslaan" is geklikt: creëer een rij getallen met groupid, module, edit en view ; 
        //voorbeeld (1, "location", 1, 0)   --voor insert in de database
        $rights="";
        if(isset($_POST['opslaan'])){
   //         echo "<pre>";var_dump($_POST);echo "</pre>"; die;
            foreach($_POST as $key=>$value){  
                if($key != 'opslaan'){               //waarde van "opslaan" moet je niet meenemen :)
                      foreach($value as $k=>$v){
                        foreach($v as $x=>$y){
                            $rights .="(".$k;
                            $rights .=", '".$x."'";
                            foreach($y as $a=>$b){
                                $rights.=", ".$b;
                            }
                        $rights .="), ";
                        }
                     }
                }
            }
            //achter laatste values de komma weghalen
            $gr_rights = substr($rights,0,strlen($rights)-2);    

            //alle rechten verwijderen (nu wordt het tricky)
            $this->loadModel('user');
            $this->model->deleteGroupRights();
            
            //nieuwe rechten plaatsen in tabel
            $this->model->setGroupRights($gr_rights);
            $this->msg="Rechten opgeslagen; aantal rijen:".$this->model->db->countAffected();
            }
        
        //pagina laden voor rechten-overzicht:    
        $this->loadModel('user');
        $this->addScript('./themes/default/javascript/jquery/jquery-1.7.1.min.js');
        $this->grouprights = $this->model->getUserGroupsRights();
        $this->dirs = $this->getDirs("./module");
        $this->groups = $this->model->getUserGroups();
        $this->render('group_overview.tpl');
    }

    public function delgroup(){
        //echo "delgroup met id ".$_GET['id'];
        $this->loadModel('user');
        $this->model->deleteGroup($_GET['id']);
        $this->group();
    }
    
    public function user(){
        //echo "module: user; <br />functie: user";
        $this->overview();
    }
    
    public function delete(){
        //verwijderen gebruiker
        //echo "module: user; <br />functie: delete";
        $this->loadModel('user');
        $this->model->deleteUser($_GET['email']);
        $this->msg="User met ".$_GET['email']." is verwijderd!";
        $this->overview();
    }
    
    public function group_delete(){
        //echo "module: user; <br />functie: group_delete";
        $this->loadModel('user');
        $this->model->deleteGroupModule($_GET['group'], $_GET['module']);
        $this->group();
     }
    
    public function getEmptyGroups(){
        //echo "getEmptyGroups";
        $this->loadModel('user');
        $result = $this->model->getGroupsNoRights();
        echo json_encode($result);
    }
}