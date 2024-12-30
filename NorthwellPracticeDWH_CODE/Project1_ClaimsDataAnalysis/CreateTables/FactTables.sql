-- Use the NorthwellPracticeDWH database
USE NorthwellPracticeDWH;
GO

-- Fact Table: FactClaims
-- Stores detailed information about each claim, including its associated dimensions.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'FactClaims'
)
BEGIN
    CREATE TABLE FactClaims (
        ClaimID INT IDENTITY(1,1) PRIMARY KEY,       -- Unique identifier for each claim
        PatientID INT NOT NULL,                     -- Foreign key to DimPatients
        PayerID INT NOT NULL,                       -- Foreign key to DimPayers
        StatusID INT NOT NULL,                      -- Foreign key to DimClaimStatus
        SubmissionDate DATE NOT NULL,               -- Date the claim was submitted
        ProcessingTime INT,                         -- Processing time in days
        Amount DECIMAL(10, 2) NOT NULL,             -- Claim amount in dollars

        -- Foreign key constraints
        CONSTRAINT FK_FactClaims_Patients FOREIGN KEY (PatientID) REFERENCES DimPatients(PatientID),
        CONSTRAINT FK_FactClaims_Payers FOREIGN KEY (PayerID) REFERENCES DimPayers(PayerID),
        CONSTRAINT FK_FactClaims_ClaimStatus FOREIGN KEY (StatusID) REFERENCES DimClaimStatus(StatusID)
    );
END;
GO

-- Fact Table: FactPreClaimEdits
-- Stores information about edits made to claims before submission.
IF NOT EXISTS (
    SELECT 1
    FROM sys.tables
    WHERE name = 'FactPreClaimEdits'
)
BEGIN
    CREATE TABLE FactPreClaimEdits (
        EditID INT IDENTITY(1,1) PRIMARY KEY,       -- Unique identifier for each edit
        ClaimID INT NOT NULL,                      -- Foreign key to FactClaims
        EditType NVARCHAR(100) NOT NULL,           -- Type of edit (e.g., validation, correction)
        ResolutionTime INT,                        -- Time taken to resolve the edit (in days)
        Status NVARCHAR(50),                       -- Status of the edit (e.g., "Resolved", "Pending")

        -- Foreign key constraints
        CONSTRAINT FK_FactPreClaimEdits_Claims FOREIGN KEY (ClaimID) REFERENCES FactClaims(ClaimID)
    );
END;
GO
