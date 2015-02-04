<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
				<td>resource</td>
				<td class="right">Prijs</td>
				<td class="right">Omschrijving</td>
				<td colspan="2">&nbsp;</td>
			</tr>
		</thead>
		<?php foreach($this->resources as $resource){ ?>
			<tr>
				
				<td><?php echo ucfirst($resource['name']); ?></td>
				<td class="right"><?php echo number_format($resource['rate'], 2, ',', '.'); ?></td>
				<td><?php echo $resource['description']; ?></td>
				<td><a href="index.php?route=resource/edit&id=<?php echo $resource['resource_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
				<td><a href="index.php?route=resource/delete&id=<?php echo $resource['resource_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="6"><input type="button" onclick="addresource();" value="resource toevoegen" /></td></tr>
	</table>
</div>

<script>
	function addresource(){
		document.location.href='index.php?route=resource/add&token=<?php echo $_GET['token']; ?>';
	}
</script>