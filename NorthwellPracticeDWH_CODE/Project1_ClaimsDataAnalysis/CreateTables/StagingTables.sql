-- Use the NorthwellPracticeDWH database
USE NorthwellPracticeDWH;
GO

-- Staging Table: Stg_Claims
-- Temporary storage for raw claims data before transformation
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_Claims'
)
BEGIN
    CREATE TABLE dbo.Stg_Claims (
        ClaimID NVARCHAR(50),           -- Unique identifier for the claim (string-based ID in the CSV)
        ProviderID NVARCHAR(50),        -- Identifier for the provider
        PatientID NVARCHAR(50),         -- Identifier for the patient
        DateOfService DATE,             -- Date the service was provided
        BilledAmount DECIMAL(10, 2),    -- Amount billed
        ProcedureCode NVARCHAR(50),     -- Procedure code
        DiagnosisCode NVARCHAR(50),     -- Diagnosis code
        AllowedAmount DECIMAL(10, 2),   -- Amount allowed
        PaidAmount DECIMAL(10, 2),      -- Amount paid
        InsuranceType NVARCHAR(50),     -- Type of insurance (e.g., Medicare, Medicaid)
        ClaimStatus NVARCHAR(50),       -- Status of the claim (e.g., Paid, Denied)
        ReasonCode NVARCHAR(255),       -- Reason code for the status
        FollowUpRequired NVARCHAR(3),   -- Whether follow-up is required (Yes/No)
        ARStatus NVARCHAR(50),          -- Accounts receivable status (e.g., Pending, Closed)
        Outcome NVARCHAR(50)            -- Final outcome (e.g., Paid, Partially Paid, Denied)
    );
END;
GO

-- Staging Table: Stg_Payers
-- Temporary storage for raw payer data before transformation
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_Payers'
)
BEGIN
    CREATE TABLE dbo.Stg_Payers (
        PayerID INT,                -- Identifier for the payer
        PayerName NVARCHAR(100)     -- Name of the payer
    );
END;
GO

-- Staging Table: Stg_ClaimStatus
-- Temporary storage for raw claim status data before transformation
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_ClaimStatus'
)
BEGIN
    CREATE TABLE dbo.Stg_ClaimStatus (
        StatusID INT,               -- Identifier for the claim status
        StatusName NVARCHAR(50)     -- Name of the claim status (e.g., Approved, Denied)
    );
END;
GO

-- Staging Table: Stg_Patients
-- Temporary storage for raw patient data before transformation
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'Stg_Patients'
)
BEGIN
    CREATE TABLE dbo.Stg_Patients (
        PatientID INT,              -- Identifier for the patient
        FirstName NVARCHAR(50),     -- First name of the patient
        LastName NVARCHAR(50),      -- Last name of the patient
        DateOfBirth DATE,           -- Date of birth of the patient
        Gender NVARCHAR(10)         -- Gender of the patient
    );
END;
GO
