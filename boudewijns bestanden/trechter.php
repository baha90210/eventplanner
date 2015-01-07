<?php
$demention = 7;
echo "<table style='border: 1px solid black;'>";
for($r=0;$r<$demention;$r++){
	//eerste loop
	echo "<tr style='border: 1px solid black;' >";
	for($c=0;$c<$demention;$c++){
		//tweede loop
		echo"<td style='border: 1px solid black;' >";
		if($r < $c || $c > ($demention < ($r+1/2))){
			
				echo $r."X" ;
			
		}

		echo"</td>";

	}
	echo"</tr>";

}
echo"</table>";