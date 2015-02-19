<div>
	<?php if($this->error_msg != ''){ ?>
		<div class="error"><?php echo $this->error_msg; ?></div>	
	<?php } ?>
	<form method="post" action="index.php?route=login/login">
		<table>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="username" 
				value = "<?php if( isset($_COOKIE['Username']) && $_COOKIE['Username']!='') echo ($_COOKIE['Username']); ?>" required></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" value="" required></td>
			</tr>
            <tr>
				<td colspan="2"><input type="checkbox" value="0" <?php if( isset($_COOKIE['RememberMe']) && $_COOKIE['RememberMe']!='') echo 'checked'; ?> name="remember"> Remember Me</td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" name="submit" value="Inloggen" />
				</td>
			</tr>		
		</table>
	</form>
</div>