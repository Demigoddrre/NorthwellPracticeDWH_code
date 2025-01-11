IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'NorthwellPracticeDWH'
)
BEGIN
    CREATE DATABASE NorthwellPracticeDWH;
END;
