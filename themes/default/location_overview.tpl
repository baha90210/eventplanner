<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
				<td><?php echo $this->lang->label_location_name; ?></td>
				<td><?php echo $this->lang->label_location_address; ?></td>
				<td><?php echo $this->lang->label_location_zip; ?></td>
				<td><?php echo $this->lang->label_location_city; ?></td>
				<td><?php echo $this->lang->label_location_country; ?></td>
				<td class="right"><?php echo $this->lang->label_location_rate; ?></td>
				<td class="right"><?php echo $this->lang->label_location_capacity; ?></td>
				<td style="text-align: center;"><?php echo $this->lang->label_edit; ?></td>
				<td style="text-align: center;"><?php echo $this->lang->label_delete; ?></td>
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
				<td style="text-align: center;"><a href="index.php?route=location/edit&id=<?php echo $location['location_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png" title="<?php echo $this->lang->label_edit; ?>" /></a></td>
				<td style="text-align: center;"><a href="index.php?route=location/delete&id=<?php echo $location['location_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png" title="<?php echo $this->lang->label_delete; ?>" /></a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="6"><input type="button" onclick="addLocation();" value="<?php echo $this->lang->label_add_location; ?>" /></td></tr>
	</table>
</div>

<script>
	function addLocation(){
		document.location.href='index.php?route=location/add&token=<?php echo $_GET['token'] ?>';
	}
</script>