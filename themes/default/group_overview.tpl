<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="rights_frm" id="rights_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">
	<table class="list">
		<thead class='theader'>
		      <tr><td colspan = "2">&nbsp;</td>
		      <td colspan="2" align="center"><?php echo $this->label_rights; ?></td>
		      <td>&nbsp;</td>
			<tr>
				<td><?php echo $this->label_group; ?></td>
				<td><?php echo $this->label_module; ?></td>
				<td align="center"><?php echo $this->label_edit; ?></td>
				<td align="center"><?php echo $this->label_view; ?></td>
				<td align="center"><?php echo $this->label_delete_group; ?></td>
			</tr>
		</thead>
		
		<?php if($this->grouprights){foreach($this->grouprights as $groupright){ ?>
			<tr>
				<td><?php echo $groupright['name']; ?><small> (<?php echo $groupright['description']; ?>)</small></td>
				<td><input type="text" name="group[<?php echo $groupright['id'] ?>][<?php echo $groupright['module']; ?>]" value="<?php echo $groupright['module']; ?>" disabled></td>
				<td align="center"><input name="group[<?php echo $groupright['id'] ?>][<?php echo $groupright['module']; ?>][edit]" value="<?php echo $groupright['edit']; ?>" type="checkbox" <?php echo ($groupright['edit'] =='1')?'checked="checked"':''; ?>></td>
				<td align="center"><input name="group[<?php echo $groupright['id'] ?>][<?php echo $groupright['module']; ?>][view]" value="<?php echo $groupright['view']; ?>" type="checkbox" <?php echo ($groupright['view'] =='1')?'checked="checked"':''; ?>></td>
				<td align="center"><a href="index.php?route=user/group_delete&group=<?php echo $groupright['id'] ?>&module=<?php echo $groupright['module']; ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/default/images/remove.png" alt="verwijderen"></a></td>
			</tr>
		<?php }}else{echo "<div class='msg'>".$this->msg_no_grouprights."</div>";} ?>
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr><td colspan="5"><input type="button" onclick="validate('rights_frm');" name="btnSubmit" value="<?php echo $this->btn_save_rights; ?>" />
		<input type="hidden" name="opslaan" value="<?php echo $this->btn_save; ?>"></td></tr>
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr><td colspan="5"><hr>&nbsp;</td></tr>
		<tr><td><input type="button" onclick="addModule();" value="<?php echo $this->btn_add_module; ?>" />&nbsp;&nbsp;&nbsp;&nbsp;
		</td><td><input type="button" onclick="addGroup();" value="<?php echo $this->btn_add_new_group; ?>" /></td>
		<td colspan="3"><input type="button" onclick="delGroup();" value="<?php echo $this->btn_delete_group; ?>" /></td>
		</tr>
	</table>
	</form>
	    
		<p class="module_placeholder">
		<p onclick="getGroupsnorights();"><?php echo $this->label_groups_norights; ?></p><div id="group_norights"></div>
		
	
</div>

<script>
	function addGroup(){
		html = '<hr>';

		html += '<form id="grp_frm" name="grp_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">';
		html += '<table><tr>';
		html += '<td><?php echo $this->label_groupname; ?>:<input type="text" name="groep"></td>';
		html += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
		html += '<td><?php echo $this->label_description; ?>:<input type="text" name="omschrijving"></td>';
		html += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
		html += '<td><input type="submit" name="Submit" value="<?php echo $this->btn_add; ?>" /></td>';
		html += '</tr></table></form>';

		$('.module_placeholder').after(html);
	}

	function validate(formId){
		error = false;
		//alert('test');
    	var theForm = document.getElementById(formId); // get the form
    	var cb = theForm.getElementsByTagName('input'); // get the inputs
    
    	for(var i=0;i<cb.length;i++){ 
    	    if(cb[i].type=='checkbox' && !cb[i].checked)  // if this is an unchecked checkbox
    	    {
    	       cb[i].value = 0; // set the value to "off"
    	       cb[i].checked = true; // make sure it submits
    	    }else if(cb[i].type=='checkbox' && cb[i].checked)  // if this is a checked checkbox
    	    {
    	       cb[i].value = 1; // set the value to "on"
    	       cb[i].checked = true; // make sure it submits
    	    }
    	}
		
		if(!error){
			$('form').submit();
		}
	}
	
	function addModule(){
		html = '<hr>';
	
		html += '<form id="mod_frm" name="mod_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">';
		html += '<table><tr>';
		html += '<td><?php echo $this->label_group; ?>:<select name="group">';
		html += '<option value="">-- <?php echo $this->label_selectgroup; ?> --</option>';
		<?php if($this->groups){foreach($this->groups as $groups){ ?>
		html += '<option value="<?php if($groups['name']!='admin'){echo $groups['id']; ?>"><?php echo addslashes($groups['name']); }?></option>';
		<?php } }?>
		html += '</select></td>';
		html += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
		html += '<td><?php echo $this->label_module; ?>:<select name="module">';
		html += '<option value="">-- <?php echo $this->label_selectmodule; ?> --</option>';
		<?php if($this->dirs){foreach($this->dirs as $key=>$value){ ?>
		html += '<option value="<?php echo $value; ?>"><?php echo $value; ?></option>';
		<?php } } ?>
		html += '</select></td>';
		html += '<td>Edit: <input name="edit" type="checkbox">&nbsp;&nbsp;&nbsp;View: <input name="view" type="checkbox">&nbsp;&nbsp;</td>';
		html += '<td><input type="submit" name="Submit" value="<?php echo $this->btn_add; ?>" /></td>';
		html += '</tr></table></form>';

		$('.module_placeholder').after(html);
	}

	function delGroup(){
		html = '<hr>';
	
		html += '<form><table><tr>';
		html += '<td style="color: red;"><?php echo $this->label_delete_group_list; ?>: ';
		html += '<select name="group" id="group" onchange="deleteGroup(this.options[this.selectedIndex].value, ';
		html += 'this.options[this.selectedIndex].text);">';
		html += '<option value="">-- <?php echo $this->label_selectgroup; ?> --</option>';
		<?php if($this->groups){foreach($this->groups as $groups){ ?>
		html += '<option value="<?php if($groups['name']!='admin'){echo $groups['id']; ?>"><?php echo addslashes($groups['name']); }?></option>';
		<?php } }?>
		html += '</select>';
		html += '</td></tr></table></form>';

		$('.module_placeholder').after(html);
	}

	function deleteGroup(groupid, groupname){
		if (confirm('<?php echo $this->label_group; ?> '+groupname+' <?php echo $this->label_confirm_delete_group; ?>?')){
			window.location.href="index.php?route=user/delgroup&id="+groupid+"&token=<?php echo $_GET['token']; ?>"
		} else {
			alert('<?php echo $this->label_group; ?> '+groupname+' <?php echo $this->label_not_removed; ?>!')
		}
	}
	
	function getGroupsnorights(){
		$.ajax({
			url: "index.php?route=user/getEmptyGroups",
			type: "get",
			data: "&token=<?php echo $_GET['token']; ?>",
			dataType: 'json',
			success: function(json){
				$('#group_norights').html("");
				$.each(json, function(i, v){
				$('#group_norights').append(v.name+'<br />');
				});
			},

			error: function(){
			}
		});
	
    }
</script>