<?php
class resourceModel extends Model{
        // haal alle resources uit resource table
	public function getResources(){
		$sql = "SELECT RC.*,RCT.name AS resource_type_name FROM resource RC "
                        . "LEFT JOIN resource_type RCT "
                        . "ON RC.type=RCT.resource_type_id "
                        . "ORDER BY type ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
        // voeg een resource toe
	public function insertResource($name,$rate,$description,$type){
		echo $sql = "INSERT INTO resource(name,rate,description,type) VALUES ('".escape($name)."','".escape($rate)."','".escape($description)."','".escape($type)."');";
		
		$result = $this->db->query($sql);
		
		return $this->db->getLastId();
	}
        // delete een resource 
	public function deleteResource($resource_id){
		$sql = "DELETE FROM resource WHERE resource_id = $resource_id;";
		
		$result = $this->db->query($sql);
		
		return $this->db->countAffected();
	}
        //  update an resource op id
	public function updateResources($resource_id,$name,$rate,$description,$type){
		$sql = "UPDATE resource SET name='".$name."',rate='".$rate."',description='".$description."',type='".$type."'  WHERE resource_id=".$resource_id.";";
		
		$result = $this->db->query($sql);
		
		return $this->db->countAffected();
	}
        // check een resource op id
	public function getResource($resource_id){
		$sql = "SELECT RC.*,RCT.name AS resource_type_name FROM resource RC "
                        . "LEFT JOIN resource_type RCT "
                        . "ON RC.type=RCT.resource_type_id "
                        . "WHERE resource_id=".$resource_id.";";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}

}