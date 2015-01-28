<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
        
	<?php } ?>
	<form class="form-horizontal" name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_perfname">Performance Naam</label>
            <div class="col-sm-10">
            <input class="required form_control" type="text" name="req_perfname" value="<?php echo $this->performance['performance_title']; ?>" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="req_eventid">Event ID</label>
            <div class="col-sm-10">
            <input class="required form_control" type="text" name="req_eventid" value="<?php echo $this->performance['event_id']; ?>" />
            </div>
        </div>
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_artistid">Artist ID</label>
            <div class="col-sm-10">
            <input class="required form_control" type="text" name="req_artistid" value="<?php echo $this->performance['artist_id']; ?>" />
            </div>
        </div>
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_date_from">Start datum:</label>
            <div class="col-sm-10">
            <input class="required form_control" type="date" name="req_date_from" value="<?php echo $this->performance['date_from']; ?>" />
            </div>
        </div>
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_date_until">Tot datum:</label>
            <div class="col-sm-10">
            <input class="required form_control" type="date" name="req_date_until" value="<?php echo $this->performance['date_until']; ?>" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="num_confirmed">Bevestigd</label>
            <div class="col-sm-10">
            <input class="required form_control" type="number" name="num_confirmed" value="<?php echo $this->performance['confirmed']; ?>" />
            </div>
        </div>
        
        <table>
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

		if(!error){
			$('form').submit();
		}
	}
</script>
