<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
				<td>User</td>
				<td>Laatste login</td>
				<td colspan="2"></td>
			</tr>
		</thead>
		<?php foreach($this->users as $user){ ?>
			<tr>
				<td><?php echo $user['email']; ?></td>
				<td><?php echo $user['date_last_logged_in']; ?></td>
				<td><a href="index.php?route=user/edit&email=<?php echo $user['email'] ?>&token=<?php echo $_GET['token'] ?>">Edit</a></td>
				<td><a href="index.php?route=user/delete&email=<?php echo $user['email'] ?>&token=<?php echo $_GET['token'] ?>">Delete</a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="5"><input type="button" onclick="addUser();" value="User toevoegen" /></td></tr>
	</table>
</div>

<script>
	function addUser(){
		document.location.href='index.php?route=user/add&token=<?php echo $_GET['token'] ?>';
	}
</script>