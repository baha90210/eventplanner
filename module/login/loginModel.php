<?php
class loginModel extends Model{
	public function checkUser($username, $password){
		$sql  = "SELECT * FROM users ";
		$sql .= "WHERE email = '".$this->db->escape($username)."' ";
		$sql .= "AND password = MD5('".$this->db->escape($password).":12345abc')";
		
		$user = $this->db->query($sql);

		if($user->num_rows == 1){
			$token = MD5(uniqid());
			
			$sql  = "UPDATE users SET ";
			$sql .= "date_last_logged_in = NOW(), ";
			$sql .= "token = '".$token."' ";
			//$sql .= "token = UUID() ";
			$sql .= "WHERE email = '".$this->db->escape($username)."'";
			
			$this->db->query($sql);
			
			$user->row['token'] = $token;
			
			return $user->row;
		}else{
			return false;
		}
	}
	
	public function logout(){
		$sql = "UPDATE users SET token = '' WHERE token = '".$_GET['token']."'";
		
		$this->db->query($sql);
		
		return;
	}
	
	public function authorize($token){
		$sql  = "SELECT * FROM users ";
		$sql .= "WHERE token = '".$token."' ";
		$sql .= "AND date_last_logged_in > DATE_SUB(NOW(), INTERVAL 15 MINUTE)";
		
		$result = $this->db->query($sql);
		
		if($result->num_rows > 0){
			$sql = "UPDATE users SET date_last_logged_in = NOW() WHERE token = '".$token."'";
			$this->db->query($sql);
			
			return $result->row;
		}else{
			return false;
		}
	}
}