<div>
    <table class="list">
            <thead>
                <tr>
                        <td>Event</td>
                        <td>Startdatum</td>
                        <td>Einddatum</td>
                        <td class="right">Toegangsprijs</td>
                        <td class="right">Bewerk</td>
                </tr>
            </thead>
            <tr>
                    <td><?php echo $this->name; ?></td>
                    <td><?php echo $this->startdate; ?></td>
                    <td><?php echo $this->enddate; ?></td>
                    <td class="right"><?php echo number_format($this->price, 2, ',', '.'); ?></td>
                    <td class="right"><a href="index.php?route=event/oneEvent&event_id=<?php echo $this->added_event; ?>"><?php echo $this->added_event; ?></a></td>
            </tr>
            <tr colspan="5">
                <td class="offset-by-six right"><a href="index.php?route=event/overview">Event Overview</a></td>
            </tr>
    </table>
</div>