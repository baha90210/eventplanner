<body>
<div class="row col-md-12">&nbsp;</div>
<div class="row">
    <div class="col-md-1">&nbsp;</div>
    <div class="col-md-10" id="container">
        <div id="navigation" role="navigation" >
            <?php if(isset($_GET['token'])) : ?>
            <ul class="nav nav-tabs">
                <li role="presentation">
                    <a href="index.php?route=event/overview&token=<?php echo $_GET['token'] ?>"> Events</a>
                </li>
                <li role="presentation">
                    <a href="index.php?route=artist/overview&token=<?php echo $_GET['token'] ?>">Artists</a>
                </li>
                <li role="presentation">
                    <a href="index.php?route=location/overview&event=&token=<?php echo $_GET['token'] ?>">Locations </a>
                </li>
                <li role="presentation">
                    <a href="index.php?route=performance/overview&event=&token=<?php echo $_GET['token'] ?>">Performances</a>
                </li>
                <li role="presentation" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
                        Users <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li role="presentation"><a href='index.php?route=user/user&token=<?php echo $_GET['token']; ?>'>Beheer Users</a></li>
			<li role="presentation"><a href='index.php?route=user/group&token=<?php echo $_GET['token']; ?>'>Beheer Groepen</a></li>
                    </ul>              
                </li>
                <li role="presentation">
                    <a href="index.php?route=message/overview&event=&token=<?php echo $_GET['token'] ?>">Messages</a>
                </li>
                <li role="presentation">
                    <a href="index.php?route=login/logout&token=<?php echo $_GET['token'] ?>">Log Out</a>
                </li>
            </ul>
            <?php endif; ?>
        </div>
        <div>
