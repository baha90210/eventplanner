eventplanner
============
<<<<<<< HEAD

eventplanner
============

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

TABELLEN AANGEPAST. 
Voor de werking van userbeheer en groepenbeheer heb ik tabel(namen) aangepast. Zie apart document of hieronder:
Gebruikte tabellen voor user- en groepbeheer:
TABEL groups
Kolom/Type/Leeg/Standaardwaarde/Opmerkingen
id/int(11)/Nee
name/varchar(255)/Nee
description/varchar(255)Nee
------------------------------------------------------------
TABEL group_rights
Kolom/Type/Leeg/Standaardwaarde/Opmerkingen
group_id/int(11)/Nee 
module/varchar(255)/Nee
edit/tinyint(1)/Nee
view/tinyint(1)/Nee
---------------------------------------------------------------
TABEL user_group
Kolom/Type/Leeg/Standaardwaarde/Opmerkingen
user_email/varchar(200)/Nee
group_id/int(11)/Nee

