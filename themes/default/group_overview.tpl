<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="rights_frm" id="rights_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">
	<table class="list">
		<thead>
			<tr>
				<td>Groep</td>
				<td>Module</td>
				<td>Edit</td>
				<td>View</td>
				<td align="center">Delete</td>
			</tr>
		</thead>
		
		<?php if($this->grouprights){foreach($this->grouprights as $groupright){ ?>
			<tr>
				<td><?php echo $groupright['name']; ?><small> (<?php echo $groupright['description']; ?>)</small></td>
				<td><input type="text" name="group[<?php echo $groupright['id'] ?>][<?php echo $groupright['module']; ?>]" value="<?php echo $groupright['module']; ?>" readonly></td>
				<td><input name="group[<?php echo $groupright['id'] ?>][<?php echo $groupright['module']; ?>][edit]" value="<?php echo $groupright['edit']; ?>" type="checkbox" <?php echo ($groupright['edit'] =='1')?'checked="checked"':''; ?>></td>
				<td><input name="group[<?php echo $groupright['id'] ?>][<?php echo $groupright['module']; ?>][view]" value="<?php echo $groupright['view']; ?>" type="checkbox" <?php echo ($groupright['view'] =='1')?'checked="checked"':''; ?>></td>
				<td align="center"><a href="index.php?route=user/group_delete&group=<?php echo $groupright['id'] ?>&module=<?php echo $groupright['module']; ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/default/images/remove.png" alt="verwijderen"></a></td>
			</tr>
		<?php }}else{echo "<div class='msg'>Er zijn nog geen groepsrechten toegekend</div>";} ?>
		<tr><td colspan="5"><input type="button" onclick="validate('rights_frm');" name="btnSubmit" value="Rechten opslaan" />
		<input type="hidden" name="opslaan" value="opslaan"></td></tr>
		
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr><td colspan="5"><input type="button" onclick="addModule();" value="Module toevoegen" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="addGroup();" value="Nieuwe groep" /></td></tr>
	</table>
	</form>
		<p class="module_placeholder">
		<p onclick="getGroupsnorights();">Groepen zonder rechten</p><div id="group_norights"></div>
		
	
</div>

<script>
	function addGroup(){
		html = '';

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
		html = '';

		html += '<form id="mod_frm" name="mod_frm" method="post" action="index.php?route=user/group&token=<?php echo $_GET['token']; ?>" enctype="multipart/form-data">';
		html += '<table><tr>';
		html += '<td>Groep:<select name="group">';
		html += '<option value="">-- Selecteer usergroep --</option>';
		<?php if($this->groups){foreach($this->groups as $groups){ ?>
		html += '<option value="<?php echo $groups['id']; ?>"><?php echo addslashes($groups['name']); ?></option>';
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