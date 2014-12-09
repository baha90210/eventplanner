<?php
/**
 * Description of class
 * 
 * load nodige settings en prut
 * 
 * !!!!!!!!!!!!!!WAARSCHUWING!!!!!!!!!!!!!!!!!!!!!!
 * !!!!!!dit bestand staat publiek op github!!!!!!!
 * !!!!!!Maak een veilig user aan voor je DB!!!!!!!
 * !!!!!!DB op LOCALHOST toegang only zetten!!!!!!!
 * 
 * @author Boudewijn Xander Cornelis Kooij
 */
class LoadSettings {
    //put your code here
    function __construct(){
        
        //instellen van servermap en DB credentials 
        //je eigen case toevoegen

       switch($_SERVER['SERVER_ADDR']){
           //server instelling BXCK
           case "94.103.150.247" : //verander je servers ip adres 
                define('SERVEROWNER', 'boudewijn');
                define('DB_HOST','localhost');
                define('DB_USER','boudewijn_EDU');
                define('DB_PASS','edu1234');
                define('DB_NAME','boudewijn_OOP');
                break;
           //default server instelling
           default :
               define('SERVEROWNER', 'No Server Defined!');        
               define('DB_HOST','localhost');
               define('DB_USER','');
               define('DB_PASS','');
               define('DB_NAME','');
               break;
       }          
    }
}
