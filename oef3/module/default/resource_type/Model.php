<?php
class resource_typeModel extends Model{
        // haal alle resource_types uit resource_type table
	public function getResource_types(){
		$sql = "SELECT * FROM resource_type ORDER BY name ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
        // voeg een resource_type toe
	public function insertResource_type($name){
		$sql = "INSERT INTO resource_type(name) VALUES ('".$name."');";
		
		$result = $this->db->query($sql);
		
		return $this->db->getLastId();
	}
        // delete een resource_type 
	public function deleteResource_type($resource_type_id){
		$sql = "DELETE FROM resource_type WHERE resource_type_id = $resource_type_id;";
		
		$result = $this->db->query($sql);
		
		return $this->db->countAffected();
	}
        //  update an resource_type op id
	public function updateResource_types($resource_type_id,$name){
		$sql = "UPDATE resource_type SET name='".$name."' WHERE resource_type_id=".$resource_type_id.";";
		
		$result = $this->db->query($sql);
		
		return $this->db->countAffected();
	}
        // check een resource_type op id
	public function getResource_type($resource_type_id){
		$sql = "SELECT * FROM resource_type WHERE resource_type_id=".$resource_type_id.";";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}

}