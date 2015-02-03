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
        $this->setTitle("Overzicht Autorisatiegroepen");
        //echo "function group";
        
        //Module aan groep toevoegen
        if(isset($_POST['Submit'])){
            //groepen en modules opslaan 
            $this->loadModel('user');
            if($_POST['group']!="" && $_POST['module']!=""){
                $this->model->addGroupModule($_POST['group'],$_POST['module']);
            }
            if($_POST['groep']!="" && $_POST['omschrijving']!=""){
                $this->model->addGroup($_POST['groep'],$_POST['omschrijving']);
            }
            //echo "<pre>";var_dump($_POST);echo "</pre>";
            //die;
        }

        //Als er op "opslaan" is geklikt: creëer een rij getallen met groupid, module, edit en view ; 
        //voorbeeld (1, "location", 1, 0)   --voor insert in de database
        if(isset($_POST['opslaan'])){
            foreach($_POST as $key=>$value){  //waarde van "opslaan" wordt niet meegenomen :)
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

    public function user(){
        echo "module: user; <br />functie: user";
    }
    
    public function edit(){
        echo "module: user; <br />functie: edit";
    }
    
    public function delete(){
        echo "module: user; <br />functie: delete";
    }
    
    public function add_group(){
        echo "module: user; <br />functie: add_group";
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