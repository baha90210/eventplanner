<div>
    <div> &nbsp;</div>
    <div class="panel panel-info">
        <div class="panel-heading"><?php echo ($this->header_msg); ?></div>
        <div class="panel-body">
            
            <form class="form-horizontal" name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
                <input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="req_perfname">Performance Naam</label>
                    <div class="col-sm-4 ">
                    <input class="form-control" type="text" name="req_perfname" value="<?php if (isset($this->performance)) echo $this->performance['performance_title']; ?>" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="req_eventid">Event</label>
                    <div class="col-sm-4">
                    <select id="event_id" name="req_eventid" class="form-control">
                    <?php foreach($this->events as $events){ ?>
                    <option value="<?php echo $events['event_id']; ?>" <?php echo(isset($_GET['id']) && $this->performance['event_id']==$events['event_id'])?'selected':'' ?> >
                    <?php echo $events['name']; ?></option>
                    <?php } ?>
                    </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="req_location">Location</label>
                    <div class="col-sm-4">
                    <select id="location" name="req_location" class="form-control">
                    
                    
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
                    <div class="col-sm-4">
                    <input class="form-control" type="date" name="req_date_from" value="<?php if (isset($this->performance)) echo ($this->performance['date_from']); ?>" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="req_date_until">Tot datum:</label>
                    <div class="col-sm-4">
                    <input class="form-control" type="date" name="req_date_until" value="<?php if (isset($this->performance)) echo ($this->performance['date_until']); ?>" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-4">
                        <div class="checkbox">
                        <label>
                        <input type="checkbox" name="confirmed" value="1" <?php if(isset($this->performance) && $this->performance['confirmed'] == 1)echo('checked'); ?> > Bevestigd
                        </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                    <button type="submit" class="btn btn-success">Save</button>
                    <a class="btn btn-danger" href="./index.php?route=performance/overview&token=<?php echo $_GET['token'] ?>" >Cancel</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function validate(){
    error = false;
    $('input[name^="req"]').each(function(){
        if($(this).val() == ''){
            $(this).parent().addClass( "has-error" );
            error = true;
        }
    });
    if(!error){
        $('form').submit();
    }
}

function populateLocations(location_id) {    
    $.ajax({   
        url: "./index.php?route=location/getEventLocations",
        type: "get",
        data: "event=" + $('#event_id').val() + "&token=<?php echo $_GET['token']; ?>",
        dataType: 'json',
        success: function(data){
            option = '<option value="">Select een Location</option>';
            $.each(data, function(index, array) {
                option += '<option value="'+array['location_id']+'"';
                if (location_id==array['location_id']) option += ' selected'
                option +=' >'+array['name']+"</option>";
            });
            console.log(option);
            $('#location').html(option);
        },
    });	 
} 

populateLocations(<?php if(isset($this->performance['location_id'])) echo $this->performance['location_id'] ?>);

$('#event_id').change(function() {
        populateLocations(<?php if(isset($this->performance['location_id'])) echo $this->performance['location_id'] ?>);
	});
        
</script>