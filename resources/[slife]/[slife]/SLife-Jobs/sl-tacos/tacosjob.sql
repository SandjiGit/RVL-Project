INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_tacos','Tacos',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_tacos', 'Tacos', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('tacos', 'Tacos', 1);


INSERT INTO `job_grades` (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('90', 'tacos',0,'recrue','Recrue',12,'{}','{}'),
	('91', 'tacos',1,'novice','Novice',24,'{}','{}'),
	('92', 'tacos',2,'experimente','Experimente',36,'{}','{}'),
	('93', 'tacos',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('94', 'tacos',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`, `degrademodifier`, `unique`) VALUES
('tacos2', 'Tacos 2 viandes', 15, 0, 1, 1, 0),
('tacos3', 'Tacos 3 viandes', 15, 0, 1, 1, 0),
('tacosxll', 'Tacos XXL', 15, 0, 1, 1, 0),
('gigatacos', 'Giga tacos', 15, 0, 1, 1, 0),
('petitefrite', 'Petite Frite', 15, 0, 1, 1, 0),
('moyennefrite', 'Moyenne Frite', 15, 0, 1, 1, 0),
('grandefrite', 'Grande Frite', 15, 0, 1, 1, 0),
('sundaynature', 'Sunday Nature', 15, 0, 1, 1, 0),
('sundayfraise', 'Sunday Fraise', 15, 0, 1, 1, 0),
('tacosfroid2', 'Tacos 2 viandes Froid', 15, 0, 1, 1, 0),
('tacosfroid3', 'Tacos 3 viandes Froid', 15, 0, 1, 1, 0),
('gigatacosfroid', 'Giga Tacos Froid', 15, 0, 1, 1, 0),
('tacosfroidxll', 'Tacos XXL Froid', 15, 0, 1, 1, 0),
('petitefroidfrite', 'Petite Frite Froid', 15, 0, 1, 1, 0),
('moyennefroidfrite', 'Moyenne Frite Froid', 15, 0, 1, 1, 0),
('grandefroidfrite', 'Grande Frite Froid', 15, 0, 1, 1, 0),
('gobeletvide', 'Gobelet vide', 15, 0, 1, 1, 0),
('gobeletdecoca', 'Gobelelet de coca', 15, 0, 1, 1, 0),
('gobeletdehawai', 'Gobelelet de hawai', 15, 0, 1, 1, 0),
('gobeletdeicetea', 'Gobelelet de icetea', 15, 0, 1, 1, 0);






