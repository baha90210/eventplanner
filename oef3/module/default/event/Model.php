<?php
class eventModel extends Model{
        // haal alle events uit event table
	public function getEvents(){
		$sql = "SELECT * FROM event ORDER BY start_date ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
        // voeg een event toe
	public function insertEvent($name,$startdate,$enddate,$price){
		$sql = "INSERT INTO event(name,start_date,end_date,price) VALUES ('".$name."','".$startdate."','".$enddate."','".$price."');";
		
		$result = $this->db->query($sql);
		
		return $this->db->getLastId();
	}
        // delete een event 
	public function deleteEvent($event_id){
		$sql = "DELETE FROM event WHERE event_id = $this->db->escape($event_id);";
		
		$result = $this->db->query($sql);
		
		return $this->db->countAffected();
	}
        //  update an event op id
	public function updateEvents($event_id,$name,$startdate,$enddate,$price){
		$sql = "UPDATE event SET name='".$name."',start_date='".$startdate."',end_date='".$enddate."',price='".$price."'  WHERE event_id=".$event_id.";";
		
		$result = $this->db->query($sql);
		
		return $this->db->countAffected();
	}
        // check een event op id
	public function getEvent($event_id){
		$sql = "SELECT * FROM event WHERE event_id=".$event_id.";";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}

}