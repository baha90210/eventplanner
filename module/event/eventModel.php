<?php
class eventModel extends Model{
	public function getEvents(){
//            $sql = "SELECT event.*,EVTL.location_id,LOCA.name as loca_name,LOCA.address as loca_address,LOCA.rate as loca_rate,LOCA.capacity as loca_capacity,EVTR.event_id as resource_event_id,RESO.name,RESO.rate,RESO.description,RESO.type "
//                        ."FROM event "
//                        ."LEFT JOIN event_location EVTL ON event.event_id = EVTL.event_id "
//                        ."LEFT JOIN location LOCA ON EVTL.location_id = LOCA.location_id "
//                        ."LEFT JOIN event_resource EVTR ON event.event_id = EVTR.event_id "
//                        ."LEFT JOIN resource RESO ON EVTR.resource_id = RESO.resource_id "
//                        ."ORDER BY event.start_date ASC"; 
            
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
		$sql .= "price = '".$data['reqnum_price']."'";
		
		$this->db->query($sql);
		
		//handle event locations
		if(isset($data['location'])){
			foreach($data['location'] as $k=>$v){
				if($v != ''){
					$sql = "INSERT IGNORE INTO event_location SET ";
					$sql .= "event_id = '".$data['id']."', ";
					$sql .= "location_id = '".$v."'";
					echo $sql;
					$this->db->query($sql);
				}
			}
		}
		
		return;
	}
	
	public function editEvent($data){
		if($this->validateEvent($data)){
			//handle core event data
                        //var_dump($data);
			$sql  = "UPDATE event SET ";
			$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
			$sql .= "start_date = '".$data['req_start_date']."', ";
			$sql .= "end_date = '".$data['req_end_date']."', ";
			$sql .= "price = '".$data['reqnum_price']."' ";
			$sql .= "WHERE event_id = '".$data['id']."'";
			
			$this->db->query($sql);
			
			//handle event locations
			$sql = "DELETE FROM event_location WHERE event_id = '".$data['id']."'";
			$this->db->query($sql);
			
			if(isset($data['location'])){
				foreach($data['location'] as $k=>$v){
					if($v != ''){
						$sql = "INSERT IGNORE INTO event_location SET ";
						$sql .= "event_id = '".$data['id']."', ";
						$sql .= "location_id = '".$v."'";
						
						$this->db->query($sql);
					}
				}
			}
		}
		
		return;
	}
	
	public function getEvent($id){
		$sql = "SELECT * FROM event WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}

	public function getEventLocations($id){
		$sql = "SELECT * FROM event_location WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
        public function getEventResources($id){
		$sql = "SELECT resource_id FROM event_resource WHERE event_id = '".$id."'";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}

	private function validateEvent($data){
		foreach($data as $k => $v){
			if(substr($k, 0, 3) == 'req'){
				if($v == ''){
					return false;
				}
			}
			
			if(substr($k, 0, 6) == 'reqnum'){
				if(!is_numeric($v)){
					return false;
				}
			}
		}
		
		return true;
	}
}