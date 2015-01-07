<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Model
 *
 * @author Desktop
 */
class mainModel extends Model {
        // haal alle events uit event table
	public function buildMainmenu(){
		$sql = "SHOW TABLES";
		
		$result = $this->db->query($sql);
		
		return $result->rows;
	}
}
