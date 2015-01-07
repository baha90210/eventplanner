<div>
    <table class="list">
        <thead>
            <tr>
                <td>Resource type name</td>
                <td class="right">Bewerk</td>
                <td class="right">Resource id</td>
                <td class="right">Cancel</td>                
            </tr>
        </thead>
        <?php foreach($this->resource_types as $resource_type){ ?>
            <tr id="tbody">
                <td><a  href="index.php?route=resource_type/oneResource_type&resource_type_id=<?php echo $resource_type['resource_type_id']; ?>" ><?php echo $resource_type['name']; ?></a></td>
                <td class="right"><a class="button" href="index.php?route=resource_type/bewerkResource_type&resource_type_id=<?php echo $resource_type['resource_type_id']; ?>">O</a></td>
                <td class="right"><?php echo $resource_type['resource_type_id']; ?></td>
                <td class="right"><a class="button" href="index.php?route=resource_type/deleteResource_type&resource_type_id=<?php echo $resource_type['resource_type_id']; ?>">X</a></td>
            </tr>
        <?php } ?>
        <tfoot>
            <tr>
                <td>Resource type name</td>
                <td class="right">Bewerk</td>
                <td class="right">Cancel</td>
            </tr>
        </tfoot>
    </table>
    <a class="button" href="index.php?route=resource_type/addResource_type">Resource_type Toevoegen</a>
</div>