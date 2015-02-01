<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
        <div class="row form-group form-horizontal" >
        	<div class="col-xs-3">
	        <select name="event" class="form-control" onchange="SelectRows()">
	            <option value="">Alle Events</option>   
	            <?php foreach($this->events as $events){ ?>
	                <option value="<?php echo $events['event_id']; ?>"  <?php echo(isset($_GET['event']) && $events['event_id']==$_GET['event'])?'selected':'' ?> >
	                <?php echo $events['name']; ?>
	                </option>
	            <?php } ?>
	        </select>
	        </div>
	        <div class="col-xs-3">
	        <select name="artist" class="form-control" onchange="SelectRows()">
	            <option value="">Alle Artiesten</option>   
	            <?php foreach($this->artists as $artists){ ?>
	                <option value="<?php echo $artists['artist_id']; ?>" <?php if (isset($_GET['artist']) && isset($_GET['artist'])) echo($artists['artist_id']==$_GET['artist'])?'selected':'' ?> >
	                <?php echo $artists['name']; ?>
	                </option>
	            <?php } ?>
	        </select>
	        </div>
        </div>
		<table class="table table-hover">
        <thead><tr>
			<td>Event</td>
			<td>Titel</td>
			<td>Artiest</td>
			<td>Start datum</td>
			<td>Eind datum</td>
			<td>Confirmed</td>
 			<td>&nbsp;</td> 
		</tr></thead>
		<?php foreach($this->performance as $perf){ ?>
            <tr class="rij artist_<?php echo $perf['artist_id'] ?> event_<?php echo $perf['event_id'] ?>" onclick="getArtistInfo(<?php echo $perf['artist_id'] ?>);">
                <td><?php echo $perf['eventname']; ?></td>
                <td><?php echo $perf['performance_title']; ?></td>
                <td><?php echo $perf['artistname']; ?></td>
                <td><?php echo $perf['date_from']; ?></td>
                <td><?php echo $perf['date_until']; ?></td>
                <td><?php echo $perf['confirmed']; ?></td>
                <td><a href="index.php?route=performance/edit&id=<?php echo $perf['performance_id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-edit"></span></a></td>
                <td><a href="index.php?route=performance/delete&id=<?php echo $perf['performance_id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-remove"></span></a></td>
			</tr>   
		<?php } ?>	
		</table>	
		<button type="button" class="btn btn-default" onclick="addPerformance();">Performance toevoegen</button>
</div>

<div id="artist_info" class="panel"></div>

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
        $('.rij').hide();

        artist_id = $('select[name="artist"]').val();
        event_id = $('select[name="event"]').val();

        // Bepaal welke regels getoond moeten worden
        selector = '.rij'; // Begin met alles
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
                                inhoud  =  '<div class="panel-heading">Panel heading without title</div>'
				inhoud += '<div>Naam: '+json['name']+'<br />';
				inhoud += 'Tarief: '+json['rate']+'<br />';
				inhoud += 'Website: '+json['website']+'<br /></div>';

				$('#artist_info').html(inhoud);
			},
			error: function(){
			}
		});
	}
</script>