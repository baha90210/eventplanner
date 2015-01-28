<?php
class artistModel extends Model{
	
	public function getArtists(){
		$sql = "SELECT * FROM artist ORDER BY name ASC";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
	
	public function deleteArtist($id){
		$sql = "DELETE FROM artist WHERE artist_id = '".$this->db->escape($id)."'";
		
		$this->db->query($sql);
		
		return;
	}
	
	public function addArtist($data){
		if($this->validateArtist($data)){
			$sql  = "INSERT INTO artist SET ";
			$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
			$sql .= "rate = '".$data['reqnum_rate']."', ";
			$sql .= "website = '".$this->db->escape($data['url_website'])."', ";
			$sql .= "image = '".$data['img_image']."'";
		
			$this->db->query($sql);
		}
					
		return;
	}
	
	public function editArtist($data){
		if($this->validateArtist($data)){
			//handle core artist data
			$sql  = "UPDATE artist SET ";
			$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
			$sql .= "rate = '".$data['reqnum_rate']."', ";
			$sql .= "website = '".$this->db->escape($data['url_website'])."', ";
			$sql .= "image = '".$data['img_image']."' ";
			$sql .= "WHERE artist_id = '".$data['id']."'";
			
			$this->db->query($sql);	
		}
		
		return;
	}
	
	public function getArtist($id){
		$sql = "SELECT * FROM artist WHERE artist_id = '".$id."'";

		$result = $this->db->query($sql);
		
		return $result->row;
	}




	private function validateArtist($data){
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
