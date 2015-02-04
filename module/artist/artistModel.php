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
	
	public function addArtist($data, $image){
		if($this->validateArtist($data) and $this->validateImage($image)){
			
			// adding timestamp to image filename or check for duplicate file names needed
			$sql  = "INSERT INTO artist SET ";
			$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
			$sql .= "rate = '".$data['reqnum_rate']."', ";
			$sql .= "website = '".$this->db->escape($data['url_website'])."', ";
			$sql .= "image = '".$image['img_image']['name']."'";
		
			$this->db->query($sql);
			
			if($image['img_image']['error']==0) $this->moveUploadedImage($image);			
		}
		
		
			
		return;
	}
	
	public function editArtist($data, $image){
		if($this->validateArtist($data) and $this->validateImage($image)){

			// adding timestamp to image filename or check for duplicate file names needed
  			$sql  = "UPDATE artist SET ";
			$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
			$sql .= "rate = '".$data['reqnum_rate']."', ";
			$sql .= "website = '".$this->db->escape($data['url_website'])."' ";
			// careful with comma after field website, only to show if image is changed
			if($image['img_image']['name']=='' and $data['remove_image']==1) $sql .= ", image = '' ";
			elseif($image['img_image']['name']!='') $sql .= ", image = '".$image['img_image']['name']."' ";
			$sql .= "WHERE artist_id = '".$data['id']."'";
			
			$this->db->query($sql);	


			if($image['img_image']['error']==0) $this->moveUploadedImage($image);			
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


	private function validateImage($image){
		if($image['img_image']['error']==0){
		//	echo '<br /><br />' . print_r($image);
			$filename = $image['img_image']['tmp_name'];
			$finfo=new finfo(FILEINFO_MIME_TYPE);
			$mime= explode('/', $finfo->file($filename));
			if($mime[0]!='image') return false;
			}
			
		return true;
		
		// it seems that getimagesize() would do as well
	}


	private function moveUploadedImage($image){
			move_uploaded_file ($image['img_image']['tmp_name'], 'images/'.$image['img_image']['name'] );	
			
			return;	
	}

}
