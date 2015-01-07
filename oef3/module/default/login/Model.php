<?php
class loginModel extends Model{
	public function checkUser($username, $password){
		$sql  = "SELECT * FROM users ";
		$sql .= "WHERE email = '".$this->db->escape($username)."' ";
		$sql .= "AND password = MD5('".$this->db->escape($password)."')";
		
		return $this->db->query($sql);
	}
}