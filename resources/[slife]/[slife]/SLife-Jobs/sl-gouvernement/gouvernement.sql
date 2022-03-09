INSERT INTO `addon_account` (name, label, shared) VALUES 
    ('society_gouvernement','Gouvernement',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
    ('society_gouvernement','Gouvernement',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
    ('society_gouvernement', 'Gouvernement', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
    ('gouvernement','Gouvernement')
;

INSERT INTO `job_grades` (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ('41', 'gouvernement',0,'society_gouvernement','Garde du Corps',2500,'{}','{}'),
    ('42', 'gouvernement',1,'boss','Président',5000,'{}','{}')
;