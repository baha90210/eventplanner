<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
        
	<?php } ?>
	<form class="form-horizontal" name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_perfname">Performance Naam</label>
            <div class="col-sm-6">
                <input class="required form_control" type="text" name="req_perfname" value="<?php if (isset($this->performance)) echo $this->performance['performance_title']; ?>" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="req_eventid">Event</label>
            <div class="col-sm-4">
	        <select name="req_eventid" class="form-control">
	            <?php foreach($this->events as $events){ ?>
                    <option value="<?php echo $events['event_id']; ?>"  <?php echo(isset($_GET['id']) && $this->performance['event_id']==$events['event_id'])?'selected':'' ?> >
	                <?php echo $events['name']; ?></option>
	            <?php } ?>
	        </select> 
            </div>
        </div>
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_artistid">Artist</label>
            <div class="col-sm-4">
     	        <select name="req_artistid" class="form-control">
	            <?php foreach($this->artists as $artists){ ?>
	                <option value="<?php echo $artists['artist_id']; ?>" <?php echo(isset($_GET['id']) && $this->performance['artist_id']==$artists['artist_id'])?'selected':'' ?> >
	                <?php echo $artists['name']; ?></option>
	            <?php } ?>
	        </select>
            </div>
        </div>
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_date_from">Start datum:</label>
            <div class="col-sm-6">
            <input class="required form_control" type="date" name="req_date_from" value="<?php if (isset($this->performance)) echo ($this->performance['date_from']); ?>" />
            </div>
        </div>
	<div class="form-group">
            <label class="col-sm-2 control-label" for="req_date_until">Tot datum:</label>
            <div class="col-sm-6">
            <input class="required form_control" type="date" name="req_date_until" value="<?php if (isset($this->performance)) echo ($this->performance['date_until']); ?>" />
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label" for="num_confirmed">Bevestigd</label>
            <div class="col-sm-6">
            <input class="required form_control" type="number" name="num_confirmed" value="<?php if (isset($this->performance)) echo $this->performance['confirmed']; ?>" />
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

        if(!error){
                $('form').submit();
        }
}
</script>
