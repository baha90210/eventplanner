<?php

class messageController extends Controller{
public function __construct(){
    //parent::__construct();

    $this->authorize();
    $this->addScript('//code.jquery.com/jquery-1.11.2.min.js');
    $this->addScript('./themes/sander/bootstrap-3.3.2-dist/js/bootstrap.min.js');
}

public function overview(){		
    if (isset($_GET['msg']))
        // Set Header message according to value of $GET['msg']
        $this->setHeaderMSG($this->model->getMessageTextByKey($_GET['msg']));
    else 
        // Set Header Message to a standard text   
        $this->setHeaderMSG('Overzicht messages');
    // Load model
    $this->loadModel('message');
    // Load the array from table message
    $this->message = $this->model->getMessages();
    // render view
    $this->render('message_overview.tpl');
}

public function add(){
    $this->setHeaderMSG('Message Toevoegen');

    if($_POST)
    {
        $this->loadModel('message');
        $this->model->addMessage($_POST);	
        $this->redirect('message/overview', $_GET['token'],'msg_MSGADDED',$_GET['lang']);
    }
    else	
        $this->render('message_detail.tpl');
}

public function edit(){
    $this->setTitle('Message aanpassen');
    $this->loadModel('message');

    if($_POST)
    {
        if($this->validate($_POST))
            $this->model->editMessage($_POST);					
        $this->redirect('message/overview', $_GET['token'],'',$_GET['lang']);
    }

    if(isset($_GET['id']))
    {
            $id = $_GET['id'];
            $this->message = $this->model->getmessage($id);
            $this->render('message_detail.tpl');		
    }
}

public function delete(){
    if(isset($_GET['id']))
        {
            $id = $_GET['id'];
            $this->loadModel('message');
            $this->model->deleteMessage($id);
    }
    $this->redirect('message/overview', $_GET['token'],'',$_GET['lang']);
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