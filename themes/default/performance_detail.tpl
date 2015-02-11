<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
        
	<?php } ?>
	<form class="" name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
        <table>
        <tr>
            <td>Performance Naam</td>
            <td><input class="" type="text" name="req_perfname" value="<?php if (isset($this->performance)) echo $this->performance['performance_title']; ?>" /></td>
        </tr>
        <tr>
            <td>Event</td>
            <td>
	        <select name="req_eventid">
	            <?php foreach($this->events as $events){ ?>
                    <option value="<?php echo $events['event_id']; ?>" <?php echo(isset($_GET['id']) && $this->performance['event_id']==$events['event_id'])?'selected>':'>'; echo $events['name']; ?></option>
	            <?php } ?>
	        </select> 
            </td>
        </tr>
        <tr>
            <td>Location</td>
            <td>
	        <select name="req_location">
	            <?php foreach($this->locations as $location){ ?>
                    <option value="<?php echo $location['location_id']; ?>" <?php echo(isset($_GET['id']) && $this->performance['location_id']==$location['location_id'])?'selected>':'>'; echo $location['name']; ?></option>
	            <?php } ?>
	        </select> 
            </td>
        </tr>
	<tr>
            <td>Artist</td>
            <td>
     	        <select name="req_artistid">
	            <?php foreach($this->artists as $artists){ ?>
                    <option value="<?php echo $artists['artist_id']; ?>" <?php echo(isset($_GET['id']) && $this->performance['artist_id']==$artists['artist_id'])?'selected >':'>'; echo $artists['name']; ?></option>
	            <?php } ?>
	        </select>
            </td>
        </tr>
	<tr>
            <td>Start:</td>
            <td><input class="datepicker" type="text" name="req_date_from" value="<?php if (isset($this->performance)) echo $this->performance['date_from']; ?>" />
            </div>
        </tr>
	<tr>
            <td>Tot:</td>
            <td><input class="datepicker" type="text" name="req_date_until" value="<?php if (isset($this->performance)) echo $this->performance['date_until']; ?>" />
            </div>
        </tr>
        <tr>
            <td>Bevestigd</td>
            <td><input type="checkbox" name="confirmed" value="1" <?php if( isset($this->performance) && ($this->performance['confirmed'] == 1)) echo('checked'); ?> >
            </td>
        </tr>
		<tr><td colspan="2">
                        <input type="button" onclick="validate();" name="btnSubmit" value="Opslaan" />
                        <a class="btn btn-danger" href="./index.php?route=performance/overview&token=<?php echo $_GET['token'] ?>" >Cancel</a>
                </td></tr>
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
		
		if(!error){
			$('form').submit();
		}
	}
</script>
