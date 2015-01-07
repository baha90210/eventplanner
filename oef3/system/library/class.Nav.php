<?php
/**
 * Description of class
 * class voor de navigatie
 * @author bxck
 */
class Nav {
    function __construct($hyper,$ouder){
        echo'<ul id="menu">';
        echo "<li><a href='index.php'>Home</a></li>";
        echo "<li><a href='index.php?des'>Logout</a></li>";
        echo "<li><a href='index.php?manage'>Manage</a></li>";
        
    $this->build_menu($hyper,$ouder);    
    }
    public function build_menu($hyper,$ouder){
        
        $items = new datahandler;
        $itemarray = $items ->alleitemshalen($hyper,$ouder);
        if(is_array($itemarray)){
            foreach($itemarray as $item){
                extract($item, EXTR_PREFIX_ALL, "hoofd");
                echo "<li><a href='?CID=".$hoofd_cont_id."'>".$hoofd_naam."(".datahandler::countcontent($hoofd_id).")</a>";
                if($hoofd_folder != 0 ){
                    echo "<ul>";
                    $subitemarray = self::build_menu($hyper,$hoofd_id);
                    echo'</ul>';
                }
                echo '</li>';
            }
        }
    
        //HeFu::vardrop($itemarray[0]);
        echo'</ul>';
        ?>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#menu').slicknav({
                    prependTo:'#navigatie'
                });
            });
        </script>
        <?php
        //include 'templates/template.menu.php';
    }
    

}
