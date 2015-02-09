<div>
    <div class="msg">&nbsp;</div>

	<form class="form-horizontal" name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
	<input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
    <div class="form-group">
        <label class="col-sm-2 control-label" for="req_name">Naam locatie:</label>
        <div class="col-sm-4 ">
			<input class="form-control" type="text" name="req_name" value="<?php if (isset($this->location)) echo $this->location['name']; ?>" required>
        </div>
    </div>    
    <div class="form-group">
        <label class="col-sm-2 control-label" for="req_address">Adres:</label>
        <div class="col-sm-4 ">
        <input class="form-control" type="text" name="req_address" value="<?php if (isset($this->location)) echo $this->location['address']; ?>" required>
        </div>
    </div> 
    <div class="form-group">
        <label class="col-sm-2 control-label" for="req_postcode">postcode:</label>
        <div class="col-sm-4 ">
            <input class="form-control" type="text" name="req_postcode" value="<?php if (isset($this->location)) echo $this->location['postcode'] ?>" required>
        </div>
    </div>    
	<div class="form-group">
        <label class="col-sm-2 control-label" for="req_plaats">Plaats:</label>
        <div class="col-sm-4 ">
            <input class="form-control" type="text" name="req_plaats" value="<?php if (isset($this->location)) echo $this->location['plaats']; ?>" required>
        </div>
    </div>    
    <div class="form-group">
        <label class="col-sm-2 control-label" for="req_land">Land:</label>
        <div class="col-sm-4 ">
            <input class="form-control" type="text" name="req_land" value="<?php if (isset($this->location)) echo $this->location['land']; ?>" required>
        </div>
    </div>            
    <div class="form-group">
        <label class="col-sm-2 control-label" for="reqnum_rate">Tarief:</label>
        <div class="col-sm-4 ">
			<input class="form-control" type="text" name="reqnum_rate" value="<?php if (isset($this->location)) echo $this->location['rate']; ?>" required>
        </div>
    </div>    
    <div class="form-group">
        <label class="col-sm-2 control-label" for="reqnum_capacity">Capaciteit:</label>
        <div class="col-sm-4 ">
            <input class="form-control" type="text" name="reqnum_capacity" value="<?php if (isset($this->location)) echo $this->location['capacity']; ?>" required>
        </div>
    </div>    
    <div class="form-group">
        <div class="col-sm-12">
            <button type="submit" class="btn btn-success">Save</button>
            <a class="btn btn-danger" href="./index.php?route=location/overview&token=<?php echo $_GET['token'] ?>" >Cancel</a>
        </div>
    </div>
	</form>
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
</script>