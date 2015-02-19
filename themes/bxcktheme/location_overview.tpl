<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
				<td>Naam van locatie</td>
				<td>Adres</td>
				<td>Postcode</td>
				<td>Plaats</td>
				<td>Land</td>
				<td class="right">Huur</td>
				<td class="right">Capaciteit</td>
				<td colspan="2">&nbsp;</td>
			</tr>
		</thead>
		<?php foreach($this->locations as $location){ ?>
			<tr>
				<td><?php echo $location['name']; ?></td>
				<td><?php echo $location['address']; ?></td>
				<td><?php echo $location['postcode']; ?></td>
				<td><?php echo $location['plaats']; ?></td>
				<td><?php echo $location['land']; ?></td>
				<td class="right"><?php echo number_format($location['rate'], 2, ',', '.'); ?></td>
				<td class="right"><?php echo number_format($location['capacity'], 0, ',', '.'); ?></td>
				<td><a href="index.php?route=location/edit&id=<?php echo $location['location_id'] ?>&token=<?php echo $_GET['token'] ?>">Edit</a></td>
				<td><a href="index.php?route=location/delete&id=<?php echo $location['location_id'] ?>&token=<?php echo $_GET['token'] ?>">Delete</a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="6"><input type="button" onclick="addLocation();" value="Locatie toevoegen" /></td></tr>
	</table>
</div>

<script>
	function addLocation(){
		document.location.href='index.php?route=location/add&token=<?php echo $_GET['token'] ?>';
	}
</script>