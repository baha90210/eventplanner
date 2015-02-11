<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<table class="list">
		<tr>
			<td>Naam Resource:</td>
			<td><input class="required" type="text" name="req_name" value="<?php echo $this->resource['name']; ?>" /></td>
		</tr>
		<tr>
			<td>prijs:</td>
			<td><input class="required" type="text" name="reqnum_rate" value="<?php echo $this->resource['rate']; ?>" /></td>
		</tr>
		<tr>
			<td>omschrijving:</td>
			<td><input class="required" type="text" name="description" value="<?php echo $this->resource['description']; ?>" /></td>
		</tr>
		<tr><td colspan="2"><input type="button" onclick="validate();" name="btnSubmit" value="Opslaan" /></td></tr>
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
		//$('form').submit();

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
			$('input[name="reqnum_rate"]').css('border', '1px solid #f00');
			$('input[name="reqnum_rate"]').parent().find('span').append('   Dit moet een getal zijn!');
			error = true;
		}

		if(!error){
			$('form').submit();
		}
	}
	
</script>





