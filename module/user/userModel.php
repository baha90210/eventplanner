<?php
class userModel extends Model{
    
    public function getUsers(){
        $sql = "SELECT * FROM users";
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function getUserGroups(){
        $sql  = "SELECT usergroup.name, usergroup.id, usergroup.description, ";
        $sql .= "grouprights.module, grouprights.edit, grouprights.view ";
        $sql .= "FROM usergroup LEFT JOIN grouprights ON usergroup.id = grouprights.group_id";
        //echo $sql; die;
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    
}
