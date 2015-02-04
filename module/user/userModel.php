<?php
class userModel extends Model{
    public function addUser($email, $password){
        $sql  = "INSERT INTO users ";
        $sql .= "(email, password, date_last_logged_in, token) ";
        $sql .= "VALUES ('".$this->db->escape($email)."', MD5('".$this->db->escape($password).":12345abc'), ";
        $sql .= "'00-00-00', 0)";
        //echo $sql; die;
        $this->db->query($sql);
        return;
    }
    
    public function updateUser($email, $password){
        $sql  = "UPDATE users ";
        $sql .= "SET email='".$email."', ";
        $sql .= "password= MD5('".$this->db->escape($password).":12345abc') ";
        $sql .= "WHERE email='".$email."'";
        $this->db->query($sql);
        return;
        
    }
    
    public function getUser($email){
        $sql  = "SELECT * FROM users ";
        $sql .= "WHERE email = '".$email."'";
        $result = $this->db->query($sql);
        return $result->row;
    }
    
    public function getUsers(){
        $sql = "SELECT * FROM users";
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function getUserGroups(){
        $sql  = "SELECT * FROM groups ORDER BY name";
        //echo $sql; die;
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function getUserGroupsRights(){
        //let op: tabel met groepen kan geen 'group' heten ivm het statement GROUP in SQL :)
        $sql  = "SELECT g.name, g.id, g.description, ";
        $sql .= "gr.module, gr.edit, gr.view ";
        $sql .= "FROM groups g JOIN group_rights gr ON g.id = gr.group_id ";
        $sql .= "ORDER BY g.id";
        //echo $sql; die;
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function deleteGroupRights(){
        $sql = "DELETE FROM group_rights";
        $this->db->query($sql);
        return;
    }
    
    public function deleteGroupModule($groupid, $module){
        $sql  = "DELETE FROM group_rights ";
        $sql .= "WHERE group_id=".$groupid." ";
        $sql .= "AND module='".$module."'";
        $this->db->query($sql);
        return;
    }
    
    public function setGroupRights($data){        
        $sql  = "INSERT INTO group_rights ";
        $sql .= "(group_id, module, edit, view) ";
        $sql .= "VALUES ".$data;
        //echo $sql;
        $this->db->query($sql);
        return;
    }
    
    public function addGroup($name, $description){
        $sql  = "INSERT INTO groups ";
        $sql .= "(name, description) ";
        $sql .= "VALUES ('".$this->db->escape($name)."', '".$this->db->escape($description)."')";
        //echo $sql;die;
        $this->db->query($sql);
        return;
        
    }
    
    public function addGroupModule($groupid, $module, $edit, $view){
        $sql  = "INSERT INTO group_rights ";
        $sql .= "(group_id, module, edit, view) ";
        $sql .= "VALUES (".$this->db->escape($groupid).", '".$this->db->escape($module)."', $edit, $view)";
        //echo $sql;die;
        $this->db->query($sql);
        return;
    }
    
    public function getGroupsNoRights(){
        $sql  = "SELECT g.name ";
        $sql .= "FROM groups g ";
        $sql .= "LEFT JOIN group_rights gr ON gr.group_id = g.id ";
        $sql .= "WHERE gr.group_id IS NULL";
        //echo $sql;
        $result = $this->db->query($sql);
        return $result->rows;
            }
}
