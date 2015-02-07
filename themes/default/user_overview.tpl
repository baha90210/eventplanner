<div>
	<?php if(isset($this->msg)){ ?>
	<div class="msg"><?php echo $this->msg; ?></div>
	<?php } ?>
	<table class="list">
		<thead class="theader">
			<tr>
				<td>&nbsp;<br />User</td>
				<td>Autorisatiegroepen<br /><small>(klik op e-mailadres)</small></td>
				<td>&nbsp;<br />Laatste login</td>
				<td colspan="2">&nbsp;<br />BeheerActies</td>
			</tr>
		</thead>
		<?php $helpuser = ''; //om te voorkomen dat user meerdere keren wordt getoond
              $search=array("@","."); //key is emailadres maar javascript accepteert geen @ en . in een variabele; vandaar str_replace
		foreach($this->users as $user){
		    if($helpuser != $user['email']){ ?>
      			<tr onclick="showGroups('<?php echo str_replace($search, "", $user['email']); ?>');">
    				<td><?php echo $user['email']; ?></td>
    				<td>&nbsp;</td>
    				<td><?php echo $user['date_last_logged_in']; ?></td>
    				<td><a href="index.php?route=user/edit&email=<?php echo $user['email'] ?>&token=<?php echo $_GET['token'] ?>">Edit</a></td>
    				<td><a href="index.php?route=user/delete&email=<?php echo $user['email'] ?>&token=<?php echo $_GET['token'] ?>">Delete</a></td>
    			</tr>
		<?php   $helpuser = $user['email'];
		    }
                if($user['name'] !=""){ ?>
                    <tr class="row group_<?php echo str_replace($search, "", $user['email']); ?>">
        				<td align="right">&#10162; &nbsp;</td>
                        <td><?php echo $user['name']; ?></td>
                        <td colspan="3">&nbsp;</td>
                    </tr>
        <?php   }
        } ?>
		<tr><td class="test" colspan="5">&nbsp;</td></tr>
        <tr><td colspan="5"><input type="button" onclick="addUser();" value="User toevoegen" /></td></tr>
	</table>
</div>

<script>
    $(document).ready(function(){
    	$('.row').hide();
    });
    
	function showGroups(email){
		$('.row').hide();
		$('.group_'+email).show();
	}

	function addUser(){
		document.location.href='index.php?route=user/add&token=<?php echo $_GET['token'] ?>';
	}
</script>