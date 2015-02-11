<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<title><?php echo $this->title; ?></title>
	<link rel="stylesheet" href="./themes/default/style/stylesheet.css" />
	<?php 
		foreach($this->scripts as $script){
			echo $script;
		}
	?>
	<?php 
		foreach($this->styles as $style){
			echo $style;
		}
	?>
        <script type="text/javascript" language="javascript">

$(function() {
    var language = '<?php echo $_GET['lang']; ?>';
    //we verstoppen de body ivbm vertraging ....haal maar weg als je het niet gelooft...lol
    $('body,html').hide();
    $.ajax({

        <?php
            //eerste deel van route pakken
            $module = explode('/',$_GET['route']);
            //pad naar xml maken
            $transfile = 'themes/default/'.$module[0].'_lang.xml';
            //als  het bestand bestaat als url: zetten voor ajax request
            if(file_exists($transfile)){ 
                echo " url: '".$transfile."',";
            } 
        ?>
        // ja???..geladen??...joepie!!!....zoeken en vertalen die bende!
        success: function(xml) {
            
            $(xml).find('translation').each(function(){
                
                var id = $(this).attr('id');
                
                var text = $(this).find(language).text();
                
                $("." + id).html(text);
                

           // if($(xml).find('translation')) {
 
           //     $(xml).each(function(){
                
           //     var id = $(this).attr('id');
                
           //     var text = $(this).find(language).text();
                
           //     $("." + id).html(text);
                
           //     }else{

           //     $("." + id).html();
                
           //     }
            });
        }
    });
    //als ajax klaar is met voetballen show die bende!!!
    $(document).ajaxComplete(function() {
        $('body,html').show();
    });
    
});
 
</script>
</head>
