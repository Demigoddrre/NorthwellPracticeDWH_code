# **Project 1: Claims Data Analysis**

## **Overview**
The **Claims Data Analysis** project is part of the NorthwellPracticeDWH initiative. This project aims to process and analyze healthcare claims data to generate insights such as trends, processing times, and denial rates. It involves creating a star schema-based data warehouse, loading raw data, transforming it, and building visualizations using Power BI.

---

## **Project Structure**
Below is the folder structure and its purpose:

```
Project1_ClaimsDataAnalysis/
├── CreateTables/
│   ├── StagingTables.sql         # SQL scripts to create staging tables
│   ├── FactTables.sql            # SQL scripts to create fact tables
│   ├── DimensionTables.sql       # SQL scripts to create dimension tables
├── PopulateData/
│   ├── LoadClaims.sql            # SQL script to load initial claims data
├── Transformation/
│   ├── TransformToFactAndDim.sql # SQL script for data transformation
│   ├── Views.sql                 # SQL scripts for creating views
│   ├── StoredProcedures.sql      # SQL stored procedures for transformations
├── AdvancedTransformations/
│   ├── pandas_transformations.py # Python script for advanced data transformations
│   ├── Connection.py             # Python database connection configuration
├── Logs/
│   ├── Python/
│   │   ├── pandas_transformations.log  # Logs Python transformation processes
│   │   ├── database_connection.log     # Logs database connection details
├── Visualizations/
│   ├── PowerBI.pbix              # Power BI dashboards for insights
├── Documentation/
│   ├── Readme.md                 # This file
│   ├── WorkflowDiagram.png       # ETL workflow diagram
```

The SSIS packages for automating ETL processes are located in the `NorthwellPracticeDWH_SSIS` project directory:

```
NorthwellPracticeDWH_SSIS/
├── Project1_ClaimsDataAnalysis/
│   ├── Packages/
│       ├── LoadClaims.dtsx       # SSIS package for claims data ingestion
│       ├── TransformClaims.dtsx  # SSIS package for transformations
│       ├── LoadToFactDim.dtsx    # Final loading into fact/dim tables
│   ├── Connections/
│       ├── ClaimsDatabase.dtsConfig  # Connection config for staging/fact tables
│       ├── ClaimsFlatFile.dtsConfig  # Connection config for flat files
│   ├── Logs/
│       ├── ClaimsETLLog.log      # SSIS package execution logs
```

---

## **Logging Strategy**
This project incorporates logging to monitor, debug, and maintain ETL workflows. The logging components are as follows:

### **SQL Logging: ETL_Log Table**
A centralized log table in the database tracks the execution of ETL processes:
- **What It Logs**:
  - `ProcessName`: Name of the ETL task (e.g., LoadClaims, TransformToFact).
  - `Status`: Success, failure, or in-progress.
  - `RecordsProcessed`: Number of rows affected.
  - `ErrorMessage`: Details on any error encountered.
- **Purpose**:
  - Tracks overall ETL pipeline health and data movement.
  - Provides an auditable record of all ETL executions.
  - Facilitates debugging and performance analysis.

### **Python Logging**
Python scripts log transformations and database interactions:
- **What It Logs**:
  - `pandas_transformations.log`: Logs data transformation processes, including merging, filtering, and saving output.
  - `database_connection.log`: Logs database connection successes, failures, and errors.
- **Purpose**:
  - Provides fine-grained visibility into Python-based transformations.
  - Ensures reliable and secure database connectivity.
  - Captures issues in real-time transformations.

### **SSIS Logging**
SSIS packages log execution metadata:
- **What It Logs**:
  - Start and end times of SSIS packages.
  - Row counts processed in each Data Flow task.
  - Errors encountered during execution.
  - Logs are stored in `ClaimsETLLog.log`.
- **Purpose**:
  - Tracks the performance and health of SSIS workflows.
  - Identifies control flow or data flow errors.

---

## **Project Workflow**
The project is divided into the following phases:

### **1. Database Setup**
- Create the `NorthwellPracticeDWH` database.
- Execute the scripts in `CreateTables/` to create staging, fact, and dimension tables:
  1. Run `StagingTables.sql` to create staging tables.
  2. Run `DimensionTables.sql` to create dimension tables.
  3. Run `FactTables.sql` to create fact tables.

### **2. Data Loading**
- Use the scripts in `PopulateData/` to load raw data into staging tables:
  - **Initial Load**: Execute `LoadClaims.sql` to insert sample claims data into staging tables.
  - **Automated Load**: Use the SSIS package `LoadClaims.dtsx` to automate data ingestion from CSV files.

### **3. Data Transformation**
- Transform data from staging tables to fact and dimension tables:
  - Execute `TransformToFactAndDim.sql` for data cleansing and transformation.
  - Use stored procedures in `StoredProcedures.sql` for reusable transformations.
  - Log transformations in `ETL_Log` for monitoring and debugging.

### **4. Integration with Real-Time System**
- Extract clean, non-fraudulent claims data from the real-time system’s **Delta Lake**.
- Archive processed data into the DWH for long-term storage and historical reporting.
- Retain fraudulent claims in Delta Lake for auditing and future machine learning model retraining.
- Log data extraction and integration events in `ETL_Log`.

### **5. Reporting and Visualization**
- Create views for simplified querying using `Views.sql`.
- Use Power BI to connect to the data warehouse and build dashboards:
  - Open `Visualizations/PowerBI.pbix` to view trends and KPIs (e.g., denial rates, processing time).

---

## **Key Outputs**
- **KPI Examples**:
  - Denial rates by payer and status.
  - Average processing time by claim status.
  - Monthly trends in claims submissions and approvals.
  - Unified insights combining real-time and historical data.

---

## **How to Run**
1. **Step 1: Set Up the Database**
   - Run `CreateDatabase.sql` (in `Shared/CommonScripts/`) to create the main database.
   - Run the table creation scripts in the `CreateTables/` folder.

2. **Step 2: Load Data**
   - Use `LoadClaims.sql` or the SSIS package to populate staging tables.
   - Confirm execution logs in the `ETL_Log` table and `ClaimsETLLog.log`.

3. **Step 3: Transform Data**
   - Execute the transformation script in `Transformation/TransformToFactAndDim.sql`.
   - Verify Python logs for successful transformation.

4. **Step 4: Extract Real-Time Data**
   - Periodically extract non-fraudulent data from Delta Lake in the real-time system.
   - Archive the extracted data in the DWH for long-term storage.

5. **Step 5: Analyze and Visualize**
   - Build Power BI dashboards using `Visualizations/PowerBI.pbix`.

---

## **Documentation**
- **Workflow Diagram**: Refer to `Documentation/WorkflowDiagram.png` for a visual representation of the ETL workflow.
- **Data Sources**:
  - `Claims.csv`: Sample claims data.
  - `ClaimStatus.csv`: Sample claim status data.
  - Real-time system integration with Delta Lake for clean claims data.

---

## **Future Enhancements**
- Automate incremental data ingestion via SSIS.
- Add advanced analytics in Python for KPI forecasting.
- Enhance logging by integrating with a centralized monitoring solution like Azure Monitor.
- Improve real-time system integration for seamless data extraction and reporting.

---

