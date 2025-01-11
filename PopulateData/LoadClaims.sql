-- Use the correct database
USE NorthwellPracticeDWH;
GO

-- Insert initial data into DimPayers
-- Adding sample payers to the DimPayers table for claims association
INSERT INTO DimPayers (PayerName)
VALUES 
('Blue Cross Blue Shield'), -- Large insurance provider
('United Healthcare'),       -- National health insurance
('Aetna'),                   -- Private health insurer
('Cigna');                   -- Global health services company

-- Insert initial data into DimClaimStatus
-- Adding predefined statuses to categorize claims
INSERT INTO DimClaimStatus (StatusName)
VALUES 
('Approved'), -- Indicates the claim was accepted
('Denied'),   -- Indicates the claim was rejected
('Pending');  -- Indicates the claim is under review

-- Insert initial data into FactClaims
-- Adding initial claim records for testing purposes
INSERT INTO FactClaims (PatientID, PayerID, StatusID, SubmissionDate, ProcessingTime, Amount)
VALUES 
(1, 1, 1, '2023-01-10', 5, 1500.00), -- Approved claim with 5 days processing time
(2, 2, 2, '2023-01-12', 7, 1200.00), -- Denied claim with 7 days processing time
(3, 3, 3, '2023-01-15', NULL, 2000.00), -- Pending claim with no processing time yet
(4, 4, 1, '2023-01-18', 3, 800.00);   -- Approved claim processed in 3 days
