USE `es_extended`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_taxi', 'Taxi', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('taxi', 'Taxi')
;

INSERT INTO `job_grades` (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('144', 'taxi',0,'recrue','Recrue',12,'{}','{}'),
	('144', 'taxi',1,'novice','Novice',24,'{}','{}'),
	('144', 'taxi',2,'experimente','Experimente',36,'{}','{}'),
	('144', 'taxi',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('144', 'taxi',4,'boss','Patron',0,'{}','{}')
;

