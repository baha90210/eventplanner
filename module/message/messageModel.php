<?php
class messageModel extends Model{
	
public function getMessages()
{
    $sql = "SELECT * FROM message ORDER BY text ASC";
    $result = $this->db->query($sql);

    return $result->rows;
}

public function deleteMessage($id){
        $sql = "DELETE FROM message WHERE id = '".$this->db->escape($id)."'";
        $this->db->query($sql);
        
        return;
}
	
public function addMessage($data){
    if($this->validatePerformance($data))
    {
        $sql  = "INSERT INTO message SET ";
        $sql .= "text = '".$this->db->escape($data['req_text'])."', ";
        $sql .= "msg_key = '".$data['req_key']."', ";
        $sql .= "language = '".$data['language']."'";
        $this->db->query($sql);
    }
    return;
}
	
public function editMessage($data){
    if($this->validatePerformance($data))
    {
        $sql  = "UPDATE message SET ";
        $sql .= "text = '".$this->db->escape($data['req_text'])."', ";
        $sql .= "language = '".$data['language']."', ";
        $sql .= "msg_key = '".$data['req_key']."' ";
        $sql .= "WHERE id = '".$data['id']."';";
        $this->db->query($sql);		
    }		
    return;
}
	
public function getMessage($id)
{
    $sql = "SELECT * FROM message WHERE id = '".$id."'";
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