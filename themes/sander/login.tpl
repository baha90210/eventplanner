<div>
	<?php if($this->error_msg != ''){ ?>
		<div class="error"><?php echo $this->error_msg; ?></div>	
	<?php } ?>
    <h1 class="text-muted">User login</h1>
    <hr/>
    <form method="post" action="index.php?route=login/login">
    	<div class="form-group">
    		<label for="emailField">Email address</label>
			<input type="email" class="form-control" id="emailField" name="username" placeholder="Enter email" required>
    	</div>

    	<div class="form-group">
    		<label for="passwordField">Email address</label>
			<input type="password" class="form-control" id="passwordField" name="password" placeholder="Enter password" required>
    	</div>

    	<button type="submit" class="btn btn-success">Login</button>
    </form>
</div>
