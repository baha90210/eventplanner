<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="rights_frm" id="rights_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">
	<table class="list">
		<thead class='theader'>
		      <tr><td colspan = "2">&nbsp;</td>
		      <td colspan="2" align="center">Rechten</td>
		      <td>&nbsp;</td>
			<tr>
				<td>Groep</td>
				<td>Module</td>
				<td align="center">Edit</td>
				<td align="center">View</td>
				<td align="center">Delete groep</td>
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
		<?php }}else{echo "<div class='msg'>Er zijn nog geen groepsrechten toegekend</div>";} ?>
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr><td colspan="5"><input type="button" onclick="validate('rights_frm');" name="btnSubmit" value="Rechten opslaan" />
		<input type="hidden" name="opslaan" value="opslaan"></td></tr>
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr><td colspan="5"><hr>&nbsp;</td></tr>
		<tr><td><input type="button" onclick="addModule();" value="Module toevoegen" />&nbsp;&nbsp;&nbsp;&nbsp;
		</td><td><input type="button" onclick="addGroup();" value="Nieuwe groep toevoegen" /></td>
		<td colspan="3"><input type="button" onclick="delGroup();" value="Groep verwijderen" /></td>
		</tr>
	</table>
	</form>
	    
		<p class="module_placeholder">
		<p onclick="getGroupsnorights();">Groepen zonder rechten</p><div id="group_norights"></div>
		
	
</div>

<script>
	function addGroup(){
		html = '<hr>';

		html += '<form id="grp_frm" name="grp_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">';
		html += '<table><tr>';
		html += '<td>Groepnaam:<input type="text" name="groep"></td>';
		html += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
		html += '<td>Omschrijving:<input type="text" name="omschrijving"></td>';
		html += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
		html += '<td><input type="submit" name="Submit" value="Voeg groep toe" /></td>';
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
		html += '<td>Groep:<select name="group">';
		html += '<option value="">-- Selecteer usergroep --</option>';
		<?php if($this->groups){foreach($this->groups as $groups){ ?>
		html += '<option value="<?php if($groups['name']!='admin'){echo $groups['id']; ?>"><?php echo addslashes($groups['name']); }?></option>';
		<?php } }?>
		html += '</select></td>';
		html += '<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>';
		html += '<td>Module:<select name="module">';
		html += '<option value="">-- Selecteer module --</option>';
		<?php if($this->dirs){foreach($this->dirs as $key=>$value){ ?>
		html += '<option value="<?php echo $value; ?>"><?php echo $value; ?></option>';
		<?php } } ?>
		html += '</select></td>';
		html += '<td>Edit: <input name="edit" type="checkbox">&nbsp;&nbsp;&nbsp;View: <input name="view" type="checkbox">&nbsp;&nbsp;</td>';
		html += '<td><input type="submit" name="Submit" value="Voeg toe" /></td>';
		html += '</tr></table></form>';

		$('.module_placeholder').after(html);
	}

	function delGroup(){
		html = '<hr>';
	
		html += '<form><table><tr>';
		html += '<td style="color: red;">Groep verwijderen (kies uit de lijst): ';
		html += '<select name="group" id="group" onchange="deleteGroup(this.options[this.selectedIndex].value, ';
		html += 'this.options[this.selectedIndex].text);">';
		html += '<option value="">-- Selecteer usergroep --</option>';
		<?php if($this->groups){foreach($this->groups as $groups){ ?>
		html += '<option value="<?php if($groups['name']!='admin'){echo $groups['id']; ?>"><?php echo addslashes($groups['name']); }?></option>';
		<?php } }?>
		html += '</select>';
		html += '</td></tr></table></form>';

		$('.module_placeholder').after(html);
	}

	function deleteGroup(groupid, groupname){
		if (confirm('Groep '+groupname+' met rechten echt verwijderen?')){
			window.location.href="index.php?route=user/delgroup&id="+groupid+"&token=<?php echo $_GET['token']; ?>"
		} else {
			alert('Groep '+groupname+' is niet verwijderd!')
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