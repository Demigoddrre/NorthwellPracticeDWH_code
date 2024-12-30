-- Use the NorthwellPracticeDWH database
USE NorthwellPracticeDWH;
GO

-- Staging Table: Stg_Claims
-- Temporary storage for raw claims data before transformation.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_Claims'
)
BEGIN
    CREATE TABLE Stg_Claims (
        ClaimID INT,                -- Unique identifier for the claim
        PatientID INT,              -- Identifier for the patient
        PayerID INT,                -- Identifier for the payer
        StatusID INT,               -- Identifier for the claim status
        SubmissionDate DATE,        -- Date the claim was submitted
        ProcessingTime INT,         -- Processing time in days
        Amount DECIMAL(10, 2)       -- Claim amount in dollars
    );
END;
GO

-- Staging Table: Stg_Payers
-- Temporary storage for raw payer data before transformation.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_Payers'
)
BEGIN
    CREATE TABLE Stg_Payers (
        PayerID INT,                -- Identifier for the payer
        PayerName NVARCHAR(100)     -- Name of the payer
    );
END;
GO

-- Staging Table: Stg_ClaimStatus
-- Temporary storage for raw claim status data before transformation.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_ClaimStatus'
)
BEGIN
    CREATE TABLE Stg_ClaimStatus (
        StatusID INT,               -- Identifier for the claim status
        StatusName NVARCHAR(50)     -- Name of the claim status (e.g., Approved, Denied)
    );
END;
GO

-- Staging Table: Stg_Patients
-- Temporary storage for raw patient data before transformation.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_Patients'
)
BEGIN
    CREATE TABLE Stg_Patients (
        PatientID INT,              -- Identifier for the patient
        FirstName NVARCHAR(50),     -- First name of the patient
        LastName NVARCHAR(50),      -- Last name of the patient
        DateOfBirth DATE,           -- Date of birth of the patient
        Gender NVARCHAR(10)         -- Gender of the patient
    );
END;
GO
