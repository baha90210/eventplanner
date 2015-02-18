<body>
	<div id="header">
	<?php if(isset($_GET['token'])) : ?>
	<div class="drop">
	    <ul>
	       <li style="float:right; color: white; margin: 8px 10px;"><?php echo (isset($this->aut_group))?$this->aut_group:$this->text_userlogin; ?>:&nbsp;<?php echo $this->user['email']; ?></li>
		</ul>
		
		<ul class="drop_menu">
			<?php if($this->IsAuthorized($_GET['token'],'event', 'view')){?>
    		<li><a href="index.php?route=event/overview&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_events; ?></a>
			    <ul>
    				<?php if($this->IsAuthorized($_GET['token'],'event', 'add')){?>
    				<li><a href="index.php?route=event/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_event; ?></a></li>
    				<?php } ?>
			    </ul>
			</li>
			<?php } ?>

			<?php if($this->IsAuthorized($_GET['token'],'artist', 'view')){?>
    		<li><a href="index.php?route=artist/overview&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_artists; ?></a>
			    <ul>
    				<?php if($this->IsAuthorized($_GET['token'],'artist', 'add')){?>
    				<li><a href="index.php?route=artist/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_artist; ?></a></li>
    				<?php } ?>
			    </ul>
    		</li>
			<?php } ?>
			
			<?php if($this->IsAuthorized($_GET['token'],'location', 'view')){?>
    		<li><a href="index.php?route=location/overview&event=&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_locations; ?></a>
			    <ul>
    				<?php if($this->IsAuthorized($_GET['token'],'location', 'add')){?>
    				<li><a href="index.php?route=location/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_location; ?></a></li>
    				<?php } ?>
			    </ul>
    		</li>
			<?php } ?>
			
			<?php if($this->IsAuthorized($_GET['token'],'resource', 'view')){?>
    		<li><a href="index.php?route=resource/overview&event=&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_resources; ?></a>
			    <ul>
    				<?php if($this->IsAuthorized($_GET['token'],'resource', 'add')){?>
    				<li><a href="index.php?route=resource/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_resource; ?></a></li>
    				<?php } ?>
			    </ul>
    		</li>
			<?php } ?>
			
			<?php if($this->IsAuthorized($_GET['token'],'performance', 'view')){?>
    		<li><a href="index.php?route=performance/overview&event=&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_performances; ?></a>
			    <ul>
    				<?php if($this->IsAuthorized($_GET['token'],'performance', 'add')){?>
    				<li><a href="index.php?route=performance/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_performance; ?></a></li>
    				<?php } ?>
			    </ul>
    		</li>
			<?php } ?>
			
			<?php if($this->IsAuthorized($_GET['token'],'user', 'view')){?>
    		<li><a href="#"><?php echo $this->menu_usermanagement; ?></a>
				<ul>
		          	<?php if($this->IsAuthorized($_GET['token'],'user', 'view')){?>
    				<li><a href="index.php?route=user/overview&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_manage_users; ?></a></li>
    				<?php } ?>
			        <?php if($this->IsAuthorized($_GET['token'],'user', 'edit')){?>
    				<li><a href="index.php?route=user/group&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_manage_groups; ?></a></li>
    				<?php } ?>
    				<?php if($this->IsAuthorized($_GET['token'],'user', 'add')){?>
    				<li><a href="index.php?route=user/add&token=<?php echo $_GET['token']; ?>"><?php echo $this->menu_add_user; ?></a></li>
    				<?php } ?>
				</ul>
			</li>
    		<?php } ?>
			
			<li><a href="index.php?route=login/logout&token=<?php echo $_GET['token'] ?>"><?php echo $this->menu_logout; ?></a>
			</li>
		</ul>
	</div>
	
	<?php endif; ?>
	</div>
	<div class="clear_all">&nbsp;</div>
	<h1><div><?php echo $this->title; ?></div></h1>
	<div id="container">
