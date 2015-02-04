<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=user/edit&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<table class="list">
		<tr>
			<td>E-mail gebruiker:</td>
			<td><input class="required" type="text" name="req_email" value="<?php echo $this->user['email']; ?>" <?php echo $this->readonly; ?>/></td>
		</tr>
		<tr>
			<td>Password:</td>
			<td><input class="required" type="password" name="req_password" value="<?php echo $this->user['password']; ?>" /></td>
		</tr>
		<tr>
			<td>Laatste login:</td>
			<td><?php echo $this->user['date_last_logged_in']; ?></td>
		</tr>
		<tr>
			<td>Token:</td>
			<td><?php echo $this->user['token']; ?></td>
		</tr>
		<tr><td colspan="2"><input type="button" onclick="validate();" name="btnSubmit" value="Opslaan" /></td></tr>
		<tr><td colspan="2"><input type="button" name="btnBack" value="Annuleren" onclick="document.location.href='index.php?route=user/overview&token=<?php echo $_GET['token']; ?>'" /></td></tr>
	</table>
	</form>
</div>


<script>
	$(document).ready(function(){
		$('input[name^="req"]').each(function(){
			$(this).after('<span>*</span>');
		});
	});
	
	function validate(){
		error = false;
		//alert('validatie');
		
	   	$('input[name^="req"]').each(function(){
			$(this).parent().find('span').html('*');
			
			if($(this).val() == ''){
				$(this).css('border', '1px solid #f00');
				$(this).parent().find('span').append('   Dit veld is verplicht!');
				error = true;
			}
		});
		var btnSubmit='Opslaan';
		if(!error){
			$('form').submit();
		}
	}

</script>














