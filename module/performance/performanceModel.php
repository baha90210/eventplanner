<?php
class performanceModel extends Model{
	
public function getPerformances()
{
    $sql = "SELECT performance_id, performance_title, t1.event_id, event.name AS eventname, artist.artist_id artist_id, artist.name AS artistname, t1.date_from, t1.date_until, confirmed ";
    $sql .= "FROM performance AS t1 ";
    $sql .= "INNER JOIN artist ON artist.artist_id = t1.artist_id ";
    $sql .= "INNER JOIN event ON event.event_id = t1.event_id ";
    if (isset($_GET['event']) && $_GET['event']!=='') $sql .= "WHERE t1.event_id='".$_GET['event']."' ";
    if (isset($_GET['artist']) && $_GET['artist']!=='') $sql .= "WHERE t1.artist_id='".$_GET['artist']."' ";
    $sql .= "ORDER BY date_from ASC";

    $result = $this->db->query($sql);

    return $result->rows;
}

public function deletePerformance($id){
        $sql = "DELETE FROM performance WHERE performance_id = '".$this->db->escape($id)."'";
        $this->db->query($sql);
        return;
}
	
public function addPerformance($data){
    if($this->validatePerformance($data))
    {
        $sql  = "INSERT INTO performance SET ";
        $sql .= "performance_title = '".$this->db->escape($data['req_perfname'])."', ";
        $sql .= "event_id = '".$data['req_eventid']."', ";
        $sql .= "artist_id = '".$data['req_artistid']."', ";
        $sql .= "date_from = '".$data['req_date_from']."', ";
        $sql .= "date_until = '".$data['req_date_until']."', ";
        $sql .= "confirmed = '".$data['confirmed']."'";

        $this->db->query($sql);
    }
    return;
}
	
public function editPerformance($data){
    if($this->validatePerformance($data))
    {
        $sql  = "UPDATE performance SET ";
        $sql .= "performance_title = '".$this->db->escape($data['req_perfname'])."', ";
        $sql .= "event_id = '".$data['req_eventid']."', ";
        $sql .= "artist_id = '".$data['req_artistid']."', ";
        $sql .= "date_from = '".$data['req_date_from']."', ";
        $sql .= "date_until = '".$data['req_date_until']."', ";
        $sql .= "confirmed = '".$data['confirmed']."' ";
        $sql .= "WHERE performance_id = '".$data['id']."'";

        $this->db->query($sql);		
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