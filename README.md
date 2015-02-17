eventplanner
============
11-2 :

INSERT INTO `location` (`location_id`, `name`, `address`, `postcode`, `plaats`, `land`, `rate`, `capacity`) VALUES
(3, 'Main Stage Appollo', 'Schijndel', '', '', '', 0.00, 100),
(4, 'Jack Daniels Stage', 'Schijndel', '', '', '', 0.00, 100),
(5, 'Phoenix Stage', 'Schijndel', '', '', '', 0.00, 100),
(6, 'Loco Royale Stage', 'Schijndel', '', '', '', 0.00, 100),
(7, 'Theater Stage', 'Schijndel', '', '', '', 0.00, 100),
(8, 'ParkPop Zuiderpark', 'Zuiderpark Den Haag', '', '', '', 0.00, 30000),
(9, 'Olympisch stadion', 'Olympisch Stadion 21', '1076DE', 'Amsterdam', 'Nederland', 0.00, 30000),
(10, 'Ahoy Plein', 'Ahoy-weg 10', '3084BA', 'Rotterdam', 'Nederland', 0.00, 30000),
(11, 'Strijp S', 'Torenallee 1', '', 'Eindhoven', 'Nederland', 0.00, 30000);

8-2: locations table uitgebreid met postcode, plaats en land coor extra adres gegevens die nodig zijn voor kaartjes.

ALTER TABLE `location` ADD `postcode` VARCHAR(6) NOT NULL AFTER `address`, ADD `plaats` VARCHAR(50) NOT NULL AFTER `postcode`;
ALTER TABLE `location` ADD `land` VARCHAR(50) NOT NULL AFTER `plaats`;

5-2: Loginmodule: rememberme vinkje werkt nu. (Joan)
----------------

7-2 : performance toevoegen aan event werkt nu! 






hulp voor het vullen van deze read.me : 

https://help.github.com/articles/github-flavored-markdown/
>>>>>>> ef56c75022e5a154e2900bf2d64efe7ad125f9e3


