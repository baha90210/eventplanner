<div>
    <table class="list">
        <thead>
            <tr>
                <td>Event</td>
                <td>Startdatum</td>
                <td>Einddatum</td>
                <td class="right">Toegangsprijs</td>
                <td class="right">Bewerk</td>
                <td class="right">Cancel</td>
            </tr>
        </thead>
        <tr id="tbody">
            <td><?php echo $this->event['name']; ?></td>
            <td><?php echo $this->event['start_date']; ?></td>
            <td><?php echo $this->event['end_date']; ?></td>
            <td class="right"><?php echo number_format($this->event['price'], 2, ',', '.'); ?></td>
            <td class="right"><a class="button" href="index.php?route=event/bewerkEvent&event_id=<?php echo $this->event['event_id']; ?>">O</a></td>
            <td class="right"><a  class="button" href="index.php?route=event/deleteEvent&event_id=<?php echo $this->event['event_id']; ?>">X</a></td>
        </tr>
        <tfoot>
            <tr>
                <td>Event</td>
                <td>Startdatum</td>
                <td>Einddatum</td>
                <td class="right">Toegangsprijs</td>
                <td class="right">Bewerk</td>
                <td class="right">Cancel</td>
            </tr>
        </tfoot>
    </table>
    <a class="button"href="index.php?route=event/overview">Event Overview</a>
</div>