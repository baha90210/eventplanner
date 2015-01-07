<div>
    <?php if($this->error_msg != ''){ ?>
        <div class="sixteen columns error"><?php echo $this->error_msg; ?></div>	
    <?php } ?>

    <form class="offset-by-five add-event-form" method="post" action="index.php?route=event/insertEvent">
        <table class="five columns list">
            <tr>
                <td>Name: <input type="text" name="name" value="" /></td>
            </tr>
            <tr>
                <td>Start date: <p><input id="datepicker1" type="text" name="start_date" value="" /></p></td>
            </tr>
            <tr>
                <td>End date: <p><input id="datepicker2" type="text" name="end_date" value="" /></p></td>
            </tr>
            <tr>
                <td>Price: <input type="number" name="price" value="" /></td>
            </tr>
            <tr>
                <td colspan="2">
                        <input type="submit" name="submit" value="Toevoegen" />
                </td>
            </tr>
        </table>
    </form>
</div>