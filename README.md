eventplanner
============

8-2: locations table uitgebreid met postcode, plaats en land coor extra adres gegevens die nodig zijn voor kaartjes.

ALTER TABLE `location` ADD `postcode` VARCHAR(6) NOT NULL AFTER `address`, ADD `plaats` VARCHAR(50) NOT NULL AFTER `postcode`;
ALTER TABLE `location` ADD `land` VARCHAR(50) NOT NULL AFTER `plaats`;

5-2: Loginmodule: rememberme vinkje werkt nu. (Joan)
----------------

7-2 : performance toevoegen aan event werkt nu! 

TODO:
Er zit nog een vette fout in de artist module...image upload finfo class not found...in system/library/


Mensen het belangrijkst van git is dat na het clonen van de "master"....

!!!!!ELKE keer VOOR je begint met programmeren!!!!!!
          !!!!!!!!!EERST PULLEN!!!!!!!!!!!!
          
Anders heb je de veranderingen van een ander niet....
Daardoor krijg je "merge" problemen....
En die veranderingen van een ander worden bij jou "commit" en "push" gewist uit de code.
Dus EERST !!!!! PULL!!!!!!! Daarna zelf aan het werk gaan!

!!!!!ik heb het voor elkaar add insert update en delete!!!!!!
testen op : 

http://www.electroman.nl/netprojects/eduvisionmasterclass/boudewijns%20bestanden/oef3/index.php?route=event/overview

hulp voor het vullen van deze read.me : 

https://help.github.com/articles/github-flavored-markdown/
>>>>>>> ef56c75022e5a154e2900bf2d64efe7ad125f9e3


