-- Create ETL_Log table
CREATE TABLE dbo.ETL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    LogDateTime DATETIME DEFAULT GETDATE(),
    ProcessName NVARCHAR(255), -- e.g., 'LoadClaims', 'TransformToFact'
    Status NVARCHAR(50),       -- e.g., 'Success', 'Failed'
    RecordsProcessed INT,      -- Number of rows affected
    ErrorMessage NVARCHAR(MAX) -- Detailed error message if any
);

-- Create ETL_FileTracking table
CREATE TABLE dbo.ETL_FileTracking (
    FileID INT IDENTITY(1,1) PRIMARY KEY,
    FileName NVARCHAR(255),      -- Name of the file being processed
    ProcessName NVARCHAR(255),   -- Name of the process using the file
    LoadStartTime DATETIME,      -- Time when the file processing started
    LoadEndTime DATETIME,        -- Time when the file processing ended
    Status NVARCHAR(50),         -- e.g., 'Success', 'Failed'
    RecordsProcessed INT,        -- Number of rows processed from the file
    ErrorMessage NVARCHAR(MAX)   -- Error details, if any
);

CREATE TABLE dbo.ETL_ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorDateTime DATETIME DEFAULT GETDATE(),
    ProcessName NVARCHAR(255), -- e.g., 'LoadClaims'
    TaskName NVARCHAR(255),    -- Task or transformation name
    ColumnName NVARCHAR(255),  -- Column causing the error, if applicable
    RowData NVARCHAR(MAX),     -- Snapshot of the problematic row data
    ErrorMessage NVARCHAR(MAX) -- Detailed error message
);
