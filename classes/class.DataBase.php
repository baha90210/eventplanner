<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 * Description of class
 *
 * @author BXCK
 */
class DataBase {
    	function __construct($database, $username, $password, $hostname='localhost', $port=3306){
            $this->database = $database;
            $this->username = $username;
            $this->password = $password;
            $this->hostname = $hostname.':'.$port;
            $this->Connect();
        }
        //connection sluiten
        function __destruct(){
            $this->closeConnection();
        }
        private function Connect(){
            $this->CloseConnection();
            if($persistant){
                $this->databaseLink = mysql_pconnect($this->hostname, $this->username, $this->password);
            }else{
                $this->databaseLink = mysql_connect($this->hostname, $this->username, $this->password);
            }
            if(!$this->databaseLink){
                $this->lastError = 'Could not connect to server: ' . mysql_error($this->databaseLink);
            return false;
            }
            if(!$this->UseDB()){
                $this->lastError = 'Could not connect to database: ' . mysql_error($this->databaseLink);
            return false;
            }ww
            $this->setCharset(); // TODO: geforseerde charset weg halen kweet nie hoe kweet nie hoe hahaha
            return true;
        }
        
}
