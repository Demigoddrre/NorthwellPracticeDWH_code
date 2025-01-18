---

# **Project 1: Claims Data Analysis**

## **Overview**
The **Claims Data Analysis** project is part of the NorthwellPracticeDWH initiative. This project aims to process and analyze healthcare claims data to generate insights such as trends, processing times, and denial rates. It involves creating a star schema-based data warehouse, loading raw data, transforming it, and building visualizations using Power BI. Additionally, this project is designed to integrate seamlessly with real-time systems in future iterations.

---

## **Updated Project Structure**
```
Project1_ClaimsDataAnalysis/
├── AdvancedTransformations/
│   ├── Connection.py                 # Python database connection configuration
│   ├── pandas_transformations.py     # Python script for advanced data transformations
├── CreateTables/
│   ├── DimensionTables.sql           # SQL scripts to create dimension tables
│   ├── FactTables.sql                # SQL scripts to create fact tables
│   ├── LoggingTables.sql             # SQL script to create logging tables
│   ├── StagingTables.sql             # SQL scripts to create staging tables
├── Documentation/
│   ├── Readme.md                     # This file
│   ├── WorkflowDiagram.png           # ETL workflow diagram
│   ├── LoggingStrategy.md            # Details on the logging implementation
├── Logs/
│   ├── Python/
│   │   ├── pandas_transformations.log # Logs Python transformation processes
│   │   ├── database_connection.log    # Logs database connection details
│   ├── SSIS/
│       ├── ClaimsETLLog.log          # Logs high-level SSIS package execution details
├── PopulateData/
│   ├── SampleCSV/
│   │   ├── Claims.csv                # Sample claims data
│   │   ├── ClaimStatus.csv           # Sample claim status data
│   ├── LoadClaims.sql                # SQL script to load initial claims data
├── Transformation/
│   ├── TransformToFactAndDim.sql     # SQL script for data transformation
│   ├── StoredProcedures.sql          # SQL stored procedures for reusable transformations
│   ├── Views.sql                     # SQL scripts for creating views
├── Visualizations/
│   ├── PowerBI.pbix                  # Power BI dashboards for insights
```

---

## **Integration with Real-Time Systems**
Although this project focuses on batch processing claims data, it is designed to integrate with a real-time system for advanced data ingestion and analysis. Key points of integration include:
- **Non-Fraudulent Claims Data**: Extract clean, non-fraudulent claims from the real-time system's **Delta Lake**.
- **Archival Storage**: Periodically archive processed data into the data warehouse for long-term storage and historical reporting.
- **Fraudulent Claims**: Retain flagged claims in Delta Lake for auditing and retraining machine learning models.
- **Shared Strategy**: While integration with the real-time system will primarily occur in a separate project directory, this project establishes the foundation for future seamless integration.

---

## **Logging Strategy**

### **SQL Logging: ETL_Log and ETL_FileTracking**
- **ETL_Log Table**:
  - Logs high-level ETL processes (e.g., loading, transforming, and extracting data).
  - Captures process name, status, row counts, and error details for debugging.
- **ETL_FileTracking Table**:
  - Tracks the ingestion of source files into staging tables.
  - Captures metadata such as file names, row counts, and timestamps for audit purposes.

### **Python Logging**
- Logs detailed execution of Python-based transformations and database interactions.
- **Key Log Files**:
  - `pandas_transformations.log`: Logs row counts, merging, filtering, and transformation steps.
  - `database_connection.log`: Tracks successes and failures in database connections.

### **SSIS Logging**
- Logs high-level execution of SSIS packages and Data Flow tasks.
- **Key Log File**:
  - `ClaimsETLLog.log`: Tracks package success or failure, row counts, and error messages.

---

## **ETL Workflow**

### **1. Data Preparation**
- **Staging Tables**: Load raw claims data into `Stg_Claims`, `Stg_Payers`, `Stg_ClaimStatus`, and `Stg_Patients`.
- **Logging**: 
  - Use the `ETL_FileTracking` table to log file ingestion details.

### **2. Data Transformation**
- **Transform to Star Schema**: Process data from staging tables into `FactClaims`, `DimPayers`, and `DimClaimStatus`.
- **Logging**:
  - Use the `ETL_Log` table to track transformation success, row counts, and any errors.

### **3. Reporting and Visualization**
- **SQL Views**: Simplify querying with pre-defined views in `Views.sql`.
- **Power BI Dashboards**: Visualize KPIs such as denial rates and processing trends using `PowerBI.pbix`.

### **4. Real-Time Integration (Planned)**
- **Data Extraction**: Periodically extract non-fraudulent claims data from the real-time system.
- **Archival and Retention**:
  - Archive clean claims data into the DWH for historical reporting.
  - Retain flagged claims in the real-time system for analysis and machine learning retraining.
- **Unified Reporting**: Generate comprehensive reports by combining batch and real-time data.

---

## **How to Use**

### **1. Prerequisites**
- Set up the `NorthwellPracticeDWH` database by running `CreateDatabase.sql` and the scripts in `CreateTables/`.
- Configure Python and SQL Server connections.

### **2. Execution Steps**
1. **Data Ingestion**:
   - Use `LoadClaims.sql` or the `LoadClaims.dtsx` SSIS package to load raw data into staging tables.
2. **Data Transformation**:
   - Run `TransformToFactAndDim.sql` or the `TransformClaims.dtsx` SSIS package.
3. **Data Logging**:
   - Review `ETL_Log` and `ETL_FileTracking` for process statuses and file metadata.
4. **Visualization**:
   - Use Power BI to generate insights using `PowerBI.pbix`.

---

## **Future Enhancements**
- Implement incremental data loading for improved processing efficiency.
- Automate email notifications for ETL success or failure alerts.
- Integrate centralized monitoring solutions like Azure Monitor for enhanced tracking.
- Develop machine learning pipelines for fraud detection and predictions.

---
