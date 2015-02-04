<html>
<head>
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
</head>