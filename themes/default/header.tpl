<body>
	<div id="header">
	<?php if(isset($_GET['token'])) : ?>
		<ul class="menu">
			<li>
				<a href="index.php?route=event/overview&token=<?php echo $_GET['token'] ?>">
					Events
				</a>
			</li>
			<li>
				<a href="index.php?route=artist/overview&token=<?php echo $_GET['token'] ?>">
					Artists
				</a>
			</li>
			<li>
				<a href="index.php?route=login/logout&token=<?php echo $_GET['token'] ?>">
					Log Out
				</a>
			</li>
		</ul>
	<?php endif; ?>
	</div>
	<div class="clear_all">&nbsp;</div>
	<h1><?php echo $this->title; ?></h1>
	<div id="container">
