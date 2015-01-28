<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" id="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<table class="list">
		<thead>
			<tr>
				<td>Groep</td>
				<td>Module</td>
				<td>Edit</td>
				<td>View</td>
				<td>X</td>
			</tr>
		</thead>
		<?php foreach($this->groups as $group){ ?>
<?php //echo '<pre>';var_dump($group);echo '</pre>'; ?>
			<tr>
				<td><?php echo $group['name']; ?><small> (<?php echo $group['description']; ?>)</small></td>
				<td><input type="text" name="group[<?php echo $group['id'] ?>][<?php echo $group['module']; ?>]" value="<?php echo $group['module']; ?>"></td>
				<td><input name="group[<?php echo $group['id'] ?>][<?php echo $group['module']; ?>][edit]" value="<?php echo $group['edit']; ?>" type="checkbox" <?php echo ($group['edit'] =='1')?'checked="checked"':''; ?>></td>
				<td><input name="group[<?php echo $group['id'] ?>][<?php echo $group['module']; ?>][view]" value="<?php echo $group['view']; ?>" type="checkbox" <?php echo ($group['view'] =='1')?'checked="checked"':''; ?>></td>
				<td><a href="index.php?route=user/group_delete&email=<?php echo $group['group_id'] ?>&token=<?php echo $_GET['token'] ?>">Delete</a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="5"><input type="button" onclick="validate('frm');" name="btnSubmit" value="Opslaan" /></td></tr>
		
		<tr><td colspan="5">&nbsp;</td></tr>
		<tr><td colspan="5"><input type="button" onclick="addGroup();" value="Module toevoegen" />&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" onclick="addGroup();" value="Groep toevoegen" /></td></tr>
	</table>
	</form>
</div>

<script>
	function addGroup(){
		document.location.href='index.php?route=user/group_add&token=<?php echo $_GET['token'] ?>';
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
    	    }else{
      	       //cb[i].value = 1; // set the value to "off"
    	       //cb[i].checked = true; // make sure it submits
    	    }
    	}
		
		if(!error){
			$('form').submit();
		}
	}
	
</script>