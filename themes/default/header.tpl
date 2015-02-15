<body>
	<div id="header">
	<?php if(isset($_GET['token'])) : ?>
	<div class="drop">
	    <ul>
	       <li style="float:right; color: white; margin: 8px 10px;"><?php echo $this->text_userlogin; ?>&nbsp;<?php echo $this->user['email']; ?></li>
		</ul>
		
		<ul class="drop_menu">
			<li><a href="index.php?route=event/overview&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_events; ?></a></li>
			<li><a href="index.php?route=artist/overview&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_artists; ?></a></li>
			<li><a href="index.php?route=location/overview&event=&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_locations; ?></a></li>
			<li><a href="index.php?route=resource/overview&event=&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_resources; ?></a></li>
			<li><a href="index.php?route=performance/overview&event=&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_performances; ?></a></li>
			<li><a href="#"><?php echo $this->menu_usermanagement; ?></a>
				<ul>
    				<li><a href="index.php?route=user/overview&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_manage_users; ?></a></li>
    				<li><a href="index.php?route=user/group&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_manage_groups; ?></a></li>
    				<li><a href="index.php?route=user/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_user; ?></a></li>
				</ul>
			</li>
			<li><a href="index.php?route=login/logout&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_logout; ?></a>
			</li>
		</ul>
	</div>
	
	<?php endif; ?>
	</div>
	<div class="clear_all">&nbsp;</div>
	<h1><?php echo $this->title; ?></h1>
	<div id="container">
