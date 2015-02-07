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
		$sql = "UPDATE users SET token = '' WHERE token = '".$_GET['token']."'";
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
	//SELECT users.token, group_rights.module, group_rights.edit, group_rights.view
    //FROM group_rights INNER JOIN (groups INNER JOIN (user_group INNER JOIN users ON user_group.email = users.email) ON groups.Id = user_group.group_id) ON group_rights.group_id = groups.Id
    //WHERE (((users.token)=493758333));
	
	
	
	//class einde
}