<div>
    <div class="msg">&nbsp;</div>

    <form class="form-horizontal" name="frm" method="post" action="index.php?route=<?php echo $_GET['route'] ?>&token=<?php echo $_GET['token'] ?>" enctype="multipart/form-data">
    <input type="hidden" name="id" value="<?php echo (isset($_GET['id']))?$_GET['id']:''; ?>" />
    <div class="form-group">
        <label class="col-sm-2 control-label" for="req_key">Message Key</label>
        <div class="col-sm-4 ">
            <input class="form-control" type="text" name="req_key" value="<?php if (isset($this->message)) echo $this->message['msg_key']; ?>" required>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="req_text">Message Text:</label>
        <div class="col-sm-4">
        <input class="form-control" type="text" name="req_text" value="<?php if (isset($this->message)) echo ($this->message['text']); ?>" required>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-2 control-label" for="language">Language:</label>
        <div class="col-sm-2">
        <input class="form-control" type="text" name="language" value="<?php if (isset($this->message)) echo ($this->message['language']); ?>" required>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-4">
          <button type="submit" class="btn btn-default">Save</button>
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
