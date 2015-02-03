<div>
    <?php if(isset($this->msg)){ ?>
    <div class="msg"><?php echo $this->msg; ?></div>
    <?php } ?>
    <table class="list">
        <thead>
        <tr class="gray">
            <td>Event</td>
            <td>Startdatum</td>
            <td>Einddatum</td>
            <td class="center">Toegangsprijs</td>
            <td colspan="2">&nbsp;</td>
        </tr>
        </thead>
        <tbody>
            <?php foreach($this->events as $event){ ?>
            <tr onclick="showLocRes(<?php echo $event['event_id'] ?>);">
                <td><?php echo stripslashes($event['name']); ?></td>
                <td><?php echo $event['start_date']; ?></td>
                <td><?php echo $event['end_date']; ?></td>
                <td class="center"><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
                <td><a href="index.php?route=event/edit&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
                <td><a href="index.php?route=event/delete&id=<?php echo $event['event_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
            </tr>
            <?php if($event['locations'] !=''){ ?>
            <tr class="gray rij location_<?php echo $event['event_id'] ?>"><td colspan="6">Locaties</td></tr>
            <?php } ?>    
            <?php foreach($event['locations'] as $location){ ?>
            <tr class="rij location_<?php echo $event['event_id'] ?>">
                <td><?php echo $location['name']; ?></td>
                <td><?php echo $location['address']; ?></td>
                <td><?php echo $location['capacity']; ?></td>
                <td class="center"><?php echo number_format($location['rate'], 2, ',', '.'); ?></td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <?php } ?>
            <?php if($event['resources'] !=''){ ?>
            <tr class="gray rij resource_<?php echo $event['event_id'] ?>"><td colspan="6">Resources</td></tr>
            <?php } ?> 
            <?php foreach($event['resources'] as $resource){ ?>
            <tr class="rij resource_<?php echo $event['event_id'] ?>">
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
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function(){
        $('.rij').hide();
    });

    function addEvent(){
        document.location.href='index.php?route=event/add&token=<?php echo $_GET['token']; ?>';
    }

    function showLocRes(event_id){
        $('.rij').hide();
        $('.location_'+event_id).show();
        $('.resource_'+event_id).show();
    }
</script>