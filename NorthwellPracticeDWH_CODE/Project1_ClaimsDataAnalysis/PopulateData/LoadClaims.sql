-- Use the NorthwellPracticeDWH database
USE NorthwellPracticeDWH;
GO

BEGIN TRY
    -- Insert sample data into the Stg_Claims staging table
    INSERT INTO Stg_Claims (
        ClaimID, PatientID, PayerID, StatusID, SubmissionDate, ProcessingTime, Amount
    )
    VALUES
        (1, 101, 201, 301, '2023-01-01', 5, 1500.00), -- Sample claim 1
        (2, 102, 202, 302, '2023-01-05', 8, 2300.00), -- Sample claim 2
        (3, 103, 201, 301, '2023-01-10', 3, 1200.00), -- Sample claim 3
        (4, 104, 203, 303, '2023-01-12', 10, 3100.00), -- Sample claim 4
        (5, 105, 204, 301, '2023-01-15', NULL, 4500.00); -- Sample claim 5 with NULL processing time
    GO

    -- Insert sample data into the Stg_Payers staging table
    INSERT INTO Stg_Payers (
        PayerID, PayerName
    )
    VALUES
        (201, 'Blue Cross'),
        (202, 'United Health'),
        (203, 'Aetna'),
        (204, 'Cigna');
    GO

    -- Insert sample data into the Stg_ClaimStatus staging table
    INSERT INTO Stg_ClaimStatus (
        StatusID, StatusName
    )
    VALUES
        (301, 'Approved'),
        (302, 'Denied'),
        (303, 'Pending');
    GO

    -- Insert sample data into the Stg_Patients staging table
    INSERT INTO Stg_Patients (
        PatientID, FirstName, LastName, DateOfBirth, Gender
    )
    VALUES
        (101, 'John', 'Doe', '1985-06-15', 'Male'),
        (102, 'Jane', 'Smith', '1990-08-20', 'Female'),
        (103, 'Robert', 'Brown', '1975-02-12', 'Male'),
        (104, 'Emily', 'Davis', '1988-11-05', 'Female'),
        (105, 'Michael', 'Wilson', '2000-01-01', 'Male');
    GO

    -- Log successful insertion
    INSERT INTO dbo.ETL_Log (ProcessName, Status, RecordsProcessed)
    VALUES ('LoadClaims', 'Success', @@ROWCOUNT);
END TRY
BEGIN CATCH
    -- Log any errors
    INSERT INTO dbo.ETL_Log (ProcessName, Status, ErrorMessage)
    VALUES ('LoadClaims', 'Failed', ERROR_MESSAGE());
END CATCH;
GO

-- Verify that the data has been inserted into the staging tables
-- Check Stg_Claims
SELECT * FROM Stg_Claims;
GO

-- Check Stg_Payers
SELECT * FROM Stg_Payers;
GO

-- Check Stg_ClaimStatus
SELECT * FROM Stg_ClaimStatus;
GO

-- Check Stg_Patients
SELECT * FROM Stg_Patients;
GO
