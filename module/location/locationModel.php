<?php
class locationModel extends Model{
	public function getLocations(){
		$sql  = "SELECT * FROM location ORDER BY name";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}	
}