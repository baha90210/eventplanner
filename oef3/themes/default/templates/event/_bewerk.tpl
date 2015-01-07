<div>
<?php if($this->error_msg != ''){ ?>
    <div class="error"><?php echo $this->error_msg; ?></div>	
<?php } ?>

<form class="add-event-form" method="post" action="index.php?route=event/updateEvent">
    <table  class=" list">
                <thead>
            <tr cellpadding="10">
                <td>Event</td>
                <td>Startdatum</td>
                <td>Einddatum</td>
                <td>Toegangsprijs</td>


            </tr>
        </thead>
        <tr>
            <td><p><input type="text" name="name" value="<?php echo $this->updated_event['name']; ?>" /></p></td>

            <td><p><input id="datepicker1" type="text" name="start_date" value="<?php echo $this->updated_event['start_date']; ?>" /></p></td>

            <td><p><p><input id="datepicker2" type="text" name="end_date" value="<?php echo $this->updated_event['end_date']; ?>" /></p></td>
 
            <td><p><input type="text" name="price" value="<?php echo number_format($this->updated_event['price'], 2, ',', '.'); ?>" /></p></td>


        </tr>

        <tfoot>
            <tr>
                <td>Event</td>
                <td>Startdatum</td>
                <td>Einddatum</td>
                <td>Toegangsprijs</td>
            </tr>
            <tr>
                <td>
                    <p><input type="submit" id="button-upload" name="submit" value="Bewerken" /></p>
                </td>
            </tr>
        </tfoot>
        <?php echo $_GET['event_id']; ?>
        <input type="hidden" name="event_id" value="<?php echo $_GET['event_id']; ?>" />
    </table>
</form>
</div>