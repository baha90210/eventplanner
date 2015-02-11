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
		
		<?php if($this->artist['image']!='') : ?>		
			<tr>
				<td style="vertical-align:top;" >Huidige afbeelding:</td>
				<td><img style="max-width:150px;max-height:150px;" src="images/<?php echo $this->artist['image']; ?>" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="checkbox" value="1" name="remove_image"/> Afbeelding verwijderen</td>
				<!-- when removing image from database it is not removed from file system yet 				so a solution for this is needed!
				-->
			</tr>
		<?php endif; ?>
		
		<tr>
			<td>Nieuwe afbeelding:</td>
			<td><input type="file" id="img_image" name="img_image" /></td>
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


/* 	//	Need to solve: unchecked checkbox issue
   
    	for(var i=0;i<cb.length;i++){ 
    	    if(cb[i].type=='checkbox' && !cb[i].checked)  // if this is an unchecked checkbox
    	    {
    	       cb[i].value = 0; // set the value to "off"
    	       cb[i].checked = true; // make sure it submits
    	    }else{
      	       //cb[i].value = 1; // set the value to "off"
    	       //cb[i].checked = true; // make sure it submits
    	    }
    	}
*/



	/* //	Need to check: file extension (just a simple check to help the user, not a real safety measure
	
		$('input[name^="img"]').each(function(){	
			fileName = $(this).val();
			if (!hasExtension(fileName, ['.jpg', '.gif', '.png'])) {
				$(this).parent().find('span').append('   Dit type bestand is niet toegestaan !');
				error = true;
			}	
		});
	*/	
		
		if(!error){
			$('form').submit();
		}


	}

/*	//	function to help check the file extension

		function hasExtension(fileName, exts) {
    		return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
		}
*/
</script>







