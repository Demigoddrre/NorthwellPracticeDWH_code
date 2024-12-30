-- Fact Table: Claims
CREATE TABLE FactClaims (
    ClaimID INT PRIMARY KEY IDENTITY(1,1),
    PatientID INT NOT NULL,
    PayerID INT NOT NULL,
    StatusID INT NOT NULL,
    SubmissionDate DATE NOT NULL,
    ProcessingTime INT,
    Amount DECIMAL(10, 2) NOT NULL
);

-- Fact Table: Sales
CREATE TABLE FactSales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    RegionID INT NOT NULL,
    SaleDate DATE NOT NULL,
    Revenue DECIMAL(10, 2) NOT NULL
);
