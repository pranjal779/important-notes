-- https://www.w3schools.com/sql/sql_backup_db.asp
-- BACKUP DATABASE databasename
-- TO DISK = 'filepath';

BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';


BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak'
WITH DIFFERENTIAL;
