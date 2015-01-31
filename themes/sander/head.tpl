<html>
<head>
	<title><?php echo $this->title; ?></title>
        <link rel="stylesheet" href="./themes/sander/bootstrap-3.3.2-dist/css/bootstrap.min.css" />
	<?php 
		foreach($this->scripts as $script){
			echo $script;
		}
	?>
</head>