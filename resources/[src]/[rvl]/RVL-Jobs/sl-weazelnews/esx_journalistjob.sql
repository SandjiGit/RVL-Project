USE `v5`;

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_journaliste', 'Journaliste', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_journaliste', 'Journaliste', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_journaliste', 'Journaliste', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('journaliste', 'Journaliste')
;

INSERT INTO `job_grades` (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('92', 'journaliste',0,'recrue','Recrue',12,'{}','{}'),
	('93', 'journaliste',1,'novice','Novice',24,'{}','{}'),
	('94', 'journaliste',2,'experimente','Experimente',36,'{}','{}'),
	('95', 'journaliste',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('96', 'journaliste',4,'boss','Patron',0,'{}','{}')
;


