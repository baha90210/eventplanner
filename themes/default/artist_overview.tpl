<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead>
			<tr>
				<td>Artiest</td>
				<td>Prijs</td>
			</tr>
		</thead>
		<?php foreach($this->artists as $artist){ ?>
			<tr>
				<td>
				<a href="index.php?route=artist/profile&id=<?php echo $artist['artist_id'] ?>&token=<?php echo $_GET['token'] ?>">
				<?php echo $artist['name']; ?>
				</a>
				</td>
				<td style="text-align:right;"><?php echo $artist['rate']; ?></td>
				<td><a title="Edit <?php echo $artist['name']; ?>" href="index.php?route=artist/edit&id=<?php echo $artist['artist_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/edit.png"  /></a></td>
				<td><a title="Remove <?php echo $artist['name']; ?>" href="index.php?route=artist/delete&id=<?php echo $artist['artist_id'] ?>&token=<?php echo $_GET['token'] ?>"><img src="./themes/<?php echo THEME ?>/images/remove.png"  /></a></td>
			</tr>
		<?php } ?>
		<tr><td colspan="4"><input type="button" onclick="addArtist();" value="Artiest toevoegen" /></td></tr>
	</table>
</div>

<script>
	function addArtist(){
		document.location.href='index.php?route=artist/add&token=<?php echo $_GET['token'] ?>';
	}
</script>