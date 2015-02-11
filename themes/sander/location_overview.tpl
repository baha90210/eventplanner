<div>
    <div> &nbsp;</div>
    <div class="panel panel-info">
        <div class="panel-heading"><?php echo ($this->header_msg); ?></div>
        <div class="panel-body">
            <div class="row form-group form-horizontal" >
                <div class="col-sm-3">
                    <select name="plaats" class="form-control" onchange="SelectRows()">
                        <option value="">Alle Plaatsen</option>
                        <?php foreach($this->plaatsen as $plaatsen){ ?>
                        <option value="<?php echo ($plaatsen['plaats'] . '">' . $plaatsen['plaats']); ?> </option>
                        <?php } ?>
                    </select>
                </div>
                <div class="col-sm-3"> </div>
                <div class="col-sm-6">
                    <button type="button" class="btn btn-info pull-right" onclick="addLocation();">Location toevoegen</button>
                </div>
            </div>
        	<table class="table table-hover">
        		<thead><tr>
        				<th>Naam</th><th>Adres</th><th>Postcode</th><th>Plaats</th>
        				<th>Land</th><th>Huur</th><th>Capaciteit</th><th colspan="2">Bewerking</th>
        		</tr></thead>
        		<?php foreach($this->locations as $location){ ?>
        		<tr class="rij plaats_<?php echo(str_replace(' ','-',$location['plaats'])) ?>">
    				<td><?php echo $location['name']; ?></td>
    				<td><?php echo $location['address']; ?></td>
    				<td><?php echo $location['postcode']; ?></td>
    				<td><?php echo $location['plaats']; ?></td>
    				<td><?php echo $location['land']; ?></td>
    				<td class="right"><?php echo number_format($location['rate'], 2, ',', '.'); ?></td>
    				<td class="right"><?php echo number_format($location['capacity'], 0, ',', '.'); ?></td>
    				<td><a href="index.php?route=location/edit&id=<?php echo $location['location_id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-edit"></span></a></td>
    				<td><a href="index.php?route=location/delete&id=<?php echo $location['location_id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-remove"></span></a></td>
        		</tr>
        		<?php } ?>
        	</table>
        	<button type="button" class="btn btn-info" onclick="addLocation();">Location toevoegen</button>
        </div>
    </div>
</div>

<script>
function addLocation(){
	document.location.href='index.php?route=location/add&token=<?php echo $_GET['token'] ?>';
}

function SelectRows(){
    /* Kortere SelectRows door Alexander */
    // Verberg alles
    $('.rij').hide();
    plaats = $('select[name="plaats"]').val();
    
    // Bepaal welke regels getoond moeten worden
    selector = '.rij'; // Begin met alles
    if (plaats) { selector += '.plaats_'+plaats.replace(" ","-"); } 
    $(selector).show(); // Toon deze rijen.
}

</script>