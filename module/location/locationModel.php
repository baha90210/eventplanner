<?php
class locationModel extends Model{
public function getLocations(){
	$sql = "SELECT * FROM location ORDER BY name ASC";
	$result = $this->db->query($sql);
	
	return $result->rows;
}

public function deleteLocation($id){
	$sql = "DELETE FROM location WHERE location_id = '".$this->db->escape($id)."'";
	$this->db->query($sql);
	
	return;
}

public function addLocation($data){
	$sql  = "INSERT INTO location SET ";
	$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
	$sql .= "address = '".$this->db->escape($data['req_address'])."', ";
	$sql .= "postcode = '".$this->db->escape($data['req_postcode'])."', ";
	$sql .= "plaats = '".$this->db->escape($data['req_plaats'])."', ";
	$sql .= "land = '".$this->db->escape($data['req_land'])."', ";
	$sql .= "rate = '".$data['reqnum_rate']."', ";
	$sql .= "capacity = '".$data['reqnum_capacity']."'";
	$this->db->query($sql);
	
	return;
}

public function editLocation($data){
	$sql  = "UPDATE location SET ";
	$sql .= "name = '".$this->db->escape($data['req_name'])."', ";
	$sql .= "address = '".$this->db->escape($data['req_address'])."', ";
	$sql .= "postcode = '".$this->db->escape($data['req_postcode'])."', ";
	$sql .= "plaats = '".$this->db->escape($data['req_plaats'])."', ";
	$sql .= "land = '".$this->db->escape($data['req_land'])."', ";
	$sql .= "rate = '".$data['reqnum_rate']."', ";
	$sql .= "capacity = '".$data['reqnum_capacity']."' ";
	$sql .= "WHERE location_id = '".$data['id']."'";
	$this->db->query($sql);
	
	return;
}

public function getLocation($id){
	$sql = "SELECT * FROM location WHERE location_id = '".$id."'";
	$result = $this->db->query($sql);
	
	return $result->row;
}

public function getUniqueLocationCities() {
    $sql = "SELECT DISTINCT(plaats) FROM location";
    $result = $this->db->query($sql);

    return $result->rows;
}

public function getLocationsByEvent($id) {
    $sql  = "SELECT L.* FROM location as L ";
    $sql .= "INNER JOIN event_location as E ";
    $sql .= "WHERE L.location_id = E.location_id ";
    $sql .= "AND E.event_id = ".$id.";";
    $result = $this->db->query($sql);

    return $result->rows;
}

}