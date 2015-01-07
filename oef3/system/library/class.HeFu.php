<?php
/**
 *####Helpfuncties#### 
 * 
 *vardrop is een luxe var_dump
 * usage   HeFu::vardrop($data,false,true)
 * 
 *schrijf is een luxe echo 
 * usage   HeFu::schrijf($data,false,true)
 * 
 * ####################
 * @author B.X.C.Kooij
 **/

class HeFu {
    public function vardrop($data,$pre = true,$die = false){
        if($pre == true){echo '<pre>';}
        var_dump($data);
        if($pre == true){echo '</pre>';}
        if($die == true){die('Killed on request!');}
    }
    public function schrijf($data,$pre = true,$die = false){
        if($pre == true){echo '<pre>';}
        echo $data;
        if($pre == true){echo '</pre>';}
        if($die == true){die('Killed on request!');}
    }
}