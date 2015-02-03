<?php
class Model{
	public $db;
	
	public function __construct(){
		$this->db = new Db();
	}

	public function getMessageTextByKey($k)
	{
	    $sql = "SELECT text FROM message WHERE msg_key = '".$k."'";
	    $result = $this->db->query($sql);
	
	    return $result->row['text'];
	}
}
