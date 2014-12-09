<?php
/**
 *  Root defines en Class Autoloader functie
 * 
 *
 * @author Boudewijn Xander Cornelis Kooij
 */
define('BASEFOLDER','/netprojects/eduvisionmasterclass/');
define('DOCUMENTROOT',$_SERVER['DOCUMENT_ROOT']);
                //AUTOLOADER//
//classes automatisch ophalen uit de classes map
function __autoload($class_name)
{
    if (file_exists(DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php"))
    {
        require_once DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php";
    }
}
// server settings worden gedaan in de construct van LoadSettings
new LoadSettings;
