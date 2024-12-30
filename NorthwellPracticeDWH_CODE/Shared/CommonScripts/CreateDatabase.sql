-- Check if the database already exists
IF NOT EXISTS (
    SELECT name 
    FROM sys.databases 
    WHERE name = 'NorthwellPracticeDWH'
)
BEGIN
    -- Create the database if it does not exist
    CREATE DATABASE NorthwellPracticeDWH;
    PRINT 'Database NorthwellPracticeDWH created successfully.';
END
ELSE
BEGIN
    PRINT 'Database NorthwellPracticeDWH already exists.';
END;
GO

-- Use the created or existing database
USE NorthwellPracticeDWH;
GO

