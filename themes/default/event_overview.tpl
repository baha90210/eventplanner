
<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
                                                   
                            
                            
                            
                            
				<td><?php echo $this->label_event_name; ?></td>
				<td><?php echo $this->label_event_startdatum; ?></td>
				<td><?php echo $this->label_event_einddatum; ?></td>
				<td><?php echo $this->label_event_prijs; ?></td>
				<td colspan="3"><?php echo $this->label_event_edit; ?></td>
<!--				<td><?php echo $this->label_event_delete; ?></td>
				<td><?php echo $this->label_event_pdf; ?></td>-->

			</tr>
		</thead>
		<tbody>
			<?php foreach($this->events as $event){ ?>
			<tr onclick="showLocRes(<?php echo $event['event_id'] ?>);">
				<td><?php echo stripslashes($event['name']); ?></td>
				<td><?php echo $event['start_date']; ?></td>
				<td><?php echo $event['end_date']; ?></td>
				<td><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
				<td><a href="index.php?route=event/edit&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
				<td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
				<!-- toegevoegd Oorzaak ivm pdf functie -->
				<td><a target=_blank href="index.php?route=event/event_pdf&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/pdf.png"  /></a></td>		
			</tr>
                        <?php if($event['locations'] !=''){ ?>
                            <tr class="gray row location_<?php echo $event['event_id'] ?>">
                                <td ><?php echo $this->label_locations; ?></td>
                                <td ><?php echo $this->label_locations_adres; ?></td>
                                <td ><?php echo $this->label_locations_cap; ?></td>
                                <td ><?php echo $this->label_locations_price; ?></td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>

                            </tr>
                        <?php } ?>                        
			<?php foreach($event['locations'] as $location){ ?>
			<tr class="row items location_<?php echo $event['event_id'] ?>">
				<td><?php echo stripslashes($location['name']); ?></td>
				<td><?php echo $location['address']; ?></td>
				<td><?php echo $location['capacity']; ?></td>
				<td><?php echo number_format($location['rate'], 2, ',', '.'); ?></td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>
			</tr>
			<?php } ?>
                        <?php if($event['resources'] !=''){ ?>
                            <tr class="gray row resource_<?php echo $event['event_id'] ?>">
                                <td><?php echo $this->label_resources; ?></td>
                                <td><?php echo $this->label_resources_desc; ?></td>
                                <td><?php echo $this->label_resources_type; ?></td>
                                <td><?php echo $this->label_resources_price; ?></td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>

                            </tr>
                        <?php } ?>                        
			<?php foreach($event['resources'] as $resource){ ?>
			<tr class="row items resource_<?php echo $event['event_id'] ?>">
				<td><?php echo $resource['name']; ?></td>
				<td><?php echo $resource['description']; ?></td>
				<td><?php echo $resource['type_name']; ?></td>
				<td><?php echo number_format($resource['rate'], 2, ',', '.'); ?></td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>
				<td class="clear">&nbsp;</td>
			</tr>
			<?php } ?>
                        <?php if($event['performances'] !=''){ ?>
                            <tr class="gray row performance_<?php echo $event['event_id'] ?>">
                                <td><?php echo $this->label_performances; ?></td>
                                
                                <td><?php echo $this->label_performances_artist_name; ?></td>
                                <td><?php echo $this->label_performances_from; ?></td>
                                <td><?php echo $this->label_performances_until; ?></td>
                                <td><?php echo $this->label_performances_rate; ?></td>
                            </tr>
                        <?php } ?>
                        <?php //echo "<pre>";var_dump($event); echo "</pre>";?>
			<?php foreach($event['performances'] as $performance){ ?>
			<tr class="row items performance_<?php echo $event['event_id'] ?>">
				<td><?php echo $performance['performance_title']; ?></td>
				<td><?php echo $performance["name"]; ?></td>
				<td><?php echo $performance["date_from"]; ?></td>
				<td><?php echo $performance["date_until"]; ?></td>
                                <td><?php echo number_format($performance['rate'], 2, ',', '.'); ?></td>
				
				
			</tr>
			<?php } ?>

			<?php } ?>
                        
			<tr><td colspan="6"><input type="button" onclick="addEvent();" value="Event toevoegen" /></td></tr>
    </table>
</div>

<script>
	$(document).ready(function(){
		$('.row').hide();
	});
	
	function addEvent(){
		document.location.href='index.php?route=event/add&token=<?php echo $_GET['token']; ?>';
	}
	
	function showLocRes(event_id){
		$('.row').hide();
		$('.location_'+event_id).show();
		$('.resource_'+event_id).show();
		$('.performance_'+event_id).show();
	}
</script>
