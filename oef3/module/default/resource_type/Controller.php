<?php
class resource_typeController extends Controller{
        // overview van resource_types
	public function overview(){
		$this->setTitle('Overzicht resource_types');
		$this->loadModel('resource_type');
		$this->resource_types = $this->model->getResource_types();
		$this->render('resource_type/_overview.tpl');
	}
        // 1 resource_type bekijken
	public function oneResource_type(){
		$this->setTitle('Een resource_type bekijken');
                $this->id = $_GET['resource_type_id'];
                $this->loadModel('resource_type');
                $this->resource_type = $this->model->getResource_type($this->id);
                $this->render('resource_type/_viewone.tpl');
	}
        // resource_type formulier afbeelden
	public function addResource_type(){
		$this->setTitle('Voeg resource_type toe');
                $this->render('resource_type/_add.tpl');
	}
        //
        public function bewerkResource_type(){
                $this->setTitle('Bewerk resource_type');
                $this->id = $_GET['resource_type_id'];
                $this->loadModel('resource_type');
                $this->updated_resource_type = $this->model->getResource_type($this->id);
                $this->render('resource_type/_bewerk.tpl');
	}
        // resource_type verwijderen
	public function deleteResource_type(){
		$this->setTitle('Delete resource_type');
                $this->id = $_GET['resource_type_id'];
                $this->loadModel('resource_type');
		$this->deleted_resource_type = $this->model->deleteResource_type($this->id);
                $this->render('resource_type/_delete.tpl');
	}
        //  resource_type inserten in de database
	public function insertResource_type(){
		$this->setTitle('Voeg resource_type toe');
                $this->name = $_POST['name'];
                $this->startdate = $_POST['start_date'];
                $this->enddate = $_POST['end_date'];
                $this->price = $_POST['price'];
                $this->loadModel('resource_type');
		$this->added_resource_type = $this->model->insertResource_type($this->name);
                $this->render('resource_type/_added.tpl');
	}
        //  resource_type updaten in de database
	public function updateResource_type(){
		$this->setTitle('Update resource_type');
                $this->name = $_POST['name'];
                $this->id = $_POST['resource_type_id'];
                $this->startdate = $_POST['start_date'];
                $this->enddate = $_POST['end_date'];
                $this->price = $_POST['price'];
                $this->loadModel('resource_type');
		$this->added_resource_type = $this->model->updateResource_types($this->id,$this->name);
                $this->render('resource_type/_bewerkt.tpl');
	}
}