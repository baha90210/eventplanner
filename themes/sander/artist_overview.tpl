<div>
    <div> &nbsp;</div>
    <div class="panel panel-info">
        <div class="panel-heading"><?php echo ($this->header_msg); ?></div>
        <div class="panel-body">
            <div class="row form-group form-horizontal" >
                <div class="col-sm-12">
                    <button type="button" class="btn btn-info pull-right" onclick="addArtist();">Artist toevoegen</button>
                </div>
            </div>
            <table class="table table-hover">
                <thead><tr>
    				<th>Artiest</th><th>Website</th><th>Prijs</th>
    				<th style="text-align:right;">Bewerking</th>
    			</tr></thead>
    		    <?php foreach($this->artists as $artist){ ?>
    			<tr>
                    <td><a href="index.php?route=artist/profile&id=<?php echo $artist['artist_id'] ?>&token=<?php echo $_GET['token'] ?>"><?php echo $artist['name']; ?></a></td>
                    <td><?php echo $artist['website']; ?></td>
    				<td><?php echo $artist['rate']; ?></td>
    				<td style="text-align:right;"><a title="Edit <?php echo $artist['name']; ?>" href="index.php?route=artist/edit&id=<?php echo $artist['artist_id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-edit"></span></a> &nbsp;
                        <a title="Remove <?php echo $artist['name']; ?>" href="index.php?route=artist/delete&id=<?php echo $artist['artist_id'] ?>&token=<?php echo $_GET['token'] ?>"><span class="glyphicon glyphicon-remove"></span></a>
                    </td>
    			</tr>
                <?php } ?>
                </table>
                <button type="button" class="btn btn-info" onclick="addPerformance();">Performance toevoegen</button>
        </div>
    </div>
</div>

<script>
	function addArtist(){
		document.location.href='index.php?route=artist/add&token=<?php echo $_GET['token'] ?>';
	}
</script>