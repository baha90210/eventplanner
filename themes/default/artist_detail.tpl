<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<table class="list">
		<tr>
			<td>Naam artist:</td>
			<td><input class="required" type="text" name="req_name" value="<?php echo $this->artist['name']; ?>" /></td>
		</tr>
		<tr>
			<td>Prijs:</td>
			<td><input class="required" type="text" name="reqnum_rate" value="<?php echo $this->artist['rate']; ?>" /></td>
		</tr>
		<tr>
			<td>Website:</td>
			<td><input type="text" name="url_website" value="<?php echo $this->artist['website']; ?>" /></td>
		</tr>
		<tr>
			<td>Afbeelding:</td>
			<td><input type="text" name="img_image" value="<?php echo $this->artist['image']; ?>" /></td>
		</tr>
		<tr><td colspan="2"><input type="button" onclick="validate();" name="btnSubmit" value="Opslaan" /></td></tr>
		<tr><td colspan="2"><input type="button" name="btnBack" value="Annuleren" onclick="document.location.href='index.php?route=artist/overview&token=<?php echo $_GET['token']; ?>'" /></td></tr>
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
		
		$('input[name^="req"]').each(function(){
			$(this).parent().find('span').html('*');
			
			if($(this).val() == ''){
				$(this).css('border', '1px solid #f00');
				$(this).parent().find('span').append('   Dit veld is verplicht!');
				error = true;
			}
		});
		
		if(isNaN($('input[name^="reqnum"]').val())){
			$('input[name="req_rate"]').css('border', '1px solid #f00');
			$('input[name="req_rate"]').parent().find('span').append('   Dit moet een getal zijn!');
			error = true;
		}

		if(!error){
			$('form').submit();
		}
	}

</script>














