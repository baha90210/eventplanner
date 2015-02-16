<?php
class loginModel extends Model{
public function checkUser($username, $password){
	$sql  = "SELECT * FROM users ";
	$sql .= "WHERE email = '".$this->db->escape($username)."' ";
	$sql .= "AND password = MD5('".$this->db->escape($password).":12345abc')";

	//echo $sql; die;
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
	}else
		return false;
}
	
	public function logout(){
		$sql = "UPDATE users SET token = '".MD5(uniqid())."' WHERE token = '".$_GET['token']."'";
		//token niet leegmaken ivm test op token bij editen gebruiker!!!
		$this->db->query($sql);
		
		return;
	}
	
	public function authorize($token){
		$sql  = "SELECT * FROM users ";
		$sql .= "WHERE token = '".$token."' ";
		$sql .= "AND date_last_logged_in > DATE_SUB(NOW(), INTERVAL 30 MINUTE)";
		
		$result = $this->db->query($sql);
		
		if($result->num_rows > 0){
			$sql = "UPDATE users SET date_last_logged_in = NOW() WHERE token = '".$token."'";
			$this->db->query($sql);
			
			return $result->row;
		}else{
			return false;
		}
	}
	
	public function getAuthorization($module, $token){
	    //toegang module? nodig: user_email, groepnaam, functie
	    $sql  = "SELECT gr.module, gr.edit, gr.view ";
	    $sql .= "FROM group_rights AS gr INNER JOIN (groups AS g INNER JOIN ";
	    $sql .= "(user_group AS ug INNER JOIN users AS u ON ug.user_email = u.email) ";
	    $sql .= "ON g.id = ug.group_id) ON gr.group_id = g.id ";
	    $sql .= "WHERE u.token = '".$token."' AND gr.module = '".$module."'";
	    $result = $this->db->query($sql);
	    return $result->row;
	}

	public function IsAdmin($token){
	    //check op user 'admin' ->voor autorisatiemodule
	    $sql  = "SELECT g.name ";
	    $sql .= "FROM users AS u INNER JOIN (groups AS g INNER JOIN ";
	    $sql .= "user_group AS ug ON g.id = ug.group_id) ON ";
	    $sql .= "u.email = ug.user_email ";
	    $sql .= "WHERE g.name = 'admin' AND u.token= '".$token."'";
	    //echo $sql;
	    $resultadmin = $this->db->query($sql);
	    return $resultadmin->row;
	}
	
	
	//class einde
}