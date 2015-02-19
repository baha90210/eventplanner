<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<form name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<table class="list">
		<tr>
			<td><?php echo $this->label_event_name; ?> : </td>
			<td><input class="required" type="text" name="req_name" value="<?php echo stripslashes($this->event['name']); ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->label_event_startdatum; ?> : </td>
			<td><input class="required datepicker" type="text" name="req_start_date" value="<?php echo $this->event['start_date']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->label_event_einddatum; ?> : </td>
			<td><input class="required datepicker" type="text" name="req_end_date" value="<?php echo $this->event['end_date']; ?>" /></td>
		</tr>
		<tr>
			<td><?php echo $this->label_event_prijs; ?></td>
			<td><input class="required" type="text" name="reqnum_price" value="<?php echo $this->event['price']; ?>" /></td>
		</tr>
		<?php foreach($this->event_locations as $location_id){ ?>
		<tr>
			<td><?php echo $this->label_locations; ?> :</td>
			<td>
				<select name="location[]">
					<option value=""><?php echo $this->label_select_addlocation; ?></option>
					<?php foreach($this->locations as $location){ ?>
					<option value="<?php echo $location['location_id'] ?>" <?php echo ($location['location_id'] == $location_id['location_id'])?'selected="selected"':''; ?>><?php echo $location['name'] ?></option>
					<?php } ?>
				</select> <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteLocation(this);" />
			</td>
		</tr>
		<?php } ?>
		<tr class="location_placeholder">
			<td colspan="2"><input type="button" name="addLocationhtml" value="Add location" onclick="addLocation();" /></td>
		</tr>
		
                
                <?php //var_dump($this->event_resources); ?>
                
                 
		<?php if(is_array($this->event_resources)){
                    foreach($this->event_resources as $resource_id){ ?>
                    <tr>
                            <td><?php echo $this->label_resources; ?> :</td>
                            <td>
                                    <select name="resource[]">
                                            <option value=""><?php echo $this->label_select_addresource; ?></option>
                                            <?php foreach($this->resources as $resource){ ?>
                                            <option value="<?php echo $resource['resource_id'] ?>" <?php echo ($resource['resource_id'] == $resource_id['resource_id'])?'selected="selected"':''; ?>><?php echo $resource['name'] ?></option>
                                            <?php } ?>
                                    </select> <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteResource(this);" />
                            </td>
                    </tr>
                    <?php }
                    } ?>
		<tr class="resource_placeholder">
			<td colspan="2"><input type="button" name="addResourcehtml" value="Add resource" onclick="addResource();" /></td>
		</tr>

		<tr><td colspan="2"><input type="button" onclick="validate();" name="btnSubmit" value="Opslaan" /></td></tr>
		<tr><td colspan="2"><input type="button" name="btnBack" value="Annuleren" onclick="document.location.href='index.php?route=event/overview&token=<?php echo $_GET['token']; ?>'" /></td></tr>
	</table>
	</form>
</div>
<script>
	$(document).ready(function(){
		$('input[name^="req"]').each(function(){
			$(this).after('<span>*</span>');
		});
                $('input[class="datepicker"]').datepicker({
			dateFormat: 'yy-mm-dd', 
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
			$('input[name="req_price"]').css('border', '1px solid #f00');
			$('input[name="req_price"]').parent().find('span').append('   Dit moet een getal zijn!');
			error = true;
		}

		location_array = [];
		
		$('select[name="location[]"]').each(function(){
                        
			if($.inArray($(this).val(), location_array) != -1){
				error = true;
				$(this).css('border', '1px solid #f00');
			}else{
				location_array.push($(this).val());
			}
		});
                
		resource_array = [];
		
		$('select[name="resource[]"]').each(function(){
                        
			if($.inArray($(this).val(), resource_array) != -1){
				error = true;
				$(this).css('border', '1px solid #f00');
			}else{
				resource_array.push($(this).val());
			}
		});
                

                if(error == false)
                    $('form').submit();
                
		
	}

	function addLocation(){
		html = '';
		
		html += '<tr>';
		html += '<td>Locatie:</td>';
		html += '<td>';
		html += '<select name="location[]">';
		html += '<option value="">-- Selecteer een locatie --</option>';
		<?php foreach($this->locations as $location){ ?>
		html += '<option value="<?php echo $location['location_id'] ?>"><?php echo $location['name'] ?></option>';
		<?php } ?>
		html += '</select>';
		html += '  <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteLocation(this);" />';
		html += '</td>';
		html += '</tr>';

		$('.location_placeholder').before(html);
	}
	function addResource(){
		html = '';
		
		html += '<tr>';
		html += '<td>Resource:</td>';
		html += '<td>';
		html += '<select name="resource[]">';
		html += '<option value="">-- Selecteer een resource --</option>';
		<?php foreach($this->resources as $resource){ ?>
		html += '<option value="<?php echo $resource['resource_id'] ?>"><?php echo $resource['name'] ?></option>';
		<?php } ?>
		html += '</select>';
		html += '  <img src="./themes/<?php echo THEME ?>/images/remove.png" onclick="deleteResource(this);" />';
		html += '</td>';
		html += '</tr>';

		$('.resource_placeholder').before(html);
	}
        

        
	

	function deleteLocation(location){
		$(location).parent().parent().remove();
	}	
	function deleteResource(resource){
		$(resource).parent().parent().remove();
	}	
	
	
</script>














