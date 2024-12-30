-- Use the NorthwellPracticeDWH database
USE NorthwellPracticeDWH;
GO

-- Dimension Table: DimPayers
-- Stores payer information such as payer IDs and names.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'DimPayers'
)
BEGIN
    CREATE TABLE DimPayers (
        PayerID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each payer
        PayerName NVARCHAR(100) NOT NULL      -- Name of the payer
    );
END;
GO

-- Dimension Table: DimClaimStatus
-- Stores the status of claims (e.g., Approved, Denied).
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'DimClaimStatus'
)
BEGIN
    CREATE TABLE DimClaimStatus (
        StatusID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each claim status
        StatusName NVARCHAR(50) NOT NULL       -- Name of the claim status
    );
END;
GO

-- Dimension Table: DimPatients
-- Stores patient information such as demographics and unique identifiers.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'DimPatients'
)
BEGIN
    CREATE TABLE DimPatients (
        PatientID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each patient
        FirstName NVARCHAR(50) NOT NULL,         -- First name of the patient
        LastName NVARCHAR(50) NOT NULL,          -- Last name of the patient
        DateOfBirth DATE NOT NULL,               -- Date of birth of the patient
        Gender NVARCHAR(10) NOT NULL             -- Gender of the patient
    );
END;
GO

-- Dimension Table: DimDepartments
-- Stores information about hospital departments involved in claims.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'DimDepartments'
)
BEGIN
    CREATE TABLE DimDepartments (
        DepartmentID INT IDENTITY(1,1) PRIMARY KEY, -- Unique identifier for each department
        DepartmentName NVARCHAR(100) NOT NULL      -- Name of the department
    );
END;
GO
