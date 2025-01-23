### Updated Logging Strategy Including the New Table: **ETL_ErrorLog**

---

# **Logging Strategy for Claims Data Analysis Project**

## **Overview**
The logging strategy for the **Claims Data Analysis** project ensures comprehensive monitoring, debugging, and auditing of the ETL process. This updated strategy focuses on database-centric logging, with a dedicated **ETL_ErrorLog** table for detailed error tracking.

---

## **Logging Framework**

### **1. File-Level Logging**
**Log Type:** SQL Server Table  
**Log Storage:** `dbo.ETL_FileTracking`  

#### **Purpose**
- Tracks the ingestion of data files into the staging tables.
- Provides a detailed audit trail for each data file processed.

#### **Details Logged**
| Column              | Description                                                   |
|---------------------|---------------------------------------------------------------|
| **FileName**        | The name of the data file ingested.                           |
| **FileSize**        | The size of the file in bytes.                                |
| **RecordsProcessed**| The number of rows successfully loaded from the file.         |
| **StartTime**       | The start time of the file ingestion process.                 |
| **EndTime**         | The end time of the file ingestion process.                   |
| **Status**          | Status of the ingestion (e.g., `Success`, `Failure`).         |
| **ErrorMessage**    | Any error encountered during ingestion.                       |

---

### **2. ETL-Level Logging**
**Log Type:** SQL Server Table  
**Log Storage:** `dbo.ETL_Log`  

#### **Purpose**
- Tracks high-level execution details of the ETL workflows and SSIS package tasks.
- Monitors the success or failure of each ETL process.

#### **Details Logged**
| Column              | Description                                                   |
|---------------------|---------------------------------------------------------------|
| **LogID**           | Unique identifier for the log entry.                          |
| **LogDateTime**     | Timestamp when the log entry was recorded.                    |
| **ProcessName**     | Name of the process being logged (e.g., `LoadClaims`, `TransformToFact`). |
| **Status**          | Execution status (e.g., `Success`, `Failure`).                |
| **RecordsProcessed**| Number of rows processed during the task.                     |
| **ErrorMessage**    | Detailed error messages for failed processes.                 |

---

### **3. Error-Specific Logging**
**Log Type:** SQL Server Table  
**Log Storage:** `dbo.ETL_ErrorLog`  

#### **Purpose**
- Tracks granular details of all errors encountered during the ETL process.
- Provides actionable insights for debugging and troubleshooting.

#### **Details Logged**
| Column              | Description                                                   |
|---------------------|---------------------------------------------------------------|
| **ErrorID**         | Unique identifier for the error entry.                        |
| **ErrorDateTime**   | Timestamp when the error occurred.                            |
| **ProcessName**     | Name of the process that encountered the error (e.g., `LoadClaims`). |
| **TaskName**        | Name of the SSIS task where the error occurred.               |
| **ColumnName**      | Name of the column that caused the error, if applicable.      |
| **RowData**         | Snapshot of the row data causing the error, if available.     |
| **ErrorMessage**    | Detailed error message describing the issue.                  |

#### **Use Case**
- Track row-level and column-level errors during file ingestion or transformations.
- Debug errors by identifying specific problem areas (e.g., invalid data in a column).

---

## **Workflow of Logging**

| Step                    | Log Type                      | Storage Location      | Purpose                                       |
|-------------------------|-------------------------------|-----------------------|-----------------------------------------------|
| **File Loading**        | SQL Table (`ETL_FileTracking`) | SQL Server           | Track metadata and row counts for data files. |
| **ETL Execution**       | SQL Table (`ETL_Log`)         | SQL Server           | Monitor the success/failure of ETL processes. |
| **Error Logging**       | SQL Table (`ETL_ErrorLog`)    | SQL Server           | Capture and track errors during ETL execution.|

---

## **SQL Scripts for Logging Tables**

### **1. ETL_Log Table**
```sql
CREATE TABLE dbo.ETL_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    LogDateTime DATETIME DEFAULT GETDATE(),
    ProcessName NVARCHAR(255), -- e.g., 'LoadClaims', 'TransformToFact'
    Status NVARCHAR(50),       -- e.g., 'Success', 'Failed'
    RecordsProcessed INT,      -- Number of rows affected
    ErrorMessage NVARCHAR(MAX) -- Detailed error message if any
);
```

---

### **2. ETL_FileTracking Table**
```sql
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
```

---

### **3. ETL_ErrorLog Table**
```sql
CREATE TABLE dbo.ETL_ErrorLog (
    ErrorID INT IDENTITY(1,1) PRIMARY KEY,
    ErrorDateTime DATETIME DEFAULT GETDATE(),
    ProcessName NVARCHAR(255), -- e.g., 'LoadClaims'
    TaskName NVARCHAR(255),    -- Task or transformation name
    ColumnName NVARCHAR(255),  -- Column causing the error, if applicable
    RowData NVARCHAR(MAX),     -- Snapshot of the problematic row data
    ErrorMessage NVARCHAR(MAX) -- Detailed error message
);
```

---

## **Best Practices**

1. **Centralize Logs in SQL Server**:
   - Manage all logs (`ETL_FileTracking`, `ETL_Log`, and `ETL_ErrorLog`) in SQL Server for easy querying and analysis.

2. **Leverage the Error Log**:
   - Use `ETL_ErrorLog` for granular insights into row-level and column-level errors.

3. **Automated Logging**:
   - Use SSIS event handlers (e.g., OnError) to populate the `ETL_ErrorLog` table for real-time error tracking.

4. **Archival Strategy**:
   - Periodically archive older log data to maintain system performance.

---

## **Future Enhancements**
- Integrate all logs into a centralized monitoring solution, such as **Azure Monitor** or **Elastic Stack**.
- Add alerting mechanisms for critical errors using email notifications or a logging framework like Serilog.
- Automate archival and cleanup processes for older logs.

--- 

This updated strategy ensures comprehensive tracking and debugging capabilities for all stages of the ETL process. The new **ETL_ErrorLog** table provides a robust mechanism for handling and analyzing errors, making the system more reliable and maintainable.