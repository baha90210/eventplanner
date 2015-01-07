<div>
    <table class="list">
        <thead>
            <tr>
                <td>Resource_type</td>
                <td class="right">Bewerk</td>
                <td class="right">Resource id</td>
                <td class="right">Cancel</td>
            </tr>
        </thead>
        <tr id="tbody">
            <td><?php echo $this->resource_type['name']; ?></td>
            <td class="right"><a class="button" href="index.php?route=resource_type/bewerkResource_type&resource_type_id=<?php echo $this->resource_type['resource_type_id']; ?>">O</a></td>
            <td class="right"><?php echo $this->resource_type['resource_type_id']; ?></td>
            <td class="right"><a  class="button" href="index.php?route=resource_type/deleteResource_type&resource_type_id=<?php echo $this->resource_type['resource_type_id']; ?>">X</a></td>
        </tr>
        <tfoot>
            <tr>
                <td>Resource_type</td>
                <td class="right">Toegangsprijs</td>
                <td class="right">Resource id</td>
                <td class="right">Cancel</td>
            </tr>
        </tfoot>
    </table>
    <a class="button"href="index.php?route=resource_type/overview">Resource_type Overview</a>
</div>