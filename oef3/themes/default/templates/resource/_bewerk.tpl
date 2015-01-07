<div>
<?php if($this->error_msg != ''){ ?>
    <div class="error"><?php echo $this->error_msg; ?></div>	
<?php } ?>

<form class="add-resource-form" method="post" action="index.php?route=resource/updateResource">
    <table  class=" list">
                <thead>
            <tr cellpadding="10">
                <td>Resource</td>
                <td>Rate</td>
                <td>Description</td>
                <td>Type</td>


            </tr>
        </thead>
        <?php //HeFu::vardrop($this->updated_resource); ?>
        <tr>
            <td><p><input type="text" name="name" value="<?php echo $this->updated_resource['name']; ?>" /></p></td>

            <td><p><input id="text" type="text" name="rate" value="<?php echo number_format($this->updated_resource['rate'], 2, ',', '.'); ?>" /></p></td>

            <td><p><p><input id="text" type="text" name="description" value="<?php echo $this->updated_resource['description']; ?>" /></p></td>
 
            <td><p><input type="text" name="type" value="<?php echo $this->updated_resource['resource_type_name']; ?>" /></p></td>
            

        </tr>
        
        <tfoot>
            <tr>
                <td>Resource</td>
                <td>Rate</td>
                <td>Description</td>
                <td>Type</td>
            </tr>
            <tr>
                <td>
                    <p><input type="submit" id="button-upload" name="submit" value="Bewerken" /></p>
                </td>
            </tr>
        </tfoot>
        <input type="hidden" name="resource_id" value="<?php echo $this->updated_resource['resource_id']; ?>" />
    </table>
</form>
</div>