<div>
    <table class="list">
        <thead>
            <tr>
                <td>Resource</td>
                <td>Rate</td>
                <td>Description</td>
                <td class="right">Type</td>
                <td class="right">Bewerk</td>
                <td class="right">Cancel</td>
            </tr>
        </thead>
        <tr id="tbody">
            <td><?php echo $this->resource['name']; ?></td>
            <td><?php echo number_format($this->resource['rate'], 2, ',', '.'); ?></td>
            <td><?php echo $this->resource['description']; ?></td>
            <td class="right"><?php echo $this->resource['type']; ?></td>
            <td class="right"><a class="button" href="index.php?route=resource/bewerkResource&resource_id=<?php echo $this->resource['resource_id']; ?>">O</a></td>
            <td class="right"><a  class="button" href="index.php?route=resource/deleteResource&resource_id=<?php echo $this->resource['resource_id']; ?>">X</a></td>
        </tr>
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
    <a class="button"href="index.php?route=resource/overview">Resource Overview</a>
</div>