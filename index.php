<?php
            //AUTOLOADER//
//alle classes includen uit de classes map

require('includes/include.Settings.php');
function __autoload($class_name)
{
    if (file_exists(DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php"))
    {
        require_once DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php";
    }
}
echo "Hello classmates";
?>

