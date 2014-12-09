<?php
// basefolder instelling wordt gedaan in de autoloader
require('includes/include.Autoloader.php');
// server settings worden gedaan in de construct van LoadSettings
new LoadSettings;
?>
<a href="<?php DOCUMENTROOT; ?>">Eventplanner Home</a><br />
<?=SERVEROWNER.'<br />'?>
