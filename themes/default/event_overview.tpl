
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
				<td class="center">Toegangsprijs</td>
				<td colspan="1">&nbsp;</td>
			</tr>
		</thead>
		<tbody>
			<?php foreach($this->events as $event){ ?>
			<tr onclick="showLocRes(<?php echo $event['event_id'] ?>);">
				<td><?php echo $event['name']; ?></td>
				<td><?php echo $event['start_date']; ?></td>
				<td><?php echo $event['end_date']; ?></td>
				<td class="center"><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
				<td><a href="index.php?route=event/edit&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
				<td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
			</tr>
			<?php foreach($event['locations'] as $location){ ?>
			<tr class="row location_<?php echo $event['event_id'] ?>">
				<td><?php echo $location['name']; ?></td>
				<td><?php echo $location['address']; ?></td>
				<td><?php echo $location['capacity']; ?></td>
				<td class="center"><?php echo number_format($location['rate'], 2, ',', '.'); ?></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<?php } ?>
			<?php foreach($event['resources'] as $resource){ ?>
			<tr class="row resource_<?php echo $event['event_id'] ?>">
				<td><?php echo $resource['name']; ?></td>
				<td><?php echo $resource['description']; ?></td>
				<td><?php echo $resource['type_name']; ?></td>
				<td class="center"><?php echo number_format($resource['rate'], 2, ',', '.'); ?></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<?php } ?>
			<?php } ?>
    </table>
</div>

<script>
	$(document).ready(function(){
		$('.row').hide();
	});
	
	function showLocRes(event_id){
		$('.row').hide();
		$('.location_'+event_id).show();
		$('.resource_'+event_id).show();
	}

