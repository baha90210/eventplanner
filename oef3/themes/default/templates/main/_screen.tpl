<?php $hallo = explode('-',$this->title); ?>
<div id="<?php echo str_replace(' ','', $hallo[1]) ?>">
    <table class="list">
        <thead>
            <tr>
                <td>Main menu</td>

            </tr>
        </thead>
        <?php foreach($this->mainmenu_items as $menu_item){ ?>
            <tr id="tbody">
                <td><a  href="index.php?route=<?php echo $menu_item['Tables_in_boudewijn_event'] ?>/overview" ><?php echo $menu_item['Tables_in_boudewijn_event']; ?></a></td>
                <td><<?php echo $menu_item["Tables_in_boudewijn_event"]; ?></td>
               <!-- <td class="right"><a class="button" href="index.php?route=event/bewerkEvent&event_id=<?php echo $menu_item['event_id']; ?>">O</a></td>
                <td class="right"><a class="button" href="index.php?route=event/deleteEvent&event_id=<?php echo $menu_item['event_id']; ?>">X</a></td>
           --> </tr>
        <?php } ?>
        <tfoot>
            <tr>
                <td>Main menu</td>

            </tr>
        </tfoot>
    </table>
</div>