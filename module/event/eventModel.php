<?php
class eventModel extends Model{
	public function getEvents(){
		$sql = "SELECT * FROM event ORDER BY start_date ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	public function deleteEvent($id){
		$sql = "DELETE FROM event WHERE event_id = '".$this->db->escape($id)."'";
		
		$this->db->query($sql);
		
		return;
	}
	
	public function addEvent($data){
		$sql  = "INSERT INTO event SET ";
		$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
		$sql .= "start_date = '".$data['req_start_date']."', ";
		$sql .= "end_date = '".$data['req_end_date']."', ";
		$sql .= "price = '".$data['req_price']."'";
		
		$this->db->query($sql);
echo $this->db->getLastId();		
		
		return;
	}
	
	public function editEvent($data){
		$sql  = "UPDATE event SET ";
		$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
		$sql .= "start_date = '".$data['req_start_date']."', ";
		$sql .= "end_date = '".$data['req_end_date']."', ";
		$sql .= "price = '".$data['req_price']."' ";
		$sql .= "WHERE event_id = '".$data['id']."'";
		
		$this->db->query($sql);
		
		return;
	}
	
	public function getEvent($id){
		$sql = "SELECT * FROM event WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}
}