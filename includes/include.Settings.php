<?php

/* 
 * 
 * define de DOCUMENTROOT
 * define de DB_HOST,DB_USER,DB_PASS en DB_NAME
 * 
 */
//Defines hier
define('DOCUMENTROOT',$_SERVER['DOCUMENT_ROOT']);
define('BASEFOLDER','/netprojects/eduvisionmasterclass/');
define('DB_HOST','');
define('DB_USER','');
define('DB_PASS','');
define('DB_NAME','');

            //AUTOLOADER//
//classes automatisch ophalen uit de classes map
function __autoload($class_name)
{
    if (file_exists(DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php"))
    {
        require_once DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php";
    }
}

