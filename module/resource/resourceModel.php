<?php
class resourceModel extends Model{
	public function getresources(){
		$sql = "SELECT * FROM resource";
	
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	public function deleteresource($id){
		$sql = "DELETE FROM resource WHERE resource_id = '".$this->db->escape($id)."'";
		
		$this->db->query($sql);
		
		return;
	}
	
	public function addresource($data){
		$sql  = "INSERT INTO resource SET ";
		$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
		$sql .= "rate = '".$this->db->escape($data['reqnum_rate'])."'";
		
		
		$this->db->query($sql);
//echo $this->db->getLastId();		
		
		return;
	}
	
	public function editresource($data){
		$sql  = "UPDATE resource SET ";
		$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
		$sql .= "rate = '".$this->db->escape($data['reqnum_rate'])."'";
		$sql .= "WHERE resource_id = '".$data['id']."'";
		
		$this->db->query($sql);
		
		return;
	}
	
	public function getresource($id){
		$sql = "SELECT * FROM resource WHERE resource_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}
	
	
}