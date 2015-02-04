<div>
	<?php if($this->error_msg != ''){ ?>
		<div class="error"><?php echo $this->error_msg; ?></div>	
	<?php } ?>
    <h1 class="text-muted">User login</h1>
    <hr/>
    <form method="post" action="index.php?route=login/login">
    	<div class="form-group">
    		<label for="emailField">Email address</label>
			<input type="email" class="form-control" id="emailField" name="username" placeholder="Enter email" 
			value = "<?php if( isset($_COOKIE['RememberMe']) && $_COOKIE['RememberMe']!='') echo ($_COOKIE['RememberMe']); ?>"
			required>
    	</div>

    	<div class="form-group">
    		<label for="passwordField">Email address</label>
			<input type="password" class="form-control" id="passwordField" name="password" placeholder="Enter password" required>
    	</div>
        <div class="checkbox">
        <label>
            <input type="checkbox" name="remember"> Remember Me
        </label>
        </div>
    	<button type="submit" class="btn btn-success">Login</button>
    </form>
</div>
