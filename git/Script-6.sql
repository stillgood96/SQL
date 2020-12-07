create database playground;

create user 'playground'@'%'
identified by 'playground2020';


GRANT SELECT, INSERT, UPDATE, DELETE, 
CREATE, DROP, REFERENCES, INDEX, ALTER, 
CREATE TEMPORARY TABLES, 
LOCK TABLES, EXECUTE, CREATE VIEW, 
SHOW VIEW, CREATE ROUTINE, 
ALTER ROUTINE, TRIGGER
ON playground.* TO 'playground'@'%' 
WITH GRANT OPTION;

flush privileges;