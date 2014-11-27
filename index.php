<?php
            //AUTOLOADER//
//alle classes includen uit de classes map
//todo: define de DOCUMENTROOT en BASEFOLDER
//todo: classes map maken en classes er in zetten

function __autoload($class_name)
{
    if (file_exists(DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php"))
    {
        require_once DOCUMENTROOT.BASEFOLDER."classes/class.$class_name.php";
    }
}
echo "Hello classmates";
?>

