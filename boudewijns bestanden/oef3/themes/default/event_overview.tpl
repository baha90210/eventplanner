<div>
    <table class="list">
        <thead>

            <tr>
                <td>Event</td>
                <td>Startdatum</td>
                <td>Einddatum</td>
                <td class="right">Toegangsprijs</td>
                <td class="right">Cancel</td>
            </tr>
        </thead>
        <?php foreach($this->events as $event){ ?>
            <tr>
                <td><?php echo $event['name']; ?></td>
                <td><?php echo $event['start_date']; ?></td>
                <td><?php echo $event['end_date']; ?></td>
                <td class="right"><?php echo number_format($event['price'], 2, ',', '.'); ?></td>
                <td class="right"><a href="index.php?route=event/deleteEvent&event_id=<?php echo $event['event_id']; ?>">X</a></td>
                
            </tr>
        <?php } ?>
            <tr colspan="5">
                <td class="offset-by-six right"><a href="index.php?route=event/addEvent">Event Toevoegen</a></td>
            </tr>
    </table>
</div>