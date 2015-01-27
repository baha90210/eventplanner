<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
				<td>Event</td>
				<td>Startdatum</td>
				<td>Einddatum</td>
				<td class="right">Toegangsprijs</td>
				<td colspan="2">&nbsp;</td>
			</tr>
		</thead>
		<?php foreach($this->events as $event){ ?>
			<tr>
				<td><?php echo $event['name']; ?></td>
				<td><?php echo $event['start_date']; ?></td>
				<td><?php echo $event['end_date']; ?></td>
				<td class="right"><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
				<td><a href="index.php?route=event/edit&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>">Edit</a></td>
				<td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>">Delete</a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="6"><input type="button" onclick="addEvent();" value="Event toevoegen" /></td></tr>
		<tr><td colspan="6"><a href="index.php?route=location/overview&token=<?php echo $_GET['token'] ?>">Locaties beheren</a></td></tr>
	</table>
</div>

<script>
	function addEvent(){
		document.location.href='index.php?route=event/add&token=<?php echo $_GET['token'] ?>';
	}
</script>