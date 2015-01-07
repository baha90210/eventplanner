<?php
class resourceController extends Controller{
        // overview van resources
	public function overview(){
		$this->setTitle('Overzicht resources');
		$this->loadModel('resource');
		$this->resources = $this->model->getResources();
                $i=0;
                foreach($this->resources as $resource){
                    //HeFu::vardrop($resource);
                $this->loadModel('resource_type');
                $this->resource_type[$i] = $this->model->getResource_type($resource['type']);
                $i++;
                }
		$this->render('resource/_overview.tpl');
	}
        // 1 resource bekijken
	public function oneResource(){
		$this->setTitle('Een resource bekijken');
                $this->id = $_GET['resource_id'];
                $this->loadModel('resource');
                $this->resource = $this->model->getResource($this->id);
                $this->render('resource/_viewone.tpl');
	}
        // resource formulier afbeelden
	public function addResource(){
		$this->setTitle('Voeg resource toe');
                $this->loadModel('resource_type');
                $this->resource_type_name = $this->model->getResource_types($this->id);
                $this->render('resource/_add.tpl');
	}
        //
        public function bewerkResource(){
                $this->setTitle('Bewerk resource');
                $this->id = $_GET['resource_id'];
                $this->loadModel('resource');
                $this->updated_resource = $this->model->getResource($this->id);
                $this->render('resource/_bewerk.tpl');
	}
        // resource verwijderen
	public function deleteResource(){
		$this->setTitle('Delete resource');
                $this->id = $_GET['resource_id'];
                $this->loadModel('resource');
		$this->deleted_resource = $this->model->deleteResource($this->id);
                $this->render('resource/_delete.tpl');
	}
        //  resource inserten in de database
	public function insertResource(){
		$this->setTitle('Voeg resource toe');
                $this->name = $_POST['name'];
                $this->rate = $_POST['rate'];
                $this->description = $_POST['description'];
                $this->type = $_POST['type'];
                //$this->loadModel('resource_type');
                //$this->added_resource_type = $this->model->getResource_type($this->type);
                $this->loadModel('resource');        
		$this->added_resource = $this->model->insertResource($this->name,$this->rate,$this->description,$this->type);
                $this->render('resource/_added.tpl');
	}
        //  resource updaten in de database
	public function updateResource(){
		$this->setTitle('Update resource');
                $this->name = $_POST['name'];
                $this->id = $_POST['resource_id'];
                $this->rate = $_POST['rate'];
                $this->description = $_POST['description'];
                $this->type = $_POST['type'];
                $this->loadModel('resource');
		$this->added_resource = $this->model->updateResources($this->id,$this->name,$this->rate,$this->description,$this->type);
                $this->render('resource/_bewerkt.tpl');
	}
}