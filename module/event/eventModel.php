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
            //var_dump($data);
		$sql  = "INSERT INTO event SET ";
		$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
		$sql .= "start_date = '".$data['req_start_date']."', ";
		$sql .= "end_date = '".$data['req_end_date']."', ";
		$sql .= "price = '".$data['reqnum_price']."'";
		
		$this->db->query($sql);
		$data['id'] = $this->db->getLastId();
		
		//handle event locations
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
		//handle event resources
		if(isset($data['resource'])){
			foreach($data['resource'] as $k=>$v){
				if($v != ''){
					$sql = "INSERT IGNORE INTO event_resource SET ";
					$sql .= "event_id = '".$data['id']."', ";
					$sql .= "resource_id = '".$v."'";
                                        
					$this->db->query($sql);
				}
			}
		}
                
                
                
//		//handle event performances
//		if(isset($data['performance'])){
//			foreach($data['performance'] as $k=>$v){
//				if($v != ''){
//					$sql = "INSERT IGNORE INTO event_performance SET ";
//					$sql .= "event_id = '".$data['id']."', ";
//					$sql .= "performance_id = '".$v."'";
//
//					$this->db->query($sql);
//				}
//			}
//		}
		
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
			//handle event resources
			$sql = "DELETE FROM event_resource WHERE event_id = '".$data['id']."'";
			$this->db->query($sql);
			
			if(isset($data['resource'])){
				foreach($data['resource'] as $k=>$v){
					if($v != ''){
						$sql = "INSERT IGNORE INTO event_resource SET ";
						$sql .= "event_id = '".$data['id']."', ";
						$sql .= "resource_id = '".$v."'";
						
						$this->db->query($sql);
					}
				}
			}
                        
//			//handle event performances
//			$sql = "DELETE FROM event_performance WHERE event_id = '".$data['id']."'";
//			$this->db->query($sql);
//			
//			if(isset($data['performance'])){
//				foreach($data['performance'] as $k=>$v){
//					if($v != ''){
//						$sql = "INSERT IGNORE INTO event_performance SET ";
//						$sql .= "event_id = '".$data['id']."', ";
//						$sql .= "performance_id = '".$v."'";
//						
//						$this->db->query($sql);
//					}
//				}
//			}
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
        
//        public function getEventPerformances($id){
//		$sql = "SELECT performance_id FROM event_performance WHERE event_id = '".$id."'";
//		
//		$result = $this->db->query($sql);
//		
//		return $result->rows;
//	}

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
	
	public function baha_getEventLocation($event_id){
		$sql  = "SELECT l.* FROM event_location el ";
		$sql .= "LEFT JOIN location l ON el.location_id = l.location_id ";
		$sql .= "WHERE event_id = '".$event_id."'";

		$result = $this->db->query($sql);
		
		return $result->rows;
	}

	public function baha_getEventResources($event_id){
		$sql  = "SELECT r.*, rt.name type_name FROM event_resource er ";
		$sql .= "LEFT JOIN resource r ON er.resource_id = r.resource_id ";
		$sql .= "LEFT JOIN resource_type rt ON rt.resource_type_id = r.type ";
		$sql .= "WHERE event_id = '".$event_id."'";

		$result = $this->db->query($sql);
		
		return $result->rows;
	}
        
//	public function baha_getEventPerformances($event_id){
//		$sql  = "SELECT r.*, rt.name type_name FROM event_performance er ";
//		$sql .= "LEFT JOIN performance r ON er.performance_id = r.performance_id ";
//		$sql .= "LEFT JOIN performance_type rt ON rt.performance_type_id = r.type ";
//		$sql .= "WHERE er.event_id = '".$event_id."'";
////echo $sql;
//		$result = $this->db->query($sql);
//		
//		return $result->rows;
//	}


	public function eventPdf($id){
		$sql = "SELECT ev.name as event_name, 
						ev.start_date as start_date, 
						ev.end_date as end_date,
						GROUP_CONCAT(DISTINCT lo.name, '|Capaciteit: ', lo.capacity, '|', lo.rate, '#') as locations_array,
						GROUP_CONCAT(DISTINCT ar.name, '|', ar.website, '|', ar.rate, '#') as artists_array,
						GROUP_CONCAT(DISTINCT re.name, '|', re.description, '|', re.rate, '#') as resources_array
				FROM event as ev ";
				
		$sql.= "LEFT JOIN event_location as el ON el.event_id = ev.event_id ";
		$sql.= "LEFT JOIN location as lo ON lo.location_id = el.location_id ";
		
		$sql.= "LEFT JOIN performance as pe ON pe.event_id = ev.event_id ";
		$sql.= "LEFT JOIN artist as ar ON ar.artist_id = pe.artist_id ";

		$sql.= "LEFT JOIN event_resource as er ON er.event_id = ev.event_id ";
		$sql.= "LEFT JOIN resource as re ON re.resource_id = er.resource_id ";
		
		$sql.= "WHERE ev.event_id = '".$id."' ";
		$sql.= "GROUP BY ev.event_id";
		
		$result = $this->db->query($sql);
		
		return $result->row;
	}


}