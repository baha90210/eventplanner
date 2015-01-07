<div>
    <table class="list">
        <thead>
            <tr>
                <td>Resource</td>
                <td>Rate</td>
                <td>Description</td>
                <td class="right">Type</td>
                <td class="right">Bewerk</td>
                <td class="right">Verwijder</td>
            </tr>
        </thead>
        <?php
            $i=0;
            foreach($this->resources as $resource){ ?>
            <?php //HeFu::vardrop($resource); ?>
            <?php //HeFu::vardrop($this->resource_type[1]); ?>

            <tr id="tbody">
                <td><a  href="index.php?route=resource/oneResource&resource_id=<?php echo $resource['resource_id']; ?>" ><?php echo $resource['name']; ?></a></td>
                <td><?php echo number_format($resource['rate'], 2, ',', '.'); ?></td>
                <td><?php echo $resource['description']; ?></td>
                <td class="right"><?php echo $this->resource_type[$i]['name']; ?></td>
                <td class="right"><a class="button" href="index.php?route=resource/bewerkResource&resource_id=<?php echo $resource['resource_id']; ?>">O</a></td>
                <td class="right"><a class="button" href="index.php?route=resource/deleteResource&resource_id=<?php echo $resource['resource_id']; ?>">X</a></td>
            </tr>
        <?php $i++;} ?>
        <tfoot>
            <tr>
                <td>Resource</td>
                <td>Rate</td>
                <td>Description</td>
                <td class="right">Type</td>
                <td class="right">Bewerk</td>
                <td class="right">Cancel</td>
            </tr>
        </tfoot>
    </table>
    <a class="button" href="index.php?route=resource/addResource">Resource Toevoegen</a>
</div>