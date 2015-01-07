<?php
function my_autoload($className){
    include('./system/library/'.strtolower($className).'.php');
}
spl_autoload_register('my_autoload');
