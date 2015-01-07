<div>
<?php if($this->error_msg != ''){ ?>
    <div class="error"><?php echo $this->error_msg; ?></div>	
<?php } ?>

<form class="add-resource_type-form" method="post" action="index.php?route=resource_type/insertResource_type">
    <table  class=" list">
        <thead>
            <tr cellpadding="10">
                <td>Resource_type</td>
            </tr>
        </thead>
        <tr>
            <td><p><input type="text" name="name" value="" /></p></td>
        </tr>
        <tr>
            <td>
                <p><input type="submit" id="button-upload" name="submit" value="Toevoegen" /></p>
            </td>
        </tr>
    </table>
</form>
</div>

