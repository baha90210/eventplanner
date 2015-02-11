<div>
<?php echo $this->welcome; ?>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
        <div>
	        <select id="event" name="event" onchange="SelectRows()">
	            <option value=""><?php echo $this->all_events; ?></option>   
	            <?php foreach($this->events as $events){ ?>
	                <option value="<?php echo $events['event_id']; ?>"  <?php echo(isset($_GET['event']) && $events['event_id']==$_GET['event'])?'selected':'' ?> >
	                <?php echo $events['name']; ?>
	                </option>
	            <?php } ?>
	        </select>
	        <select id="artist" name="artist" onchange="SelectRows()">
	            <option value="">Alle Artiesten</option>   
	            <?php foreach($this->artists as $artists){ ?>
	                <option value="<?php echo $artists['artist_id']; ?>" <?php if (isset($_GET['artist']) && isset($_GET['artist'])) echo($artists['artist_id']==$_GET['artist'])?'selected':'' ?> >
	                <?php echo $artists['name']; ?>
	                </option>
	            <?php } ?>
	        </select>
                <input type="button" onclick="addPerformance();" value="Performance toevoegen" />
        </div>
        <table class="list">
            <thead>
                <tr>
                    <td>Event</td>
                    <td>Titel</td>
                    <td>Artist</td>
                    <td>Location</td>
                    <td>Start datum</td>
                    <td>Eind datum</td>
                    <td>Confirmed</td>
                    <td colspan="1">&nbsp;</td> 
                </tr>
            </thead>
		<?php foreach($this->performance as $perf){ ?>
            <tr class="row artist_<?php echo $perf['artist_id'] ?> event_<?php echo $perf['event_id'] ?>" onclick="getArtistInfo(<?php echo $perf['artist_id'] ?>);">
                <td><?php echo $perf['eventname']; ?></td>
                <td><?php echo $perf['performance_title']; ?></td>
                <td><?php echo $perf['artistname']; ?></td>
                <td><?php echo $perf['location_name']; ?></td>
                <td><?php echo $perf['date_from']; ?></td>
                <td><?php echo $perf['date_until']; ?></td>
                <td><?php if ($perf['confirmed']==1) echo ('Ja'); ?></td>
                <td><a href="index.php?route=performance/edit&id=<?php echo $perf['performance_id'] ?>&token=<?php echo $_GET['token'] ?>">Edit</a></td>
		<td><a href="index.php?route=performance/delete&id=<?php echo$perf['performance_id'] ?>&token=<?php echo $_GET['token'] ?>">Del</a></td>
			</tr>
		<?php } ?>		
		<tr><td colspan="8"><input type="button" onclick="addPerformance();" value="Performance toevoegen" /></td></tr>
	</table>
</div>
<div id="artist_info"></div>
<script>
	function addPerformance(){
		document.location.href='index.php?route=performance/add&token=<?php echo $_GET['token'] ?> ';
	}
	function __SelectEvent(){
            var myselect = document.getElementById("event");
            var str = myselect.options[myselect.selectedIndex].value;
            var location = 'index.php?route=performance/overview&event='.concat(str,'&token=<?php echo $_GET['token'] ?>');
            document.location.href=location;
        }

    function SelectRows(){

        /* Kortere SelectRows door Alexander */

        // Verberg alles
        $('.row').hide();

        artist_id = $('select[name="artist"]').val();
        event_id = $('select[name="event"]').val();

        // Bepaal welke regels getoond moeten worden
        selector = '.row'; // Begin met alles
        if (event_id) { selector += '.event_'+event_id; } // Voeg event toe als die is ingesteld.
        if (artist_id) { selector += '.artist_'+artist_id; } // Voeg artist toe als die is ingesteld.

        $(selector).show(); // Toon deze rijen.

    }
    
    function getArtistInfo(artist_id){
		$.ajax({
			url: "index.php?route=artist/getInfo",
			type: "get",
			data: "artist_id="+artist_id+"&token=<?php echo $_GET['token']; ?>",
			dataType: 'json',
			success: function(json){
				console.log(json);
				inhoud  = 'Naam: '+json['name']+'<br />';
				inhoud += 'Tarief: '+json['rate']+'<br />';
				inhoud += 'Website: '+json['website']+'<br />';

				$('#artist_info').html(inhoud);
			},
			error: function(){
			}
		});
	}
</script>