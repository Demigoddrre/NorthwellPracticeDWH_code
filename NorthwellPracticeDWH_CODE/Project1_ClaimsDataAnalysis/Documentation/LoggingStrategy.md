---

# **Logging Strategy for Claims Data Analysis Project**

## **Overview**
The logging strategy for the **Claims Data Analysis** project is designed to ensure seamless monitoring, debugging, and auditing of the ETL process. It incorporates multiple logging mechanisms to track both the granular details of file ingestion and the high-level execution of the SSIS ETL workflow.

---

## **Logging Framework**

### **1. File-Level Logging**
**Log Type:** SQL Server Table  
**Log Storage:** `dbo.ETL_FileTracking` (Database Table)  

#### **Purpose**
- Tracks the ingestion of data files into the staging tables.
- Provides a detailed audit trail of all data files processed by the ETL system.

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

#### **Use Case**
- Identify missing or corrupted data files.
- Track row counts to ensure data completeness.

#### **Example**
If a file fails to load, the `ErrorMessage` column in the `ETL_FileTracking` table provides insights into the issue.

---

### **2. Package-Level Logging**
**Log Type:** File-Based Log  
**Log Storage:** `Logs/SSIS/ClaimsETLLog.log` (Stored in your VS Code project directory)  

#### **Purpose**
- Monitors the overall execution of the SSIS package.
- Provides high-level visibility into the ETL workflow.

#### **Details Logged**
| Log Component       | Description                                                   |
|---------------------|---------------------------------------------------------------|
| **Execution Start** | Records the start time of the SSIS package execution.         |
| **Execution End**   | Records the end time of the package execution.                |
| **Task Names**      | Logs each task executed within the SSIS package.              |
| **Row Counts**      | Logs the number of rows processed by each data flow task.      |
| **Status**          | Status of the SSIS package (e.g., `Success`, `Failure`).      |
| **Errors**          | Details of any errors encountered during execution.           |

#### **Use Case**
- Debug package failures by identifying which control flow or data flow task caused the error.
- Track overall ETL performance and execution times.

#### **Example**
If the SSIS package fails during the "Data Flow Task," the ClaimsETLLog.log will detail the failure point and provide error messages for debugging.

---

### **3. Python Transformation Logging**
**Log Type:** File-Based Log  
**Log Storage:**  
- `Logs/Python/pandas_transformations.log`  
- `Logs/Python/database_connection.log`  

#### **Purpose**
- Logs data transformations and database interactions executed via Python scripts.

#### **Details Logged**
| Log Component                  | Description                                         |
|--------------------------------|-----------------------------------------------------|
| **Data Merging/Filtering**     | Logs details of merging and filtering operations.   |
| **Row Counts**                 | Logs row counts for transformations and outputs.    |
| **Missing Value Handling**     | Logs steps to handle missing values.                |
| **Database Connection Status** | Logs successful or failed connections to the DWH.   |

#### **Use Case**
- Debug Python scripts used for data transformation and validation.
- Ensure reliable and secure database connectivity.

#### **Example**
If the Python script fails to merge datasets, the `pandas_transformations.log` will capture details of the error.

---

## **Workflow of Logging**

### **1. Data Ingestion (File Tracking)**
- **Location:** `dbo.ETL_FileTracking` (SQL Server Table)  
- **Purpose:** Track the ingestion of CSV data files into staging tables.  
- **Logged Metadata:** File name, size, row counts, ingestion start/end times, and status.

### **2. SSIS Package Execution**
- **Location:** `Logs/SSIS/ClaimsETLLog.log`  
- **Purpose:** Monitor the execution of the ETL package, including task success/failure, row counts processed, and overall package status.

### **3. Python Transformations**
- **Locations:**
  - `Logs/Python/pandas_transformations.log`: Logs transformations (e.g., merging, filtering, handling nulls).
  - `Logs/Python/database_connection.log`: Logs database connection statuses and errors.  
- **Purpose:** Track Python-based transformations and database interactions for fine-grained debugging.

---

## **Integration of Logs**

| Step                    | Log Type                     | Storage Location                               | Purpose                                       |
|-------------------------|------------------------------|-----------------------------------------------|-----------------------------------------------|
| **File Loading**        | SQL Table (`ETL_FileTracking`) | SQL Server                                    | Track metadata and row counts for data files. |
| **ETL Execution**       | File Log (`ClaimsETLLog.log`) | VS Code Directory: `Logs/SSIS`               | Monitor the SSIS package execution.           |
| **Transformations**     | File Log (`pandas_transformations.log`) | VS Code Directory: `Logs/Python`             | Debug data transformations in Python.         |
| **Database Connection** | File Log (`database_connection.log`) | VS Code Directory: `Logs/Python`             | Ensure reliable connections to the database.  |

---

## **Best Practices**
1. **Keep Logs Modular**:
   - Ensure each log type focuses on a specific layer (e.g., file-level, package-level, transformation-level) to avoid redundancy.

2. **Centralize Key Logs**:
   - Use the SQL-based `ETL_FileTracking` table as the source of truth for file ingestion history.

3. **Archive Older Logs**:
   - Periodically archive or purge old log files to manage storage and maintain performance.

4. **Monitor Logs Regularly**:
   - Check the ClaimsETLLog.log after each package execution for potential errors.
   - Validate row counts in the ETL_FileTracking table to ensure data completeness.

---

## **Future Enhancements**
- Centralize all logs using a monitoring tool like **Azure Monitor** or **ELK Stack**.
- Automate log archival and rotation processes.
- Add custom error codes for faster debugging.

---

