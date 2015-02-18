<div>
	<?php $this->addScript('./themes/default/javascript/jquery/ajaxupload.js'); ?>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<table class="list">
		<tr>
			<td><?php echo $this->label_artist_name; ?></td>
			<td><input class="required" type="text" name="req_name" value="<?php echo $this->artist['name']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->label_artist_rate; ?></td>
			<td><input class="required" type="text" name="reqnum_rate" value="<?php echo $this->artist['rate']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->label_artist_website; ?></td>
			<td><input type="text" name="url_website" value="<?php echo $this->artist['website']; ?>" /></td>
		</tr>
		
		<?php if($this->artist['image']!='') : ?>		
			<tr>
				<td style="vertical-align:top;" ><?php echo $this->label_artist_current_image; ?></td>
				<td><img src="images/<?php echo $this->artist['image']; ?>" /></td>
				<input type="hidden" name="current_image" value="<?php echo $this->artist['image']; ?>" />
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><input type="checkbox" value="1" name="remove_image"/><?php echo $this->label_artist_remove_image; ?></td>
				<!-- when removing image from database it is not removed from file system yet 				so a solution for this is needed!
				-->
			</tr>
		<?php endif; ?>
		
		<tr>
			<td><?php echo $this->label_artist_new_image; ?></td>
			<td><input type="file" id="img_image" name="img_image" /><span style="color:#f00;">&nbsp;</span></td>
		</tr>
		<tr><td colspan="2"><input type="button" onclick="validate();" name="btnSubmit" value="<?php echo $this->label_artist_submit; ?>" /></td></tr>
		<tr><td colspan="2"><input type="button" name="btnBack" value="<?php echo $this->label_cancel; ?>" onclick="document.location.href='index.php?route=artist/overview&token=<?php echo $_GET['token']; ?>'" /></td></tr>
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
				$(this).parent().find('span').append(' <?php echo $this->label_artist_required_field; ?>');
				error = true;
			}
		});
		

		$('input[name^="reqnum"]').each(function(){
			
			if(isNaN($(this).val())){
				$(this).css('border', '1px solid #f00');
				$(this).parent().find('span').append(' <?php echo $this->label_artist_numeric_field; ?>');
				error = true;
			}
		});
		

	 //	Check file extension (just a simple check to help the user, not a real safety measure
		
		$('input[name^="img"]').each(function(){	
			fileName = $(this).val();

			if(fileName!=''){
				if(hasExtension(fileName, ['.jpg', '.JPG', '.gif', '.GIF', '.png', '.PNG'])) {				
				}	
				else {
					$(this).parent().find('span').append(' <?php echo $this->label_artist_wrong_filetype; ?>');
					error = true;
				}
			}
		});		
		
		if(!error){
			$('form').submit();
		}

	}

	//	function to help check the file extension

		function hasExtension(fileName, exts) {
    		return (new RegExp('(' + exts.join('|').replace(/\./g, '\\.') + ')$')).test(fileName);
		}

</script>







