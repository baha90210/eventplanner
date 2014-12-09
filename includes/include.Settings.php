<?php

/* 
 * 
 * define de DOCUMENTROOT
 * define de DB_HOST,DB_USER,DB_PASS en DB_NAME
 * 
 */
//Defines hier
define('DOCUMENTROOT',$_SERVER['DOCUMENT_ROOT']);
define('BASEFOLDER','');
//instellen van servermap en DB credentials per persoon een case toevoegen

//boudewijns test server instelling
switch($_SERVER['REMOTE_ADDR']){
            case "195.35.240.142" :
                        define('BASEFOLDER','/netprojects/eduvisionmasterclass/');
                        define('DB_HOST','localhost');
                        define('DB_USER','boudewijn_main');
                        define('DB_PASS','');
                        define('DB_NAME','boudewijn_OOP');
                        break;
            default :
                        define('BASEFOLDER','');
                        define('DB_HOST','localhost');
                        define('DB_USER','');
                        define('DB_PASS','');
                        define('DB_NAME','');
                        break;
                        
            //AUTOLOADER//
//classes automatisch ophalen uit de classes map
function __autoload($class_name)
{
    if (file_exists(DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php"))
    {
        require_once DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php";
    }
}

