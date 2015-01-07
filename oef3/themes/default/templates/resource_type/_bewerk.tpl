<div>
<?php if($this->error_msg != ''){ ?>
    <div class="error"><?php echo $this->error_msg; ?></div>	
<?php } ?>

<form class="add-resource_type-form" method="post" action="index.php?route=resource_type/updateResource_type">
    <table  class=" list">
                <thead>
            <tr cellpadding="10">
                <td>Resource_type</td>
            </tr>
        </thead>
        <tr>
            <td><p><input type="text" name="name" value="<?php echo $this->updated_resource_type['name']; ?>" /></p></td>

        </tr>

        <tfoot>
            <tr>
                <td>Resource_type</td>

            </tr>
            <tr>
                <td>
                    <p><input type="submit" id="button-upload" name="submit" value="Bewerken" /></p>
                </td>
            </tr>
        </tfoot>
        <input type="hidden" name="resource_type_id" value="<?php echo $this->updated_resource_type['resource_type_id']; ?>" />
    </table>
</form>
</div>