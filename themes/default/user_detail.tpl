<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=user/edit&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<table class="list">
		<tr>
			<td><?php echo $this->label_email_user; ?>:</td>
			<td><input class="required" type="text" name="req_email" onclick="this.select()" value="<?php echo $this->user['email']; ?>" <?php echo $this->readonly; ?>/></td>
		</tr>
		<tr>
			<td><?php echo $this->label_password; ?>:</td>
			<td><input class="required" type="password" name="<?php echo ($this->passwordreq)?'req_':''; ?>password" onclick="this.select()" value="" autocomplete="off" /></td>
		</tr>
		<tr>
			<td><?php echo $this->label_preferred_language; ?>:</td>
			<td>
				<select name="language">
					<option value="">-- <?php echo $this->label_selectlanguage; ?> --</option>
					<?php foreach($this->languages as $key => $value){ //alle talen ?>
					<option value="<?php echo $value; ?>" <?php echo ($value == $this->user['language'])?'selected="selected"':''; ?>><?php echo $value; ?></option>
					<?php } ?>
				</select>
			</td>
			</tr>
		<tr>
			<td><?php echo $this->label_last_logged_in; ?>:</td>
			<td><?php echo $this->user['date_last_logged_in']; ?></td>
		</tr>
		<tr>
			<td><?php echo $this->label_token; ?>:</td>
			<td><?php echo $this->user['token']; ?><input type="hidden" name="token" value="<?php echo $this->user['token']; ?>"></td>
		</tr>
		<?php if(isset($this->usergroups)){
		    foreach($this->usergroups as $group){  //aan user gekoppelde groepen
		?>
		<tr>
			<td><?php echo $this->label_auth_group; ?>:</td>
			<td>
				<select name="a_groups[]">
					<option value="">-- <?php echo $this->label_selectgroup; ?> --</option>
					<?php foreach($this->groups as $aut_group){ //alle autorisatiegroepen?>
					<option value="<?php echo $aut_group['id'] ?>" <?php echo ($aut_group['id'] == $group['id'])?'selected="selected"':''; ?>><?php echo $aut_group['name'] ?></option>
					<?php } ?>
				</select> <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteGroup(this);" />
			</td>
		</tr>
		<?php } } ?>
		<tr class="groups_placeholder">
			<td colspan="2"><input type="button" name="addGrouphtml" value="<?php echo $this->btn_add_group; ?>" onclick="addGroup();" /></td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
		<tr><td><input type="button" onclick="validate();" name="btnSubmit" value="<?php echo $this->btn_save; ?>" /></td>
		<td><input type="button" name="btnBack" value="<?php echo $this->btn_cancel; ?>" onclick="document.location.href='index.php?route=user/overview&token=<?php echo $_GET['token']; ?>'" /></td></tr>
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
			
			if($(this).val() == '' || $(this).val() == '<email>') {
				$(this).css('border', '1px solid #f00');
				$(this).parent().find('span').append('   <?php echo $this->label_required_field; ?>!');
				error = true;
			}
		});
		var btnSubmit='<?php echo $this->btn_save; ?>';
		if(!error){
			$('form').submit();
		}
	}
	function addGroup(){
		html = '';
		
		html += '<tr>';
		html += '<td><?php echo $this->label_auth_group; ?>:</td>';
		html += '<td>';
		html += '<select name="a_groups[]">';
		html += '<option value="">-- <?php echo $this->label_selectgroup; ?> --</option>';
		<?php foreach($this->groups as $aut_group){ ?>
		html += '<option value="<?php echo $aut_group['id'] ?>"><?php echo $aut_group['name'] ?></option>';
		<?php } ?>
		html += '</select>';
		html += '  <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteGroup(this);" />';
		html += '</td>';
		html += '</tr>';

		$('.groups_placeholder').before(html);
	}

	function deleteGroup(group){
		$(group).parent().parent().remove();
	}	
	
</script>














