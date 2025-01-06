CREATE TABLE dbo.ETL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    LogDateTime DATETIME DEFAULT GETDATE(),
    ProcessName NVARCHAR(255), -- e.g., 'LoadClaims', 'TransformToFact'
    Status NVARCHAR(50),       -- e.g., 'Success', 'Failed'
    RecordsProcessed INT,      -- Number of rows affected
    ErrorMessage NVARCHAR(MAX) -- Detailed error message if any
);
