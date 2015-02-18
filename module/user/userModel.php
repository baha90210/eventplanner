<?php
class userModel extends Model{

    public function addUser($data){
        $sql  = "INSERT INTO users ";
        $sql .= "(email, password, date_last_logged_in, token, language) ";
        $sql .= "VALUES ('".$this->db->escape($data['req_email'])."', ";
        $sql .= "MD5('".$this->db->escape($data['req_password']).":12345abc'), ";
        $sql .= "'00-00-00', ".MD5(uniqid()).", '".$this->db->escape($data['language'])."')";
        //echo $sql; die;
        $this->db->query($sql);
        
        //handle groups
        if(isset($data['a_groups'])){
    		foreach($data['a_groups'] as $k=>$v){
    			if($v != ''){
    				$sql = "INSERT IGNORE INTO user_group SET ";
    				$sql .= "user_email = '".$this->db->escape($data['req_email'])."', ";
    				$sql .= "group_id = '".$v."'";
    				$this->db->query($sql);
    			}
    		}
        }
        
        return;
    }
    
    public function updateUser($data){
        $sql  = "UPDATE users ";
        $sql .= "SET ";
        if($data['password']!=''){
            $sql .= "password = MD5('".$this->db->escape($data['password']).":12345abc'), ";
        }
        $sql .= "language = '".$this->db->escape($data['language'])."' ";
        $sql .= "WHERE email='".$data['req_email']."'";
        $this->db->query($sql);
        
        //handle groups
        $sql = "DELETE FROM user_group WHERE user_email = '".$data['req_email']."'";
		$this->db->query($sql);
        
        if(isset($data['a_groups'])){
   			foreach($data['a_groups'] as $k=>$v){
				if($v != ''){
					$sql = "INSERT IGNORE INTO user_group SET ";
					$sql .= "user_email = '".$data['req_email']."', ";
					$sql .= "group_id = '".$v."'";

					$this->db->query($sql);
				}
			}
		}
           
        return;
        
    }
    
    public function deleteUser($email){
        $sql  = "DELETE FROM users ";
        $sql .= "WHERE email='".$email."'";
        $this->db->query($sql);
        
        $sql  = "DELETE FROM user_group ";
        $sql .= "WHERE user_email='".$email."'";
        $this->db->query($sql);
    }
    
    public function getUser($email){
        $sql  = "SELECT * FROM users ";
        $sql .= "WHERE email = '".$email."'";
        $result = $this->db->query($sql);
        return $result->row;
    }
    
    public function getUsers(){
        $sql  = "SELECT u.email, u.password, u.token, u.date_last_logged_in, u.language, g.id, g.name ";
        $sql .= "FROM users u ";
        $sql .= "LEFT JOIN user_group ug ON u.email = ug.user_email "; //LEFT JOIN omdat je alle users wilt zien
        $sql .= "LEFT JOIN groups g ON ug.group_id = g.id ";           //LEFT JOIN hier herhalen
        $sql .= "ORDER BY u.email";                                    //ORDER BY nodig voor juiste weergave overview 
        //echo $sql;
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function getUserGroups(){
        $sql  = "SELECT * FROM groups ORDER BY name";
        //echo $sql; die;
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function getUserGroupsUser($email){
        $sql  = "SELECT g.name, g.id FROM groups g ";
        $sql .= "INNER JOIN user_group ug ";
        $sql .= "ON g.id = ug.group_id ";
        $sql .= "WHERE ug.user_email = '".$email."' ";
        $sql .= "ORDER BY g.name";
        //echo $sql; die;
        $result = $this->db->query($sql);
        return $result->rows;
        
    }
    
    public function getUserGroupsRights(){
        //let op: tabel met groepen kan geen 'group' heten ivm het statement GROUP in SQL :)
        $sql  = "SELECT g.name, g.id, g.description, ";
        $sql .= "gr.module, gr.edit, gr.view ";
        $sql .= "FROM groups g INNER JOIN group_rights gr ON g.id = gr.group_id ";
        $sql .= "ORDER BY g.name";
        //echo $sql; die;
        $result = $this->db->query($sql);
        return $result->rows;
    }
    
    public function deleteGroup($groupid){
        //group verwijderen uit groups maar ook uit user_group en group_rights tabellen!!
        //in afzonderlijke sql-statements gedaan ivm overzichtelijkheid
        $sql  = "DELETE FROM group_rights ";
        $sql .= "WHERE group_id = ".$groupid;
        $this->db->query($sql);
        
        $sql  = "DELETE FROM user_group ";
        $sql .= "WHERE group_id = ".$groupid;
        $this->db->query($sql);
        
        $sql  = "DELETE FROM groups ";
        $sql .= "WHERE id = ".$groupid;
        $this->db->query($sql);
        return;
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
        $sql  = "SELECT g.id, g.name ";
        $sql .= "FROM groups g ";
        $sql .= "LEFT JOIN group_rights gr ON gr.group_id = g.id ";
        $sql .= "WHERE gr.group_id IS NULL";
        //echo $sql;
        $result = $this->db->query($sql);
        return $result->rows;
    }
}

