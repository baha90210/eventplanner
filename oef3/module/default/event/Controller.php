<?php
class eventController extends Controller{
        // overview van events
	public function overview(){
		$this->setTitle('Overzicht events');
		$this->loadModel('event');
		$this->events = $this->model->getEvents();
		$this->render('event/_overview.tpl');
	}
        // 1 event bekijken
	public function oneEvent(){
		$this->setTitle('Een event bekijken');
                $this->id = $_GET['event_id'];
                $this->loadModel('event');
                $this->event = $this->model->getEvent($this->id);
                $this->render('event/_viewone.tpl');
	}
        // event formulier afbeelden
	public function addEvent(){
		$this->setTitle('Voeg event toe');
                $this->render('event/_add.tpl');
	}
        //
        public function bewerkEvent(){
                $this->setTitle('Bewerk event');
                $this->id = $_GET['event_id'];
                $this->loadModel('event');
                $this->updated_event = $this->model->getEvent($this->id);
                $this->render('event/_bewerk.tpl');
	}
        // event verwijderen
	public function deleteEvent(){
                if(isset($_GET['event_id'])){
                    $this->setTitle('Delete event');
                    $this->id = $_GET['event_id'];
                    $this->loadModel('event');
//                    $this->deleted_event = $this->model->deleteEvent($this->id);
//                    $this->render('event/_delete.tpl');
                    $this->model->deleteEvent($this->id);
                    $this->msg = 'U heeft event met de id '.$_GET['event-id'].'verwijderd';
                }
                $this->overview();
	}
        //  event inserten in de database
	public function insertEvent(){
		$this->setTitle('Voeg event toe');
                $this->name = $_POST['name'];
                $this->startdate = $_POST['start_date'];
                $this->enddate = $_POST['end_date'];
                $this->price = $_POST['price'];
                $this->loadModel('event');
		$this->added_event = $this->model->insertEvent($this->name,$this->startdate,$this->enddate,$this->price);
                $this->render('event/_added.tpl');
	}
        //  event updaten in de database
	public function updateEvent(){
		$this->setTitle('Update event');
                $this->name = $_POST['name'];
                $this->id = $_POST['event_id'];
                $this->startdate = $_POST['start_date'];
                $this->enddate = $_POST['end_date'];
                $this->price = $_POST['price'];
                $this->loadModel('event');
		$this->added_event = $this->model->updateEvents($this->id,$this->name,$this->startdate,$this->enddate,$this->price);
                $this->render('event/_bewerkt.tpl');
	}
}