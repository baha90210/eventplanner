<div>
<?php if($this->error_msg != ''){ ?>
    <div class="error"><?php echo $this->error_msg; ?></div>	
<?php } ?>

<form class="add-resource-form" method="post" action="index.php?route=resource/insertResource">
    <table  class=" list">
                <thead>
            <tr cellpadding="10">
                <td>Resource</td>
                <td>Rate</td>
                <td>Description</td>
                <td>type</td>


            </tr>
        </thead>
        <tr>
            <td><p><input type="text" name="name" value="" /></p></td>

            <td><p><input id="text" type="text" name="rate" value="" /></p></td>

            <td><p><p><input id="text" type="text" name="description" value="" /></p></td>
 
            <td>
                <p> 
                    <select name="resource_type" >
                        <?php foreach($this->resource_type_name as $type){
                        echo '<option value="'.$type['resource_type_id'].'">'.$type['name'].'</option>';
                        }?>
                    </select> 
                </p>
            </td>


        </tr>
        <tr>
            <td>
                <p><input type="submit" id="button-upload" name="submit" value="Toevoegen" /></p>
            </td>
        </tr>
    </table>
</form>
</div>

