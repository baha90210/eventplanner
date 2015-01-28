<div>
<<<<<<< HEAD
    <?php if(isset($this->msg)){ ?>
       <div class="msg"><?php echo $this->msg; ?></div>
    <?php } ?>
<<<<<<< HEAD
    <table class="list">
=======


    <table  class="list">
            <thead>
                    <tr>
                            <td>Event</td>
                            <td>Startdatum</td>
                            <td>Einddatum</td>
                            <td class="center">Toegangsprijs</td>
                            <td colspan="1">&nbsp;</td>
                    </tr>
            </thead>
            <?php //echo "<pre>";var_dump($this->events);echo "</pre>"; ?>
            <?php foreach($this->events as $event){ ?>
                <tr >
                    <td><?php echo $event['name']; ?></td>
                    <td><?php echo $event['start_date']; ?></td>
                    <td><?php echo $event['end_date']; ?></td>
                    <td class="center"><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
                    <td><a href="index.php?route=event/edit&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
                    <td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
                    <?php //echo "<pre>";var_dump($this->event_locationsdata[$event['event_id']]);echo "</pre>"; ?>
                    <?php if($this->event_locationsdata[$event['event_id']] !='') { ?>

                    <thead id="location"  class="location" style="background-color:lightblue;font-size:14px;">

                        <td colspan="2">Locatie</td>
                        <td colspan="2">Adres</td>
                        <td>Rate</td>
                        <td>Capacity</td>
                     </thead>
                    <?php foreach($this->event_locationsdata[$event['event_id']] as $event_location) { ?>
                    <tr style="background-color:lightblue;font-size:11px;" class="location">

                        <td colspan="2"><?php echo $event_location[0]['name']; ?> </td>
                        <td colspan="2"><?php echo $event_location[0]['address']; ?> </td>
                        <td><?php echo $event_location[0]['rate']; ?> </td>
                        <td><?php echo $event_location[0]['capacity']; ?> </td>
                    </tr>

                    <?php } ?>
                    <?php } ?>
                    <?php //echo "<pre>";var_dump($this->locations);echo "</pre>"; ?>
                    <?php //echo "<pre>";var_dump($this->event_resourcesdata[$event['event_id']]);echo "</pre>"; ?>
                    <?php if($this->event_resourcesdata[$event['event_id']] !='') { ?>

                        <thead id="resource" class="resource" style="background-color:lightgreen;font-size:14px;">

                            <td colspan="2">Resource</td>
                            <td colspan="2">Description</td>
                            <td>Rate</td>
                            <td>Type</td>
                         </thead>
                        <?php foreach($this->event_resourcesdata[$event['event_id']] as $event_resource) { ?>
                        <tr class="resource" style="background-color:lightgreen;font-size:11px;">

                            <td colspan="2"><?php echo $event_resource[0]['name']; ?> </td>
                            <td colspan="2"><?php echo $event_resource[0]['description']; ?> </td>
                            <td><?php echo $event_resource[0]['rate']; ?> </td>
                            <td><?php echo $event_resource[0]['type']; ?> </td>
                        </tr>

                        <?php } ?>
                    <?php } ?>
                    <?php //echo "<pre>";var_dump($this->resources);echo "</pre>"; ?>

                </tr>
        <?php } ?>
            <tr><td colspan="6"><input type="button" onclick="addEvent();" value="Event toevoegen" /></td></tr>
    </table>


=======
>>>>>>> FETCH_HEAD
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
>>>>>>> 2a9f62c6f01292d63d2718e496b4cfdb6af5ac2d
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
			<tr>
				<td><?php echo $event['name']; ?></td>
				<td><?php echo $event['start_date']; ?></td>
				<td><?php echo $event['end_date']; ?></td>
				<td class="center"><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
				<td><a href="index.php?route=event/edit&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
				<td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
			</tr>
			<?php foreach($event['locations'] as $location){ ?>
			<tr class="location_<?php echo $event['event_id'] ?>">
				<td><?php echo $location['name']; ?></td>
				<td><?php echo $location['address']; ?></td>
				<td><?php echo $location['capacity']; ?></td>
				<td class="center"><?php echo number_format($location['rate'], 2, ',', '.'); ?></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> FETCH_HEAD
			<?php } ?>
			<?php foreach($event['resources'] as $resource){ ?>
			<tr class="resource_<?php echo $event['event_id'] ?>">
				<td><?php echo $resource['name']; ?></td>
				<td><?php echo $resource['description']; ?></td>
				<td><?php echo $resource['type_name']; ?></td>
				<td class="center"><?php echo number_format($resource['rate'], 2, ',', '.'); ?></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<?php } ?>
			<?php } ?>
			<tr><td colspan="6"><input type="button" onclick="addEvent();" value="Event toevoegen" /></td></tr>
    </table>
<<<<<<< HEAD
=======
		<?php } ?>
		<tr><td colspan="6"><input type="button" onclick="addEvent();" value="Event toevoegen" /></td></tr>
		<tr><td colspan="6"><a href="index.php?route=location/overview&token=<?php echo $_GET['token'] ?>">Locaties beheren</a></td></tr>
	</table>

>>>>>>> 2a9f62c6f01292d63d2718e496b4cfdb6af5ac2d
=======
>>>>>>> FETCH_HEAD
</div>

<script>
	function addEvent(){
		document.location.href='index.php?route=event/add&token=<?php echo $_GET['token']; ?>';
	}
</script>