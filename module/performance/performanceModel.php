<?php
class performanceModel extends Model{
	
    public function getPerformances(){
		$sql = "SELECT performance_id, performance_title, t1.event_id, event.name AS eventname, artist.artist_id artist_id, artist.name AS artistname, t1.date_from, t1.date_until, confirmed ";
                $sql .= "FROM performance AS t1 ";
                $sql .= "INNER JOIN artist ON artist.artist_id = t1.artist_id ";
                $sql .= "INNER JOIN event ON event.event_id = t1.event_id ";
                if (isset($_GET['event']) && $_GET['event']!=='') $sql .= "WHERE t1.event_id='".$_GET['event']."' ";
                if (isset($_GET['artist']) && $_GET['artist']!=='') $sql .= "WHERE t1.artist_id='".$_GET['artist']."' ";
                $sql .= "ORDER BY date_from ASC";
		
		$result = $this->db->query($sql);
		//var_dump($result->rows);
		return $result->rows;
	}
	
	public function deletePerformance($id){
		$sql = "DELETE FROM event WHERE event_id = '".$this->db->escape($id)."'";
		$this->db->query($sql);
                
		$sql = "DELETE FROM event_locations WHERE event_id = '".$this->db->escape($id)."'";
		$this->db->query($sql);
		return;
	}
	
	public function addEvent($data){
            if($this->validatePerformance($data))
            {
		$sql  = "INSERT INTO event SET ";
		$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
		$sql .= "start_date = '".$data['req_start_date']."', ";
		$sql .= "end_date = '".$data['req_end_date']."', ";
		$sql .= "price = '".$data['reqnum_price']."'";
		
		$this->db->query($sql);

                //handle event locations
		$sql = "DELETE FROM event_location WHERE event_id = '".$data['id']."'";
		$this->db->query($sql);
			
		foreach($data['location'] as $k=>$v){
                    $sql = "INSERT IGNORE INTO event_location SET ";
                    $sql .= "event_id = '".$data['id']."', ";
                    $sql .= "location_id = '".$v."'";
		
                    $this->db->query($sql);
		}   
            }
            return;
	}
	
	public function editPerformance($data){
		if($this->validatePerformance($data)){
			//handle core event data
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
			
			foreach($data['location'] as $k=>$v){
				$sql = "INSERT IGNORE INTO event_location SET ";
				$sql .= "event_id = '".$data['id']."', ";
				$sql .= "location_id = '".$v."'";
				
				$this->db->query($sql);
			}
		}		
		return;
	}
	
	public function getPerformance($id)
        {
            $sql = "SELECT * FROM performance WHERE performance_id = '".$id."'";
            $result = $this->db->query($sql);
		
            return $result->row;
	}

	private function validatePerformance($data){
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