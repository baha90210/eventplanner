<?php
class resourceModel extends Model{
	public function getResources(){
		$sql  = "SELECT * FROM resource ORDER BY name";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}	
	public function getResourcesbyId($id){
		$sql  = "SELECT * FROM resource WHERE resource_id = '".$id."' ORDER BY name";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}	
}